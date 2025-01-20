@interface VKCImageSubjectBaseView
- (BOOL)glowLayerActive;
- (BOOL)inhibitDimmingAndLiftView;
- (BOOL)isLivePhoto;
- (BOOL)subjectExistsAtPoint:(CGPoint)a3;
- (BOOL)subjectHighlightFeatureFlagEnabled;
- (BOOL)usesLightDimmingViewInLightMode;
- (CALayer)colorLayer;
- (CALayer)imageHighlightLayer;
- (CALayer)imageHighlightLayerContainer;
- (CALayer)imageHighlightLayerContainerShadow;
- (CALayer)imageHighlightLayerMask;
- (CALayer)pulseLayer;
- (CAPackage)pulsePackage;
- (CAShapeLayer)intersectionMask;
- (CGRect)imageBounds;
- (CGRect)subjectFrame;
- (CGSize)imageSize;
- (CIContext)maskLoadContext;
- (NSIndexSet)_cachedSubjectIndexSet;
- (NSIndexSet)activeGlowLayerIndexSet;
- (NSIndexSet)activeSubjectIndexSet;
- (NSIndexSet)allSubjectsIndexSet;
- (NSValue)burstPoint;
- (OS_dispatch_queue)backgroundQueue;
- (UIBezierPath)normalizedSubjectPath;
- (UIBezierPath)subjectPathInBoundsCoordinates;
- (UIImage)_cachedSubject;
- (UIImage)customImageForRemoveBackground;
- (UITraitChangeRegistration)traitChangeRegistration;
- (VKCImageAnalysisResult)analysisResult;
- (VKCImageSubjectBaseView)initWithFrame:(CGRect)a3;
- (VKCImageSubjectBaseViewDelegate)baseSubjectDelegate;
- (VKCImageSubjectContext)subjectContext;
- (VKCImageSubjectGlowLayer)glowLayer;
- (VKCRemoveBackgroundRequestHandler)removeBackgroundRequestHandler;
- (id)cachedSubjectForIndexSet:(id)a3;
- (id)convertNormalizedPathToBoundsCoordinates:(id)a3;
- (id)imageSubjectPathWithIndexes:(id)a3;
- (id)indexOfSubjectAtPoint:(CGPoint)a3;
- (id)loadPulsePackage;
- (id)opacityAnimationFromValue:(double)a3 toValue:(double)a4;
- (int64_t)imageOrientation;
- (unint64_t)loadMaskIndex;
- (unint64_t)loadMaskRequestStatus;
- (void)_loadSubjectMaskIfNecessaryWithCompletion:(id)a3;
- (void)_updateForImageBoundsChange;
- (void)clearCachedSubject;
- (void)configureMaskForCurrentSubjectContextWithLayer:(id)a3 animated:(BOOL)a4;
- (void)configurePulseAnimationWithViewScale:(double)a3;
- (void)configureSubjectLiftAtPoint:(CGPoint)a3;
- (void)loadImageSubjectIfNecessaryWithCompletion:(id)a3;
- (void)loadImageSubjectWithIndexes:(id)a3 completion:(id)a4;
- (void)loadPulsePackage;
- (void)loadSubjectMaskIfNecessary;
- (void)loadSubjectMaskIfNecessaryWithCompletion:(id)a3;
- (void)sendSubjectAnalyticsEventWithEventType:(int64_t)a3 interactionType:(int64_t)a4 subjectFound:(BOOL)a5 processingDuration:(double)a6;
- (void)setActiveGlowLayerIndexSet:(id)a3;
- (void)setActiveSubjectIndexSet:(id)a3;
- (void)setActiveSubjectIndexSet:(id)a3 animated:(BOOL)a4;
- (void)setBackgroundQueue:(id)a3;
- (void)setBaseSubjectDelegate:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setBurstPoint:(id)a3;
- (void)setCachedSubject:(id)a3 forIndexSet:(id)a4;
- (void)setColorLayer:(id)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setCustomImageForRemoveBackground:(id)a3;
- (void)setGlowLayer:(id)a3;
- (void)setGlowLayerActive:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setImageHighlightLayer:(id)a3;
- (void)setImageHighlightLayerContainer:(id)a3;
- (void)setImageHighlightLayerContainerShadow:(id)a3;
- (void)setImageHighlightLayerMask:(id)a3;
- (void)setImageOrientation:(int64_t)a3;
- (void)setInhibitDimmingAndLiftView:(BOOL)a3;
- (void)setIntersectionMask:(id)a3;
- (void)setLoadMaskIndex:(unint64_t)a3;
- (void)setLoadMaskRequestStatus:(unint64_t)a3;
- (void)setMaskLoadContext:(id)a3;
- (void)setPulsePackage:(id)a3;
- (void)setRecognitionResult:(id)a3;
- (void)setRemoveBackgroundRequestHandler:(id)a3;
- (void)setSubjectContext:(id)a3;
- (void)setSubjectHighlightFeatureFlagEnabled:(BOOL)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)setUsesLightDimmingViewInLightMode:(BOOL)a3;
- (void)set_cachedSubject:(id)a3;
- (void)set_cachedSubjectIndexSet:(id)a3;
- (void)showPulseAnimationWithViewScale:(double)a3;
- (void)updateDimmingColorForAppearance;
- (void)updateForImageBoundsChangeIfNecessary;
- (void)updateGlowLayerForActiveSubjectIndexSet;
- (void)updateMaskForCurrentSubjectIndexesAnimated:(BOOL)a3;
@end

@implementation VKCImageSubjectBaseView

- (VKCImageSubjectBaseView)initWithFrame:(CGRect)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)VKCImageSubjectBaseView;
  v3 = -[VKCImageBaseOverlayView initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    colorLayer = v3->_colorLayer;
    v3->_colorLayer = v4;

    [(VKCImageSubjectBaseView *)v3 setUsesLightDimmingViewInLightMode:0];
    v6 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    imageHighlightLayer = v3->_imageHighlightLayer;
    v3->_imageHighlightLayer = v6;

    v8 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    imageHighlightLayerMask = v3->_imageHighlightLayerMask;
    v3->_imageHighlightLayerMask = v8;

    v10 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    intersectionMask = v3->_intersectionMask;
    v3->_intersectionMask = v10;

    [(CAShapeLayer *)v3->_intersectionMask setHidden:1];
    [(CALayer *)v3->_imageHighlightLayerMask addSublayer:v3->_intersectionMask];
    [(CALayer *)v3->_imageHighlightLayer setMask:v3->_imageHighlightLayerMask];
    v12 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    imageHighlightLayerContainerShadow = v3->_imageHighlightLayerContainerShadow;
    v3->_imageHighlightLayerContainerShadow = v12;

    v14 = objc_alloc_init(VKCImageSubjectGlowLayer);
    glowLayer = v3->_glowLayer;
    v3->_glowLayer = v14;

    v16 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    imageHighlightLayerContainer = v3->_imageHighlightLayerContainer;
    v3->_imageHighlightLayerContainer = v16;

    [(CALayer *)v3->_imageHighlightLayerContainer setAllowsGroupOpacity:1];
    [(CALayer *)v3->_imageHighlightLayerContainerShadow setAllowsGroupOpacity:1];
    id v18 = [MEMORY[0x1E4F428B8] blackColor];
    -[CALayer setShadowColor:](v3->_imageHighlightLayerContainer, "setShadowColor:", [v18 CGColor]);

    id v19 = [MEMORY[0x1E4F428B8] blackColor];
    -[CALayer setShadowColor:](v3->_imageHighlightLayerContainerShadow, "setShadowColor:", [v19 CGColor]);

    [(CALayer *)v3->_imageHighlightLayerContainer addSublayer:v3->_imageHighlightLayerContainerShadow];
    [(CALayer *)v3->_imageHighlightLayerContainerShadow addSublayer:v3->_imageHighlightLayer];
    [(CALayer *)v3->_imageHighlightLayer setOpacity:0.0];
    [(CALayer *)v3->_imageHighlightLayerContainer setOpacity:0.0];
    LODWORD(v20) = 1.0;
    [(CALayer *)v3->_imageHighlightLayerContainerShadow setOpacity:v20];
    [(CALayer *)v3->_colorLayer setOpacity:0.0];
    v21 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v21 setValue:&unk_1F357DDB0 forKeyPath:*MEMORY[0x1E4F3A1D8]];
    v39[0] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    v23 = [(CALayer *)v3->_imageHighlightLayer mask];
    [v23 setFilters:v22];

    v24 = [(VKCImageSubjectBaseView *)v3 layer];
    [v24 addSublayer:v3->_colorLayer];

    v25 = [(VKCImageSubjectBaseView *)v3 layer];
    [v25 addSublayer:v3->_imageHighlightLayerContainer];

    v26 = [(VKCImageSubjectBaseView *)v3 layer];
    [v26 addSublayer:v3->_glowLayer];

    v27 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v28 = dispatch_queue_create("VKImageSubjectBaseViewBackground", v27);
    backgroundQueue = v3->_backgroundQueue;
    v3->_backgroundQueue = (OS_dispatch_queue *)v28;

    _os_feature_enabled_impl();
    v3->_subjectHighlightFeatureFlagEnabled = 1;
    v30 = objc_alloc_init(VKCRemoveBackgroundRequestHandler);
    removeBackgroundRequestHandler = v3->_removeBackgroundRequestHandler;
    v3->_removeBackgroundRequestHandler = v30;

    objc_initWeak(&location, v3);
    dispatch_time_t v32 = dispatch_time(0, 1000000000);
    v33 = v3->_backgroundQueue;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __41__VKCImageSubjectBaseView_initWithFrame___block_invoke;
    v35[3] = &unk_1E6BF0D90;
    objc_copyWeak(&v36, &location);
    dispatch_after(v32, v33, v35);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __41__VKCImageSubjectBaseView_initWithFrame___block_invoke(uint64_t a1)
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1E018]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setMaskLoadContext:v3];
}

- (UIBezierPath)normalizedSubjectPath
{
  id v3 = [(VKCImageSubjectBaseView *)self subjectContext];
  [(VKCImageBaseOverlayView *)self contentsRect];
  v4 = objc_msgSend(v3, "normalizedPathForActiveSubjectsWithContentsRect:topLevelOnly:", 1);

  return (UIBezierPath *)v4;
}

- (UIBezierPath)subjectPathInBoundsCoordinates
{
  id v3 = [(VKCImageSubjectBaseView *)self subjectContext];
  [(VKCImageBaseOverlayView *)self contentsRect];
  v4 = objc_msgSend(v3, "normalizedPathForActiveSubjectsWithContentsRect:topLevelOnly:", 1);

  v5 = [(VKCImageSubjectBaseView *)self convertNormalizedPathToBoundsCoordinates:v4];

  return (UIBezierPath *)v5;
}

- (id)convertNormalizedPathToBoundsCoordinates:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 copy];
  if (v4)
  {
    [(VKCImageSubjectBaseView *)self bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    v14 = (void *)[v4 copy];

    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeScale(&v19, v11, v13);
    CGAffineTransformMakeTranslation(&t2, v7, v9);
    CGAffineTransform v16 = v19;
    CGAffineTransformConcat(&v18, &v16, &t2);
    CGAffineTransform v19 = v18;
    objc_msgSend(v14, "vk_applyTransform:", &v18);
    v5 = v14;
  }

  return v5;
}

- (CALayer)pulseLayer
{
  v2 = [(VKCImageSubjectBaseView *)self pulsePackage];
  id v3 = [v2 rootLayer];

  return (CALayer *)v3;
}

- (void)setGlowLayerActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (!self->_glowLayerActive) {
      return;
    }
    self->_glowLayerActive = 0;
    goto LABEL_15;
  }
  v5 = [(VKCImageSubjectBaseView *)self subjectContext];

  if (v5)
  {
    if (self->_glowLayerActive == v3) {
      return;
    }
    self->_glowLayerActive = v3;
    if (v3)
    {
      double v6 = [(VKCImageSubjectBaseView *)self window];
      CGFloat v7 = [v6 screen];
      [v7 scale];
      uint64_t v9 = v8;

      double v10 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        CGFloat v11 = [(VKCImageSubjectBaseView *)self activeSubjectIndexSet];
        objc_msgSend(v11, "vk_indexString");
        double v12 = (VKCImageSubjectBaseView *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v41 = v12;
        __int16 v42 = 2112;
        v43 = self;
        _os_log_impl(&dword_1DB266000, v10, OS_LOG_TYPE_DEFAULT, "Activating glow for indexes: %@, : %@", buf, 0x16u);
      }
      CGFloat v13 = [(VKCImageSubjectBaseView *)self subjectContext];
      os_log_t v14 = [(VKCImageSubjectBaseView *)self activeSubjectIndexSet];
      [(VKCImageBaseOverlayView *)self contentsRect];
      uint64_t v16 = v15;
      uint64_t v18 = v17;
      uint64_t v20 = v19;
      uint64_t v22 = v21;
      [(VKCImageSubjectBaseView *)self setActiveGlowLayerIndexSet:v14];
      if ([v14 count] == 1)
      {
        v23 = [(VKCImageSubjectBaseView *)self subjectPathInBoundsCoordinates];
        v24 = [(VKCImageSubjectBaseView *)self glowLayer];
        [(UIView *)self vk_viewPointRatioFromWindow];
        objc_msgSend(v24, "beginAnimationWithViewScale:screenScale:path:index:count:identifier:", v23, 0, 1, &unk_1F357DB00);
      }
      else
      {
        if (![v14 count])
        {
          uint64_t v30 = [v13 allSubjectIndexes];

          os_log_t v14 = (os_log_t)v30;
        }
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __46__VKCImageSubjectBaseView_setGlowLayerActive___block_invoke;
        v31[3] = &unk_1E6BF1768;
        uint64_t v35 = v16;
        uint64_t v36 = v18;
        uint64_t v37 = v20;
        uint64_t v38 = v22;
        id v32 = v13;
        v33 = self;
        uint64_t v39 = v9;
        os_log_t v14 = v14;
        os_log_t v34 = v14;
        [v14 enumerateIndexesUsingBlock:v31];

        v23 = v32;
      }

LABEL_18:
      v29 = [(VKCImageSubjectBaseView *)self baseSubjectDelegate];
      [v29 subjectBaseViewGlowLayerActiveDidChange:self];

      [(VKCImageSubjectBaseView *)self sendSubjectAnalyticsEventWithEventType:1 interactionType:0 subjectFound:1 processingDuration:0.0];
      return;
    }
LABEL_15:
    v26 = [(VKCImageSubjectBaseView *)self glowLayer];
    [v26 stopAnimationAnimated:1];

    [(VKCImageSubjectBaseView *)self setActiveGlowLayerIndexSet:0];
    os_log_t v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [(VKCImageSubjectBaseView *)self activeSubjectIndexSet];
      objc_msgSend(v27, "vk_indexString");
      dispatch_queue_t v28 = (VKCImageSubjectBaseView *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = v28;
      __int16 v42 = 2112;
      v43 = self;
      _os_log_impl(&dword_1DB266000, v14, OS_LOG_TYPE_DEFAULT, "Deactivating glow for indexes: %@, %@", buf, 0x16u);
    }
    CGFloat v13 = v14;
    goto LABEL_18;
  }
  v25 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = self;
    _os_log_impl(&dword_1DB266000, v25, OS_LOG_TYPE_DEFAULT, "Trying to set the glow layer active, but no subject context exists: %@", buf, 0xCu);
  }

  if (self->_glowLayerActive)
  {
    self->_glowLayerActive = 0;
    goto LABEL_15;
  }
}

void __46__VKCImageSubjectBaseView_setGlowLayerActive___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  v5 = [NSNumber numberWithUnsignedInteger:a2];
  objc_msgSend(v4, "normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:", v5, 1, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  double v6 = [*(id *)(a1 + 40) convertNormalizedPathToBoundsCoordinates:v13];
  CGFloat v7 = [*(id *)(a1 + 40) glowLayer];
  objc_msgSend(*(id *)(a1 + 40), "vk_viewPointRatioFromWindow");
  double v9 = v8;
  double v10 = *(double *)(a1 + 88);
  uint64_t v11 = [*(id *)(a1 + 48) count];
  double v12 = [NSNumber numberWithUnsignedInteger:a2];
  [v7 beginAnimationWithViewScale:v6 screenScale:a2 path:v11 index:v12 count:v9 identifier:v10];
}

- (void)updateGlowLayerForActiveSubjectIndexSet
{
  BOOL v3 = [(VKCImageSubjectBaseView *)self subjectContext];
  id v4 = [(VKCImageSubjectBaseView *)self activeGlowLayerIndexSet];
  v5 = [v3 convertIndexSetToConcreteSubjectIndexes:v4];

  double v6 = [(VKCImageSubjectBaseView *)self activeSubjectIndexSet];
  CGFloat v7 = [v3 convertIndexSetToConcreteSubjectIndexes:v6];

  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  double v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndexSet:v5];
  [v10 addIndexes:v7];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __66__VKCImageSubjectBaseView_updateGlowLayerForActiveSubjectIndexSet__block_invoke;
  v44[3] = &unk_1E6BF1790;
  id v11 = v5;
  id v45 = v11;
  id v12 = v7;
  id v46 = v12;
  id v13 = v8;
  id v47 = v13;
  id v14 = v9;
  id v48 = v14;
  [v10 enumerateIndexesUsingBlock:v44];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __66__VKCImageSubjectBaseView_updateGlowLayerForActiveSubjectIndexSet__block_invoke_2;
  v43[3] = &unk_1E6BF17B8;
  v43[4] = self;
  [v13 enumerateIndexesUsingBlock:v43];
  [(VKCImageBaseOverlayView *)self contentsRect];
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  v23 = [(VKCImageSubjectBaseView *)self window];
  v24 = [v23 screen];
  [v24 scale];
  uint64_t v26 = v25;

  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  uint64_t v27 = [v14 count];
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __66__VKCImageSubjectBaseView_updateGlowLayerForActiveSubjectIndexSet__block_invoke_3;
  id v32 = &unk_1E6BF17E0;
  id v28 = v3;
  uint64_t v36 = v16;
  uint64_t v37 = v18;
  uint64_t v38 = v20;
  uint64_t v39 = v22;
  id v33 = v28;
  os_log_t v34 = self;
  uint64_t v40 = v26;
  uint64_t v35 = v42;
  uint64_t v41 = v27;
  [v14 enumerateIndexesUsingBlock:&v29];
  -[VKCImageSubjectBaseView setActiveGlowLayerIndexSet:](self, "setActiveGlowLayerIndexSet:", v12, v29, v30, v31, v32);

  _Block_object_dispose(v42, 8);
}

uint64_t __66__VKCImageSubjectBaseView_updateGlowLayerForActiveSubjectIndexSet__block_invoke(id *a1, uint64_t a2)
{
  int v4 = [a1[4] containsIndex:a2];
  uint64_t result = [a1[5] containsIndex:a2];
  if (!v4 || (result & 1) != 0)
  {
    if ((result ^ 1 | v4)) {
      return result;
    }
    double v6 = a1 + 7;
  }
  else
  {
    double v6 = a1 + 6;
  }
  CGFloat v7 = *v6;
  return [v7 addIndex:a2];
}

void __66__VKCImageSubjectBaseView_updateGlowLayerForActiveSubjectIndexSet__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) glowLayer];
  BOOL v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v4 stopAnimationForIdentifier:v3 animated:1];
}

void __66__VKCImageSubjectBaseView_updateGlowLayerForActiveSubjectIndexSet__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  v5 = [NSNumber numberWithUnsignedInteger:a2];
  objc_msgSend(v4, "normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:", v5, 1, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  double v6 = [*(id *)(a1 + 40) convertNormalizedPathToBoundsCoordinates:v15];
  CGFloat v7 = [*(id *)(a1 + 40) glowLayer];
  objc_msgSend(*(id *)(a1 + 40), "vk_viewPointRatioFromWindow");
  double v9 = v8;
  double v10 = *(double *)(a1 + 88);
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void *)(v11 + 24);
  *(void *)(v11 + 24) = v12 + 1;
  uint64_t v13 = *(void *)(a1 + 96);
  id v14 = [NSNumber numberWithUnsignedInteger:a2];
  [v7 beginAnimationWithViewScale:v6 screenScale:v12 path:v13 index:v14 count:v9 identifier:v10];
}

- (void)setActiveSubjectIndexSet:(id)a3
{
}

- (void)setActiveSubjectIndexSet:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CGFloat v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = objc_msgSend(v6, "vk_indexString");
    int v11 = 138412546;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = self;
    _os_log_impl(&dword_1DB266000, v7, OS_LOG_TYPE_DEFAULT, "Setting Active subject indexes: %@, %@", (uint8_t *)&v11, 0x16u);
  }
  double v9 = (void *)[v6 copy];
  double v10 = [(VKCImageSubjectBaseView *)self subjectContext];
  [v10 setActiveSubjectIndexes:v9];

  [(VKCImageSubjectBaseView *)self updateMaskForCurrentSubjectIndexesAnimated:v4];
}

- (NSIndexSet)activeSubjectIndexSet
{
  v2 = [(VKCImageSubjectBaseView *)self subjectContext];
  BOOL v3 = [v2 activeSubjectIndexes];
  BOOL v4 = (void *)[v3 copy];

  return (NSIndexSet *)v4;
}

- (void)showPulseAnimationWithViewScale:(double)a3
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(VKCImageSubjectBaseView *)self configurePulseAnimationWithViewScale:a3];
  id v34 = [(VKCImageSubjectBaseView *)self pulsePackage];
  v5 = [v34 rootLayer];
  [v5 setDisableUpdateMask:2];
  id v6 = [(VKCImageSubjectBaseView *)self subjectPathInBoundsCoordinates];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  uint64_t v15 = [(VKCImageSubjectBaseView *)self burstPoint];
  if (v15)
  {
    uint64_t v16 = [(VKCImageSubjectBaseView *)self burstPoint];
    objc_msgSend(v16, "vk_pointValue");
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    double v18 = VKMCenterOfRect(v8, v10, v12, v14);
    double v20 = v21;
  }

  double v22 = VKMNormalizedPointInRect(v18, v20, v8, v10, v12);
  double v24 = v23;
  -[VKCImageSubjectBaseView configureSubjectLiftAtPoint:](self, "configureSubjectLiftAtPoint:", v18, v20);
  double v25 = VKMDistance(v22, v24, 0.5, 0.5);
  double v26 = fmin(v25 + v25, 1.0);
  if (v26 <= 0.0) {
    double v27 = 0.5;
  }
  else {
    double v27 = (v26 + 1.0) * 0.5;
  }
  *(float *)&double v27 = v27;
  [v5 setSpeed:v27];
  id v28 = [(VKCImageSubjectBaseView *)self layer];
  uint64_t v29 = [v5 superlayer];
  objc_msgSend(v28, "convertPoint:toLayer:", v29, v18, v20);
  double v31 = v30;
  double v33 = v32;

  objc_msgSend(v5, "setPosition:", v31, v33);
  [v5 setBeginTime:CACurrentMediaTime()];
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)configurePulseAnimationWithViewScale:(double)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(VKCImageSubjectBaseView *)self pulsePackage];
  if (v4) {
    goto LABEL_3;
  }
  BOOL v4 = [(VKCImageSubjectBaseView *)self loadPulsePackage];
  [(VKCImageSubjectBaseView *)self setPulsePackage:v4];
  v5 = [(VKCImageSubjectBaseView *)self imageHighlightLayer];
  id v6 = [v4 rootLayer];
  [v5 addSublayer:v6];

  if (v4)
  {
LABEL_3:
    double v7 = [v4 rootLayer];
    CGFloat v8 = [v4 publishedObjectWithName:@"sharpLayer"];
    uint64_t v9 = [v4 publishedObjectWithName:@"blurLayer"];
    CGFloat v10 = (void *)v9;
    if (v7 && v8 && v9)
    {
      uint64_t v11 = [MEMORY[0x1E4F39CF8] disableActions];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      CGFloat v12 = [(VKCImageSubjectBaseView *)self subjectPathInBoundsCoordinates];
      [v12 bounds];
      double v14 = v13;
      double v16 = v15;

      [v7 bounds];
      if (v14 / v17 >= v16 / v18) {
        double v19 = v14 / v17;
      }
      else {
        double v19 = v16 / v18;
      }
      +[VKCInternalSettings scaleMultiplier];
      double v21 = v20;
      memset(&v42, 0, sizeof(v42));
      double v22 = VKMRandomBetween(0.0, 6.28318531);
      CGAffineTransformMakeRotation(&v42, v22);
      CGAffineTransform v41 = v42;
      [v7 setAffineTransform:&v41];
      memset(&v40, 0, sizeof(v40));
      CGAffineTransformMakeScale(&v40, v21 * v19, v21 * v19);
      CGAffineTransform v39 = v40;
      [v8 setAffineTransform:&v39];
      CGAffineTransform v38 = v40;
      [v10 setAffineTransform:&v38];
      +[VKCInternalSettings sharpMinOpacity];
      *(float *)&double v23 = v23;
      [v8 setOpacity:v23];
      +[VKCInternalSettings sharpMaxThickness];
      double v25 = v24;
      +[VKCInternalSettings sharpBlurRadius];
      double v27 = v26;
      +[VKCInternalSettings blurMaxThickness];
      double v29 = v28;
      +[VKCInternalSettings blurBlurRadius];
      double v31 = v30;
      [v8 setLineWidth:v25];
      double v32 = __64__VKCImageSubjectBaseView_configurePulseAnimationWithViewScale___block_invoke(v27);
      v44[0] = v32;
      double v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
      [v8 setFilters:v33];

      +[VKCInternalSettings blurMinOpacity];
      *(float *)&double v34 = v34;
      [v10 setOpacity:v34];
      [v10 setLineWidth:v29];
      uint64_t v35 = __64__VKCImageSubjectBaseView_configurePulseAnimationWithViewScale___block_invoke(v31);
      v43 = v35;
      uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
      [v10 setFilters:v36];

      [MEMORY[0x1E4F39CF8] setDisableActions:v11];
    }
    else
    {
      uint64_t v37 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        -[VKCImageSubjectBaseView configurePulseAnimationWithViewScale:](v37);
      }
    }
  }
  else
  {
    BOOL v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[VKCImageSubjectBaseView configurePulseAnimationWithViewScale:](v4);
    }
  }
}

id __64__VKCImageSubjectBaseView_configurePulseAnimationWithViewScale___block_invoke(double a1)
{
  v2 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  BOOL v3 = [NSNumber numberWithDouble:a1];
  [v2 setValue:v3 forKeyPath:*MEMORY[0x1E4F3A1D8]];

  [v2 setValue:@"low" forKey:*MEMORY[0x1E4F3A1D0]];
  return v2;
}

- (id)loadPulsePackage
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 URLForResource:@"SubjectPulseLayer" withExtension:@"caar"];

  uint64_t v4 = *MEMORY[0x1E4F3A4B8];
  id v9 = 0;
  v5 = [MEMORY[0x1E4F39C38] packageWithContentsOfURL:v3 type:v4 options:0 error:&v9];
  id v6 = v9;
  if (v6)
  {
    double v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(VKCImageSubjectBaseView *)(uint64_t)v6 loadPulsePackage];
    }
  }
  return v5;
}

- (CGSize)imageSize
{
  v2 = [(VKCImageSubjectBaseView *)self subjectContext];
  [v2 imageSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setSubjectContext:(id)a3
{
  double v5 = (VKCImageSubjectContext *)a3;
  p_subjectContext = (id *)&self->_subjectContext;
  if (self->_subjectContext != v5)
  {
    objc_storeStrong((id *)&self->_subjectContext, a3);
    [(VKCImageSubjectBaseView *)self setBurstPoint:0];
    [(VKCImageSubjectBaseView *)self clearCachedSubject];
    id v7 = *p_subjectContext;
    double v8 = [(VKCImageSubjectBaseView *)self analysisResult];
    [v8 setCachedSubjectContext:v7];

    id v9 = [(VKCImageSubjectBaseView *)self customImageForRemoveBackground];
    uint64_t v10 = objc_msgSend(v9, "vk_cgImage");

    uint64_t v11 = [(VKCImageSubjectBaseView *)self customImageForRemoveBackground];
    CGFloat v12 = (CGAffineTransform *)objc_msgSend(v11, "vk_imageOrientation");

    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
    vk_transformToImageOrientation(v12, (uint64_t)&v21);
    if (!v10)
    {
      double v13 = [*p_subjectContext request];
      uint64_t v10 = [v13 CGImage];

      vk_transformToImageOrientation((CGAffineTransform *)[*p_subjectContext imageOrientation], (uint64_t)v20);
      long long v21 = v20[0];
      long long v22 = v20[1];
      long long v23 = v20[2];
    }
    double v14 = [(VKCImageSubjectBaseView *)self imageHighlightLayer];
    [v14 setContents:v10];

    long long v17 = v21;
    long long v18 = v22;
    long long v19 = v23;
    double v15 = [(VKCImageSubjectBaseView *)self imageHighlightLayer];
    v16[0] = v17;
    v16[1] = v18;
    v16[2] = v19;
    [v15 setAffineTransform:v16];

    [(VKCImageSubjectBaseView *)self updateMaskForCurrentSubjectIndexesAnimated:0];
    [(VKCImageSubjectBaseView *)self updateForImageBoundsChangeIfNecessary];
  }
}

- (void)configureSubjectLiftAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v24 = [(VKCImageSubjectBaseView *)self subjectContext];
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", x, y);
  double v6 = objc_msgSend(v24, "indexOfSubjectAtNormalizedPoint:");
  [(VKCImageBaseOverlayView *)self contentsRect];
  id v7 = objc_msgSend(v24, "normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:", v6, 1);
  [v7 bounds];
  double v12 = VKMCenterOfRect(v8, v9, v10, v11);
  double v14 = v13;
  double v15 = [(VKCImageSubjectBaseView *)self imageHighlightLayerContainer];
  [v15 frame];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  objc_msgSend(v15, "setAnchorPoint:", v12, v14);
  objc_msgSend(v15, "setFrame:", v17, v19, v21, v23);
}

- (void)updateMaskForCurrentSubjectIndexesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(VKCImageSubjectBaseView *)self imageHighlightLayerMask];
  [(VKCImageSubjectBaseView *)self configureMaskForCurrentSubjectContextWithLayer:v5 animated:v3];
}

- (void)configureMaskForCurrentSubjectContextWithLayer:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(VKCImageBaseOverlayView *)self contentsRect];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [(VKCImageSubjectBaseView *)self imageHighlightLayer];
  [v15 bounds];
  double v44 = v17;
  double v45 = v16;
  double v42 = v19;
  double v43 = v18;

  double v20 = [(VKCImageSubjectBaseView *)self subjectContext];
  double v21 = [(VKCImageSubjectBaseView *)self activeSubjectIndexSet];
  double v22 = objc_msgSend(v20, "normalizedPathForSubjectWithIndexSet:contentsRect:topLevelOnly:", v21, 0, 0.0, 0.0, 1.0, 1.0);

  memset(&v58, 0, sizeof(v58));
  CGAffineTransformMakeTranslation(&v58, -0.5, -0.5);
  double v23 = [(VKCImageSubjectBaseView *)self imageHighlightLayer];
  id v24 = v23;
  if (v23) {
    [v23 affineTransform];
  }
  else {
    memset(&v55, 0, sizeof(v55));
  }
  CGAffineTransformInvert(&t2, &v55);
  CGAffineTransform t1 = v58;
  CGAffineTransformConcat(&v57, &t1, &t2);
  CGAffineTransform v58 = v57;

  CGAffineTransformMakeTranslation(&v53, 0.5, 0.5);
  CGAffineTransform t1 = v58;
  CGAffineTransformConcat(&v57, &t1, &v53);
  CGAffineTransform v58 = v57;
  VKMTransformConvertingRectToRect((uint64_t)&v52, 0.0, 1.0, 1.0, v8, v10, v12, v14);
  CGAffineTransform t1 = v58;
  CGAffineTransformConcat(&v57, &t1, &v52);
  CGAffineTransform v58 = v57;
  objc_msgSend(v22, "vk_applyTransform:", &v57);
  memset(&v57, 0, sizeof(v57));
  CGAffineTransformMakeTranslation(&v57, -v8, -v10);
  VKMTransformConvertingRectToRect((uint64_t)&v51, v8, v12, v14, v45, v44, v43, v42);
  CGAffineTransform v50 = v57;
  CGAffineTransformConcat(&t1, &v50, &v51);
  CGAffineTransform v57 = t1;
  objc_msgSend(v22, "vk_applyTransform:", &t1);
  id v25 = objc_alloc_init(MEMORY[0x1E4F39C88]);
  double v26 = [v6 sublayers];
  double v27 = [v26 reverseObjectEnumerator];
  double v28 = [v27 allObjects];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __83__VKCImageSubjectBaseView_configureMaskForCurrentSubjectContextWithLayer_animated___block_invoke;
  v49[3] = &unk_1E6BF1808;
  v49[4] = self;
  double v29 = objc_msgSend(v28, "vk_objectPassingTest:", v49);

  objc_msgSend(v6, "setFrame:", v45, v44, v43, v42);
  objc_msgSend(v25, "setFrame:", v45, v44, v43, v42);
  objc_msgSend(v25, "setPath:", objc_msgSend(v22, "vk_CGPath"));
  id v30 = [MEMORY[0x1E4F428B8] whiteColor];
  objc_msgSend(v25, "setFillColor:", objc_msgSend(v30, "CGColor"));

  uint64_t v31 = *MEMORY[0x1E4F39FB8];
  [v25 setFillRule:*MEMORY[0x1E4F39FB8]];
  double v32 = [(VKCImageSubjectBaseView *)self intersectionMask];
  [MEMORY[0x1E4F39CF8] begin];
  if ([v29 path] && v4)
  {
    BOOL v41 = v4;
    id v33 = v6;
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    double v34 = objc_msgSend(MEMORY[0x1E4F427D0], "vk_pathFromCGPath:", objc_msgSend(v29, "path"));
    uint64_t v35 = objc_msgSend(v22, "vk_intersectAndFlattenWithPath:", v34);

    if (([v35 isEmpty] & 1) == 0)
    {
      objc_msgSend(v32, "setFrame:", v45, v44, v43, v42);
      objc_msgSend(v32, "setPath:", objc_msgSend(v35, "vk_CGPath"));
      id v36 = [MEMORY[0x1E4F428B8] whiteColor];
      objc_msgSend(v32, "setFillColor:", objc_msgSend(v36, "CGColor"));

      [v32 setFillRule:v31];
      [v32 setHidden:0];
    }

    id v6 = v33;
    BOOL v4 = v41;
  }
  [v6 addSublayer:v25];
  [MEMORY[0x1E4F39CF8] commit];
  if (!v4)
  {
    if (v29) {
      [v29 removeFromSuperlayer];
    }
    goto LABEL_14;
  }
  uint64_t v37 = [(VKCImageSubjectBaseView *)self opacityAnimationFromValue:0.0 toValue:1.0];
  [v37 setRemovedOnCompletion:1];
  [v25 addAnimation:v37 forKey:@"fade-in"];

  if (!v29)
  {
LABEL_14:
    [v32 setHidden:1];
    goto LABEL_15;
  }
  [MEMORY[0x1E4F39CF8] begin];
  CGAffineTransform v38 = [(VKCImageSubjectBaseView *)self opacityAnimationFromValue:1.0 toValue:0.0];
  [v38 setRemovedOnCompletion:0];
  CGAffineTransform v39 = (void *)MEMORY[0x1E4F39CF8];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __83__VKCImageSubjectBaseView_configureMaskForCurrentSubjectContextWithLayer_animated___block_invoke_2;
  v46[3] = &unk_1E6BF12B8;
  id v40 = v29;
  id v47 = v40;
  id v48 = v32;
  [v39 setCompletionBlock:v46];
  [v40 addAnimation:v38 forKey:@"fade-out"];
  [MEMORY[0x1E4F39CF8] commit];

LABEL_15:
}

BOOL __83__VKCImageSubjectBaseView_configureMaskForCurrentSubjectContextWithLayer_animated___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 intersectionMask];

  return v4 != v3;
}

uint64_t __83__VKCImageSubjectBaseView_configureMaskForCurrentSubjectContextWithLayer_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperlayer];
  v2 = *(void **)(a1 + 40);
  return [v2 setHidden:1];
}

- (id)opacityAnimationFromValue:(double)a3 toValue:(double)a4
{
  id v6 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v6 setDuration:0.2];
  [v6 setFillMode:*MEMORY[0x1E4F39FA0]];
  double v7 = [NSNumber numberWithDouble:a3];
  [v6 setFromValue:v7];

  double v8 = [NSNumber numberWithDouble:a4];
  [v6 setToValue:v8];

  return v6;
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKCImageSubjectBaseView;
  -[VKCImageSubjectBaseView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(VKCImageSubjectBaseView *)self updateForImageBoundsChangeIfNecessary];
}

- (void)setContentsRect:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKCImageSubjectBaseView;
  -[VKCImageBaseOverlayView setContentsRect:](&v4, sel_setContentsRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(VKCImageSubjectBaseView *)self updateForImageBoundsChangeIfNecessary];
}

- (void)setHidden:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VKCImageSubjectBaseView;
  [(VKCImageSubjectBaseView *)&v5 setHidden:a3];
  if ([(VKCImageSubjectBaseView *)self isHidden])
  {
    [(VKCImageSubjectBaseView *)self setGlowLayerActive:0];
    objc_super v4 = [(VKCImageSubjectBaseView *)self pulseLayer];
    [v4 removeAllAnimations];
  }
}

- (BOOL)isLivePhoto
{
  return 0;
}

- (void)updateForImageBoundsChangeIfNecessary
{
  [(VKCImageSubjectBaseView *)self imageBounds];
  if (VKMRectIsFinite(v3, v4, v5, v6))
  {
    double v7 = [(VKCImageSubjectBaseView *)self subjectContext];
    uint64_t v8 = [v7 subjectCount];

    if (v8)
    {
      [(VKCImageSubjectBaseView *)self _updateForImageBoundsChange];
    }
  }
}

- (void)_updateForImageBoundsChange
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(VKCImageSubjectBaseView *)self updateMaskForCurrentSubjectIndexesAnimated:0];
  id v53 = [(VKCImageSubjectBaseView *)self colorLayer];
  double v3 = [(VKCImageSubjectBaseView *)self imageHighlightLayer];
  double v4 = [(VKCImageSubjectBaseView *)self imageHighlightLayerContainer];
  double v5 = [(VKCImageSubjectBaseView *)self imageHighlightLayerContainerShadow];
  double v6 = [(VKCImageSubjectBaseView *)self glowLayer];
  [(VKCImageSubjectBaseView *)self imageBounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [(VKCImageSubjectBaseView *)self subjectContext];
  [(VKCImageBaseOverlayView *)self contentsRect];
  double v16 = objc_msgSend(v15, "normalizedPathForActiveSubjectsWithContentsRect:topLevelOnly:", 1);
  [v16 bounds];
  CGFloat v51 = v18;
  CGFloat v52 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  objc_msgSend(v53, "setFrame:", v8, v10, v12, v14);
  double v23 = VKMCenterOfRect(v8, v10, v12, v14);
  double v25 = v24;
  double v26 = VKMMultiplyPointScalar(v12, v14, 1.1);
  objc_msgSend(v4, "setFrame:", VKMRectWithCenterAndSize(v23, v25, v26));
  [v4 bounds];
  objc_msgSend(v5, "setFrame:");
  double v27 = [v4 superlayer];
  objc_msgSend(v4, "convertRect:fromLayer:", v27, v8, v10, v12, v14);
  objc_msgSend(v3, "setFrame:");

  [v3 bounds];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  id v36 = [v3 mask];
  objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);

  [v53 bounds];
  VKMRectFromNormalizedSubrect(v37, v38, v39, v40, v52, v51, v20, v22);
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  v49 = [v53 mask];
  objc_msgSend(v49, "setFrame:", v42, v44, v46, v48);

  CGAffineTransform v50 = [v6 superlayer];
  [v50 bounds];
  objc_msgSend(v6, "setFrame:");

  [MEMORY[0x1E4F39CF8] commit];
}

- (CGRect)imageBounds
{
  [(VKCImageSubjectBaseView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(VKCImageBaseOverlayView *)self contentsRect];
  VKMRectFromNormalizedSubrect(v4, v6, v8, v10, v11, v12, v13, v14);
  result.size.height = v18;
  result.size.width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)subjectFrame
{
  double v3 = [(VKCImageSubjectBaseView *)self subjectContext];

  if (v3)
  {
    [(VKCImageSubjectBaseView *)self imageBounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v12 = [(VKCImageSubjectBaseView *)self subjectContext];
    [v12 normalizedCropRect];
    VKMRectFromNormalizedSubrect(v5, v7, v9, v11, v13, v14, v15, v16);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
  }
  else
  {
    double v18 = *MEMORY[0x1E4F1DB20];
    double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v24 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (void)setRecognitionResult:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VKCImageSubjectBaseView;
  id v5 = [(VKCImageBaseOverlayView *)&v16 recognitionResult];

  if (v5 != v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)VKCImageSubjectBaseView;
    [(VKCImageBaseOverlayView *)&v15 setRecognitionResult:v4];
    uint64_t v6 = objc_opt_class();
    CGFloat v7 = VKDynamicCast(v6, (uint64_t)v4);
    double v8 = [v7 cachedCustomImageForRemoveBackground];

    if (v8) {
      [(VKCImageSubjectBaseView *)self setCustomImageForRemoveBackground:v8];
    }
    [(VKCImageSubjectBaseView *)self setLoadMaskRequestStatus:0];
    CGFloat v9 = [(VKCImageSubjectBaseView *)self analysisResult];
    double v10 = [v9 cachedSubjectContext];
    [(VKCImageSubjectBaseView *)self setSubjectContext:v10];

    CGFloat v11 = [(VKCImageSubjectBaseView *)self analysisResult];
    CGFloat v12 = [v11 request];
    -[VKCImageSubjectBaseView setImageOrientation:](self, "setImageOrientation:", [v12 imageOrientation]);

    [(VKCImageSubjectBaseView *)self setGlowLayerActive:0];
    [(VKCImageSubjectBaseView *)self setLoadMaskIndex:[(VKCImageSubjectBaseView *)self loadMaskIndex] + 1];
    CGFloat v13 = [(VKCImageSubjectBaseView *)self colorLayer];
    [v13 setOpacity:0.0];

    CGFloat v14 = [(VKCImageSubjectBaseView *)self imageHighlightLayerContainer];
    [v14 setOpacity:0.0];

    [(VKCImageSubjectBaseView *)self beginImageSubjectAnalysisWithDelayIfNecessary];
  }
}

- (void)setCustomImageForRemoveBackground:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = (UIImage *)a3;
  if (self->_customImageForRemoveBackground != v5)
  {
    uint64_t v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      CGFloat v9 = v5;
      __int16 v10 = 2112;
      CGFloat v11 = self;
      _os_log_impl(&dword_1DB266000, v6, OS_LOG_TYPE_DEFAULT, "Setting custom image for remove background: %@, %@", (uint8_t *)&v8, 0x16u);
    }

    objc_storeStrong((id *)&self->_customImageForRemoveBackground, a3);
    if (v5)
    {
      CGFloat v7 = [(VKCImageSubjectBaseView *)self analysisResult];
      [v7 setCachedCustomImageForRemoveBackground:v5];
    }
    [(VKCImageSubjectBaseView *)self updateMaskForCurrentSubjectIndexesAnimated:0];
  }
}

- (void)setUsesLightDimmingViewInLightMode:(BOOL)a3
{
  if (a3)
  {
    [(VKCImageSubjectBaseView *)self updateDimmingColorForAppearance];
    id v4 = [(VKCImageSubjectBaseView *)self traitChangeRegistration];

    if (!v4)
    {
      id v9 = [MEMORY[0x1E4F42F80] systemTraitsAffectingColorAppearance];
      id v5 = [(VKCImageSubjectBaseView *)self registerForTraitChanges:v9 withTarget:self action:sel_updateDimmingColorForAppearance];
      [(VKCImageSubjectBaseView *)self setTraitChangeRegistration:v5];
    }
  }
  else
  {
    uint64_t v6 = [(VKCImageSubjectBaseView *)self traitChangeRegistration];

    if (v6)
    {
      CGFloat v7 = [(VKCImageSubjectBaseView *)self traitChangeRegistration];
      [(VKCImageSubjectBaseView *)self unregisterForTraitChanges:v7];
    }
    int v8 = [MEMORY[0x1E4F42F80] appearanceClassForType:0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__VKCImageSubjectBaseView_setUsesLightDimmingViewInLightMode___block_invoke;
    v10[3] = &unk_1E6BF0D18;
    v10[4] = self;
    objc_msgSend(v8, "vk_performAsCurrent:", v10);
  }
}

void __62__VKCImageSubjectBaseView_setUsesLightDimmingViewInLightMode___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  id v2 = [v3 colorWithAlphaComponent:0.3];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 528), "setBackgroundColor:", objc_msgSend(v2, "CGColor"));
}

- (void)clearCachedSubject
{
  [(VKCImageSubjectBaseView *)self set_cachedSubjectIndexSet:0];
  [(VKCImageSubjectBaseView *)self set_cachedSubject:0];
}

- (void)setCachedSubject:(id)a3 forIndexSet:(id)a4
{
  id v6 = a3;
  [(VKCImageSubjectBaseView *)self set_cachedSubjectIndexSet:a4];
  [(VKCImageSubjectBaseView *)self set_cachedSubject:v6];
}

- (id)cachedSubjectForIndexSet:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageSubjectBaseView *)self _cachedSubjectIndexSet];
  int v6 = [v5 isEqualToIndexSet:v4];

  if (v6)
  {
    CGFloat v7 = [(VKCImageSubjectBaseView *)self _cachedSubject];
  }
  else
  {
    CGFloat v7 = 0;
  }
  return v7;
}

- (void)updateDimmingColorForAppearance
{
  id v3 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
  id v15 = [v3 colorWithAlphaComponent:0.8];

  id v4 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  id v5 = [v4 colorWithAlphaComponent:0.7];

  int v6 = [(VKCImageSubjectBaseView *)self traitCollection];
  int v7 = objc_msgSend(v6, "vk_isDark");

  int v8 = v15;
  if (v7) {
    int v8 = v5;
  }
  uint64_t v9 = [v8 CGColor];
  __int16 v10 = [(VKCImageSubjectBaseView *)self colorLayer];
  [v10 setBackgroundColor:v9];

  CGFloat v11 = [(VKCImageSubjectBaseView *)self imageHighlightLayerContainerShadow];
  uint64_t v12 = v11;
  if (v7)
  {
    [v11 setShadowOpacity:0.0];
  }
  else
  {
    [v11 setShadowRadius:30.0];
    LODWORD(v13) = 1050253722;
    [v12 setShadowOpacity:v13];
    id v14 = [MEMORY[0x1E4F428B8] blackColor];
    objc_msgSend(v12, "setShadowColor:", objc_msgSend(v14, "CGColor"));

    objc_msgSend(v12, "setShadowOffset:", 0.0, 5.0);
  }
}

- (VKCImageAnalysisResult)analysisResult
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(VKCImageBaseOverlayView *)self recognitionResult];
  id v5 = VKDynamicCast(v3, (uint64_t)v4);

  return (VKCImageAnalysisResult *)v5;
}

- (BOOL)subjectExistsAtPoint:(CGPoint)a3
{
  uint64_t v3 = -[VKCImageSubjectBaseView indexOfSubjectAtPoint:](self, "indexOfSubjectAtPoint:", a3.x, a3.y);
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)indexOfSubjectAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = [(VKCImageSubjectBaseView *)self subjectContext];

  if (v6)
  {
    -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", x, y);
    double v8 = v7;
    double v10 = v9;
    CGFloat v11 = [(VKCImageSubjectBaseView *)self subjectContext];
    uint64_t v12 = objc_msgSend(v11, "indexOfSubjectAtNormalizedPoint:", v8, v10);
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (NSIndexSet)allSubjectsIndexSet
{
  id v2 = [(VKCImageSubjectBaseView *)self subjectContext];
  uint64_t v3 = [v2 allSubjectIndexes];
  BOOL v4 = (void *)[v3 copy];

  return (NSIndexSet *)v4;
}

- (void)setLoadMaskRequestStatus:(unint64_t)a3
{
  self->_loadMaskRequestStatus = a3;
}

- (void)loadSubjectMaskIfNecessary
{
}

- (void)loadSubjectMaskIfNecessaryWithCompletion:(id)a3
{
  id v5 = (void (**)(void))a3;
  BOOL v4 = [(VKCImageSubjectBaseView *)self subjectContext];

  if (v4)
  {
    if (v5) {
      v5[2]();
    }
  }
  else
  {
    [(VKCImageSubjectBaseView *)self _loadSubjectMaskIfNecessaryWithCompletion:v5];
  }
}

- (void)_loadSubjectMaskIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageSubjectBaseView *)self analysisResult];
  if (![(VKCImageSubjectBaseView *)self loadMaskRequestStatus])
  {
    int v6 = [(VKCImageSubjectBaseView *)self subjectContext];
    if (v6 || !v5)
    {
    }
    else if ([(VKCImageSubjectBaseView *)self subjectHighlightFeatureFlagEnabled])
    {
      double v7 = [MEMORY[0x1E4F1C9C8] date];
      double v8 = (void *)([(VKCImageSubjectBaseView *)self loadMaskIndex] + 1);
      [(VKCImageSubjectBaseView *)self setLoadMaskIndex:v8];
      [(VKCImageSubjectBaseView *)self setLoadMaskRequestStatus:1];
      double v9 = [(VKCImageSubjectBaseView *)self baseSubjectDelegate];
      [v9 subjectBaseViewDidBeginSubjectAnalysis:self];

      objc_initWeak(&location, self);
      double v10 = [(VKCImageSubjectBaseView *)self backgroundQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke;
      v12[3] = &unk_1E6BF18A8;
      objc_copyWeak(v16, &location);
      id v13 = v7;
      id v14 = v5;
      id v15 = v4;
      v16[1] = v8;
      id v11 = v7;
      dispatch_async(v10, v12);

      objc_destroyWeak(v16);
      objc_destroyWeak(&location);
    }
  }
}

void __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_2;
  v32[3] = &unk_1E6BF1830;
  id v2 = (id *)(a1 + 56);
  objc_copyWeak(&v36, (id *)(a1 + 56));
  id v33 = *(id *)(a1 + 32);
  id v34 = *(id *)(a1 + 40);
  id v35 = *(id *)(a1 + 48);
  uint64_t v3 = (void (**)(void, void))MEMORY[0x1E018E600](v32);
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = WeakRetained;
  if (WeakRetained && [WeakRetained loadMaskIndex] == *(void *)(a1 + 64))
  {
    int v6 = [*(id *)(a1 + 40) request];
    if ([v6 isPhotosAssetRequest]) {
      double v7 = v6;
    }
    else {
      double v7 = 0;
    }
    id v24 = v7;
    double v8 = [v5 customImageForRemoveBackground];
    if (v8) {
      BOOL v9 = v24 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    char v10 = !v9;

    if ((v10 & 1) == 0)
    {
      id v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CGFloat v38 = v5;
        _os_log_impl(&dword_1DB266000, v11, OS_LOG_TYPE_DEFAULT, "Using custom image for remove background: %@", buf, 0xCu);
      }

      uint64_t v12 = [v5 customImageForRemoveBackground];
      uint64_t v13 = objc_msgSend(v12, "vk_cgImage");

      if (v13) {
        goto LABEL_23;
      }
    }
    if ([v6 requestType] != 5)
    {
      uint64_t v13 = [v6 blockingGenerateCGImage];
      if (v13) {
        goto LABEL_23;
      }
      id v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CGFloat v38 = v5;
        _os_log_impl(&dword_1DB266000, v14, OS_LOG_TYPE_DEFAULT, "No image is available for subject detection processing: %@", buf, 0xCu);
      }

      v3[2](v3, 0);
    }
    if (!v24)
    {
LABEL_29:

      goto LABEL_30;
    }
    uint64_t v13 = 0;
LABEL_23:
    id v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CGFloat v38 = v5;
      _os_log_impl(&dword_1DB266000, v15, OS_LOG_TYPE_DEFAULT, "Beginning Remove Subject processing: %@", buf, 0xCu);
    }

    if (v24)
    {
      objc_super v16 = [[VKCRemoveBackgroundRequest alloc] initWithPhotosAnalyzerRequest:v6];
    }
    else
    {
      +[VKCRemoveBackgroundRequest requestWithImage:orientation:canResize:](VKCRemoveBackgroundRequest, "requestWithImage:orientation:canResize:", v13, [v6 imageOrientation], 1);
      objc_super v16 = (VKCRemoveBackgroundRequest *)objc_claimAutoreleasedReturnValue();
    }
    double v17 = v16;
    double v18 = [v6 viImageType];
    [(VKCRemoveBackgroundRequest *)v17 setVIImageType:v18];

    [(VKCRemoveBackgroundRequest *)v17 setMaskOnly:1];
    double v19 = [MEMORY[0x1E4F1C9C8] date];
    double v20 = [v5 removeBackgroundRequestHandler];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_101;
    v25[3] = &unk_1E6BF1880;
    objc_copyWeak(v31, v2);
    double v30 = v3;
    id v21 = *(id *)(a1 + 40);
    double v22 = *(void **)(a1 + 64);
    id v26 = v21;
    v31[1] = v22;
    id v23 = v19;
    id v27 = v23;
    id v28 = *(id *)(a1 + 32);
    double v29 = v5;
    [v20 performRequest:v17 completion:v25];

    objc_destroyWeak(v31);
    goto LABEL_29;
  }
LABEL_30:

  objc_destroyWeak(&v36);
}

void __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v5 = v4;

  [WeakRetained sendSubjectAnalyticsEventWithEventType:0 interactionType:0 subjectFound:0 processingDuration:v5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_3;
  v6[3] = &unk_1E6BF0EF8;
  v6[4] = WeakRetained;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  vk_performBlockOnMainThread(v6);
}

void __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [v2 analysisResult];
    double v4 = *(void **)(a1 + 40);

    if (v3 == v4)
    {
      [*(id *)(a1 + 32) setLoadMaskRequestStatus:2];
      double v5 = [*(id *)(a1 + 32) baseSubjectDelegate];
      [v5 subjectBaseViewViewDidCompleteSubjectAnalysis:*(void *)(a1 + 32)];

      uint64_t v6 = *(void *)(a1 + 48);
      if (v6)
      {
        id v7 = *(void (**)(void))(v6 + 16);
        v7();
      }
    }
  }
}

void __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v8 = WeakRetained;
  if (!v6)
  {
    if (!WeakRetained) {
      goto LABEL_12;
    }
    char v10 = [WeakRetained analysisResult];
    if (v10 == *(void **)(a1 + 32))
    {
      uint64_t v11 = [v8 loadMaskIndex];
      uint64_t v12 = *(void *)(a1 + 80);

      if (v11 != v12) {
        goto LABEL_12;
      }
      if (!v5)
      {
        BOOL v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v32 = v17;
          _os_log_impl(&dword_1DB266000, v9, OS_LOG_TYPE_DEFAULT, "Subject not found for analysis: %@", buf, 0xCu);
        }
        goto LABEL_4;
      }
      uint64_t v13 = [[VKCImageSubjectContext alloc] initWithMaskResult:v5];
      id v14 = [v8 maskLoadContext];
      id v15 = v14;
      if (v14) {
        id v16 = v14;
      }
      else {
        id v16 = objc_alloc_init(MEMORY[0x1E4F1E018]);
      }
      char v10 = v16;

      [(VKCImageSubjectContext *)v13 preparePathsAndImageMaskIfNecessaryWithContext:v10];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_103;
      v23[3] = &unk_1E6BF1858;
      v23[4] = v8;
      id v18 = *(id *)(a1 + 32);
      uint64_t v30 = *(void *)(a1 + 80);
      id v24 = v18;
      double v25 = v13;
      id v26 = *(id *)(a1 + 40);
      id v19 = *(id *)(a1 + 48);
      uint64_t v20 = *(void *)(a1 + 56);
      id v21 = *(void **)(a1 + 64);
      id v27 = v19;
      uint64_t v28 = v20;
      id v29 = v21;
      double v22 = v13;
      vk_performBlockOnMainThread(v23);
    }
    goto LABEL_12;
  }
  BOOL v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_101_cold_1();
  }
LABEL_4:

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_12:
}

void __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_103(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) analysisResult];
  if (v2 != *(void **)(a1 + 40))
  {
LABEL_4:

    return;
  }
  id v18 = v2;
  uint64_t v3 = [*(id *)(a1 + 32) subjectContext];
  if (v3)
  {

    id v2 = v18;
    goto LABEL_4;
  }
  uint64_t v4 = [*(id *)(a1 + 32) loadMaskIndex];
  uint64_t v5 = *(void *)(a1 + 88);

  if (v4 == v5)
  {
    [*(id *)(a1 + 32) setSubjectContext:*(void *)(a1 + 48)];
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSinceDate:*(void *)(a1 + 56)];
    double v8 = v7;

    BOOL v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:*(void *)(a1 + 64)];
    double v11 = v10;

    uint64_t v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [*(id *)(a1 + 72) subjectContext];
      id v14 = [v13 animatedStickerScore];
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      double v20 = v8 * 1000.0;
      __int16 v21 = 2048;
      double v22 = v11 * 1000.0;
      __int16 v23 = 2112;
      id v24 = v14;
      __int16 v25 = 2112;
      uint64_t v26 = v15;
      _os_log_impl(&dword_1DB266000, v12, OS_LOG_TYPE_DEFAULT, "Remove Subject mask for analysis complete with madDuration: %f total duration: %fms stickerScore:%@, %@", buf, 0x2Au);
    }
    id v16 = [*(id *)(a1 + 32) normalizedSubjectPath];
    uint64_t v17 = v16;
    if (v16) {
      [v16 isEmpty];
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

- (void)loadImageSubjectIfNecessaryWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(VKCImageSubjectBaseView *)self subjectContext];
  id v6 = [v5 activeSubjectIndexes];

  double v7 = [(VKCImageSubjectBaseView *)self cachedSubjectForIndexSet:v6];
  if (v7)
  {
    v4[2](v4, v7);
    double v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = objc_msgSend(v6, "vk_indexString");
      *(_DWORD *)buf = 138412546;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = self;
      _os_log_impl(&dword_1DB266000, v8, OS_LOG_TYPE_DEFAULT, "Found Cached subject for indexSet: %@, %@", buf, 0x16u);
    }
  }
  else
  {
    double v10 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = objc_msgSend(v6, "vk_indexString");
      *(_DWORD *)buf = 138412546;
      id v16 = v11;
      __int16 v17 = 2112;
      id v18 = self;
      _os_log_impl(&dword_1DB266000, v10, OS_LOG_TYPE_DEFAULT, "Did not find subject for indexSet, creating: %@, %@", buf, 0x16u);
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__VKCImageSubjectBaseView_loadImageSubjectIfNecessaryWithCompletion___block_invoke;
    v12[3] = &unk_1E6BF18D0;
    void v12[4] = self;
    id v13 = v6;
    id v14 = v4;
    [(VKCImageSubjectBaseView *)self loadImageSubjectWithIndexes:v13 completion:v12];
  }
}

void __69__VKCImageSubjectBaseView_loadImageSubjectIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3) {
    [*(id *)(a1 + 32) setCachedSubject:v3 forIndexSet:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)loadImageSubjectWithIndexes:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(VKCImageSubjectBaseView *)self analysisResult];
  BOOL v9 = [(VKCImageSubjectBaseView *)self subjectContext];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__4;
  v34[4] = __Block_byref_object_dispose__4;
  id v35 = 0;
  objc_initWeak(&location, self);
  double v10 = [v9 request];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __66__VKCImageSubjectBaseView_loadImageSubjectWithIndexes_completion___block_invoke;
  v30[3] = &unk_1E6BF18F8;
  id v11 = v7;
  id v31 = v11;
  uint64_t v32 = v34;
  uint64_t v12 = (void (**)(void))MEMORY[0x1E018E600](v30);
  id v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CGFloat v37 = self;
    _os_log_impl(&dword_1DB266000, v13, OS_LOG_TYPE_DEFAULT, "Attempting to generate subject image, but no subject analysis exists: %@", buf, 0xCu);
  }

  if (!v10 || !v8) {
    goto LABEL_22;
  }
  int v14 = ![(VKCImageSubjectBaseView *)self subjectHighlightFeatureFlagEnabled];
  if (!v6) {
    LOBYTE(v14) = 1;
  }
  if (v14) {
    goto LABEL_22;
  }
  if ([v6 count])
  {
    uint64_t v15 = [v9 convertExternalIndexSetToInternal:v6];
    uint64_t v16 = [v15 count];
    if (v16 != [v6 count])
    {
      uint64_t v17 = [v15 count];
      log = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
      BOOL v18 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
      if (v17)
      {
        if (v18)
        {
          *(_DWORD *)buf = 138412290;
          CGFloat v37 = self;
          uint64_t v19 = log;
          _os_log_impl(&dword_1DB266000, log, OS_LOG_TYPE_DEFAULT, "Subject image request contains one of more invalid indexes, ignoring invalid indexes: %@", buf, 0xCu);
        }
        else
        {
          uint64_t v19 = log;
        }
      }
      else
      {
        if (v18)
        {
          *(_DWORD *)buf = 138412290;
          CGFloat v37 = self;
          _os_log_impl(&dword_1DB266000, log, OS_LOG_TYPE_DEFAULT, "Subject image request indexes contain no valid indexes, returning nil: %@", buf, 0xCu);
        }

        uint64_t v19 = v10;
        double v10 = 0;
      }
    }
  }
  else
  {
    [v9 allSubjectIndexes];
    uint64_t v15 = v6;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v9 && v10)
  {
    [v10 setMaskOnly:0];
    [v10 setCropToFit:1];
    double v20 = [(VKCImageSubjectBaseView *)self subjectContext];
    __int16 v21 = [v20 madSubjectIndexesForVKSubjectIndexes:v6];
    [v10 setSelectedIndexSet:v21];

    double v22 = [(VKCImageSubjectBaseView *)self removeBackgroundRequestHandler];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __66__VKCImageSubjectBaseView_loadImageSubjectWithIndexes_completion___block_invoke_106;
    v24[3] = &unk_1E6BF1920;
    objc_copyWeak(&v29, &location);
    id v25 = v8;
    uint64_t v27 = v12;
    double v10 = v10;
    uint64_t v26 = v10;
    uint64_t v28 = v34;
    [v22 performRequest:v10 completion:v24];

    objc_destroyWeak(&v29);
  }
  else
  {
LABEL_22:
    v12[2](v12);
  }

  objc_destroyWeak(&location);
  _Block_object_dispose(v34, 8);
}

uint64_t __66__VKCImageSubjectBaseView_loadImageSubjectWithIndexes_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

void __66__VKCImageSubjectBaseView_loadImageSubjectWithIndexes_completion___block_invoke_106(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  double v8 = WeakRetained;
  if (!WeakRetained
    || ([WeakRetained analysisResult],
        BOOL v9 = objc_claimAutoreleasedReturnValue(),
        double v10 = *(void **)(a1 + 32),
        v9,
        v9 != v10))
  {
LABEL_11:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_12;
  }
  if (!v5 || v6)
  {
    uint64_t v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __66__VKCImageSubjectBaseView_loadImageSubjectWithIndexes_completion___block_invoke_106_cold_1();
    }

    goto LABEL_11;
  }
  id v11 = vk_cgImageFromPixelBuffer((__CVBuffer *)[v5 pixelBuffer]);
  uint64_t v12 = [*(id *)(a1 + 40) imageOrientation];
  id v13 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_imageWithCGImage:", v11);
  if (v12)
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_orientedImageFromImage:toOrientation:", v13, v12);

    id v13 = (void *)v14;
  }
  CGImageRelease(v11);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v13);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v16[2] = __66__VKCImageSubjectBaseView_loadImageSubjectWithIndexes_completion___block_invoke_108;
  _OWORD v16[3] = &unk_1E6BF1568;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  id v17 = *(id *)(a1 + 32);
  vk_dispatchMainAfterDelay(v16, 0.0);

  objc_destroyWeak(&v18);
LABEL_12:
}

void __66__VKCImageSubjectBaseView_loadImageSubjectWithIndexes_completion___block_invoke_108(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained analysisResult];

    id WeakRetained = v2;
  }
}

- (id)imageSubjectPathWithIndexes:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VKCImageSubjectBaseView *)self subjectContext];

  if (v5)
  {
    id v6 = [(VKCImageSubjectBaseView *)self subjectContext];
    [(VKCImageBaseOverlayView *)self contentsRect];
    id v7 = objc_msgSend(v6, "normalizedPathForSubjectWithIndexSet:contentsRect:topLevelOnly:", v4, 1);

    double v8 = [(VKCImageSubjectBaseView *)self convertNormalizedPathToBoundsCoordinates:v7];
  }
  else
  {
    BOOL v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      uint64_t v12 = self;
      _os_log_impl(&dword_1DB266000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to access subject path, but no subject analysis exists: %@", (uint8_t *)&v11, 0xCu);
    }

    double v8 = 0;
  }

  return v8;
}

- (void)sendSubjectAnalyticsEventWithEventType:(int64_t)a3 interactionType:(int64_t)a4 subjectFound:(BOOL)a5 processingDuration:(double)a6
{
  BOOL v7 = a5;
  int v11 = [VKAnalyticsSubjectEvent alloc];
  uint64_t v12 = [(VKCImageBaseOverlayView *)self baseDelegate];
  uint64_t v13 = [v12 customAnalyticsIdentifier];
  uint64_t v15 = [(VKAnalyticsSubjectEvent *)v11 initWithEventType:a3 interactionType:a4 subjectFound:v7 processingDuration:v13 customIdentifier:a6];

  uint64_t v14 = [(VKCImageSubjectBaseView *)self baseSubjectDelegate];
  [v14 subjectBaseView:self analyticsEventOccurred:v15];
}

- (VKCImageSubjectBaseViewDelegate)baseSubjectDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_baseSubjectDelegate);
  return (VKCImageSubjectBaseViewDelegate *)WeakRetained;
}

- (void)setBaseSubjectDelegate:(id)a3
{
}

- (BOOL)glowLayerActive
{
  return self->_glowLayerActive;
}

- (BOOL)inhibitDimmingAndLiftView
{
  return self->_inhibitDimmingAndLiftView;
}

- (void)setInhibitDimmingAndLiftView:(BOOL)a3
{
  self->_inhibitDimmingAndLiftView = a3;
}

- (NSValue)burstPoint
{
  return self->_burstPoint;
}

- (void)setBurstPoint:(id)a3
{
}

- (CALayer)colorLayer
{
  return self->_colorLayer;
}

- (void)setColorLayer:(id)a3
{
}

- (CALayer)imageHighlightLayer
{
  return self->_imageHighlightLayer;
}

- (void)setImageHighlightLayer:(id)a3
{
}

- (CALayer)imageHighlightLayerContainer
{
  return self->_imageHighlightLayerContainer;
}

- (void)setImageHighlightLayerContainer:(id)a3
{
}

- (CALayer)imageHighlightLayerContainerShadow
{
  return self->_imageHighlightLayerContainerShadow;
}

- (void)setImageHighlightLayerContainerShadow:(id)a3
{
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(int64_t)a3
{
  self->_imageOrientation = a3;
}

- (VKCImageSubjectContext)subjectContext
{
  return self->_subjectContext;
}

- (UIImage)customImageForRemoveBackground
{
  return self->_customImageForRemoveBackground;
}

- (unint64_t)loadMaskRequestStatus
{
  return self->_loadMaskRequestStatus;
}

- (NSIndexSet)activeGlowLayerIndexSet
{
  return self->_activeGlowLayerIndexSet;
}

- (void)setActiveGlowLayerIndexSet:(id)a3
{
}

- (BOOL)usesLightDimmingViewInLightMode
{
  return self->_usesLightDimmingViewInLightMode;
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (void)setBackgroundQueue:(id)a3
{
}

- (CALayer)imageHighlightLayerMask
{
  return self->_imageHighlightLayerMask;
}

- (void)setImageHighlightLayerMask:(id)a3
{
}

- (CAShapeLayer)intersectionMask
{
  return self->_intersectionMask;
}

- (void)setIntersectionMask:(id)a3
{
}

- (VKCImageSubjectGlowLayer)glowLayer
{
  return self->_glowLayer;
}

- (void)setGlowLayer:(id)a3
{
}

- (CAPackage)pulsePackage
{
  return self->_pulsePackage;
}

- (void)setPulsePackage:(id)a3
{
}

- (BOOL)subjectHighlightFeatureFlagEnabled
{
  return self->_subjectHighlightFeatureFlagEnabled;
}

- (void)setSubjectHighlightFeatureFlagEnabled:(BOOL)a3
{
  self->_subjectHighlightFeatureFlagEnabled = a3;
}

- (unint64_t)loadMaskIndex
{
  return self->_loadMaskIndex;
}

- (void)setLoadMaskIndex:(unint64_t)a3
{
  self->_loadMaskIndedouble x = a3;
}

- (CIContext)maskLoadContext
{
  return (CIContext *)objc_getProperty(self, a2, 648, 1);
}

- (void)setMaskLoadContext:(id)a3
{
}

- (UIImage)_cachedSubject
{
  return (UIImage *)objc_getProperty(self, a2, 656, 1);
}

- (void)set_cachedSubject:(id)a3
{
}

- (NSIndexSet)_cachedSubjectIndexSet
{
  return (NSIndexSet *)objc_getProperty(self, a2, 664, 1);
}

- (void)set_cachedSubjectIndexSet:(id)a3
{
}

- (VKCRemoveBackgroundRequestHandler)removeBackgroundRequestHandler
{
  return self->_removeBackgroundRequestHandler;
}

- (void)setRemoveBackgroundRequestHandler:(id)a3
{
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_removeBackgroundRequestHandler, 0);
  objc_storeStrong((id *)&self->__cachedSubjectIndexSet, 0);
  objc_storeStrong((id *)&self->__cachedSubject, 0);
  objc_storeStrong((id *)&self->_maskLoadContext, 0);
  objc_storeStrong((id *)&self->_pulsePackage, 0);
  objc_storeStrong((id *)&self->_glowLayer, 0);
  objc_storeStrong((id *)&self->_intersectionMask, 0);
  objc_storeStrong((id *)&self->_imageHighlightLayerMask, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_activeGlowLayerIndexSet, 0);
  objc_storeStrong((id *)&self->_customImageForRemoveBackground, 0);
  objc_storeStrong((id *)&self->_subjectContext, 0);
  objc_storeStrong((id *)&self->_imageHighlightLayerContainerShadow, 0);
  objc_storeStrong((id *)&self->_imageHighlightLayerContainer, 0);
  objc_storeStrong((id *)&self->_imageHighlightLayer, 0);
  objc_storeStrong((id *)&self->_colorLayer, 0);
  objc_storeStrong((id *)&self->_burstPoint, 0);
  objc_destroyWeak((id *)&self->_baseSubjectDelegate);
}

- (void)configurePulseAnimationWithViewScale:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DB266000, log, OS_LOG_TYPE_FAULT, "Error configuring pulse animation, pulse package is missing", v1, 2u);
}

- (void)configurePulseAnimationWithViewScale:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DB266000, log, OS_LOG_TYPE_FAULT, "Error configuring pulse animation, parameters are missing", v1, 2u);
}

- (void)loadPulsePackage
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Error getting pulse animation package: %@", (uint8_t *)&v2, 0xCu);
}

void __69__VKCImageSubjectBaseView__loadSubjectMaskIfNecessaryWithCompletion___block_invoke_101_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1DB266000, v0, v1, "Error generating mask only remove background image: %@ - %@");
}

void __66__VKCImageSubjectBaseView_loadImageSubjectWithIndexes_completion___block_invoke_106_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1DB266000, v0, v1, "Error generating full remove background image %@ - %@");
}

@end