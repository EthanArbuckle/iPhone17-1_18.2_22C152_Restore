@interface PLCloudSharingResetJob
+ (void)resetAllLocalState;
- (int64_t)daemonOperation;
- (void)runDaemonSide;
@end

@implementation PLCloudSharingResetJob

- (void)runDaemonSide
{
  v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudSharingResetJob runDaemonSide]"];
  v4 = [(id)objc_opt_class() lowPriorityOperationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__PLCloudSharingResetJob_runDaemonSide__block_invoke;
  v6[3] = &unk_1E5875E18;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v4 addOperationWithBlock:v6];
}

void __39__PLCloudSharingResetJob_runDaemonSide__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F38D3B0]();
  v3 = [*(id *)(a1 + 32) transientPhotoLibrary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PLCloudSharingResetJob_runDaemonSide__block_invoke_2;
  v7[3] = &unk_1E5875CE0;
  id v8 = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__PLCloudSharingResetJob_runDaemonSide__block_invoke_3;
  v6[3] = &unk_1E5875CE0;
  v6[4] = *(void *)(a1 + 32);
  id v4 = v3;
  [v4 performTransactionAndWait:v7 completionHandler:v6];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)PLCloudSharingResetJob;
  objc_msgSendSuper2(&v5, sel_runDaemonSide);
  [*(id *)(a1 + 40) stillAlive];
}

void __39__PLCloudSharingResetJob_runDaemonSide__block_invoke_2(uint64_t a1)
{
  id v2 = +[PLAssetTransactionReason transactionReason:@"[PLCloudSharingResetJob]Resetting Shared Streams."];
  +[PLCloudSharingEnablingJob deleteAllLocalSharedAlbumsInLibrary:*(void *)(a1 + 32) keepPendingAlbums:0 withReason:v2];
}

void __39__PLCloudSharingResetJob_runDaemonSide__block_invoke_3(uint64_t a1)
{
  id v2 = +[PLNotificationManager sharedManager];
  [v2 discardAllNotifications];

  v3 = [PLCloudFeedEntriesManager alloc];
  id v4 = [*(id *)(a1 + 32) transientPhotoLibrary];
  objc_super v5 = [(PLCloudFeedEntriesManager *)v3 initWithPhotoLibrary:v4];

  [(PLCloudFeedEntriesManager *)v5 rebuildAllEntries:0];
}

- (int64_t)daemonOperation
{
  return 10;
}

+ (void)resetAllLocalState
{
  id v2 = (id)objc_opt_new();
  [v2 runAndWaitForMessageToBeSent];
}

@end