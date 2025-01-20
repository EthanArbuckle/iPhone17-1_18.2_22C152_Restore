@interface SKUIPreviewDocumentController
- (BOOL)isPreviewActive;
- (SKUIClientContext)clientContext;
- (SKUIPreviewDocumentController)initWithDocument:(id)a3;
- (id)_operationQueue;
- (id)overlayViewControllerWithBackgroundStyle:(int64_t)a3;
- (void)_audioPlayerStatusChangeNotification:(id)a3;
- (void)_connectToAudioPlayer;
- (void)_playerSessionsDidChangeNotification:(id)a3;
- (void)_reloadViewControllersWithPreviewStatus:(id)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)documentDidUpdate:(id)a3;
- (void)setClientContext:(id)a3;
@end

@implementation SKUIPreviewDocumentController

- (SKUIPreviewDocumentController)initWithDocument:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPreviewDocumentController initWithDocument:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIPreviewDocumentController;
  v6 = [(SKUIPreviewDocumentController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_document, a3);
    [(IKAppDocument *)v7->_document setDelegate:v7];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__playerSessionsDidChangeNotification_ name:*MEMORY[0x1E4FB8918] object:0];
    [(SKUIPreviewDocumentController *)v7 _connectToAudioPlayer];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB8918] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB8920] object:0];
  [(IKAppDocument *)self->_document setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)SKUIPreviewDocumentController;
  [(SKUIPreviewDocumentController *)&v4 dealloc];
}

- (BOOL)isPreviewActive
{
  return self->_audioPlayer != 0;
}

- (void)documentDidUpdate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_viewControllers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "documentDidUpdate:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)overlayViewControllerWithBackgroundStyle:(int64_t)a3
{
  id v5 = [[SKUIPreviewOverlayViewController alloc] initWithDocument:self->_document];
  [(SKUIPreviewOverlayViewController *)v5 setBackgroundStyle:a3];
  [(SKUIViewController *)v5 setClientContext:self->_clientContext];
  uint64_t v6 = [(SKUIPreviewDocumentController *)self _operationQueue];
  [(SKUIViewController *)v5 setOperationQueue:v6];

  [(SKUIPreviewOverlayViewController *)v5 prepareOverlayView];
  uint64_t v7 = [(SUAudioPlayer *)self->_audioPlayer playerStatus];
  [(SKUIPreviewOverlayViewController *)v5 showPreviewProgressWithStatus:v7 animated:0];

  viewControllers = self->_viewControllers;
  if (!viewControllers)
  {
    uint64_t v9 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    long long v10 = self->_viewControllers;
    self->_viewControllers = v9;

    viewControllers = self->_viewControllers;
  }
  [(NSHashTable *)viewControllers addObject:v5];

  return v5;
}

- (void)_audioPlayerStatusChangeNotification:(id)a3
{
  id v4 = [a3 object];
  audioPlayer = self->_audioPlayer;

  if (v4 == audioPlayer)
  {
    id v6 = [(SUAudioPlayer *)self->_audioPlayer playerStatus];
    [(SKUIPreviewDocumentController *)self _reloadViewControllersWithPreviewStatus:v6 animated:1];
  }
}

- (void)_playerSessionsDidChangeNotification:(id)a3
{
  BOOL v4 = [(SKUIPreviewDocumentController *)self isPreviewActive];
  [(SKUIPreviewDocumentController *)self _connectToAudioPlayer];
  if (v4 != [(SKUIPreviewDocumentController *)self isPreviewActive])
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"SKUIPreviewDocumentIsActiveDidChangeNotification" object:self userInfo:0];
  }
}

- (void)_connectToAudioPlayer
{
  v3 = [(IKAppDocument *)self->_document templateElement];
  BOOL v4 = [v3 previewURLString];
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v4];
    uint64_t v7 = [MEMORY[0x1E4FB8890] sessionManager];
    obja = [v7 audioPlayerForURL:v6];

    BOOL v4 = obja;
  }
  p_audioPlayer = &self->_audioPlayer;
  obj = v4;
  if (v4 != self->_audioPlayer)
  {
    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v10 = v9;
    long long v11 = (void *)MEMORY[0x1E4FB8920];
    if (*p_audioPlayer) {
      objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x1E4FB8920]);
    }
    objc_storeStrong((id *)&self->_audioPlayer, obj);
    if (*p_audioPlayer)
    {
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__audioPlayerStatusChangeNotification_, *v11);
      audioPlayer = self->_audioPlayer;
    }
    else
    {
      audioPlayer = 0;
    }
    long long v13 = [(SUAudioPlayer *)audioPlayer playerStatus];
    [(SKUIPreviewDocumentController *)self _reloadViewControllersWithPreviewStatus:v13 animated:0];
  }
}

- (id)_operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    BOOL v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v5 = self->_operationQueue;
    self->_operationQueue = v4;

    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:2];
    id v6 = self->_operationQueue;
    uint64_t v7 = [NSString stringWithFormat:@"com.apple.StoreKitUI.%@.%p", objc_opt_class(), self];
    [(NSOperationQueue *)v6 setName:v7];

    operationQueue = self->_operationQueue;
  }

  return operationQueue;
}

- (void)_reloadViewControllersWithPreviewStatus:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_viewControllers;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "showPreviewProgressWithStatus:animated:", v6, v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);

  objc_storeStrong((id *)&self->_audioPlayer, 0);
}

- (void)initWithDocument:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPreviewDocumentController initWithDocument:]";
}

@end