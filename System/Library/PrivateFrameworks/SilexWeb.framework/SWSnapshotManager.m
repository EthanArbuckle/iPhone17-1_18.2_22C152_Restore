@interface SWSnapshotManager
- (SWConfigurationManager)configurationManager;
- (SWSnapshotManager)initWithWebView:(id)a3 configurationManager:(id)a4;
- (WKWebView)webView;
- (void)takeSnapshotWithCompletionHandler:(id)a3;
@end

@implementation SWSnapshotManager

- (SWSnapshotManager)initWithWebView:(id)a3 configurationManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SWSnapshotManager;
  v9 = [(SWSnapshotManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webView, a3);
    objc_storeStrong((id *)&v10->_configurationManager, a4);
  }

  return v10;
}

- (void)takeSnapshotWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SWSnapshotManager *)self configurationManager];
  v6 = [v5 configuration];

  if (v6)
  {
    id v7 = (objc_class *)MEMORY[0x263F1FA30];
    id v8 = v6;
    id v9 = objc_alloc_init(v7);
    [v8 contentFrame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    objc_msgSend(v9, "setRect:", v11, v13, v15, v17);
    [v9 setAfterScreenUpdates:0];
    v18 = [(SWSnapshotManager *)self webView];
    [v18 takeSnapshotWithConfiguration:v9 completionHandler:v4];
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __55__SWSnapshotManager_takeSnapshotWithCompletionHandler___block_invoke;
    v19[3] = &unk_2646FFAE8;
    id v20 = v4;
    __55__SWSnapshotManager_takeSnapshotWithCompletionHandler___block_invoke((uint64_t)v19);
  }
}

void __55__SWSnapshotManager_takeSnapshotWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"web_content" code:4 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (SWConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end