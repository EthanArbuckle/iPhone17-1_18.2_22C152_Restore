@interface SSDownloadManagerAppShim
- (SSDownloadManagerAppShim)initWithManagerOptions:(id)a3;
- (id)__app_convertOptions:(id)a3;
- (id)__app_downloadsForJobs:(id)a3;
- (id)__app_extractJobIDsFromSoftwareDownloads:(id)a3;
- (id)__app_getAllDownloads;
- (id)__app_newActivityWithDownload:(id)a3;
- (id)__app_newAssetWithDownloadAsset:(id)a3 assetType:(id)a4;
- (id)__app_newManifestWithType:(int64_t)a3;
- (id)_copyDownloadsForMessage:(int64_t)a3 downloadIDs:(id)a4;
- (void)__app_cancelDownloads:(id)a3 completionBlock:(id)a4;
- (void)__app_dispatchBlock:(id)a3 withError:(id)a4;
- (void)__app_filterDownloads:(id)a3 withResult:(id)a4;
- (void)__app_finishDownloads:(id)a3;
- (void)__app_insertDownloads:(id)a3 before:(id)a4 after:(id)a5 completionBlock:(id)a6;
- (void)__app_installManifest:(id)a3 completionBlock:(id)a4;
- (void)__app_pauseDownloads:(id)a3 completionBlock:(id)a4;
- (void)__app_resumeDownloads:(id)a3 completionBlock:(id)a4;
- (void)__app_sendDownloadsChanged:(id)a3 filterSoftware:(BOOL)a4;
- (void)__app_setPropertiesForActivity:(id)a3 withDownload:(id)a4;
- (void)_insertDownloads:(id)a3 before:(id)a4 after:(id)a5 completionBlock:(id)a6;
- (void)_pauseDownloads:(id)a3 forced:(BOOL)a4 completionBlock:(id)a5;
- (void)_sendDownloadsChanged:(id)a3;
- (void)cancelAllDownloadsWithCompletionBlock:(id)a3;
- (void)cancelDownloads:(id)a3 completionBlock:(id)a4;
- (void)finishDownloads:(id)a3;
- (void)jobManager:(id)a3 changedJobs:(id)a4;
- (void)jobManager:(id)a3 updatedProgressOfJobs:(id)a4;
- (void)jobManager:(id)a3 updatedStateOfJobs:(id)a4;
- (void)moveDownload:(id)a3 afterDownload:(id)a4 completionBlock:(id)a5;
- (void)moveDownload:(id)a3 beforeDownload:(id)a4 completionBlock:(id)a5;
- (void)restartDownloads:(id)a3 completionBlock:(id)a4;
- (void)resumeDownloads:(id)a3 completionBlock:(id)a4;
- (void)setDownloads:(id)a3 forKinds:(id)a4 completionBlock:(id)a5;
@end

@implementation SSDownloadManagerAppShim

- (SSDownloadManagerAppShim)initWithManagerOptions:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SSDownloadManagerAppShim;
  v5 = [(SSDownloadManager *)&v12 initWithManagerOptions:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [(SSDownloadManagerAppShim *)v5 __app_convertOptions:v4];
    uint64_t v8 = SSVAppstoreDaemonFramework();
    uint64_t v9 = objc_msgSend(objc_alloc((Class)SSVWeakLinkedClassForString(&cfstr_Asdjobmanager.isa, v8)), "initWithOptions:", v7);
    jobManager = v6->_jobManager;
    v6->_jobManager = (ASDJobManager *)v9;

    [(ASDJobManager *)v6->_jobManager addJobObserver:v6];
  }

  return v6;
}

- (void)jobManager:(id)a3 changedJobs:(id)a4
{
  v5 = [(SSDownloadManagerAppShim *)self __app_downloadsForJobs:a4];
  if ([v5 count])
  {
    accessQueue = self->super._accessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__SSDownloadManagerAppShim_jobManager_changedJobs___block_invoke;
    v7[3] = &unk_1E5BA7018;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(accessQueue, v7);
  }
}

void __51__SSDownloadManagerAppShim_jobManager_changedJobs___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  objc_msgSend(v1, "__app_sendDownloadsChanged:filterSoftware:", v2, 0);
}

- (void)jobManager:(id)a3 updatedProgressOfJobs:(id)a4
{
  v5 = [(SSDownloadManagerAppShim *)self __app_downloadsForJobs:a4];
  if ([v5 count])
  {
    accessQueue = self->super._accessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__SSDownloadManagerAppShim_jobManager_updatedProgressOfJobs___block_invoke;
    v7[3] = &unk_1E5BA7018;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(accessQueue, v7);
  }
}

void __61__SSDownloadManagerAppShim_jobManager_updatedProgressOfJobs___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  objc_msgSend(v1, "__app_sendDownloadsChanged:filterSoftware:", v2, 0);
}

- (void)jobManager:(id)a3 updatedStateOfJobs:(id)a4
{
  v5 = [(SSDownloadManagerAppShim *)self __app_downloadsForJobs:a4];
  if ([v5 count])
  {
    accessQueue = self->super._accessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__SSDownloadManagerAppShim_jobManager_updatedStateOfJobs___block_invoke;
    v7[3] = &unk_1E5BA7018;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(accessQueue, v7);
  }
}

void __58__SSDownloadManagerAppShim_jobManager_updatedStateOfJobs___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  objc_msgSend(v1, "__app_sendDownloadsChanged:filterSoftware:", v2, 0);
}

- (void)cancelAllDownloadsWithCompletionBlock:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadManagerAppShim;
  [(SSDownloadManager *)&v3 cancelAllDownloadsWithCompletionBlock:a3];
}

- (void)cancelDownloads:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SSDownloadManagerAppShim_cancelDownloads_completionBlock___block_invoke;
  v8[3] = &unk_1E5BAE2A8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(SSDownloadManagerAppShim *)self __app_filterDownloads:a3 withResult:v8];
}

void __60__SSDownloadManagerAppShim_cancelDownloads_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v7 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__SSDownloadManagerAppShim_cancelDownloads_completionBlock___block_invoke_2;
    v11[3] = &unk_1E5BAEC88;
    objc_copyWeak(&v14, &location);
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    id v13 = v8;
    v11[4] = v9;
    id v12 = v5;
    v10.receiver = v7;
    v10.super_class = (Class)SSDownloadManagerAppShim;
    objc_msgSendSuper2(&v10, sel_cancelDownloads_completionBlock_, v6, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__app_cancelDownloads:completionBlock:", v5, *(void *)(a1 + 40));
  }
}

void __60__SSDownloadManagerAppShim_cancelDownloads_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (v5) {
    objc_msgSend(WeakRetained, "__app_dispatchBlock:withError:", *(void *)(a1 + 48), v5);
  }
  else {
    objc_msgSend(*(id *)(a1 + 32), "__app_cancelDownloads:completionBlock:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
}

- (void)finishDownloads:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSDownloadManagerAppShim;
  id v4 = a3;
  [(SSDownloadManager *)&v6 _willFinishDownloads:v4];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SSDownloadManagerAppShim_finishDownloads___block_invoke;
  v5[3] = &unk_1E5BAECB0;
  v5[4] = self;
  [(SSDownloadManagerAppShim *)self __app_filterDownloads:v4 withResult:v5];
}

void __44__SSDownloadManagerAppShim_finishDownloads___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    v7.receiver = *(id *)(a1 + 32);
    v7.super_class = (Class)SSDownloadManagerAppShim;
    objc_msgSendSuper2(&v7, sel__finishDownloads_, v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "__app_finishDownloads:", v5);
}

- (void)moveDownload:(id)a3 afterDownload:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 valueForProperty:@"1"];
  char v12 = [v11 isEqualToString:@"software"];

  id v13 = [v9 valueForProperty:@"1"];
  char v14 = [v13 isEqualToString:@"software"];

  if ((v12 & 1) == 0 && (v14 & 1) == 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)SSDownloadManagerAppShim;
    [(SSDownloadManager *)&v15 moveDownload:v8 afterDownload:v9 completionBlock:v10];
  }
}

- (void)moveDownload:(id)a3 beforeDownload:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 valueForProperty:@"1"];
  char v12 = [v11 isEqualToString:@"software"];

  id v13 = [v9 valueForProperty:@"1"];
  char v14 = [v13 isEqualToString:@"software"];

  if ((v12 & 1) == 0 && (v14 & 1) == 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)SSDownloadManagerAppShim;
    [(SSDownloadManager *)&v15 moveDownload:v8 beforeDownload:v9 completionBlock:v10];
  }
}

- (void)resumeDownloads:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SSDownloadManagerAppShim_resumeDownloads_completionBlock___block_invoke;
  v8[3] = &unk_1E5BAE2A8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(SSDownloadManagerAppShim *)self __app_filterDownloads:a3 withResult:v8];
}

void __60__SSDownloadManagerAppShim_resumeDownloads_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v7 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__SSDownloadManagerAppShim_resumeDownloads_completionBlock___block_invoke_2;
    v11[3] = &unk_1E5BAEC88;
    objc_copyWeak(&v14, &location);
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    id v13 = v8;
    v11[4] = v9;
    id v12 = v5;
    v10.receiver = v7;
    v10.super_class = (Class)SSDownloadManagerAppShim;
    objc_msgSendSuper2(&v10, sel_resumeDownloads_completionBlock_, v6, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__app_resumeDownloads:completionBlock:", v5, *(void *)(a1 + 40));
  }
}

void __60__SSDownloadManagerAppShim_resumeDownloads_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (v5) {
    objc_msgSend(WeakRetained, "__app_dispatchBlock:withError:", *(void *)(a1 + 48), v5);
  }
  else {
    objc_msgSend(*(id *)(a1 + 32), "__app_resumeDownloads:completionBlock:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
}

- (void)restartDownloads:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SSDownloadManagerAppShim_restartDownloads_completionBlock___block_invoke;
  v8[3] = &unk_1E5BAE2A8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(SSDownloadManagerAppShim *)self __app_filterDownloads:a3 withResult:v8];
}

void __61__SSDownloadManagerAppShim_restartDownloads_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__SSDownloadManagerAppShim_restartDownloads_completionBlock___block_invoke_2;
    v9[3] = &unk_1E5BA9468;
    objc_copyWeak(&v11, &location);
    id v10 = *(id *)(a1 + 40);
    v8.receiver = v7;
    v8.super_class = (Class)SSDownloadManagerAppShim;
    objc_msgSendSuper2(&v8, sel_restartDownloads_completionBlock_, v6, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __61__SSDownloadManagerAppShim_restartDownloads_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "__app_dispatchBlock:withError:", *(void *)(a1 + 32), v4);
}

- (void)setDownloads:(id)a3 forKinds:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__SSDownloadManagerAppShim_setDownloads_forKinds_completionBlock___block_invoke;
  v14[3] = &unk_1E5BAECD8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(SSDownloadManagerAppShim *)self __app_filterDownloads:v12 withResult:v14];
}

void __66__SSDownloadManagerAppShim_setDownloads_forKinds_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v8 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__SSDownloadManagerAppShim_setDownloads_forKinds_completionBlock___block_invoke_2;
    v11[3] = &unk_1E5BAE280;
    objc_copyWeak(&v14, &location);
    id v13 = *(id *)(a1 + 56);
    id v12 = v5;
    v10.receiver = v8;
    v10.super_class = (Class)SSDownloadManagerAppShim;
    objc_msgSendSuper2(&v10, sel_setDownloads_forKinds_completionBlock_, v7, v9, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__app_insertDownloads:before:after:completionBlock:", v5, 0, 0, *(void *)(a1 + 56));
  }
}

void __66__SSDownloadManagerAppShim_setDownloads_forKinds_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (v5) {
    objc_msgSend(WeakRetained, "__app_dispatchBlock:withError:", *(void *)(a1 + 40), v5);
  }
  else {
    objc_msgSend(WeakRetained, "__app_insertDownloads:before:after:completionBlock:", *(void *)(a1 + 32), 0, 0, *(void *)(a1 + 40));
  }
}

- (id)_copyDownloadsForMessage:(int64_t)a3 downloadIDs:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SSDownloadManagerAppShim;
  id v5 = [(SSDownloadManager *)&v9 _copyDownloadsForMessage:a3 downloadIDs:a4];
  id v6 = [v5 indexesOfObjectsPassingTest:&__block_literal_global_46];
  [v5 removeObjectsAtIndexes:v6];
  uint64_t v7 = [(SSDownloadManagerAppShim *)self __app_getAllDownloads];
  [v5 addObjectsFromArray:v7];

  return v5;
}

uint64_t __65__SSDownloadManagerAppShim__copyDownloadsForMessage_downloadIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForProperty:@"1"];
  uint64_t v3 = [v2 isEqualToString:@"software"];

  return v3;
}

- (void)_insertDownloads:(id)a3 before:(id)a4 after:(id)a5 completionBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__SSDownloadManagerAppShim__insertDownloads_before_after_completionBlock___block_invoke;
  v16[3] = &unk_1E5BAED48;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(SSDownloadManagerAppShim *)self __app_filterDownloads:a3 withResult:v16];
}

void __74__SSDownloadManagerAppShim__insertDownloads_before_after_completionBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    objc_initWeak(&location, a1[4]);
    id v8 = a1[4];
    id v7 = a1[5];
    id v9 = a1[6];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__SSDownloadManagerAppShim__insertDownloads_before_after_completionBlock___block_invoke_2;
    v11[3] = &unk_1E5BAED20;
    objc_copyWeak(&v16, &location);
    id v15 = a1[7];
    id v12 = v5;
    id v13 = a1[5];
    id v14 = a1[6];
    v10.receiver = v8;
    v10.super_class = (Class)SSDownloadManagerAppShim;
    objc_msgSendSuper2(&v10, sel__insertDownloads_before_after_completionBlock_, v6, v7, v9, v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(a1[4], "__app_insertDownloads:before:after:completionBlock:", v5, a1[5], a1[6], a1[7]);
  }
}

void __74__SSDownloadManagerAppShim__insertDownloads_before_after_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (v5) {
    objc_msgSend(WeakRetained, "__app_dispatchBlock:withError:", *(void *)(a1 + 56), v5);
  }
  else {
    objc_msgSend(WeakRetained, "__app_insertDownloads:before:after:completionBlock:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
}

- (void)_pauseDownloads:(id)a3 forced:(BOOL)a4 completionBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__SSDownloadManagerAppShim__pauseDownloads_forced_completionBlock___block_invoke;
  v10[3] = &unk_1E5BAE2D0;
  v10[4] = self;
  id v11 = v8;
  BOOL v12 = a4;
  id v9 = v8;
  [(SSDownloadManagerAppShim *)self __app_filterDownloads:a3 withResult:v10];
}

void __67__SSDownloadManagerAppShim__pauseDownloads_forced_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__SSDownloadManagerAppShim__pauseDownloads_forced_completionBlock___block_invoke_2;
    v12[3] = &unk_1E5BAEC88;
    objc_copyWeak(&v15, &location);
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    id v14 = v9;
    v12[4] = v10;
    id v13 = v5;
    v11.receiver = v7;
    v11.super_class = (Class)SSDownloadManagerAppShim;
    objc_msgSendSuper2(&v11, sel__pauseDownloads_forced_completionBlock_, v6, v8, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__app_pauseDownloads:completionBlock:", v5, *(void *)(a1 + 40));
  }
}

void __67__SSDownloadManagerAppShim__pauseDownloads_forced_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (v5) {
    objc_msgSend(WeakRetained, "__app_dispatchBlock:withError:", *(void *)(a1 + 48), v5);
  }
  else {
    objc_msgSend(*(id *)(a1 + 32), "__app_pauseDownloads:completionBlock:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
}

- (void)_sendDownloadsChanged:(id)a3
{
  accessQueue = self->super._accessQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(accessQueue);
  [(SSDownloadManagerAppShim *)self __app_sendDownloadsChanged:v5 filterSoftware:1];
}

- (void)__app_cancelDownloads:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [(SSDownloadManagerAppShim *)self __app_extractJobIDsFromSoftwareDownloads:v6];
    jobManager = self->_jobManager;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__SSDownloadManagerAppShim___app_cancelDownloads_completionBlock___block_invoke;
    v10[3] = &unk_1E5BAED70;
    v10[4] = self;
    id v11 = v7;
    [(ASDJobManager *)jobManager cancelJobsWithIDs:v8 completionBlock:v10];
  }
  else
  {
    [(SSDownloadManagerAppShim *)self __app_dispatchBlock:v7 withError:0];
  }
}

uint64_t __66__SSDownloadManagerAppShim___app_cancelDownloads_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "__app_dispatchBlock:withError:", *(void *)(a1 + 40), a3);
}

- (id)__app_convertOptions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = SSVAppstoreDaemonFramework();
  SSVWeakLinkedClassForString(&cfstr_Asdjobmanagero.isa, v4);
  id v5 = objc_opt_new();
  objc_msgSend(v5, "setShouldFilterExternalOriginatedDownloads:", objc_msgSend(v3, "shouldFilterExternalOriginatedDownloads"));
  id v6 = [v3 persistenceIdentifier];

  [v5 setPersistenceIdentifier:v6];
  return v5;
}

- (id)__app_downloadsForJobs:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [SSSoftwareDownload alloc];
        BOOL v12 = -[SSSoftwareDownload initWithJob:](v11, "initWithJob:", v10, (void)v15);
        if (v12) {
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = (void *)[v4 copy];
  return v13;
}

- (void)__app_dispatchBlock:(id)a3 withError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    uint64_t v7 = dispatch_get_global_queue(21, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__SSDownloadManagerAppShim___app_dispatchBlock_withError___block_invoke;
    v8[3] = &unk_1E5BA7328;
    id v10 = v5;
    id v9 = v6;
    dispatch_async(v7, v8);
  }
}

uint64_t __58__SSDownloadManagerAppShim___app_dispatchBlock_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)__app_extractJobIDsFromSoftwareDownloads:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "persistentIdentifier", (void)v13));
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = (void *)[v4 copy];
  return v11;
}

- (void)__app_filterDownloads:(id)a3 withResult:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v18 = (void (**)(id, void *, void *))a4;
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v14 = [v13 valueForProperty:@"1"];
        if ([v14 isEqualToString:@"software"]) {
          long long v15 = v6;
        }
        else {
          long long v15 = v7;
        }
        [v15 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  long long v16 = (void *)[v6 copy];
  long long v17 = (void *)[v7 copy];
  v18[2](v18, v16, v17);
}

- (void)__app_finishDownloads:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "job", (void)v12);
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    [(ASDJobManager *)self->_jobManager finishJobs:v5];
  }
}

- (id)__app_getAllDownloads
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__87;
  long long v15 = __Block_byref_object_dispose__87;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  jobManager = self->_jobManager;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SSDownloadManagerAppShim___app_getAllDownloads__block_invoke;
  v8[3] = &unk_1E5BAED98;
  uint64_t v10 = &v11;
  void v8[4] = self;
  id v5 = v3;
  uint64_t v9 = v5;
  [(ASDJobManager *)jobManager getJobsUsingBlock:v8];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

intptr_t __49__SSDownloadManagerAppShim___app_getAllDownloads__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "__app_downloadsForJobs:", a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v6);
}

- (void)__app_insertDownloads:(id)a3 before:(id)a4 after:(id)a5 completionBlock:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  if ([v8 count])
  {
    uint64_t v10 = [(SSDownloadManagerAppShim *)self __app_newManifestWithType:0];
    uint64_t v11 = [(SSDownloadManagerAppShim *)self __app_newManifestWithType:2];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__SSDownloadManagerAppShim___app_insertDownloads_before_after_completionBlock___block_invoke;
    v14[3] = &unk_1E5BAEDC0;
    v14[4] = self;
    id v12 = v11;
    id v15 = v12;
    id v13 = v10;
    id v16 = v13;
    [v8 enumerateObjectsUsingBlock:v14];
    if ([v13 count]) {
      [(SSDownloadManagerAppShim *)self __app_installManifest:v13 completionBlock:v9];
    }
    if ([v12 count]) {
      [(SSDownloadManagerAppShim *)self __app_installManifest:v12 completionBlock:v9];
    }
  }
  else
  {
    [(SSDownloadManagerAppShim *)self __app_dispatchBlock:v9 withError:0];
  }
}

void __79__SSDownloadManagerAppShim___app_insertDownloads_before_after_completionBlock___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = (void *)a1[4];
  id v6 = a2;
  objc_msgSend(v5, "__app_newActivityWithDownload:", v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
  [v13 setExternalOrderKey:v7];

  id v8 = [v6 valueForProperty:@"V"];
  LODWORD(v5) = [v8 BOOLValue];

  id v9 = NSNumber;
  if (v5) {
    uint64_t v10 = (void *)a1[5];
  }
  else {
    uint64_t v10 = (void *)a1[6];
  }
  uint64_t v11 = [v6 persistentIdentifier];

  id v12 = [v9 numberWithLongLong:v11];
  [v10 addActivity:v13 withIdentifier:v12];
}

- (void)__app_installManifest:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = SSVAppstoreDaemonFramework();
  id v9 = objc_msgSend(objc_alloc((Class)SSVWeakLinkedClassForString(&cfstr_Asdinstallmani.isa, v8)), "initWithManifest:", v7);

  uint64_t v10 = SSVAppstoreDaemonFramework();
  uint64_t v11 = objc_msgSend(objc_alloc((Class)SSVWeakLinkedClassForString(&cfstr_Asdinstallmani_0.isa, v10)), "initWithOptions:", v9);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__SSDownloadManagerAppShim___app_installManifest_completionBlock___block_invoke;
  v13[3] = &unk_1E5BAEDE8;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [v11 startWithCompletionBlock:v13];
}

uint64_t __66__SSDownloadManagerAppShim___app_installManifest_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__app_dispatchBlock:withError:", *(void *)(a1 + 40));
}

- (id)__app_newAssetWithDownloadAsset:(id)a3 assetType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 _localValues];
  uint64_t v8 = SSVAppstoreDaemonFramework();
  id v9 = objc_alloc_init((Class)SSVWeakLinkedClassForString(&cfstr_Asdjobasset.isa, v8));
  uint64_t v10 = [v7 objectForKeyedSubscript:@"e"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v12 = v10;
  if ((isKindOfClass & 1) != 0
    || (objc_msgSend(v9, "assetType", v10),
        id v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        id v12 = v6,
        !v13))
  {
    [v9 setAssetType:v12];
  }
  id v14 = [v7 objectForKeyedSubscript:@"c"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setAssetURL:v14];
  }
  id v15 = [v7 objectForKeyedSubscript:@"3"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setBytesTotal:v15];
  }
  id v16 = [v7 objectForKeyedSubscript:@"m"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setExpectedDiskspace:v16];
  }
  uint64_t v17 = [v7 objectForKeyedSubscript:@"0"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setHashArrayData:v17];
  }
  uint64_t v18 = [v7 objectForKeyedSubscript:@"o"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setHashType:v18];
  }
  long long v19 = [v7 objectForKeyedSubscript:@"1"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setNumberOfBytesToHash:v19];
  }
  long long v20 = [v7 objectForKeyedSubscript:@"B"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setSinfs:v20];
  }
  long long v21 = [v7 objectForKeyedSubscript:@"q"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setDPInfo:v21];
  }
  long long v22 = [v7 objectForKeyedSubscript:@"x"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setInitialODRSize:v22];
  }
  v23 = [v7 objectForKeyedSubscript:@"l"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v9, "setIsLocallyCacheable:", objc_msgSend(v23, "BOOLValue"));
  }
  uint64_t v24 = [v7 objectForKeyedSubscript:@"9"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v9, "setIsExternal:", objc_msgSend(v24, "BOOLValue"));
  }
  v25 = [v7 objectForKeyedSubscript:@"k"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v9, "setIsZipStreamable:", objc_msgSend(v25, "BOOLValue"));
  }
  v26 = [v5 _localProperties];
  v27 = v26;
  if (v26)
  {
    v28 = [v26 URL];
    v29 = [v28 absoluteString];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v9 setAssetURL:v29];
    }
  }
  else
  {
    v29 = v25;
  }

  return v9;
}

- (id)__app_newActivityWithDownload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SSVAppstoreDaemonFramework();
  id v6 = objc_alloc_init((Class)SSVWeakLinkedClassForString(&cfstr_Asdjobactivity.isa, v5));
  [(SSDownloadManagerAppShim *)self __app_setPropertiesForActivity:v6 withDownload:v4];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [v4 _localAssets];

  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __58__SSDownloadManagerAppShim___app_newActivityWithDownload___block_invoke;
  id v14 = &unk_1E5BAEE10;
  id v15 = self;
  id v16 = v7;
  id v9 = v7;
  [v8 enumerateKeysAndObjectsUsingBlock:&v11];

  objc_msgSend(v6, "setAssets:", v9, v11, v12, v13, v14, v15);
  return v6;
}

void __58__SSDownloadManagerAppShim___app_newActivityWithDownload___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "__app_newAssetWithDownloadAsset:assetType:", *(void *)(*((void *)&v12 + 1) + 8 * v10), v5);
        if (v11) {
          [*(id *)(a1 + 40) addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (id)__app_newManifestWithType:(int64_t)a3
{
  uint64_t v4 = SSVAppstoreDaemonFramework();
  id v5 = objc_msgSend(objc_alloc((Class)SSVWeakLinkedClassForString(&cfstr_Asdjobmanifest.isa, v4)), "initWithManifestType:", a3);
  return v5;
}

- (void)__app_pauseDownloads:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [(SSDownloadManagerAppShim *)self __app_extractJobIDsFromSoftwareDownloads:v6];
    jobManager = self->_jobManager;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__SSDownloadManagerAppShim___app_pauseDownloads_completionBlock___block_invoke;
    v10[3] = &unk_1E5BAED70;
    v10[4] = self;
    id v11 = v7;
    [(ASDJobManager *)jobManager pauseJobsWithIDs:v8 completionBlock:v10];
  }
  else
  {
    [(SSDownloadManagerAppShim *)self __app_dispatchBlock:v7 withError:0];
  }
}

uint64_t __65__SSDownloadManagerAppShim___app_pauseDownloads_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "__app_dispatchBlock:withError:", *(void *)(a1 + 40), a3);
}

- (void)__app_resumeDownloads:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [(SSDownloadManagerAppShim *)self __app_extractJobIDsFromSoftwareDownloads:v6];
    jobManager = self->_jobManager;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__SSDownloadManagerAppShim___app_resumeDownloads_completionBlock___block_invoke;
    v10[3] = &unk_1E5BAED70;
    v10[4] = self;
    id v11 = v7;
    [(ASDJobManager *)jobManager resumeJobsWithIDs:v8 completionBlock:v10];
  }
  else
  {
    [(SSDownloadManagerAppShim *)self __app_dispatchBlock:v7 withError:0];
  }
}

uint64_t __66__SSDownloadManagerAppShim___app_resumeDownloads_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "__app_dispatchBlock:withError:", *(void *)(a1 + 40), a3);
}

- (void)__app_setPropertiesForActivity:(id)a3 withDownload:(id)a4
{
  id v45 = a3;
  id v5 = a4;
  id v6 = [v5 _localValues];
  id v7 = [v6 objectForKeyedSubscript:@"3"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setArtistID:v7];
  }
  uint64_t v8 = [v6 objectForKeyedSubscript:@"d"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setArtistName:v8];
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:@"27"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setBetaExternalVersionIdentifier:v9];
  }
  uint64_t v10 = [v6 objectForKeyedSubscript:@"c"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setBundleID:v10];
  }
  id v11 = [v6 objectForKeyedSubscript:@"20"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setBundleVersion:v11];
  }
  long long v12 = [v6 objectForKeyedSubscript:@"04"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setBuyParams:v12];
  }
  long long v13 = [v6 objectForKeyedSubscript:@"P"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setCancelDownloadURL:v13];
  }
  long long v14 = [v6 objectForKeyedSubscript:@"10"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v45, "setCancelIfDuplicate:", objc_msgSend(v14, "BOOLValue"));
  }
  long long v15 = [v6 objectForKeyedSubscript:@"17"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setClientID:v15];
  }
  id v16 = [v6 objectForKeyedSubscript:@"f"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setCollectionName:v16];
  }
  uint64_t v17 = [v6 objectForKeyedSubscript:@"EE"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setEnableExtensions:v17];
  }
  uint64_t v18 = [v6 objectForKeyedSubscript:@"i"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setGenre:v18];
  }
  long long v19 = [v6 objectForKeyedSubscript:@"6"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setGenreID:v19];
  }
  long long v20 = [v6 objectForKeyedSubscript:@"HM"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v45, "setHasMessagesExtension:", objc_msgSend(v20, "BOOLValue"));
  }
  long long v21 = [v6 objectForKeyedSubscript:@"12"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v45, "setExplicitContent:", objc_msgSend(v21, "BOOLValue"));
  }
  long long v22 = [v6 objectForKeyedSubscript:@"D"];

  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v45, "setIsAutomatic:", objc_msgSend(v22, "integerValue") != 0);
    objc_msgSend(v45, "setIsUpdate:", objc_msgSend(v22, "integerValue") == 2);
  }
  v23 = [v6 objectForKeyedSubscript:@"vp"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v45, "setIsDeviceBasedVPP:", objc_msgSend(v23, "BOOLValue"));
  }
  uint64_t v24 = [v6 objectForKeyedSubscript:@"03"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v45, "setIsInQueue:", objc_msgSend(v24, "BOOLValue"));
  }
  v25 = [v6 objectForKeyedSubscript:@"21"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v45, "setIsPurchasedRedownload:", objc_msgSend(v25, "BOOLValue"));
  }
  v26 = [v6 objectForKeyedSubscript:@"V"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v45, "setIsRestore:", objc_msgSend(v26, "BOOLValue"));
  }
  v27 = [v6 objectForKeyedSubscript:@"7"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setItemID:v27];
  }
  v28 = [v6 objectForKeyedSubscript:@"1"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setKind:v28];
  }
  v29 = [v6 objectForKeyedSubscript:@"LP"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v45, "setLaunchProhibited:", objc_msgSend(v29, "BOOLValue"));
  }
  v30 = [v6 objectForKeyedSubscript:@"MA"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setMessagesArtworkURL:v30];
  }
  v31 = [v6 objectForKeyedSubscript:@"8"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setPurchaseDate:v31];
  }
  v32 = [v6 objectForKeyedSubscript:@"q"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setReleaseDate:v32];
  }
  v33 = [v6 objectForKeyedSubscript:@"U"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setStoreAccountID:v33];
  }
  v34 = [v6 objectForKeyedSubscript:@"Z"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setStoreAccountName:v34];
  }
  v35 = [v6 objectForKeyedSubscript:@"F"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setStoreDownloadKey:v35];
  }
  v36 = [v6 objectForKeyedSubscript:@"9"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setStoreTransactionID:v36];
  }
  v37 = [v6 objectForKeyedSubscript:@"b"];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v45, "setSoftwareIconNeedsShine:", objc_msgSend(v37, "BOOLValue") ^ 1);
  }
  v38 = [v6 objectForKeyedSubscript:@"G"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setThumbnailURL:v38];
  }
  v39 = [v6 objectForKeyedSubscript:@"2"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setTitle:v39];
  }
  v40 = [v6 objectForKeyedSubscript:@"T"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v45 setStorefront:v40];
  }
  else if (objc_opt_respondsToSelector())
  {
    v41 = [v40 stringValue];
    [v45 setStorefront:v41];
  }
  v42 = [v6 objectForKeyedSubscript:@"R"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setSoftwareVersionExternalIdentifier:v42];
  }
  v43 = [v6 objectForKeyedSubscript:@"22"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setStoreCohort:v43];
  }
  v44 = [v6 objectForKeyedSubscript:@"26"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v45 setVariantID:v44];
  }
}

- (void)__app_sendDownloadsChanged:(id)a3 filterSoftware:(BOOL)a4
{
  BOOL v4 = a4;
  accessQueue = self->super._accessQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(accessQueue);
  [(SSDownloadManager *)self _resetAllDownloads];
  if (v4)
  {
    uint64_t v8 = [v7 objectsPassingTest:&__block_literal_global_66];

    v10.receiver = self;
    v10.super_class = (Class)SSDownloadManagerAppShim;
    [(SSDownloadManager *)&v10 _sendDownloadsChanged:v8];
    id v7 = (id)v8;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SSDownloadManagerAppShim;
    [(SSDownloadManager *)&v9 _sendDownloadsChanged:v7];
  }
}

uint64_t __70__SSDownloadManagerAppShim___app_sendDownloadsChanged_filterSoftware___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForProperty:@"1"];
  uint64_t v3 = [v2 isEqualToString:@"software"] ^ 1;

  return v3;
}

- (void).cxx_destruct
{
}

@end