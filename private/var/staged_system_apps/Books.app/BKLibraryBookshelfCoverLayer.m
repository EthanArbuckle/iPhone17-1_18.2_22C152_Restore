@interface BKLibraryBookshelfCoverLayer
- (BCCacheVendedLayer)imageLayer;
- (BCCacheVendedLayer)preloadedImageLayer;
- (BCCacheVendedLayerDelegate)vendedLayerDelegate;
- (BCUCoverEffectsEnvironment)coverEffectsEnvironment;
- (BKLibraryAsset)libraryAsset;
- (BKLibraryBookshelfCoverLayer)init;
- (BOOL)animateFrameChange;
- (BOOL)bottomAligned;
- (CGRect)coverBounds;
- (CGRect)coverFrame;
- (CGSize)coverSize;
- (UIBezierPath)boundingPath;
- (UIImage)image;
- (id)_cachedCoverIdentifier;
- (void)_layoutImagelayer;
- (void)_reloadCoverImage;
- (void)dealloc;
- (void)preloadCoverImageAtSize:(CGSize)a3;
- (void)setAnimateFrameChange:(BOOL)a3;
- (void)setBottomAligned:(BOOL)a3;
- (void)setBoundingPath:(id)a3;
- (void)setCoverEffectsEnvironment:(id)a3;
- (void)setCoverFrame:(CGRect)a3;
- (void)setCoverSize:(CGSize)a3;
- (void)setImage:(id)a3;
- (void)setImageLayer:(id)a3;
- (void)setLibraryAsset:(id)a3;
- (void)setLibraryAsset:(id)a3 size:(CGSize)a4;
- (void)setPreloadedImageLayer:(id)a3;
- (void)setVendedLayerDelegate:(id)a3;
@end

@implementation BKLibraryBookshelfCoverLayer

- (BKLibraryBookshelfCoverLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfCoverLayer;
  result = [(BKLibraryBookshelfCoverLayer *)&v3 init];
  if (result) {
    result->_bottomAligned = 1;
  }
  return result;
}

- (void)dealloc
{
  [(BKLibraryBookshelfCoverLayer *)self setLibraryAsset:0];
  [(BKLibraryBookshelfCoverLayer *)self setCoverEffectsEnvironment:0];
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfCoverLayer;
  [(BKLibraryBookshelfCoverLayer *)&v3 dealloc];
}

- (void)_layoutImagelayer
{
  [(BKLibraryBookshelfCoverLayer *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  rect_16.size.width = v7;
  rect_16.size.height = v9;
  rect_16.origin.x = v3;
  rect_16.origin.y = v5;
  if ([(BKLibraryBookshelfCoverLayer *)self animateFrameChange])
  {
    v11 = [(BKLibraryBookshelfCoverLayer *)self imageLayer];
    [v11 bounds];
    CGFloat v13 = v12;
    CGFloat rect = v12;
    CGFloat rect_8 = v14;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v36.origin.x = v4;
    v36.origin.y = v6;
    v36.size.width = v8;
    v36.size.height = v10;
    double Width = CGRectGetWidth(v36);
    v37.origin.x = v13;
    v37.origin.y = rect_8;
    v37.size.width = v16;
    v37.size.height = v18;
    double v20 = Width / CGRectGetWidth(v37);
    v38.origin.x = v4;
    v38.origin.y = v6;
    v38.size.width = v8;
    v38.size.height = v10;
    double Height = CGRectGetHeight(v38);
    v39.origin.x = rect;
    v39.origin.y = rect_8;
    v39.size.width = v16;
    v39.size.height = v18;
    double v22 = Height / CGRectGetHeight(v39);
    if (v20 < v22) {
      double v22 = v20;
    }
    CGAffineTransformMakeScale(&v35, v22, v22);
    v23 = [(BKLibraryBookshelfCoverLayer *)self imageLayer];
    CGAffineTransform v34 = v35;
    [v23 setAffineTransform:&v34];
  }
  else
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
  }
  unsigned int v24 = [(BKLibraryBookshelfCoverLayer *)self bottomAligned];
  v25 = [(BKLibraryBookshelfCoverLayer *)self imageLayer];
  v26 = v25;
  if (v24)
  {
    [v25 setAnchorPoint:0.5, 1.0];

    double MidX = CGRectGetMidX(rect_16);
    double MaxY = CGRectGetMaxY(rect_16);
  }
  else
  {
    [v25 setAnchorPoint:0.5, 0.5];

    double MidX = CGRectGetMidX(rect_16);
    double MaxY = CGRectGetMidY(rect_16);
  }
  double v29 = MaxY;
  v30 = [(BKLibraryBookshelfCoverLayer *)self imageLayer];
  [v30 setPosition:MidX, v29];

  if (![(BKLibraryBookshelfCoverLayer *)self animateFrameChange]) {
    +[CATransaction commit];
  }
}

- (CGRect)coverBounds
{
  v2 = [(BKLibraryBookshelfCoverLayer *)self imageLayer];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setLibraryAsset:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v8 = (BKLibraryAsset *)a3;
  libraryAsset = self->_libraryAsset;
  double v14 = v8;
  if (libraryAsset == v8)
  {
    [(BKLibraryBookshelfCoverLayer *)self coverSize];
    if (v11 == width && v10 == height) {
      goto LABEL_10;
    }
    libraryAsset = self->_libraryAsset;
    double v8 = v14;
  }
  if (libraryAsset != v8) {
    [(BKLibraryBookshelfCoverLayer *)self setPreloadedImageLayer:0];
  }
  objc_storeStrong((id *)&self->_libraryAsset, a3);
  boundingPath = self->_boundingPath;
  self->_boundingPath = 0;

  -[BKLibraryBookshelfCoverLayer setCoverSize:](self, "setCoverSize:", width, height);
  [(BKLibraryBookshelfCoverLayer *)self _reloadCoverImage];
LABEL_10:
}

- (void)preloadCoverImageAtSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(BKLibraryBookshelfCoverLayer *)self libraryAsset];
  double v7 = [v6 permanentOrTemporaryAssetID];
  id v8 = [v7 length];

  if (v8)
  {
    double v9 = [(BKLibraryBookshelfCoverLayer *)self libraryAsset];
    double v10 = [(BKLibraryBookshelfCoverLayer *)self coverEffectsEnvironment];
    id v11 = +[BKLibraryManager processingOptionsFor:v9 coverEffectsEnvironment:v10];

    objc_opt_class();
    double v12 = +[BCCacheManager defaultCacheManager];
    double v13 = [(BKLibraryBookshelfCoverLayer *)self _cachedCoverIdentifier];
    double v14 = [v12 fetchLayerForAssetID:v13 size:v11 options:width, height];
    BUDynamicCast();
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    double v15 = [(BKLibraryBookshelfCoverLayer *)self vendedLayerDelegate];
    [v16 setVendedLayerDelegate:v15];

    [(BKLibraryBookshelfCoverLayer *)self setPreloadedImageLayer:v16];
  }
}

- (void)_reloadCoverImage
{
  double v3 = [(BKLibraryBookshelfCoverLayer *)self imageLayer];
  [v3 removeFromSuperlayer];

  double v4 = [(BKLibraryBookshelfCoverLayer *)self libraryAsset];
  double v5 = [v4 permanentOrTemporaryAssetID];
  id v6 = [v5 length];

  if (!v6) {
    return;
  }
  id v24 = [(BKLibraryBookshelfCoverLayer *)self preloadedImageLayer];
  if (!v24) {
    goto LABEL_8;
  }
  [(BKLibraryBookshelfCoverLayer *)self coverSize];
  CGSizeScaleToScreen();
  double v8 = v7;
  double v10 = v9;
  id v11 = [v24 describedImageRequested];
  [v11 imageSize];
  double v13 = v12;
  double v15 = v14;

  if (v13 != v8 || v15 != v10)
  {
    [(BKLibraryBookshelfCoverLayer *)self setPreloadedImageLayer:0];
LABEL_8:
    id v16 = [(BKLibraryBookshelfCoverLayer *)self libraryAsset];
    double v17 = [(BKLibraryBookshelfCoverLayer *)self coverEffectsEnvironment];
    id v18 = +[BKLibraryManager processingOptionsFor:v16 coverEffectsEnvironment:v17];

    objc_opt_class();
    v19 = +[BCCacheManager defaultCacheManager];
    double v20 = [(BKLibraryBookshelfCoverLayer *)self _cachedCoverIdentifier];
    [(BKLibraryBookshelfCoverLayer *)self coverSize];
    v21 = [v19 fetchLayerForAssetID:v20 size:v18];
    double v22 = BUDynamicCast();

    v23 = [(BKLibraryBookshelfCoverLayer *)self vendedLayerDelegate];
    [v22 setVendedLayerDelegate:v23];

    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(BKLibraryBookshelfCoverLayer *)self addSublayer:v22];
    [(BKLibraryBookshelfCoverLayer *)self setImageLayer:v22];
    [(BKLibraryBookshelfCoverLayer *)self _layoutImagelayer];
    +[CATransaction commit];

    goto LABEL_9;
  }
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(BKLibraryBookshelfCoverLayer *)self addSublayer:v24];
  [(BKLibraryBookshelfCoverLayer *)self setImageLayer:v24];
  [(BKLibraryBookshelfCoverLayer *)self _layoutImagelayer];
  +[CATransaction commit];
  [(BKLibraryBookshelfCoverLayer *)self setPreloadedImageLayer:0];
LABEL_9:
}

- (id)_cachedCoverIdentifier
{
  double v3 = [(BKLibraryBookshelfCoverLayer *)self libraryAsset];
  unsigned int v4 = [v3 iTunesU];
  if (v4
    && ([v3 temporaryAssetID],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 length]))
  {
    double v5 = [v3 temporaryAssetID];
  }
  else
  {
    double v5 = [v3 permanentOrTemporaryAssetID];
    if (!v4) {
      goto LABEL_6;
    }
  }

LABEL_6:

  return v5;
}

- (UIBezierPath)boundingPath
{
  if (!self->_boundingPath)
  {
    double v3 = [(BKLibraryBookshelfCoverLayer *)self imageLayer];
    unsigned int v4 = [v3 describedImageShown];
    id v5 = [v4 stackOutline];

    if (v5)
    {
      id v6 = +[UIBezierPath bezierPathWithCGPath:v5];
      boundingPath = self->_boundingPath;
      self->_boundingPath = v6;

      [(UIBezierPath *)self->_boundingPath bounds];
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      [(BKLibraryBookshelfCoverLayer *)self bounds];
      double Height = CGRectGetHeight(v25);
      v26.origin.x = v9;
      v26.origin.y = v11;
      v26.size.double width = v13;
      v26.size.double height = v15;
      double v17 = Height - CGRectGetHeight(v26);
      v27.origin.x = v9;
      v27.origin.y = v11;
      v27.size.double width = v13;
      v27.size.double height = v15;
      CGFloat v18 = v17 - CGRectGetMinY(v27);
      v19 = self->_boundingPath;
      v28.origin.x = v9;
      v28.origin.y = v11;
      v28.size.double width = v13;
      v28.size.double height = v15;
      CGFloat MinX = CGRectGetMinX(v28);
      CGAffineTransformMakeTranslation(&v23, -MinX, v18);
      [(UIBezierPath *)v19 applyTransform:&v23];
    }
  }
  v21 = self->_boundingPath;

  return v21;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (BKLibraryAsset)libraryAsset
{
  return self->_libraryAsset;
}

- (void)setLibraryAsset:(id)a3
{
}

- (BCUCoverEffectsEnvironment)coverEffectsEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverEffectsEnvironment);

  return (BCUCoverEffectsEnvironment *)WeakRetained;
}

- (void)setCoverEffectsEnvironment:(id)a3
{
}

- (BOOL)bottomAligned
{
  return self->_bottomAligned;
}

- (void)setBottomAligned:(BOOL)a3
{
  self->_bottomAligned = a3;
}

- (BOOL)animateFrameChange
{
  return self->_animateFrameChange;
}

- (void)setAnimateFrameChange:(BOOL)a3
{
  self->_animateFrameChange = a3;
}

- (void)setBoundingPath:(id)a3
{
}

- (CGSize)coverSize
{
  double width = self->_coverSize.width;
  double height = self->_coverSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCoverSize:(CGSize)a3
{
  self->_coverSize = a3;
}

- (BCCacheVendedLayerDelegate)vendedLayerDelegate
{
  return self->_vendedLayerDelegate;
}

- (void)setVendedLayerDelegate:(id)a3
{
  self->_vendedLayerDelegate = (BCCacheVendedLayerDelegate *)a3;
}

- (BCCacheVendedLayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setImageLayer:(id)a3
{
}

- (BCCacheVendedLayer)preloadedImageLayer
{
  return self->_preloadedImageLayer;
}

- (void)setPreloadedImageLayer:(id)a3
{
}

- (CGRect)coverFrame
{
  double x = self->_coverFrame.origin.x;
  double y = self->_coverFrame.origin.y;
  double width = self->_coverFrame.size.width;
  double height = self->_coverFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCoverFrame:(CGRect)a3
{
  self->_coverFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloadedImageLayer, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_boundingPath, 0);
  objc_destroyWeak((id *)&self->_coverEffectsEnvironment);
  objc_storeStrong((id *)&self->_libraryAsset, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end