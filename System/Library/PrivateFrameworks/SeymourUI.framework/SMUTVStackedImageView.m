@interface SMUTVStackedImageView
- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4;
- (BOOL)allowsNonOpaqueShadow;
- (BOOL)flatImageContainsCornerRadius;
- (BOOL)isOverlayComposited;
- (BOOL)isPressed;
- (BOOL)isSelected;
- (CGPoint)focusDirection;
- (CGSize)_scaledSize;
- (NSShadow)shadow;
- (SMUTVStackedImageView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIImage)placeholderImage;
- (UILayoutGuide)focusLayoutGuide;
- (UIView)overlayView;
- (UIView)unmaskedOverlayView;
- (double)cornerRadius;
- (double)focusSizeIncrease;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (int64_t)state;
- (unint64_t)controlState;
- (unint64_t)primaryControlState;
- (void)_attachMotionEffects;
- (void)_commitLayerStack:(id)a3;
- (void)_detachMotionEffects;
- (void)_loadImage;
- (void)_updateFocusLayoutGuideForControlState:(unint64_t)a3;
- (void)_updateLayerStack:(id)a3 withImage:(CGImage *)a4 size:(CGSize)a5;
- (void)_updateMotionEffectsForState:(unint64_t)a3;
- (void)_updateStackedImageConfiguration;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAllowsNonOpaqueShadow:(BOOL)a3;
- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4;
- (void)setCornerRadius:(double)a3;
- (void)setFlatImageContainsCornerRadius:(BOOL)a3;
- (void)setFocusDirection:(CGPoint)a3;
- (void)setFocusDirection:(CGPoint)a3 animated:(BOOL)a4;
- (void)setFocusSizeIncrease:(double)a3;
- (void)setImage:(id)a3;
- (void)setOverlayComposited:(BOOL)a3;
- (void)setOverlayView:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPressed:(BOOL)a3;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5;
- (void)setShadow:(id)a3;
- (void)setUnmaskedOverlayView:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation SMUTVStackedImageView

- (SMUTVStackedImageView)initWithFrame:(CGRect)a3
{
  v33[4] = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)SMUTVStackedImageView;
  v3 = -[SMUTVStackedImageView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_state = 0;
    v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F82908]);
    focusLayoutGuide = v4->_focusLayoutGuide;
    v4->_focusLayoutGuide = v5;

    v7 = [(UILayoutGuide *)v4->_focusLayoutGuide widthAnchor];
    v8 = [(SMUTVStackedImageView *)v4 widthAnchor];
    uint64_t v9 = [v7 constraintEqualToAnchor:v8 constant:0.0];
    widthConstraint = v4->_widthConstraint;
    v4->_widthConstraint = (NSLayoutConstraint *)v9;

    v11 = [(UILayoutGuide *)v4->_focusLayoutGuide heightAnchor];
    v12 = [(SMUTVStackedImageView *)v4 heightAnchor];
    uint64_t v13 = [v11 constraintEqualToAnchor:v12 constant:0.0];
    heightConstraint = v4->_heightConstraint;
    v4->_heightConstraint = (NSLayoutConstraint *)v13;

    [(SMUTVStackedImageView *)v4 addLayoutGuide:v4->_focusLayoutGuide];
    v15 = (void *)MEMORY[0x263F08938];
    v33[0] = v4->_widthConstraint;
    v33[1] = v4->_heightConstraint;
    v16 = [(UILayoutGuide *)v4->_focusLayoutGuide centerYAnchor];
    v17 = [(SMUTVStackedImageView *)v4 centerYAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v33[2] = v18;
    v19 = [(UILayoutGuide *)v4->_focusLayoutGuide centerXAnchor];
    v20 = [(SMUTVStackedImageView *)v4 centerXAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v33[3] = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
    [v15 activateConstraints:v22];

    v23 = (_UIStackedImageContainerLayer *)objc_alloc_init(MEMORY[0x263F830F8]);
    imageStackLayer = v4->_imageStackLayer;
    v4->_imageStackLayer = v23;

    [(_UIStackedImageContainerLayer *)v4->_imageStackLayer _setSelectionStyle:0];
    v25 = [(SMUTVStackedImageView *)v4 layer];
    [v25 addSublayer:v4->_imageStackLayer];

    [(SMUTVStackedImageView *)v4 setUserInteractionEnabled:0];
    v26 = [(SMUTVStackedImageView *)v4 layer];
    [v26 setAllowsGroupOpacity:0];

    v27 = [MEMORY[0x263F825C8] clearColor];
    v31.receiver = v4;
    v31.super_class = (Class)SMUTVStackedImageView;
    [(SMUTVStackedImageView *)&v31 setBackgroundColor:v27];

    [(SMUTVStackedImageView *)v4 _updateStackedImageConfiguration];
    v28 = [MEMORY[0x263F08A00] defaultCenter];
    [v28 addObserver:v4 selector:sel__updateStackedImageConfiguration name:*MEMORY[0x263F831F0] object:0];

    v29 = [MEMORY[0x263F08A00] defaultCenter];
    [v29 addObserver:v4 selector:sel__updateStackedImageConfiguration name:*MEMORY[0x263F8B200] object:0];
  }
  return v4;
}

- (void)dealloc
{
  [(_UIStackedImageContainerLayer *)self->_imageStackLayer setLayerStack:0];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SMUTVStackedImageView;
  [(SMUTVStackedImageView *)&v4 dealloc];
}

- (UIImage)image
{
  return self->_staticImage;
}

- (void)setImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_staticImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_staticImage, a3);
    self->_state = 0;
    [(SMUTVStackedImageView *)self _loadImage];
    v5 = v6;
  }
}

- (UIImage)placeholderImage
{
  return (UIImage *)[(_UIStackedImageConfiguration *)self->_imageStackConfig placeholderImage];
}

- (void)setPlaceholderImage:(id)a3
{
}

- (unint64_t)primaryControlState
{
  imageStackLayer = self->_imageStackLayer;
  uint64_t v3 = [(_UIStackedImageContainerLayer *)imageStackLayer controlState];

  return [(_UIStackedImageContainerLayer *)imageStackLayer _primaryControlStateForState:v3];
}

- (void)setShadow:(id)a3
{
  id v5 = a3;
  p_shadow = &self->_shadow;
  if (([(NSShadow *)self->_shadow isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_shadow, a3);
    v7 = *p_shadow;
    if (*p_shadow)
    {
      double v13 = 0.0;
      v8 = [(NSShadow *)v7 shadowColor];
      [v8 getRed:0 green:0 blue:0 alpha:&v13];

      [(_UIStackedImageConfiguration *)self->_imageStackConfig setDefaultFocusedShadowOpacity:v13];
      [(_UIStackedImageConfiguration *)self->_imageStackConfig setDefaultHighlightedShadowOpacity:v13];
      [(_UIStackedImageConfiguration *)self->_imageStackConfig setDefaultUnfocusedShadowOpacity:v13];
      [v5 shadowBlurRadius];
      double v10 = v9;
      -[_UIStackedImageConfiguration setDefaultFocusedShadowRadius:](self->_imageStackConfig, "setDefaultFocusedShadowRadius:");
      [(_UIStackedImageConfiguration *)self->_imageStackConfig setDefaultHighlightedShadowRadius:v10];
      [(_UIStackedImageConfiguration *)self->_imageStackConfig setDefaultUnfocusedShadowRadius:v10];
      [v5 shadowOffset];
      double v12 = v11;
      [(_UIStackedImageConfiguration *)self->_imageStackConfig setDefaultFocusedShadowVerticalOffset:v11];
      [(_UIStackedImageConfiguration *)self->_imageStackConfig setDefaultHighlightedShadowVerticalOffset:v12];
      [(_UIStackedImageConfiguration *)self->_imageStackConfig setDefaultUnfocusedShadowVerticalOffset:v12];
    }
    else
    {
      [(_UIStackedImageConfiguration *)self->_imageStackConfig resetShadowSettings];
    }
  }
}

- (BOOL)allowsNonOpaqueShadow
{
  return [(_UIStackedImageConfiguration *)self->_imageStackConfig allowsNonOpaqueShadow];
}

- (void)setAllowsNonOpaqueShadow:(BOOL)a3
{
}

- (double)cornerRadius
{
  [(_UIStackedImageConfiguration *)self->_imageStackConfig cornerRadius];
  return result;
}

- (void)setCornerRadius:(double)a3
{
}

- (BOOL)flatImageContainsCornerRadius
{
  return [(_UIStackedImageConfiguration *)self->_imageStackConfig flatImageContainsCornerRadius];
}

- (void)setFlatImageContainsCornerRadius:(BOOL)a3
{
}

- (double)focusSizeIncrease
{
  [(_UIStackedImageConfiguration *)self->_imageStackConfig scaleSizeIncrease];
  return result;
}

- (void)setFocusSizeIncrease:(double)a3
{
}

- (void)setOverlayComposited:(BOOL)a3
{
  self->_overlayComposited = a3;
  imageStackConfig = self->_imageStackConfig;
  double v4 = 1.0;
  if (a3) {
    double v4 = 0.0;
  }
  [(_UIStackedImageConfiguration *)imageStackConfig setOverlayDepth:v4];
}

- (void)setOverlayView:(id)a3
{
  v7 = (UIView *)a3;
  if (self->_overlayView != v7)
  {
    objc_storeStrong((id *)&self->_overlayView, a3);
    imageStackLayer = self->_imageStackLayer;
    v6 = [(UIView *)v7 layer];
    [(_UIStackedImageContainerLayer *)imageStackLayer _setOverlayLayer:v6];
  }
}

- (void)setUnmaskedOverlayView:(id)a3
{
  v7 = (UIView *)a3;
  if (self->_unmaskedOverlayView != v7)
  {
    objc_storeStrong((id *)&self->_unmaskedOverlayView, a3);
    imageStackLayer = self->_imageStackLayer;
    v6 = [(UIView *)v7 layer];
    [(_UIStackedImageContainerLayer *)imageStackLayer _setUnmaskedOverlayLayer:v6];
  }
}

- (void)_updateFocusLayoutGuideForControlState:(unint64_t)a3
{
  char v3 = a3;
  [(SMUTVStackedImageView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  [(SMUTVStackedImageView *)self _scaledSize];
  double v11 = v10 - v6;
  if ((v3 & 8) == 0) {
    double v11 = 0.0;
  }
  double v12 = v9 - v8;
  if ((v3 & 8) != 0) {
    double v13 = v12;
  }
  else {
    double v13 = 0.0;
  }
  [(NSLayoutConstraint *)self->_widthConstraint setConstant:v11];
  heightConstraint = self->_heightConstraint;

  [(NSLayoutConstraint *)heightConstraint setConstant:v13];
}

- (unint64_t)controlState
{
  return [(_UIStackedImageContainerLayer *)self->_imageStackLayer controlState];
}

- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4
{
  [(_UIStackedImageContainerLayer *)self->_imageStackLayer setControlState:a3 animated:a4];

  [(SMUTVStackedImageView *)self _updateMotionEffectsForState:a3];
}

- (void)setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a4;
  [(_UIStackedImageContainerLayer *)self->_imageStackLayer setControlState:a3 animated:v6 != 0 focusAnimationCoordinator:v6];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__SMUTVStackedImageView_setControlState_withAnimationCoordinator___block_invoke;
  v9[3] = &unk_264DBD080;
  v9[4] = self;
  v9[5] = a3;
  double v7 = _Block_copy(v9);
  double v8 = v7;
  if (v6) {
    [v6 addCoordinatedAnimations:v7 completion:0];
  }
  else {
    (*((void (**)(void *))v7 + 2))(v7);
  }
  [(SMUTVStackedImageView *)self _updateMotionEffectsForState:a3];
}

uint64_t __66__SMUTVStackedImageView_setControlState_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFocusLayoutGuideForControlState:*(void *)(a1 + 40)];
}

- (void)_updateMotionEffectsForState:(unint64_t)a3
{
  if ((a3 & 8) != 0) {
    [(SMUTVStackedImageView *)self _attachMotionEffects];
  }
  else {
    [(SMUTVStackedImageView *)self _detachMotionEffects];
  }
}

- (CGPoint)focusDirection
{
  [(_UIStackedImageContainerLayer *)self->_imageStackLayer focusDirection];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setFocusDirection:(CGPoint)a3
{
}

- (void)setFocusDirection:(CGPoint)a3 animated:(BOOL)a4
{
}

- (BOOL)isSelected
{
  return [(_UIStackedImageContainerLayer *)self->_imageStackLayer isSelected];
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5
{
}

- (BOOL)isPressed
{
  return [(_UIStackedImageContainerLayer *)self->_imageStackLayer isPressed];
}

- (void)setPressed:(BOOL)a3
{
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)willMoveToWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SMUTVStackedImageView;
  [(SMUTVStackedImageView *)&v4 willMoveToWindow:a3];
  [(SMUTVStackedImageView *)self _loadImage];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SMUTVStackedImageView;
  [(SMUTVStackedImageView *)&v4 layoutSubviews];
  imageStackLayer = self->_imageStackLayer;
  [(SMUTVStackedImageView *)self bounds];
  -[_UIStackedImageContainerLayer setFrame:](imageStackLayer, "setFrame:");
  [(SMUTVStackedImageView *)self _loadImage];
}

- (CGSize)_scaledSize
{
  double v3 = (void *)MEMORY[0x263F157E8];
  [(SMUTVStackedImageView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  [(SMUTVStackedImageView *)self focusSizeIncrease];
  double v9 = v8;
  uint64_t v10 = [(_UIStackedImageContainerLayer *)self->_imageStackLayer _selectionStyle];

  objc_msgSend(v3, "smu_scaledSizeForSize:focusSizeIncrease:selectionStyle:", v10, v5, v7, v9);
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)_loadImage
{
  if (![(SMUTVStackedImageView *)self state])
  {
    self->_state = 1;
    char v3 = objc_msgSend(MEMORY[0x263F827B0], "smu_canDecodeOnRenderThread");
    [(SMUTVStackedImageView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v8 = (_SMUTVStackedImageNamedLayerStack *)objc_opt_new();
    uiLayerStack = self->_uiLayerStack;
    self->_uiLayerStack = v8;

    uint64_t v10 = [MEMORY[0x263F08C38] UUID];
    double v11 = [v10 UUIDString];
    [(_SMUTVStackedImageNamedLayerStack *)self->_uiLayerStack setName:v11];

    -[_SMUTVStackedImageNamedLayerStack setSize:](self->_uiLayerStack, "setSize:", *(double *)&v5, *(double *)&v7);
    [(_SMUTVStackedImageNamedLayerStack *)self->_uiLayerStack setScale:1.0];
    [(_SMUTVStackedImageNamedLayerStack *)self->_uiLayerStack setFlattenedImage:0];
    [(_SMUTVStackedImageNamedLayerStack *)self->_uiLayerStack setLayers:MEMORY[0x263EFFA68]];
    [(_SMUTVStackedImageNamedLayerStack *)self->_uiLayerStack setRadiosityImage:0];
    -[_SMUTVStackedImageNamedLayerStack setRadiosityImageScale:](self->_uiLayerStack, "setRadiosityImageScale:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    [(_SMUTVStackedImageNamedLayerStack *)self->_uiLayerStack setFlatImageContainsCornerRadius:0];
    [(_UIStackedImageContainerLayer *)self->_imageStackLayer setLayerStack:self->_uiLayerStack];
    if (self->_staticImage)
    {
      objc_initWeak(&location, self);
      double v12 = (void *)[(_SMUTVStackedImageNamedLayerStack *)self->_uiLayerStack copy];
      double v13 = self->_staticImage;
      [(SMUTVStackedImageView *)self _scaledSize];
      double v15 = v14;
      double v17 = v16;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __35__SMUTVStackedImageView__loadImage__block_invoke;
      aBlock[3] = &unk_264DBD0A8;
      objc_copyWeak(v35, &location);
      v18 = v13;
      v33 = v18;
      id v19 = v12;
      id v34 = v19;
      v35[1] = v5;
      v35[2] = v7;
      v20 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
      uint64_t v21 = 0;
      if ((v3 & 1) == 0)
      {
        [(_UIStackedImageConfiguration *)self->_imageStackConfig cornerRadius];
        uint64_t v21 = v22;
      }
      [(UIImage *)self->_staticImage size];
      if (v15 == v24 && v17 == v23)
      {
        v20[2](v20, (uint64_t)[(UIImage *)v18 CGImage]);
      }
      else
      {
        v25 = dispatch_get_global_queue(21, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __35__SMUTVStackedImageView__loadImage__block_invoke_2;
        block[3] = &unk_264DBD0F8;
        double v29 = v15;
        double v30 = v17;
        v27 = v18;
        uint64_t v31 = v21;
        v28 = v20;
        dispatch_async(v25, block);
      }
      objc_destroyWeak(v35);

      objc_destroyWeak(&location);
    }
    else
    {
      self->_state = 2;
    }
  }
}

void __35__SMUTVStackedImageView__loadImage__block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    double v7 = WeakRetained;
    uint64_t v5 = [WeakRetained[51] CGImage];
    BOOL v6 = v5 == [*(id *)(a1 + 32) CGImage];
    WeakRetained = v7;
    if (v6)
    {
      objc_msgSend(v7, "_updateLayerStack:withImage:size:", *(void *)(a1 + 40), a2, *(double *)(a1 + 56), *(double *)(a1 + 64));
      [v7 _commitLayerStack:*(void *)(a1 + 40)];
      WeakRetained = v7;
      v7[65] = (id)2;
    }
  }
}

void __35__SMUTVStackedImageView__loadImage__block_invoke_2(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  double v2 = (void *)MEMORY[0x263F827E8];
  v10[0] = *(void *)(a1 + 32);
  char v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  double v4 = objc_msgSend(v2, "compositedImageWithSize:images:cornerRadius:blendMode:legacyMode:", v3, 0, 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__SMUTVStackedImageView__loadImage__block_invoke_3;
  v7[3] = &unk_264DBD0D0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __35__SMUTVStackedImageView__loadImage__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) CGImage];
  char v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

- (void)_updateLayerStack:(id)a3 withImage:(CGImage *)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  v15[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  [v8 setFlattenedImage:a4];
  double v9 = (double)CGImageGetWidth(a4);
  double v10 = (double)CGImageGetHeight(a4);
  if (v9 / v10 != width / height)
  {
    double v11 = fmin(width / v9, height / v10);
    double width = floor(v11 * v9);
    double height = floor(v11 * v10);
    objc_msgSend(v8, "setSize:", width, height);
  }
  if (!a4) {
    goto LABEL_6;
  }
  double v12 = objc_opt_new();
  double v13 = [MEMORY[0x263F827E8] imageWithCGImage:a4];
  [v12 setImageObj:v13];

  [v12 setImage:a4];
  [v12 setName:@"0"];
  [v12 setOpacity:1.0];
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, width, height);
  if (v12)
  {
    v15[0] = v12;
    double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    [v8 setLayers:v14];
  }
  else
  {
LABEL_6:
    [v8 setLayers:MEMORY[0x263EFFA68]];
  }
}

- (void)_commitLayerStack:(id)a3
{
  double v4 = (_SMUTVStackedImageNamedLayerStack *)a3;
  uint64_t v5 = [MEMORY[0x263F158F8] disableActions];
  [MEMORY[0x263F158F8] setDisableActions:1];
  uiLayerStack = self->_uiLayerStack;
  self->_uiLayerStack = v4;
  double v7 = v4;

  [(_UIStackedImageContainerLayer *)self->_imageStackLayer setLayerStack:self->_uiLayerStack];
  [MEMORY[0x263F158F8] setDisableActions:v5];
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  return (id)[(_UIStackedImageConfiguration *)self->_imageStackConfig focusAnimationConfiguration];
}

- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKey:@"focusDirectionX"];
  [v6 doubleValue];
  double v8 = v7;
  double v9 = [v5 objectForKey:@"focusDirectionY"];

  [v9 doubleValue];
  double v11 = v10;

  -[SMUTVStackedImageView setFocusDirection:](self, "setFocusDirection:", v8, v11);
  return 1;
}

- (void)_attachMotionEffects
{
  void v10[2] = *MEMORY[0x263EF8340];
  motionEffectGroup = self->_motionEffectGroup;
  if (!motionEffectGroup)
  {
    double v4 = (void *)[objc_alloc(MEMORY[0x263F82860]) initWithKeyPath:@"focusDirectionX" type:0];
    [v4 setMinimumRelativeValue:&unk_26EE05EF0];
    [v4 setMaximumRelativeValue:&unk_26EE05F00];
    id v5 = (void *)[objc_alloc(MEMORY[0x263F82860]) initWithKeyPath:@"focusDirectionY" type:1];
    [v5 setMinimumRelativeValue:&unk_26EE05EF0];
    [v5 setMaximumRelativeValue:&unk_26EE05F00];
    id v6 = (UIMotionEffectGroup *)objc_alloc_init(MEMORY[0x263F82980]);
    double v7 = self->_motionEffectGroup;
    self->_motionEffectGroup = v6;

    double v8 = self->_motionEffectGroup;
    v10[0] = v4;
    v10[1] = v5;
    double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    [(UIMotionEffectGroup *)v8 setMotionEffects:v9];

    motionEffectGroup = self->_motionEffectGroup;
  }
  [(SMUTVStackedImageView *)self addMotionEffect:motionEffectGroup];
}

- (void)_detachMotionEffects
{
}

- (void)_updateStackedImageConfiguration
{
  if (!self->_imageStackConfig)
  {
    objc_msgSend(MEMORY[0x263F830F0], "smu_newImageConfiguration");
    char v3 = (_UIStackedImageConfiguration *)objc_claimAutoreleasedReturnValue();
    imageStackConfig = self->_imageStackConfig;
    self->_imageStackConfig = v3;

    [(_UIStackedImageConfiguration *)self->_imageStackConfig layerSelectionDuration];
    self->_layerSelectionDuration = v5;
    [(_UIStackedImageConfiguration *)self->_imageStackConfig layerUnselectionDuration];
    self->_layerUnselectionDuration = v6;
    [(_UIStackedImageConfiguration *)self->_imageStackConfig shadowSelectionDuration];
    self->_shadowSelectionDuration = v7;
    [(_UIStackedImageConfiguration *)self->_imageStackConfig shadowUnselectionDuration];
    self->_shadowUnselectionDuration = v8;
    [(_UIStackedImageConfiguration *)self->_imageStackConfig repositionUnselectionDuration];
    self->_double repositionUnselectionDuration = v9;
  }
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    double repositionUnselectionDuration = 0.0;
    [(_UIStackedImageConfiguration *)self->_imageStackConfig setLayerSelectionDuration:0.0];
    [(_UIStackedImageConfiguration *)self->_imageStackConfig setLayerUnselectionDuration:0.0];
    [(_UIStackedImageConfiguration *)self->_imageStackConfig setShadowSelectionDuration:0.0];
    [(_UIStackedImageConfiguration *)self->_imageStackConfig setShadowUnselectionDuration:0.0];
  }
  else
  {
    [(_UIStackedImageConfiguration *)self->_imageStackConfig setLayerSelectionDuration:self->_layerSelectionDuration];
    [(_UIStackedImageConfiguration *)self->_imageStackConfig setLayerUnselectionDuration:self->_layerUnselectionDuration];
    [(_UIStackedImageConfiguration *)self->_imageStackConfig setShadowSelectionDuration:self->_shadowSelectionDuration];
    [(_UIStackedImageConfiguration *)self->_imageStackConfig setShadowUnselectionDuration:self->_shadowUnselectionDuration];
    double repositionUnselectionDuration = self->_repositionUnselectionDuration;
  }
  [(_UIStackedImageConfiguration *)self->_imageStackConfig setRepositionUnselectionDuration:repositionUnselectionDuration];
  if (_AXSHighContrastFocusIndicatorsEnabled()) {
    [(_UIStackedImageConfiguration *)self->_imageStackConfig setFocusCursorEnabled:1];
  }
  imageStackLayer = self->_imageStackLayer;
  double v12 = self->_imageStackConfig;

  [(_UIStackedImageContainerLayer *)imageStackLayer setConfiguration:v12];
}

- (UILayoutGuide)focusLayoutGuide
{
  return self->_focusLayoutGuide;
}

- (int64_t)state
{
  return self->_state;
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (BOOL)isOverlayComposited
{
  return self->_overlayComposited;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (UIView)unmaskedOverlayView
{
  return self->_unmaskedOverlayView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmaskedOverlayView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_focusLayoutGuide, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_motionEffectGroup, 0);
  objc_storeStrong((id *)&self->_uiLayerStack, 0);
  objc_storeStrong((id *)&self->_imageStackConfig, 0);
  objc_storeStrong((id *)&self->_imageStackLayer, 0);

  objc_storeStrong((id *)&self->_staticImage, 0);
}

@end