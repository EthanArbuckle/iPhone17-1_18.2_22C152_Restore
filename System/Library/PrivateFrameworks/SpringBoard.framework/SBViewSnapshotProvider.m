@interface SBViewSnapshotProvider
- (BOOL)includeWindowSceneWallpaper;
- (SBViewSnapshotProvider)initWithWindowScene:(id)a3 view:(id)a4 orientation:(int64_t)a5;
- (SBWindowScene)windowScene;
- (double)delay;
- (id)_createSnapshotOfWallpaperAndWindow:(id)a3;
- (id)completionBlock;
- (id)snapshot;
- (void)setCompletionBlock:(id)a3;
- (void)setDelay:(double)a3;
- (void)setIncludeWindowSceneWallpaper:(BOOL)a3;
- (void)snapshotAsynchronously:(BOOL)a3 withImageBlock:(id)a4;
- (void)snapshotWithImageBlock:(id)a3;
@end

@implementation SBViewSnapshotProvider

- (SBViewSnapshotProvider)initWithWindowScene:(id)a3 view:(id)a4 orientation:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBViewSnapshotProvider;
  v10 = [(SBViewSnapshotProvider *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_windowScene, v8);
    objc_storeStrong((id *)&v11->_view, a4);
    v11->_orientation = a5;
    v12 = v11;
  }

  return v11;
}

- (id)snapshot
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__51;
  id v9 = __Block_byref_object_dispose__51;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__SBViewSnapshotProvider_snapshot__block_invoke;
  v4[3] = &unk_1E6B01F20;
  v4[4] = &v5;
  [(SBViewSnapshotProvider *)self snapshotAsynchronously:0 withImageBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__SBViewSnapshotProvider_snapshot__block_invoke(uint64_t a1, void *a2)
{
}

- (void)snapshotWithImageBlock:(id)a3
{
}

- (id)_createSnapshotOfWallpaperAndWindow:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  uint64_t v7 = objc_msgSend(WeakRetained, "windows", 0);

  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    double v11 = *MEMORY[0x1E4F43F20] + -3.0;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        [v13 windowLevel];
        if (v14 == v11)
        {
          [v5 addObject:v13];
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [v5 addObject:v4];
  v15 = (char *)&v32 - ((4 * [v5 count] + 15) & 0xFFFFFFFFFFFFFFF0);
  if ([v5 count])
  {
    unint64_t v16 = 0;
    do
    {
      v17 = [v5 objectAtIndex:v16];
      *(_DWORD *)&v15[4 * v16] = [v17 _contextId];

      ++v16;
    }
    while (v16 < [v5 count]);
  }
  SBScreenBoundsRotatedRoundCenter(self->_orientation);
  v22 = objc_msgSend(MEMORY[0x1E4F43058], "createIOSurfaceWithContextIds:count:frame:", v15, objc_msgSend(v5, "count"), v18, v19, v20, v21);
  if (v22)
  {
    v23 = v22;
    CFTypeID v24 = CFGetTypeID(v22);
    if (v24 == IOSurfaceGetTypeID())
    {
      v25 = [v4 screen];
      v26 = SBCreateUIImageFromIOSurfaceResizingIfNecessary(v23, v25, 1, 1, 0, 0.0, 1.0);
    }
    else
    {
      v26 = 0;
    }
    CFTypeID v27 = CFGetTypeID(v23);
    if (v27 == CGImageGetTypeID())
    {
      v28 = (void *)MEMORY[0x1E4F42A80];
      v29 = [v4 screen];
      [v29 scale];
      uint64_t v30 = objc_msgSend(v28, "imageWithCGImage:scale:orientation:", v23, 0);

      v26 = (void *)v30;
    }
    CFRelease(v23);
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)snapshotAsynchronously:(BOOL)a3 withImageBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6 && self->_view)
  {
    uint64_t v7 = [(SBViewSnapshotProvider *)self windowScene];
    SBScreenBounds(self->_orientation);
    BSRectWithSize();
    v12 = -[SBSnapshotWindow initWithWindowScene:frame:orientation:]([SBSnapshotWindow alloc], "initWithWindowScene:frame:orientation:", v7, self->_orientation, v8, v9, v10, v11);
    [(SBSnapshotWindow *)v12 setWindowLevel:*MEMORY[0x1E4F43F20] + -3.0 + -1.0];
    [(SBSnapshotWindow *)v12 setHidden:0];
    [(SBSnapshotWindow *)v12 addSubview:self->_view];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __64__SBViewSnapshotProvider_snapshotAsynchronously_withImageBlock___block_invoke;
    v19[3] = &unk_1E6AF5FC8;
    v19[4] = self;
    v13 = v12;
    double v20 = v13;
    id v21 = v6;
    double v14 = (void (**)(void))MEMORY[0x1D948C7A0](v19);
    v15 = v14;
    if (v4)
    {
      unint64_t v16 = (void *)*MEMORY[0x1E4F43630];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __64__SBViewSnapshotProvider_snapshotAsynchronously_withImageBlock___block_invoke_2;
      v17[3] = &unk_1E6AF6828;
      v17[4] = self;
      double v18 = v14;
      objc_msgSend(v16, "sb_performBlockAfterCATransactionSynchronizedCommit:", v17);
    }
    else
    {
      [MEMORY[0x1E4F39CF8] flush];
      [MEMORY[0x1E4F39CF8] synchronize];
      v15[2](v15);
    }
  }
}

void __64__SBViewSnapshotProvider_snapshotAsynchronously_withImageBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 24)) {
    [(id)v2 _createSnapshotOfWallpaperAndWindow:*(void *)(a1 + 40)];
  }
  else {
    objc_msgSend(*(id *)(v2 + 8), "sb_snapshotImage");
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 32);
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
  }
  [*(id *)(v3 + 8) removeFromSuperview];
  [*(id *)(a1 + 40) setHidden:1];
}

void __64__SBViewSnapshotProvider_snapshotAsynchronously_withImageBlock___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, (uint64_t)(*(double *)(*(void *)(a1 + 32) + 40) * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SBViewSnapshotProvider_snapshotAsynchronously_withImageBlock___block_invoke_3;
  block[3] = &unk_1E6AF5300;
  id v4 = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __64__SBViewSnapshotProvider_snapshotAsynchronously_withImageBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (BOOL)includeWindowSceneWallpaper
{
  return self->_includeWindowSceneWallpaper;
}

- (void)setIncludeWindowSceneWallpaper:(BOOL)a3
{
  self->_includeWindowSceneWallpaper = a3;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end