@interface SUUIGiftStepViewController
- (NSOperationQueue)operationQueue;
- (SUUIGift)gift;
- (SUUIGiftConfiguration)giftConfiguration;
- (SUUIGiftStepViewController)initWithGift:(id)a3 configuration:(id)a4;
- (void)_finishImageLoadWithImage:(id)a3 error:(id)a4 block:(id)a5;
- (void)finishGiftingWithResult:(BOOL)a3;
- (void)loadItemArtworkWithArtworkContext:(id)a3 completionBlock:(id)a4;
- (void)setOperationQueue:(id)a3;
@end

@implementation SUUIGiftStepViewController

- (SUUIGiftStepViewController)initWithGift:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIGiftStepViewController;
  v8 = [(SUUIGiftStepViewController *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    gift = v8->_gift;
    v8->_gift = (SUUIGift *)v9;

    objc_storeStrong((id *)&v8->_giftConfiguration, a4);
  }

  return v8;
}

- (void)finishGiftingWithResult:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUUIGiftStepViewController *)self navigationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 giftDelegate];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v9 = (id)v6;
  if (objc_opt_respondsToSelector())
  {
    [v9 giftViewController:v5 didFinishWithResult:v3];
  }
  else
  {
    id v7 = [(SUUIGiftStepViewController *)self parentViewController];
    v8 = v7;
    if (!v7) {
      id v7 = self;
    }
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
}

- (SUUIGift)gift
{
  return self->_gift;
}

- (void)loadItemArtworkWithArtworkContext:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SUUIGift *)self->_gift item];
  if (v8 && !self->_loadOperation)
  {
    id v9 = [v6 URLForItem:v8];
    if (v9)
    {
      v10 = (SSVLoadURLOperation *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURL:v9];
      loadOperation = self->_loadOperation;
      self->_loadOperation = v10;

      objc_super v12 = self->_loadOperation;
      v13 = [v6 dataConsumerForItem:v8];
      [(SSVLoadURLOperation *)v12 setDataConsumer:v13];

      [(SSVLoadURLOperation *)self->_loadOperation setITunesStoreRequest:0];
      objc_initWeak(&location, self);
      v14 = self->_loadOperation;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __80__SUUIGiftStepViewController_loadItemArtworkWithArtworkContext_completionBlock___block_invoke;
      v16[3] = &unk_265406C20;
      objc_copyWeak(&v18, &location);
      id v17 = v7;
      [(SSVLoadURLOperation *)v14 setOutputBlock:v16];
      v15 = [(SUUIGiftStepViewController *)self operationQueue];
      [v15 addOperation:self->_loadOperation];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

void __80__SUUIGiftStepViewController_loadItemArtworkWithArtworkContext_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__SUUIGiftStepViewController_loadItemArtworkWithArtworkContext_completionBlock___block_invoke_2;
  v9[3] = &unk_265402180;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(&v13);
}

void __80__SUUIGiftStepViewController_loadItemArtworkWithArtworkContext_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _finishImageLoadWithImage:*(void *)(a1 + 32) error:*(void *)(a1 + 40) block:*(void *)(a1 + 48)];
}

- (void)_finishImageLoadWithImage:(id)a3 error:(id)a4 block:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id, id))a5;
  [(SSVLoadURLOperation *)self->_loadOperation setOutputBlock:0];
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

  if (v9) {
    v9[2](v9, v11, v8);
  }
}

- (SUUIGiftConfiguration)giftConfiguration
{
  return self->_giftConfiguration;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_giftConfiguration, 0);
  objc_storeStrong((id *)&self->_gift, 0);
}

@end