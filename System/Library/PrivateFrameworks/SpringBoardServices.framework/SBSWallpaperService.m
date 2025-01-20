@interface SBSWallpaperService
- (BOOL)setWallpaperColor:(id)a3 darkColor:(id)a4 forVariants:(unint64_t)a5;
- (BOOL)setWallpaperColorName:(id)a3 forVariants:(unint64_t)a4;
- (BOOL)setWallpaperGradient:(id)a3 forVariants:(unint64_t)a4;
- (BOOL)setWallpaperWithVideoWithWallpaperMode:(id)a3 cropRect:(CGRect)a4 wallpaperMode:(int64_t)a5;
- (SBSWallpaperService)init;
- (unint64_t)posterSignificantEventsCounter;
- (unint64_t)significantEventsCounterForPosterWithIdentifier:(id)a3;
- (void)dealloc;
- (void)fetchContentCutoutBoundsForVariant:(int64_t)a3 orientation:(int64_t)a4 completionHandler:(id)a5;
- (void)fetchLimitedOcclusionBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4;
- (void)fetchLockScreenContentCutoutBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4;
- (void)fetchLockScreenTimeBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4;
- (void)fetchMaximalLockScreenContentCutoutBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4;
- (void)fetchObscurableBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4;
- (void)fetchOriginalImageForVariant:(int64_t)a3 completionHandler:(id)a4;
- (void)fetchOriginalVideoURLForVariant:(int64_t)a3 completionHandler:(id)a4;
- (void)fetchPosterSignificantEventsCounterWithCompletionHandler:(id)a3;
- (void)fetchThumbnailForVariant:(int64_t)a3 completionHandler:(id)a4;
- (void)handleQuickActionConfigurationRequest:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)restoreDefaultWallpaperWithCompletion:(id)a3;
- (void)triggerPosterSignificantEventWithCompletion:(id)a3;
@end

@implementation SBSWallpaperService

- (SBSWallpaperService)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBSWallpaperService;
  v2 = [(SBSWallpaperService *)&v8 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)Serial;

    v5 = [[SBSWallpaperClient alloc] initWithCalloutQueue:v2->_callbackQueue];
    client = v2->_client;
    v2->_client = v5;
  }
  return v2;
}

- (void)dealloc
{
  if (!self->_wasInvalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"SBSWallpaperService.m", 34, @"%@: you must call -invalidate before releasing", objc_opt_class() object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBSWallpaperService;
  [(SBSWallpaperService *)&v5 dealloc];
}

- (void)invalidate
{
  self->_wasInvalidated = 1;
}

- (void)handleQuickActionConfigurationRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79__SBSWallpaperService_handleQuickActionConfigurationRequest_completionHandler___block_invoke;
    v10[3] = &unk_1E566B930;
    v11 = v7;
    id v12 = v6;
    v9 = v7;
    [(SBSWallpaperClient *)client handleQuickActionConfigurationRequest:a3 completionHandler:v10];
  }
}

void __79__SBSWallpaperService_handleQuickActionConfigurationRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__SBSWallpaperService_handleQuickActionConfigurationRequest_completionHandler___block_invoke_2;
  v7[3] = &unk_1E566B4B0;
  v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __79__SBSWallpaperService_handleQuickActionConfigurationRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchThumbnailForVariant:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__SBSWallpaperService_fetchThumbnailForVariant_completionHandler___block_invoke;
    v10[3] = &unk_1E566B598;
    v11 = v7;
    id v12 = v6;
    id v9 = v7;
    [(SBSWallpaperClient *)client fetchThumbnailForVariant:a3 completionHandler:v10];
  }
}

void __66__SBSWallpaperService_fetchThumbnailForVariant_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__SBSWallpaperService_fetchThumbnailForVariant_completionHandler___block_invoke_2;
  v7[3] = &unk_1E566B4B0;
  v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __66__SBSWallpaperService_fetchThumbnailForVariant_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchOriginalImageForVariant:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__SBSWallpaperService_fetchOriginalImageForVariant_completionHandler___block_invoke;
    v10[3] = &unk_1E566B598;
    v11 = v7;
    id v12 = v6;
    id v9 = v7;
    [(SBSWallpaperClient *)client fetchOriginalImageForVariant:a3 completionHandler:v10];
  }
}

void __70__SBSWallpaperService_fetchOriginalImageForVariant_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SBSWallpaperService_fetchOriginalImageForVariant_completionHandler___block_invoke_2;
  v7[3] = &unk_1E566B4B0;
  v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __70__SBSWallpaperService_fetchOriginalImageForVariant_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchOriginalVideoURLForVariant:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__SBSWallpaperService_fetchOriginalVideoURLForVariant_completionHandler___block_invoke;
    v10[3] = &unk_1E566BFE8;
    v11 = v7;
    id v12 = v6;
    id v9 = v7;
    [(SBSWallpaperClient *)client fetchOriginalVideoURLForVariant:a3 completionHandler:v10];
  }
}

void __73__SBSWallpaperService_fetchOriginalVideoURLForVariant_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__SBSWallpaperService_fetchOriginalVideoURLForVariant_completionHandler___block_invoke_2;
  v7[3] = &unk_1E566B4B0;
  v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __73__SBSWallpaperService_fetchOriginalVideoURLForVariant_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchContentCutoutBoundsForVariant:(int64_t)a3 orientation:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    id v9 = self->_callbackQueue;
    client = self->_client;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__SBSWallpaperService_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke;
    v12[3] = &unk_1E566C038;
    v13 = v9;
    id v14 = v8;
    v11 = v9;
    [(SBSWallpaperClient *)client fetchContentCutoutBoundsForVariant:a3 orientation:a4 completionHandler:v12];
  }
}

void __88__SBSWallpaperService_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__SBSWallpaperService_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke_2;
  block[3] = &unk_1E566C010;
  id v9 = *(NSObject **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  double v12 = a2;
  double v13 = a3;
  double v14 = a4;
  double v15 = a5;
  dispatch_async(v9, block);
}

uint64_t __88__SBSWallpaperService_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, double, double, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)fetchLockScreenContentCutoutBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __90__SBSWallpaperService_fetchLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke;
    v10[3] = &unk_1E566C038;
    id v11 = v7;
    id v12 = v6;
    id v9 = v7;
    [(SBSWallpaperClient *)client fetchLockScreenContentCutoutBoundsForOrientation:a3 completionHandler:v10];
  }
}

void __90__SBSWallpaperService_fetchLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__SBSWallpaperService_fetchLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke_2;
  block[3] = &unk_1E566C010;
  id v9 = *(NSObject **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  double v12 = a2;
  double v13 = a3;
  double v14 = a4;
  double v15 = a5;
  dispatch_async(v9, block);
}

uint64_t __90__SBSWallpaperService_fetchLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, double, double, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)fetchMaximalLockScreenContentCutoutBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __97__SBSWallpaperService_fetchMaximalLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke;
    v10[3] = &unk_1E566C038;
    id v11 = v7;
    id v12 = v6;
    id v9 = v7;
    [(SBSWallpaperClient *)client fetchMaximalLockScreenContentCutoutBoundsForOrientation:a3 completionHandler:v10];
  }
}

void __97__SBSWallpaperService_fetchMaximalLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__SBSWallpaperService_fetchMaximalLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke_2;
  block[3] = &unk_1E566C010;
  id v9 = *(NSObject **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  double v12 = a2;
  double v13 = a3;
  double v14 = a4;
  double v15 = a5;
  dispatch_async(v9, block);
}

uint64_t __97__SBSWallpaperService_fetchMaximalLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, double, double, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)fetchObscurableBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__SBSWallpaperService_fetchObscurableBoundsForOrientation_completionHandler___block_invoke;
    v10[3] = &unk_1E566C038;
    id v11 = v7;
    id v12 = v6;
    id v9 = v7;
    [(SBSWallpaperClient *)client fetchObscurableBoundsForOrientation:a3 completionHandler:v10];
  }
}

void __77__SBSWallpaperService_fetchObscurableBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__SBSWallpaperService_fetchObscurableBoundsForOrientation_completionHandler___block_invoke_2;
  block[3] = &unk_1E566C010;
  id v9 = *(NSObject **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  double v12 = a2;
  double v13 = a3;
  double v14 = a4;
  double v15 = a5;
  dispatch_async(v9, block);
}

uint64_t __77__SBSWallpaperService_fetchObscurableBoundsForOrientation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, double, double, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)fetchLimitedOcclusionBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__SBSWallpaperService_fetchLimitedOcclusionBoundsForOrientation_completionHandler___block_invoke;
    v10[3] = &unk_1E566C038;
    id v11 = v7;
    id v12 = v6;
    id v9 = v7;
    [(SBSWallpaperClient *)client fetchLimitedOcclusionBoundsForOrientation:a3 completionHandler:v10];
  }
}

void __83__SBSWallpaperService_fetchLimitedOcclusionBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__SBSWallpaperService_fetchLimitedOcclusionBoundsForOrientation_completionHandler___block_invoke_2;
  block[3] = &unk_1E566C010;
  id v9 = *(NSObject **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  double v12 = a2;
  double v13 = a3;
  double v14 = a4;
  double v15 = a5;
  dispatch_async(v9, block);
}

uint64_t __83__SBSWallpaperService_fetchLimitedOcclusionBoundsForOrientation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, double, double, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)fetchLockScreenTimeBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__SBSWallpaperService_fetchLockScreenTimeBoundsForOrientation_completionHandler___block_invoke;
    v10[3] = &unk_1E566C038;
    id v11 = v7;
    id v12 = v6;
    id v9 = v7;
    [(SBSWallpaperClient *)client fetchLockScreenTimeBoundsForOrientation:a3 completionHandler:v10];
  }
}

void __81__SBSWallpaperService_fetchLockScreenTimeBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__SBSWallpaperService_fetchLockScreenTimeBoundsForOrientation_completionHandler___block_invoke_2;
  block[3] = &unk_1E566C010;
  id v9 = *(NSObject **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  double v12 = a2;
  double v13 = a3;
  double v14 = a4;
  double v15 = a5;
  dispatch_async(v9, block);
}

uint64_t __81__SBSWallpaperService_fetchLockScreenTimeBoundsForOrientation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, double, double, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)setWallpaperWithVideoWithWallpaperMode:(id)a3 cropRect:(CGRect)a4 wallpaperMode:(int64_t)a5
{
  return -[SBSWallpaperClient setWallpaperWithVideoWithWallpaperMode:cropRect:wallpaperMode:](self->_client, "setWallpaperWithVideoWithWallpaperMode:cropRect:wallpaperMode:", a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (BOOL)setWallpaperColorName:(id)a3 forVariants:(unint64_t)a4
{
  return [(SBSWallpaperClient *)self->_client setWallpaperColorName:a3 forVariants:a4];
}

- (BOOL)setWallpaperColor:(id)a3 darkColor:(id)a4 forVariants:(unint64_t)a5
{
  return [(SBSWallpaperClient *)self->_client setWallpaperColor:a3 darkColor:a4 forVariants:a5];
}

- (BOOL)setWallpaperGradient:(id)a3 forVariants:(unint64_t)a4
{
  return [(SBSWallpaperClient *)self->_client setWallpaperGradient:a3 forVariants:a4];
}

- (void)restoreDefaultWallpaperWithCompletion:(id)a3
{
}

- (void)triggerPosterSignificantEventWithCompletion:(id)a3
{
}

- (unint64_t)significantEventsCounterForPosterWithIdentifier:(id)a3
{
  return [(SBSWallpaperClient *)self->_client significantEventsCounterForPosterWithIdentifier:a3];
}

- (unint64_t)posterSignificantEventsCounter
{
  return [(SBSWallpaperClient *)self->_client posterSignificantEventsCounter];
}

- (void)fetchPosterSignificantEventsCounterWithCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end