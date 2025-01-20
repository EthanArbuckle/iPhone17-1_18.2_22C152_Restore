@interface SXQuickLookEventHandler
- (SXQuickLookEventHandler)initWithInteractor:(id)a3 router:(id)a4;
- (SXQuickLookEventHandlerDelegate)delegate;
- (SXQuickLookInteractor)interactor;
- (SXQuickLookRouter)router;
- (void)didLoadThumbnail:(id)a3;
- (void)didTapThumbnailView:(id)a3;
- (void)failedToLoadThumbnail;
- (void)requestThumbnailWithSize:(CGSize)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SXQuickLookEventHandler

- (SXQuickLookEventHandler)initWithInteractor:(id)a3 router:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXQuickLookEventHandler;
  v9 = [(SXQuickLookEventHandler *)&v12 init];
  v10 = v9;
  if (v7)
  {
    objc_storeStrong((id *)&v9->_interactor, a3);
    objc_storeStrong((id *)&v10->_router, a4);
  }

  return v10;
}

- (void)requestThumbnailWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(SXQuickLookEventHandler *)self interactor];
  objc_msgSend(v5, "loadThumbnailWithSize:", width, height);
}

- (void)didTapThumbnailView:(id)a3
{
  id v4 = a3;
  id v8 = [[SXQuickLookTransitionContext alloc] initWithOriginView:v4];

  id v5 = [(SXQuickLookEventHandler *)self router];
  v6 = [(SXQuickLookEventHandler *)self interactor];
  id v7 = [v6 file];
  [v5 presentFile:v7 transitionContext:v8];
}

- (void)didLoadThumbnail:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SXQuickLookEventHandler_didLoadThumbnail___block_invoke;
  v6[3] = &unk_264651158;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __44__SXQuickLookEventHandler_didLoadThumbnail___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 showThumbnailImage:*(void *)(a1 + 40)];
}

- (void)failedToLoadThumbnail
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SXQuickLookEventHandler_failedToLoadThumbnail__block_invoke;
  block[3] = &unk_2646511F8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __48__SXQuickLookEventHandler_failedToLoadThumbnail__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  v1 = SXBundle();
  id v2 = [v1 localizedStringForKey:@"Failed to load thumbnail" value:&stru_26D5311C0 table:0];
  [v3 showThumbnailErrorWithMessage:v2];
}

- (SXQuickLookEventHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (SXQuickLookEventHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SXQuickLookInteractor)interactor
{
  return self->_interactor;
}

- (SXQuickLookRouter)router
{
  return self->_router;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_router, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end