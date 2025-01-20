@interface PUParallaxImageLayerView
- (BOOL)backfillMaskingEnabled;
- (BOOL)isEditing;
- (CALayer)maskLayer;
- (PFParallaxImageLayer)backfillParallaxImageLayer;
- (PFParallaxImageLayer)parallaxImageLayer;
- (PUHeadroomGradientView)headroomGradientView;
- (PUParallaxImageLayerView)initWithParallaxImageLayer:(id)a3 isEditing:(BOOL)a4;
- (UIView)backfillMaskView;
- (UIView)backfillView;
- (UIView)contentView;
- (id)currentLayoutInfo;
- (void)_layoutWithCurrentLayoutInfo;
- (void)_updateParallaxBackfillLayerProperties;
- (void)_updateParallaxBackfillMaskingProperties;
- (void)_updateParallaxHeadroomLayerProperties;
- (void)_updateParallaxImageLayerProperties;
- (void)setBackfillMaskView:(id)a3;
- (void)setBackfillMaskingEnabled:(BOOL)a3;
- (void)setBackfillParallaxImageLayer:(id)a3;
- (void)setBackfillView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setCurrentLayoutInfo:(id)a3;
- (void)setHeadroomGradientView:(id)a3;
- (void)setParallaxImageLayer:(id)a3;
@end

@implementation PUParallaxImageLayerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_headroomGradientView, 0);
  objc_storeStrong((id *)&self->_backfillMaskView, 0);
  objc_storeStrong((id *)&self->_backfillView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_backfillParallaxImageLayer, 0);
  objc_storeStrong((id *)&self->_parallaxImageLayer, 0);
  objc_storeStrong((id *)&self->_currentLayoutInfo, 0);
}

- (CALayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setHeadroomGradientView:(id)a3
{
}

- (PUHeadroomGradientView)headroomGradientView
{
  return self->_headroomGradientView;
}

- (void)setBackfillMaskView:(id)a3
{
}

- (UIView)backfillMaskView
{
  return self->_backfillMaskView;
}

- (void)setBackfillView:(id)a3
{
}

- (UIView)backfillView
{
  return self->_backfillView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)backfillMaskingEnabled
{
  return self->_backfillMaskingEnabled;
}

- (PFParallaxImageLayer)backfillParallaxImageLayer
{
  return self->_backfillParallaxImageLayer;
}

- (PFParallaxImageLayer)parallaxImageLayer
{
  return self->_parallaxImageLayer;
}

- (id)currentLayoutInfo
{
  return self->_currentLayoutInfo;
}

- (void)_layoutWithCurrentLayoutInfo
{
  v3 = [(PUParallaxImageLayerView *)self currentLayoutInfo];
  if (v3)
  {
    v4 = [(PUParallaxImageLayerView *)self parallaxImageLayer];
    if (v4)
    {
      v5 = [(PUParallaxImageLayerView *)self contentView];
      v6 = [(PUParallaxImageLayerView *)self backfillMaskView];
      [v4 frame];
      objc_msgSend(v3, "viewFrameForLayerFrame:");
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      [v3 additionalContentTransform];
      v77.origin.double x = v8;
      v77.origin.double y = v10;
      v77.size.double width = v12;
      v77.size.double height = v14;
      CGRect v78 = CGRectApplyAffineTransform(v77, &v76);
      double x = v78.origin.x;
      double y = v78.origin.y;
      double width = v78.size.width;
      double height = v78.size.height;
      objc_msgSend(v5, "setFrame:");
      objc_msgSend(v6, "setFrame:", x, y, width, height);
    }
    v19 = [(PUParallaxImageLayerView *)self backfillParallaxImageLayer];
    if (v19)
    {
      v20 = [(PUParallaxImageLayerView *)self backfillView];
      [v19 frame];
      objc_msgSend(v3, "viewFrameForLayerFrame:");
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      [v3 additionalContentTransform];
      v79.origin.double x = v22;
      v79.origin.double y = v24;
      v79.size.double width = v26;
      v79.size.double height = v28;
      CGRect v80 = CGRectApplyAffineTransform(v79, &v75);
      objc_msgSend(v20, "setFrame:", v80.origin.x, v80.origin.y, v80.size.width, v80.size.height);
    }
    v29 = [(PUParallaxImageLayerView *)self headroomGradientView];
    if (v29)
    {
      [v3 headroomFrame];
      objc_msgSend(v3, "viewFrameForLayerFrame:");
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      CGFloat v35 = v34;
      CGFloat v37 = v36;
      [v3 additionalContentTransform];
      v81.origin.double x = v31;
      v81.origin.double y = v33;
      v81.size.double width = v35;
      v81.size.double height = v37;
      CGRectApplyAffineTransform(v81, &v74);
      v38 = [(PUParallaxImageLayerView *)self window];
      v39 = [v38 screen];
      if (v39)
      {
        v40 = [(PUParallaxImageLayerView *)self window];
        v41 = [v40 screen];
        [v41 scale];
      }
      PXRectRoundToPixel();
      CGRect v83 = CGRectInset(v82, -1.0, -1.0);
      objc_msgSend(v29, "setFrame:animated:", objc_msgSend(v3, "animateChanges"), v83.origin.x, v83.origin.y, v83.size.width, v83.size.height);
      [v3 headroomVisibilityAmount];
      objc_msgSend(v29, "setVisibilityAmount:");
      objc_msgSend(v29, "setUsesHighKeyStyle:", objc_msgSend(v3, "styleIsHighKey"));
      v42 = [v3 primaryStyleColor];
      [v29 setPrimaryGradientColor:v42];

      objc_msgSend(v29, "setIsInactive:", objc_msgSend(v4, "isInactive"));
    }
    [v3 containerFrame];
    int v43 = [v3 canApplyParallax];
    [v3 parallaxAmount];
    if (v43) {
      [v3 parallaxVector];
    }
    if (![(PUParallaxImageLayerView *)self isEditing]) {
      goto LABEL_21;
    }
    v44 = [(PUParallaxImageLayerView *)self maskLayer];
    [v3 settlingEffectFrame];
    double v45 = v84.origin.x;
    double v46 = v84.origin.y;
    double v47 = v84.size.width;
    double v48 = v84.size.height;
    if (CGRectIsEmpty(v84))
    {
      [v3 visibilityEdge];
      v49 = [(PUParallaxImageLayerView *)self traitCollection];
      uint64_t v50 = [v49 layoutDirection];

      if (v50 == 1) {
        PXEdgesFlippedHorizontally();
      }
      [v3 visibleFrame];
      objc_msgSend(v3, "viewFrameForLayerFrame:");
      CGFloat v52 = v51;
      CGFloat v54 = v53;
      CGFloat v56 = v55;
      CGFloat v58 = v57;
      [v3 additionalContentTransform];
      v85.origin.double x = v52;
      v85.origin.double y = v54;
      v85.size.double width = v56;
      v85.size.double height = v58;
      CGRect v86 = CGRectApplyAffineTransform(v85, &v72);
      CGRectGetHeight(v86);
      PXRectWithOriginAndSize();
      [v3 visibilityAmount];
      uint64_t v70 = v59;
      PXRectByLinearlyInterpolatingRects();
      PXRectWithSizeAlignedToRectEdges();
      [v44 setFrame:v70];
      [v3 visibilityAmount];
      if (PXFloatApproximatelyEqualToFloat())
      {
        v60 = 0;
LABEL_20:
        v69 = [(PUParallaxImageLayerView *)self layer];
        [v69 setMask:v60];

LABEL_21:
        [v3 additionalTransform];
        v71[0] = v71[3];
        v71[1] = v71[4];
        v71[2] = v71[5];
        [(PUParallaxImageLayerView *)self setTransform:v71];
        PXRectWithSize();
        -[PUParallaxImageLayerView setBounds:](self, "setBounds:");
        PXRectGetCenter();
        -[PUParallaxImageLayerView setCenter:](self, "setCenter:");

        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend(v3, "viewFrameForLayerFrame:", v45, v46, v47, v48);
      CGFloat v62 = v61;
      CGFloat v64 = v63;
      CGFloat v66 = v65;
      CGFloat v68 = v67;
      [v3 additionalContentTransform];
      v87.origin.double x = v62;
      v87.origin.double y = v64;
      v87.size.double width = v66;
      v87.size.double height = v68;
      CGRect v88 = CGRectApplyAffineTransform(v87, &v73);
      objc_msgSend(v44, "setFrame:", v88.origin.x, v88.origin.y, v88.size.width, v88.size.height);
    }
    v60 = v44;
    goto LABEL_20;
  }
LABEL_22:
}

- (void)setCurrentLayoutInfo:(id)a3
{
  CGFloat v8 = (PUParallaxLayerLayoutInfo *)a3;
  v5 = self->_currentLayoutInfo;
  if (v5 == v8)
  {
  }
  else
  {
    v6 = v5;
    BOOL v7 = [(PUParallaxLayerLayoutInfo *)v5 isEqual:v8];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_currentLayoutInfo, a3);
      [(PUParallaxImageLayerView *)self _layoutWithCurrentLayoutInfo];
    }
  }
}

- (void)_updateParallaxHeadroomLayerProperties
{
  v3 = [(PUParallaxImageLayerView *)self parallaxImageLayer];
  v4 = [v3 identifier];
  if (PFParallaxLayerIDIsBackground())
  {

LABEL_4:
    headroomGradientView = self->_headroomGradientView;
    if (!headroomGradientView)
    {
      double v9 = [PUHeadroomGradientView alloc];
      CGFloat v10 = -[PUHeadroomGradientView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v11 = self->_headroomGradientView;
      self->_headroomGradientView = v10;

      CGFloat v12 = [(PUHeadroomGradientView *)self->_headroomGradientView layer];
      [v12 setZPosition:2.0];

      [(PUParallaxImageLayerView *)self addSubview:self->_headroomGradientView];
      headroomGradientView = self->_headroomGradientView;
    }
    [(PUParallaxImageLayerView *)self bringSubviewToFront:headroomGradientView];
    return;
  }
  v5 = [(PUParallaxImageLayerView *)self backfillParallaxImageLayer];
  v6 = [v5 identifier];
  int v7 = PFParallaxLayerIDIsBackground();

  if (v7) {
    goto LABEL_4;
  }
  [(PUHeadroomGradientView *)self->_headroomGradientView removeFromSuperview];
  double v13 = self->_headroomGradientView;
  self->_headroomGradientView = 0;
}

- (void)_updateParallaxBackfillMaskingProperties
{
  if ([(PUParallaxImageLayerView *)self isEditing])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __68__PUParallaxImageLayerView__updateParallaxBackfillMaskingProperties__block_invoke;
    v3[3] = &unk_1E5F2ED10;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
  }
}

uint64_t __68__PUParallaxImageLayerView__updateParallaxBackfillMaskingProperties__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) backfillMaskingEnabled]
    && ([*(id *)(*(void *)(a1 + 32) + 440) layer],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 contents],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    if (!*(void *)(*(void *)(a1 + 32) + 456))
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      uint64_t v5 = *(void *)(a1 + 32);
      v6 = *(void **)(v5 + 456);
      *(void *)(v5 + 456) = v4;

      int v7 = [*(id *)(*(void *)(a1 + 32) + 456) layer];
      [v7 setZPosition:0.0];

      CGFloat v8 = +[PUSuggestionsSettings sharedInstance];
      int v9 = [v8 debugBackfillCompositing];

      if (v9)
      {
        id v10 = [MEMORY[0x1E4FB1618] greenColor];
        uint64_t v11 = [v10 CGColor];
        CGFloat v12 = [*(id *)(*(void *)(a1 + 32) + 456) layer];
        [v12 setBackgroundColor:v11];

        double v13 = [*(id *)(*(void *)(a1 + 32) + 456) layer];
        CGFloat v14 = v13;
        uint64_t v15 = 0;
      }
      else
      {
        id v20 = [MEMORY[0x1E4FB1618] blackColor];
        uint64_t v21 = [v20 CGColor];
        CGFloat v22 = [*(id *)(*(void *)(a1 + 32) + 456) layer];
        [v22 setBackgroundColor:v21];

        uint64_t v23 = *MEMORY[0x1E4F3A098];
        double v13 = [*(id *)(*(void *)(a1 + 32) + 456) layer];
        CGFloat v14 = v13;
        uint64_t v15 = v23;
      }
      [v13 setCompositingFilter:v15];

      [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 456)];
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 456) removeFromSuperview];
    uint64_t v16 = *(void *)(a1 + 32);
    v17 = *(void **)(v16 + 456);
    *(void *)(v16 + 456) = 0;
  }
  v18 = *(void **)(a1 + 32);
  return [v18 _layoutWithCurrentLayoutInfo];
}

- (void)_updateParallaxBackfillLayerProperties
{
  if ([(PUParallaxImageLayerView *)self isEditing]
    || [MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __66__PUParallaxImageLayerView__updateParallaxBackfillLayerProperties__block_invoke;
    v3[3] = &unk_1E5F2ED10;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
  }
}

void __66__PUParallaxImageLayerView__updateParallaxBackfillLayerProperties__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) backfillParallaxImageLayer];
  v3 = *(void **)(*(void *)(a1 + 32) + 448);
  id v11 = v2;
  if (v2)
  {
    if (!v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      uint64_t v5 = *(void *)(a1 + 32);
      v6 = *(void **)(v5 + 448);
      *(void *)(v5 + 448) = v4;

      int v7 = [*(id *)(*(void *)(a1 + 32) + 448) layer];
      [v7 setZPosition:-1.0];

      [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 448)];
      v2 = v11;
    }
    uint64_t v8 = [v2 image];
    int v9 = [*(id *)(*(void *)(a1 + 32) + 448) layer];
    [v9 setContents:v8];
  }
  else
  {
    [v3 removeFromSuperview];
    uint64_t v10 = *(void *)(a1 + 32);
    int v9 = *(void **)(v10 + 448);
    *(void *)(v10 + 448) = 0;
  }

  [*(id *)(a1 + 32) _layoutWithCurrentLayoutInfo];
}

- (void)_updateParallaxImageLayerProperties
{
  v3 = [(PUParallaxImageLayerView *)self parallaxImageLayer];
  id v4 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__PUParallaxImageLayerView__updateParallaxImageLayerProperties__block_invoke;
  v6[3] = &unk_1E5F2ECC8;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v4 performWithoutAnimation:v6];
}

uint64_t __63__PUParallaxImageLayerView__updateParallaxImageLayerProperties__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 440);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 440);
    *(void *)(v4 + 440) = v3;

    v6 = [*(id *)(*(void *)(a1 + 32) + 440) layer];
    [v6 setZPosition:1.0];

    [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 440)];
    v2 = *(void **)(*(void *)(a1 + 32) + 440);
  }
  id v7 = [v2 layer];
  uint64_t v8 = [v7 contents];
  char v9 = (v8 != 0) ^ ([*(id *)(a1 + 40) image] == 0);

  uint64_t v10 = [*(id *)(a1 + 40) image];
  id v11 = [*(id *)(*(void *)(a1 + 32) + 440) layer];
  [v11 setContents:v10];

  uint64_t result = [*(id *)(a1 + 32) _layoutWithCurrentLayoutInfo];
  if ((v9 & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) backfillMaskingEnabled];
    if (result)
    {
      double v13 = *(void **)(a1 + 32);
      return [v13 _updateParallaxBackfillMaskingProperties];
    }
  }
  return result;
}

- (void)setBackfillMaskingEnabled:(BOOL)a3
{
  if (((!self->_backfillMaskingEnabled ^ a3) & 1) == 0)
  {
    self->_backfillMaskingEnabled = a3;
    [(PUParallaxImageLayerView *)self _updateParallaxBackfillMaskingProperties];
  }
}

- (void)setBackfillParallaxImageLayer:(id)a3
{
  char v9 = (PFParallaxImageLayer *)a3;
  id v5 = self->_backfillParallaxImageLayer;
  if (v5 == v9)
  {

    goto LABEL_6;
  }
  v6 = v5;
  char v7 = [(PFParallaxImageLayer *)v5 isEqual:v9];

  uint64_t v8 = v9;
  if (v9 && (v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backfillParallaxImageLayer, a3);
    [(PUParallaxImageLayerView *)self _updateParallaxBackfillLayerProperties];
    [(PUParallaxImageLayerView *)self _updateParallaxHeadroomLayerProperties];
LABEL_6:
    uint64_t v8 = v9;
  }
}

- (void)setParallaxImageLayer:(id)a3
{
  uint64_t v8 = (PFParallaxImageLayer *)a3;
  id v5 = self->_parallaxImageLayer;
  if (v5 == v8)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [(PFParallaxImageLayer *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_parallaxImageLayer, a3);
      [(PUParallaxImageLayerView *)self _updateParallaxImageLayerProperties];
      [(PUParallaxImageLayerView *)self _updateParallaxHeadroomLayerProperties];
    }
  }
}

- (PUParallaxImageLayerView)initWithParallaxImageLayer:(id)a3 isEditing:(BOOL)a4
{
  BOOL v4 = a4;
  v21[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PUParallaxImageLayerView;
  uint64_t v8 = [(PUParallaxImageLayerView *)&v19 init];
  char v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_parallaxImageLayer, a3);
    v9->_editing = v4;
    if (v4)
    {
      uint64_t v10 = [MEMORY[0x1E4F39BE8] layer];
      id v11 = [MEMORY[0x1E4FB1618] blackColor];
      -[CALayer setBackgroundColor:](v10, "setBackgroundColor:", [v11 CGColor]);

      v20[0] = @"bounds";
      CGFloat v12 = [MEMORY[0x1E4F1CA98] null];
      v21[0] = v12;
      v20[1] = @"position";
      double v13 = [MEMORY[0x1E4F1CA98] null];
      v21[1] = v13;
      v20[2] = @"frame";
      CGFloat v14 = [MEMORY[0x1E4F1CA98] null];
      v21[2] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
      [(CALayer *)v10 setActions:v15];

      uint64_t v16 = [(PUParallaxImageLayerView *)v9 layer];
      [v16 setMask:v10];

      maskLayer = v9->_maskLayer;
      v9->_maskLayer = v10;
    }
    [(PUParallaxImageLayerView *)v9 _updateParallaxImageLayerProperties];
    [(PUParallaxImageLayerView *)v9 _updateParallaxHeadroomLayerProperties];
  }

  return v9;
}

@end