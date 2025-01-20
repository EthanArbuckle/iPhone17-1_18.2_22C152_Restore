@interface NTKUpNextBaseCell
+ (CGSize)suggestedBodyImageSizeForDevice:(id)a3;
+ (CGSize)suggestedHeaderImageSizeForDevice:(id)a3;
+ (Class)suggestedCellClassForContent:(id)a3;
+ (double)cornerRadiusForDevice:(id)a3;
+ (void)clearLabel:(id)a3;
- (BOOL)isPaused;
- (CALayer)imageLayer;
- (CLKDevice)device;
- (CLKMonochromeFilterProvider)filterProvider;
- (NSString)representedElementIdentifier;
- (NTKUpNextBaseCell)initWithFrame:(CGRect)a3;
- (REContent)content;
- (UIColor)imageColor;
- (UIImage)contentImage;
- (UIImage)overrideContentImage;
- (id)transitionContextInView:(id)a3;
- (void)_updateColorOverlay;
- (void)addContentsLayerProvider:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)configureWithContent:(id)a3;
- (void)enumerateContentsLayersWithBlock:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)removeContentsLayerProvider:(id)a3;
- (void)setContentBrightness:(double)a3 animated:(BOOL)a4;
- (void)setContentImage:(id)a3 animated:(BOOL)a4;
- (void)setFilterProvider:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageColor:(id)a3;
- (void)setOverrideContentImage:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setRepresentedElementIdentifier:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKUpNextBaseCell

+ (void)clearLabel:(id)a3
{
  id v3 = a3;
  [v3 setTextProvider:0];
  [v3 setText:0];
}

+ (CGSize)suggestedHeaderImageSizeForDevice:(id)a3
{
  uint64_t v3 = [a3 sizeClass];
  double v4 = 14.5;
  switch(v3)
  {
    case 0:
      break;
    case 1:
    case 2:
    case 4:
      double v4 = 17.0;
      break;
    default:
      double v4 = 19.0;
      break;
  }
  double v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)suggestedBodyImageSizeForDevice:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (double)cornerRadiusForDevice:(id)a3
{
  return _LayoutConstants_48(a3);
}

- (NTKUpNextBaseCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKUpNextBaseCell;
  double v3 = -[NTKUpNextBaseCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = +[CLKRenderingContext sharedRenderingContext];
    uint64_t v5 = [v4 device];
    device = v3->_device;
    v3->_device = (CLKDevice *)v5;

    _LayoutConstants_48(v3->_device);
    NTKImageNamed(@"platter_shadow");
  }
  return 0;
}

- (void)addContentsLayerProvider:(id)a3
{
}

- (void)removeContentsLayerProvider:(id)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(NTKUpNextBaseCell *)self isHighlighted];
  v7.receiver = self;
  v7.super_class = (Class)NTKUpNextBaseCell;
  [(NTKUpNextBaseCell *)&v7 setHighlighted:v3];
  if (v5 != v3)
  {
    if (v3)
    {
      [(NTKUpNextBaseCell *)self _updateColorOverlay];
    }
    else
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __36__NTKUpNextBaseCell_setHighlighted___block_invoke;
      v6[3] = &unk_1E62BFF20;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:0.25];
    }
  }
}

uint64_t __36__NTKUpNextBaseCell_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateColorOverlay];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)NTKUpNextBaseCell;
  [(NTKUpNextBaseCell *)&v4 prepareForReuse];
  BOOL v3 = [MEMORY[0x1E4FB1618] whiteColor];
  [(NTKUpNextBaseCell *)self setImageColor:v3];

  [(NTKUpNextBaseCell *)self setPaused:0];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NTKUpNextBaseCell;
  [(NTKUpNextBaseCell *)&v12 layoutSubviews];
  [(NTKUpNextBaseCell *)self bounds];
  double x = v13.origin.x;
  double width = v13.size.width;
  double height = self->_shadowSize.height;
  double MaxY = CGRectGetMaxY(v13);
  double v7 = _LayoutConstants_48(self->_device);
  double v9 = MaxY - v8;
  overlayView = self->_overlayView;
  [(NTKUpNextBaseCell *)self bounds];
  -[UIView setFrame:](overlayView, "setFrame:");
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  imageLayer = self->_imageLayer;
  [(NTKUpNextBaseCell *)self bounds];
  -[CALayer setFrame:](imageLayer, "setFrame:");
  -[UIImageView setFrame:](self->_shadowView, "setFrame:", x, v9, width, height);
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)setImageColor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  if ((NTKEqualObjects(v4, self->_imageColor) & 1) == 0)
  {
    int v5 = (UIColor *)[v4 copy];
    imageColor = self->_imageColor;
    self->_imageColor = v5;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__NTKUpNextBaseCell_setImageColor___block_invoke;
    v7[3] = &unk_1E62C0788;
    v7[4] = self;
    [(NTKUpNextBaseCell *)self enumerateContentsLayersWithBlock:v7];
  }
}

void __35__NTKUpNextBaseCell_setImageColor___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 760);
  id v3 = a2;
  objc_msgSend(v3, "setContentsMultiplyColor:", objc_msgSend(v2, "CGColor"));
}

- (void)setContentBrightness:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4FB1618] colorWithWhite:a3 alpha:1.0];
    uint64_t v8 = [v7 CGColor];

    id v9 = [MEMORY[0x1E4FB1618] colorWithWhite:self->_contentBrightness alpha:1.0];
    uint64_t v10 = [v9 CGColor];

    imageColor = self->_imageColor;
    objc_super v12 = [MEMORY[0x1E4FB1618] whiteColor];
    LOBYTE(imageColor) = [(UIColor *)imageColor isEqual:v12];

    if ((imageColor & 1) == 0)
    {
      double v23 = 0.0;
      double v24 = 0.0;
      double v21 = 0.0;
      double v22 = 0.0;
      [(UIColor *)self->_imageColor getHue:&v24 saturation:&v23 brightness:&v22 alpha:&v21];
      id v13 = [MEMORY[0x1E4FB1618] colorWithHue:v24 saturation:v23 brightness:v22 * a3 alpha:v21];
      uint64_t v8 = [v13 CGColor];

      id v14 = [MEMORY[0x1E4FB1618] colorWithHue:v24 saturation:v23 brightness:v22 * self->_contentBrightness alpha:v21];
      uint64_t v10 = [v14 CGColor];
    }
    if (v4)
    {
      v15 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"contentsMultiplyColor"];
      [v15 setToValue:v8];
      [v15 setFromValue:v10];
      [v15 setDuration:0.5];
      v16 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
      [v15 setTimingFunction:v16];

      [v15 setFillMode:*MEMORY[0x1E4F39F98]];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __51__NTKUpNextBaseCell_setContentBrightness_animated___block_invoke;
      v19[3] = &unk_1E62C0788;
      id v20 = v15;
      id v17 = v15;
      [(NTKUpNextBaseCell *)self enumerateContentsLayersWithBlock:v19];
    }
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__NTKUpNextBaseCell_setContentBrightness_animated___block_invoke_2;
    v18[3] = &__block_descriptor_40_e17_v16__0__CALayer_8l;
    v18[4] = v8;
    [(NTKUpNextBaseCell *)self enumerateContentsLayersWithBlock:v18];
    [MEMORY[0x1E4F39CF8] commit];
    self->_contentBrightness = a3;
  }
}

uint64_t __51__NTKUpNextBaseCell_setContentBrightness_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addAnimation:*(void *)(a1 + 32) forKey:@"brightnessBoost"];
}

uint64_t __51__NTKUpNextBaseCell_setContentBrightness_animated___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setContentsMultiplyColor:*(void *)(a1 + 32)];
}

- (void)setContentImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (UIImage *)a3;
  if (self->_contentImage != v7)
  {
    if (!self->_overrideContentImage)
    {
      if (v4)
      {
        uint64_t v8 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"contents"];
        objc_msgSend(v8, "setToValue:", -[UIImage CGImage](v7, "CGImage"));
        objc_msgSend(v8, "setFromValue:", -[UIImage CGImage](self->_contentImage, "CGImage"));
        [v8 setDuration:1.0];
        id v9 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
        [v8 setTimingFunction:v9];

        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __46__NTKUpNextBaseCell_setContentImage_animated___block_invoke;
        v16[3] = &unk_1E62C0788;
        id v17 = v8;
        id v10 = v8;
        [(NTKUpNextBaseCell *)self enumerateContentsLayersWithBlock:v16];
      }
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      id v13 = __46__NTKUpNextBaseCell_setContentImage_animated___block_invoke_2;
      id v14 = &unk_1E62C0788;
      v15 = v7;
      [(NTKUpNextBaseCell *)self enumerateContentsLayersWithBlock:&v11];
      objc_msgSend(MEMORY[0x1E4F39CF8], "commit", v11, v12, v13, v14);
    }
    objc_storeStrong((id *)&self->_contentImage, a3);
  }
}

uint64_t __46__NTKUpNextBaseCell_setContentImage_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addAnimation:*(void *)(a1 + 32) forKey:@"contentsFade"];
}

void __46__NTKUpNextBaseCell_setContentImage_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(id *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setContents:", objc_msgSend(v3, "CGImage"));
}

- (void)setOverrideContentImage:(id)a3
{
  int v5 = (UIImage *)a3;
  if (self->_overrideContentImage != v5)
  {
    objc_storeStrong((id *)&self->_overrideContentImage, a3);
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__NTKUpNextBaseCell_setOverrideContentImage___block_invoke;
    v6[3] = &unk_1E62C0788;
    id v7 = v5;
    [(NTKUpNextBaseCell *)self enumerateContentsLayersWithBlock:v6];
    [MEMORY[0x1E4F39CF8] commit];
  }
}

void __45__NTKUpNextBaseCell_setOverrideContentImage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(id *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setContents:", objc_msgSend(v3, "CGImage"));
}

- (void)enumerateContentsLayersWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, CALayer *))a3;
  v4[2](v4, self->_imageLayer);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v5 = self->_layerProviders;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "contentsLayer", (void)v11);
        id v10 = (CALayer *)objc_claimAutoreleasedReturnValue();
        if (v10) {
          v4[2](v4, v10);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)configureWithContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
  id v5 = a3;
  id v6 = [v5 tintColor];

  [(NTKUpNextBaseCell *)self setTintColor:v6];
}

- (void)applyLayoutAttributes:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NTKUpNextBaseCell;
  [(NTKUpNextBaseCell *)&v20 applyLayoutAttributes:v4];
  -[NTKUpNextBaseCell setHidden:](self, "setHidden:", [v4 isHidden]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[NTKUpNextBaseCell setPaused:](self, "setPaused:", [v4 notVisibleToUser]);
    char v5 = [MEMORY[0x1E4FB1EB0] _isInAnimationBlock];
    if ((v5 & 1) == 0)
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
    }
    [v4 darkeningAlphaUniform];
    CLKInterpolateBetweenFloatsClipped();
    self->_darkeningAmount = v6;
    [(NTKUpNextBaseCell *)self _updateColorOverlay];
    if (!self->_overrideContentImage)
    {
      imageLayer = self->_imageLayer;
      [v4 unitFrameOnScreen];
      -[CALayer setContentsRect:](imageLayer, "setContentsRect:");
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v8 = self->_layerProviders;
      uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            long long v14 = objc_msgSend(v13, "contentsLayer", (void)v16);
            [v13 contentsLayerBoundsForLayout:v4];
            objc_msgSend(v14, "setContentsRect:");
          }
          uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v10);
      }
    }
    shadowView = self->_shadowView;
    objc_msgSend(v4, "shadowAlpha", (void)v16);
    CLKInterpolateBetweenFloatsClipped();
    -[UIImageView setAlpha:](shadowView, "setAlpha:");
    if ((v5 & 1) == 0) {
      [MEMORY[0x1E4F39CF8] commit];
    }
  }
}

- (void)_updateColorOverlay
{
  int v3 = [(NTKUpNextBaseCell *)self isHighlighted];
  overlayView = self->_overlayView;
  if (v3)
  {
    double v5 = 1.0;
    double darkeningAmount = 0.25;
  }
  else
  {
    double darkeningAmount = self->_darkeningAmount;
    double v5 = 0.0;
  }
  id v7 = [MEMORY[0x1E4FB1618] colorWithWhite:v5 alpha:darkeningAmount];
  [(UIView *)overlayView setBackgroundColor:v7];
}

- (id)transitionContextInView:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (Class)suggestedCellClassForContent:(id)a3
{
  [a3 style];
  int v3 = objc_opt_class();

  return (Class)v3;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (CLKDevice)device
{
  return self->_device;
}

- (UIImage)contentImage
{
  return self->_contentImage;
}

- (UIImage)overrideContentImage
{
  return self->_overrideContentImage;
}

- (REContent)content
{
  return self->_content;
}

- (NSString)representedElementIdentifier
{
  return self->_representedElementIdentifier;
}

- (void)setRepresentedElementIdentifier:(id)a3
{
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (UIColor)imageColor
{
  return self->_imageColor;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageColor, 0);
  objc_storeStrong((id *)&self->_representedElementIdentifier, 0);
  objc_storeStrong((id *)&self->_overrideContentImage, 0);
  objc_storeStrong((id *)&self->_contentImage, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_layerProviders, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);

  objc_storeStrong((id *)&self->_shadowView, 0);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)updateMonochromeColor
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

@end