@interface VKTextLiftingView
- (BOOL)_hasFadedOut;
- (BOOL)_hasLifted;
- (BOOL)_presentedMenuForLiftedText;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)presentsMenuForLiftedText;
- (BOOL)presentsQuickActions;
- (CGAffineTransform)_imageTransformInBounds:(SEL)a3;
- (CGRect)_contentBounds;
- (UIBezierPath)_rotatedCutoutPath;
- (UIBezierPath)cutoutPath;
- (UIBezierPath)hitTestPath;
- (UIEdgeInsets)contentInsets;
- (UIImage)image;
- (UIImageView)_imageView;
- (UIView)actionInfoView;
- (UIVisualEffectView)_highlightView;
- (VKCImageAnalysisInteraction)imageInteraction;
- (VKTextLiftingView)initWithImage:(id)a3 cutoutPath:(id)a4;
- (VKTextLiftingView)initWithImage:(id)a3 cutoutPath:(id)a4 baselineAngle:(double)a5;
- (VKTextLiftingViewDelegate)delegate;
- (double)baselineAngle;
- (double)maxScale;
- (double)preferredQuickActionButtonHeight;
- (id)_gaussianBlurFilterWithRadius:(double)a3;
- (id)_springAnimationForKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5;
- (id)quickActionConfigurationUpdateHandler;
- (void)_applyConfigurationUpdateHandlerToQuickActions;
- (void)_applyInteractionToImageViewIfReady;
- (void)_hasFadedOut:(BOOL)a3;
- (void)_hasLifted:(BOOL)a3;
- (void)_setPresentedMenuForLiftedText:(BOOL)a3;
- (void)didMoveToSuperview;
- (void)fadeOutAndRemoveFromSuperview;
- (void)layoutSubviews;
- (void)performLiftAnimation;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setHitTestPath:(id)a3;
- (void)setImageInteraction:(id)a3;
- (void)setMaxScale:(double)a3;
- (void)setPreferredQuickActionButtonHeight:(double)a3;
- (void)setPresentsMenuForLiftedText:(BOOL)a3;
- (void)setPresentsQuickActions:(BOOL)a3;
- (void)setQuickActionConfigurationUpdateHandler:(id)a3;
@end

@implementation VKTextLiftingView

- (VKTextLiftingView)initWithImage:(id)a3 cutoutPath:(id)a4
{
  return [(VKTextLiftingView *)self initWithImage:a3 cutoutPath:a4 baselineAngle:0.0];
}

- (VKTextLiftingView)initWithImage:(id)a3 cutoutPath:(id)a4 baselineAngle:(double)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v32.receiver = self;
  v32.super_class = (Class)VKTextLiftingView;
  v11 = -[VKTextLiftingView initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_image, a3);
    objc_storeStrong((id *)&v12->_cutoutPath, a4);
    v12->_baselineAngle = a5;
    v13 = [(VKTextLiftingView *)v12 layer];
    objc_msgSend(v13, "setShadowOffset:", 0.0, 15.0);
    [v13 setShadowRadius:45.0];
    id v14 = [MEMORY[0x1E4F428B8] blackColor];
    objc_msgSend(v13, "setShadowColor:", objc_msgSend(v14, "CGColor"));

    v15 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4F43028]);
    highlightView = v12->__highlightView;
    v12->__highlightView = v15;

    [(UIVisualEffectView *)v12->__highlightView setUserInteractionEnabled:0];
    v17 = [(UIVisualEffectView *)v12->__highlightView layer];
    [v17 setAllowsHitTesting:0];

    v18 = [MEMORY[0x1E4F428C0] colorEffectBrightness:0.1];
    v33[0] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    [(UIVisualEffectView *)v12->__highlightView setBackgroundEffects:v19];

    v20 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIVisualEffectView *)v12->__highlightView setBackgroundColor:v20];

    [(UIVisualEffectView *)v12->__highlightView setAlpha:0.0];
    v21 = [MEMORY[0x1E4F39C88] layer];
    objc_msgSend(v21, "setPath:", -[UIBezierPath CGPath](v12->_cutoutPath, "CGPath"));
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v12->_image];
    imageView = v12->__imageView;
    v12->__imageView = (UIImageView *)v22;

    v24 = [(UIImageView *)v12->__imageView layer];
    [v24 setMask:v21];

    v25 = [(UIImageView *)v12->__imageView layer];
    [v25 setAllowsEdgeAntialiasing:1];

    [(UIImageView *)v12->__imageView setUserInteractionEnabled:1];
    [(UIImageView *)v12->__imageView addSubview:v12->__highlightView];
    [(UIImageView *)v12->__imageView bounds];
    -[UIVisualEffectView setFrame:](v12->__highlightView, "setFrame:");
    v12->_maxScale = 1.0;
    __asm { FMOV            V0.2D, #10.0 }
    *(_OWORD *)&v12->_contentInsets.top = _Q0;
    *(_OWORD *)&v12->_contentInsets.bottom = _Q0;
    v12->_presentsMenuForLiftedText = 1;
    v12->_presentsQuickActions = 0;
  }
  return v12;
}

- (void)didMoveToSuperview
{
  v7.receiver = self;
  v7.super_class = (Class)VKTextLiftingView;
  [(VKTextLiftingView *)&v7 didMoveToSuperview];
  v3 = [(VKTextLiftingView *)self imageInteraction];

  if (v3)
  {
    v4 = [(VKTextLiftingView *)self superview];

    if (v4)
    {
      [(VKTextLiftingView *)self _applyInteractionToImageViewIfReady];
    }
    else
    {
      v5 = [(VKTextLiftingView *)self _imageView];
      v6 = [(VKTextLiftingView *)self imageInteraction];
      [v5 removeInteraction:v6];
    }
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  -[UIImageView convertPoint:fromView:](self->__imageView, "convertPoint:fromView:", self);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = [(VKTextLiftingView *)self hitTestPath];
  v12 = (const CGPath *)[v11 CGPath];
  char v13 = [v11 usesEvenOddFillRule];
  v19.CGFloat x = v8;
  v19.CGFloat y = v10;
  BOOL v14 = CGPathContainsPoint(v12, 0, v19, v13);
  uint64_t v15 = [(VKTextLiftingView *)self actionInfoView];
  v16 = (void *)v15;
  if (v15)
  {
    [(id)v15 frame];
    v20.CGFloat x = x;
    v20.CGFloat y = y;
    LOBYTE(v15) = CGRectContainsPoint(v21, v20);
  }
  char v17 = v14 | v15;

  return v17;
}

- (void)layoutSubviews
{
  [(VKTextLiftingView *)self _contentBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = [(VKTextLiftingView *)self _imageView];
  objc_msgSend(v11, "setCenter:", VKMCenterOfRect(v4, v6, v8, v10));
  -[VKTextLiftingView _imageTransformInBounds:](self, "_imageTransformInBounds:", v4, v6, v8, v10);
  v12[0] = v12[3];
  v12[1] = v12[4];
  v12[2] = v12[5];
  [v11 setTransform:v12];
}

- (UIBezierPath)hitTestPath
{
  hitTestPath = self->_hitTestPath;
  if (!hitTestPath)
  {
    CGFloat v4 = [(VKTextLiftingView *)self cutoutPath];
    [v4 bounds];
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    double width = v22.size.width;
    double height = v22.size.height;
    CGRect v23 = CGRectInset(v22, -20.0, -20.0);
    memset(&v20, 0, sizeof(v20));
    CGAffineTransformMakeScale(&v20, v23.size.width / width, v23.size.height / height);
    memset(&v19, 0, sizeof(v19));
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.double width = width;
    v24.size.double height = height;
    CGFloat v9 = -CGRectGetMidX(v24);
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.double width = width;
    v25.size.double height = height;
    CGFloat MidY = CGRectGetMidY(v25);
    CGAffineTransformMakeTranslation(&v19, v9, -MidY);
    memset(&v18, 0, sizeof(v18));
    CGAffineTransform t1 = v19;
    CGAffineTransform t2 = v20;
    CGAffineTransformConcat(&v17, &t1, &t2);
    CGAffineTransform t1 = v19;
    CGAffineTransformInvert(&v14, &t1);
    CGAffineTransformConcat(&v18, &v17, &v14);
    id v11 = (UIBezierPath *)[v4 copy];
    CGAffineTransform t1 = v18;
    [(UIBezierPath *)v11 applyTransform:&t1];
    v12 = self->_hitTestPath;
    self->_hitTestPath = v11;

    hitTestPath = self->_hitTestPath;
  }
  return hitTestPath;
}

- (void)setImageInteraction:(id)a3
{
  double v5 = (VKCImageAnalysisInteraction *)a3;
  if (self->_imageInteraction != v5)
  {
    CGFloat v8 = v5;
    CGFloat v6 = [(VKTextLiftingView *)self _imageView];
    double v7 = v6;
    if (self->_imageInteraction) {
      objc_msgSend(v6, "removeInteraction:");
    }
    objc_storeStrong((id *)&self->_imageInteraction, a3);
    [(VKTextLiftingView *)self _applyInteractionToImageViewIfReady];

    double v5 = v8;
  }
}

- (UIView)actionInfoView
{
  v2 = [(VKTextLiftingView *)self imageInteraction];
  double v3 = [v2 actionInfoViewIfExists];

  return (UIView *)v3;
}

- (void)setPreferredQuickActionButtonHeight:(double)a3
{
  if (self->_preferredQuickActionButtonHeight != a3)
  {
    self->_preferredQuickActionButtonHeight = a3;
    id v4 = [(VKTextLiftingView *)self imageInteraction];
    [v4 setPreferredQuickActionButtonHeight:a3];
  }
}

- (void)setQuickActionConfigurationUpdateHandler:(id)a3
{
  if (self->_quickActionConfigurationUpdateHandler != a3)
  {
    id v4 = (void *)[a3 copy];
    id quickActionConfigurationUpdateHandler = self->_quickActionConfigurationUpdateHandler;
    self->_id quickActionConfigurationUpdateHandler = v4;

    [(VKTextLiftingView *)self _applyConfigurationUpdateHandlerToQuickActions];
  }
}

- (void)performLiftAnimation
{
  if (![(VKTextLiftingView *)self _hasLifted])
  {
    [(VKTextLiftingView *)self _hasLifted:1];
    [(VKTextLiftingView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    double v8 = v7;
    double v10 = v9;
    id v11 = [(VKTextLiftingView *)self image];
    [v11 size];
    double v13 = v12;
    double v15 = v14;

    v16 = [(VKTextLiftingView *)self _imageView];
    [(VKTextLiftingView *)self addSubview:v16];
    CGAffineTransformMakeScale(&v25, v8 / v13, v10 / v15);
    CGAffineTransform v24 = v25;
    [v16 setTransform:&v24];
    objc_msgSend(v16, "setCenter:", VKMCenterOfRect(v4, v6, v8, v10));
    [(VKTextLiftingView *)self setNeedsLayout];
    CGAffineTransform v17 = [NSNumber numberWithDouble:0.5];
    CGAffineTransform v18 = [(VKTextLiftingView *)self _springAnimationForKeyPath:@"shadowOpacity" fromValue:&unk_1F357DE60 toValue:v17];

    CGAffineTransform v19 = [(VKTextLiftingView *)self layer];
    [v19 addAnimation:v18 forKey:@"liftShadow"];

    CGAffineTransform v20 = [(VKTextLiftingView *)self layer];
    LODWORD(v21) = 0.5;
    [v20 setShadowOpacity:v21];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __41__VKTextLiftingView_performLiftAnimation__block_invoke;
    v23[3] = &unk_1E6BF0D18;
    v23[4] = self;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __41__VKTextLiftingView_performLiftAnimation__block_invoke_2;
    v22[3] = &unk_1E6BF3FB8;
    v22[4] = self;
    *(CGFloat *)&v22[5] = v4;
    *(CGFloat *)&v22[6] = v6;
    *(double *)&v22[7] = v8;
    *(double *)&v22[8] = v10;
    [MEMORY[0x1E4F42FF0] _animateUsingSpringWithDuration:0 delay:v23 options:v22 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
    [(VKTextLiftingView *)self _applyInteractionToImageViewIfReady];
  }
}

void __41__VKTextLiftingView_performLiftAnimation__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _highlightView];
  [v2 setAlpha:1.0];

  [*(id *)(a1 + 32) layoutIfNeeded];
  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 animateAlongsideTextLiftingForView:*(void *)(a1 + 32)];
}

void __41__VKTextLiftingView_performLiftAnimation__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 textLiftingAnimationDidEndForView:*(void *)(a1 + 32)];

  if (([*(id *)(a1 + 32) _hasFadedOut] & 1) == 0)
  {
    [MEMORY[0x1E4F39CF8] begin];
    id v3 = [*(id *)(a1 + 32) imageInteraction];
    CGFloat v4 = [v3 baseView];
    double v5 = [v4 textSelectionView];

    if ([*(id *)(a1 + 32) presentsMenuForLiftedText])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        [v6 setUseFullDocumentRangeForEmptySelection:1];
        [v6 becomeFirstResponder];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v24 = 0u;
        double v7 = *(void **)(a1 + 32);
        [v7 _contentBounds];
        if (v7)
        {
          objc_msgSend(v7, "_imageTransformInBounds:");
        }
        else
        {
          long long v25 = 0u;
          long long v26 = 0u;
          long long v24 = 0u;
        }
        double v8 = [*(id *)(a1 + 32) cutoutPath];
        double v9 = (void *)[v8 copy];

        v23[0] = v24;
        v23[1] = v25;
        v23[2] = v26;
        [v9 applyTransform:v23];
        [v9 bounds];
        double v14 = VKMCenterRectOverRect(v10, v11, v12, v13, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64));
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v21 = [MEMORY[0x1E4F42B88] sharedMenuController];
        objc_msgSend(v21, "showMenuFromView:rect:", *(void *)(a1 + 32), v14, v16, v18, v20);

        [*(id *)(a1 + 32) _setPresentedMenuForLiftedText:1];
      }
    }
    if ([*(id *)(a1 + 32) presentsQuickActions])
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __41__VKTextLiftingView_performLiftAnimation__block_invoke_3;
      v22[3] = &unk_1E6BF0D18;
      v22[4] = *(void *)(a1 + 32);
      [MEMORY[0x1E4F42FF0] animateWithDuration:v22 animations:0.2];
    }
    [MEMORY[0x1E4F39CF8] commit];
  }
}

void __41__VKTextLiftingView_performLiftAnimation__block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) actionInfoView];
  [v1 setAlpha:1.0];
}

- (void)fadeOutAndRemoveFromSuperview
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (![(VKTextLiftingView *)self _hasFadedOut])
  {
    [(VKTextLiftingView *)self _hasFadedOut:1];
    id v3 = [(VKTextLiftingView *)self imageInteraction];
    [v3 resetSelection];

    CGFloat v4 = [MEMORY[0x1E4F42B88] sharedMenuController];
    if ([(VKTextLiftingView *)self _presentedMenuForLiftedText])
    {
      if ([v4 isMenuVisible]) {
        [v4 hideMenu];
      }
    }
    double v5 = [(VKTextLiftingView *)self _gaussianBlurFilterWithRadius:0.0];
    v15[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    double v7 = [(VKTextLiftingView *)self layer];
    [v7 setFilters:v6];

    double v8 = NSString;
    double v9 = [v5 name];
    CGFloat v10 = [v8 stringWithFormat:@"filters.%@.inputRadius", v9];

    CGFloat v11 = [(VKTextLiftingView *)self _springAnimationForKeyPath:v10 fromValue:&unk_1F357DE60 toValue:&unk_1F357DE70];
    CGFloat v12 = [(VKTextLiftingView *)self layer];
    [v12 addAnimation:v11 forKey:@"dismissBlur"];

    [(VKTextLiftingView *)self setNeedsLayout];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__VKTextLiftingView_fadeOutAndRemoveFromSuperview__block_invoke;
    v14[3] = &unk_1E6BF0D18;
    v14[4] = self;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__VKTextLiftingView_fadeOutAndRemoveFromSuperview__block_invoke_2;
    v13[3] = &unk_1E6BF0DB8;
    v13[4] = self;
    [MEMORY[0x1E4F42FF0] _animateUsingSpringWithDuration:0 delay:v14 options:v13 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
  }
}

void __50__VKTextLiftingView_fadeOutAndRemoveFromSuperview__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _highlightView];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) _imageView];
  [v3 setAlpha:0.0];

  CGFloat v4 = [*(id *)(a1 + 32) actionInfoView];
  [v4 setAlpha:0.0];

  [*(id *)(a1 + 32) layoutIfNeeded];
  id v5 = [*(id *)(a1 + 32) delegate];
  [v5 animateAlongsideFadeOutForTextLiftingView:*(void *)(a1 + 32)];
}

void __50__VKTextLiftingView_fadeOutAndRemoveFromSuperview__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 fadeOutAnimationDidEndForView:*(void *)(a1 + 32)];
}

- (id)_gaussianBlurFilterWithRadius:(double)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F39BC0]);
  id v5 = (void *)[v4 initWithType:*MEMORY[0x1E4F3A0D0]];
  id v6 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v6 forKey:*MEMORY[0x1E4F1E4E0]];

  [v5 setName:@"gaussianBlur"];
  return v5;
}

- (id)_springAnimationForKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  double v7 = (void *)MEMORY[0x1E4F39C90];
  id v8 = a5;
  id v9 = a4;
  CGFloat v10 = [v7 animationWithKeyPath:a3];
  [v10 setMass:2.0];
  [v10 setStiffness:300.0];
  [v10 setDamping:50.0];
  [v10 setDuration:0.8];
  [v10 setFromValue:v9];

  [v10 setToValue:v8];
  return v10;
}

- (void)_applyInteractionToImageViewIfReady
{
  double v7 = [(VKTextLiftingView *)self imageInteraction];
  BOOL v3 = [(VKTextLiftingView *)self _hasLifted];
  id v4 = v7;
  if (v3 && v7)
  {
    if (self->_presentsQuickActions)
    {
      [v7 setActionInfoLiveTextButtonDisabled:1];
      [v7 setActionInfoViewHidden:0];
      [v7 setDeriveQuickActionsVisibilityFromState:0];
      [v7 setWantsTranslucentActionInfoButtons:0];
      [(VKTextLiftingView *)self preferredQuickActionButtonHeight];
      objc_msgSend(v7, "setPreferredQuickActionButtonHeight:");
    }
    id v5 = [(VKTextLiftingView *)self _imageView];
    [v5 addInteraction:v7];

    id v4 = v7;
    if (self->_presentsQuickActions)
    {
      id v6 = [v7 actionInfoViewIfExists];
      if (v6)
      {
        [(VKTextLiftingView *)self addSubview:v6];
        [(VKTextLiftingView *)self _applyConfigurationUpdateHandlerToQuickActions];
        [v6 edgeInsets];
        [v6 setEdgeInsets:0.0];
        [v6 setAutomaticVisualRectLayoutDisabled:1];
        [v6 setAlignQuickActionsWithVerticalCenter:1];
        [v6 setShouldAnimateQuickActionVisibilityChanges:1];
        [v6 setAlpha:0.0];
        objc_msgSend(v6, "set_quickActionsHidden:", 0);
      }

      id v4 = v7;
    }
  }
}

- (void)_applyConfigurationUpdateHandlerToQuickActions
{
  id v4 = [(VKTextLiftingView *)self quickActionConfigurationUpdateHandler];
  BOOL v3 = [(VKTextLiftingView *)self imageInteraction];
  [v3 setQuickActionConfigurationUpdateHandler:v4];
}

- (CGRect)_contentBounds
{
  [(VKTextLiftingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(VKTextLiftingView *)self contentInsets];
  double v12 = v6 + v11;
  double v15 = v8 - (v13 + v14);
  double v17 = v10 - (v11 + v16);
  double v18 = v4 + v13;
  double v19 = v12;
  double v20 = v15;
  result.size.double height = v17;
  result.size.double width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (UIBezierPath)_rotatedCutoutPath
{
  rotatedCutoutPath = self->__rotatedCutoutPath;
  if (!rotatedCutoutPath)
  {
    double v4 = [(VKTextLiftingView *)self cutoutPath];
    double v5 = (UIBezierPath *)[v4 copy];
    double v6 = self->__rotatedCutoutPath;
    self->__rotatedCutoutPath = v5;

    double v7 = self->__rotatedCutoutPath;
    [(VKTextLiftingView *)self baselineAngle];
    CGAffineTransformMakeRotation(&v10, -v8);
    [(UIBezierPath *)v7 applyTransform:&v10];
    rotatedCutoutPath = self->__rotatedCutoutPath;
  }
  return rotatedCutoutPath;
}

- (CGAffineTransform)_imageTransformInBounds:(SEL)a3
{
  double height = a4.size.height;
  double width = a4.size.width;
  double v8 = [(VKTextLiftingView *)self _rotatedCutoutPath];
  [(VKTextLiftingView *)self baselineAngle];
  CGFloat v10 = v9;
  [v8 bounds];
  double v12 = v11;
  double v14 = v13;
  [v8 bounds];
  double v19 = VKMCenterOfRect(v15, v16, v17, v18);
  long long v36 = v20;
  double v37 = v19;
  CGAffineTransformMakeRotation(&v45, v10);
  *(void *)&double v38 = *(_OWORD *)&vaddq_f64(*(float64x2_t *)&v45.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v45.c, *(double *)&v36), *(float64x2_t *)&v45.a, v37));
  [(VKTextLiftingView *)self maxScale];
  double v22 = fmin(v21, fmin(width / v12, height / v14));
  if ([(VKTextLiftingView *)self _hasFadedOut]) {
    double v22 = v22 * 1.5;
  }
  CGRect v23 = [(VKTextLiftingView *)self image];
  [v23 size];
  double v24 = VKMRectWithSize();
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;

  double v31 = VKMCenterOfRect(v24, v26, v28, v30);
  double v33 = VKMSubtractPoints(v31, v32, v38);
  memset(&v44, 0, sizeof(v44));
  CGAffineTransformMakeTranslation(&v44, v33, v34);
  memset(&v43, 0, sizeof(v43));
  CGAffineTransformMakeRotation(&v43, -v10);
  memset(&v42, 0, sizeof(v42));
  CGAffineTransformMakeScale(&v42, v22, v22);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransform t1 = v44;
  CGAffineTransform t2 = v43;
  CGAffineTransformConcat(&v41, &t1, &t2);
  CGAffineTransform t1 = v42;
  CGAffineTransformConcat(retstr, &v41, &t1);

  return result;
}

- (UIImage)image
{
  return self->_image;
}

- (UIBezierPath)cutoutPath
{
  return self->_cutoutPath;
}

- (double)baselineAngle
{
  return self->_baselineAngle;
}

- (void)setHitTestPath:(id)a3
{
}

- (double)maxScale
{
  return self->_maxScale;
}

- (void)setMaxScale:(double)a3
{
  self->_maxScale = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (VKCImageAnalysisInteraction)imageInteraction
{
  return self->_imageInteraction;
}

- (BOOL)presentsMenuForLiftedText
{
  return self->_presentsMenuForLiftedText;
}

- (void)setPresentsMenuForLiftedText:(BOOL)a3
{
  self->_presentsMenuForLiftedText = a3;
}

- (BOOL)presentsQuickActions
{
  return self->_presentsQuickActions;
}

- (void)setPresentsQuickActions:(BOOL)a3
{
  self->_presentsQuickActions = a3;
}

- (double)preferredQuickActionButtonHeight
{
  return self->_preferredQuickActionButtonHeight;
}

- (id)quickActionConfigurationUpdateHandler
{
  return self->_quickActionConfigurationUpdateHandler;
}

- (VKTextLiftingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKTextLiftingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (UIVisualEffectView)_highlightView
{
  return self->__highlightView;
}

- (BOOL)_hasLifted
{
  return self->__hasLifted;
}

- (void)_hasLifted:(BOOL)a3
{
  self->__hasLifted = a3;
}

- (BOOL)_hasFadedOut
{
  return self->__hasFadedOut;
}

- (void)_hasFadedOut:(BOOL)a3
{
  self->__hasFadedOut = a3;
}

- (BOOL)_presentedMenuForLiftedText
{
  return self->__presentedMenuForLiftedText;
}

- (void)_setPresentedMenuForLiftedText:(BOOL)a3
{
  self->__presentedMenuForLiftedText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__highlightView, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_quickActionConfigurationUpdateHandler, 0);
  objc_storeStrong((id *)&self->_imageInteraction, 0);
  objc_storeStrong((id *)&self->_hitTestPath, 0);
  objc_storeStrong((id *)&self->_cutoutPath, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->__rotatedCutoutPath, 0);
}

@end