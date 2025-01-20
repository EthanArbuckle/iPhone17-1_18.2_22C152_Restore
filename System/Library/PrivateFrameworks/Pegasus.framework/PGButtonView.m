@interface PGButtonView
+ (Class)layerClass;
+ (UIColor)disabledTintColor;
+ (id)buttonWithDelegate:(id)a3;
- (BOOL)_shouldHitTest;
- (BOOL)isCircular;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSString)systemImageName;
- (NSString)text;
- (PGButtonViewDelegate)delegate;
- (UIColor)enabledTintColor;
- (UIFont)font;
- (UIImage)image;
- (UIPointerInteraction)pointerInteraction;
- (UIViewPropertyAnimator)highlightAnimator;
- (_PGButton)actualButton;
- (double)glyphSize;
- (id)accessibilityIdentifier;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_handleDragEnter:(id)a3;
- (void)_handleDragExit:(id)a3;
- (void)_handleTouchDown:(id)a3;
- (void)_handleTouchUpInside:(id)a3;
- (void)_handleTouchUpOrCancel:(id)a3;
- (void)_updateForCircularAppearanceIfNeeded;
- (void)_updateGlyphConfigurationIfNeeded;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setActualButton:(id)a3;
- (void)setCircular:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setGlyphSize:(double)a3;
- (void)setHighlightAnimator:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setSystemImageName:(id)a3;
- (void)setText:(id)a3;
- (void)sizeToFit;
@end

@implementation PGButtonView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (UIColor)disabledTintColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] quaternaryLabelColor];
}

+ (id)buttonWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = (id *)objc_alloc_init((Class)a1);
  uint64_t v6 = +[_PGButton buttonWithType:0];
  id v7 = v5[63];
  v5[63] = (id)v6;

  [v5[63] setAdjustsImageWhenHighlighted:0];
  [v5[63] setButtonView:v5];
  v8 = [v5 contentView];
  [v8 addSubview:v5[63]];

  objc_storeWeak(v5 + 59, v4);
  [v5[63] addTarget:v5 action:sel__handleTouchUpInside_ forControlEvents:64];
  [v5[63] addTarget:v5 action:sel__handleTouchDown_ forControlEvents:1];
  [v5[63] addTarget:v5 action:sel__handleDragEnter_ forControlEvents:16];
  [v5[63] addTarget:v5 action:sel__handleDragExit_ forControlEvents:32];
  [v5[63] addTarget:v5 action:sel__handleTouchUpOrCancel_ forControlEvents:448];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, 44.0, 44.0);
  [v5 setEnabled:1];
  v9 = [v5 actualButton];
  v10 = [v5 actualButton];
  [v10 contentEdgeInsets];
  objc_msgSend(v4, "buttonView:contentEdgeInsetsForProposedInsets:", v5);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  objc_msgSend(v9, "setContentEdgeInsets:", v12, v14, v16, v18);
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:v5];
  [v5 setPointerInteraction:v19];
  [v5 addInteraction:v19];

  return v5;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_preventAutoHideOfControlsAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PGButtonView;
  [(PGButtonView *)&v3 dealloc];
}

- (id)accessibilityIdentifier
{
  return (id)[(_PGButton *)self->_actualButton accessibilityIdentifier];
}

- (void)setAccessibilityIdentifier:(id)a3
{
  id v6 = a3;
  id v4 = [(_PGButton *)self->_actualButton accessibilityIdentifier];
  char v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0) {
    [(_PGButton *)self->_actualButton setAccessibilityIdentifier:v6];
  }
}

- (NSString)text
{
  v2 = [(PGButtonView *)self actualButton];
  objc_super v3 = [v2 titleForState:0];

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v13 = a3;
  id v4 = [(PGButtonView *)self text];
  if (v4 == v13)
  {
  }
  else
  {
    char v5 = [(PGButtonView *)self text];
    char v6 = [v5 isEqualToString:v13];

    if ((v6 & 1) == 0)
    {
      id v7 = [(PGButtonView *)self actualButton];
      [v7 setTitle:v13 forState:0];

      v8 = [(PGButtonView *)self actualButton];
      v9 = [(PGButtonView *)self delegate];
      v10 = [(PGButtonView *)self actualButton];
      [v10 contentEdgeInsets];
      objc_msgSend(v9, "buttonView:contentEdgeInsetsForProposedInsets:", self);
      objc_msgSend(v8, "setContentEdgeInsets:");

      double v11 = [(PGButtonView *)self actualButton];
      double v12 = [v11 titleLabel];
      [v12 setLineBreakMode:4];

      [(PGButtonView *)self _updateGlyphConfigurationIfNeeded];
    }
  }
}

- (UIFont)font
{
  v2 = [(PGButtonView *)self actualButton];
  objc_super v3 = [v2 titleLabel];
  id v4 = [v3 font];

  return (UIFont *)v4;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  id v6 = [(PGButtonView *)self actualButton];
  char v5 = [v6 titleLabel];
  [v5 setFont:v4];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PGButtonView;
  [(PGMaterialView *)&v4 layoutSubviews];
  actualButton = self->_actualButton;
  [(PGButtonView *)self bounds];
  -[_PGButton setFrame:](actualButton, "setFrame:");
  [(PGButtonView *)self _updateForCircularAppearanceIfNeeded];
}

- (BOOL)_shouldHitTest
{
  if ([(PGButtonView *)self isHidden]) {
    return 0;
  }
  uint64_t v4 = [(PGButtonView *)self alpha];

  return MEMORY[0x1F410C340](v4);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(PGButtonView *)self _shouldHitTest])
  {
    actualButton = self->_actualButton;
    -[PGButtonView convertPoint:toView:](self, "convertPoint:toView:", actualButton, x, y);
    v9 = -[_PGButton hitTest:withEvent:](actualButton, "hitTest:withEvent:", v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(PGButtonView *)self _shouldHitTest])
  {
    actualButton = self->_actualButton;
    -[PGButtonView convertPoint:toView:](self, "convertPoint:toView:", actualButton, x, y);
    char v9 = -[_PGButton pointInside:withEvent:](actualButton, "pointInside:withEvent:", v7);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)sizeToFit
{
  objc_super v3 = [(PGButtonView *)self actualButton];
  [v3 sizeToFit];

  [(PGButtonView *)self frame];
  double v5 = v4;
  double v7 = v6;
  v8 = [(PGButtonView *)self actualButton];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;

  -[PGButtonView setFrame:](self, "setFrame:", v5, v7, v10, v12);
}

- (BOOL)isEnabled
{
  return [(_PGButton *)self->_actualButton isEnabled];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[_PGButton setEnabled:](self->_actualButton, "setEnabled:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pointerInteraction);
  [WeakRetained setEnabled:v3];
}

- (void)setImage:(id)a3
{
  double v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_image, a3);
    p_image = (UIImage **)[(PGButtonView *)self _updateGlyphConfigurationIfNeeded];
    double v5 = v7;
  }

  MEMORY[0x1F41817F8](p_image, v5);
}

- (void)setSystemImageName:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_systemImageName, "isEqualToString:"))
  {
    double v4 = (NSString *)[v6 copy];
    systemImageName = self->_systemImageName;
    self->_systemImageName = v4;

    [(PGButtonView *)self _updateGlyphConfigurationIfNeeded];
  }
}

- (void)setGlyphSize:(double)a3
{
  if (self->_glyphSize != a3)
  {
    self->_glyphSize = a3;
    [(PGButtonView *)self _updateGlyphConfigurationIfNeeded];
  }
}

- (void)setCircular:(BOOL)a3
{
  if (self->_circular != a3)
  {
    self->_circular = a3;
    [(PGButtonView *)self _updateForCircularAppearanceIfNeeded];
  }
}

- (UIColor)enabledTintColor
{
  if ([(PGMaterialView *)self isBackdropHidden]) {
    [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  else {
  v2 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  }

  return (UIColor *)v2;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PGButtonView;
  [(PGButtonView *)&v3 didMoveToWindow];
  [(PGButtonView *)self _updateGlyphConfigurationIfNeeded];
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self];
  if ([(PGMaterialView *)self isBackdropHidden]
    && ([(PGMaterialView *)self backgroundColor],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    double v7 = (id *)0x1E4F42C90;
  }
  else
  {
    double v7 = (id *)0x1E4F42CA8;
  }
  v8 = [*v7 effectWithPreview:v5];
  double v9 = [MEMORY[0x1E4F42CC0] styleWithEffect:v8 shape:0];

  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
}

- (void)_updateGlyphConfigurationIfNeeded
{
  objc_super v3 = [(PGButtonView *)self window];

  if (v3)
  {
    [(PGButtonView *)self glyphSize];
    UIRoundToViewScale();
    double v5 = v4;
    double currentGlyphSize = self->_currentGlyphSize;
    currentGlyphImageName = self->_currentGlyphImageName;
    v8 = [(PGButtonView *)self systemImageName];
    BOOL v9 = [(NSString *)currentGlyphImageName isEqualToString:v8];

    BOOL v10 = currentGlyphSize != v5 || !v9;
    if (v10 || self->_image != self->_currentCustomImage)
    {
      double v12 = [(PGButtonView *)self systemImageName];
      id v13 = (NSString *)[v12 copy];
      double v14 = self->_currentGlyphImageName;
      self->_currentGlyphImageName = v13;

      self->_double currentGlyphSize = v5;
      double v15 = self->_image;
      if (self->_image)
      {
        double v16 = v15;
        currentCustomImage = self->_currentCustomImage;
        id v20 = v16;
        self->_currentCustomImage = v16;
      }
      else
      {
        id v20 = v15;
        if (!self->_currentGlyphImageName)
        {
LABEL_15:
          [(_PGButton *)self->_actualButton setImage:v20 forState:0];
          [(PGButtonView *)self _updateForCircularAppearanceIfNeeded];

          return;
        }
        currentCustomImage = [MEMORY[0x1E4F42A30] systemFontOfSize:v5 weight:*MEMORY[0x1E4F43920]];
        double v18 = [MEMORY[0x1E4F42A98] configurationWithFont:currentCustomImage];
        uint64_t v19 = [MEMORY[0x1E4F42A80] systemImageNamed:self->_currentGlyphImageName withConfiguration:v18];

        id v20 = (id)v19;
      }

      goto LABEL_15;
    }
  }
}

- (void)_updateForCircularAppearanceIfNeeded
{
  if (self->_circular)
  {
    [(PGButtonView *)self bounds];
    CGFloat x = v12.origin.x;
    CGFloat y = v12.origin.y;
    CGFloat width = v12.size.width;
    CGFloat height = v12.size.height;
    double v7 = CGRectGetWidth(v12);
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.CGFloat width = width;
    v13.size.CGFloat height = height;
    double v8 = CGRectGetHeight(v13);
    if (v7 < v8) {
      double v8 = v7;
    }
    double v9 = v8 * 0.5;
    [(PGMaterialView *)self _cornerRadius];
    if (v10 != v9)
    {
      [(PGMaterialView *)self _setCornerRadius:v9];
    }
  }
}

- (void)_handleTouchDown:(id)a3
{
  id v7 = a3;
  [(PGButtonView *)self setHighlighted:1];
  if (!self->_preventAutoHideOfControlsAssertion)
  {
    double v4 = [v7 accessibilityIdentifier];
    double v5 = [(UIView *)self PG_acquireAssertionToPreventAutoHideOfControlsWithReason:v4];
    preventAutoHideOfControlsAssertion = self->_preventAutoHideOfControlsAssertion;
    self->_preventAutoHideOfControlsAssertion = v5;
  }
}

- (void)_handleTouchUpOrCancel:(id)a3
{
  [(BSInvalidatable *)self->_preventAutoHideOfControlsAssertion invalidate];
  preventAutoHideOfControlsAssertion = self->_preventAutoHideOfControlsAssertion;
  self->_preventAutoHideOfControlsAssertion = 0;

  [(PGButtonView *)self setHighlighted:0];
}

- (void)_handleTouchUpInside:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained buttonViewDidReceiveTouchUpInside:self];

  [(PGButtonView *)self setHighlighted:0];
}

- (void)_handleDragEnter:(id)a3
{
}

- (void)_handleDragExit:(id)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  if ([(PGButtonView *)self isHighlighted] != a3)
  {
    self->_highlighted = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_highlightAnimator);
    if ([WeakRetained isRunning])
    {
      if ([WeakRetained isInterruptible])
      {
        [WeakRetained stopAnimation:0];
        [WeakRetained finishAnimationAtPosition:2];
      }
    }
    uint64_t v10 = 0;
    double v11 = &v10;
    uint64_t v12 = 0x3032000000;
    CGRect v13 = __Block_byref_object_copy__4;
    double v14 = __Block_byref_object_dispose__4;
    id v6 = objc_alloc(MEMORY[0x1E4F43008]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __31__PGButtonView_setHighlighted___block_invoke;
    v9[3] = &unk_1E610C280;
    v9[4] = self;
    id v15 = (id)[v6 initWithDuration:0 curve:v9 animations:0.2];
    objc_storeWeak((id *)&self->_highlightAnimator, (id)v11[5]);
    id v7 = (void *)v11[5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __31__PGButtonView_setHighlighted___block_invoke_2;
    v8[3] = &unk_1E610DB70;
    v8[4] = &v10;
    [v7 addCompletion:v8];
    [(id)v11[5] startAnimation];
    _Block_object_dispose(&v10, 8);
  }
}

uint64_t __31__PGButtonView_setHighlighted___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isHighlighted];
  objc_super v3 = *(void **)(a1 + 32);
  if (v2)
  {
    CGAffineTransformMakeScale(&v10, 0.85, 0.85);
    double v4 = &v10;
  }
  else
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v7 = *MEMORY[0x1E4F1DAB8];
    long long v8 = v5;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v4 = (CGAffineTransform *)&v7;
  }
  return objc_msgSend(v3, "setTransform:", v4, v7, v8, v9);
}

void __31__PGButtonView_setHighlighted___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  int v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (PGButtonViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PGButtonViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isCircular
{
  return self->_circular;
}

- (double)glyphSize
{
  return self->_glyphSize;
}

- (_PGButton)actualButton
{
  return self->_actualButton;
}

- (void)setActualButton:(id)a3
{
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UIViewPropertyAnimator)highlightAnimator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_highlightAnimator);

  return (UIViewPropertyAnimator *)WeakRetained;
}

- (void)setHighlightAnimator:(id)a3
{
}

- (UIPointerInteraction)pointerInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pointerInteraction);

  return (UIPointerInteraction *)WeakRetained;
}

- (void)setPointerInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pointerInteraction);
  objc_destroyWeak((id *)&self->_highlightAnimator);
  objc_storeStrong((id *)&self->_actualButton, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preventAutoHideOfControlsAssertion, 0);
  objc_storeStrong((id *)&self->_currentCustomImage, 0);

  objc_storeStrong((id *)&self->_currentGlyphImageName, 0);
}

@end