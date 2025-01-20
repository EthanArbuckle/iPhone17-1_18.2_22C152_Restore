@interface UITargetedDragPreview
+ (UITargetedDragPreview)previewForURL:(NSURL *)url target:(UIDragPreviewTarget *)target;
+ (UITargetedDragPreview)previewForURL:(NSURL *)url title:(NSString *)title target:(UIDragPreviewTarget *)target;
- (BOOL)_applyTargetTransformToFlock;
- (BOOL)_preventAfterScreenUpdatesSnapshot;
- (CGPoint)_initialBadgeLocation;
- (CGPoint)liftAnchorPoint;
- (NSDictionary)_springboardParameters;
- (UITargetedDragPreview)initWithView:(id)a3;
- (UITargetedDragPreview)initWithView:(id)a3 parameters:(id)a4 target:(id)a5;
- (UITargetedDragPreview)retargetedPreviewWithTarget:(UIDragPreviewTarget *)newTarget;
- (_DUIPreview)_duiPreview;
- (_UIDragPreviewContainer)_previewContainer;
- (id)_fenceHandler;
- (id)imageComponent;
- (int64_t)_preferredStackOrder;
- (void)_resetPreview;
- (void)_setApplyTargetTransformToFlock:(BOOL)a3;
- (void)_setInitialBadgeLocation:(CGPoint)a3;
- (void)_setPreferredStackOrder:(int64_t)a3;
- (void)_setPreventAfterScreenUpdatesSnapshot:(BOOL)a3;
- (void)_setPreviewContainer:(id)a3;
- (void)_setPreviewMode:(int64_t)a3;
- (void)setLiftAnchorPoint:(CGPoint)a3;
- (void)set_fenceHandler:(id)a3;
- (void)set_springboardParameters:(id)a3;
- (void)takeLiftAnchorPoint:(CGPoint)a3 fromView:(id)a4;
@end

@implementation UITargetedDragPreview

- (UITargetedDragPreview)initWithView:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(UIDragPreviewParameters);
  v8.receiver = self;
  v8.super_class = (Class)UITargetedDragPreview;
  v6 = [(UITargetedPreview *)&v8 initWithView:v4 parameters:v5];

  return v6;
}

- (UITargetedDragPreview)initWithView:(id)a3 parameters:(id)a4 target:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UITargetedDragPreview;
  v10 = [(UITargetedPreview *)&v18 initWithView:v8 parameters:v9 target:a5];
  v11 = [v9 visiblePath];
  if (v11)
  {
    v12 = [v9 visiblePath];
  }
  else
  {
    v12 = v8;
  }
  [v12 bounds];
  v10->_liftAnchorPoint.x = v14 + v13 * 0.5;
  v10->_liftAnchorPoint.y = v16 + v15 * 0.5;
  if (v11) {

  }
  v10->__preferredStackOrder = -1;
  v10->__initialBadgeLocation = (CGPoint)_UICGPointNull_1;

  return v10;
}

- (_DUIPreview)_duiPreview
{
  duiPreview = self->_duiPreview;
  if (!duiPreview)
  {
    id v4 = [_DUIPreview alloc];
    v5 = [(UITargetedPreview *)self view];
    v6 = [(UITargetedPreview *)self target];
    v7 = [v6 container];
    id v8 = [(UITargetedPreview *)self parameters];
    id v9 = [(UITargetedPreview *)self target];
    [v9 center];
    v10 = -[_DUIPreview initWithView:container:parameters:center:](v4, "initWithView:container:parameters:center:", v5, v7, v8);

    v11 = [(UITargetedDragPreview *)self _springboardParameters];
    v12 = [v11 objectForKeyedSubscript:@"_UIPlatterViewSuppressMask"];
    uint64_t v13 = [v12 BOOLValue];

    [(_DUIPreview *)v10 setWantsSuppressedMask:v13];
    double v14 = [(UITargetedPreview *)self view];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;

    [(UITargetedDragPreview *)self liftAnchorPoint];
    -[_DUIPreview setLiftAnchorPoint:](v10, "setLiftAnchorPoint:", v19 / v16, v20 / v18);
    if ([(UITargetedDragPreview *)self _applyTargetTransformToFlock])
    {
      v21 = [(UITargetedPreview *)self target];
      v22 = v21;
      if (v21)
      {
        [v21 transform];
      }
      else
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v26 = 0u;
      }
      v25[0] = v26;
      v25[1] = v27;
      v25[2] = v28;
      [(_DUIPreview *)v10 setOverrideStackTransform:v25];
    }
    [(_DUIPreview *)v10 setPreferredStackOrder:[(UITargetedDragPreview *)self _preferredStackOrder]];
    [(UITargetedDragPreview *)self _initialBadgeLocation];
    -[_DUIPreview setInitialBadgeLocation:](v10, "setInitialBadgeLocation:");
    v23 = self->_duiPreview;
    self->_duiPreview = v10;

    duiPreview = self->_duiPreview;
  }
  return duiPreview;
}

- (void)setLiftAnchorPoint:(CGPoint)a3
{
  self->_didSetLiftAnchorPoint = 1;
  self->_liftAnchorPoint = a3;
}

- (void)_setPreferredStackOrder:(int64_t)a3
{
  if (self->__preferredStackOrder != a3)
  {
    self->__preferredStackOrder = a3;
    -[_DUIPreview setPreferredStackOrder:](self->_duiPreview, "setPreferredStackOrder:");
  }
}

- (void)_setInitialBadgeLocation:(CGPoint)a3
{
  if (a3.x != self->__initialBadgeLocation.x || a3.y != self->__initialBadgeLocation.y)
  {
    self->__initialBadgeLocation = a3;
    -[_DUIPreview setInitialBadgeLocation:](self->_duiPreview, "setInitialBadgeLocation:");
  }
}

- (void)_setApplyTargetTransformToFlock:(BOOL)a3
{
  if (self->__applyTargetTransformToFlock != a3)
  {
    self->__applyTargetTransformToFlock = a3;
    if ([(UITargetedDragPreview *)self _applyTargetTransformToFlock])
    {
      id v4 = [(UITargetedPreview *)self target];
      v5 = v4;
      if (v4)
      {
        [v4 transform];
      }
      else
      {
        long long v9 = 0u;
        long long v10 = 0u;
        long long v8 = 0u;
      }
      duiPreview = self->_duiPreview;
      v7[0] = v8;
      v7[1] = v9;
      v7[2] = v10;
      [(_DUIPreview *)duiPreview setOverrideStackTransform:v7];
    }
  }
}

- (id)imageComponent
{
  v42[2] = *MEMORY[0x1E4F143B8];
  imageComponent = self->_imageComponent;
  if (!imageComponent)
  {
    id v4 = [(UITargetedPreview *)self view];
    v5 = [(UITargetedPreview *)self parameters];
    uint64_t v6 = [v5 _previewMode];

    if ((unint64_t)(v6 - 3) >= 2)
    {
      if (v6 == 2)
      {
        long long v9 = [v4 snapshotView];
        long long v10 = [[_UIDraggingImageComponent alloc] initWithView:v9];
        v11 = self->_imageComponent;
        self->_imageComponent = v10;
      }
      else
      {
        if ([(id)UIApp _isSpringBoard]) {
          int v12 = 0;
        }
        else {
          int v12 = ![(UITargetedDragPreview *)self _preventAfterScreenUpdatesSnapshot];
        }
        BOOL CanBeRenderedAfterCommit = _UIViewCanBeRenderedAfterCommit(v4, v12);
        uint64_t v14 = [v4 accessibilityIgnoresInvertColors];
        double v15 = *MEMORY[0x1E4F1DAD8];
        double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        double v17 = [(UITargetedDragPreview *)self _duiPreview];
        [v17 contentSize];
        double v19 = v18;
        double v21 = v20;

        if (!CanBeRenderedAfterCommit) {
          goto LABEL_14;
        }
        id v22 = v4;
        v23 = [(UITargetedPreview *)self _viewToSnapshot];

        if (v23)
        {
          v24 = [(UITargetedPreview *)self _viewToSnapshot];

          [v24 bounds];
          objc_msgSend(v22, "convertRect:fromView:", v24);
          id v22 = v24;
        }
        else
        {
          double v26 = v16;
          double v27 = v19;
          double v28 = v21;
          double v25 = v15;
        }
        v41[0] = @"dst-rect";
        *(double *)v40 = v25;
        *(double *)&v40[1] = v26;
        *(double *)&v40[2] = v27;
        *(double *)&v40[3] = v28;
        v29 = [MEMORY[0x1E4F29238] valueWithBytes:v40 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        v41[1] = @"dst-size";
        v42[0] = v29;
        *(double *)v39 = v19;
        *(double *)&v39[1] = v21;
        v30 = [MEMORY[0x1E4F29238] valueWithBytes:v39 objCType:"{CGSize=dd}"];
        v42[1] = v30;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
        v32 = _UIRenderViewImageAfterCommit(v22, v31, v12);

        if (!v32)
        {
LABEL_14:
          v33 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", v19, v21);
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __39__UITargetedDragPreview_imageComponent__block_invoke;
          v37[3] = &unk_1E52DD280;
          id v38 = v4;
          v32 = [(UIGraphicsImageRenderer *)v33 imageWithActions:v37];
        }
        v34 = -[_UIDraggingImageComponent initWithImage:frame:ignoreAccessibilityFilters:]([_UIDraggingImageComponent alloc], "initWithImage:frame:ignoreAccessibilityFilters:", v32, v14, v15, v16, v19, v21);
        v35 = self->_imageComponent;
        self->_imageComponent = v34;
      }
    }
    else
    {
      v7 = [[_UIDraggingImageComponent alloc] initWithView:v4];
      long long v8 = self->_imageComponent;
      self->_imageComponent = v7;
    }
    imageComponent = self->_imageComponent;
  }
  return imageComponent;
}

void __39__UITargetedDragPreview_imageComponent__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 layer];
  uint64_t v4 = [v3 CGContext];

  [v5 renderInContext:v4];
}

- (void)_resetPreview
{
  duiPreview = self->_duiPreview;
  self->_duiPreview = 0;
}

- (void)takeLiftAnchorPoint:(CGPoint)a3 fromView:(id)a4
{
  if (!self->_didSetLiftAnchorPoint)
  {
    double y = a3.y;
    double x = a3.x;
    id v7 = a4;
    long long v8 = [(UITargetedPreview *)self target];
    long long v9 = [v8 container];
    objc_msgSend(v9, "convertPoint:fromView:", v7, x, y);
    double v11 = v10;
    double v13 = v12;

    uint64_t v14 = [(UITargetedPreview *)self target];
    [v14 center];
    double v16 = v15;
    double v18 = v17;

    memset(&v48, 0, sizeof(v48));
    double v19 = [(UITargetedPreview *)self view];
    double v20 = v19;
    if (v19) {
      [v19 transform];
    }
    else {
      memset(&v47, 0, sizeof(v47));
    }
    CGAffineTransformInvert(&v48, &v47);

    double v21 = v48.tx + v11 * v48.a + v13 * v48.c;
    double v22 = v48.ty + v11 * v48.b + v13 * v48.d;
    double v23 = v48.tx + v16 * v48.a + v18 * v48.c;
    double v24 = v48.ty + v16 * v48.b + v18 * v48.d;
    double v25 = [(UITargetedPreview *)self parameters];
    double v26 = [v25 visiblePath];
    if (v26)
    {
      double v27 = [(UITargetedPreview *)self parameters];
      double v28 = [v27 visiblePath];
      [v28 bounds];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
    }
    else
    {
      double v27 = [(UITargetedPreview *)self view];
      [v27 bounds];
      double v30 = v37;
      double v32 = v38;
      double v34 = v39;
      double v36 = v40;
    }

    double v41 = v22 - v24;
    double v42 = v21 - v23 + v30 + v34 * 0.5;
    double v43 = v41 + v32 + v36 * 0.5;
    v44 = [(UITargetedPreview *)self view];
    v45 = [v44 layer];
    int v46 = [v45 flipsHorizontalAxis];

    if (v46)
    {
      v49.origin.double x = v30;
      v49.origin.double y = v32;
      v49.size.width = v34;
      v49.size.height = v36;
      double v42 = CGRectGetWidth(v49) - v42;
    }
    -[UITargetedDragPreview setLiftAnchorPoint:](self, "setLiftAnchorPoint:", v42, v43, *(_OWORD *)&v47.a, *(_OWORD *)&v47.c, *(_OWORD *)&v47.tx);
    [(UITargetedDragPreview *)self _resetPreview];
  }
}

- (UITargetedDragPreview)retargetedPreviewWithTarget:(UIDragPreviewTarget *)newTarget
{
  v7.receiver = self;
  v7.super_class = (Class)UITargetedDragPreview;
  uint64_t v4 = [(UITargetedPreview *)&v7 retargetedPreviewWithTarget:newTarget];
  id v5 = [(UITargetedDragPreview *)self _springboardParameters];
  objc_msgSend(v4, "set_springboardParameters:", v5);

  return (UITargetedDragPreview *)v4;
}

- (void)_setPreviewMode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITargetedDragPreview;
  [(UITargetedPreview *)&v4 _setPreviewMode:a3];
  [(UITargetedDragPreview *)self _resetPreview];
}

- (void)_setPreviewContainer:(id)a3
{
  objc_storeStrong((id *)&self->__previewContainer, a3);
  [(UITargetedDragPreview *)self _setPreviewMode:6];
}

- (BOOL)_applyTargetTransformToFlock
{
  return self->__applyTargetTransformToFlock;
}

- (BOOL)_preventAfterScreenUpdatesSnapshot
{
  return self->_preventAfterScreenUpdatesSnapshot;
}

- (void)_setPreventAfterScreenUpdatesSnapshot:(BOOL)a3
{
  self->_preventAfterScreenUpdatesSnapshot = a3;
}

- (int64_t)_preferredStackOrder
{
  return self->__preferredStackOrder;
}

- (CGPoint)_initialBadgeLocation
{
  double x = self->__initialBadgeLocation.x;
  double y = self->__initialBadgeLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)_fenceHandler
{
  return self->__fenceHandler;
}

- (void)set_fenceHandler:(id)a3
{
}

- (CGPoint)liftAnchorPoint
{
  double x = self->_liftAnchorPoint.x;
  double y = self->_liftAnchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (_UIDragPreviewContainer)_previewContainer
{
  return self->__previewContainer;
}

- (NSDictionary)_springboardParameters
{
  return self->__springboardParameters;
}

- (void)set_springboardParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__springboardParameters, 0);
  objc_storeStrong((id *)&self->__previewContainer, 0);
  objc_storeStrong(&self->__fenceHandler, 0);
  objc_storeStrong((id *)&self->_imageComponent, 0);
  objc_storeStrong((id *)&self->_duiPreview, 0);
}

+ (UITargetedDragPreview)previewForURL:(NSURL *)url target:(UIDragPreviewTarget *)target
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = target;
  uint64_t v6 = +[UIURLDragPreviewView viewWithURL:url];
  objc_super v7 = [UITargetedDragPreview alloc];
  id v8 = v6;
  long long v9 = [UIDragPreviewParameters alloc];
  double v10 = (void *)MEMORY[0x1E4F29238];
  [v8 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = objc_msgSend(v10, "valueWithCGRect:", v12, v14, v16, v18);
  v24[0] = v19;
  double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  double v21 = [(UIPreviewParameters *)v9 initWithTextLineRects:v20];

  double v22 = [(UITargetedDragPreview *)v7 initWithView:v8 parameters:v21 target:v5];
  return v22;
}

+ (UITargetedDragPreview)previewForURL:(NSURL *)url title:(NSString *)title target:(UIDragPreviewTarget *)target
{
  v26[1] = *MEMORY[0x1E4F143B8];
  objc_super v7 = target;
  id v8 = +[UIURLDragPreviewView viewWithTitle:title URL:url];
  long long v9 = [UITargetedDragPreview alloc];
  id v10 = v8;
  double v11 = [UIDragPreviewParameters alloc];
  double v12 = (void *)MEMORY[0x1E4F29238];
  [v10 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = objc_msgSend(v12, "valueWithCGRect:", v14, v16, v18, v20);
  v26[0] = v21;
  double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  double v23 = [(UIPreviewParameters *)v11 initWithTextLineRects:v22];

  double v24 = [(UITargetedDragPreview *)v9 initWithView:v10 parameters:v23 target:v7];
  return v24;
}

@end