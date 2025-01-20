@interface _UIPlatterView
- (BOOL)_hasRadiosityShadow;
- (BOOL)_isEligibleForFocusOcclusion;
- (BOOL)_isLivePreviewContainer;
- (BOOL)appliesOriginalRotation;
- (BOOL)constrainSize;
- (BOOL)constrainSizeWhenNotLifted;
- (BOOL)hasAppliedMasking;
- (BOOL)isBackgroundVisible;
- (BOOL)isFlipped;
- (BOOL)isLifted;
- (BOOL)isShadowVisible;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)precisionMode;
- (BOOL)transformAppliedExternally;
- (CATransform3D)scaleTransform;
- (CATransform3D)targetTransform;
- (CATransform3D)targetTransformIncludingAppliedTransform:(SEL)a3;
- (CGAffineTransform)additionalTransform;
- (CGAffineTransform)appliedTransform;
- (CGAffineTransform)containerCounterRotationTransform;
- (CGAffineTransform)containerCounterScaleTransform;
- (CGPoint)badgeLocation;
- (CGPoint)contentOffset;
- (CGPoint)initialBadgeLocation;
- (CGPoint)offset;
- (CGSize)overrideSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSValue)anchorPointValueToAdjustToOnMoveToWindow;
- (UIEdgeInsets)contentInsets;
- (UIView)backgroundView;
- (UIView)componentView;
- (UIView)portalWrapperView;
- (UIView)shadowView;
- (UIView)sourceView;
- (_DUIPreview)preview;
- (_UIDragPreviewShadowProperties)shadowProperties;
- (_UIPlatterView)initWithDUIPreview:(id)a3;
- (_UIPlatterView)initWithDUIPreview:(id)a3 imageComponent:(id)a4;
- (_UIPlatterView)initWithDroppedItem:(id)a3;
- (_UIPortalView)portalView;
- (_UIShapeView)platterMaskView;
- (_UIShapeView)portalMaskView;
- (double)orientationRotation;
- (double)scaleFactor;
- (double)stackRotation;
- (id)_applyMaskPath:(id)a3 toView:(id)a4 bounds:(CGRect)a5;
- (void)_configureRadiosityShadowIfNeededWithSourceView:(id)a3;
- (void)_updateMasking;
- (void)_updateShadowViewState;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)setAdditionalTransform:(CGAffineTransform *)a3;
- (void)setAnchorPointValueToAdjustToOnMoveToWindow:(id)a3;
- (void)setAppliedTransform:(CGAffineTransform *)a3;
- (void)setAppliesOriginalRotation:(BOOL)a3;
- (void)setBackgroundVisible:(BOOL)a3;
- (void)setComponentView:(id)a3;
- (void)setConstrainSize:(BOOL)a3;
- (void)setConstrainSizeWhenNotLifted:(BOOL)a3;
- (void)setContainerCounterRotationTransform:(CGAffineTransform *)a3;
- (void)setContainerCounterScaleTransform:(CGAffineTransform *)a3;
- (void)setFlipped:(BOOL)a3;
- (void)setHasAppliedMasking:(BOOL)a3;
- (void)setLifted:(BOOL)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setOrientationRotation:(double)a3;
- (void)setOverrideSize:(CGSize)a3;
- (void)setPortalView:(id)a3;
- (void)setPrecisionMode:(BOOL)a3;
- (void)setShadowProperties:(id)a3;
- (void)setShadowVisible:(BOOL)a3;
- (void)setSourceView:(id)a3;
- (void)setStackRotation:(double)a3;
- (void)setTransformAppliedExternally:(BOOL)a3;
- (void)takeCounterTransformsToAddToContainer:(id)a3;
- (void)updateTransform;
@end

@implementation _UIPlatterView

- (_UIPlatterView)initWithDUIPreview:(id)a3
{
  id v4 = a3;
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v4 unscaledSize];
  double v8 = v7;
  double v10 = v9;
  v73.receiver = self;
  v73.super_class = (Class)_UIPlatterView;
  v11 = -[UIView initWithFrame:](&v73, sel_initWithFrame_, v5, v6, v7, v9);
  v12 = (_UIPlatterView *)v11;
  if (v11)
  {
    v13 = (long long *)MEMORY[0x1E4F1DAB8];
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)(v11 + 712) = v14;
    long long v16 = *v13;
    long long v15 = v13[1];
    *(_OWORD *)(v11 + 680) = *v13;
    *(_OWORD *)(v11 + 696) = v15;
    *(_OWORD *)(v11 + 744) = v15;
    *(_OWORD *)(v11 + 760) = v14;
    *(_OWORD *)(v11 + 728) = v16;
    *(_OWORD *)(v11 + 600) = v15;
    *(_OWORD *)(v11 + 616) = v14;
    *(_OWORD *)(v11 + 584) = v16;
    *(_OWORD *)(v11 + 632) = v16;
    *(_OWORD *)(v11 + 648) = v15;
    *(_OWORD *)(v11 + 664) = v14;
    uint64_t v17 = [v11 _disableLayoutFlushingCount];
    if (v17 >= 1) {
      uint64_t v18 = v17 + 1;
    }
    else {
      uint64_t v18 = 1;
    }
    [(UIView *)v12 _setDisableLayoutFlushingCount:v18];
    [(UIView *)v12 _disableLayoutFlushing];
    v19 = [(UIView *)v12 layer];
    [v19 setAllowsGroupOpacity:1];

    uint64_t v20 = [v4 copy];
    preview = v12->_preview;
    v12->_preview = (_DUIPreview *)v20;

    [v4 previewMode];
    if (![(_UIPlatterView *)v12 _isLivePreviewContainer])
    {
      uint64_t v22 = [v4 effectiveShadowPath];
      if (v22)
      {
        v23 = (void *)v22;
        uint64_t v24 = [v4 shadowPath];
        if (v24 && (v25 = (void *)v24, int v26 = dyld_program_sdk_at_least(), v25, v26))
        {
          [v23 bounds];
          CGFloat v28 = v27;
          CGFloat v30 = v29;
          CGFloat v32 = v31;
          CGFloat v34 = v33;
          v35 = (void *)[v23 copy];

          v74.origin.double x = v28;
          v74.origin.double y = v30;
          v74.size.double width = v32;
          v74.size.height = v34;
          if (!CGRectIsNull(v74))
          {
            v75.origin.double x = v28;
            v75.origin.double y = v30;
            v75.size.double width = v32;
            v75.size.height = v34;
            CGFloat txa = -CGRectGetMinX(v75);
            v76.origin.double x = v28;
            v76.origin.double y = v30;
            v76.size.double width = v32;
            v76.size.height = v34;
            CGFloat MinY = CGRectGetMinY(v76);
            CGAffineTransformMakeTranslation(&v72, txa, -MinY);
            [v35 applyTransform:&v72];
          }
          [(_UIPlatterView *)v12 contentOffset];
          CGFloat txb = v37;
          [(_UIPlatterView *)v12 contentOffset];
          CGFloat v39 = v38;
          v77.origin.double x = v28;
          v77.origin.double y = v30;
          v77.size.double width = v32;
          v77.size.height = v34;
          CGRect v78 = CGRectOffset(v77, txb, v39);
          double x = v78.origin.x;
          double y = v78.origin.y;
          double width = v78.size.width;
          tdouble x = v78.size.height;
        }
        else
        {
          tdouble x = v10;
          double width = v8;
          double y = v6;
          double x = v5;
          v35 = v23;
        }
      }
      else
      {
        v35 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v5, v6, v8, v10);
        tdouble x = v10;
        double width = v8;
        double y = v6;
        double x = v5;
      }
      v43 = [v4 backgroundColor];
      v44 = [(UIView *)v12 traitCollection];
      v45 = [v43 resolvedColorWithTraitCollection:v44];
      [v45 alphaComponent];
      double v47 = v46;

      uint64_t v48 = [v4 shadowProperties];
      shadowProperties = v12->_shadowProperties;
      v12->_shadowProperties = (_UIDragPreviewShadowProperties *)v48;

      BOOL v50 = [(_UIPlatterView *)v12 _hasRadiosityShadow];
      v51 = [(UIView *)v12 traitCollection];
      uint64_t v52 = [v51 userInterfaceIdiom];

      if (v52 != 6 && !v50)
      {
        v53 = -[_UIPlatterSoftShadowView initWithFrame:shadowPath:]([_UIPlatterSoftShadowView alloc], "initWithFrame:shadowPath:", v35, x, y, width, tx);
        [(UIView *)v53 setAlpha:0.0];
        [(_UIPlatterSoftShadowView *)v53 setNeedsPunchOut:v47 < 1.0];
        [(UIView *)v12 addSubview:v53];
        shadowView = v12->_shadowView;
        v12->_shadowView = &v53->super;
      }
    }
    v55 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v8, v10);
    backgroundView = v12->_backgroundView;
    v12->_backgroundView = v55;

    v57 = [v4 backgroundColor];
    [(UIView *)v12->_backgroundView setBackgroundColor:v57];

    [(UIView *)v12->_backgroundView setAlpha:0.0];
    v58 = [(UIView *)v12->_backgroundView layer];
    [v58 setAllowsEdgeAntialiasing:1];

    [(UIView *)v12 addSubview:v12->_backgroundView];
    [v4 contentOffset];
    double v60 = v59;
    double v62 = v61;
    [v4 contentSize];
    v65 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v60, v62, v63, v64);
    portalWrapperView = v12->_portalWrapperView;
    v12->_portalWrapperView = v65;

    [(UIView *)v12 addSubview:v12->_portalWrapperView];
    if ([v4 hasCustomOutline]) {
      [(_UIPlatterView *)v12 _updateMasking];
    }
    v67 = v12;
  }

  return v12;
}

- (id)_applyMaskPath:(id)a3 toView:(id)a4 bounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  if (![v11 _isRoundedRect]) {
    goto LABEL_7;
  }
  [v12 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  [v11 bounds];
  v48.origin.double x = v21;
  v48.origin.double y = v22;
  v48.size.double width = v23;
  v48.size.double height = v24;
  v47.origin.double x = v14;
  v47.origin.double y = v16;
  v47.size.double width = v18;
  v47.size.double height = v20;
  if (!CGRectEqualToRect(v47, v48)) {
    goto LABEL_7;
  }
  [(_DUIPreview *)self->_preview contentSize];
  double v26 = v25;
  double v28 = v27;
  [v11 bounds];
  if (v26 == v30 && v28 == v29)
  {
    [v11 _cornerRadius];
    double v37 = v36;
    double v38 = [v12 layer];
    [v38 setCornerRadius:v37];

    int v39 = [v11 _hasContinuousCorners];
    v40 = (uint64_t *)MEMORY[0x1E4F39EA8];
    if (!v39) {
      v40 = (uint64_t *)MEMORY[0x1E4F39EA0];
    }
    uint64_t v41 = *v40;
    v42 = [v12 layer];
    [v42 setCornerCurve:v41];

    uint64_t v43 = [v11 _cornerMask];
    v44 = [v12 layer];
    [v44 setMaskedCorners:v43];

    v45 = [v12 layer];
    [v45 setMasksToBounds:1];

    CGFloat v32 = 0;
  }
  else
  {
LABEL_7:
    CGFloat v32 = -[UIView initWithFrame:]([_UIShapeView alloc], "initWithFrame:", x, y, width, height);
    uint64_t v33 = [v11 CGPath];
    CGFloat v34 = [(_UIShapeView *)v32 shapeLayer];
    [v34 setPath:v33];

    [v12 setMaskView:v32];
  }

  return v32;
}

- (_UIPlatterView)initWithDUIPreview:(id)a3 imageComponent:(id)a4
{
  id v6 = a4;
  double v7 = [(_UIPlatterView *)self initWithDUIPreview:a3];
  double v8 = v7;
  if (v7)
  {
    double v9 = [(_UIPlatterView *)v7 componentView];
    if (v9)
    {
    }
    else
    {
      id v11 = [v6 image];

      if (v11)
      {
        id v12 = [UIImageView alloc];
        double v13 = [v6 image];
        double v10 = [(UIImageView *)v12 initWithImage:v13];

        [(_UIPlatterView *)v8 setComponentView:v10];
        goto LABEL_7;
      }
    }
    double v10 = [v6 view];
    [(_UIPlatterView *)v8 setSourceView:v10];
LABEL_7:
  }
  return v8;
}

- (_UIPlatterView)initWithDroppedItem:(id)a3
{
  id v4 = a3;
  double v5 = [v4 preview];
  id v6 = [v4 imageComponent];
  id v7 = v5;
  double v8 = [[_UIPlatterView alloc] initWithDUIPreview:v7];

  id v9 = v6;
  if ([v9 representsPortal])
  {
    double v10 = [_UIPortalView alloc];
    [v9 frame];
    id v11 = -[_UIPortalView initWithFrame:](v10, "initWithFrame:");
    id v12 = [(_UIPortalView *)v11 portalLayer];
    objc_msgSend(v12, "setSourceLayerRenderId:", objc_msgSend(v9, "renderID"));
    uint64_t v13 = [v9 contextID];

    [v12 setSourceContextId:v13];
    [v12 setHidesSourceLayer:1];
    [(_UIPortalView *)v11 setAllowsBackdropGroups:1];
  }
  else
  {
    CGFloat v14 = [_UIDragSlotHostingView alloc];
    [v9 frame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [v9 size3D];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    uint64_t v29 = [v9 slotID];

    id v11 = -[_UIDragSlotHostingView initWithFrame:contentSize:slotID:](v14, "initWithFrame:contentSize:slotID:", v29, v16, v18, v20, v22, v24, v26, v28);
  }
  [(_UIPlatterView *)v8 setComponentView:v11];

  [v4 rotation];
  -[_UIPlatterView setStackRotation:](v8, "setStackRotation:");
  [(_UIPlatterView *)v8 setLifted:1];
  -[_UIPlatterView setConstrainSize:](v8, "setConstrainSize:", [v4 constrainSize]);
  double v30 = [v4 preview];
  [v30 stackAlpha];
  -[UIView setAlpha:](v8, "setAlpha:");

  if (v4)
  {
    [v4 appliedTransform];
  }
  else
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
  }
  v34[0] = v35;
  v34[1] = v36;
  v34[2] = v37;
  [(_UIPlatterView *)v8 setAppliedTransform:v34];
  double v31 = [v4 preview];
  CGFloat v32 = [v31 shadowProperties];
  [(_UIPlatterView *)v8 setShadowProperties:v32];

  return v8;
}

- (void)setBackgroundVisible:(BOOL)a3
{
  if (self->_backgroundVisible != a3)
  {
    self->_backgroundVisible = a3;
    double v3 = (double)a3;
    id v4 = [(_UIPlatterView *)self backgroundView];
    [v4 setAlpha:v3];
  }
}

- (void)setShadowVisible:(BOOL)a3
{
  if (self->_shadowVisible != a3)
  {
    self->_shadowVisible = a3;
    [(_UIPlatterView *)self _updateShadowViewState];
  }
}

- (CGPoint)badgeLocation
{
  if ([(_UIPlatterView *)self constrainSize])
  {
    double v3 = [(_UIPlatterView *)self preview];
    [v3 croppedScaledSize];
    double v5 = v4;
    double v7 = v6;

    double v8 = [(_UIPlatterView *)self preview];
    [v8 scaleFactor];
    double v10 = 1.0 / v9;

    double v11 = v5 * v10;
    double v12 = v7 * v10;
    CGFloat v13 = *MEMORY[0x1E4F1DAD8];
    CGFloat v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    [(UIView *)self bounds];
    CGFloat v13 = v15;
    CGFloat v14 = v16;
    double v11 = v17;
    double v12 = v18;
  }
  uint64_t v19 = [(id)UIApp userInterfaceLayoutDirection];
  CGFloat v20 = v13;
  CGFloat v21 = v14;
  double v22 = v11;
  double v23 = v12;
  if (v19) {
    double MinX = CGRectGetMinX(*(CGRect *)&v20);
  }
  else {
    double MinX = CGRectGetMaxX(*(CGRect *)&v20);
  }
  double v25 = MinX;
  v29.origin.double x = v13;
  v29.origin.double y = v14;
  v29.size.double width = v11;
  v29.size.double height = v12;
  double MinY = CGRectGetMinY(v29);
  double v27 = v25;
  result.double y = MinY;
  result.double x = v27;
  return result;
}

- (CGPoint)initialBadgeLocation
{
  v2 = [(_UIPlatterView *)self preview];
  [v2 initialBadgeLocation];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)setConstrainSize:(BOOL)a3
{
  if (self->_constrainSize != a3)
  {
    self->_constrainSize = a3;
    [(_UIPlatterView *)self updateTransform];
  }
}

- (CGPoint)contentOffset
{
  v2 = [(_UIPlatterView *)self preview];
  [v2 contentOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)setComponentView:(id)a3
{
  id v5 = a3;
  if ((-[UIView isEqual:](self->_componentView, "isEqual:") & 1) == 0)
  {
    [(UIView *)self->_componentView removeFromSuperview];
    if (v5)
    {
      double v4 = [(_UIPlatterView *)self portalWrapperView];
      [v4 addSubview:v5];
    }
    [(_UIPlatterView *)self _configureRadiosityShadowIfNeededWithSourceView:v5];
  }
}

- (BOOL)_hasRadiosityShadow
{
  double v3 = [(_UIPlatterView *)self shadowProperties];
  if (v3)
  {
    double v4 = [(_UIPlatterView *)self shadowProperties];
    BOOL v5 = [v4 shadowType] == 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)setShadowProperties:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_shadowProperties, a3);
  componentView = self->_componentView;
  if (componentView)
  {
    double v6 = componentView;
  }
  else
  {
    double v6 = [(_UIPortalView *)self->_portalView sourceView];
    if (!v6) {
      goto LABEL_5;
    }
  }
  [(_UIPlatterView *)self _configureRadiosityShadowIfNeededWithSourceView:v6];

LABEL_5:
}

- (void)_configureRadiosityShadowIfNeededWithSourceView:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_UIPlatterView *)self _hasRadiosityShadow])
  {
    [(UIView *)self->_shadowView removeFromSuperview];
    BOOL v5 = [[_UIPortalView alloc] initWithSourceView:v4];
    [v4 bounds];
    -[_UIPortalView setFrame:](v5, "setFrame:");
    double v6 = [(UIView *)v5 layer];
    [v6 setZPosition:-1.0];

    [(UIView *)self addSubview:v5];
    id v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    double v8 = NSNumber;
    double v9 = [(_UIPlatterView *)self shadowProperties];
    [v9 radiosityBlurRadius];
    double v10 = objc_msgSend(v8, "numberWithDouble:");
    [v7 setValue:v10 forKey:*MEMORY[0x1E4F3A1D8]];

    double v11 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
    [v11 setValue:&unk_1ED3F1C38 forKey:*MEMORY[0x1E4F3A100]];
    v21[0] = v7;
    v21[1] = v11;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    CGFloat v13 = [(UIView *)v5 layer];
    [v13 setFilters:v12];

    id v14 = +[UIColor colorWithWhite:0.75 alpha:1.0];
    uint64_t v15 = [v14 CGColor];
    double v16 = [(UIView *)v5 layer];
    [v16 setContentsMultiplyColor:v15];

    double v17 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E0]];
    double v18 = [(UIView *)v5 layer];
    [v18 setCompositingFilter:v17];

    uint64_t v19 = [(UIView *)v5 layer];
    [v19 setShouldRasterize:1];

    shadowView = self->_shadowView;
    self->_shadowView = &v5->super;

    [(_UIPlatterView *)self _updateShadowViewState];
  }
}

- (void)_updateShadowViewState
{
  shadowProperties = self->_shadowProperties;
  id v4 = (_OWORD *)MEMORY[0x1E4F1DAB8];
  if (shadowProperties)
  {
    [(_UIDragPreviewShadowProperties *)shadowProperties liftedAlpha];
    double v6 = v5;
    id v7 = self->_shadowProperties;
    memset(&v25, 0, sizeof(v25));
    if (v7)
    {
      [(_UIDragPreviewShadowProperties *)v7 liftedTransform];
      goto LABEL_6;
    }
  }
  else
  {
    double v6 = 1.0;
  }
  long long v8 = v4[1];
  *(_OWORD *)&v25.a = *v4;
  *(_OWORD *)&v25.c = v8;
  *(_OWORD *)&v25.tdouble x = v4[2];
LABEL_6:
  [(_UIPlatterView *)self appliedTransform];
  if (!CGAffineTransformIsIdentity(&v24))
  {
    memset(&v23, 0, sizeof(v23));
    [(_UIPlatterView *)self appliedTransform];
    CGAffineTransformDecompose(&v23, &transform);
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeRotation(&v21, v23.rotation);
    CGAffineTransform t1 = v21;
    memset(&v20, 0, sizeof(v20));
    CGAffineTransformInvert(&v20, &t1);
    CGAffineTransform t1 = v25;
    CGAffineTransform t2 = v20;
    CGAffineTransformConcat(&v18, &t1, &t2);
    CGAffineTransform t2 = v21;
    CGAffineTransformConcat(&t1, &t2, &v18);
    CGAffineTransform v25 = t1;
  }
  if (![(_UIPlatterView *)self isShadowVisible]) {
    double v6 = 0.0;
  }
  double v9 = [(_UIPlatterView *)self shadowView];
  [v9 setAlpha:v6];

  if ([(_UIPlatterView *)self isShadowVisible])
  {
    long long v14 = *(_OWORD *)&v25.a;
    long long v15 = *(_OWORD *)&v25.c;
    long long v10 = *(_OWORD *)&v25.tx;
  }
  else
  {
    long long v11 = v4[1];
    long long v14 = *v4;
    long long v15 = v11;
    long long v10 = v4[2];
  }
  long long v16 = v10;
  double v12 = [(_UIPlatterView *)self shadowView];
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  [v12 setTransform:v13];
}

- (BOOL)_isLivePreviewContainer
{
  return (unint64_t)([(_DUIPreview *)self->_preview previewMode] - 3) < 2;
}

- (void)_updateMasking
{
  if (self->_hasAppliedMasking) {
    return;
  }
  double v12 = self->_preview;
  BOOL v3 = [(_DUIPreview *)v12 wantsSuppressedMask];
  if ([(_UIPlatterView *)self _isLivePreviewContainer])
  {
    id v4 = self->_backgroundView;
  }
  else
  {
    double v5 = [(_DUIPreview *)v12 outline];
    id v4 = self->_backgroundView;
    if (v5)
    {
      [(UIView *)self bounds];
      -[_UIPlatterView _applyMaskPath:toView:bounds:](self, "_applyMaskPath:toView:bounds:", v5, v4);
      double v6 = (_UIShapeView *)objc_claimAutoreleasedReturnValue();
      platterMaskView = self->_platterMaskView;
      self->_platterMaskView = v6;

      [(UIView *)self->_portalWrapperView setClipsToBounds:0];
      if (!v3)
      {
        [(UIView *)self bounds];
        -[UIView convertRect:toView:](self, "convertRect:toView:", self->_portalWrapperView);
        -[_UIPlatterView _applyMaskPath:toView:bounds:](self, "_applyMaskPath:toView:bounds:", v5, self->_portalWrapperView);
        long long v8 = (_UIShapeView *)objc_claimAutoreleasedReturnValue();
        portalMaskView = self->_portalMaskView;
        self->_portalMaskView = v8;
      }
      goto LABEL_8;
    }
  }
  long long v10 = [(_DUIPreview *)v12 shadowPath];
  BOOL v11 = v10 == 0;

  [(UIView *)self->_portalWrapperView setClipsToBounds:v11 & ~[(_UIPlatterView *)self _isLivePreviewContainer]];
  double v5 = 0;
LABEL_8:
  self->_hasAppliedMasking = 1;
}

- (void)setLifted:(BOOL)a3
{
  if (self->_lifted != a3)
  {
    BOOL v3 = a3;
    self->_lifted = a3;
    if (a3) {
      [(_UIPlatterView *)self _updateMasking];
    }
    [(_UIPlatterView *)self setShadowVisible:v3];
    [(_UIPlatterView *)self setBackgroundVisible:v3];
    [(_UIPlatterView *)self updateTransform];
  }
}

- (void)setOrientationRotation:(double)a3
{
  if (self->_orientationRotation != a3)
  {
    self->_orientationRotation = a3;
    [(_UIPlatterView *)self updateTransform];
  }
}

- (void)setOverrideSize:(CGSize)a3
{
  if (self->_overrideSize.width != a3.width || self->_overrideSize.height != a3.height)
  {
    self->_overrideSize = a3;
    [(_UIPlatterView *)self updateTransform];
  }
}

- (void)setAppliesOriginalRotation:(BOOL)a3
{
  if (self->_appliesOriginalRotation != a3)
  {
    self->_appliesOriginalRotation = a3;
    [(_UIPlatterView *)self updateTransform];
  }
}

- (double)scaleFactor
{
  if (![(_UIPlatterView *)self constrainSize]
    || ![(_UIPlatterView *)self isLifted]
    && ![(_UIPlatterView *)self constrainSizeWhenNotLifted])
  {
    return 1.0;
  }
  BOOL v3 = [(_UIPlatterView *)self preview];
  [v3 scaleFactor];
  double v5 = v4;

  return v5;
}

- (UIView)sourceView
{
  v2 = [(_UIPlatterView *)self portalView];
  BOOL v3 = [v2 sourceView];

  return (UIView *)v3;
}

- (void)setSourceView:(id)a3
{
  id v4 = a3;
  double v5 = [(_UIPlatterView *)self portalView];
  id v6 = [v5 sourceView];

  if (v6 != v4)
  {
    id v7 = [(_UIPlatterView *)self portalView];

    if (v7)
    {
      long long v8 = [(_UIPlatterView *)self portalView];
      [v8 removeFromSuperview];
    }
    double v9 = [(_UIPlatterView *)self portalWrapperView];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [v4 bounds];
    memset(&v27, 0, sizeof(v27));
    CGAffineTransformMakeScale(&v27, v15 / v18, v17 / v19);
    CGAffineTransform v20 = -[_UIPortalView initWithFrame:]([_UIPortalView alloc], "initWithFrame:", v11, v13, v15, v17);
    CGAffineTransform v21 = [(_UIPlatterView *)self preview];
    -[_UIPortalView setHidesSourceView:](v20, "setHidesSourceView:", [v21 hidesSourceView]);

    [(_UIPortalView *)v20 setMatchesAlpha:0];
    [(_UIPortalView *)v20 setMatchesPosition:0];
    [(_UIPortalView *)v20 setMatchesTransform:0];
    CGAffineTransform v26 = v27;
    [(UIView *)v20 setTransform:&v26];
    [(_UIPortalView *)v20 setSourceView:v4];
    double v22 = [(_UIPlatterView *)self preview];
    -[_UIPortalView setAllowsHitTesting:](v20, "setAllowsHitTesting:", [v22 previewMode] == 4);

    [(_UIPortalView *)v20 setAllowsBackdropGroups:1];
    CGAffineTransformComponents v23 = [v4 layer];
    uint64_t v24 = [v23 flipsHorizontalAxis];
    CGAffineTransform v25 = [(UIView *)v20 layer];
    [v25 setFlipsHorizontalAxis:v24];

    [v9 addSubview:v20];
    [(_UIPlatterView *)self setPortalView:v20];

    if (v4) {
      [(_UIPlatterView *)self _configureRadiosityShadowIfNeededWithSourceView:v4];
    }
  }
}

- (void)setStackRotation:(double)a3
{
  if (self->_stackRotation != a3)
  {
    self->_stackRotation = a3;
    [(_UIPlatterView *)self updateTransform];
  }
}

- (void)setAppliedTransform:(CGAffineTransform *)a3
{
  p_appliedTransform = &self->_appliedTransform;
  long long v6 = *(_OWORD *)&self->_appliedTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_appliedTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&self->_appliedTransform.tx;
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tdouble x = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_appliedTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_appliedTransform->tdouble x = v9;
    *(_OWORD *)&p_appliedTransform->a = v8;
    [(_UIPlatterView *)self updateTransform];
  }
}

- (void)setAdditionalTransform:(CGAffineTransform *)a3
{
  p_additionalTransform = &self->_additionalTransform;
  long long v6 = *(_OWORD *)&self->_additionalTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_additionalTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&self->_additionalTransform.tx;
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tdouble x = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_additionalTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_additionalTransform->tdouble x = v9;
    *(_OWORD *)&p_additionalTransform->a = v8;
    [(_UIPlatterView *)self updateTransform];
  }
}

- (CATransform3D)scaleTransform
{
  double v5 = (long long *)MEMORY[0x1E4F39B10];
  long long v69 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  long long v70 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&retstr->m31 = v70;
  *(_OWORD *)&retstr->m33 = v69;
  long long v67 = v5[7];
  long long v68 = v5[6];
  *(_OWORD *)&retstr->m41 = v68;
  *(_OWORD *)&retstr->m43 = v67;
  long long v65 = v5[1];
  long long v66 = *v5;
  *(_OWORD *)&retstr->m11 = *v5;
  *(_OWORD *)&retstr->m13 = v65;
  long long v63 = v5[3];
  long long v64 = v5[2];
  *(_OWORD *)&retstr->m21 = v64;
  *(_OWORD *)&retstr->m23 = v63;
  if ([(_UIPlatterView *)self isLifted])
  {
    long long v6 = [(_UIPlatterView *)self preview];
    long long v7 = v6;
    if (v6) {
      [v6 liftTransform];
    }
    else {
      memset(&m, 0, sizeof(m));
    }
    CATransform3DMakeAffineTransform(&b, &m);
    *(_OWORD *)&a.m31 = v70;
    *(_OWORD *)&a.m33 = v69;
    *(_OWORD *)&a.m41 = v68;
    *(_OWORD *)&a.m43 = v67;
    *(_OWORD *)&a.m11 = v66;
    *(_OWORD *)&a.m13 = v65;
    *(_OWORD *)&a.m21 = v64;
    *(_OWORD *)&a.m23 = v63;
    CATransform3DConcat(&v82, &a, &b);
    long long v8 = *(_OWORD *)&v82.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v82.m31;
    *(_OWORD *)&retstr->m33 = v8;
    long long v9 = *(_OWORD *)&v82.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v82.m41;
    *(_OWORD *)&retstr->m43 = v9;
    long long v10 = *(_OWORD *)&v82.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v82.m11;
    *(_OWORD *)&retstr->m13 = v10;
    long long v11 = *(_OWORD *)&v82.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v82.m21;
    *(_OWORD *)&retstr->m23 = v11;
  }
  double v12 = [(UIView *)self traitCollection];
  uint64_t v13 = [v12 userInterfaceIdiom];

  CGFloat v14 = 1.0;
  if (v13 == 6)
  {
    [(_UIPlatterView *)self scaleFactor];
    CGFloat v14 = v15;
  }
  [(_UIPlatterView *)self scaleFactor];
  CGFloat v17 = v16;
  [(_UIPlatterView *)self scaleFactor];
  long long v18 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&a.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&a.m33 = v18;
  long long v19 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&a.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&a.m43 = v19;
  long long v20 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&a.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&a.m13 = v20;
  long long v21 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&a.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&a.m23 = v21;
  CATransform3DScale(&v82, &a, v17, v22, v14);
  long long v23 = *(_OWORD *)&v82.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v82.m31;
  *(_OWORD *)&retstr->m33 = v23;
  long long v24 = *(_OWORD *)&v82.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v82.m41;
  *(_OWORD *)&retstr->m43 = v24;
  long long v25 = *(_OWORD *)&v82.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v82.m11;
  *(_OWORD *)&retstr->m13 = v25;
  long long v26 = *(_OWORD *)&v82.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v82.m21;
  *(_OWORD *)&retstr->m23 = v26;
  CGPoint result = (CATransform3D *)[(_UIPlatterView *)self overrideSize];
  if (v29 != *MEMORY[0x1E4F1DB30] || v28 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    BOOL v30 = [(_UIPlatterView *)self constrainSize];
    double v31 = [(_UIPlatterView *)self preview];
    CGFloat v32 = v31;
    if (v30) {
      [v31 croppedScaledSize];
    }
    else {
      [v31 unscaledSize];
    }
    double v35 = v33;
    double v36 = v34;

    long long v37 = [(_UIPlatterView *)self preview];
    double v38 = v37;
    if (v37)
    {
      [v37 liftTransform];
      double v39 = v76;
      double v40 = v75;
      double v41 = v78;
      double v42 = v77;
    }
    else
    {
      double v41 = 0.0;
      double v39 = 0.0;
      double v42 = 0.0;
      double v40 = 0.0;
    }
    double v43 = v36 * v42 + v35 * v40;
    double v44 = v36 * v41 + v35 * v39;

    v45 = [(_UIPlatterView *)self preview];
    double v46 = v45;
    if (v45)
    {
      [v45 liftTransform];
      double v47 = v72;
      double v48 = v71;
      double v49 = v74;
      double v50 = v73;
    }
    else
    {
      double v49 = 0.0;
      double v47 = 0.0;
      double v50 = 0.0;
      double v48 = 0.0;
    }
    double v51 = v44 * v50 + v43 * v48;
    double v52 = v44 * v49 + v43 * v47;

    [(_UIPlatterView *)self overrideSize];
    long long v54 = *(_OWORD *)&retstr->m33;
    *(_OWORD *)&a.m31 = *(_OWORD *)&retstr->m31;
    *(_OWORD *)&a.m33 = v54;
    long long v55 = *(_OWORD *)&retstr->m43;
    *(_OWORD *)&a.m41 = *(_OWORD *)&retstr->m41;
    *(_OWORD *)&a.m43 = v55;
    long long v56 = *(_OWORD *)&retstr->m13;
    *(_OWORD *)&a.m11 = *(_OWORD *)&retstr->m11;
    *(_OWORD *)&a.m13 = v56;
    long long v57 = *(_OWORD *)&retstr->m23;
    *(_OWORD *)&a.m21 = *(_OWORD *)&retstr->m21;
    *(_OWORD *)&a.m23 = v57;
    CGPoint result = CATransform3DScale(&v82, &a, v53 / v51, v58 / v52, 1.0);
    long long v59 = *(_OWORD *)&v82.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v82.m31;
    *(_OWORD *)&retstr->m33 = v59;
    long long v60 = *(_OWORD *)&v82.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v82.m41;
    *(_OWORD *)&retstr->m43 = v60;
    long long v61 = *(_OWORD *)&v82.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v82.m11;
    *(_OWORD *)&retstr->m13 = v61;
    long long v62 = *(_OWORD *)&v82.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v82.m21;
    *(_OWORD *)&retstr->m23 = v62;
  }
  return result;
}

- (CATransform3D)targetTransform
{
  return [(_UIPlatterView *)self targetTransformIncludingAppliedTransform:1];
}

- (CATransform3D)targetTransformIncludingAppliedTransform:(SEL)a3
{
  BOOL v4 = a4;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->double m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  [(_UIPlatterView *)self scaleTransform];
  [(_UIPlatterView *)self stackRotation];
  double m14 = v7;
  [(_UIPlatterView *)self offset];
  double v10 = v9;
  [(UIView *)self bounds];
  double v12 = v11;
  [(_UIPlatterView *)self offset];
  double v14 = v13;
  [(UIView *)self bounds];
  double v16 = v15;
  CGFloat v17 = [(_UIPlatterView *)self preview];
  long long v18 = v17;
  if (v17) {
    [v17 overrideStackTransform];
  }
  else {
    memset(&v100, 0, sizeof(v100));
  }
  IsIdentitdouble y = CGAffineTransformIsIdentity(&v100);

  if (IsIdentity)
  {
    double m21 = v10 * v12;
    double m22 = v14 * v16;
  }
  else
  {
    memset(&v96, 0, 48);
    CGFloat v22 = [(_UIPlatterView *)self preview];
    long long v23 = v22;
    if (v22) {
      [v22 overrideStackTransform];
    }
    else {
      memset(&transform, 0, sizeof(transform));
    }
    CGAffineTransformDecompose((CGAffineTransformComponents *)&v96, &transform);

    if (![(_UIPlatterView *)self constrainSize])
    {
      CATransform3DMakeScale(&v98, v96.m11, v96.m12, 1.0);
      long long v24 = *(_OWORD *)&v98.m33;
      *(_OWORD *)&retstr->m31 = *(_OWORD *)&v98.m31;
      *(_OWORD *)&retstr->m33 = v24;
      long long v25 = *(_OWORD *)&v98.m43;
      *(_OWORD *)&retstr->m41 = *(_OWORD *)&v98.m41;
      *(_OWORD *)&retstr->m43 = v25;
      long long v26 = *(_OWORD *)&v98.m13;
      *(_OWORD *)&retstr->m11 = *(_OWORD *)&v98.m11;
      *(_OWORD *)&retstr->m13 = v26;
      long long v27 = *(_OWORD *)&v98.m23;
      *(_OWORD *)&retstr->double m21 = *(_OWORD *)&v98.m21;
      *(_OWORD *)&retstr->m23 = v27;
    }
    double m14 = v96.m14;
    double m21 = v96.m21;
    double m22 = v96.m22;
  }
  long long v28 = *(_OWORD *)&self->_containerCounterScaleTransform.c;
  *(_OWORD *)&v98.m11 = *(_OWORD *)&self->_containerCounterScaleTransform.a;
  *(_OWORD *)&v98.m13 = v28;
  *(_OWORD *)&v98.double m21 = *(_OWORD *)&self->_containerCounterScaleTransform.tx;
  CATransform3DMakeAffineTransform(&b, (CGAffineTransform *)&v98);
  long long v29 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v96.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v96.m33 = v29;
  long long v30 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v96.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v96.m43 = v30;
  long long v31 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v96.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v96.m13 = v31;
  long long v32 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v96.double m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v96.m23 = v32;
  CATransform3DConcat(&v98, &v96, &b);
  long long v33 = *(_OWORD *)&v98.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v98.m31;
  *(_OWORD *)&retstr->m33 = v33;
  long long v34 = *(_OWORD *)&v98.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v98.m41;
  *(_OWORD *)&retstr->m43 = v34;
  long long v35 = *(_OWORD *)&v98.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v98.m11;
  *(_OWORD *)&retstr->m13 = v35;
  long long v36 = *(_OWORD *)&v98.m23;
  *(_OWORD *)&retstr->double m21 = *(_OWORD *)&v98.m21;
  *(_OWORD *)&retstr->m23 = v36;
  long long v37 = *(_OWORD *)&self->_containerCounterRotationTransform.c;
  *(_OWORD *)&v98.m11 = *(_OWORD *)&self->_containerCounterRotationTransform.a;
  *(_OWORD *)&v98.m13 = v37;
  *(_OWORD *)&v98.double m21 = *(_OWORD *)&self->_containerCounterRotationTransform.tx;
  CATransform3DMakeAffineTransform(&v95, (CGAffineTransform *)&v98);
  long long v38 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v96.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v96.m33 = v38;
  long long v39 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v96.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v96.m43 = v39;
  long long v40 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v96.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v96.m13 = v40;
  long long v41 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v96.double m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v96.m23 = v41;
  CATransform3DConcat(&v98, &v96, &v95);
  long long v42 = *(_OWORD *)&v98.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v98.m31;
  *(_OWORD *)&retstr->m33 = v42;
  long long v43 = *(_OWORD *)&v98.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v98.m41;
  *(_OWORD *)&retstr->m43 = v43;
  long long v44 = *(_OWORD *)&v98.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v98.m11;
  *(_OWORD *)&retstr->m13 = v44;
  long long v45 = *(_OWORD *)&v98.m23;
  *(_OWORD *)&retstr->double m21 = *(_OWORD *)&v98.m21;
  *(_OWORD *)&retstr->m23 = v45;
  [(_UIPlatterView *)self orientationRotation];
  long long v47 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v96.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v96.m33 = v47;
  long long v48 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v96.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v96.m43 = v48;
  long long v49 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v96.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v96.m13 = v49;
  long long v50 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v96.double m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v96.m23 = v50;
  CATransform3DRotate(&v98, &v96, fmax(fmin(m14 + v46, 3.14159265), -3.14159253), 0.0, 0.0, 1.0);
  long long v51 = *(_OWORD *)&v98.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v98.m31;
  *(_OWORD *)&retstr->m33 = v51;
  long long v52 = *(_OWORD *)&v98.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v98.m41;
  *(_OWORD *)&retstr->m43 = v52;
  long long v53 = *(_OWORD *)&v98.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v98.m11;
  *(_OWORD *)&retstr->m13 = v53;
  long long v54 = *(_OWORD *)&v98.m23;
  *(_OWORD *)&retstr->double m21 = *(_OWORD *)&v98.m21;
  *(_OWORD *)&retstr->m23 = v54;
  long long v55 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v96.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v96.m33 = v55;
  long long v56 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v96.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v96.m43 = v56;
  long long v57 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v96.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v96.m13 = v57;
  long long v58 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v96.double m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v96.m23 = v58;
  CATransform3DTranslate(&v98, &v96, m21, m22, 0.0);
  long long v59 = *(_OWORD *)&v98.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v98.m31;
  *(_OWORD *)&retstr->m33 = v59;
  long long v60 = *(_OWORD *)&v98.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v98.m41;
  *(_OWORD *)&retstr->m43 = v60;
  long long v61 = *(_OWORD *)&v98.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v98.m11;
  *(_OWORD *)&retstr->m13 = v61;
  long long v62 = *(_OWORD *)&v98.m23;
  *(_OWORD *)&retstr->double m21 = *(_OWORD *)&v98.m21;
  *(_OWORD *)&retstr->m23 = v62;
  if (self->_appliesOriginalRotation)
  {
    long long v63 = [(_UIPlatterView *)self preview];
    [v63 originalRotation];
    long long v64 = *(_OWORD *)&retstr->m33;
    *(_OWORD *)&v96.m31 = *(_OWORD *)&retstr->m31;
    *(_OWORD *)&v96.m33 = v64;
    long long v65 = *(_OWORD *)&retstr->m43;
    *(_OWORD *)&v96.m41 = *(_OWORD *)&retstr->m41;
    *(_OWORD *)&v96.m43 = v65;
    long long v66 = *(_OWORD *)&retstr->m13;
    *(_OWORD *)&v96.m11 = *(_OWORD *)&retstr->m11;
    *(_OWORD *)&v96.m13 = v66;
    long long v67 = *(_OWORD *)&retstr->m23;
    *(_OWORD *)&v96.double m21 = *(_OWORD *)&retstr->m21;
    *(_OWORD *)&v96.m23 = v67;
    CATransform3DRotate(&v98, &v96, v68, 0.0, 0.0, 1.0);
    long long v69 = *(_OWORD *)&v98.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v98.m31;
    *(_OWORD *)&retstr->m33 = v69;
    long long v70 = *(_OWORD *)&v98.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v98.m41;
    *(_OWORD *)&retstr->m43 = v70;
    long long v71 = *(_OWORD *)&v98.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v98.m11;
    *(_OWORD *)&retstr->m13 = v71;
    long long v72 = *(_OWORD *)&v98.m23;
    *(_OWORD *)&retstr->double m21 = *(_OWORD *)&v98.m21;
    *(_OWORD *)&retstr->m23 = v72;
  }
  if (v4)
  {
    long long v73 = *(_OWORD *)&self->_appliedTransform.c;
    *(_OWORD *)&v98.m11 = *(_OWORD *)&self->_appliedTransform.a;
    *(_OWORD *)&v98.m13 = v73;
    *(_OWORD *)&v98.double m21 = *(_OWORD *)&self->_appliedTransform.tx;
    if (!CGAffineTransformIsIdentity((CGAffineTransform *)&v98))
    {
      long long v74 = *(_OWORD *)&self->_appliedTransform.c;
      *(_OWORD *)&v98.m11 = *(_OWORD *)&self->_appliedTransform.a;
      *(_OWORD *)&v98.m13 = v74;
      *(_OWORD *)&v98.double m21 = *(_OWORD *)&self->_appliedTransform.tx;
      CATransform3DMakeAffineTransform(&v94, (CGAffineTransform *)&v98);
      long long v75 = *(_OWORD *)&retstr->m33;
      *(_OWORD *)&v96.m31 = *(_OWORD *)&retstr->m31;
      *(_OWORD *)&v96.m33 = v75;
      long long v76 = *(_OWORD *)&retstr->m43;
      *(_OWORD *)&v96.m41 = *(_OWORD *)&retstr->m41;
      *(_OWORD *)&v96.m43 = v76;
      long long v77 = *(_OWORD *)&retstr->m13;
      *(_OWORD *)&v96.m11 = *(_OWORD *)&retstr->m11;
      *(_OWORD *)&v96.m13 = v77;
      long long v78 = *(_OWORD *)&retstr->m23;
      *(_OWORD *)&v96.double m21 = *(_OWORD *)&retstr->m21;
      *(_OWORD *)&v96.m23 = v78;
      CATransform3DConcat(&v98, &v96, &v94);
      long long v79 = *(_OWORD *)&v98.m33;
      *(_OWORD *)&retstr->m31 = *(_OWORD *)&v98.m31;
      *(_OWORD *)&retstr->m33 = v79;
      long long v80 = *(_OWORD *)&v98.m43;
      *(_OWORD *)&retstr->m41 = *(_OWORD *)&v98.m41;
      *(_OWORD *)&retstr->m43 = v80;
      long long v81 = *(_OWORD *)&v98.m13;
      *(_OWORD *)&retstr->m11 = *(_OWORD *)&v98.m11;
      *(_OWORD *)&retstr->m13 = v81;
      long long v82 = *(_OWORD *)&v98.m23;
      *(_OWORD *)&retstr->double m21 = *(_OWORD *)&v98.m21;
      *(_OWORD *)&retstr->m23 = v82;
    }
  }
  long long v83 = *(_OWORD *)&self->_additionalTransform.c;
  *(_OWORD *)&v98.m11 = *(_OWORD *)&self->_additionalTransform.a;
  *(_OWORD *)&v98.m13 = v83;
  *(_OWORD *)&v98.double m21 = *(_OWORD *)&self->_additionalTransform.tx;
  CATransform3DMakeAffineTransform(&v93, (CGAffineTransform *)&v98);
  long long v84 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v96.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v96.m33 = v84;
  long long v85 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v96.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v96.m43 = v85;
  long long v86 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v96.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v96.m13 = v86;
  long long v87 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v96.double m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v96.m23 = v87;
  CGPoint result = CATransform3DConcat(&v98, &v96, &v93);
  long long v89 = *(_OWORD *)&v98.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v98.m31;
  *(_OWORD *)&retstr->m33 = v89;
  long long v90 = *(_OWORD *)&v98.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v98.m41;
  *(_OWORD *)&retstr->m43 = v90;
  long long v91 = *(_OWORD *)&v98.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v98.m11;
  *(_OWORD *)&retstr->m13 = v91;
  long long v92 = *(_OWORD *)&v98.m23;
  *(_OWORD *)&retstr->double m21 = *(_OWORD *)&v98.m21;
  *(_OWORD *)&retstr->m23 = v92;
  return result;
}

- (void)takeCounterTransformsToAddToContainer:(id)a3
{
  id v4 = a3;
  double v5 = [v4 _window];
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v8 = v4;
  objc_msgSend(v5, "convertPoint:toView:", v8, v6, v7);
  double v10 = v9;
  double v12 = v11;
  objc_msgSend(v5, "convertPoint:toView:", v8, 1.0, 0.0);
  double v14 = v13;
  double v16 = v15;
  objc_msgSend(v5, "convertPoint:toView:", v8, 0.0, 1.0);
  double v18 = v17;
  double v20 = v19;
  long double v21 = hypot(v14 - v10, v16 - v12);
  long double v22 = hypot(v18 - v10, v20 - v12);
  CGAffineTransformMakeScale(&v26, v21, v22);
  long long v23 = *(_OWORD *)&v26.c;
  *(_OWORD *)&self->_containerCounterScaleTransform.CATransform3D a = *(_OWORD *)&v26.a;
  *(_OWORD *)&self->_containerCounterScaleTransform.c = v23;
  *(_OWORD *)&self->_containerCounterScaleTransform.tdouble x = *(_OWORD *)&v26.tx;
  double RotationAngleFromViewToView = DUIPreviewGetRotationAngleFromViewToView(v8, 0, 0);

  CGAffineTransformMakeRotation(&v26, -RotationAngleFromViewToView);
  long long v25 = *(_OWORD *)&v26.c;
  *(_OWORD *)&self->_containerCounterRotationTransform.CATransform3D a = *(_OWORD *)&v26.a;
  *(_OWORD *)&self->_containerCounterRotationTransform.c = v25;
  *(_OWORD *)&self->_containerCounterRotationTransform.tdouble x = *(_OWORD *)&v26.tx;
  [(_UIPlatterView *)self updateTransform];
}

- (void)setTransformAppliedExternally:(BOOL)a3
{
  self->_transformAppliedExternalldouble y = a3;
  if (a3)
  {
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    v7[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    v7[5] = v3;
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    v7[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    v7[7] = v4;
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    v7[0] = *MEMORY[0x1E4F39B10];
    v7[1] = v5;
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    v7[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    v7[3] = v6;
    [(UIView *)self setTransform3D:v7];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  long long v3 = [(_UIPlatterView *)self preview];
  [v3 unscaledSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPlatterView;
  [(UIView *)&v6 didMoveToWindow];
  long long v3 = [(UIView *)self superview];
  uint64_t v4 = -[UIView _subviewsNeedAxisFlipping](v3);
  double v5 = [(UIView *)self layer];
  [v5 setFlipsHorizontalAxis:v4];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(_UIPlatterView *)self constrainSize])
  {
    double v8 = [(_UIPlatterView *)self preview];
    [v8 scaleFactor];
    double v10 = 1.0 / v9;

    double v11 = [(_UIPlatterView *)self preview];
    [v11 croppedScaledSize];
    double v13 = v12;
    double v15 = v14;

    v21.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
    v21.origin.double y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
    v21.size.double width = v10 * v13;
    v21.size.double height = v10 * v15;
    v20.double x = x;
    v20.double y = y;
    BOOL v16 = CGRectContainsPoint(v21, v20);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)_UIPlatterView;
    BOOL v16 = -[UIView pointInside:withEvent:](&v19, sel_pointInside_withEvent_, v7, x, y);
  }
  BOOL v17 = v16;

  return v17;
}

- (void)didMoveToSuperview
{
  long long v3 = [(UIView *)self superview];
  if (v3)
  {
    anchorPointValueToAdjustToOnMoveToWindow = self->_anchorPointValueToAdjustToOnMoveToWindow;
    if (anchorPointValueToAdjustToOnMoveToWindow)
    {
      self->_anchorPointValueToAdjustToOnMoveToWindow = 0;
      id v34 = v3;
      double v5 = anchorPointValueToAdjustToOnMoveToWindow;

      [(NSValue *)v5 CGPointValue];
      double v7 = v6;
      double v9 = v8;

      double v10 = self;
      double v11 = [(UIView *)v10 superview];
      [(UIView *)v10 bounds];
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGPoint v20 = [(UIView *)v10 layer];
      [v20 anchorPoint];
      [(UIView *)v10 convertPoint:v11 toView:___PlatterViewAdjustAnchorPointWhileKeepingPosition_block_invoke(v21, v22, v13, v15, v17, v19)];
      double v24 = v23;
      double v26 = v25;

      [(UIView *)v10 convertPoint:v11 toView:___PlatterViewAdjustAnchorPointWhileKeepingPosition_block_invoke(v7, v9, v13, v15, v17, v19)];
      double v28 = v27;
      double v30 = v29;
      [(UIView *)v10 center];
      -[UIView setCenter:](v10, "setCenter:", v31 + v28 - v24, v32 + v30 - v26);
      long long v33 = [(UIView *)v10 layer];

      objc_msgSend(v33, "setAnchorPoint:", v7, v9);
      long long v3 = v34;
    }
  }
}

- (void)updateTransform
{
  if (![(_UIPlatterView *)self transformAppliedExternally])
  {
    [(_UIPlatterView *)self targetTransform];
    v3[4] = v3[12];
    v3[5] = v3[13];
    v3[6] = v3[14];
    v3[7] = v3[15];
    v3[0] = v3[8];
    v3[1] = v3[9];
    v3[2] = v3[10];
    v3[3] = v3[11];
    [(UIView *)self setTransform3D:v3];
    [(_UIPlatterView *)self _updateShadowViewState];
  }
}

- (BOOL)_isEligibleForFocusOcclusion
{
  return 0;
}

- (_DUIPreview)preview
{
  return self->_preview;
}

- (UIView)componentView
{
  return self->_componentView;
}

- (_UIDragPreviewShadowProperties)shadowProperties
{
  return self->_shadowProperties;
}

- (BOOL)isLifted
{
  return self->_lifted;
}

- (BOOL)isBackgroundVisible
{
  return self->_backgroundVisible;
}

- (BOOL)isShadowVisible
{
  return self->_shadowVisible;
}

- (BOOL)transformAppliedExternally
{
  return self->_transformAppliedExternally;
}

- (BOOL)constrainSize
{
  return self->_constrainSize;
}

- (BOOL)constrainSizeWhenNotLifted
{
  return self->_constrainSizeWhenNotLifted;
}

- (void)setConstrainSizeWhenNotLifted:(BOOL)a3
{
  self->_constrainSizeWhenNotLifted = a3;
}

- (CGSize)overrideSize
{
  double width = self->_overrideSize.width;
  double height = self->_overrideSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  bottoCGAffineTransform m = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.bottoCGAffineTransform m = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (double)orientationRotation
{
  return self->_orientationRotation;
}

- (BOOL)appliesOriginalRotation
{
  return self->_appliesOriginalRotation;
}

- (double)stackRotation
{
  return self->_stackRotation;
}

- (CGAffineTransform)appliedTransform
{
  long long v3 = *(_OWORD *)&self[12].d;
  *(_OWORD *)&retstr->CATransform3D a = *(_OWORD *)&self[12].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[12].ty;
  return self;
}

- (CGAffineTransform)additionalTransform
{
  long long v3 = *(_OWORD *)&self[13].d;
  *(_OWORD *)&retstr->CATransform3D a = *(_OWORD *)&self[13].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[13].ty;
  return self;
}

- (NSValue)anchorPointValueToAdjustToOnMoveToWindow
{
  return self->_anchorPointValueToAdjustToOnMoveToWindow;
}

- (void)setAnchorPointValueToAdjustToOnMoveToWindow:(id)a3
{
}

- (BOOL)isFlipped
{
  return self->_flipped;
}

- (void)setFlipped:(BOOL)a3
{
  self->_flipped = a3;
}

- (BOOL)precisionMode
{
  return self->_precisionMode;
}

- (void)setPrecisionMode:(BOOL)a3
{
  self->_precisionMode = a3;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (_UIShapeView)platterMaskView
{
  return self->_platterMaskView;
}

- (_UIShapeView)portalMaskView
{
  return self->_portalMaskView;
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void)setPortalView:(id)a3
{
}

- (UIView)portalWrapperView
{
  return self->_portalWrapperView;
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (CGAffineTransform)containerCounterScaleTransform
{
  long long v3 = *(_OWORD *)&self[14].d;
  *(_OWORD *)&retstr->CATransform3D a = *(_OWORD *)&self[14].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[14].ty;
  return self;
}

- (void)setContainerCounterScaleTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_containerCounterScaleTransform.CATransform3D a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_containerCounterScaleTransform.c = v4;
  *(_OWORD *)&self->_containerCounterScaleTransform.tdouble x = v3;
}

- (CGAffineTransform)containerCounterRotationTransform
{
  long long v3 = *(_OWORD *)&self[15].d;
  *(_OWORD *)&retstr->CATransform3D a = *(_OWORD *)&self[15].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[15].ty;
  return self;
}

- (void)setContainerCounterRotationTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_containerCounterRotationTransform.CATransform3D a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_containerCounterRotationTransform.c = v4;
  *(_OWORD *)&self->_containerCounterRotationTransform.tdouble x = v3;
}

- (BOOL)hasAppliedMasking
{
  return self->_hasAppliedMasking;
}

- (void)setHasAppliedMasking:(BOOL)a3
{
  self->_hasAppliedMasking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_portalWrapperView, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_portalMaskView, 0);
  objc_storeStrong((id *)&self->_platterMaskView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_anchorPointValueToAdjustToOnMoveToWindow, 0);
  objc_storeStrong((id *)&self->_shadowProperties, 0);
  objc_storeStrong((id *)&self->_componentView, 0);
  objc_storeStrong((id *)&self->_preview, 0);
}

@end