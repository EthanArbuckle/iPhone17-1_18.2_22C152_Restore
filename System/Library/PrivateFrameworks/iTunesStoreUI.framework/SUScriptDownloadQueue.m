@interface SUScriptDownloadQueue
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSArray)downloads;
- (NSString)queueType;
- (SUScriptDownloadQueue)initWithQueueType:(id)a3 clientInterface:(id)a4;
- (id)_className;
- (id)scriptAttributeKeys;
- (void)_setupManagersWithClientInterface:(id)a3 queueType:(id)a4;
- (void)_tearDownQueues;
- (void)checkQueue;
- (void)dealloc;
- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4;
- (void)downloadManagerDownloadsDidChange:(id)a3;
- (void)finalizeForWebScript;
- (void)preorderManagerPreordersDidChange:(id)a3;
@end

@implementation SUScriptDownloadQueue

- (SUScriptDownloadQueue)initWithQueueType:(id)a3 clientInterface:(id)a4
{
  v6 = [(SUScriptObject *)self init];
  if (v6)
  {
    v6->_clientInterface = (SUClientInterface *)a4;
    v6->_queueType = (NSString *)[a3 copy];
    v7 = dispatch_queue_create("com.apple.iTunesStoreUI.SUScriptDownloadQueue", 0);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__SUScriptDownloadQueue_initWithQueueType_clientInterface___block_invoke;
    v9[3] = &unk_264812F30;
    v9[4] = v6;
    v9[5] = a4;
    v9[6] = a3;
    v9[7] = v7;
    dispatch_async(v7, v9);
  }
  return v6;
}

void __59__SUScriptDownloadQueue_initWithQueueType_clientInterface___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupManagersWithClientInterface:*(void *)(a1 + 40) queueType:*(void *)(a1 + 48)];
  v2 = *(NSObject **)(a1 + 56);

  dispatch_release(v2);
}

- (void)dealloc
{
  [(SUScriptDownloadQueue *)self _tearDownQueues];

  v3.receiver = self;
  v3.super_class = (Class)SUScriptDownloadQueue;
  [(SUScriptObject *)&v3 dealloc];
}

- (void)checkQueue
{
}

void __35__SUScriptDownloadQueue_checkQueue__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) lock];
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 80) downloadManager];
  id v3 = *(id *)(*(void *)(a1 + 32) + 88);
  [*(id *)(a1 + 32) unlock];
  [v2 reloadFromServer];
  [v3 reloadFromServer];
}

- (id)_className
{
  return @"iTunesDownloadQueue";
}

- (NSArray)downloads
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = (NSArray *)[MEMORY[0x263EFF980] array];
  [(SUScriptObject *)self lock];
  v4 = [(SUDownloadManager *)self->_downloadManager downloads];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [[SUScriptDownload alloc] initWithISUDownload:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        [(NSArray *)v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  [(SUScriptObject *)self unlock];
  return v3;
}

- (NSString)queueType
{
  id v2 = self->_queueType;

  return v2;
}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a4);
        }
        v10 = [[SUScriptDownload alloc] initWithSSDownload:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
        [(SUScriptObject *)self dispatchEvent:v10 forName:@"downloadstatechange"];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
  [(SUScriptObject *)self lock];
  [(SUDownloadManager *)self->_downloadManager reloadDownloadManager];
  [(SUScriptObject *)self unlock];

  [(SUScriptObject *)self dispatchEvent:0 forName:@"downloadschange"];
}

- (void)preorderManagerPreordersDidChange:(id)a3
{
}

- (void)_setupManagersWithClientInterface:(id)a3 queueType:(id)a4
{
  if ([a4 isEqualToString:@"media"])
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7B178] IPodDownloadKinds];
    uint64_t v8 = (void *)[MEMORY[0x263F7B2B8] musicStoreItemKinds];
    goto LABEL_9;
  }
  if ([a4 isEqualToString:@"software"])
  {
    uint64_t v9 = [MEMORY[0x263F7B178] softwareDownloadKinds];
LABEL_7:
    uint64_t v7 = (void *)v9;
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  if ([a4 isEqualToString:@"ebooks"])
  {
    uint64_t v9 = [MEMORY[0x263F7B178] EBookDownloadKinds];
    goto LABEL_7;
  }
  uint64_t v8 = 0;
  uint64_t v7 = 0;
LABEL_9:
  v10 = (void *)[a3 queueSessionManager];
  if ([v7 count])
  {
    long long v11 = (void *)[v10 beginDownloadManagerSessionWithDownloadKinds:v7];
    [v11 addObserver:self];
    long long v12 = [[SUDownloadManager alloc] initWithDownloadManager:v11 clientInterface:a3];
    uint64_t v13 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __69__SUScriptDownloadQueue__setupManagersWithClientInterface_queueType___block_invoke;
    v15[3] = &unk_264812130;
    v15[4] = v13;
    [(SUDownloadManager *)v12 preflightWithCompletionBlock:v15];
    [(SUScriptObject *)self lock];
    self->_downloadManager = v12;
    [(SUScriptObject *)self unlock];
  }
  if ([v8 count])
  {
    id v14 = (id)[v10 beginPreorderManagerSessionWithItemKinds:v8];
    [v14 addObserver:self];
    [(SUScriptObject *)self lock];
    self->_preorderManager = (SSPreorderManager *)v14;
    [(SUScriptObject *)self unlock];
  }
}

uint64_t __69__SUScriptDownloadQueue__setupManagersWithClientInterface_queueType___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) object];

  return [v1 dispatchEvent:0 forName:@"downloadschange"];
}

- (void)_tearDownQueues
{
  id v3 = [(SUClientInterface *)self->_clientInterface queueSessionManager];
  downloadManager = self->_downloadManager;
  if (downloadManager)
  {
    uint64_t v5 = [(SUDownloadManager *)downloadManager downloadManager];
    [(SUQueueSessionManager *)v3 endDownloadManagerSessionForManager:v5];
    [(SSDownloadManager *)v5 removeObserver:self];

    self->_downloadManager = 0;
  }
  if (self->_preorderManager)
  {
    -[SUQueueSessionManager endPreorderManagerSessionWithManager:](v3, "endPreorderManagerSessionWithManager:");
    [(SSPreorderManager *)self->_preorderManager removeObserver:self];

    self->_preorderManager = 0;
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_15, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDownloadQueue;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_12, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDownloadQueue;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptDownloadQueue;
  id v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_15 allKeys]);
  return v2;
}

- (void)finalizeForWebScript
{
  [(SUScriptObject *)self lock];
  [(SUScriptDownloadQueue *)self _tearDownQueues];
  [(SUScriptObject *)self unlock];
  v3.receiver = self;
  v3.super_class = (Class)SUScriptDownloadQueue;
  [(SUScriptObject *)&v3 finalizeForWebScript];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_12 = (uint64_t)sel_checkQueue;
    unk_2681B4A20 = @"checkQueue";
    __KeyMapping_15 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"downloads", @"queueType", @"queueType", 0);
  }
}

@end