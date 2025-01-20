@interface PXStorySongResourcePreloadingOperation
- (NSProgress)progress;
- (OS_dispatch_queue)queue;
- (PXAudioSession)session;
- (PXStorySongResource)resource;
- (PXStorySongResourcePreloadingOperation)init;
- (PXStorySongResourcePreloadingOperation)initWithSongResource:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)px_start;
- (void)setQueue:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation PXStorySongResourcePreloadingOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setSession:(id)a3
{
}

- (PXAudioSession)session
{
  return self->_session;
}

- (PXStorySongResource)resource
{
  return self->_resource;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 256, 1);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 0xA) != 0 && SessionContext == (void)a5)
  {
    id v7 = [(PXStorySongResourcePreloadingOperation *)self session];
    if (([v7 isReadyToPlay] & 1) != 0 || objc_msgSend(v7, "status") == 4) {
      [(PXAsyncOperation *)self px_finishIfPossible];
    }
  }
}

- (void)px_start
{
  v3 = [(PXStorySongResourcePreloadingOperation *)self resource];
  v4 = objc_msgSend(v3, "px_storyResourceSongAsset");

  id v5 = objc_alloc((Class)[v4 audioSessionClass]);
  queue = self->_queue;
  long long v8 = *MEMORY[0x1E4F1FA48];
  uint64_t v9 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  id v7 = (void *)[v5 initWithAsset:v4 volume:&v8 startTime:queue queue:0 audioSessionDelegate:0.0];
  [v7 registerChangeObserver:self context:SessionContext];
  [(PXStorySongResourcePreloadingOperation *)self setSession:v7];
  [v7 performChanges:&__block_literal_global_25080];
}

uint64_t __50__PXStorySongResourcePreloadingOperation_px_start__block_invoke(uint64_t a1, void *a2)
{
  return [a2 prepareToPlay];
}

- (PXStorySongResourcePreloadingOperation)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStorySongResourcePreloadingOperation.m", 44, @"%s is not available as initializer", "-[PXStorySongResourcePreloadingOperation init]");

  abort();
}

- (PXStorySongResourcePreloadingOperation)initWithSongResource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXStorySongResourcePreloadingOperation;
  v6 = [(PXAsyncOperation *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resource, a3);
    uint64_t v8 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
    progress = v7->_progress;
    v7->_progress = (NSProgress *)v8;

    px_dispatch_queue_create();
  }

  return 0;
}

@end