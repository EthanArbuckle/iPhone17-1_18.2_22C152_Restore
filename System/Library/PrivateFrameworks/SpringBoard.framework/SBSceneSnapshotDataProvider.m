@interface SBSceneSnapshotDataProvider
- (BOOL)hasProtectedContent;
- (SBSceneSnapshotDataProvider)initWithSceneSnapshot:(id)a3 scaleFactor:(double)a4;
- (XBSnapshotDataProviderContext)context;
- (id)IOSurfaceForFormat:(int64_t)a3;
- (id)fallbackSnapshotDataProvider;
- (id)fetchImageForFormat:(int64_t)a3;
- (void)_invalidateSnapshotData;
@end

@implementation SBSceneSnapshotDataProvider

- (SBSceneSnapshotDataProvider)initWithSceneSnapshot:(id)a3 scaleFactor:(double)a4
{
  id v8 = a3;
  if (!v8)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SBSnapshotDataProvider.m", 69, @"Invalid parameter not satisfying: %@", @"snapshot" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)SBSceneSnapshotDataProvider;
  v9 = [(SBSceneSnapshotDataProvider *)&v22 init];
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
  v5 = [(FBSceneSnapshot *)self->_snapshot IOSurface];
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

- (id)fallbackSnapshotDataProvider
{
  fallbackSnapshotDataProvider = self->_fallbackSnapshotDataProvider;
  if (!fallbackSnapshotDataProvider)
  {
    v4 = [[SBFallbackSnapshotDataProvider alloc] initWithSceneSnapshot:self->_snapshot scaleFactor:self->_scaleFactor];
    v5 = self->_fallbackSnapshotDataProvider;
    self->_fallbackSnapshotDataProvider = v4;

    fallbackSnapshotDataProvider = self->_fallbackSnapshotDataProvider;
  }
  return fallbackSnapshotDataProvider;
}

- (BOOL)hasProtectedContent
{
  snapshot = self->_snapshot;
  if (!snapshot) {
    return self->_hasProtectedContent;
  }
  BOOL result = [(FBSceneSnapshot *)snapshot hasProtectedContent];
  self->_hasProtectedContent = result;
  return result;
}

- (id)fetchImageForFormat:(int64_t)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  cachedImage = self->_cachedImage;
  if (!cachedImage)
  {
    v6 = -[SBSceneSnapshotDataProvider IOSurfaceForFormat:](self, "IOSurfaceForFormat:");
    if (v6)
    {
      int v7 = [(SBSceneSnapshotDataProvider *)self hasProtectedContent];
      [(XBSnapshotDataProviderContext *)self->_context scale];
      SBCreateUIImageFromIOSurfaceResizingIfNecessary(v6, 0, v7, [(XBSnapshotDataProviderContext *)self->_context isOpaque], (unint64_t)(a3 - 1) < 2, v8, 1.0);
      v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F42A80];
      uint64_t v13 = [(FBSceneSnapshot *)self->_snapshot CGImage];
      [(XBSnapshotDataProviderContext *)self->_context scale];
      objc_msgSend(v12, "imageWithCGImage:scale:orientation:", v13, 0);
      v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
      if (v9 && (BSFloatIsOne() & 1) == 0)
      {
        memset(&v33, 0, sizeof(v33));
        CGAffineTransformMakeScale(&v33, self->_scaleFactor, self->_scaleFactor);
        [(UIImage *)v9 size];
        BSRectWithSize();
        *(CGAffineTransform *)v34 = v33;
        CGRectApplyAffineTransform(v39, (CGAffineTransform *)v34);
        [(XBSnapshotDataProviderContext *)self->_context scale];
        UIRectIntegralWithScale();
        double v17 = v16;
        double v19 = v18;
        double v20 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        if (*MEMORY[0x1E4F1DB30] == v14 && v20 == v15)
        {
          v28 = SBLogSceneSnapshots();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = [(SBSnapshotDataProviderContext *)self->_context sceneID];
            [(UIImage *)v9 size];
            v30 = NSStringFromSize(v38);
            double scaleFactor = self->_scaleFactor;
            [(XBSnapshotDataProviderContext *)self->_context scale];
            *(_DWORD *)v34 = 138544386;
            *(void *)&v34[4] = v29;
            *(_WORD *)&v34[12] = 2048;
            *(void *)&v34[14] = v9;
            *(_WORD *)&v34[22] = 2114;
            *(void *)&v34[24] = v30;
            *(_WORD *)&v34[32] = 2048;
            *(double *)&v34[34] = scaleFactor;
            *(_WORD *)&v34[42] = 2048;
            *(void *)&v34[44] = v32;
            _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "Can't create 0-size image for '%{public}@' (image %p, %{public}@, scaleFactor %f, context scale %f) ", v34, 0x34u);
          }
          v9 = 0;
        }
        else
        {
          double v22 = v14;
          double v23 = v15;
          BOOL v24 = [(XBSnapshotDataProviderContext *)self->_context isOpaque];
          [(XBSnapshotDataProviderContext *)self->_context scale];
          CGFloat v26 = v25;
          v37.width = v22;
          v37.height = v23;
          UIGraphicsBeginImageContextWithOptions(v37, v24, v26);
          -[UIImage drawInRect:](v9, "drawInRect:", v17, v19, v22, v23);
          uint64_t v27 = UIGraphicsGetImageFromCurrentImageContext();

          UIGraphicsEndImageContext();
          v9 = (UIImage *)v27;
        }
      }
    }
    v10 = self->_cachedImage;
    self->_cachedImage = v9;

    [(SBSceneSnapshotDataProvider *)self _invalidateSnapshotData];
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

  fallbackSnapshotDataProvider = self->_fallbackSnapshotDataProvider;
  self->_fallbackSnapshotDataProvider = 0;
}

- (XBSnapshotDataProviderContext)context
{
  return &self->_context->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedSurface, 0);
  objc_storeStrong((id *)&self->_fallbackSnapshotDataProvider, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end