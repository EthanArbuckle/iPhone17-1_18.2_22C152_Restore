@interface CALayer(PXGReusableViewAdoption)
- (BOOL)pxg_hasSuperview;
- (BOOL)pxg_isChildOfView:()PXGReusableViewAdoption;
- (uint64_t)canUnloadWhenInvisible;
- (uint64_t)isFloating;
- (uint64_t)pxg_becomeReusable;
- (uint64_t)pxg_isChildOfScrollViewController:()PXGReusableViewAdoption;
- (uint64_t)pxg_prepareForReuse;
- (uint64_t)pxg_shiftPosition:()PXGReusableViewAdoption;
- (uint64_t)shouldReloadForUserData:()PXGReusableViewAdoption;
- (uint64_t)shouldReuseWhenInvisible;
- (void)pxg_addToHostingView:()PXGReusableViewAdoption;
- (void)pxg_addToScrollViewController:()PXGReusableViewAdoption;
- (void)pxg_configureWithTexture:()PXGReusableViewAdoption geometry:info:style:textureInfo:resizableCapInsets:reusableViewInfo:screenScale:separateLayers:;
- (void)pxg_insertIntoView:()PXGReusableViewAdoption atIndex:;
@end

@implementation CALayer(PXGReusableViewAdoption)

- (uint64_t)isFloating
{
  return 0;
}

- (uint64_t)shouldReloadForUserData:()PXGReusableViewAdoption
{
  return 0;
}

- (uint64_t)canUnloadWhenInvisible
{
  return 1;
}

- (uint64_t)shouldReuseWhenInvisible
{
  return 0;
}

- (uint64_t)pxg_shiftPosition:()PXGReusableViewAdoption
{
  uint64_t result = [a1 isFloating];
  if ((result & 1) == 0)
  {
    [a1 position];
    PXPointAdd();
  }
  return result;
}

- (void)pxg_configureWithTexture:()PXGReusableViewAdoption geometry:info:style:textureInfo:resizableCapInsets:reusableViewInfo:screenScale:separateLayers:
{
  id v21 = a8;
  id v22 = a13;
  double v24 = *(double *)a9;
  double v23 = *(double *)(a9 + 8);
  LODWORD(v63) = *(void *)(a9 + 24);
  LODWORD(v25) = HIDWORD(*(void *)(a9 + 24));
  objc_opt_class();
  float v26 = 1.0;
  if (objc_opt_isKindOfClass())
  {
    id v27 = v21;
    v28 = [a1 contents];
    uint64_t v29 = [v27 imageRef];

    if (v28 != (void *)v29) {
      objc_msgSend(a1, "setContents:", objc_msgSend(v27, "imageRef"));
    }
    [a1 contentsScale];
    if (v30 != a6) {
      [a1 setContentsScale:a6];
    }
    [v27 alpha];
    float v26 = v31;
  }
  double v60 = a6;
  double v32 = v63;
  double v33 = v25;
  objc_msgSend(a1, "position", *(void *)&v60);
  if (v35 != v24 || v34 != v23) {
    objc_msgSend(a1, "setPosition:", v24, v23);
  }
  [a1 bounds];
  v70.origin.x = 0.0;
  v70.origin.y = 0.0;
  v70.size.width = v63;
  v70.size.height = v33;
  if (!CGRectEqualToRect(v68, v70)) {
    objc_msgSend(a1, "setBounds:", 0.0, 0.0, v32, v33);
  }
  double v37 = -*(double *)(a9 + 16);
  [a1 zPosition];
  if (v38 != v37) {
    [a1 setZPosition:v37];
  }
  [a1 opacity];
  if (*(float *)&v39 != a11->f32[0])
  {
    *(float *)&double v39 = v26 * a11->f32[0];
    [a1 setOpacity:v39];
  }
  float v40 = fmaxf(fmaxf(a11[4].f32[1], a11[5].f32[0]), fmaxf(a11[5].f32[1], a11[6].f32[0]));
  [a1 cornerRadius];
  if (v41 != v40)
  {
    [a1 setCornerRadius:v40];
    [a1 setMasksToBounds:v40 != 0.0];
  }
  float v43 = a11[4].f32[1];
  float v42 = a11[5].f32[0];
  float v45 = a11[5].f32[1];
  float v44 = a11[6].f32[0];
  if (fmaxf(fmaxf(v43, v42), fmaxf(v45, v44)) == 0.0)
  {
    unint64_t v47 = 15;
  }
  else
  {
    uint64_t v46 = 15;
    if (v43 == 0.0) {
      uint64_t v46 = 14;
    }
    if (v42 == 0.0) {
      v46 &= ~2uLL;
    }
    if (v45 == 0.0) {
      unint64_t v47 = v46 & 0xFFFFFFFFFFFFFFFBLL;
    }
    else {
      unint64_t v47 = v46;
    }
    if (v44 == 0.0) {
      v47 &= 7u;
    }
  }
  if ([a1 maskedCorners] != v47) {
    [a1 setMaskedCorners:v47];
  }
  float64x2_t v64 = vcvtq_f64_f32(a11[9]);
  [a1 anchorPoint];
  if (v49 != v64.f64[0] || v48 != v64.f64[1]) {
    objc_msgSend(a1, "setAnchorPoint:", *(_OWORD *)&v64, v48);
  }
  [v22 rotation];
  double v50 = a11[7].f32[0];
  if (v51 != v50)
  {
    double v52 = a11[7].f32[1];
LABEL_40:
    memset(&v67, 0, sizeof(v67));
    CGAffineTransformMakeScale(&v66, v52, v52);
    CGAffineTransformRotate(&v67, &v66, v50);
    CGAffineTransform v65 = v67;
    [a1 setAffineTransform:&v65];
    [a1 setAllowsEdgeAntialiasing:a11[7].f32[0] != 0.0];
    [v22 setRotation:a11[7].f32[0]];
    [v22 setScale:a11[7].f32[1]];
    goto LABEL_41;
  }
  [v22 scale];
  double v54 = v53;
  double v52 = a11[7].f32[1];
  if (v54 != v52)
  {
    double v50 = a11[7].f32[0];
    goto LABEL_40;
  }
LABEL_41:
  if (a2 == *(float *)off_1E5DAAF58
    && a3 == *((float *)off_1E5DAAF58 + 1)
    && a4 == *((float *)off_1E5DAAF58 + 2)
    && a5 == *((float *)off_1E5DAAF58 + 3))
  {
    PXRectDenormalize();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v55 = (CGImage *)[v21 imageRef];
    double v32 = (double)CGImageGetWidth(v55) / v61;
    double v33 = (double)CGImageGetHeight(v55) / v61;
  }
  double v56 = a5;
  double v57 = a3 / v32;
  double v58 = (v32 - v56 - a3) / v32;
  double v59 = (v33 - a4 - a2) / v33;
  [a1 contentsCenter];
  v71.origin.x = v57;
  v71.origin.y = a2 / v33;
  v71.size.width = v58;
  v71.size.height = v59;
  if (!CGRectEqualToRect(v69, v71))
  {
    objc_msgSend(a1, "setContentsRect:", *(double *)off_1E5DAB010, *((double *)off_1E5DAB010 + 1), *((double *)off_1E5DAB010 + 2), *((double *)off_1E5DAB010 + 3));
    objc_msgSend(a1, "setContentsCenter:", v57, a2 / v33, v58, v59);
  }
}

- (uint64_t)pxg_prepareForReuse
{
  return [a1 setHidden:0];
}

- (uint64_t)pxg_becomeReusable
{
  [a1 setHidden:1];
  [a1 setContents:0];
  [a1 setDelegate:0];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v2;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [a1 setAffineTransform:v8];
  double v3 = *(double *)off_1E5DAB010;
  double v4 = *((double *)off_1E5DAB010 + 1);
  double v5 = *((double *)off_1E5DAB010 + 2);
  double v6 = *((double *)off_1E5DAB010 + 3);
  objc_msgSend(a1, "setContentsRect:", *(double *)off_1E5DAB010, v4, v5, v6);
  return objc_msgSend(a1, "setContentsCenter:", v3, v4, v5, v6);
}

- (BOOL)pxg_hasSuperview
{
  v1 = [a1 superlayer];
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)pxg_isChildOfView:()PXGReusableViewAdoption
{
  id v4 = a3;
  double v5 = [a1 superlayer];
  double v6 = [v4 layer];

  return v5 == v6;
}

- (void)pxg_insertIntoView:()PXGReusableViewAdoption atIndex:
{
  id v6 = [a3 layer];
  [v6 insertSublayer:a1 atIndex:a4];
}

- (void)pxg_addToHostingView:()PXGReusableViewAdoption
{
  uint64_t v4 = _PXGDisabledLayerActions_onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&_PXGDisabledLayerActions_onceToken, &__block_literal_global_446);
  }
  [a1 setActions:_PXGDisabledLayerActions_disabledActions];
  [a1 setCornerCurve:*MEMORY[0x1E4F39EA8]];
  [v5 addHostedLayer:a1];
}

- (uint64_t)pxg_isChildOfScrollViewController:()PXGReusableViewAdoption
{
  return [a3 isFloatingSublayer:a1];
}

- (void)pxg_addToScrollViewController:()PXGReusableViewAdoption
{
  uint64_t v4 = _PXGDisabledLayerActions_onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&_PXGDisabledLayerActions_onceToken, &__block_literal_global_446);
  }
  [a1 setActions:_PXGDisabledLayerActions_disabledActions];
  [a1 setCornerCurve:*MEMORY[0x1E4F39EA8]];
  [v5 addFloatingSublayer:a1 forAxis:1];
}

@end