@interface SXQuickLookInteractor
- (SXQuickLookFile)file;
- (SXQuickLookInteractor)initWithFile:(id)a3 service:(id)a4;
- (SXQuickLookInteractorDelegate)delegate;
- (SXQuickLookService)service;
- (void)loadThumbnailWithSize:(CGSize)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SXQuickLookInteractor

- (SXQuickLookInteractor)initWithFile:(id)a3 service:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXQuickLookInteractor;
  v9 = [(SXQuickLookInteractor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_file, a3);
    objc_storeStrong((id *)&v10->_service, a4);
  }

  return v10;
}

- (void)loadThumbnailWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_initWeak(&location, self);
  v6 = [(SXQuickLookInteractor *)self service];
  id v7 = [(SXQuickLookInteractor *)self file];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__SXQuickLookInteractor_loadThumbnailWithSize___block_invoke;
  v10[3] = &unk_264654438;
  objc_copyWeak(&v11, &location);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__SXQuickLookInteractor_loadThumbnailWithSize___block_invoke_2;
  v8[3] = &unk_264652AA0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v6, "fetchThumbnailForFile:size:onCompletion:onError:", v7, v10, v8, width, height);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __47__SXQuickLookInteractor_loadThumbnailWithSize___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [WeakRetained delegate];
  [v4 didLoadThumbnail:v3];
}

void __47__SXQuickLookInteractor_loadThumbnailWithSize___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 failedToLoadThumbnail];
}

- (SXQuickLookInteractorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (SXQuickLookInteractorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SXQuickLookFile)file
{
  return self->_file;
}

- (SXQuickLookService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end