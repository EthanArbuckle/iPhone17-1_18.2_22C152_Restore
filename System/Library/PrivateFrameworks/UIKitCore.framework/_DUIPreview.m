@interface _DUIPreview
+ (BOOL)supportsSecureCoding;
+ (double)defaultStackAlpha;
+ (id)defaultPreviewWithFrame:(CGRect)a3;
- (BOOL)avoidAnimation;
- (BOOL)hasCustomOutline;
- (BOOL)hidesSourceView;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOversized;
- (BOOL)textMode;
- (BOOL)wantsSuppressedMask;
- (CGAffineTransform)liftTransform;
- (CGAffineTransform)overrideStackTransform;
- (CGPoint)contentOffset;
- (CGPoint)initialBadgeLocation;
- (CGPoint)liftAnchorPoint;
- (CGPoint)originalCenter;
- (CGPoint)originalCenterInCoordinateSpace;
- (CGPoint)unscaledAnchorPoint;
- (CGSize)boundingSize;
- (CGSize)contentSize;
- (CGSize)scaledSize;
- (CGSize)unscaledSize;
- (CGSize)viewScaleFactor;
- (UIBezierPath)effectiveShadowPath;
- (UIBezierPath)outline;
- (UIBezierPath)shadowPath;
- (UIColor)backgroundColor;
- (UIDragPreviewParameters)parameters;
- (_DUIPreview)init;
- (_DUIPreview)initWithBounds:(CGRect)a3 outline:(id)a4;
- (_DUIPreview)initWithCoder:(id)a3;
- (_DUIPreview)initWithView:(id)a3 container:(id)a4 parameters:(id)a5;
- (_DUIPreview)initWithView:(id)a3 container:(id)a4 parameters:(id)a5 center:(CGPoint)a6;
- (_DUITargetLayerDescriptor)coordinateSpaceSourceLayerContext;
- (_UIDragPreviewShadowProperties)shadowProperties;
- (double)_topOffset;
- (double)backAlpha;
- (double)liftAlpha;
- (double)originalRotation;
- (double)scaleFactor;
- (double)stackAlpha;
- (double)topAlpha;
- (id)_initWithView:(id)a3 container:(id)a4 parameters:(id)a5 platformCenter:(CAPoint3D)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)preferredStackOrder;
- (int64_t)previewMode;
- (unint64_t)coordinateSpaceSourceLayerRenderID;
- (unsigned)coordinateSpaceSourceContextID;
- (void)_applyPropertiesFromPreviewParameters:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAvoidAnimation:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCoordinateSpaceSourceContextID:(unsigned int)a3;
- (void)setCoordinateSpaceSourceLayerContext:(id)a3;
- (void)setCoordinateSpaceSourceLayerRenderID:(unint64_t)a3;
- (void)setHasCustomOutline:(BOOL)a3;
- (void)setHidesSourceView:(BOOL)a3;
- (void)setInitialBadgeLocation:(CGPoint)a3;
- (void)setLiftAnchorPoint:(CGPoint)a3;
- (void)setOriginalCenter:(CGPoint)a3;
- (void)setOriginalCenterInCoordinateSpace:(CGPoint)a3;
- (void)setOriginalRotation:(double)a3;
- (void)setOutline:(id)a3;
- (void)setOverrideStackTransform:(CGAffineTransform *)a3;
- (void)setPreferredStackOrder:(int64_t)a3;
- (void)setPreviewMode:(int64_t)a3;
- (void)setShadowPath:(id)a3;
- (void)setShadowProperties:(id)a3;
- (void)setTextMode:(BOOL)a3;
- (void)setWantsSuppressedMask:(BOOL)a3;
@end

@implementation _DUIPreview

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultPreviewWithFrame:(CGRect)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithBounds:outline:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.size.width, a3.size.height);
  return v3;
}

- (_DUIPreview)init
{
  v3 = +[UIBezierPath bezierPath];
  v4 = -[_DUIPreview initWithBounds:outline:](self, "initWithBounds:outline:", v3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v4;
}

- (_DUIPreview)initWithBounds:(CGRect)a3 outline:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)_DUIPreview;
  v8 = [(_DUIPreview *)&v29 init];
  if (v8)
  {
    uint64_t v9 = +[UIColor systemBackgroundColor];
    backgroundColor = v8->_backgroundColor;
    v8->_backgroundColor = (UIColor *)v9;

    v8->_contentSize.CGFloat width = width;
    v8->_contentSize.CGFloat height = height;
    v8->_contentSize.depth = 0.0;
    v8->_hidesSourceView = 1;
    v11 = (UIBezierPath *)[v7 copy];
    [(UIBezierPath *)v11 bounds];
    if (v11)
    {
      double v16 = v12;
      double v17 = v13;
      if (!CGRectIsNull(*(CGRect *)&v12))
      {
        v8->_contentOffset.x = -v16;
        v8->_contentOffset.y = -v17;
        CGAffineTransformMakeTranslation(&v28, -v16, -v17);
        [(UIBezierPath *)v11 applyTransform:&v28];
      }
    }
    __asm { FMOV            V0.2D, #1.0 }
    v8->_viewScaleFactor = _Q0;
    outline = v8->_outline;
    v8->_outline = v11;

    uint64_t v24 = MEMORY[0x1E4F1DAB8];
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v8->_overrideStackTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v8->_overrideStackTransform.c = v25;
    *(_OWORD *)&v8->_overrideStackTransform.tx = *(_OWORD *)(v24 + 32);
    v8->_initialBadgeLocation = (CGPoint)_UICGPointNull;
    v8->_preferredStackOrder = -1;
    v26 = v8;
  }

  return v8;
}

- (_DUIPreview)initWithView:(id)a3 container:(id)a4 parameters:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v10 frame];
  v15 = -[_DUIPreview initWithView:container:parameters:center:](self, "initWithView:container:parameters:center:", v10, v9, v8, v12 + v11 * 0.5, v14 + v13 * 0.5);

  return v15;
}

- (_DUIPreview)initWithView:(id)a3 container:(id)a4 parameters:(id)a5 center:(CGPoint)a6
{
  return (_DUIPreview *)-[_DUIPreview _initWithView:container:parameters:platformCenter:](self, "_initWithView:container:parameters:platformCenter:", a3, a4, a5, a6.x, a6.y, 0.0);
}

- (id)_initWithView:(id)a3 container:(id)a4 parameters:(id)a5 platformCenter:(CAPoint3D)a6
{
  double y = a6.y;
  double x = a6.x;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = v14;
  if (v12)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v82 = [MEMORY[0x1E4F28B00] currentHandler];
    [v82 handleFailureInMethod:a2, self, @"DUIPreview.m", 248, @"Invalid parameter not satisfying: %@", @"view != nil" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  v83 = [MEMORY[0x1E4F28B00] currentHandler];
  [v83 handleFailureInMethod:a2, self, @"DUIPreview.m", 249, @"Invalid parameter not satisfying: %@", @"parameters != nil" object file lineNumber description];

LABEL_3:
  double v16 = [v15 visiblePath];
  double v17 = (void *)[v16 copy];

  self->_hasCustomOutline = v17 != 0;
  v18 = [v12 traitCollection];
  v19 = _UIDragAndDropGetPlatformMetrics([v18 userInterfaceIdiom]);

  if (!v17)
  {
    v20 = [v19 defaultPreviewOutlineProvider];
    double v17 = ((void (**)(void, id))v20)[2](v20, v12);
  }
  v86 = v19;
  [v12 bounds];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  id v29 = v12;
  v30 = v29;
  double v85 = y;
  if (v12)
  {
    [v29 transform];
    long double a = v93.a;
    long double b = v93.b;
    long double c = v93.c;
    long double d = v93.d;
  }
  else
  {
    memset(&v93, 0, sizeof(v93));
    long double d = 0.0;
    long double b = 0.0;
    long double c = 0.0;
    long double a = 0.0;
  }
  long double v35 = hypot(a, c);
  double v36 = hypot(b, d);
  v37 = [v30 superview];
  double v38 = DUIPreviewConvertSizeFromViewToView(v37, 0, v35, v36);
  sylong double a = v39;

  memset(&v93, 0, sizeof(v93));
  v94.origin.double x = v22;
  v94.origin.double y = v24;
  v94.size.CGFloat width = v26;
  v94.size.CGFloat height = v28;
  CGFloat v40 = CGRectGetWidth(v94) * 0.5;
  v95.origin.double x = v22;
  v95.origin.double y = v24;
  v95.size.CGFloat width = v26;
  v95.size.CGFloat height = v28;
  CGFloat Height = CGRectGetHeight(v95);
  CGAffineTransformMakeTranslation(&v93, v40, Height * 0.5);
  memset(&v92, 0, sizeof(v92));
  CGAffineTransform v90 = v93;
  CGAffineTransformScale(&t1, &v90, v38, sya);
  CGAffineTransform v90 = v93;
  CGAffineTransformInvert(&t2, &v90);
  CGAffineTransformConcat(&v92, &t1, &t2);
  CGAffineTransform v90 = v92;
  [v17 applyTransform:&v90];
  v42 = (CGPoint *)MEMORY[0x1E4F1DAD8];
  double v43 = *MEMORY[0x1E4F1DAD8];
  double v44 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v96.origin.double x = v22;
  v96.origin.double y = v24;
  v96.size.CGFloat width = v26;
  v96.size.CGFloat height = v28;
  double v45 = v38 * CGRectGetWidth(v96);
  v97.origin.double x = v22;
  v97.origin.double y = v24;
  v97.size.CGFloat width = v26;
  v97.size.CGFloat height = v28;
  v46 = -[_DUIPreview initWithBounds:outline:](self, "initWithBounds:outline:", v17, v43, v44, v45, sya * CGRectGetHeight(v97));
  if (v46)
  {
    if (v13) {
      v47 = v13;
    }
    else {
      v47 = v30;
    }
    id v48 = v47;
    v49 = [v15 backgroundColor];
    sdouble y = v48;
    v50 = [v48 traitCollection];
    v51 = [v49 resolvedColorWithTraitCollection:v50];
    uint64_t v52 = [v51 copy];
    backgroundColor = v46->_backgroundColor;
    v46->_backgroundColor = (UIColor *)v52;

    if (objc_opt_respondsToSelector())
    {
      uint64_t v54 = [v15 _shadowProperties];
      shadowProperties = v46->_shadowProperties;
      v46->_shadowProperties = (_UIDragPreviewShadowProperties *)v54;
    }
    v46->_originalCenter = *v42;
    double RotationAngleFromViewToView = DUIPreviewGetRotationAngleFromViewToView(v13, 0, 0);
    memset(&v90, 0, sizeof(v90));
    if (v12)
    {
      [v30 transform];
      long double v58 = v90.a;
      long double v57 = v90.b;
    }
    else
    {
      long double v58 = 0.0;
      long double v57 = 0.0;
    }
    v46->_originalRotation = RotationAngleFromViewToView + atan2(v57, v58);
    v59 = [v13 _window];
    if (v59)
    {
      id v60 = v13;
      double v61 = v85;
    }
    else
    {
      v62 = [v30 _window];
      double v61 = v85;
      if (v62)
      {
        id v60 = [v30 superview];
      }
      else
      {
        id v60 = 0;
      }
    }
    if (!v60) {
      goto LABEL_32;
    }
    id v63 = v60;
    v64 = [v63 layer];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v84 = v13;
      id v65 = v63;
      do
      {
        v66 = v64;
        v67 = v65;
        v68 = [v65 superview];
        objc_msgSend(v67, "convertPoint:toView:", v68, x, v61);
        double x = v69;
        double v61 = v70;
        id v65 = v68;

        v64 = [v65 layer];

        objc_opt_class();
      }
      while ((objc_opt_isKindOfClass() & 1) != 0);

      id v13 = v84;
      if (!v65) {
        goto LABEL_31;
      }
    }
    else
    {

      id v65 = v63;
    }
    v46->_originalCenterInCoordinateSpace.double x = x;
    v46->_originalCenterInCoordinateSpace.double y = v61;
    v46->_originalCenterInCoordinateSpace.z = 0.0;
    v71 = objc_alloc_init(_DUITargetLayerDescriptor);
    coordinateSpaceSourceLayerContext = v46->_coordinateSpaceSourceLayerContext;
    v46->_coordinateSpaceSourceLayerContext = v71;

    v73 = [v65 layer];
    v74 = [v73 context];
    -[_DUITargetLayerDescriptor setContextID:](v46->_coordinateSpaceSourceLayerContext, "setContextID:", [v74 contextId]);

    v75 = [v65 layer];
    [(_DUITargetLayerDescriptor *)v46->_coordinateSpaceSourceLayerContext setRenderID:CALayerGetRenderId()];

    v76 = [v65 window];
    v77 = [v76 windowScene];

    v78 = [v77 systemShellHostingEnvironment];
    v79 = [v78 systemShellHostingSpaceIdentifier];
    [(_DUITargetLayerDescriptor *)v46->_coordinateSpaceSourceLayerContext setSystemShellHostingSpaceIdentifier:v79];

LABEL_31:
LABEL_32:
    [(_DUIPreview *)v46 _applyPropertiesFromPreviewParameters:v15];
    v80 = v46;
  }
  return v46;
}

- (UIDragPreviewParameters)parameters
{
  v3 = (void *)[(UIBezierPath *)self->_outline copy];
  [v3 bounds];
  if (!CGRectIsNull(v12))
  {
    CGAffineTransformMakeTranslation(&v10, -self->_contentOffset.x, -self->_contentOffset.y);
    [v3 applyTransform:&v10];
    [(_DUIPreview *)self viewScaleFactor];
    CGFloat v5 = 1.0 / v4;
    [(_DUIPreview *)self viewScaleFactor];
    CGAffineTransformMakeScale(&v9, v5, 1.0 / v6);
    [v3 applyTransform:&v9];
  }
  id v7 = [(UIPreviewParameters *)[UIDragPreviewParameters alloc] _initWithMode:self->_previewMode visiblePath:v3 backgroundColor:self->_backgroundColor];
  [v7 setShadowPath:self->_shadowPath];

  return (UIDragPreviewParameters *)v7;
}

- (void)_applyPropertiesFromPreviewParameters:(id)a3
{
  id v4 = a3;
  self->_previewMode = [v4 _previewMode];
  CGFloat v5 = [v4 shadowPath];

  shadowPath = self->_shadowPath;
  self->_shadowPath = v5;
}

- (unsigned)coordinateSpaceSourceContextID
{
  v2 = [(_DUIPreview *)self coordinateSpaceSourceLayerContext];
  unsigned int v3 = [v2 contextID];

  return v3;
}

- (unint64_t)coordinateSpaceSourceLayerRenderID
{
  v2 = [(_DUIPreview *)self coordinateSpaceSourceLayerContext];
  unint64_t v3 = [v2 renderID];

  return v3;
}

- (void)setCoordinateSpaceSourceLayerRenderID:(unint64_t)a3
{
  CGFloat v5 = [(_DUIPreview *)self coordinateSpaceSourceLayerContext];

  if (!v5)
  {
    double v6 = objc_opt_new();
    [(_DUIPreview *)self setCoordinateSpaceSourceLayerContext:v6];
  }
  id v7 = [(_DUIPreview *)self coordinateSpaceSourceLayerContext];
  [v7 setRenderID:a3];
}

- (void)setCoordinateSpaceSourceContextID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  CGFloat v5 = [(_DUIPreview *)self coordinateSpaceSourceLayerContext];

  if (!v5)
  {
    double v6 = objc_opt_new();
    [(_DUIPreview *)self setCoordinateSpaceSourceLayerContext:v6];
  }
  id v7 = [(_DUIPreview *)self coordinateSpaceSourceLayerContext];
  [v7 setContextID:v3];
}

+ (double)defaultStackAlpha
{
  int v2 = _AXSEnhanceBackgroundContrastEnabled();
  double result = 1.0;
  if (!v2)
  {
    int v4 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_UIDragPlatterStackAlpha, @"UIDragPlatterStackAlpha");
    double result = *(double *)&qword_1E8FD50E0;
    if (v4) {
      return 0.8;
    }
  }
  return result;
}

- (double)backAlpha
{
  int v2 = _AXSEnhanceBackgroundContrastEnabled();
  double result = 1.0;
  if (!v2) {
    return 0.5;
  }
  return result;
}

- (UIColor)backgroundColor
{
  if ((unint64_t)(self->_previewMode - 3) >= 2) {
    int v2 = self->_backgroundColor;
  }
  else {
    int v2 = 0;
  }
  return v2;
}

- (CGSize)boundingSize
{
  if ([(_DUIPreview *)self textMode])
  {
    +[UIDragPreview textBoundingSize];
  }
  else
  {
    +[UIDragPreview defaultBoundingSize];
  }
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (double)liftAlpha
{
  return 1.0;
}

- (CGAffineTransform)liftTransform
{
  double v3 = self;
  CGFloat c = self[2].c;
  if (*(void *)&c > 6uLL) {
    goto LABEL_6;
  }
  if (((1 << SLOBYTE(c)) & 0x46) != 0)
  {
    uint64_t v6 = MEMORY[0x1E4F1DAB8];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->long double a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->CGFloat c = v7;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v6 + 32);
    return self;
  }
  if (((1 << SLOBYTE(c)) & 0x18) != 0)
  {
    double v8 = 1.001;
  }
  else
  {
LABEL_6:
    [(CGAffineTransform *)self unscaledSize];
    double v10 = v9;
    [(CGAffineTransform *)v3 unscaledSize];
    if (v10 >= v11) {
      double v12 = v10;
    }
    else {
      double v12 = v11;
    }
    double v8 = _UIPlatterLiftScaleForEdgeDimensions(v12);
  }
  return CGAffineTransformMakeScale(retstr, v8, v8);
}

- (CGPoint)originalCenterInCoordinateSpace
{
  double x = self->_originalCenterInCoordinateSpace.x;
  double y = self->_originalCenterInCoordinateSpace.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginalCenterInCoordinateSpace:(CGPoint)a3
{
  self->_originalCenterInCoordinateSpace.double x = a3.x;
  self->_originalCenterInCoordinateSpace.double y = a3.y;
  self->_originalCenterInCoordinateSpace.z = 0.0;
}

- (void)setLiftAnchorPoint:(CGPoint)a3
{
  self->_liftAnchorPoint = a3;
}

- (BOOL)isOversized
{
  int64_t previewMode = self->_previewMode;
  if (previewMode == 2 || previewMode == 4) {
    return 0;
  }
  [(_DUIPreview *)self unscaledSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = +[UIScreen mainScreen];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;

  double v14 = v6 * v8;
  int v15 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_UIDragPlatterMaximumScreenFraction, @"UIDragPlatterMaximumScreenFraction");
  double v16 = *(double *)&qword_1E8FD50D0;
  if (v15) {
    double v16 = 0.5;
  }
  return v14 > v11 * v13 * v16;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)scaledSize
{
  [(_DUIPreview *)self scaleFactor];
  double v4 = v3;
  [(_DUIPreview *)self unscaledSize];
  double v6 = v4 * v5;
  double v8 = v4 * v7;
  result.double height = v8;
  result.double width = v6;
  return result;
}

- (double)scaleFactor
{
  double v3 = +[UIDevice currentDevice];
  double v4 = _UIDragAndDropGetPlatformMetrics([v3 userInterfaceIdiom]);

  [v4 previewMinimumSize];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  [(_DUIPreview *)self unscaledSize];
  double v10 = v9;
  double v12 = v11;
  +[UIDragPreview textBoundingSize];
  double v14 = v13;
  double v16 = v15;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __26___DUIPreview_scaleFactor__block_invoke;
  aBlock[3] = &unk_1E52EC138;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v10;
  *(double *)&aBlock[6] = v12;
  aBlock[7] = v6;
  aBlock[8] = v8;
  double v17 = _Block_copy(aBlock);
  v18 = v17;
  int64_t previewMode = self->_previewMode;
  double v20 = 1.0;
  if ((unint64_t)(previewMode - 3) >= 2 && previewMode != 6)
  {
    if (previewMode == 1 && v12 < v16)
    {
      if (v10 >= v14)
      {
        double v21 = v14 / v10;
        if (v14 / v10 < 40.0 / v12) {
          double v21 = 40.0 / v12;
        }
        double v20 = fmax(fmin(v21, 1.0), 0.2);
      }
    }
    else
    {
      double v20 = (*((double (**)(void *))v17 + 2))(v17);
    }
  }

  return v20;
}

- (double)stackAlpha
{
  int v3 = _AXSEnhanceBackgroundContrastEnabled();
  double result = 1.0;
  if (!v3)
  {
    unint64_t v5 = self->_previewMode - 2;
    if (v5 >= 5 || ((0x17u >> v5) & 1) == 0)
    {
      int v6 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_UIDragPlatterStackAlpha, @"UIDragPlatterStackAlpha");
      double result = *(double *)&qword_1E8FD50E0;
      if (v6) {
        return 0.8;
      }
    }
  }
  return result;
}

- (double)topAlpha
{
  return 1.0;
}

- (CGPoint)unscaledAnchorPoint
{
  if ((unint64_t)(self->_previewMode - 3) > 1)
  {
    [(_DUIPreview *)self _topOffset];
    double v6 = v5;
    [(_DUIPreview *)self unscaledSize];
    double v4 = fmax(fmin(v6 / v7, 1.0), 0.0);
    double v3 = 0.5;
  }
  else
  {
    [(_DUIPreview *)self liftAnchorPoint];
  }
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGSize)unscaledSize
{
  double v3 = [(_DUIPreview *)self outline];

  if (v3)
  {
    double v4 = [(_DUIPreview *)self outline];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;

    double v9 = v6;
    double v10 = v8;
  }
  else
  {
    [(_DUIPreview *)self contentSize];
  }
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (double)_topOffset
{
  if (![(_DUIPreview *)self textMode]) {
    return 33.0;
  }
  int v2 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_UIDragPlatterTextModeTouchOffset, @"UIDragPlatterTextModeTouchOffset");
  double result = *(double *)&qword_1E8FD50F0;
  if (v2) {
    return 20.0;
  }
  return result;
}

- (void)setTextMode:(BOOL)a3
{
}

- (BOOL)textMode
{
  return [(_DUIPreview *)self previewMode] == 1;
}

- (UIBezierPath)effectiveShadowPath
{
  double v3 = [(_DUIPreview *)self shadowPath];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(_DUIPreview *)self outline];
  }
  double v6 = v5;

  return (UIBezierPath *)v6;
}

- (_DUIPreview)initWithCoder:(id)a3
{
  v63[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_DUIPreview *)self init];
  if (v5)
  {
    double v6 = (void *)MEMORY[0x1E4F1CAD0];
    v63[0] = objc_opt_class();
    v63[1] = objc_opt_class();
    v63[2] = objc_opt_class();
    v63[3] = objc_opt_class();
    v63[4] = objc_opt_class();
    v63[5] = objc_opt_class();
    double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:6];
    double v8 = [v6 setWithArray:v7];

    uint64_t v9 = objc_opt_class();
    v62 = v5;
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"backgroundColor"];
    backgroundColor = v62->_backgroundColor;
    v62->_backgroundColor = (UIColor *)v10;

    double v61 = v62;
    [v4 decodeCGPointForKey:@"contentOffset"];
    v62->_contentOffset.double x = v12;
    v61->_contentOffset.double y = v13;
    id v60 = v61;
    [v4 decodeUISize3DForKey:@"contentSize"];
    v61->_contentSize.double width = v14;
    v60->_contentSize.double height = v15;
    v60->_contentSize.depth = v16;
    v59 = v60;
    v59->_hidesSourceView = [v4 decodeBoolForKey:@"hidesSourceView"];
    long double v58 = v59;
    [v4 decodeCGPointForKey:@"liftAnchorPoint"];
    v59->_liftAnchorPoint.double x = v17;
    v58->_liftAnchorPoint.double y = v18;
    long double v57 = v58;
    [v4 decodeCGPointForKey:@"originalCenter"];
    v58->_originalCenter.double x = v19;
    v57->_originalCenter.double y = v20;
    v56 = v57;
    [v4 decodeDoubleForKey:@"originalRotation"];
    v56->_originalRotation = v21;
    v55 = v56;
    objc_msgSend(v4, "ui_decodeCAPoint3DForKey:", @"originalCenterInCoordinateSpace");
    v56->_originalCenterInCoordinateSpace.double x = v22;
    *(void *)&v55->_originalCenterInCoordinateSpace.double y = v23;
    *(void *)&v55->_originalCenterInCoordinateSpace.z = v24;
    uint64_t v25 = objc_opt_class();
    uint64_t v54 = v55;
    uint64_t v26 = [v4 decodeObjectOfClass:v25 forKey:@"coordinateSpaceSourceLayerContext"];
    double v27 = (void *)v54[12];
    v54[12] = v26;

    uint64_t v28 = objc_opt_class();
    v53 = v54;
    uint64_t v29 = [v4 decodeObjectOfClass:v28 forKey:@"outline"];
    v30 = (void *)v53[9];
    v53[9] = v29;

    uint64_t v52 = v53;
    v52[57] = [v4 decodeBoolForKey:@"hasCustomOutline"];
    uint64_t v31 = objc_opt_class();
    v51 = v52;
    uint64_t v32 = [v4 decodeObjectOfClass:v31 forKey:@"shadowPath"];
    v33 = (void *)v51[10];
    v51[10] = v32;

    v50 = v51;
    v50[14] = [v4 decodeIntegerForKey:@"previewMode"];
    v49 = v50;
    v49[58] = [v4 decodeBoolForKey:@"avoidAnimation"];
    id v48 = v49;
    v48[59] = [v4 decodeBoolForKey:@"wantsSuppressedMask"];
    uint64_t v34 = objc_opt_class();
    v47 = v48;
    uint64_t v35 = [v4 decodeObjectOfClass:v34 forKey:@"shadowProperties"];
    double v36 = (void *)*((void *)v47 + 11);
    *((void *)v47 + 11) = v35;

    v37 = v47;
    if (v4)
    {
      [v4 decodeCGAffineTransformForKey:@"overrideStackTransform"];
    }
    else
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v44 = 0u;
    }
    *((_OWORD *)v47 + 13) = v44;
    *((_OWORD *)v47 + 14) = v45;
    *((_OWORD *)v47 + 15) = v46;
    double v43 = v37;
    [v4 decodeCGPointForKey:@"initialBadgeLocation"];
    v37[18] = v38;
    v43[19] = v39;
    v42 = v43;
    v42[15] = [v4 decodeIntegerForKey:@"preferredStackOrder"];
    CGFloat v40 = v42;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (char *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong((id *)v4 + 8, self->_backgroundColor);
  *((_OWORD *)v4 + 8) = self->_contentOffset;
  long long v5 = *(_OWORD *)&self->_contentSize.width;
  *((void *)v4 + 3) = *(void *)&self->_contentSize.depth;
  *(_OWORD *)(v4 + 8) = v5;
  v4[56] = self->_hidesSourceView;
  *((_OWORD *)v4 + 11) = self->_liftAnchorPoint;
  *((_OWORD *)v4 + 10) = self->_originalCenter;
  *((void *)v4 + 13) = *(void *)&self->_originalRotation;
  long long v6 = *(_OWORD *)&self->_originalCenterInCoordinateSpace.x;
  *((void *)v4 + 6) = *(void *)&self->_originalCenterInCoordinateSpace.z;
  *((_OWORD *)v4 + 2) = v6;
  uint64_t v7 = [(_DUITargetLayerDescriptor *)self->_coordinateSpaceSourceLayerContext copy];
  double v8 = (void *)*((void *)v4 + 12);
  *((void *)v4 + 12) = v7;

  uint64_t v9 = [(UIBezierPath *)self->_outline copy];
  uint64_t v10 = (void *)*((void *)v4 + 9);
  *((void *)v4 + 9) = v9;

  v4[57] = self->_hasCustomOutline;
  uint64_t v11 = [(UIBezierPath *)self->_shadowPath copy];
  CGFloat v12 = (void *)*((void *)v4 + 10);
  *((void *)v4 + 10) = v11;

  *((void *)v4 + 14) = self->_previewMode;
  v4[58] = self->_avoidAnimation;
  v4[59] = self->_wantsSuppressedMask;
  long long v13 = *(_OWORD *)&self->_overrideStackTransform.a;
  long long v14 = *(_OWORD *)&self->_overrideStackTransform.tx;
  *((_OWORD *)v4 + 14) = *(_OWORD *)&self->_overrideStackTransform.c;
  *((_OWORD *)v4 + 15) = v14;
  *((_OWORD *)v4 + 13) = v13;
  *((_OWORD *)v4 + 9) = self->_initialBadgeLocation;
  *((void *)v4 + 15) = self->_preferredStackOrder;
  uint64_t v15 = [(_UIDragPreviewShadowProperties *)self->_shadowProperties copy];
  double v16 = (void *)*((void *)v4 + 11);
  *((void *)v4 + 11) = v15;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  backgroundColor = self->_backgroundColor;
  uint64_t v98 = MEMORY[0x1E4F143A8];
  uint64_t v99 = 3221225472;
  v100 = __31___DUIPreview_encodeWithCoder___block_invoke;
  v101 = &unk_1E52DFC60;
  v102 = self;
  id v5 = a3;
  [v5 encodeObject:backgroundColor forKey:@"backgroundColor"];
  uint64_t v93 = MEMORY[0x1E4F143A8];
  uint64_t v94 = 3221225472;
  CGRect v95 = __31___DUIPreview_encodeWithCoder___block_invoke_2;
  CGRect v96 = &unk_1E52DFC60;
  CGRect v97 = self;
  objc_msgSend(v5, "encodeCGPoint:forKey:", @"contentOffset", self->_contentOffset.x, self->_contentOffset.y);
  uint64_t v88 = MEMORY[0x1E4F143A8];
  uint64_t v89 = 3221225472;
  CGAffineTransform v90 = __31___DUIPreview_encodeWithCoder___block_invoke_3;
  v91 = &unk_1E52DFC60;
  CGAffineTransform v92 = self;
  objc_msgSend(v5, "encodeUISize3D:forKey:", @"contentSize", self->_contentSize.width, self->_contentSize.height, self->_contentSize.depth);
  BOOL hidesSourceView = self->_hidesSourceView;
  uint64_t v83 = MEMORY[0x1E4F143A8];
  uint64_t v84 = 3221225472;
  double v85 = __31___DUIPreview_encodeWithCoder___block_invoke_4;
  v86 = &unk_1E52DFC60;
  v87 = self;
  [v5 encodeBool:hidesSourceView forKey:@"hidesSourceView"];
  uint64_t v78 = MEMORY[0x1E4F143A8];
  uint64_t v79 = 3221225472;
  v80 = __31___DUIPreview_encodeWithCoder___block_invoke_5;
  v81 = &unk_1E52DFC60;
  v82 = self;
  objc_msgSend(v5, "encodeCGPoint:forKey:", @"liftAnchorPoint", self->_liftAnchorPoint.x, self->_liftAnchorPoint.y);
  uint64_t v73 = MEMORY[0x1E4F143A8];
  uint64_t v74 = 3221225472;
  v75 = __31___DUIPreview_encodeWithCoder___block_invoke_6;
  v76 = &unk_1E52DFC60;
  v77 = self;
  objc_msgSend(v5, "encodeCGPoint:forKey:", @"originalCenter", self->_originalCenter.x, self->_originalCenter.y);
  double originalRotation = self->_originalRotation;
  uint64_t v68 = MEMORY[0x1E4F143A8];
  uint64_t v69 = 3221225472;
  double v70 = __31___DUIPreview_encodeWithCoder___block_invoke_7;
  v71 = &unk_1E52DFC60;
  v72 = self;
  [v5 encodeDouble:@"originalRotation" forKey:originalRotation];
  uint64_t v63 = MEMORY[0x1E4F143A8];
  uint64_t v64 = 3221225472;
  id v65 = __31___DUIPreview_encodeWithCoder___block_invoke_8;
  v66 = &unk_1E52DFC60;
  v67 = self;
  objc_msgSend(v5, "ui_encodeCAPoint3D:forKey:", @"originalCenterInCoordinateSpace", self->_originalCenterInCoordinateSpace.x, self->_originalCenterInCoordinateSpace.y, self->_originalCenterInCoordinateSpace.z);
  coordinateSpaceSourceLayerContext = self->_coordinateSpaceSourceLayerContext;
  uint64_t v58 = MEMORY[0x1E4F143A8];
  uint64_t v59 = 3221225472;
  id v60 = __31___DUIPreview_encodeWithCoder___block_invoke_9;
  double v61 = &unk_1E52DFC60;
  v62 = self;
  [v5 encodeObject:coordinateSpaceSourceLayerContext forKey:@"coordinateSpaceSourceLayerContext"];
  outline = self->_outline;
  uint64_t v53 = MEMORY[0x1E4F143A8];
  uint64_t v54 = 3221225472;
  v55 = __31___DUIPreview_encodeWithCoder___block_invoke_10;
  v56 = &unk_1E52DFC60;
  long double v57 = self;
  [v5 encodeObject:outline forKey:@"outline"];
  BOOL hasCustomOutline = self->_hasCustomOutline;
  uint64_t v48 = MEMORY[0x1E4F143A8];
  uint64_t v49 = 3221225472;
  v50 = __31___DUIPreview_encodeWithCoder___block_invoke_11;
  v51 = &unk_1E52DFC60;
  uint64_t v52 = self;
  [v5 encodeBool:hasCustomOutline forKey:@"hasCustomOutline"];
  shadowPath = self->_shadowPath;
  uint64_t v43 = MEMORY[0x1E4F143A8];
  uint64_t v44 = 3221225472;
  long long v45 = __31___DUIPreview_encodeWithCoder___block_invoke_12;
  long long v46 = &unk_1E52DFC60;
  v47 = self;
  [v5 encodeObject:shadowPath forKey:@"shadowPath"];
  int64_t previewMode = self->_previewMode;
  uint64_t v38 = MEMORY[0x1E4F143A8];
  uint64_t v39 = 3221225472;
  CGFloat v40 = __31___DUIPreview_encodeWithCoder___block_invoke_13;
  v41 = &unk_1E52DFC60;
  v42 = self;
  [v5 encodeInteger:previewMode forKey:@"previewMode"];
  BOOL avoidAnimation = self->_avoidAnimation;
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  uint64_t v35 = __31___DUIPreview_encodeWithCoder___block_invoke_14;
  double v36 = &unk_1E52DFC60;
  v37 = self;
  [v5 encodeBool:avoidAnimation forKey:@"avoidAnimation"];
  BOOL wantsSuppressedMask = self->_wantsSuppressedMask;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __31___DUIPreview_encodeWithCoder___block_invoke_15;
  uint64_t v31 = &unk_1E52DFC60;
  uint64_t v32 = self;
  [v5 encodeBool:wantsSuppressedMask forKey:@"wantsSuppressedMask"];
  shadowProperties = self->_shadowProperties;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __31___DUIPreview_encodeWithCoder___block_invoke_16;
  uint64_t v26 = &unk_1E52DFC60;
  double v27 = self;
  [v5 encodeObject:shadowProperties forKey:@"shadowProperties"];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  CGFloat v20 = __31___DUIPreview_encodeWithCoder___block_invoke_17;
  double v21 = &unk_1E52DFC60;
  double v22 = self;
  long long v16 = *(_OWORD *)&self->_overrideStackTransform.c;
  v17[0] = *(_OWORD *)&self->_overrideStackTransform.a;
  v17[1] = v16;
  v17[2] = *(_OWORD *)&self->_overrideStackTransform.tx;
  [v5 encodeCGAffineTransform:v17 forKey:@"overrideStackTransform"];
  objc_msgSend(v5, "encodeCGPoint:forKey:", @"initialBadgeLocation", self->_initialBadgeLocation.x, self->_initialBadgeLocation.y);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preferredStackOrder, @"preferredStackOrder", MEMORY[0x1E4F143A8], 3221225472, __31___DUIPreview_encodeWithCoder___block_invoke_19, &unk_1E52DFC60, self);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (unsigned __int8 *)v4;
    backgroundColor = self->_backgroundColor;
    if ((backgroundColor == *((UIColor **)v5 + 8) || -[UIColor isEqual:](backgroundColor, "isEqual:"))
      && self->_contentOffset.x == *((double *)v5 + 16)
      && self->_contentOffset.y == *((double *)v5 + 17))
    {
      BOOL v8 = self->_contentSize.width == *((double *)v5 + 1) && self->_contentSize.height == *((double *)v5 + 2);
      BOOL v9 = v8 && self->_contentSize.depth == *((double *)v5 + 3);
      if (v9
        && !self->_hidesSourceView != v5[56]
        && self->_liftAnchorPoint.x == *((double *)v5 + 22)
        && self->_liftAnchorPoint.y == *((double *)v5 + 23))
      {
        BOOL v11 = 0;
        if (self->_originalCenter.x != *((double *)v5 + 20) || self->_originalCenter.y != *((double *)v5 + 21)) {
          goto LABEL_42;
        }
        if (self->_originalRotation == *((double *)v5 + 13))
        {
          if (CAPoint3DEqualToPoint())
          {
            if (UIEqual(self->_coordinateSpaceSourceLayerContext, *((void **)v5 + 12)))
            {
              outline = self->_outline;
              if ((outline == *((UIBezierPath **)v5 + 9) || -[UIBezierPath isEqual:](outline, "isEqual:"))
                && self->_hasCustomOutline == v5[57])
              {
                shadowPath = self->_shadowPath;
                if ((shadowPath == *((UIBezierPath **)v5 + 10) || -[UIBezierPath isEqual:](shadowPath, "isEqual:"))
                  && self->_previewMode == *((void *)v5 + 14)
                  && self->_avoidAnimation == v5[58])
                {
                  if (UIEqual(self->_shadowProperties, *((void **)v5 + 11)))
                  {
                    long long v14 = *(_OWORD *)&self->_overrideStackTransform.c;
                    *(_OWORD *)&t1.long double a = *(_OWORD *)&self->_overrideStackTransform.a;
                    *(_OWORD *)&t1.CGFloat c = v14;
                    *(_OWORD *)&t1.tdouble x = *(_OWORD *)&self->_overrideStackTransform.tx;
                    long long v15 = *((_OWORD *)v5 + 14);
                    *(_OWORD *)&v17.long double a = *((_OWORD *)v5 + 13);
                    *(_OWORD *)&v17.CGFloat c = v15;
                    *(_OWORD *)&v17.tdouble x = *((_OWORD *)v5 + 15);
                    if (CGAffineTransformEqualToTransform(&t1, &v17))
                    {
                      BOOL v11 = 0;
                      if (self->_initialBadgeLocation.x == *((double *)v5 + 18)
                        && self->_initialBadgeLocation.y == *((double *)v5 + 19))
                      {
                        BOOL v11 = self->_preferredStackOrder == *((void *)v5 + 15);
                      }
                      goto LABEL_42;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    BOOL v11 = 0;
LABEL_42:

    goto LABEL_43;
  }
  BOOL v11 = 0;
LABEL_43:

  return v11;
}

- (void)setBackgroundColor:(id)a3
{
}

- (CGPoint)contentOffset
{
  double x = self->_contentOffset.x;
  double y = self->_contentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)hidesSourceView
{
  return self->_hidesSourceView;
}

- (void)setHidesSourceView:(BOOL)a3
{
  self->_BOOL hidesSourceView = a3;
}

- (UIBezierPath)outline
{
  return self->_outline;
}

- (void)setOutline:(id)a3
{
}

- (UIBezierPath)shadowPath
{
  return self->_shadowPath;
}

- (void)setShadowPath:(id)a3
{
}

- (_UIDragPreviewShadowProperties)shadowProperties
{
  return self->_shadowProperties;
}

- (void)setShadowProperties:(id)a3
{
}

- (CGAffineTransform)overrideStackTransform
{
  long long v3 = *(_OWORD *)&self[4].tx;
  *(_OWORD *)&retstr->long double a = *(_OWORD *)&self[4].c;
  *(_OWORD *)&retstr->CGFloat c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[5].a;
  return self;
}

- (void)setOverrideStackTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_overrideStackTransform.CGFloat c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_overrideStackTransform.tdouble x = v4;
  *(_OWORD *)&self->_overrideStackTransform.long double a = v3;
}

- (CGPoint)initialBadgeLocation
{
  double x = self->_initialBadgeLocation.x;
  double y = self->_initialBadgeLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialBadgeLocation:(CGPoint)a3
{
  self->_initialBadgeLocation = a3;
}

- (CGPoint)originalCenter
{
  double x = self->_originalCenter.x;
  double y = self->_originalCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginalCenter:(CGPoint)a3
{
  self->_originalCenter = a3;
}

- (_DUITargetLayerDescriptor)coordinateSpaceSourceLayerContext
{
  return self->_coordinateSpaceSourceLayerContext;
}

- (void)setCoordinateSpaceSourceLayerContext:(id)a3
{
}

- (double)originalRotation
{
  return self->_originalRotation;
}

- (void)setOriginalRotation:(double)a3
{
  self->_double originalRotation = a3;
}

- (int64_t)previewMode
{
  return self->_previewMode;
}

- (void)setPreviewMode:(int64_t)a3
{
  self->_int64_t previewMode = a3;
}

- (CGPoint)liftAnchorPoint
{
  double x = self->_liftAnchorPoint.x;
  double y = self->_liftAnchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)hasCustomOutline
{
  return self->_hasCustomOutline;
}

- (void)setHasCustomOutline:(BOOL)a3
{
  self->_BOOL hasCustomOutline = a3;
}

- (BOOL)avoidAnimation
{
  return self->_avoidAnimation;
}

- (void)setAvoidAnimation:(BOOL)a3
{
  self->_BOOL avoidAnimation = a3;
}

- (BOOL)wantsSuppressedMask
{
  return self->_wantsSuppressedMask;
}

- (void)setWantsSuppressedMask:(BOOL)a3
{
  self->_BOOL wantsSuppressedMask = a3;
}

- (int64_t)preferredStackOrder
{
  return self->_preferredStackOrder;
}

- (void)setPreferredStackOrder:(int64_t)a3
{
  self->_preferredStackOrder = a3;
}

- (CGSize)viewScaleFactor
{
  double width = self->_viewScaleFactor.width;
  double height = self->_viewScaleFactor.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSpaceSourceLayerContext, 0);
  objc_storeStrong((id *)&self->_shadowProperties, 0);
  objc_storeStrong((id *)&self->_shadowPath, 0);
  objc_storeStrong((id *)&self->_outline, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end