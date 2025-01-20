@interface _UIStackedImageContainerView
+ (Class)layerClass;
- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4;
- (BOOL)installsMotionEffectsWhenFocused;
- (BOOL)isPressed;
- (BOOL)isStackFocused;
- (CGPoint)focusDirection;
- (UIImage)stackImage;
- (UINamedLayerStack)constructedStackImage;
- (UIView)overlayView;
- (_UIStackedImageConfiguration)config;
- (_UIStackedImageContainerView)initWithFrame:(CGRect)a3;
- (id)_focusedFrameGuide;
- (id)_focusedFrameGuideCreateIfNecessary:(BOOL)a3;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (void)_installMotionEffects;
- (void)_setStackFocused:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5;
- (void)_uninstallMotionEffects;
- (void)_updateContainerLayerImages;
- (void)_updateFocusedFrameGuideConstraintsIfApplicable;
- (void)_updateOverlayLayer;
- (void)dealloc;
- (void)setBounds:(CGRect)a3;
- (void)setConfig:(id)a3;
- (void)setConstructedStackImage:(id)a3;
- (void)setFocusDirection:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setInstallsMotionEffectsWhenFocused:(BOOL)a3;
- (void)setOverlayView:(id)a3;
- (void)setPressed:(BOOL)a3;
- (void)setStackFocused:(BOOL)a3;
- (void)setStackFocused:(BOOL)a3 withFocusAnimationCoordinator:(id)a4;
- (void)setStackImage:(id)a3;
@end

@implementation _UIStackedImageContainerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UIStackedImageContainerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStackedImageContainerView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = +[_UIStackedImageConfiguration newStandardConfiguration];
    [(_UIStackedImageContainerView *)v3 setConfig:v4];
    v3->_installsMotionEffectsWhenFocused = 1;
  }
  return v3;
}

- (void)dealloc
{
  v3 = [(_UIStackedImageContainerView *)self _imageContainerLayer];
  [v3 setLayerStack:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIStackedImageContainerView;
  [(UIView *)&v4 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIStackedImageContainerView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UIStackedImageContainerView *)self _updateFocusedFrameGuideConstraintsIfApplicable];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIStackedImageContainerView;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UIStackedImageContainerView *)self _updateFocusedFrameGuideConstraintsIfApplicable];
}

- (void)_updateContainerLayerImages
{
  v3 = [(UIImage *)self->_stackImage _primitiveImageAsset];
  objc_super v4 = [v3 _layerStack];
  constructedStackImage = v4;
  if (!v4) {
    constructedStackImage = self->_constructedStackImage;
  }
  v10 = constructedStackImage;

  if (!v10)
  {
    if (self->_stackImage)
    {
      objc_super v6 = objc_alloc_init(_UIStackedImageSingleNamedLayerImage);
      [(_UIStackedImageSingleNamedLayerImage *)v6 setImageObj:self->_stackImage];
      v10 = objc_alloc_init(_UIStackedImageSingleNamedStack);
      [(_UIStackedImageSingleNamedStack *)v10 setLayerImage:v6];
    }
    else
    {
      v10 = 0;
    }
  }
  v7 = [(_UIStackedImageContainerView *)self _imageContainerLayer];
  v8 = [(_UIStackedImageContainerView *)self config];
  [v7 setConfiguration:v8];

  v9 = [(_UIStackedImageContainerView *)self _imageContainerLayer];
  [v9 setLayerStack:v10];
}

- (void)setConfig:(id)a3
{
  id v5 = a3;
  if (!-[_UIStackedImageConfiguration isEqual:](self->_config, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_config, a3);
    [(_UIStackedImageContainerView *)self _updateContainerLayerImages];
    [(_UIStackedImageContainerView *)self _updateFocusedFrameGuideConstraintsIfApplicable];
  }
}

- (void)setStackImage:(id)a3
{
  id v5 = a3;
  if (!-[UIImage isEqual:](self->_stackImage, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_stackImage, a3);
    [(_UIStackedImageContainerView *)self _updateContainerLayerImages];
  }
}

- (void)setConstructedStackImage:(id)a3
{
  id v5 = (UINamedLayerStack *)a3;
  if (self->_constructedStackImage != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_constructedStackImage, a3);
    [(_UIStackedImageContainerView *)self _updateContainerLayerImages];
    id v5 = v6;
  }
}

- (BOOL)isStackFocused
{
  v2 = [(_UIStackedImageContainerView *)self _imageContainerLayer];
  int v3 = [v2 controlState];

  return (*(void *)&v3 & 0x10008) != 0;
}

- (void)setStackFocused:(BOOL)a3
{
}

- (void)setStackFocused:(BOOL)a3 withFocusAnimationCoordinator:(id)a4
{
}

- (void)_setStackFocused:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  v9 = [(_UIStackedImageContainerView *)self _imageContainerLayer];
  uint64_t v10 = [v9 controlState];

  if (v6)
  {
    unint64_t v11 = v10 | 8;
    [(_UIStackedImageContainerView *)self _installMotionEffects];
  }
  else
  {
    unint64_t v11 = v10 & 0xFFFFFFFFFFFFFFF7;
    [(_UIStackedImageContainerView *)self _uninstallMotionEffects];
  }
  id v12 = [(_UIStackedImageContainerView *)self _imageContainerLayer];
  [v12 setControlState:v11 animated:v5 focusAnimationCoordinator:v8];
}

- (BOOL)isPressed
{
  v2 = [(_UIStackedImageContainerView *)self _imageContainerLayer];
  char v3 = [v2 controlState];

  return v3 & 1;
}

- (void)setPressed:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_UIStackedImageContainerView *)self _imageContainerLayer];
  uint64_t v6 = [v5 controlState];

  id v7 = [(_UIStackedImageContainerView *)self _imageContainerLayer];
  [v7 setControlState:v6 & 0xFFFFFFFFFFFFFFFELL | v3 animated:1];
}

- (CGPoint)focusDirection
{
  v2 = [(_UIStackedImageContainerView *)self _imageContainerLayer];
  [v2 focusDirection];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setFocusDirection:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(_UIStackedImageContainerView *)self installsMotionEffectsWhenFocused]
    && setFocusDirection__once != -1)
  {
    dispatch_once(&setFocusDirection__once, &__block_literal_global_667);
  }
  id v6 = [(_UIStackedImageContainerView *)self _imageContainerLayer];
  objc_msgSend(v6, "setFocusDirection:animated:", 1, x, y);
}

- (void)setInstallsMotionEffectsWhenFocused:(BOOL)a3
{
  if (self->_installsMotionEffectsWhenFocused != a3)
  {
    self->_installsMotionEffectsWhenFocused = a3;
    if (a3)
    {
      if ([(_UIStackedImageContainerView *)self isStackFocused])
      {
        [(_UIStackedImageContainerView *)self _installMotionEffects];
      }
    }
    else
    {
      [(_UIStackedImageContainerView *)self _uninstallMotionEffects];
    }
  }
}

- (void)_installMotionEffects
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (!self->_stackMotionEffects)
  {
    if ([(_UIStackedImageContainerView *)self installsMotionEffectsWhenFocused])
    {
      double v3 = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"focusDirectionX" type:0];
      [(UIInterpolatingMotionEffect *)v3 setMinimumRelativeValue:&unk_1ED3F2968];
      [(UIInterpolatingMotionEffect *)v3 setMaximumRelativeValue:&unk_1ED3F2978];
      double v4 = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"focusDirectionY" type:1];
      [(UIInterpolatingMotionEffect *)v4 setMinimumRelativeValue:&unk_1ED3F2968];
      [(UIInterpolatingMotionEffect *)v4 setMaximumRelativeValue:&unk_1ED3F2978];
      double v5 = objc_alloc_init(UIMotionEffectGroup);
      stackMotionEffects = self->_stackMotionEffects;
      self->_stackMotionEffects = v5;

      double v7 = self->_stackMotionEffects;
      v9[0] = v3;
      v9[1] = v4;
      double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
      [(UIMotionEffectGroup *)v7 setMotionEffects:v8];

      [(UIView *)self addMotionEffect:self->_stackMotionEffects];
    }
  }
}

- (void)_updateOverlayLayer
{
  BOOL v3 = [(UIView *)self->_overlayView clipsToBounds];
  double v4 = [(_UIStackedImageContainerView *)self _imageContainerLayer];
  double v5 = v4;
  if (v3)
  {
    [v4 _setUnmaskedOverlayLayer:0];

    id v7 = [(_UIStackedImageContainerView *)self _imageContainerLayer];
    id v6 = [(UIView *)self->_overlayView layer];
    [v7 _setOverlayLayer:v6];
  }
  else
  {
    [v4 _setOverlayLayer:0];

    id v7 = [(_UIStackedImageContainerView *)self _imageContainerLayer];
    id v6 = [(UIView *)self->_overlayView layer];
    [v7 _setUnmaskedOverlayLayer:v6];
  }
}

- (void)setOverlayView:(id)a3
{
  double v5 = (UIView *)a3;
  p_overlayView = &self->_overlayView;
  if (self->_overlayView != v5)
  {
    id v7 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIView *)*p_overlayView setOverlayViewDelegate:0];
    }
    objc_storeStrong((id *)&self->_overlayView, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIView *)*p_overlayView setOverlayViewDelegate:self];
    }
    [(_UIStackedImageContainerView *)self _updateOverlayLayer];
    double v5 = v7;
  }
}

- (void)_uninstallMotionEffects
{
  if (self->_stackMotionEffects)
  {
    -[UIView removeMotionEffect:](self, "removeMotionEffect:");
    stackMotionEffects = self->_stackMotionEffects;
    self->_stackMotionEffects = 0;
  }
}

- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKey:@"focusDirectionX"];
  [v6 doubleValue];
  double v8 = v7;
  v9 = [v5 objectForKey:@"focusDirectionY"];

  [v9 doubleValue];
  double v11 = v10;

  id v12 = [(_UIStackedImageContainerView *)self _imageContainerLayer];
  objc_msgSend(v12, "setFocusDirection:animated:", 1, v8, v11);

  return 1;
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  double v4 = [(_UIStackedImageContainerView *)self config];
  id v5 = [v4 focusAnimationConfiguration];

  return v5;
}

- (id)_focusedFrameGuide
{
  return [(_UIStackedImageContainerView *)self _focusedFrameGuideCreateIfNecessary:1];
}

- (id)_focusedFrameGuideCreateIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  v15[4] = *MEMORY[0x1E4F143B8];
  objc_getAssociatedObject(self, &_focusedFrameGuideCreateIfNecessary__focusedFrameGuideKey_0);
  id v5 = (UILayoutGuide *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6)
  {
    id v5 = objc_alloc_init(UILayoutGuide);
    objc_setAssociatedObject(self, &_focusedFrameGuideCreateIfNecessary__focusedFrameGuideKey_0, v5, (void *)1);
    [(UIView *)self addLayoutGuide:v5];
    [(UILayoutGuide *)v5 _setLockedToOwningView:1];
    [(UILayoutGuide *)v5 setIdentifier:@"_UIStackedImageContainerViewFocusedFrameGuide"];
    double v7 = [MEMORY[0x1E4F5B268] constraintWithItem:v5 attribute:3 relatedBy:0 toItem:self attribute:3];
    double v8 = [MEMORY[0x1E4F5B268] constraintWithItem:v5 attribute:1 relatedBy:0 toItem:self attribute:1];
    v9 = [MEMORY[0x1E4F5B268] constraintWithItem:self attribute:4 relatedBy:0 toItem:v5 attribute:4];
    double v10 = [MEMORY[0x1E4F5B268] constraintWithItem:self attribute:2 relatedBy:0 toItem:v5 attribute:2];
    [v7 setIdentifier:@"focusedFrameGuide-topConstraint"];
    [v8 setIdentifier:@"focusedFrameGuide-leftConstraint"];
    [v9 setIdentifier:@"focusedFrameGuide-bottomConstraint"];
    [v10 setIdentifier:@"focusedFrameGuide-rightConstraint"];
    v15[0] = v7;
    v15[1] = v8;
    v15[2] = v9;
    v15[3] = v10;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
    [(UILayoutGuide *)v5 _setSystemConstraints:v11];

    [(_UIStackedImageContainerView *)self _updateFocusedFrameGuideConstraintsIfApplicable];
    id v12 = (void *)MEMORY[0x1E4F5B268];
    v13 = [(UILayoutGuide *)v5 _systemConstraints];
    [v12 activateConstraints:v13];
  }
  return v5;
}

- (void)_updateFocusedFrameGuideConstraintsIfApplicable
{
  BOOL v3 = [(_UIStackedImageContainerView *)self _focusedFrameGuideCreateIfNecessary:0];
  if (v3)
  {
    id v32 = v3;
    double v4 = [(_UIStackedImageContainerView *)self config];
    [v4 scaleSizeIncrease];
    double v6 = v5;

    [(UIView *)self bounds];
    double v9 = 0.0;
    if (v7 <= 0.0)
    {
      double v10 = 0.0;
      double v11 = v32;
    }
    else
    {
      double v10 = 0.0;
      double v11 = v32;
      if (v8 > 0.0)
      {
        BOOL v12 = v7 <= v8;
        double v13 = v6 * -0.5 * (v7 / v8);
        double v14 = v6 * -0.5 * (v8 / v7);
        if (v12) {
          double v9 = v13;
        }
        else {
          double v9 = v6 * -0.5;
        }
        if (v12) {
          double v10 = v6 * -0.5;
        }
        else {
          double v10 = v14;
        }
      }
    }
    v15 = [v11 _systemConstraints];
    v16 = [v15 objectAtIndexedSubscript:0];
    [v16 constant];
    double v18 = v17;

    if (v18 != v10)
    {
      v19 = [v15 objectAtIndexedSubscript:0];
      [v19 setConstant:v10];
    }
    v20 = [v15 objectAtIndexedSubscript:1];
    [v20 constant];
    double v22 = v21;

    if (v22 != v9)
    {
      v23 = [v15 objectAtIndexedSubscript:1];
      [v23 setConstant:v9];
    }
    v24 = [v15 objectAtIndexedSubscript:2];
    [v24 constant];
    double v26 = v25;

    if (v26 != v10)
    {
      v27 = [v15 objectAtIndexedSubscript:2];
      [v27 setConstant:v10];
    }
    v28 = [v15 objectAtIndexedSubscript:3];
    [v28 constant];
    double v30 = v29;

    if (v30 != v9)
    {
      v31 = [v15 objectAtIndexedSubscript:3];
      [v31 setConstant:v9];
    }
    BOOL v3 = v32;
  }
}

- (UIImage)stackImage
{
  return self->_stackImage;
}

- (UINamedLayerStack)constructedStackImage
{
  return self->_constructedStackImage;
}

- (_UIStackedImageConfiguration)config
{
  return self->_config;
}

- (BOOL)installsMotionEffectsWhenFocused
{
  return self->_installsMotionEffectsWhenFocused;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_constructedStackImage, 0);
  objc_storeStrong((id *)&self->_stackImage, 0);
  objc_storeStrong((id *)&self->_stackMotionEffects, 0);
}

@end