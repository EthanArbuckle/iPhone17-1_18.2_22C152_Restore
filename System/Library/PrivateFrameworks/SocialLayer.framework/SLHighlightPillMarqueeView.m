@interface SLHighlightPillMarqueeView
- (BOOL)endingPositionConstraintsShouldBeActive;
- (BOOL)marqueeAnimationIsActive;
- (BOOL)marqueeEnabled;
- (CALayer)maskLayer;
- (NSLayoutConstraint)ourHeightConstraint;
- (NSLayoutConstraint)ourWidthConstraint;
- (NSLayoutConstraint)replicatorViewEndingPositionXConstraint;
- (NSLayoutConstraint)replicatorViewStartingPositionXConstraint;
- (NSLayoutConstraint)replicatorViewYConstraint;
- (SLHighlightPillMarqueeView)initWithFrame:(CGRect)a3 pillView:(id)a4;
- (SLReplicatorView)replicatorView;
- (UIView)pillView;
- (double)marqueeClippingWidth;
- (int64_t)replicatedContentAlignment;
- (void)_activateMarqueeAnimationIfNecessary;
- (void)_deactivateMarqueeAnimationIfNecessary;
- (void)layoutSubviews;
- (void)setEndingPositionConstraintsShouldBeActive:(BOOL)a3;
- (void)setMarqueeAnimationIsActive:(BOOL)a3;
- (void)setMarqueeClippingWidth:(double)a3;
- (void)setMarqueeEnabled:(BOOL)a3;
- (void)setMaskLayer:(id)a3;
- (void)setOurHeightConstraint:(id)a3;
- (void)setOurWidthConstraint:(id)a3;
- (void)setPillView:(id)a3;
- (void)setReplicatedContentAlignment:(int64_t)a3;
- (void)setReplicatorView:(id)a3;
- (void)setReplicatorViewEndingPositionXConstraint:(id)a3;
- (void)setReplicatorViewStartingPositionXConstraint:(id)a3;
- (void)setReplicatorViewYConstraint:(id)a3;
- (void)updateConstraints;
@end

@implementation SLHighlightPillMarqueeView

- (SLHighlightPillMarqueeView)initWithFrame:(CGRect)a3 pillView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)SLHighlightPillMarqueeView;
  v10 = -[SLHighlightPillMarqueeView initWithFrame:](&v39, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(SLHighlightPillMarqueeView *)v10 setPillView:v9];
    [(SLHighlightPillMarqueeView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SLHighlightPillMarqueeView *)v11 setMarqueeAnimationIsActive:0];
    [(SLHighlightPillMarqueeView *)v11 setEndingPositionConstraintsShouldBeActive:0];
    v12 = -[SLReplicatorView initWithFrame:targetView:]([SLReplicatorView alloc], "initWithFrame:targetView:", v9, x, y, width, height);
    [(SLHighlightPillMarqueeView *)v11 setReplicatorView:v12];

    v13 = [(SLHighlightPillMarqueeView *)v11 replicatorView];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    v14 = [(SLHighlightPillMarqueeView *)v11 replicatorView];
    [(SLHighlightPillMarqueeView *)v11 addSubview:v14];

    v15 = (void *)MEMORY[0x1E4FB1818];
    v16 = SLFrameworkBundle();
    v17 = [(SLHighlightPillMarqueeView *)v11 traitCollection];
    v18 = [v15 imageNamed:@"SLAttributionViewMarqueeMask" inBundle:v16 compatibleWithTraitCollection:v17];

    [v18 size];
    double v20 = 1.0 / v19;
    v21 = [MEMORY[0x1E4F39BE8] layer];
    [(SLHighlightPillMarqueeView *)v11 setMaskLayer:v21];

    id v22 = v18;
    uint64_t v23 = [v22 CGImage];
    v24 = [(SLHighlightPillMarqueeView *)v11 maskLayer];
    [v24 setContents:v23];

    v25 = [(SLHighlightPillMarqueeView *)v11 maskLayer];
    objc_msgSend(v25, "setContentsCenter:", 0.5 - v20 * 0.5, 0.0, v20, 1.0);

    [v22 scale];
    double v27 = v26;
    v28 = [(SLHighlightPillMarqueeView *)v11 maskLayer];
    [v28 setContentsScale:v27];

    [(SLHighlightPillMarqueeView *)v11 bounds];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    v37 = [(SLHighlightPillMarqueeView *)v11 maskLayer];
    objc_msgSend(v37, "setFrame:", v30, v32, v34, v36);
  }
  return v11;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SLHighlightPillMarqueeView;
  [(SLHighlightPillMarqueeView *)&v12 layoutSubviews];
  [(SLHighlightPillMarqueeView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SLHighlightPillMarqueeView *)self maskLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)setMarqueeEnabled:(BOOL)a3
{
  if (self->_marqueeEnabled != a3)
  {
    self->_marqueeEnabled = a3;
    [(SLHighlightPillMarqueeView *)self updateConstraints];
    [(SLHighlightPillMarqueeView *)self layoutIfNeeded];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__SLHighlightPillMarqueeView_setMarqueeEnabled___block_invoke;
    v5[3] = &unk_1E58A86D0;
    BOOL v6 = a3;
    v5[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __48__SLHighlightPillMarqueeView_setMarqueeEnabled___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  double v3 = *(void **)(a1 + 32);
  if (v2)
  {
    double v4 = [v3 maskLayer];
    double v5 = [*(id *)(a1 + 32) layer];
    [v5 setMask:v4];

    [*(id *)(a1 + 32) setNeedsLayout];
    BOOL v6 = *(void **)(a1 + 32);
    return [v6 _activateMarqueeAnimationIfNecessary];
  }
  else
  {
    double v8 = [v3 layer];
    [v8 setMask:0];

    [*(id *)(a1 + 32) setNeedsLayout];
    double v9 = *(void **)(a1 + 32);
    return [v9 _deactivateMarqueeAnimationIfNecessary];
  }
}

- (void)setMarqueeClippingWidth:(double)a3
{
  if (!SL_CGFloatApproximatelyEqualToFloat(a3, self->_marqueeClippingWidth))
  {
    self->_marqueeClippingWidth = a3;
    if (![(SLHighlightPillMarqueeView *)self marqueeAnimationIsActive])
    {
      [(SLHighlightPillMarqueeView *)self setNeedsUpdateConstraints];
    }
  }
}

- (void)setReplicatedContentAlignment:(int64_t)a3
{
  if (self->_replicatedContentAlignment != a3)
  {
    self->_replicatedContentAlignment = a3;
    if (![(SLHighlightPillMarqueeView *)self marqueeAnimationIsActive])
    {
      [(SLHighlightPillMarqueeView *)self setNeedsUpdateConstraints];
    }
  }
}

- (void)setEndingPositionConstraintsShouldBeActive:(BOOL)a3
{
  if (self->_endingPositionConstraintsShouldBeActive != a3)
  {
    self->_endingPositionConstraintsShouldBeActive = a3;
    [(SLHighlightPillMarqueeView *)self updateConstraints];
    [(SLHighlightPillMarqueeView *)self layoutIfNeeded];
  }
}

- (void)updateConstraints
{
  v71.receiver = self;
  v71.super_class = (Class)SLHighlightPillMarqueeView;
  [(SLHighlightPillMarqueeView *)&v71 updateConstraints];
  double v3 = [MEMORY[0x1E4F1CA80] set];
  double v4 = [MEMORY[0x1E4F1CA80] set];
  double v5 = [(SLHighlightPillMarqueeView *)self ourWidthConstraint];

  if (v5)
  {
    BOOL v6 = [(SLHighlightPillMarqueeView *)self ourWidthConstraint];
    [v6 constant];
    double v8 = v7;
    [(SLHighlightPillMarqueeView *)self marqueeClippingWidth];
    BOOL v10 = SL_CGFloatApproximatelyEqualToFloat(v8, v9);

    if (v10) {
      goto LABEL_6;
    }
    [(SLHighlightPillMarqueeView *)self marqueeClippingWidth];
    double v12 = v11;
    v13 = [(SLHighlightPillMarqueeView *)self ourWidthConstraint];
    [v13 setConstant:v12];
  }
  else
  {
    v14 = [(SLHighlightPillMarqueeView *)self widthAnchor];
    [(SLHighlightPillMarqueeView *)self marqueeClippingWidth];
    v15 = objc_msgSend(v14, "constraintEqualToConstant:");
    [(SLHighlightPillMarqueeView *)self setOurWidthConstraint:v15];

    v13 = [(SLHighlightPillMarqueeView *)self ourWidthConstraint];
    [v3 addObject:v13];
  }

LABEL_6:
  v16 = [(SLHighlightPillMarqueeView *)self ourHeightConstraint];

  if (!v16)
  {
    v17 = [(SLHighlightPillMarqueeView *)self heightAnchor];
    v18 = [(SLHighlightPillMarqueeView *)self pillView];
    double v19 = [v18 heightAnchor];
    double v20 = [v17 constraintEqualToAnchor:v19];
    [(SLHighlightPillMarqueeView *)self setOurHeightConstraint:v20];

    v21 = [(SLHighlightPillMarqueeView *)self ourHeightConstraint];
    [v3 addObject:v21];
  }
  int64_t v22 = [(SLHighlightPillMarqueeView *)self replicatedContentAlignment];
  if (v22 != 2)
  {
    if (v22 == 1 && ![(SLHighlightPillMarqueeView *)self marqueeEnabled])
    {
      uint64_t v23 = [(SLHighlightPillMarqueeView *)self centerXAnchor];
      v24 = [(SLHighlightPillMarqueeView *)self replicatorView];
      uint64_t v25 = [v24 centerXAnchor];
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if ([(SLHighlightPillMarqueeView *)self marqueeEnabled])
  {
LABEL_13:
    uint64_t v23 = [(SLHighlightPillMarqueeView *)self leadingAnchor];
    v24 = [(SLHighlightPillMarqueeView *)self replicatorView];
    uint64_t v25 = [v24 leadingAnchor];
    goto LABEL_14;
  }
  uint64_t v23 = [(SLHighlightPillMarqueeView *)self trailingAnchor];
  v24 = [(SLHighlightPillMarqueeView *)self replicatorView];
  uint64_t v25 = [v24 trailingAnchor];
LABEL_14:
  double v26 = (void *)v25;

  uint64_t v27 = [(SLHighlightPillMarqueeView *)self replicatorViewStartingPositionXConstraint];
  if (v27)
  {
    v28 = (void *)v27;
    double v29 = [(SLHighlightPillMarqueeView *)self replicatorViewStartingPositionXConstraint];
    double v30 = [v29 firstAnchor];
    if (v30 == v26)
    {
      double v31 = [(SLHighlightPillMarqueeView *)self replicatorViewStartingPositionXConstraint];
      double v32 = [v31 secondAnchor];

      if (v32 == v23) {
        goto LABEL_21;
      }
    }
    else
    {
    }
  }
  double v33 = [(SLHighlightPillMarqueeView *)self replicatorViewStartingPositionXConstraint];
  int v34 = [v33 isActive];

  if (v34)
  {
    double v35 = [(SLHighlightPillMarqueeView *)self replicatorViewStartingPositionXConstraint];
    [v4 addObject:v35];
  }
  double v36 = [v26 constraintEqualToAnchor:v23];
  [(SLHighlightPillMarqueeView *)self setReplicatorViewStartingPositionXConstraint:v36];

LABEL_21:
  uint64_t v37 = [(SLHighlightPillMarqueeView *)self replicatorViewEndingPositionXConstraint];
  if (!v37) {
    goto LABEL_23;
  }
  v38 = (void *)v37;
  objc_super v39 = [(SLHighlightPillMarqueeView *)self replicatorViewEndingPositionXConstraint];
  v40 = [v39 firstAnchor];

  if (v40 != v23)
  {
LABEL_23:
    v41 = [(SLHighlightPillMarqueeView *)self replicatorViewEndingPositionXConstraint];
    int v42 = [v41 isActive];

    if (v42)
    {
      v43 = [(SLHighlightPillMarqueeView *)self replicatorViewEndingPositionXConstraint];
      [v4 addObject:v43];
    }
    v44 = [(SLHighlightPillMarqueeView *)self pillView];
    v45 = [v44 trailingAnchor];
    v46 = [v23 constraintEqualToAnchor:v45 constant:40.0];
    [(SLHighlightPillMarqueeView *)self setReplicatorViewEndingPositionXConstraint:v46];
  }
  v47 = [(SLHighlightPillMarqueeView *)self replicatorViewYConstraint];

  if (!v47)
  {
    v48 = [(SLHighlightPillMarqueeView *)self replicatorView];
    v49 = [v48 topAnchor];
    v50 = [(SLHighlightPillMarqueeView *)self topAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    [(SLHighlightPillMarqueeView *)self setReplicatorViewYConstraint:v51];
  }
  if ([(SLHighlightPillMarqueeView *)self endingPositionConstraintsShouldBeActive])
  {
    v52 = [(SLHighlightPillMarqueeView *)self replicatorViewStartingPositionXConstraint];
    int v53 = [v52 isActive];

    if (v53)
    {
      v54 = [(SLHighlightPillMarqueeView *)self replicatorViewStartingPositionXConstraint];
      [v4 addObject:v54];
    }
    v55 = [(SLHighlightPillMarqueeView *)self replicatorViewEndingPositionXConstraint];
    char v56 = [v55 isActive];

    if ((v56 & 1) == 0)
    {
      uint64_t v57 = [(SLHighlightPillMarqueeView *)self replicatorViewEndingPositionXConstraint];
LABEL_37:
      v63 = (void *)v57;
      [v3 addObject:v57];
    }
  }
  else
  {
    v58 = [(SLHighlightPillMarqueeView *)self replicatorViewEndingPositionXConstraint];
    int v59 = [v58 isActive];

    if (v59)
    {
      v60 = [(SLHighlightPillMarqueeView *)self replicatorViewEndingPositionXConstraint];
      [v4 addObject:v60];
    }
    v61 = [(SLHighlightPillMarqueeView *)self replicatorViewEndingPositionXConstraint];
    char v62 = [v61 isActive];

    if ((v62 & 1) == 0)
    {
      uint64_t v57 = [(SLHighlightPillMarqueeView *)self replicatorViewStartingPositionXConstraint];
      goto LABEL_37;
    }
  }
  v64 = [(SLHighlightPillMarqueeView *)self replicatorViewYConstraint];
  char v65 = [v64 isActive];

  if ((v65 & 1) == 0)
  {
    v66 = [(SLHighlightPillMarqueeView *)self replicatorViewYConstraint];
    [v3 addObject:v66];
  }
  if ([v4 count])
  {
    v67 = (void *)MEMORY[0x1E4F28DC8];
    v68 = [v4 allObjects];
    [v67 deactivateConstraints:v68];
  }
  if ([v3 count])
  {
    v69 = (void *)MEMORY[0x1E4F28DC8];
    v70 = [v3 allObjects];
    [v69 activateConstraints:v70];
  }
}

- (void)_activateMarqueeAnimationIfNecessary
{
  if (![(SLHighlightPillMarqueeView *)self marqueeAnimationIsActive])
  {
    [(SLHighlightPillMarqueeView *)self setMarqueeAnimationIsActive:1];
    double v3 = [(SLHighlightPillMarqueeView *)self replicatorView];
    [v3 updateInstanceCount:2 replicationPaddingX:40.0];

    double v4 = [(SLHighlightPillMarqueeView *)self pillView];
    [v4 frame];
    double v6 = v5 / 45.0 + 2.0;

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__SLHighlightPillMarqueeView__activateMarqueeAnimationIfNecessary__block_invoke;
    v8[3] = &unk_1E58A86F8;
    v8[4] = self;
    *(double *)&v8[5] = v6;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__SLHighlightPillMarqueeView__activateMarqueeAnimationIfNecessary__block_invoke_4;
    v7[3] = &unk_1E58A8B00;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] animateKeyframesWithDuration:13 delay:v8 options:v7 animations:v6 completion:0.0];
  }
}

uint64_t __66__SLHighlightPillMarqueeView__activateMarqueeAnimationIfNecessary__block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__SLHighlightPillMarqueeView__activateMarqueeAnimationIfNecessary__block_invoke_2;
  v5[3] = &unk_1E58A8720;
  v5[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v5 relativeDuration:0.0 animations:0.0];
  double v2 = *(double *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__SLHighlightPillMarqueeView__activateMarqueeAnimationIfNecessary__block_invoke_3;
  v4[3] = &unk_1E58A8720;
  v4[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v4 relativeDuration:2.0 / v2 animations:1.0];
}

uint64_t __66__SLHighlightPillMarqueeView__activateMarqueeAnimationIfNecessary__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setEndingPositionConstraintsShouldBeActive:0];
  [*(id *)(a1 + 32) updateConstraints];
  double v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __66__SLHighlightPillMarqueeView__activateMarqueeAnimationIfNecessary__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEndingPositionConstraintsShouldBeActive:1];
}

uint64_t __66__SLHighlightPillMarqueeView__activateMarqueeAnimationIfNecessary__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setEndingPositionConstraintsShouldBeActive:0];
  double v2 = *(void **)(a1 + 32);
  return [v2 setMarqueeAnimationIsActive:0];
}

- (void)_deactivateMarqueeAnimationIfNecessary
{
  if ([(SLHighlightPillMarqueeView *)self marqueeAnimationIsActive])
  {
    [(SLHighlightPillMarqueeView *)self setMarqueeAnimationIsActive:0];
    double v3 = [(SLHighlightPillMarqueeView *)self layer];
    [v3 removeAllAnimations];

    [(SLHighlightPillMarqueeView *)self setEndingPositionConstraintsShouldBeActive:0];
  }
}

- (BOOL)marqueeEnabled
{
  return self->_marqueeEnabled;
}

- (double)marqueeClippingWidth
{
  return self->_marqueeClippingWidth;
}

- (int64_t)replicatedContentAlignment
{
  return self->_replicatedContentAlignment;
}

- (UIView)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
}

- (SLReplicatorView)replicatorView
{
  return self->_replicatorView;
}

- (void)setReplicatorView:(id)a3
{
}

- (BOOL)marqueeAnimationIsActive
{
  return self->_marqueeAnimationIsActive;
}

- (void)setMarqueeAnimationIsActive:(BOOL)a3
{
  self->_marqueeAnimationIsActive = a3;
}

- (BOOL)endingPositionConstraintsShouldBeActive
{
  return self->_endingPositionConstraintsShouldBeActive;
}

- (NSLayoutConstraint)ourWidthConstraint
{
  return self->_ourWidthConstraint;
}

- (void)setOurWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)ourHeightConstraint
{
  return self->_ourHeightConstraint;
}

- (void)setOurHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)replicatorViewStartingPositionXConstraint
{
  return self->_replicatorViewStartingPositionXConstraint;
}

- (void)setReplicatorViewStartingPositionXConstraint:(id)a3
{
}

- (NSLayoutConstraint)replicatorViewEndingPositionXConstraint
{
  return self->_replicatorViewEndingPositionXConstraint;
}

- (void)setReplicatorViewEndingPositionXConstraint:(id)a3
{
}

- (NSLayoutConstraint)replicatorViewYConstraint
{
  return self->_replicatorViewYConstraint;
}

- (void)setReplicatorViewYConstraint:(id)a3
{
}

- (CALayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_replicatorViewYConstraint, 0);
  objc_storeStrong((id *)&self->_replicatorViewEndingPositionXConstraint, 0);
  objc_storeStrong((id *)&self->_replicatorViewStartingPositionXConstraint, 0);
  objc_storeStrong((id *)&self->_ourHeightConstraint, 0);
  objc_storeStrong((id *)&self->_ourWidthConstraint, 0);
  objc_storeStrong((id *)&self->_replicatorView, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
}

@end