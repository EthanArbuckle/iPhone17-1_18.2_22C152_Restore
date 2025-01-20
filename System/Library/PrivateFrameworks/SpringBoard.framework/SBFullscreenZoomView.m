@interface SBFullscreenZoomView
- (SBFullscreenZoomView)initWithView:(id)a3 containingSceneSnapshot:(id)a4 forDisplayConfiguration:(id)a5;
- (id)_initWithFrame:(CGRect)a3;
- (id)_initWithView:(id)a3 displayConfiguration:(id)a4;
- (id)initWithContainingBounds:(double)a3 contentFrame:(double)a4 statusBarFrame:(double)a5 snapshot:(double)a6 snapshotOrientation:(double)a7 interfaceOrientation:(double)a8 doubleHeightStatusBar:(double)a9 allowStatusBarToOverlap:(uint64_t)a10 useLargerCornerRadii:(void *)a11 preventSplit:(uint64_t)a12 needsZoomFilter:(uint64_t)a13 asyncDecodeImage:(uint64_t)a14 forJail:(uint64_t)a15 hasOrientationMismatchForClassicApp:(uint64_t)a16;
- (id)surface;
- (void)_addBlackBackground;
@end

@implementation SBFullscreenZoomView

- (id)initWithContainingBounds:(double)a3 contentFrame:(double)a4 statusBarFrame:(double)a5 snapshot:(double)a6 snapshotOrientation:(double)a7 interfaceOrientation:(double)a8 doubleHeightStatusBar:(double)a9 allowStatusBarToOverlap:(uint64_t)a10 useLargerCornerRadii:(void *)a11 preventSplit:(uint64_t)a12 needsZoomFilter:(uint64_t)a13 asyncDecodeImage:(uint64_t)a14 forJail:(uint64_t)a15 hasOrientationMismatchForClassicApp:(uint64_t)a16
{
  id v37 = a11;
  v38 = (id *)objc_msgSend(a1, "_initWithFrame:", a2, a3, a4, a5);
  v39 = v38;
  if (v38)
  {
    v40 = [v38 layer];
    SBSetShouldRasterizeLayer(v40, 0);

    v41 = [v37 imageForInterfaceOrientation:a12 generationOptions:1];
    if (v41)
    {
      v42 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v41];
      if ([(id)SBApp homeScreenRotationStyleWantsUIKitRotation]) {
        BOOL v43 = a22 == 0;
      }
      else {
        BOOL v43 = 1;
      }
      if (!v43)
      {
        id v44 = v41;
        if ([v44 CGImage])
        {
          v45 = dispatch_get_global_queue(-32768, 0);
          uint64_t v51 = MEMORY[0x1E4F143A8];
          uint64_t v52 = 3221225472;
          v53 = __284__SBFullscreenZoomView_initWithContainingBounds_contentFrame_statusBarFrame_snapshot_snapshotOrientation_interfaceOrientation_doubleHeightStatusBar_allowStatusBarToOverlap_useLargerCornerRadii_preventSplit_needsZoomFilter_asyncDecodeImage_forJail_hasOrientationMismatchForClassicApp___block_invoke;
          v54 = &unk_1E6AF5290;
          id v55 = v44;
          id v56 = v42;
          dispatch_async(v45, &v51);
        }
      }
      objc_msgSend(v39[51], "setFrame:", a6, a7, a8, a9, v51, v52, v53, v54);
      if (a24)
      {
        [v39[51] center];
        objc_msgSend(v39[51], "setCenter:", v47, v46);
      }
      [v39[51] bounds];
      objc_msgSend(v42, "setFrame:");
      v48 = [v42 layer];
      [v48 setAllowsDisplayCompositing:0];

      [v39[51] addSubview:v42];
      if (SBFEffectiveHomeButtonType() == 2 && a23) {
        objc_msgSend(v39[51], "sbClassicLayout_applyTransformsForClassicPresentationInReferenceSpaceForInterfaceOrientation:allowStatusBarToOverlap:useDeviceCornerRadius:", a13, a15, a16);
      }

      int v49 = objc_msgSend(v41, "sbs_hasAlpha");
      if ((a23 & 1) == 0 && ([v37 isImageOpaque] & v49) != 1) {
        goto LABEL_19;
      }
    }
    else
    {
      objc_msgSend(0, "sbs_hasAlpha");
    }
    [v39 _addBlackBackground];
LABEL_19:
  }
  return v39;
}

- (id)_initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBFullscreenZoomView;
  id v3 = -[SBZoomView _initWithFrame:](&v7, sel__initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [v3 layer];
    [v5 setEdgeAntialiasingMask:0];
    [v5 setName:@"zoomView"];
    SBSetShouldRasterizeLayer(v5, 1);
  }
  return v4;
}

- (void).cxx_destruct
{
}

- (id)_initWithView:(id)a3 displayConfiguration:(id)a4
{
  id v6 = a3;
  [a4 bounds];
  objc_super v7 = -[SBFullscreenZoomView _initWithFrame:](self, "_initWithFrame:");
  v8 = v7;
  if (v7)
  {
    v9 = [v7 layer];
    SBSetShouldRasterizeLayer(v9, 0);

    [v8[51] addSubview:v6];
  }

  return v8;
}

void __284__SBFullscreenZoomView_initWithContainingBounds_contentFrame_statusBarFrame_snapshot_snapshotOrientation_interfaceOrientation_doubleHeightStatusBar_allowStatusBarToOverlap_useLargerCornerRadii_preventSplit_needsZoomFilter_asyncDecodeImage_forJail_hasOrientationMismatchForClassicApp___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) size];
  UIGraphicsBeginImageContextWithOptions(v11, 1, 0.0);
  v2 = *(void **)(a1 + 32);
  [v2 size];
  double v4 = v3;
  [*(id *)(a1 + 32) size];
  objc_msgSend(v2, "drawInRect:", 0.0, 0.0, v4, v5);
  id v6 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __284__SBFullscreenZoomView_initWithContainingBounds_contentFrame_statusBarFrame_snapshot_snapshotOrientation_interfaceOrientation_doubleHeightStatusBar_allowStatusBarToOverlap_useLargerCornerRadii_preventSplit_needsZoomFilter_asyncDecodeImage_forJail_hasOrientationMismatchForClassicApp___block_invoke_2;
  v8[3] = &unk_1E6AF5290;
  id v9 = *(id *)(a1 + 40);
  id v10 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __284__SBFullscreenZoomView_initWithContainingBounds_contentFrame_statusBarFrame_snapshot_snapshotOrientation_interfaceOrientation_doubleHeightStatusBar_allowStatusBarToOverlap_useLargerCornerRadii_preventSplit_needsZoomFilter_asyncDecodeImage_forJail_hasOrientationMismatchForClassicApp___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
}

- (SBFullscreenZoomView)initWithView:(id)a3 containingSceneSnapshot:(id)a4 forDisplayConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (objc_class *)MEMORY[0x1E4F4F8D0];
  id v11 = a5;
  id v12 = [v10 alloc];
  [v11 bounds];
  v13 = objc_msgSend(v12, "initWithFrame:");
  v14 = [(SBFullscreenZoomView *)self _initWithView:v13 displayConfiguration:v11];

  if (v14)
  {
    uint64_t v15 = [v9 IOSurface];
    id surface = v14->_surface;
    v14->_id surface = (id)v15;

    [v13 addContentView:v8];
    v17 = [v9 context];
    v18 = [v17 settings];
    objc_msgSend(v13, "setContentOrientation:", objc_msgSend(v18, "interfaceOrientation"));
  }
  return v14;
}

- (id)surface
{
  return self->_surface;
}

- (void)_addBlackBackground
{
  double v3 = [MEMORY[0x1E4F428B8] blackColor];
  [(SBFullscreenZoomView *)self setBackgroundColor:v3];

  id v4 = [(SBFullscreenZoomView *)self layer];
  SBSetShouldRasterizeLayer(v4, 1);
  [v4 setAllowsGroupOpacity:1];
}

@end