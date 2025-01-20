@interface VUIStackedImageView
+ (CGSize)_scaledSizeForSize:(CGSize)a3 focusSizeIncrease:(double)a4 selectionStyle:(int64_t)a5;
+ (CGSize)_scaledSizeForSize:(CGSize)a3 selectionStyle:(int64_t)a4;
+ (Class)layerClass;
- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4;
- (BOOL)allowsNonOpaqueShadow;
- (BOOL)isImageLoaded;
- (BOOL)isOverlayComposited;
- (BOOL)isPressed;
- (BOOL)isSelected;
- (CGPoint)focusDirection;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)stackSize;
- (NSShadow)shadow;
- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3;
- (UIImage)image;
- (UIImage)placeholderImage;
- (UIView)overlayView;
- (UIView)unmaskedOverlayView;
- (VUIImageProxy)imageProxy;
- (VUIStackedImageView)initWithImage:(id)a3 size:(CGSize)a4;
- (VUIStackedImageView)initWithImageProxy:(id)a3;
- (double)_idleModeFocusSizeOffset;
- (double)cornerRadius;
- (double)focusSizeIncrease;
- (id)_imageConfiguration;
- (id)_layerBelowTitles;
- (id)_layeredImageContainerLayer;
- (id)_newImageConfiguration;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (int64_t)selectionStyle;
- (unint64_t)controlState;
- (unint64_t)primaryControlState;
- (void)_attachMotionEffects;
- (void)_commitLayerStack:(id)a3;
- (void)_detachMotionEffects;
- (void)_loadImage;
- (void)_resetShadowSettings;
- (void)_setFocusDirection:(CGPoint)a3 duration:(double)a4;
- (void)_setShadowOpacity:(double)a3;
- (void)_setShadowRadius:(double)a3;
- (void)_setShadowVerticalOffset:(double)a3;
- (void)_updateImageSamplingOverlays;
- (void)_updateLayerStack:(id)a3 withImage:(CGImage *)a4 size:(CGSize)a5;
- (void)_updateStackedImageConfiguration;
- (void)animateWithAuxiliarySelectionState:(BOOL)a3 animations:(id)a4;
- (void)dealloc;
- (void)setAllowsNonOpaqueShadow:(BOOL)a3;
- (void)setControlState:(unint64_t)a3;
- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5;
- (void)setCornerRadius:(double)a3;
- (void)setFocusDirection:(CGPoint)a3;
- (void)setFocusDirection:(CGPoint)a3 animated:(BOOL)a4;
- (void)setFocusSizeIncrease:(double)a3;
- (void)setFocused:(BOOL)a3;
- (void)setImage:(id)a3 withSize:(CGSize)a4;
- (void)setImageLoaded:(BOOL)a3;
- (void)setImageProxy:(id)a3;
- (void)setOverlayComposited:(BOOL)a3;
- (void)setOverlayView:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPressed:(BOOL)a3;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setPressed:(BOOL)a3 duration:(double)a4 completion:(id)a5;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)setSelectionStyle:(int64_t)a3;
- (void)setShadow:(id)a3;
- (void)setStackSize:(CGSize)a3;
- (void)setUnmaskedOverlayView:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation VUIStackedImageView

- (VUIStackedImageView)initWithImageProxy:(id)a3
{
  id v5 = a3;
  [v5 expectedSize];
  v6 = -[VUIStackedImageView initWithImage:size:](self, "initWithImage:size:", 0);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_imageProxy, a3);
  }

  return v7;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (VUIStackedImageView)initWithImage:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v16.receiver = self;
  v16.super_class = (Class)VUIStackedImageView;
  v8 = -[VUIStackedImageView initWithFrame:](&v16, sel_initWithFrame_, a3, v6, v7, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_stackSize.double width = width;
    v8->_stackSize.double height = height;
    [(VUIStackedImageView *)v8 setUserInteractionEnabled:0];
    v10 = [(VUIStackedImageView *)v9 layer];
    [v10 setAllowsGroupOpacity:0];

    uint64_t v11 = [(VUIStackedImageView *)v9 layer];
    imageStackLayer = v9->_imageStackLayer;
    v9->_imageStackLayer = (_UIStackedImageContainerLayer *)v11;

    [(VUIStackedImageView *)v9 _updateStackedImageConfiguration];
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v9 selector:sel__updateStackedImageConfiguration name:*MEMORY[0x1E4F43478] object:0];

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v9 selector:sel__updateStackedImageConfiguration name:*MEMORY[0x1E4FB91B0] object:0];
  }
  return v9;
}

- (void)dealloc
{
  [(_UIStackedImageContainerLayer *)self->_imageStackLayer setLayerStack:0];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIStackedImageView;
  [(VUIStackedImageView *)&v4 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = self->_stackSize.width;
  if (width <= 0.0 || (double height = self->_stackSize.height, height <= 0.0))
  {
    v9.receiver = self;
    v9.super_class = (Class)VUIStackedImageView;
    -[VUIStackedImageView sizeThatFits:](&v9, sel_sizeThatFits_, a3.width, a3.height);
    double width = v5;
    double height = v6;
  }
  double v7 = width;
  double v8 = height;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUIStackedImageView;
  -[VUIStackedImageView willMoveToWindow:](&v6, sel_willMoveToWindow_);
  BOOL v5 = [(VUIStackedImageView *)self isImageLoaded];
  if (a3)
  {
    if (!v5) {
      [(VUIStackedImageView *)self _loadImage];
    }
  }
  else if (!v5)
  {
    [(VUIImageProxy *)self->_imageProxy cancel];
  }
}

- (void)setImageProxy:(id)a3
{
  p_imageProxy = &self->_imageProxy;
  v10 = (VUIImageProxy *)a3;
  if (*p_imageProxy != v10)
  {
    uint64_t v6 = [(VUIStackedImageView *)self window];
    if (v6)
    {
      double v7 = (void *)v6;
      BOOL v8 = [(VUIStackedImageView *)self effectiveUserInterfaceLayoutDirection] == 1;
    }
    else
    {
      BOOL v8 = 0;
    }
    [(VUIImageProxy *)v10 setImageDirection:v8];
    if (![(VUIImageProxy *)v10 isEqual:*p_imageProxy])
    {
      if (![(VUIStackedImageView *)self isImageLoaded]) {
        [(VUIImageProxy *)*p_imageProxy cancel];
      }
      [(VUIStackedImageView *)self setImageLoaded:0];
      objc_storeStrong((id *)&self->_imageProxy, a3);
      objc_super v9 = [(VUIStackedImageView *)self window];

      if (v9) {
        [(VUIStackedImageView *)self _loadImage];
      }
    }
  }
}

- (UIImage)image
{
  return self->_staticImage;
}

- (void)setImage:(id)a3 withSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  objc_storeStrong((id *)&self->_staticImage, a3);
  self->_stackSize.CGFloat width = width;
  self->_stackSize.CGFloat height = height;
  [(VUIStackedImageView *)self setImageProxy:0];
  [(VUIStackedImageView *)self setImageLoaded:0];
  double v7 = [(VUIStackedImageView *)self window];

  if (v7)
  {
    [(VUIStackedImageView *)self _loadImage];
  }
}

- (UIImage)placeholderImage
{
  return (UIImage *)[(_UIStackedImageConfiguration *)self->_imageStackConfig placeholderImage];
}

- (void)setPlaceholderImage:(id)a3
{
  id v11 = a3;
  id v4 = [(VUIStackedImageView *)self placeholderImage];

  id v6 = v11;
  if (v4 != v11)
  {
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v11;
      }
      else
      {
        BOOL v8 = [MEMORY[0x1E4F42D90] mainScreen];
        objc_super v9 = [v8 traitCollection];
        uint64_t v10 = +[VUICoreUtilities defaultPlaceholderImageForUserInterfaceStyle:](VUICoreUtilities, "defaultPlaceholderImageForUserInterfaceStyle:", [v9 userInterfaceStyle]);

        id v7 = (id)v10;
      }
    }
    else
    {
      id v7 = 0;
    }
    id v12 = v7;
    uint64_t v5 = [(_UIStackedImageConfiguration *)self->_imageStackConfig setPlaceholderImage:v7];
    id v6 = v12;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (double)cornerRadius
{
  [(_UIStackedImageConfiguration *)self->_imageStackConfig cornerRadius];
  return result;
}

- (void)setCornerRadius:(double)a3
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

- (void)setShadow:(id)a3
{
  id v5 = a3;
  p_shadow = &self->_shadow;
  if (([(NSShadow *)self->_shadow isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_shadow, a3);
    id v7 = *p_shadow;
    if (*p_shadow)
    {
      double v10 = 0.0;
      BOOL v8 = [(NSShadow *)v7 shadowColor];
      [v8 getRed:0 green:0 blue:0 alpha:&v10];

      [(VUIStackedImageView *)self _setShadowOpacity:v10];
      [v5 shadowBlurRadius];
      -[VUIStackedImageView _setShadowRadius:](self, "_setShadowRadius:");
      [v5 shadowOffset];
      [(VUIStackedImageView *)self _setShadowVerticalOffset:v9];
    }
    else
    {
      [(VUIStackedImageView *)self _resetShadowSettings];
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

- (int64_t)selectionStyle
{
  return [(_UIStackedImageContainerLayer *)self->_imageStackLayer _selectionStyle];
}

- (void)setSelectionStyle:(int64_t)a3
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
  id v7 = (UIView *)a3;
  if (self->_overlayView != v7)
  {
    objc_storeStrong((id *)&self->_overlayView, a3);
    imageStackLayer = self->_imageStackLayer;
    id v6 = [(UIView *)v7 layer];
    [(_UIStackedImageContainerLayer *)imageStackLayer _setOverlayLayer:v6];

    [(VUIStackedImageView *)self _updateImageSamplingOverlays];
  }
}

- (void)setUnmaskedOverlayView:(id)a3
{
  id v7 = (UIView *)a3;
  if (self->_unmaskedOverlayView != v7)
  {
    objc_storeStrong((id *)&self->_unmaskedOverlayView, a3);
    imageStackLayer = self->_imageStackLayer;
    id v6 = [(UIView *)v7 layer];
    [(_UIStackedImageContainerLayer *)imageStackLayer _setUnmaskedOverlayLayer:v6];

    [(VUIStackedImageView *)self _updateImageSamplingOverlays];
  }
}

- (BOOL)isSelected
{
  return [(_UIStackedImageContainerLayer *)self->_imageStackLayer isSelected];
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

  -[VUIStackedImageView setFocusDirection:](self, "setFocusDirection:", v8, v11);
  return 1;
}

- (void)_attachMotionEffects
{
  v10[2] = *MEMORY[0x1E4F143B8];
  motionEffectGroup = self->_motionEffectGroup;
  if (!motionEffectGroup)
  {
    double v4 = (void *)[objc_alloc(MEMORY[0x1E4F42AE8]) initWithKeyPath:@"focusDirectionX" type:0];
    [v4 setMinimumRelativeValue:&unk_1F3DFD788];
    [v4 setMaximumRelativeValue:&unk_1F3DFD798];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F42AE8]) initWithKeyPath:@"focusDirectionY" type:1];
    [v5 setMinimumRelativeValue:&unk_1F3DFD788];
    [v5 setMaximumRelativeValue:&unk_1F3DFD798];
    id v6 = (UIMotionEffectGroup *)objc_alloc_init(MEMORY[0x1E4F42BB8]);
    double v7 = self->_motionEffectGroup;
    self->_motionEffectGroup = v6;

    double v8 = self->_motionEffectGroup;
    v10[0] = v4;
    v10[1] = v5;
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    [(UIMotionEffectGroup *)v8 setMotionEffects:v9];

    motionEffectGroup = self->_motionEffectGroup;
  }
  [(VUIStackedImageView *)self addMotionEffect:motionEffectGroup];
}

- (void)_detachMotionEffects
{
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  -[_UIStackedImageContainerLayer setSelected:](self->_imageStackLayer, "setSelected:");
  [(VUIStackedImageView *)self setFocused:v3];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[_UIStackedImageContainerLayer setSelected:animated:](self->_imageStackLayer, "setSelected:animated:");
  [(UIView *)self->_overlayView vui_setSelected:v5 animated:v4 withAnimationCoordinator:0];
  [(VUIStackedImageView *)self setFocused:v5];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  imageStackLayer = self->_imageStackLayer;
  id v9 = a5;
  [(_UIStackedImageContainerLayer *)imageStackLayer setSelected:v6 animated:v5 focusAnimationCoordinator:v9];
  [(UIView *)self->_overlayView vui_setSelected:v6 animated:v5 withAnimationCoordinator:v9];

  [(VUIStackedImageView *)self setFocused:v6];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  imageStackLayer = self->_imageStackLayer;
  id v9 = a5;
  [(_UIStackedImageContainerLayer *)imageStackLayer setSelected:v6 animated:v5 focusAnimationCoordinator:v9];
  [(UIView *)self->_overlayView vui_setSelected:v6 animated:v5 withAnimationCoordinator:v9];

  [(VUIStackedImageView *)self setFocused:v6];
}

- (void)setFocused:(BOOL)a3
{
  if (a3) {
    [(VUIStackedImageView *)self _attachMotionEffects];
  }
  else {
    [(VUIStackedImageView *)self _detachMotionEffects];
  }
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

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)setPressed:(BOOL)a3 duration:(double)a4 completion:(id)a5
{
  BOOL v6 = a3;
  imageStackLayer = self->_imageStackLayer;
  id v9 = a5;
  id v19 = v9;
  if (a4 >= 0.0)
  {
    double v10 = [(_UIStackedImageContainerLayer *)imageStackLayer configuration];
    [v10 pressedDuration];
    double v12 = v11;

    v13 = [(_UIStackedImageContainerLayer *)self->_imageStackLayer configuration];
    [v13 setPressedDuration:a4];

    v14 = [(_UIStackedImageContainerLayer *)self->_imageStackLayer configuration];
    [v14 unpressedDuration];
    double v16 = v15;

    v17 = [(_UIStackedImageContainerLayer *)self->_imageStackLayer configuration];
    [v17 setUnpressedDuration:a4];

    [(_UIStackedImageContainerLayer *)self->_imageStackLayer setPressed:v6 animated:1 completion:v19];
    v18 = [(_UIStackedImageContainerLayer *)self->_imageStackLayer configuration];
    [v18 setPressedDuration:v12];

    id v19 = [(_UIStackedImageContainerLayer *)self->_imageStackLayer configuration];
    [v19 setUnpressedDuration:v16];
  }
  else
  {
    [(_UIStackedImageContainerLayer *)imageStackLayer setPressed:v6 animated:1 completion:v9];
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

- (unint64_t)controlState
{
  return [(_UIStackedImageContainerLayer *)self->_imageStackLayer controlState];
}

- (void)setControlState:(unint64_t)a3
{
}

- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5
{
}

- (unint64_t)primaryControlState
{
  imageStackLayer = self->_imageStackLayer;
  unint64_t v3 = [(VUIStackedImageView *)self controlState];
  return [(_UIStackedImageContainerLayer *)imageStackLayer _primaryControlStateForState:v3];
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  if (a3.width == 0.0 || (double height = a3.height, a3.height == 0.0))
  {
    [(VUIStackedImageView *)self stackSize];
    double width = v6;
    double height = v7;
  }
  else
  {
    double width = a3.width;
  }
  double v8 = objc_opt_class();
  [(_UIStackedImageConfiguration *)self->_imageStackConfig scaleSizeIncrease];
  objc_msgSend(v8, "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", -[VUIStackedImageView selectionStyle](self, "selectionStyle"), width, height, v9);
  double v11 = floor((v10 - width) * 0.5);
  double v13 = floor((v12 - height) * 0.5);
  double v14 = v11;
  double v15 = v13;
  result.right = v11;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)animateWithAuxiliarySelectionState:(BOOL)a3 animations:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    id v9 = v6;
    double v7 = (void *)MEMORY[0x1E4F42FF0];
    imageStackConfig = self->_imageStackConfig;
    if (v4) {
      [(_UIStackedImageConfiguration *)imageStackConfig layerSelectionDuration];
    }
    else {
      [(_UIStackedImageConfiguration *)imageStackConfig layerUnselectionDuration];
    }
    objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 327684, v9, 0);
    id v6 = v9;
  }
}

- (id)_newImageConfiguration
{
  double v2 = (void *)[MEMORY[0x1E4F432F8] newStandardConfiguration];
  [v2 setMaximumParallaxImages:6];
  [v2 setRadiosityStrength:0.0];
  return v2;
}

- (id)_imageConfiguration
{
  return (id)[(_UIStackedImageContainerLayer *)self->_imageStackLayer configuration];
}

- (id)_layeredImageContainerLayer
{
  return self->_imageStackLayer;
}

- (double)_idleModeFocusSizeOffset
{
  [(_UIStackedImageContainerLayer *)self->_imageStackLayer _idleModeFocusSizeOffset];
  return result;
}

- (id)_layerBelowTitles
{
  return (id)[(_UIStackedImageContainerLayer *)self->_imageStackLayer _layerBelowTitles];
}

- (void)_loadImage
{
  unint64_t v3 = (VUIStackedImageNamedLayerStack *)objc_opt_new();
  uiLayerStack = self->_uiLayerStack;
  self->_uiLayerStack = v3;

  BOOL v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [v5 UUIDString];
  [(VUIStackedImageNamedLayerStack *)self->_uiLayerStack setName:v6];

  -[VUIStackedImageNamedLayerStack setSize:](self->_uiLayerStack, "setSize:", self->_stackSize.width, self->_stackSize.height);
  [(VUIStackedImageNamedLayerStack *)self->_uiLayerStack setScale:1.0];
  [(VUIStackedImageNamedLayerStack *)self->_uiLayerStack setFlattenedImage:0];
  [(VUIStackedImageNamedLayerStack *)self->_uiLayerStack setLayers:MEMORY[0x1E4F1CBF0]];
  [(VUIStackedImageNamedLayerStack *)self->_uiLayerStack setRadiosityImage:0];
  -[VUIStackedImageNamedLayerStack setRadiosityImageScale:](self->_uiLayerStack, "setRadiosityImageScale:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  BOOL v7 = !+[VUICoreUtilities canHandleDecodingOnRenderThread]&& [(VUIStackedImageView *)self selectionStyle] != 1;
  [(VUIStackedImageNamedLayerStack *)self->_uiLayerStack setFlatImageContainsCornerRadius:v7];
  [(_UIStackedImageContainerLayer *)self->_imageStackLayer setLayerStack:self->_uiLayerStack];
  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_imageProxy);
  double v8 = (void *)[(VUIStackedImageNamedLayerStack *)self->_uiLayerStack copy];
  double width = self->_stackSize.width;
  double height = self->_stackSize.height;
  id v11 = objc_loadWeakRetained(&from);

  if (v11)
  {
    [(VUIImageProxy *)self->_imageProxy setCacheOnLoad:+[VUICoreUtilities canHandleDecodingOnRenderThread] ^ 1];
    imageProxy = self->_imageProxy;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __33__VUIStackedImageView__loadImage__block_invoke;
    v34[3] = &unk_1E6DDD228;
    double v13 = &v36;
    objc_copyWeak(&v36, &from);
    objc_copyWeak(v37, &location);
    id v35 = v8;
    v37[1] = *(id *)&width;
    v37[2] = *(id *)&height;
    [(VUIImageProxy *)imageProxy setCompletionHandler:v34];
    [(VUIImageProxy *)self->_imageProxy setImageDirection:[(VUIStackedImageView *)self effectiveUserInterfaceLayoutDirection] == 1];
    [(VUIImageProxy *)self->_imageProxy load];

    objc_destroyWeak(v37);
  }
  else
  {
    staticImage = self->_staticImage;
    if (!staticImage)
    {
      [(VUIStackedImageView *)self setImageLoaded:1];
      goto LABEL_14;
    }
    double v15 = [(UIImage *)staticImage CGImage];
    double v16 = objc_opt_class();
    [(VUIStackedImageView *)self focusSizeIncrease];
    objc_msgSend(v16, "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", -[VUIStackedImageView selectionStyle](self, "selectionStyle"), width, height, v17);
    double v19 = v18;
    double v21 = v20;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __33__VUIStackedImageView__loadImage__block_invoke_3;
    v31[3] = &unk_1E6DDD250;
    double v13 = v33;
    objc_copyWeak(v33, &location);
    v33[1] = v15;
    id v32 = v8;
    v33[2] = *(id *)&width;
    v33[3] = *(id *)&height;
    v22 = (void (**)(void, void))MEMORY[0x1E4E604D0](v31);
    [(UIImage *)self->_staticImage size];
    if (v19 == v24 && v21 == v23
      || !+[VUICoreUtilities canHandleDecodingOnRenderThread])
    {
      ((void (**)(void, CGImage *))v22)[2](v22, v15);
    }
    else
    {
      v25 = dispatch_get_global_queue(21, 0);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __33__VUIStackedImageView__loadImage__block_invoke_4;
      v26[3] = &unk_1E6DDD2A0;
      double v28 = v19;
      double v29 = v21;
      v30 = v15;
      v27 = v22;
      dispatch_async(v25, v26);
    }
  }
  objc_destroyWeak(v13);
LABEL_14:

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __33__VUIStackedImageView__loadImage__block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  [v7 setEnableCache:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = v7;
  uint64_t v11 = [v10 image];
  id v12 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v12, "_updateLayerStack:withImage:size:", *(void *)(a1 + 32), v11, *(double *)(a1 + 56), *(double *)(a1 + 64));

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __33__VUIStackedImageView__loadImage__block_invoke_2;
  v16[3] = &unk_1E6DDCCC0;
  objc_copyWeak(&v20, (id *)(a1 + 48));
  id v13 = WeakRetained;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  char v21 = a4;
  id v19 = *(id *)(a1 + 32);
  double v15 = (void (**)(void))MEMORY[0x1E4E604D0](v16);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v15[2](v15);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v15);
  }

  objc_destroyWeak(&v20);
}

void __33__VUIStackedImageView__loadImage__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    unint64_t v3 = [WeakRetained imageProxy];
    int v4 = [v3 isEqual:*(void *)(a1 + 32)];

    id WeakRetained = v5;
    if (v4)
    {
      if (*(void *)(a1 + 40) && *(unsigned char *)(a1 + 64)) {
        [v5 _commitLayerStack:*(void *)(a1 + 48)];
      }
      [v5 setImageLoaded:*(unsigned __int8 *)(a1 + 64)];
      id WeakRetained = v5;
    }
  }
}

void __33__VUIStackedImageView__loadImage__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    BOOL v5 = [WeakRetained[51] CGImage] == *(void *)(a1 + 48);
    id WeakRetained = v6;
    if (v5)
    {
      objc_msgSend(v6, "_updateLayerStack:withImage:size:", *(void *)(a1 + 32), a2, *(double *)(a1 + 56), *(double *)(a1 + 64));
      [v6 _commitLayerStack:*(void *)(a1 + 32)];
      [v6 setImageLoaded:1];
      id WeakRetained = v6;
    }
  }
}

void __33__VUIStackedImageView__loadImage__block_invoke_4(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = *(void *)(a1 + 56);
  double v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  unint64_t v3 = VUICompositeBitmapImageOfSizeForImages(v2, 0, 0, *(double *)(a1 + 40), *(double *)(a1 + 48), 0.0);

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__VUIStackedImageView__loadImage__block_invoke_5;
  v4[3] = &unk_1E6DDD278;
  id v5 = *(id *)(a1 + 32);
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __33__VUIStackedImageView__loadImage__block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  double v2 = *(void **)(a1 + 40);
  if (v2)
  {
  }
}

- (void)_updateLayerStack:(id)a3 withImage:(CGImage *)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  v15[1] = *MEMORY[0x1E4F143B8];
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
  id v12 = objc_opt_new();
  id v13 = [MEMORY[0x1E4F42A80] imageWithCGImage:a4];
  [v12 setImageObj:v13];

  [v12 setImage:a4];
  [v12 setName:@"0"];
  [v12 setOpacity:1.0];
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, width, height);
  if (v12)
  {
    v15[0] = v12;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v8 setLayers:v14];
  }
  else
  {
LABEL_6:
    [v8 setLayers:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)_commitLayerStack:(id)a3
{
  int v4 = (VUIStackedImageNamedLayerStack *)a3;
  uint64_t v5 = [MEMORY[0x1E4F39CF8] disableActions];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  uiLayerStack = self->_uiLayerStack;
  self->_uiLayerStack = v4;
  id v7 = v4;

  [(_UIStackedImageContainerLayer *)self->_imageStackLayer setLayerStack:self->_uiLayerStack];
  [MEMORY[0x1E4F39CF8] setDisableActions:v5];
  [(VUIStackedImageView *)self _updateImageSamplingOverlays];
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];

  [v8 postNotificationName:@"VUIStackedImageViewImageDidUpdateNotification" object:self];
}

- (void)_updateImageSamplingOverlays
{
  int v3 = [(UIView *)self->_overlayView conformsToProtocol:&unk_1F3E312C8];
  int v4 = [(UIView *)self->_unmaskedOverlayView conformsToProtocol:&unk_1F3E312C8];
  if ([(VUIStackedImageNamedLayerStack *)self->_uiLayerStack flattenedImage]) {
    BOOL v5 = (v3 | v4) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    id v6 = [(VUIStackedImageNamedLayerStack *)self->_uiLayerStack flattenedImage];
    id v7 = objc_opt_class();
    [(VUIStackedImageNamedLayerStack *)self->_uiLayerStack size];
    double v9 = v8;
    double v11 = v10;
    [(_UIStackedImageConfiguration *)self->_imageStackConfig scaleSizeIncrease];
    objc_msgSend(v7, "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", -[VUIStackedImageView selectionStyle](self, "selectionStyle"), v9, v11, v12);
    uint64_t v14 = [MEMORY[0x1E4F42A80] imageWithCGImage:v6 scale:0 orientation:(double)CGImageGetWidth(v6) / v13];
    uint64_t v15 = v14;
    uint64_t v16 = v14;
    if (v3)
    {
      uint64_t v14 = [(UIView *)self->_overlayView sampleWithImage:v14];
      uint64_t v15 = v16;
    }
    if (v4)
    {
      uint64_t v14 = [(UIView *)self->_unmaskedOverlayView sampleWithImage:v16];
      uint64_t v15 = v16;
    }
    MEMORY[0x1F41817F8](v14, v15);
  }
}

- (void)_setShadowOpacity:(double)a3
{
  -[_UIStackedImageConfiguration setDefaultFocusedShadowOpacity:](self->_imageStackConfig, "setDefaultFocusedShadowOpacity:");
  [(_UIStackedImageConfiguration *)self->_imageStackConfig setDefaultHighlightedShadowOpacity:a3];
  imageStackConfig = self->_imageStackConfig;
  [(_UIStackedImageConfiguration *)imageStackConfig setDefaultUnfocusedShadowOpacity:a3];
}

- (void)_setShadowRadius:(double)a3
{
  -[_UIStackedImageConfiguration setDefaultFocusedShadowRadius:](self->_imageStackConfig, "setDefaultFocusedShadowRadius:");
  [(_UIStackedImageConfiguration *)self->_imageStackConfig setDefaultHighlightedShadowRadius:a3];
  imageStackConfig = self->_imageStackConfig;
  [(_UIStackedImageConfiguration *)imageStackConfig setDefaultUnfocusedShadowRadius:a3];
}

- (void)_setShadowVerticalOffset:(double)a3
{
  -[_UIStackedImageConfiguration setDefaultFocusedShadowVerticalOffset:](self->_imageStackConfig, "setDefaultFocusedShadowVerticalOffset:");
  [(_UIStackedImageConfiguration *)self->_imageStackConfig setDefaultHighlightedShadowVerticalOffset:a3];
  imageStackConfig = self->_imageStackConfig;
  [(_UIStackedImageConfiguration *)imageStackConfig setDefaultUnfocusedShadowVerticalOffset:a3];
}

- (void)_resetShadowSettings
{
  id v12 = [(VUIStackedImageView *)self _newImageConfiguration];
  imageStackConfig = self->_imageStackConfig;
  [v12 defaultFocusedShadowOpacity];
  -[_UIStackedImageConfiguration setDefaultFocusedShadowOpacity:](imageStackConfig, "setDefaultFocusedShadowOpacity:");
  int v4 = self->_imageStackConfig;
  [v12 defaultHighlightedShadowOpacity];
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowOpacity:](v4, "setDefaultHighlightedShadowOpacity:");
  BOOL v5 = self->_imageStackConfig;
  [v12 defaultUnfocusedShadowOpacity];
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowOpacity:](v5, "setDefaultUnfocusedShadowOpacity:");
  id v6 = self->_imageStackConfig;
  [v12 defaultFocusedShadowRadius];
  -[_UIStackedImageConfiguration setDefaultFocusedShadowRadius:](v6, "setDefaultFocusedShadowRadius:");
  id v7 = self->_imageStackConfig;
  [v12 defaultHighlightedShadowRadius];
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowRadius:](v7, "setDefaultHighlightedShadowRadius:");
  double v8 = self->_imageStackConfig;
  [v12 defaultUnfocusedShadowRadius];
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowRadius:](v8, "setDefaultUnfocusedShadowRadius:");
  double v9 = self->_imageStackConfig;
  [v12 defaultFocusedShadowVerticalOffset];
  -[_UIStackedImageConfiguration setDefaultFocusedShadowVerticalOffset:](v9, "setDefaultFocusedShadowVerticalOffset:");
  double v10 = self->_imageStackConfig;
  [v12 defaultHighlightedShadowVerticalOffset];
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowVerticalOffset:](v10, "setDefaultHighlightedShadowVerticalOffset:");
  double v11 = self->_imageStackConfig;
  [v12 defaultUnfocusedShadowVerticalOffset];
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowVerticalOffset:](v11, "setDefaultUnfocusedShadowVerticalOffset:");
}

- (void)_setFocusDirection:(CGPoint)a3 duration:(double)a4
{
}

- (void)_updateStackedImageConfiguration
{
  if (!self->_imageStackConfig)
  {
    int v3 = [(VUIStackedImageView *)self _newImageConfiguration];
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
  id v12 = self->_imageStackConfig;
  [(_UIStackedImageContainerLayer *)imageStackLayer setConfiguration:v12];
}

+ (CGSize)_scaledSizeForSize:(CGSize)a3 selectionStyle:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  double v8 = (void *)[MEMORY[0x1E4F432F8] newStandardConfiguration];
  [v8 scaleSizeIncrease];
  objc_msgSend(a1, "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", a4, width, height, v9);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

+ (CGSize)_scaledSizeForSize:(CGSize)a3 focusSizeIncrease:(double)a4 selectionStyle:(int64_t)a5
{
  objc_msgSend(MEMORY[0x1E4F43300], "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", a5, a3.width, a3.height, a4);
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  return (id)[(_UIStackedImageConfiguration *)self->_imageStackConfig focusAnimationConfiguration];
}

- (VUIImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (CGSize)stackSize
{
  double width = self->_stackSize.width;
  double height = self->_stackSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setStackSize:(CGSize)a3
{
  self->_stackSize = a3;
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

- (BOOL)isImageLoaded
{
  return self->_imageLoaded;
}

- (void)setImageLoaded:(BOOL)a3
{
  self->_imageLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmaskedOverlayView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_imageProxy, 0);
  objc_storeStrong((id *)&self->_motionEffectGroup, 0);
  objc_storeStrong((id *)&self->_uiLayerStack, 0);
  objc_storeStrong((id *)&self->_imageStackConfig, 0);
  objc_storeStrong((id *)&self->_imageStackLayer, 0);
  objc_storeStrong((id *)&self->_staticImage, 0);
}

@end