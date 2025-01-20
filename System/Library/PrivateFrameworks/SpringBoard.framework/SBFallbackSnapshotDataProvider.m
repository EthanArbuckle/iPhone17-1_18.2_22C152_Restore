@interface SBFallbackSnapshotDataProvider
- (SBFallbackSnapshotDataProvider)initWithSceneSnapshot:(id)a3 scaleFactor:(double)a4;
- (XBSnapshotDataProviderContext)context;
- (id)IOSurfaceForFormat:(int64_t)a3;
- (id)fetchImageForFormat:(int64_t)a3;
- (void)_invalidateSnapshotData;
@end

@implementation SBFallbackSnapshotDataProvider

- (SBFallbackSnapshotDataProvider)initWithSceneSnapshot:(id)a3 scaleFactor:(double)a4
{
  id v8 = a3;
  if (!v8)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SBSnapshotDataProvider.m", 213, @"Invalid parameter not satisfying: %@", @"snapshot" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)SBFallbackSnapshotDataProvider;
  v9 = [(SBFallbackSnapshotDataProvider *)&v22 init];
  v10 = v9;
  if (v9)
  {
    v9->_scaleFactor = a4;
    objc_storeStrong((id *)&v9->_snapshot, a3);
    v11 = objc_alloc_init(SBSnapshotDataProviderContext);
    context = v10->_context;
    v10->_context = v11;

    v13 = v10->_context;
    v14 = [v8 context];
    v15 = [v14 sceneID];
    [(SBSnapshotDataProviderContext *)v13 setSceneID:v15];

    v16 = v10->_context;
    v17 = [v8 context];
    [v17 scale];
    -[XBSnapshotDataProviderContext setScale:](v16, "setScale:");

    v18 = v10->_context;
    v19 = [v8 context];
    -[XBSnapshotDataProviderContext setOpaque:](v18, "setOpaque:", [v19 isOpaque]);
  }
  return v10;
}

- (id)IOSurfaceForFormat:(int64_t)a3
{
  v5 = [(FBSceneSnapshot *)self->_snapshot fallbackIOSurface];
  v6 = self;
  objc_sync_enter(v6);
  if (v5 && (BSFloatIsOne() & 1) == 0)
  {
    processedSurface = v6->_processedSurface;
    if (!processedSurface)
    {
      uint64_t v8 = SBCreateScaledIOSurface(v5, (unint64_t)(a3 - 1) < 2, v6->_scaleFactor);
      v9 = v6->_processedSurface;
      v6->_processedSurface = (IOSurface *)v8;

      processedSurface = v6->_processedSurface;
    }
    v10 = processedSurface;

    v5 = v10;
  }
  objc_sync_exit(v6);

  return v5;
}

- (id)fetchImageForFormat:(int64_t)a3
{
  cachedImage = self->_cachedImage;
  if (!cachedImage)
  {
    -[SBFallbackSnapshotDataProvider IOSurfaceForFormat:](self, "IOSurfaceForFormat:");
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      [(XBSnapshotDataProviderContext *)self->_context scale];
      SBCreateUIImageFromIOSurfaceResizingIfNecessary(v7, 0, 0, [(XBSnapshotDataProviderContext *)self->_context isOpaque], (unint64_t)(a3 - 1) < 2, v8, 1.0);
      v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
    v9 = self->_cachedImage;
    self->_cachedImage = v6;

    [(SBFallbackSnapshotDataProvider *)self _invalidateSnapshotData];
    cachedImage = self->_cachedImage;
  }
  return cachedImage;
}

- (void)_invalidateSnapshotData
{
  processedSurface = self->_processedSurface;
  self->_processedSurface = 0;

  snapshot = self->_snapshot;
  self->_snapshot = 0;

  context = self->_context;
  self->_context = 0;
}

- (XBSnapshotDataProviderContext)context
{
  return &self->_context->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedSurface, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end