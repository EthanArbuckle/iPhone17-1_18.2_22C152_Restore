@interface SKUIClientContextPreviewContainer
- (SKUIClientContextPreviewContainer)initWithAppContext:(id)a3 clientContext:(id)a4 previewContainerViewController:(id)a5;
- (void)previewDocument:(id)a3 :(id)a4;
@end

@implementation SKUIClientContextPreviewContainer

- (SKUIClientContextPreviewContainer)initWithAppContext:(id)a3 clientContext:(id)a4 previewContainerViewController:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SKUIClientContextPreviewContainer;
  v10 = [(IKJSObject *)&v13 initWithAppContext:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_clientContext, v8);
    objc_storeStrong((id *)&v11->_previewContainerViewController, a5);
  }

  return v11;
}

- (void)previewDocument:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && self->_previewContainerViewController)
  {
    id v8 = [(IKJSObject *)self appContext];
    if ([MEMORY[0x1E4F6F010] instancesRespondToSelector:sel_initWithAppContext_document_owner_])id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F010]), "initWithAppContext:document:owner:", v8, v6, self); {
    else
    }
      id v9 = 0;
    v10 = [(IKJSObject *)self appContext];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__SKUIClientContextPreviewContainer_previewDocument::__block_invoke;
    v12[3] = &unk_1E6426950;
    v12[4] = self;
    id v13 = v9;
    id v14 = v7;
    id v11 = v9;
    [v10 evaluateDelegateBlockSync:v12];
  }
}

void __54__SKUIClientContextPreviewContainer_previewDocument::__block_invoke(void *a1)
{
  if (*(void *)(a1[4] + 32))
  {
    v2 = [SKUIDocumentContainerViewController alloc];
    uint64_t v4 = a1[5];
    uint64_t v3 = a1[6];
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
    id v6 = [(SKUIDocumentContainerViewController *)v2 initWithDocument:v4 options:v3 clientContext:WeakRetained];

    [*(id *)(a1[4] + 32) setChildViewController:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewContainerViewController, 0);

  objc_destroyWeak((id *)&self->_clientContext);
}

@end