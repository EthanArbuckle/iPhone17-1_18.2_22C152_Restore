@interface UITargetedPreview
+ (UITargetedPreview)new;
- (BOOL)_captureHierarchyBelowSourceView;
- (BOOL)_isDefaultPreview;
- (BOOL)_isLikelyOpaque;
- (BOOL)_isRoughlyEqualToPreview:(id)a3;
- (BOOL)_isVisible;
- (BOOL)_mayInferCornerRadiusFromVisiblePath;
- (BOOL)_prefersUnmaskedPlatterStyle;
- (BOOL)_sourceViewIsInViewHierarchy;
- (BOOL)_springboardPlatterStyle;
- (BOOL)containsPoint:(CGPoint)a3 fromView:(id)a4;
- (BOOL)hasCustomTarget;
- (BOOL)isEqual:(id)a3;
- (CGRect)_frame;
- (CGSize)_sizeUsingPresentationLayer:(BOOL)a3;
- (CGSize)size;
- (NSArray)_accessoryViews;
- (NSArray)_matchableProperties;
- (NSArray)_overlayViews;
- (NSArray)_transferrableAnimationKeys;
- (NSCopying)_internalIdentifier;
- (UIPreviewParameters)parameters;
- (UIPreviewTarget)target;
- (UITargetedPreview)init;
- (UITargetedPreview)initWithView:(UIView *)view;
- (UITargetedPreview)initWithView:(UIView *)view parameters:(UIPreviewParameters *)parameters;
- (UITargetedPreview)initWithView:(UIView *)view parameters:(UIPreviewParameters *)parameters target:(UIPreviewTarget *)target;
- (UITargetedPreview)retargetedPreviewWithTarget:(UIPreviewTarget *)newTarget;
- (UIView)_viewToSnapshot;
- (UIView)overridePositionTrackingView;
- (UIView)view;
- (_UIPreviewProvider)_PreviewProvider;
- (_UIShape)_outlineShape;
- (id)_defaultTargetForView:(id)a3 withCenter:(CGPoint)a4 version:(unsigned int)a5;
- (id)_trueSourceViewIfPortal;
- (id)description;
- (int64_t)_previewMode;
- (void)_setAccessoryViews:(id)a3;
- (void)_setDefaultPreview:(BOOL)a3;
- (void)_setOverridePositionTrackingView:(id)a3;
- (void)_setPrefersUnmaskedPlatterStyle:(BOOL)a3;
- (void)_setPreviewMode:(int64_t)a3;
- (void)_setViewToSnapshot:(id)a3;
- (void)_transferAnimationsToView:(id)a3;
- (void)set_captureHierarchyBelowSourceView:(BOOL)a3;
- (void)set_internalIdentifier:(id)a3;
- (void)set_matchableProperties:(id)a3;
- (void)set_overlayViews:(id)a3;
- (void)set_springboardPlatterStyle:(BOOL)a3;
- (void)set_transferrableAnimationKeys:(id)a3;
@end

@implementation UITargetedPreview

- (UITargetedPreview)initWithView:(UIView *)view parameters:(UIPreviewParameters *)parameters target:(UIPreviewTarget *)target
{
  v10 = view;
  v11 = parameters;
  v12 = target;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"UITargetedPreview.m", 187, @"Invalid parameter not satisfying: %@", @"parameters != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"UITargetedPreview.m", 186, @"Invalid parameter not satisfying: %@", @"view != nil" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"UITargetedPreview.m", 188, @"Invalid parameter not satisfying: %@", @"target != nil" object file lineNumber description];

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)UITargetedPreview;
  v13 = [(UITargetedPreview *)&v27 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_view, view);
    uint64_t v15 = [(UIView *)v10 layer];
    layer = v14->_layer;
    v14->_layer = (CALayer *)v15;

    [(UIView *)v10 _cropInsets];
    v14->_cropInsets.top = v17;
    v14->_cropInsets.left = v18;
    v14->_cropInsets.bottom = v19;
    v14->_cropInsets.right = v20;
    objc_storeStrong((id *)&v14->_parameters, parameters);
    objc_storeStrong((id *)&v14->_target, target);
    v21 = [(UIView *)v14->_view window];
    v14->_sourceViewIsInViewHierarchy = v21 != 0;

    v14->_hasCustomTarget = 1;
    v22 = v14;
  }

  return v14;
}

- (UITargetedPreview)initWithView:(UIView *)view parameters:(UIPreviewParameters *)parameters
{
  v7 = view;
  v8 = parameters;
  if (!v7)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"UITargetedPreview.m", 208, @"Invalid parameter not satisfying: %@", @"view != nil" object file lineNumber description];
  }
  v9 = [(UIView *)v7 _window];

  if (!v9)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = objc_opt_class();
    v12 = [(UIView *)v7 _conciseParentDescription];
    [v10 handleFailureInMethod:a2, self, @"UITargetedPreview.m", 210, @"This %@ initializer requires that the view is in a window, but it is not. Either fix that, or use the other initializer that takes a target. (view: %@)", v11, v12 object file lineNumber description];
  }
  [(UIView *)v7 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(UIPreviewParameters *)v8 visiblePath];

  if (v21)
  {
    v22 = [(UIPreviewParameters *)v8 visiblePath];
    [v22 bounds];
    double v25 = v24 + v23 * 0.5;
    double v28 = v27 + v26 * 0.5;
    v29 = [(UIView *)v7 superview];
    -[UIView convertPoint:toView:](v7, "convertPoint:toView:", v29, v25, v28);
    double v31 = v30;
    double v33 = v32;
  }
  else
  {
    double v31 = v14 + v18 * 0.5;
    double v33 = v16 + v20 * 0.5;
  }
  v34 = -[UITargetedPreview _defaultTargetForView:withCenter:version:](self, "_defaultTargetForView:withCenter:version:", v7, 983040, v31, v33);
  v35 = [(UITargetedPreview *)self initWithView:v7 parameters:v8 target:v34];
  v35->_hasCustomTarget = 0;

  return v35;
}

- (UITargetedPreview)initWithView:(UIView *)view
{
  v5 = view;
  v6 = [(UIView *)v5 _window];

  if (!v6)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = objc_opt_class();
    double v17 = [(UIView *)v5 _conciseParentDescription];
    [v15 handleFailureInMethod:a2, self, @"UITargetedPreview.m", 229, @"This %@ initializer requires that the view is in a window, but it is not. Please correct this or use -initWithView:parameters:target: to provide a target with an explicit container. (view: %@)", v16, v17 object file lineNumber description];
  }
  v7 = objc_alloc_init(UIPreviewParameters);
  [(UIView *)v5 frame];
  v12 = -[UITargetedPreview _defaultTargetForView:withCenter:version:](self, "_defaultTargetForView:withCenter:version:", v5, 852992, v9 + v8 * 0.5, v11 + v10 * 0.5);
  double v13 = [(UITargetedPreview *)self initWithView:v5 parameters:v7 target:v12];
  v13->_hasCustomTarget = 0;

  return v13;
}

- (id)_defaultTargetForView:(id)a3 withCenter:(CGPoint)a4 version:(unsigned int)a5
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  int v8 = dyld_program_sdk_at_least();
  double v9 = [UIPreviewTarget alloc];
  double v10 = [v7 superview];
  if (v8)
  {
    if (v7) {
      [v7 transform];
    }
    else {
      memset(v14, 0, sizeof(v14));
    }
    uint64_t v11 = -[UIPreviewTarget initWithContainer:center:transform:](v9, "initWithContainer:center:transform:", v10, v14, x, y);
  }
  else
  {
    uint64_t v11 = -[UIPreviewTarget initWithContainer:center:](v9, "initWithContainer:center:", v10, x, y);
  }
  v12 = (void *)v11;

  return v12;
}

- (UITargetedPreview)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UITargetedPreview.m" lineNumber:258 description:@"not implemented"];

  return 0;
}

+ (UITargetedPreview)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"UITargetedPreview.m" lineNumber:263 description:@"not implemented"];

  return 0;
}

- (BOOL)containsPoint:(CGPoint)a3 fromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  target = self->_target;
  id v8 = a4;
  double v9 = [(UIPreviewTarget *)target container];
  objc_msgSend(v9, "convertPoint:fromView:", v8, x, y);
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  [(UIView *)self->_view bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  v22 = [(UIPreviewParameters *)self->_parameters visiblePath];

  if (v22)
  {
    double v23 = [(UIPreviewParameters *)self->_parameters visiblePath];
    [v23 bounds];
    CGFloat v15 = v24;
    CGFloat v17 = v25;
    CGFloat v19 = v26;
    CGFloat v21 = v27;
  }
  view = self->_view;
  if (view) {
    [(UIView *)view transform];
  }
  else {
    memset(&v34, 0, sizeof(v34));
  }
  CGAffineTransformInvert(&v35, &v34);
  v37.origin.double x = v15;
  v37.origin.double y = v17;
  v37.size.double width = v19;
  v37.size.double height = v21;
  CGRect v38 = CGRectApplyAffineTransform(v37, &v35);
  double width = v38.size.width;
  double height = v38.size.height;
  [(UIPreviewTarget *)self->_target center];
  v39.origin.double y = round(v31 - height * 0.5);
  v39.origin.double x = round(v32 - width * 0.5);
  v39.size.double width = width;
  v39.size.double height = height;
  v36.double x = v11;
  v36.double y = v13;
  return CGRectContainsPoint(v39, v36);
}

- (CGSize)size
{
  if (!dyld_program_sdk_at_least())
  {
    v5 = [(UITargetedPreview *)self view];
    [v5 bounds];
    double v8 = v11;
    double v10 = v12;
    goto LABEL_5;
  }
  v3 = [(UITargetedPreview *)self parameters];
  v4 = [v3 visiblePath];

  if (v4)
  {
    v5 = [(UITargetedPreview *)self parameters];
    v6 = [v5 visiblePath];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;

LABEL_5:
    double v13 = v8;
    double v14 = v10;
    goto LABEL_9;
  }
  [(UITargetedPreview *)self _sizeUsingPresentationLayer:0];
LABEL_9:
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)_sizeUsingPresentationLayer:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(UITargetedPreview *)self parameters];
  v6 = [v5 visiblePath];

  if (v6)
  {
    double v7 = [(UITargetedPreview *)self parameters];
    double v8 = [v7 visiblePath];
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v13 = self->_layer;
    double v7 = v13;
    if (v3)
    {
      double v14 = [(CALayer *)v13 presentationLayer];

      if (v14)
      {
        uint64_t v15 = [v7 presentationLayer];

        double v7 = (void *)v15;
      }
    }
    [v7 bounds];
    double v10 = v16 - (self->_cropInsets.left + self->_cropInsets.right);
    double v12 = v17 - (self->_cropInsets.top + self->_cropInsets.bottom);
  }

  double v18 = [(UITargetedPreview *)self target];
  [v18 _contentScale];
  double v20 = v10 * v19;
  CGFloat v21 = [(UITargetedPreview *)self target];
  [v21 _contentScale];
  double v23 = v12 * v22;

  double v24 = v20;
  double v25 = v23;
  result.double height = v25;
  result.double width = v24;
  return result;
}

- (UITargetedPreview)retargetedPreviewWithTarget:(UIPreviewTarget *)newTarget
{
  v5 = newTarget;
  if (!v5)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"UITargetedPreview.m", 324, @"Invalid parameter not satisfying: %@", @"newTarget != nil" object file lineNumber description];
  }
  id v6 = objc_alloc((Class)objc_opt_class());
  double v7 = [(UITargetedPreview *)self view];
  double v8 = [(UITargetedPreview *)self parameters];
  double v9 = (unsigned char *)[v6 initWithView:v7 parameters:v8 target:v5];

  objc_msgSend(v9, "_setDefaultPreview:", -[UITargetedPreview _isDefaultPreview](self, "_isDefaultPreview"));
  double v10 = [(UITargetedPreview *)self overridePositionTrackingView];
  [v9 _setOverridePositionTrackingView:v10];

  v9[48] = self->_sourceViewIsInViewHierarchy;
  objc_msgSend(v9, "set_captureHierarchyBelowSourceView:", -[UITargetedPreview _captureHierarchyBelowSourceView](self, "_captureHierarchyBelowSourceView"));

  return (UITargetedPreview *)v9;
}

- (BOOL)_isVisible
{
  BOOL v3 = [(UITargetedPreview *)self target];
  v4 = [v3 container];

  v5 = [(UITargetedPreview *)self view];
  id v6 = [v4 _window];
  if (!v6
    || ([v4 isHidden] & 1) != 0
    || ([v4 _isHiddenForReuse] & 1) != 0
    || ([v5 isHidden] & 1) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    int v7 = [v5 _isHiddenForReuse] ^ 1;
  }

  return v7;
}

- (BOOL)_isLikelyOpaque
{
  BOOL v3 = [(UITargetedPreview *)self parameters];
  uint64_t v4 = [v3 visiblePath];
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = [(UITargetedPreview *)self parameters];
    int v7 = [v6 visiblePath];
    int v8 = [v7 _isRoundedRect];

    if (!v8) {
      return 0;
    }
  }
  else
  {
  }
  double v10 = [(UITargetedPreview *)self parameters];
  double v11 = [v10 backgroundColor];
  double v12 = [(UITargetedPreview *)self view];
  double v13 = [v12 traitCollection];
  double v14 = [v11 resolvedColorWithTraitCollection:v13];
  char v15 = [v14 _isOpaque];

  return v15;
}

- (CGRect)_frame
{
  [(UITargetedPreview *)self size];
  double v4 = v3;
  double v6 = v5;
  int v7 = [(UITargetedPreview *)self target];
  [v7 center];
  double v9 = round(v8 - v6 * 0.5);
  double v11 = round(v10 - v4 * 0.5);

  double v12 = v11;
  double v13 = v9;
  double v14 = v4;
  double v15 = v6;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (_UIShape)_outlineShape
{
  double v3 = [(UITargetedPreview *)self view];
  double v4 = [v3 layer];

  if (v4)
  {
    [v4 cornerRadii];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F39AE0] + 16);
    long long v60 = *MEMORY[0x1E4F39AE0];
    long long v61 = v5;
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F39AE0] + 48);
    long long v62 = *(_OWORD *)(MEMORY[0x1E4F39AE0] + 32);
    long long v63 = v6;
    if ((CACornerRadiiEqualToRadii() & 1) == 0)
    {
      [v4 cornerRadii];
LABEL_13:
      double v20 = [(UITargetedPreview *)self target];
      [v20 _contentScale];
      double v22 = v21 * *(double *)&v59;
      double v23 = v21 * *((double *)&v59 + 1);
      double v24 = v21 * *(double *)&v57;
      double v25 = v21 * *((double *)&v57 + 1);
      double v26 = v21 * *(double *)&v58;
      double v27 = v21 * *((double *)&v58 + 1);

      [(UITargetedPreview *)self size];
      double v29 = v28;
      double v31 = v30;
      id v9 = [v4 cornerCurve];
      *(double *)&long long v60 = v22;
      *((double *)&v60 + 1) = v23;
      *(double *)&long long v61 = v24;
      *((double *)&v61 + 1) = v25;
      *(double *)&long long v62 = v26;
      *((double *)&v62 + 1) = v27;
      *(double *)&long long v63 = v22;
      *((double *)&v63 + 1) = v23;
      double v32 = +[_UIShape shapeWithRoundedRect:cornerRadii:cornerCurve:](_UIShape, "shapeWithRoundedRect:cornerRadii:cornerCurve:", &v60, v9, 0.0, 0.0, v29, v31);
      goto LABEL_27;
    }
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F39AE0] + 16);
    long long v60 = *MEMORY[0x1E4F39AE0];
    long long v61 = v7;
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F39AE0] + 48);
    long long v62 = *(_OWORD *)(MEMORY[0x1E4F39AE0] + 32);
    long long v63 = v8;
    if ((CACornerRadiiEqualToRadii() & 1) == 0)
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      goto LABEL_13;
    }
  }
  id v9 = (id)*MEMORY[0x1E4F39EA0];
  double v10 = [(UITargetedPreview *)self parameters];
  if ([v10 _previewMode] == 1)
  {
    double v11 = v9;
    double v12 = 13.0;
    uint64_t v13 = 15;
    id v9 = (id)*MEMORY[0x1E4F39EA8];
    goto LABEL_22;
  }
  BOOL v14 = [(UITargetedPreview *)self _mayInferCornerRadiusFromVisiblePath];
  double v15 = [v10 visiblePath];
  double v11 = v15;
  if (v14)
  {
    if ([v15 _isRoundedRect])
    {
      uint64_t v13 = [v11 _cornerMask];
      [v11 _cornerRadius];
      double v12 = v16;
      int v17 = [v11 _hasContinuousCorners];
      double v18 = (void *)*MEMORY[0x1E4F39EA8];
      if (!v17) {
        double v18 = v9;
      }
      id v19 = v18;

      id v9 = v19;
    }
    else
    {
      double v12 = 0.0;
      uint64_t v13 = 15;
    }
    goto LABEL_22;
  }
  if (!v15 || (uint64_t v33 = [v10 _previewMode], v11, v33 == 5))
  {
    double v11 = [(UITargetedPreview *)self _trueSourceViewIfPortal];
    uint64_t v34 = [(UITargetedPreview *)self view];
    uint64_t v35 = (uint64_t)v11;
    if (v11 != (void *)v34)
    {
      CGPoint v36 = (void *)v34;
      [v11 _cornerRadius];
      double v38 = v37;
      CGRect v39 = [(UITargetedPreview *)self view];
      [v39 _cornerRadius];
      double v41 = v40;

      if (v38 > v41)
      {
LABEL_20:
        v42 = [v11 layer];
        uint64_t v13 = [v42 maskedCorners];

        [v11 _cornerRadius];
        double v12 = v43;
        v44 = [v11 layer];
        uint64_t v45 = [v44 cornerCurve];

        id v9 = (id)v45;
LABEL_22:

        if (v13)
        {
          double v46 = v12;
        }
        else
        {
          uint64_t v13 = 15;
          double v46 = 0.0;
        }
        goto LABEL_25;
      }
      uint64_t v35 = [(UITargetedPreview *)self view];
    }

    double v11 = (void *)v35;
    goto LABEL_20;
  }
  uint64_t v55 = [v10 visiblePath];
  if (v55)
  {
    v51 = (void *)v55;
    uint64_t v53 = +[_UIShape shapeWithPath:v55];
    goto LABEL_26;
  }
  double v46 = 0.0;
  uint64_t v13 = 15;
LABEL_25:
  [(UITargetedPreview *)self size];
  double v48 = v47;
  double v50 = v49;
  v51 = [(UITargetedPreview *)self target];
  [v51 _contentScale];
  uint64_t v53 = +[_UIShape shapeWithRoundedRect:cornerRadius:cornerCurve:cornerMask:](_UIShape, "shapeWithRoundedRect:cornerRadius:cornerCurve:cornerMask:", v9, v13, 0.0, 0.0, v48, v50, v46 * v52);
LABEL_26:
  double v32 = (void *)v53;

LABEL_27:
  return (_UIShape *)v32;
}

- (BOOL)_isRoughlyEqualToPreview:(id)a3
{
  id v4 = a3;
  long long v5 = [(UITargetedPreview *)self view];
  long long v6 = [v4 view];

  if (v5 == v6)
  {
    BOOL v45 = 1;
  }
  else
  {
    [(UITargetedPreview *)self size];
    double v8 = v7;
    double v10 = v9;
    double v11 = [(UITargetedPreview *)self target];
    [v11 center];
    double v13 = round(v12 - v10 * 0.5);
    double v15 = round(v14 - v8 * 0.5);

    double v16 = [(UITargetedPreview *)self target];
    int v17 = [v16 container];
    objc_msgSend(v17, "convertRect:toView:", 0, v15, v13, v8, v10);
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;

    [v4 size];
    double v27 = v26;
    double v29 = v28;
    double v30 = [v4 target];
    [v30 center];
    double v32 = round(v31 - v29 * 0.5);
    double v34 = round(v33 - v27 * 0.5);

    uint64_t v35 = [v4 target];
    CGPoint v36 = [v35 container];
    objc_msgSend(v36, "convertRect:toView:", 0, v34, v32, v27, v29);
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;

    v47.origin.double x = v19;
    v47.origin.double y = v21;
    v47.size.double width = v23;
    v47.size.double height = v25;
    v48.origin.double x = v38;
    v48.origin.double y = v40;
    v48.size.double width = v42;
    v48.size.double height = v44;
    BOOL v45 = CGRectIntersectsRect(v47, v48);
  }

  return v45;
}

- (void)_transferAnimationsToView:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = [(UITargetedPreview *)self view];
  long long v6 = [v5 layer];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v7 = [(UITargetedPreview *)self _transferrableAnimationKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        double v13 = [v6 animationForKey:v12];
        double v14 = (void *)[v13 copy];

        if (v14)
        {
          [v6 removeAnimationForKey:v12];
          double v15 = [v4 layer];
          [v15 addAnimation:v14 forKey:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)_setPrefersUnmaskedPlatterStyle:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 0;
  }
  [(UITargetedPreview *)self _setPreviewMode:v3];
}

- (BOOL)_prefersUnmaskedPlatterStyle
{
  return [(UITargetedPreview *)self _previewMode] == 5;
}

- (void)set_springboardPlatterStyle:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 0;
  }
  [(UITargetedPreview *)self _setPreviewMode:v3];
}

- (BOOL)_springboardPlatterStyle
{
  return [(UITargetedPreview *)self _previewMode] == 4;
}

- (void)_setPreviewMode:(int64_t)a3
{
}

- (int64_t)_previewMode
{
  return [(UIPreviewParameters *)self->_parameters _previewMode];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v5 = (id *)v4;
    long long v6 = [(UITargetedPreview *)self _internalIdentifier];
    double v7 = [v5 _internalIdentifier];
    char v8 = [v6 isEqual:v7];

    if (v8)
    {
      char v9 = 1;
    }
    else
    {
      uint64_t v10 = [v5 view];
      double v11 = [(UITargetedPreview *)self view];
      if (v10 == v11
        && (int v12 = [v5 _isDefaultPreview],
            v12 == [(UITargetedPreview *)self _isDefaultPreview])
        && (int v13 = [v5 _sourceViewIsInViewHierarchy],
            v13 == [(UITargetedPreview *)self _sourceViewIsInViewHierarchy])
        && (int v14 = [v5 hasCustomTarget],
            v14 == [(UITargetedPreview *)self hasCustomTarget])
        && (uint64_t v15 = [v5 _previewMode], v15 == -[UITargetedPreview _previewMode](self, "_previewMode")))
      {
        long long v16 = [v5 overridePositionTrackingView];
        long long v17 = [(UITargetedPreview *)self overridePositionTrackingView];
        if (v16 == v17)
        {
          id WeakRetained = objc_loadWeakRetained(v5 + 10);
          id v20 = objc_loadWeakRetained((id *)&self->_viewToSnapshot);
          if (WeakRetained == v20 && v5[11] == self->__PreviewProvider)
          {
            uint64_t v21 = [v5 target];
            double v27 = [(UITargetedPreview *)self target];
            double v28 = v21;
            if ([v21 isEqual:v27])
            {
              double v22 = [v5 parameters];
              CGFloat v25 = [(UITargetedPreview *)self parameters];
              double v26 = v22;
              if ([v22 isEqual:v25])
              {
                double v24 = [v5 _accessoryViews];
                CGFloat v23 = [(UITargetedPreview *)self _accessoryViews];
                char v9 = objc_msgSend(v24, "isEqual:");
              }
              else
              {
                char v9 = 0;
              }
            }
            else
            {
              char v9 = 0;
            }
          }
          else
          {
            char v9 = 0;
          }
        }
        else
        {
          char v9 = 0;
        }
      }
      else
      {
        char v9 = 0;
      }
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  long long v5 = [(UITargetedPreview *)self view];
  if (v5)
  {
    long long v6 = NSString;
    double v7 = (objc_class *)objc_opt_class();
    char v8 = NSStringFromClass(v7);
    char v9 = [v6 stringWithFormat:@"<%@: %p>", v8, v5];
  }
  else
  {
    char v9 = @"(nil)";
  }
  uint64_t v10 = [(UITargetedPreview *)self parameters];
  if (v10)
  {
    double v11 = NSString;
    int v12 = (objc_class *)objc_opt_class();
    int v13 = NSStringFromClass(v12);
    int v14 = [v11 stringWithFormat:@"<%@: %p>", v13, v10];
  }
  else
  {
    int v14 = @"(nil)";
  }
  uint64_t v15 = [(UITargetedPreview *)self target];
  if (v15)
  {
    long long v16 = NSString;
    long long v17 = (objc_class *)objc_opt_class();
    long long v18 = NSStringFromClass(v17);
    long long v19 = [v16 stringWithFormat:@"<%@: %p>", v18, v15];
  }
  else
  {
    long long v19 = @"(nil)";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; view = %@; parameters = %@; target = %@>",
    v4,
    self,
    v9,
    v14,
  id v20 = v19);

  return v20;
}

- (id)_trueSourceViewIfPortal
{
  v2 = [(UITargetedPreview *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 sourceView];
    uint64_t v4 = v3;
    if (v3)
    {
      id v5 = v3;

      v2 = v5;
    }
  }
  return v2;
}

- (BOOL)_mayInferCornerRadiusFromVisiblePath
{
  uint64_t v3 = [(UITargetedPreview *)self parameters];
  uint64_t v4 = [v3 visiblePath];

  if (v4)
  {
    id v5 = [(UITargetedPreview *)self _trueSourceViewIfPortal];
    [v4 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [v5 _currentScreenScale];
    double v15 = UIRectRoundToScale(v7, v9, v11, v13, v14);
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    [v4 bounds];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    [v5 _currentScreenScale];
    v37.origin.double x = UIRectRoundToScale(v23, v25, v27, v29, v30);
    v37.origin.double y = v31;
    v37.size.double width = v32;
    v37.size.double height = v33;
    v36.origin.double x = v15;
    v36.origin.double y = v17;
    v36.size.double width = v19;
    v36.size.double height = v21;
    BOOL v34 = CGRectEqualToRect(v36, v37);
  }
  else
  {
    BOOL v34 = 0;
  }

  return v34;
}

- (BOOL)_sourceViewIsInViewHierarchy
{
  return self->_sourceViewIsInViewHierarchy;
}

- (UIPreviewTarget)target
{
  return self->_target;
}

- (UIView)view
{
  return self->_view;
}

- (UIPreviewParameters)parameters
{
  return self->_parameters;
}

- (BOOL)_isDefaultPreview
{
  return self->_defaultPreview;
}

- (void)_setDefaultPreview:(BOOL)a3
{
  self->_defaultPreview = a3;
}

- (UIView)_viewToSnapshot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewToSnapshot);
  return (UIView *)WeakRetained;
}

- (void)_setViewToSnapshot:(id)a3
{
}

- (_UIPreviewProvider)_PreviewProvider
{
  return self->__PreviewProvider;
}

- (BOOL)hasCustomTarget
{
  return self->_hasCustomTarget;
}

- (NSCopying)_internalIdentifier
{
  return self->__internalIdentifier;
}

- (void)set_internalIdentifier:(id)a3
{
}

- (NSArray)_transferrableAnimationKeys
{
  return self->__transferrableAnimationKeys;
}

- (void)set_transferrableAnimationKeys:(id)a3
{
}

- (NSArray)_matchableProperties
{
  return self->__matchableProperties;
}

- (void)set_matchableProperties:(id)a3
{
}

- (BOOL)_captureHierarchyBelowSourceView
{
  return self->__captureHierarchyBelowSourceView;
}

- (void)set_captureHierarchyBelowSourceView:(BOOL)a3
{
  self->__captureHierarchyBelowSourceView = a3;
}

- (NSArray)_overlayViews
{
  return self->__overlayViews;
}

- (void)set_overlayViews:(id)a3
{
}

- (UIView)overridePositionTrackingView
{
  return self->_overridePositionTrackingView;
}

- (void)_setOverridePositionTrackingView:(id)a3
{
}

- (NSArray)_accessoryViews
{
  return self->__accessoryViews;
}

- (void)_setAccessoryViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accessoryViews, 0);
  objc_storeStrong((id *)&self->_overridePositionTrackingView, 0);
  objc_storeStrong((id *)&self->__overlayViews, 0);
  objc_storeStrong((id *)&self->__matchableProperties, 0);
  objc_storeStrong((id *)&self->__transferrableAnimationKeys, 0);
  objc_storeStrong((id *)&self->__internalIdentifier, 0);
  objc_storeStrong((id *)&self->__PreviewProvider, 0);
  objc_destroyWeak((id *)&self->_viewToSnapshot);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end