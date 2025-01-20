@interface SSDownloadManagerBookShim
- (SSDownloadManagerBookShim)initWithManagerOptions:(id)a3;
- (id)__book_downloadsForStati:(id)a3 overrideFinished:(BOOL)a4 overrideFailed:(BOOL)a5;
- (id)__book_getAllDownloads;
- (id)_copyDownloadsForMessage:(int64_t)a3 downloadIDs:(id)a4;
- (void)__book_cancelDownloads:(id)a3 completionBlock:(id)a4;
- (void)__book_dispatchBlock:(id)a3 withError:(id)a4;
- (void)__book_filterDownloads:(id)a3 withResult:(id)a4;
- (void)__book_pauseDownloads:(id)a3 completionBlock:(id)a4;
- (void)__book_resumeDownloads:(id)a3 completionBlock:(id)a4;
- (void)_pauseDownloads:(id)a3 forced:(BOOL)a4 completionBlock:(id)a5;
- (void)cancelDownloads:(id)a3 completionBlock:(id)a4;
- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5;
- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4;
- (void)moveDownload:(id)a3 afterDownload:(id)a4 completionBlock:(id)a5;
- (void)moveDownload:(id)a3 beforeDownload:(id)a4 completionBlock:(id)a5;
- (void)restartDownloads:(id)a3 completionBlock:(id)a4;
- (void)resumeDownloads:(id)a3 completionBlock:(id)a4;
@end

@implementation SSDownloadManagerBookShim

- (SSDownloadManagerBookShim)initWithManagerOptions:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v5)
  {
    v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    v7 &= 2u;
  }
  if (v7)
  {
    v9 = objc_opt_class();
    id v10 = v9;
    int v44 = 138543618;
    v45 = v9;
    __int16 v46 = 2114;
    id v47 = (id)objc_opt_class();
    id v11 = v47;
    LODWORD(v42) = 22;
    v41 = &v44;
    v12 = (void *)_os_log_send_and_compose_impl();

    if (!v12) {
      goto LABEL_12;
    }
    v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v44, v42);
    free(v12);
    SSFileLog(v5, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v8);
  }

LABEL_12:
  v43.receiver = self;
  v43.super_class = (Class)SSDownloadManagerBookShim;
  v19 = [(SSDownloadManagerAppShim *)&v43 initWithManagerOptions:v4];

  if (v19)
  {
    uint64_t v20 = SSVBookAssetDaemonFramework();
    id v21 = SSVWeakLinkedClassForString(&cfstr_Bldownloadqueu.isa, v20);
    if (v21)
    {
      uint64_t v22 = [v21 sharedInstance];
      downloadQueue = v19->_downloadQueue;
      v19->_downloadQueue = (SSBookDownloadQueue *)v22;

      v24 = v19->_downloadQueue;
      if (v24)
      {
        [(SSBookDownloadQueue *)v24 addObserver:v19];
        return v19;
      }
      v25 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v25)
      {
        v25 = +[SSLogConfig sharedConfig];
      }
      int v29 = objc_msgSend(v25, "shouldLog", v41);
      if ([v25 shouldLogToDisk]) {
        int v30 = v29 | 2;
      }
      else {
        int v30 = v29;
      }
      v28 = [v25 OSLogObject];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        v30 &= 2u;
      }
      if (!v30) {
        goto LABEL_35;
      }
    }
    else
    {
      v25 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v25)
      {
        v25 = +[SSLogConfig sharedConfig];
      }
      int v26 = objc_msgSend(v25, "shouldLog", v41);
      if ([v25 shouldLogToDisk]) {
        int v27 = v26 | 2;
      }
      else {
        int v27 = v26;
      }
      v28 = [v25 OSLogObject];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        v27 &= 2u;
      }
      if (!v27) {
        goto LABEL_35;
      }
    }
    v31 = objc_opt_class();
    int v44 = 138543362;
    v45 = v31;
    id v32 = v31;
    LODWORD(v42) = 12;
    v33 = (void *)_os_log_send_and_compose_impl();

    if (!v33)
    {
LABEL_36:

      return v19;
    }
    v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v33, 4, &v44, v42);
    free(v33);
    SSFileLog(v25, @"%@", v34, v35, v36, v37, v38, v39, (uint64_t)v28);
LABEL_35:

    goto LABEL_36;
  }
  return v19;
}

- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v6)
  {
    int v6 = +[SSLogConfig sharedConfig];
  }
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
    v8 &= 2u;
  }
  if (v8)
  {
    int v38 = 138543618;
    id v39 = (id)objc_opt_class();
    __int16 v40 = 2112;
    id v41 = v5;
    id v10 = v39;
    LODWORD(v34) = 22;
    v33 = &v38;
    id v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_12;
    }
    v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v38, v34);
    free(v11);
    SSFileLog(v6, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v9);
  }

LABEL_12:
  uint64_t v18 = [(SSDownloadManagerBookShim *)self __book_downloadsForStati:v5 overrideFinished:0 overrideFailed:0];
  v19 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v19)
  {
    v19 = +[SSLogConfig sharedConfig];
  }
  int v20 = objc_msgSend(v19, "shouldLog", v33);
  if ([v19 shouldLogToDisk]) {
    int v21 = v20 | 2;
  }
  else {
    int v21 = v20;
  }
  uint64_t v22 = [v19 OSLogObject];
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
    v21 &= 2u;
  }
  if (v21)
  {
    v23 = objc_opt_class();
    int v38 = 138543618;
    id v39 = v23;
    __int16 v40 = 2112;
    id v41 = v18;
    id v24 = v23;
    LODWORD(v34) = 22;
    v25 = (void *)_os_log_send_and_compose_impl();

    if (!v25) {
      goto LABEL_23;
    }
    uint64_t v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v38, v34);
    free(v25);
    SSFileLog(v19, @"%@", v26, v27, v28, v29, v30, v31, (uint64_t)v22);
  }

LABEL_23:
  if ([v18 count])
  {
    accessQueue = self->super.super._accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__SSDownloadManagerBookShim_downloadQueue_downloadStatesDidChange___block_invoke;
    block[3] = &unk_1E5BA7018;
    id v36 = v18;
    uint64_t v37 = self;
    dispatch_async(accessQueue, block);
  }
}

void __67__SSDownloadManagerBookShim_downloadQueue_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    [*(id *)(a1 + 40) _resetAllDownloads];
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 40) + 80);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v17;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector()) {
            [v2 addObject:v8];
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);
    }

    v9 = *(NSObject **)(*(void *)(a1 + 40) + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__SSDownloadManagerBookShim_downloadQueue_downloadStatesDidChange___block_invoke_2;
    block[3] = &unk_1E5BA7068;
    id v14 = v2;
    int8x16_t v12 = *(int8x16_t *)(a1 + 32);
    id v10 = (id)v12.i64[0];
    int8x16_t v15 = vextq_s8(v12, v12, 8uLL);
    id v11 = v2;
    dispatch_async(v9, block);
  }
}

void __67__SSDownloadManagerBookShim_downloadQueue_downloadStatesDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        uint64_t v8 = *(void *)(a1 + 40);
        v9 = objc_msgSend(*(id *)(a1 + 48), "copy", (void)v10);
        [v7 downloadManager:v8 downloadStatesDidChange:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v8)
  {
    uint64_t v8 = +[SSLogConfig sharedConfig];
  }
  int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  long long v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    v10 &= 2u;
  }
  if (v10)
  {
    int v39 = 138543618;
    id v40 = (id)objc_opt_class();
    __int16 v41 = 2112;
    id v42 = v7;
    id v12 = v40;
    LODWORD(v36) = 22;
    uint64_t v35 = &v39;
    long long v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13) {
      goto LABEL_12;
    }
    long long v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v39, v36);
    free(v13);
    SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
  }

LABEL_12:
  int v20 = -[SSDownloadManagerBookShim __book_downloadsForStati:overrideFinished:overrideFailed:](self, "__book_downloadsForStati:overrideFinished:overrideFailed:", v7, a5 == 0, a5 != 0, v35);
  uint64_t v21 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v21)
  {
    uint64_t v21 = +[SSLogConfig sharedConfig];
  }
  int v22 = [v21 shouldLog];
  if ([v21 shouldLogToDisk]) {
    int v23 = v22 | 2;
  }
  else {
    int v23 = v22;
  }
  id v24 = [v21 OSLogObject];
  if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
    v23 &= 2u;
  }
  if (v23)
  {
    v25 = objc_opt_class();
    int v39 = 138543618;
    id v40 = v25;
    __int16 v41 = 2112;
    id v42 = v20;
    id v26 = v25;
    LODWORD(v36) = 22;
    uint64_t v27 = (void *)_os_log_send_and_compose_impl();

    if (!v27) {
      goto LABEL_23;
    }
    id v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v27, 4, &v39, v36);
    free(v27);
    SSFileLog(v21, @"%@", v28, v29, v30, v31, v32, v33, (uint64_t)v24);
  }

LABEL_23:
  if ([v20 count])
  {
    accessQueue = self->super.super._accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__SSDownloadManagerBookShim_downloadQueue_downloadStates_didCompleteWithError___block_invoke;
    block[3] = &unk_1E5BA7018;
    void block[4] = self;
    id v38 = v20;
    dispatch_async(accessQueue, block);
  }
}

void __79__SSDownloadManagerBookShim_downloadQueue_downloadStates_didCompleteWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetAllDownloads];
  id v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  [v2 _sendDownloadsChanged:v3];
}

- (void)__book_dispatchBlock:(id)a3 withError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = dispatch_get_global_queue(21, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__SSDownloadManagerBookShim___book_dispatchBlock_withError___block_invoke;
    v8[3] = &unk_1E5BA7328;
    id v10 = v5;
    id v9 = v6;
    dispatch_async(v7, v8);
  }
}

uint64_t __60__SSDownloadManagerBookShim___book_dispatchBlock_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)__book_filterDownloads:(id)a3 withResult:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *, void *))a4;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v15 = v7;
        }
        else {
          uint64_t v15 = v8;
        }
        objc_msgSend(v15, "addObject:", v14, (void)v18);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  uint64_t v16 = (void *)[v7 copy];
  uint64_t v17 = (void *)[v8 copy];
  v6[2](v6, v16, v17);
}

- (void)cancelDownloads:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SSDownloadManagerBookShim_cancelDownloads_completionBlock___block_invoke;
  v8[3] = &unk_1E5BAE2A8;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(SSDownloadManagerBookShim *)self __book_filterDownloads:a3 withResult:v8];
}

void __61__SSDownloadManagerBookShim_cancelDownloads_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__SSDownloadManagerBookShim_cancelDownloads_completionBlock___block_invoke_2;
    v9[3] = &unk_1E5BAE280;
    objc_copyWeak(&v12, &location);
    id v11 = *(id *)(a1 + 40);
    id v10 = v5;
    v8.receiver = v7;
    v8.super_class = (Class)SSDownloadManagerBookShim;
    objc_msgSendSuper2(&v8, sel_cancelDownloads_completionBlock_, v6, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__book_cancelDownloads:completionBlock:", v5, *(void *)(a1 + 40));
  }
}

void __61__SSDownloadManagerBookShim_cancelDownloads_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (v5) {
    objc_msgSend(WeakRetained, "__book_dispatchBlock:withError:", *(void *)(a1 + 40), v5);
  }
  else {
    objc_msgSend(WeakRetained, "__book_cancelDownloads:completionBlock:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

- (void)moveDownload:(id)a3 afterDownload:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 valueForProperty:@"1"];
  char IsBookToShimKind = SSDownloadKindIsBookToShimKind((uint64_t)v11);

  uint64_t v13 = [v9 valueForProperty:@"1"];
  char v14 = SSDownloadKindIsBookToShimKind((uint64_t)v13);

  if ((IsBookToShimKind & 1) == 0 && (v14 & 1) == 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)SSDownloadManagerBookShim;
    [(SSDownloadManagerAppShim *)&v15 moveDownload:v8 afterDownload:v9 completionBlock:v10];
  }
}

- (void)moveDownload:(id)a3 beforeDownload:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 valueForProperty:@"1"];
  char IsBookToShimKind = SSDownloadKindIsBookToShimKind((uint64_t)v11);

  uint64_t v13 = [v9 valueForProperty:@"1"];
  char v14 = SSDownloadKindIsBookToShimKind((uint64_t)v13);

  if ((IsBookToShimKind & 1) == 0 && (v14 & 1) == 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)SSDownloadManagerBookShim;
    [(SSDownloadManagerAppShim *)&v15 moveDownload:v8 beforeDownload:v9 completionBlock:v10];
  }
}

- (void)resumeDownloads:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SSDownloadManagerBookShim_resumeDownloads_completionBlock___block_invoke;
  v8[3] = &unk_1E5BAE2A8;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(SSDownloadManagerBookShim *)self __book_filterDownloads:a3 withResult:v8];
}

void __61__SSDownloadManagerBookShim_resumeDownloads_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__SSDownloadManagerBookShim_resumeDownloads_completionBlock___block_invoke_2;
    v9[3] = &unk_1E5BAE280;
    objc_copyWeak(&v12, &location);
    id v11 = *(id *)(a1 + 40);
    id v10 = v5;
    v8.receiver = v7;
    v8.super_class = (Class)SSDownloadManagerBookShim;
    objc_msgSendSuper2(&v8, sel_resumeDownloads_completionBlock_, v6, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__book_resumeDownloads:completionBlock:", v5, *(void *)(a1 + 40));
  }
}

void __61__SSDownloadManagerBookShim_resumeDownloads_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (v5) {
    objc_msgSend(WeakRetained, "__book_dispatchBlock:withError:", *(void *)(a1 + 40), v5);
  }
  else {
    objc_msgSend(WeakRetained, "__book_resumeDownloads:completionBlock:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

- (void)restartDownloads:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SSDownloadManagerBookShim_restartDownloads_completionBlock___block_invoke;
  v8[3] = &unk_1E5BAE2A8;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(SSDownloadManagerBookShim *)self __book_filterDownloads:a3 withResult:v8];
}

void __62__SSDownloadManagerBookShim_restartDownloads_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__SSDownloadManagerBookShim_restartDownloads_completionBlock___block_invoke_2;
    v9[3] = &unk_1E5BA9468;
    objc_copyWeak(&v11, &location);
    id v10 = *(id *)(a1 + 40);
    v8.receiver = v7;
    v8.super_class = (Class)SSDownloadManagerBookShim;
    objc_msgSendSuper2(&v8, sel_restartDownloads_completionBlock_, v6, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __62__SSDownloadManagerBookShim_restartDownloads_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "__book_dispatchBlock:withError:", *(void *)(a1 + 32), v4);
}

- (id)_copyDownloadsForMessage:(int64_t)a3 downloadIDs:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SSDownloadManagerBookShim;
  id v5 = [(SSDownloadManagerAppShim *)&v8 _copyDownloadsForMessage:a3 downloadIDs:a4];
  id v6 = [(SSDownloadManagerBookShim *)self __book_getAllDownloads];
  if ([v6 count]) {
    [v5 addObjectsFromArray:v6];
  }

  return v5;
}

- (void)_pauseDownloads:(id)a3 forced:(BOOL)a4 completionBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__SSDownloadManagerBookShim__pauseDownloads_forced_completionBlock___block_invoke;
  v10[3] = &unk_1E5BAE2D0;
  v10[4] = self;
  id v11 = v8;
  BOOL v12 = a4;
  id v9 = v8;
  [(SSDownloadManagerBookShim *)self __book_filterDownloads:a3 withResult:v10];
}

void __68__SSDownloadManagerBookShim__pauseDownloads_forced_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__SSDownloadManagerBookShim__pauseDownloads_forced_completionBlock___block_invoke_2;
    v10[3] = &unk_1E5BAE280;
    objc_copyWeak(&v13, &location);
    id v12 = *(id *)(a1 + 40);
    id v11 = v5;
    v9.receiver = v7;
    v9.super_class = (Class)SSDownloadManagerBookShim;
    objc_msgSendSuper2(&v9, sel__pauseDownloads_forced_completionBlock_, v6, v8, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__book_pauseDownloads:completionBlock:", v5, *(void *)(a1 + 40));
  }
}

void __68__SSDownloadManagerBookShim__pauseDownloads_forced_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (v5) {
    objc_msgSend(WeakRetained, "__book_dispatchBlock:withError:", *(void *)(a1 + 40), v5);
  }
  else {
    objc_msgSend(WeakRetained, "__book_pauseDownloads:completionBlock:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

- (void)__book_cancelDownloads:(id)a3 completionBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v14 = v6;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(obj);
          }
          downloadQueue = self->_downloadQueue;
          id v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v11), "downloadID", v14);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __68__SSDownloadManagerBookShim___book_cancelDownloads_completionBlock___block_invoke;
          v16[3] = &unk_1E5BAE2F8;
          v16[4] = self;
          id v17 = v7;
          [(SSBookDownloadQueue *)downloadQueue cancelDownloadWithID:v13 withCompletion:v16];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    id v6 = v14;
  }
  else
  {
    [(SSDownloadManagerBookShim *)self __book_dispatchBlock:v7 withError:0];
  }
}

uint64_t __68__SSDownloadManagerBookShim___book_cancelDownloads_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "__book_dispatchBlock:withError:", *(void *)(a1 + 40), a2);
}

- (void)__book_pauseDownloads:(id)a3 completionBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v14 = v6;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(obj);
          }
          downloadQueue = self->_downloadQueue;
          id v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v11), "downloadID", v14);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __67__SSDownloadManagerBookShim___book_pauseDownloads_completionBlock___block_invoke;
          v16[3] = &unk_1E5BAE2F8;
          v16[4] = self;
          id v17 = v7;
          [(SSBookDownloadQueue *)downloadQueue pauseDownloadWithID:v13 withCompletion:v16];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    id v6 = v14;
  }
  else
  {
    [(SSDownloadManagerBookShim *)self __book_dispatchBlock:v7 withError:0];
  }
}

uint64_t __67__SSDownloadManagerBookShim___book_pauseDownloads_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "__book_dispatchBlock:withError:", *(void *)(a1 + 40), a2);
}

- (void)__book_resumeDownloads:(id)a3 completionBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v14 = v6;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(obj);
          }
          downloadQueue = self->_downloadQueue;
          id v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v11), "downloadID", v14);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __68__SSDownloadManagerBookShim___book_resumeDownloads_completionBlock___block_invoke;
          v16[3] = &unk_1E5BAE2F8;
          v16[4] = self;
          id v17 = v7;
          [(SSBookDownloadQueue *)downloadQueue resumeDownloadWithID:v13 withCompletion:v16];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    id v6 = v14;
  }
  else
  {
    [(SSDownloadManagerBookShim *)self __book_dispatchBlock:v7 withError:0];
  }
}

uint64_t __68__SSDownloadManagerBookShim___book_resumeDownloads_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "__book_dispatchBlock:withError:", *(void *)(a1 + 40), a2);
}

- (id)__book_getAllDownloads
{
  id v3 = [(SSBookDownloadQueue *)self->_downloadQueue downloads];
  id v4 = [(SSDownloadManagerBookShim *)self __book_downloadsForStati:v3 overrideFinished:0 overrideFailed:0];

  return v4;
}

- (id)__book_downloadsForStati:(id)a3 overrideFinished:(BOOL)a4 overrideFailed:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    int v13 = v6 || v5;
    if (v6) {
      id v14 = SSDownloadPhaseFinished;
    }
    else {
      id v14 = &SSDownloadPhaseFailed;
    }
    objc_super v15 = *v14;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        long long v18 = [SSBookDownload alloc];
        long long v19 = -[SSBookDownload initWithDownloadStatus:](v18, "initWithDownloadStatus:", v17, (void)v23);
        long long v20 = v19;
        if (v19)
        {
          if (v13) {
            [(SSBookDownload *)v19 setDownloadPhaseIdentifierOverride:v15];
          }
          [v8 addObject:v20];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  long long v21 = (void *)[v8 copy];
  return v21;
}

- (void).cxx_destruct
{
}

@end