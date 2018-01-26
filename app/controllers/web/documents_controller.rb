module Web
  class DocumentsController < ModuleController
    before_action :set_document, only: [:show, :edit, :update, :destroy]
    before_action :set_customer

    # GET /documents
    def index
      @documents = @customer.documents
    end

    # GET /documents/1
    def show
    end

    # GET /documents/new
    def new
      @customer.documents.build
    end

    # GET /documents/1/edit
    def edit
    end

    # POST /documents
    def create
      if @customer.update(document_params)
        redirect_to customers_path, notice: 'Documents was succesfully updated'
      else
        render :new
      end
    end

    # PATCH/PUT /documents/1
    def update
      if @customer.update(document_params)
        redirect_to @document, notice: 'Document was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /documents/1
    def destroy
      @document.destroy
      redirect_to documents_url, notice: 'Document was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_document
        @document = Document.find(params[:id])
      end

      def set_customer
        @customer = Customer.find(params[:id])
      end
      # Only allow a trusted parameter "white list" through.
      def document_params
        params.require(:customer).permit(documents_attributes: [:id, :upload, :customer_id, :doc_number, :doc_type, :doc_expire, :_destroy])
      end
  end
end
