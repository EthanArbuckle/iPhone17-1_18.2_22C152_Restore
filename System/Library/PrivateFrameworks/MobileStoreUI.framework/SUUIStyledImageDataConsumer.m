@interface SUUIStyledImageDataConsumer
+ (BOOL)isImageCompressionEnabled;
+ (id)appIconConsumerWithSize:(CGSize)a3;
+ (id)applePackIconConsumer;
+ (id)brickConsumer;
+ (id)brickConsumerWithBrickSize:(CGSize)a3;
+ (id)cardIconConsumer;
+ (id)cardProductImageConsumer;
+ (id)categoriesMessagesConsumer;
+ (id)categoryIconConsumer;
+ (id)giftComposeProductImageConsumer;
+ (id)giftResultIconConsumer;
+ (id)giftResultProductImageConsumer;
+ (id)giftThemeIconConsumer;
+ (id)giftThemeProductImageConsumer;
+ (id)gridIconConsumer;
+ (id)listIconConsumer;
+ (id)lockupIconConsumerWithSize:(int64_t)a3;
+ (id)lockupProductImageConsumerWithSize:(int64_t)a3;
+ (id)manageMessagesConsumer;
+ (id)mixedTopChartsNewsstandConsumer;
+ (id)newsstandRoomNewsstandConsumer;
+ (id)newsstandSwooshNewsstandConsumer;
+ (id)parentBundleIconConsumer;
+ (id)productImageConsumerWithSize:(CGSize)a3;
+ (id)productPageProductImageConsumer;
+ (id)purchasedIconConsumer;
+ (id)purchasedMessagesConsumer;
+ (id)purchasedProductImageConsumer;
+ (id)roomIconConsumer;
+ (id)roomProductImageConsumer;
+ (id)shareSheetIconConsumer;
+ (id)swooshNewsstandConsumer;
+ (id)topChartsIconConsumer;
+ (id)topChartsNewsstandConsumer;
+ (id)updatesIconConsumer;
+ (id)updatesProductImageConsumer;
+ (id)wishlistIconConsumer;
+ (id)wishlistProductImageConsumer;
- (BOOL)_backgroundIsOpaque;
- (BOOL)isImagePlaceholderAvailable;
- (CGSize)imageSize;
- (CGSize)shadowOffset;
- (SUUIStyledImageDataConsumer)init;
- (SUUIStyledImageDataConsumer)initWithSize:(CGSize)a3 treatment:(int64_t)a4;
- (SUUIStyledImageDataConsumer)initWithViewElement:(id)a3;
- (UIColor)backgroundColor;
- (UIColor)borderColor;
- (UIColor)shadowColor;
- (UIEdgeInsets)borderMargins;
- (UIEdgeInsets)borderWidths;
- (UIEdgeInsets)imagePadding;
- (double)shadowRadius;
- (id)_arcRoundedImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 cornerRadius:(double)a5 drawBlock:(id)a6;
- (id)_defaultPlaceholderColor;
- (id)_dynamicUberImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 drawBlock:(id)a5;
- (id)_imageWithSize:(CGSize)a3 isOpaque:(BOOL)a4 drawBlock:(id)a5;
- (id)_leftToRightGradient:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5;
- (id)_outputImageWithInputSize:(CGSize)a3 outputSize:(CGSize)a4 drawBlock:(id)a5;
- (id)_placeholderCornerPathBlock;
- (id)_radialBlurImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5;
- (id)_roundedBorderWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5;
- (id)_scaledImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5;
- (id)_uberBannerImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 drawBlock:(id)a5;
- (id)_uberImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 backgroundColor:(id)a5 drawBlock:(id)a6;
- (id)imageForColor:(id)a3;
- (id)imageForColor:(id)a3 size:(CGSize)a4;
- (id)imageForImage:(id)a3;
- (id)imagePlaceholderForColor:(id)a3;
- (int64_t)imageContentMode;
- (int64_t)imageTreatment;
- (void)_drawBordersWithImageRect:(CGRect)a3 bounds:(CGRect)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderMargins:(UIEdgeInsets)a3;
- (void)setBorderWidths:(UIEdgeInsets)a3;
- (void)setImageContentMode:(int64_t)a3;
- (void)setImagePadding:(UIEdgeInsets)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setImageTreatment:(int64_t)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShadowRadius:(double)a3;
@end

@implementation SUUIStyledImageDataConsumer

+ (BOOL)isImageCompressionEnabled
{
  if (isImageCompressionEnabled_onceToken != -1) {
    dispatch_once(&isImageCompressionEnabled_onceToken, &__block_literal_global_10);
  }
  return isImageCompressionEnabled_isImageCompressionEnabled;
}

uint64_t __56__SUUIStyledImageDataConsumer_isImageCompressionEnabled__block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue(@"SUUIImageCompressionEnabled", (CFStringRef)*MEMORY[0x263F7BDC8], 0);
  isImageCompressionEnabled_isImageCompressionEnabled = result != 0;
  return result;
}

- (SUUIStyledImageDataConsumer)init
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIStyledImageDataConsumer;
  v2 = [(SUUIStyledImageDataConsumer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_imageContentMode = 0;
    uint64_t v4 = [MEMORY[0x263F82DA0] _currentTraitCollection];
    startingTraitCollection = v3->_startingTraitCollection;
    v3->_startingTraitCollection = (UITraitCollection *)v4;
  }
  return v3;
}

- (SUUIStyledImageDataConsumer)initWithSize:(CGSize)a3 treatment:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)SUUIStyledImageDataConsumer;
  objc_super v7 = [(SUUIStyledImageDataConsumer *)&v10 init];
  if (v7)
  {
    if ((unint64_t)a4 <= 0xF && ((1 << a4) & 0x8026) != 0)
    {
      v8 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
      [(SUUIStyledImageDataConsumer *)v7 setBorderColor:v8];

      -[SUUIStyledImageDataConsumer setBorderWidths:](v7, "setBorderWidths:", 1.0, 1.0, 1.0, 1.0);
    }
    -[SUUIStyledImageDataConsumer setImageSize:](v7, "setImageSize:", width, height);
    [(SUUIStyledImageDataConsumer *)v7 setImageTreatment:a4];
    [(SUUIStyledImageDataConsumer *)v7 setImageContentMode:0];
  }
  return v7;
}

- (SUUIStyledImageDataConsumer)initWithViewElement:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStyledImageDataConsumer *)self init];
  if (!v5) {
    goto LABEL_17;
  }
  v6 = [v4 style];
  v5->_imageContentMode = [v6 fillImage] == 1;
  [v6 elementPadding];
  v5->_imagePadding.top = v7;
  v5->_imagePadding.left = v8;
  v5->_imagePadding.bottom = v9;
  v5->_imagePadding.right = v10;
  uint64_t v11 = [v6 ikBackgroundColor];
  iKBackgroundColor = v5->_iKBackgroundColor;
  v5->_iKBackgroundColor = (IKColor *)v11;

  v13 = [v6 ikBackgroundColor];
  uint64_t v14 = [v13 color];
  backgroundColor = v5->_backgroundColor;
  v5->_backgroundColor = (UIColor *)v14;

  v16 = [v6 imageTreatment];
  v5->_unint64_t imageTreatment = SUUIImageTreatmentForString(v16);

  unint64_t imageTreatment = v5->_imageTreatment;
  if (imageTreatment > 0x10) {
    goto LABEL_12;
  }
  if (((1 << imageTreatment) & 0x10026) == 0)
  {
    if (imageTreatment == 3)
    {
      p_borderWidths = &v5->_borderWidths;
      v5->_borderWidths.top = 0.0;
      v5->_borderWidths.left = 0.0;
      v5->_borderWidths.bottom = 1.0;
      double v24 = 0.0;
      goto LABEL_5;
    }
LABEL_12:
    p_borderWidths = &v5->_borderWidths;
    [v6 borderWidths];
    v5->_borderWidths.top = v36;
    v5->_borderWidths.left = v37;
    v5->_borderWidths.bottom = v38;
    goto LABEL_5;
  }
  p_borderWidths = &v5->_borderWidths;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v5->_borderWidths.top = _Q0;
  v5->_borderWidths.bottom = 1.0;
  double v24 = 1.0;
LABEL_5:
  p_borderWidths->right = v24;
  [v6 borderMargins];
  v5->_borderMargins.top = v25;
  v5->_borderMargins.left = v26;
  v5->_borderMargins.bottom = v27;
  v5->_borderMargins.right = v28;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&v5->_borderWidths.top, *MEMORY[0x263F834E8]), (int32x4_t)vceqq_f64(*(float64x2_t *)&v5->_borderWidths.bottom, *(float64x2_t *)(MEMORY[0x263F834E8] + 16)))), 0xFuLL))) & 1) == 0)
  {
    v29 = [v6 ikBorderColor];
    uint64_t v30 = [v29 color];
    borderColor = v5->_borderColor;
    v5->_borderColor = (UIColor *)v30;

    if (!v5->_borderColor)
    {
      v32 = v5->_backgroundColor;
      if (v32)
      {
        switch(SUUIColorSchemeStyleForColor(v32))
        {
          case 0:
          case 2:
            goto LABEL_9;
          case 1:
          case 3:
            v33 = (void *)MEMORY[0x263F825C8];
            double v34 = 0.15;
            double v35 = 1.0;
            goto LABEL_14;
          default:
            break;
        }
      }
      else
      {
LABEL_9:
        v33 = (void *)MEMORY[0x263F825C8];
        double v34 = 0.2;
        double v35 = 0.0;
LABEL_14:
        uint64_t v39 = [v33 colorWithWhite:v35 alpha:v34];
        v40 = v5->_borderColor;
        v5->_borderColor = (UIColor *)v39;
      }
    }
    v41 = [v6 borderRadius];
    [v41 edgeInsetsValue];
    v5->_borderRadii.top = v42;
    v5->_borderRadii.left = v43;
    v5->_borderRadii.bottom = v44;
    v5->_borderRadii.right = v45;
  }
  uint64_t v46 = [v4 shadowColor];
  shadowColor = v5->_shadowColor;
  v5->_shadowColor = (UIColor *)v46;

  [v4 shadowOffset];
  v5->_shadowOffset.double width = v48;
  v5->_shadowOffset.double height = v49;
  [v4 shadowRadius];
  v5->_shadowRadius = v50;

LABEL_17:
  return v5;
}

- (id)imageForColor:(id)a3
{
  return -[SUUIStyledImageDataConsumer imageForColor:size:](self, "imageForColor:size:", a3, self->_imageSize.width, self->_imageSize.height);
}

- (id)imageForColor:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  CGFloat v8 = v7;
  if (width < 0.00000011920929 || height < 0.00000011920929)
  {
    CGFloat v10 = 0;
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__SUUIStyledImageDataConsumer_imageForColor_size___block_invoke;
    v12[3] = &unk_265402AA0;
    id v13 = v7;
    uint64_t v14 = self;
    CGFloat v10 = -[SUUIStyledImageDataConsumer _outputImageWithInputSize:outputSize:drawBlock:](self, "_outputImageWithInputSize:outputSize:drawBlock:", v12, width, height, width, height);
  }
  return v10;
}

void __50__SUUIStyledImageDataConsumer_imageForColor_size___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 32) set];
  }
  else
  {
    CGFloat v9 = [*(id *)(a1 + 40) _defaultPlaceholderColor];
    [v9 set];
  }
  double v10 = a2;
  double v11 = a3;
  double v12 = a4;
  double v13 = a5;
  UIRectFill(*(CGRect *)&v10);
}

- (id)imageForImage:(id)a3
{
  id v4 = a3;
  [v4 size];
  double v6 = v5;
  double v8 = v7;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __45__SUUIStyledImageDataConsumer_imageForImage___block_invoke;
  v14[3] = &unk_265401428;
  id v15 = v4;
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  id v11 = v4;
  double v12 = -[SUUIStyledImageDataConsumer _outputImageWithInputSize:outputSize:drawBlock:](self, "_outputImageWithInputSize:outputSize:drawBlock:", v14, v6, v8, width, height);

  return v12;
}

uint64_t __45__SUUIStyledImageDataConsumer_imageForImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:");
}

- (BOOL)isImagePlaceholderAvailable
{
  unint64_t imageTreatment = self->_imageTreatment;
  if (imageTreatment > 0x10) {
    return 0;
  }
  if (((1 << imageTreatment) & 0x1CD06) != 0) {
    return 1;
  }
  if (((1 << imageTreatment) & 0xA9) == 0) {
    return 0;
  }
  double top = self->_borderWidths.top;
  double left = self->_borderWidths.left;
  BOOL v6 = left == self->_borderWidths.right;
  if (top != self->_borderWidths.bottom) {
    BOOL v6 = 0;
  }
  return left == top && v6;
}

- (id)imagePlaceholderForColor:(id)a3
{
  id v4 = (UIColor *)a3;
  if (!v4)
  {
    id v4 = [(SUUIStyledImageDataConsumer *)self _defaultPlaceholderColor];
  }
  double v5 = 0;
  switch(self->_imageTreatment)
  {
    case 0:
    case 3:
    case 5:
    case 7:
      double top = self->_borderWidths.top;
      double left = self->_borderWidths.left;
      if (left == self->_borderWidths.right && top == self->_borderWidths.bottom && left == top)
      {
        v18 = [SUUIImagePlaceholder alloc];
        borderColor = self->_borderColor;
        double v20 = self->_borderWidths.left;
        v21 = v4;
        goto LABEL_16;
      }
      double v5 = 0;
      break;
    case 1:
    case 2:
    case 0xALL:
    case 0xBLL:
    case 0xFLL:
    case 0x10:
      BOOL v6 = [SUUIImagePlaceholder alloc];
      double v7 = self->_borderColor;
      CGFloat v8 = self->_borderWidths.top;
      CGFloat v9 = [(SUUIStyledImageDataConsumer *)self _placeholderCornerPathBlock];
      double v10 = v6;
      id v11 = v4;
      double v12 = v7;
      double v13 = v8;
      goto LABEL_5;
    case 8:
      v18 = [SUUIImagePlaceholder alloc];
      double v20 = 0.0;
      v21 = v4;
      borderColor = 0;
LABEL_16:
      double v5 = [(SUUIImagePlaceholder *)v18 initWithBackgroundColor:v21 borderColor:borderColor borderWidth:v20 cornerRadius:0.0];
      break;
    case 0xELL:
      v23 = [SUUIImagePlaceholder alloc];
      double v24 = self->_borderColor;
      CGFloat v9 = [(SUUIStyledImageDataConsumer *)self _placeholderCornerPathBlock];
      double v13 = 0.0;
      double v10 = v23;
      id v11 = v24;
      double v12 = 0;
LABEL_5:
      double v5 = [(SUUIImagePlaceholder *)v10 initWithBackgroundColor:v11 borderColor:v12 borderWidth:v9 cornerPathBlock:v13];

      break;
    default:
      break;
  }

  return v5;
}

- (id)_placeholderCornerPathBlock
{
  v3 = 0;
  switch(self->_imageTreatment)
  {
    case 1:
      v3 = &__block_literal_global_7;
      break;
    case 2:
      v3 = &__block_literal_global_10;
      break;
    case 0xALL:
    case 0xBLL:
      v3 = &__block_literal_global_12;
      break;
    case 0xELL:
      CGFloat top = self->_borderRadii.top;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__SUUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_4;
      aBlock[3] = &__block_descriptor_40_e53___UIBezierPath_40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
      *(CGFloat *)&aBlock[4] = top;
      v3 = _Block_copy(aBlock);
      break;
    case 0xFLL:
      v3 = &__block_literal_global_14;
      break;
    case 0x10:
      v3 = &__block_literal_global_16;
      break;
    default:
      break;
  }
  return v3;
}

uint64_t __58__SUUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke(double a1, double a2, double a3, double a4)
{
  if (a4 >= a3) {
    double v4 = a4;
  }
  else {
    double v4 = a3;
  }
  return objc_msgSend(MEMORY[0x263F824C0], "_bezierPathWithArcRoundedRect:cornerRadius:", a1, a2, a3, a4, v4 / 57.0 * 13.5);
}

uint64_t __58__SUUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_2(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x263F824C0], "_bezierPathWithArcRoundedRect:cornerRadius:", a1, a2, a3, a4, 10.0);
}

uint64_t __58__SUUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_3()
{
  return objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:");
}

uint64_t __58__SUUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_4(uint64_t a1, double a2, double a3, double a4, double a5)
{
  return objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", a2, a3, a4, a5, *(double *)(a1 + 32));
}

uint64_t __58__SUUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_5(double a1, double a2, double a3, double a4)
{
  double v8 = CGRectGetHeight(*(CGRect *)&a1) * 0.5;
  CGFloat v9 = (void *)MEMORY[0x263F824C0];
  return objc_msgSend(v9, "_bezierPathWithArcRoundedRect:cornerRadius:", a1, a2, a3, a4, v8);
}

uint64_t __58__SUUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_6(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x263F824C0], "_bezierPathWithArcRoundedRect:cornerRadius:", a1, a2, a3, a4, 6.0);
}

- (BOOL)_backgroundIsOpaque
{
  backgroundColor = self->_backgroundColor;
  if (backgroundColor) {
    LOBYTE(backgroundColor) = CGColorGetAlpha([(UIColor *)backgroundColor CGColor]) == 1.0;
  }
  return (char)backgroundColor;
}

- (id)_defaultPlaceholderColor
{
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    switch(SUUIColorSchemeStyleForColor(backgroundColor))
    {
      case 0:
      case 2:
        double v4 = self->_backgroundColor;
        float v5 = -0.2;
        goto LABEL_6;
      case 1:
      case 3:
        double v4 = self->_backgroundColor;
        float v5 = 0.15;
LABEL_6:
        BOOL v6 = SUUIColorByAdjustingBrightness(v4, v5);
        break;
      default:
        BOOL v6 = 0;
        break;
    }
  }
  else
  {
    BOOL v6 = [MEMORY[0x263F825C8] colorWithWhite:0.85 alpha:1.0];
  }
  return v6;
}

- (void)_drawBordersWithImageRect:(CGRect)a3 bounds:(CGRect)a4
{
  borderColor = self->_borderColor;
  if (borderColor)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    double v10 = a3.size.height;
    double v11 = a3.size.width;
    double v12 = a3.origin.y;
    double v13 = a3.origin.x;
    [(UIColor *)borderColor set];
    if (x >= v13) {
      double v14 = x;
    }
    else {
      double v14 = v13;
    }
    double rect = v14;
    if (y < v12) {
      double y = v12;
    }
    if (height >= v10) {
      double v15 = v10;
    }
    else {
      double v15 = height;
    }
    if (width >= v11) {
      double v16 = v11;
    }
    else {
      double v16 = width;
    }
    double v33 = v16;
    v17 = [MEMORY[0x263F82B60] mainScreen];
    [v17 scale];
    double v19 = v18;

    double left = self->_borderWidths.left;
    double v20 = self->_borderWidths.top / v19;
    double bottom = self->_borderWidths.bottom;
    double v22 = self->_borderWidths.right / v19;
    if (v20 > 0.00000011920929)
    {
      v36.size.double width = v33;
      v36.origin.double x = rect;
      v36.origin.double y = y;
      v36.size.double height = self->_borderWidths.top / v19;
      UIRectFillUsingBlendMode(v36, kCGBlendModeNormal);
    }
    double v23 = y + v20;
    double v24 = v15;
    double v25 = v15 - v20;
    double v26 = bottom / v19;
    if (v22 > 0.00000011920929)
    {
      v37.origin.double x = rect + v33 - v22;
      v37.size.double height = v25 - v26;
      v37.origin.double y = v23;
      v37.size.double width = v22;
      UIRectFillUsingBlendMode(v37, kCGBlendModeNormal);
    }
    double v27 = left / v19;
    if (v26 > 0.00000011920929)
    {
      v38.origin.double y = y + v24 - v26;
      v38.size.double width = v33;
      v38.origin.double x = rect;
      v38.size.double height = v26;
      UIRectFillUsingBlendMode(v38, kCGBlendModeNormal);
    }
    if (v27 > 0.00000011920929)
    {
      double v29 = rect;
      double v30 = v23;
      double v31 = v27;
      double v28 = v25 - v26;
      UIRectFillUsingBlendMode(*(CGRect *)&v29, kCGBlendModeNormal);
    }
  }
}

- (id)_outputImageWithInputSize:(CGSize)a3 outputSize:(CGSize)a4 drawBlock:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  double v7 = a3.height;
  double v8 = a3.width;
  id v10 = a5;
  double v11 = (void *)MEMORY[0x25A2A9B80]();
  switch(self->_imageTreatment)
  {
    case 0:
    case 3:
    case 5:
    case 7:
      double v14 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      goto LABEL_3;
    case 1:
      double v31 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      double v33 = v32;
      double v34 = v29;
      double v35 = v30;
      if (v30 >= v29) {
        double v36 = v30;
      }
      else {
        double v36 = v29;
      }
      double v37 = v36 / 57.0 * 13.5;
      goto LABEL_22;
    case 2:
      double v31 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      double v33 = v38;
      double v34 = v39;
      double v35 = v40;
      uint64_t v41 = 0x4024000000000000;
      goto LABEL_24;
    case 4:
      double v42 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      uint64_t v21 = -[SUUIStyledImageDataConsumer _leftToRightGradient:contentRect:drawBlock:](self, "_leftToRightGradient:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v42, v43, v44, v45);
      goto LABEL_27;
    case 6:
      double v46 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      double v50 = -[SUUIStyledImageDataConsumer _scaledImageWithBounds:contentRect:drawBlock:](self, "_scaledImageWithBounds:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v46, v47, v48, v49);
      double v28 = [v50 imageWithRenderingMode:2];

      break;
    case 8:
      uint64_t v21 = -[SUUIStyledImageDataConsumer _dynamicUberImageWithBounds:inputSize:drawBlock:](self, "_dynamicUberImageWithBounds:inputSize:drawBlock:", v10, 0.0, 0.0, width, height, v8, v7);
      goto LABEL_27;
    case 9:
      uint64_t v21 = -[SUUIStyledImageDataConsumer _uberBannerImageWithBounds:inputSize:drawBlock:](self, "_uberBannerImageWithBounds:inputSize:drawBlock:", v10, 0.0, 0.0, width, height, v8, v7);
      goto LABEL_27;
    case 0xALL:
    case 0xBLL:
      v88.origin.double x = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      double x = v88.origin.x;
      double y = v88.origin.y;
      double v24 = v88.size.width;
      double v25 = v88.size.height;
      double v26 = CGRectGetWidth(v88) * 0.5;
      v89.origin.double x = x;
      v89.origin.double y = y;
      v89.size.double width = v24;
      v89.size.double height = v25;
      double v27 = CGRectGetHeight(v89) * 0.5;
      if (v26 >= v27) {
        double v27 = v26;
      }
      -[SUUIStyledImageDataConsumer _arcRoundedImageWithBounds:contentRect:cornerRadius:drawBlock:](self, "_arcRoundedImageWithBounds:contentRect:cornerRadius:drawBlock:", v10, 0.0, 0.0, width, height, x, y, v24, v25, *(void *)&v27);
      goto LABEL_26;
    case 0xCLL:
      double v14 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      double v16 = v51;
      double v18 = v52;
      double v20 = v53;
      goto LABEL_19;
    case 0xDLL:
      double width = v8 + self->_imagePadding.left + self->_imagePadding.right;
      double height = v7 + self->_imagePadding.top + self->_imagePadding.bottom;
      double v14 = SUUIImageRectForBoundsAndPadding(1, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      double v16 = v54;
      double v18 = v55;
      double v20 = v56;
      if (self->_imagePadding.bottom < 0.00000011920929)
      {
LABEL_3:
        uint64_t v21 = -[SUUIStyledImageDataConsumer _scaledImageWithBounds:contentRect:drawBlock:](self, "_scaledImageWithBounds:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v14, v16, v18, v20);
      }
      else
      {
LABEL_19:
        uint64_t v21 = -[SUUIStyledImageDataConsumer _radialBlurImageWithBounds:contentRect:drawBlock:](self, "_radialBlurImageWithBounds:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v14, v16, v18, v20);
      }
      goto LABEL_27;
    case 0xELL:
      double v57 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_borderWidths.top, self->_borderWidths.left, self->_borderWidths.bottom, self->_borderWidths.right);
      uint64_t v21 = -[SUUIStyledImageDataConsumer _roundedBorderWithBounds:contentRect:drawBlock:](self, "_roundedBorderWithBounds:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v57, v58, v59, v60);
      goto LABEL_27;
    case 0xFLL:
      double v31 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      double v33 = v61;
      double v34 = v62;
      double v35 = v63;
      double v37 = v63 * 0.5;
LABEL_22:
      double v84 = v37;
      goto LABEL_25;
    case 0x10:
      double v31 = SUUIImageRectForBoundsAndPadding(self->_imageContentMode, v8, v7, 0.0, 0.0, width, height, v12, v13, self->_imagePadding.top, self->_imagePadding.left, self->_imagePadding.bottom, self->_imagePadding.right);
      double v33 = v64;
      double v34 = v65;
      double v35 = v66;
      uint64_t v41 = 0x4018000000000000;
LABEL_24:
      double v84 = *(double *)&v41;
LABEL_25:
      -[SUUIStyledImageDataConsumer _arcRoundedImageWithBounds:contentRect:cornerRadius:drawBlock:](self, "_arcRoundedImageWithBounds:contentRect:cornerRadius:drawBlock:", v10, 0.0, 0.0, width, height, v31, v33, v34, v35, *(void *)&v84);
      uint64_t v21 = LABEL_26:;
LABEL_27:
      double v28 = (void *)v21;
      break;
    default:
      double v28 = 0;
      break;
  }
  p_shadowOffset = &self->_shadowOffset;
  if (self->_shadowOffset.width != *MEMORY[0x263F001B0]
    || self->_shadowOffset.height != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    [v28 size];
    CGFloat v70 = v69 + (fabs(p_shadowOffset->width) + self->_shadowRadius) * 2.0;
    [v28 size];
    double shadowRadius = self->_shadowRadius;
    double v72 = fabs(self->_shadowOffset.height) + shadowRadius;
    CGFloat v74 = v73 + v72 * 2.0;
    double v75 = shadowRadius + fabs(p_shadowOffset->width);
    v76 = [MEMORY[0x263F82B60] mainScreen];
    [v76 scale];
    CGFloat v78 = v77;
    v86.double width = v70;
    v86.double height = v74;
    UIGraphicsBeginImageContextWithOptions(v86, 0, v78);

    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(CurrentContext, kCGBlendModeMultiply);
    double v80 = self->_shadowRadius;
    v81 = [(UIColor *)self->_shadowColor CGColor];
    v87.double width = p_shadowOffset->width;
    v87.double height = self->_shadowOffset.height;
    CGContextSetShadowWithColor(CurrentContext, v87, v80, v81);
    objc_msgSend(v28, "drawAtPoint:", v75, v72);
    uint64_t v82 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    double v28 = (void *)v82;
  }

  return v28;
}

- (id)_imageWithSize:(CGSize)a3 isOpaque:(BOOL)a4 drawBlock:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v8 = (void (**)(id, uint64_t))a5;
  CGFloat v9 = [MEMORY[0x263F82B60] mainScreen];
  [v9 scale];
  CGFloat v11 = v10;

  v17.CGFloat width = width;
  v17.CGFloat height = height;
  UIGraphicsBeginImageContextWithOptions(v17, a4, v11);
  if (+[SUUIStyledImageDataConsumer isImageCompressionEnabled])
  {
    uint64_t HasASTCSupport = SUUIGraphicsDeviceHasASTCSupport();
    v8[2](v8, HasASTCSupport);
    if (HasASTCSupport)
    {
      uint64_t v13 = SUUIGraphicsGetASTCImageFromCurrentImageContext(v11);
      goto LABEL_6;
    }
  }
  else
  {
    v8[2](v8, 0);
  }
  uint64_t v13 = UIGraphicsGetImageFromCurrentImageContext();
LABEL_6:
  double v14 = (void *)v13;
  UIGraphicsEndImageContext();

  return v14;
}

- (id)_arcRoundedImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 cornerRadius:(double)a5 drawBlock:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v10 = a3.size.height;
  double v11 = a3.size.width;
  id v13 = a6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __93__SUUIStyledImageDataConsumer__arcRoundedImageWithBounds_contentRect_cornerRadius_drawBlock___block_invoke;
  v18[3] = &unk_265402B08;
  CGFloat v20 = x;
  CGFloat v21 = y;
  CGFloat v22 = width;
  CGFloat v23 = height;
  double v24 = a5;
  id v14 = v13;
  v18[4] = self;
  id v19 = v14;
  double v15 = -[SUUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", 0, v18, v11, v10);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v15;
    [v16 setCornerRadius:a5];
    [v16 setCornerType:1];
    if (self->_borderColor)
    {
      objc_msgSend(v16, "setBorderColor:");
      [v16 setBorderWidth:1.0];
    }
  }
  return v15;
}

void __93__SUUIStyledImageDataConsumer__arcRoundedImageWithBounds_contentRect_cornerRadius_drawBlock___block_invoke(uint64_t a1, char a2)
{
  objc_msgSend(MEMORY[0x263F824C0], "_bezierPathWithArcRoundedRect:cornerRadius:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setLineWidth:1.0];
  [v5 addClip];
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if ((a2 & 1) == 0)
  {
    double v4 = *(void **)(*(void *)(a1 + 32) + 64);
    if (v4)
    {
      [v4 set];
      [v5 strokeWithBlendMode:0 alpha:1.0];
    }
  }
}

- (id)_scaledImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.origin.x;
  id v14 = a5;
  BOOL v15 = [(SUUIStyledImageDataConsumer *)self _backgroundIsOpaque];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __76__SUUIStyledImageDataConsumer__scaledImageWithBounds_contentRect_drawBlock___block_invoke;
  v19[3] = &unk_265402B30;
  CGFloat v21 = v12;
  CGFloat v22 = v11;
  double v23 = v10;
  double v24 = v9;
  v19[4] = self;
  id v20 = v14;
  CGFloat v25 = x;
  CGFloat v26 = y;
  CGFloat v27 = width;
  CGFloat v28 = height;
  id v16 = v14;
  CGSize v17 = -[SUUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v15, v19, v10, v9);

  return v17;
}

uint64_t __76__SUUIStyledImageDataConsumer__scaledImageWithBounds_contentRect_drawBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    [v2 set];
    UIRectFill(*(CGRect *)(a1 + 48));
  }
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  v3 = *(void **)(a1 + 32);
  double v4 = *(double *)(a1 + 80);
  double v5 = *(double *)(a1 + 88);
  double v6 = *(double *)(a1 + 96);
  double v7 = *(double *)(a1 + 104);
  double v8 = *(double *)(a1 + 48);
  double v9 = *(double *)(a1 + 56);
  double v10 = *(double *)(a1 + 64);
  double v11 = *(double *)(a1 + 72);
  return objc_msgSend(v3, "_drawBordersWithImageRect:bounds:", v4, v5, v6, v7, v8, v9, v10, v11);
}

- (id)_radialBlurImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.origin.x;
  id v14 = a5;
  BOOL v15 = [(SUUIStyledImageDataConsumer *)self _backgroundIsOpaque];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __80__SUUIStyledImageDataConsumer__radialBlurImageWithBounds_contentRect_drawBlock___block_invoke;
  v19[3] = &unk_265402B30;
  CGFloat v21 = v12;
  CGFloat v22 = v11;
  double v23 = v10;
  double v24 = v9;
  v19[4] = self;
  id v20 = v14;
  CGFloat v25 = x;
  CGFloat v26 = y;
  CGFloat v27 = width;
  CGFloat v28 = height;
  id v16 = v14;
  CGSize v17 = -[SUUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v15, v19, v10, v9);

  return v17;
}

void __80__SUUIStyledImageDataConsumer__radialBlurImageWithBounds_contentRect_drawBlock___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    [v2 set];
    UIRectFill(*(CGRect *)(a1 + 48));
  }
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  v3 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v3)
  {
    long long v37 = 0u;
    memset(v38, 0, 48);
    __asm { FMOV            V0.2D, #1.0 }
    v38[3] = _Q0;
    [v3 getRed:&v37 green:(char *)&v37 + 8 blue:v38 alpha:0];
    *(_OWORD *)((char *)&v38[1] + 8) = v37;
    *((void *)&v38[2] + 1) = *(void *)&v38[0];
    double v10 = *(double *)(a1 + 64);
    double v9 = *(double *)(a1 + 72);
    *(_OWORD *)locations = xmmword_2568A0DD8;
    uint64_t v36 = 0x3FF0000000000000;
    *(_OWORD *)components = v37;
    components[2] = *(CGFloat *)v38;
    components[3] = 0.0;
    long long v29 = v37;
    uint64_t v30 = *(void *)&v38[0];
    uint64_t v31 = 0x3FE3333340000000;
    long long v32 = v37;
    uint64_t v33 = *(void *)&v38[0];
    uint64_t v34 = 0x3FF0000000000000;
    CurrentContext = UIGraphicsGetCurrentContext();
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    id v13 = CGGradientCreateWithColorComponents(DeviceRGB, components, locations, 3uLL);
    float v14 = v10 * 0.25;
    double v15 = ceilf(v14);
    uint64_t v16 = *(void *)(a1 + 32);
    CGSize v17 = (float64x2_t *)(v16 + 200);
    double v18 = (float64x2_t *)(v16 + 168);
    float64x2_t v19 = *(float64x2_t *)(MEMORY[0x263F834E8] + 16);
    double v20 = -0.0;
    if (vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*v17, *MEMORY[0x263F834E8]), (int32x4_t)vceqq_f64(v17[1], v19))), 0xFuLL)), (int8x8_t)0x8000400020001)) != 15)double v20 = v17[1].f64[0]; {
    double v21 = v20 + v15;
    }
    double v22 = 0.0;
    if (vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*v18, *MEMORY[0x263F834E8]), (int32x4_t)vceqq_f64(v18[1], v19))), 0xFuLL)), (int8x8_t)0x8000400020001)) != 15)double v22 = v18[1].f64[0]; {
    double v23 = v21 - v22;
    }
    float v24 = v10 * 0.5;
    v40.CGFloat x = floorf(v24);
    float v25 = v10 * 1.70000005;
    CGFloat v26 = ceilf(v25);
    float v27 = v10 * 1.89999998;
    v40.CGFloat y = v9 - v26 - v23;
    CGContextDrawRadialGradient(CurrentContext, v13, v40, v26, v40, ceilf(v27), 2u);
    CGColorSpaceRelease(DeviceRGB);
    CGGradientRelease(v13);
  }
}

- (id)_roundedBorderWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.origin.x;
  id v14 = a5;
  BOOL v15 = [(SUUIStyledImageDataConsumer *)self _backgroundIsOpaque];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __78__SUUIStyledImageDataConsumer__roundedBorderWithBounds_contentRect_drawBlock___block_invoke;
  v19[3] = &unk_265402B30;
  CGFloat v21 = v12;
  CGFloat v22 = v11;
  double v23 = v10;
  double v24 = v9;
  CGFloat v25 = x;
  CGFloat v26 = y;
  CGFloat v27 = width;
  CGFloat v28 = height;
  v19[4] = self;
  id v20 = v14;
  id v16 = v14;
  CGSize v17 = -[SUUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v15, v19, v10, v9);

  return v17;
}

void __78__SUUIStyledImageDataConsumer__roundedBorderWithBounds_contentRect_drawBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(*(void *)(a1 + 32) + 8));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 64) setFill];
  [v8 fill];
  double Width = CGRectGetWidth(*(CGRect *)(a1 + 48));
  double v3 = floor((Width - CGRectGetWidth(*(CGRect *)(a1 + 80))) * 0.5);
  double Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
  double v5 = floor((Height - CGRectGetHeight(*(CGRect *)(a1 + 80))) * 0.5);
  double v6 = CGRectGetWidth(*(CGRect *)(a1 + 80));
  CGFloat v7 = CGRectGetHeight(*(CGRect *)(a1 + 80));
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(v3, v5, v6, v7);
}

- (id)_uberBannerImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 drawBlock:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  double v7 = a3.size.height;
  double v8 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v12 = a5;
  BOOL v13 = [(SUUIStyledImageDataConsumer *)self _backgroundIsOpaque];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __78__SUUIStyledImageDataConsumer__uberBannerImageWithBounds_inputSize_drawBlock___block_invoke;
  v17[3] = &unk_265402B58;
  CGFloat v19 = x;
  CGFloat v20 = y;
  double v21 = v8;
  double v22 = v7;
  CGFloat v23 = width;
  CGFloat v24 = height;
  v17[4] = self;
  id v18 = v12;
  id v14 = v12;
  BOOL v15 = -[SUUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v13, v17, v8, v7);

  return v15;
}

uint64_t __78__SUUIStyledImageDataConsumer__uberBannerImageWithBounds_inputSize_drawBlock___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    [v2 set];
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextFillRect(CurrentContext, *(CGRect *)(a1 + 48));
    double v5 = *(double *)(a1 + 80);
    double v4 = *(double *)(a1 + 88);
    double v6 = *(double *)(a1 + 72);
    if (*(void *)(*(void *)(a1 + 32) + 56))
    {
      *(_OWORD *)locations = xmmword_2568A0CA0;
      memset(v19, 0, sizeof(v19));
      uint64_t v20 = 0;
      uint64_t v21 = 0x3FF0000000000000;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      double v8 = CGGradientCreateWithColorComponents(DeviceRGB, (const CGFloat *)v19, locations, 2uLL);
      CGColorSpaceRelease(DeviceRGB);
      double MidX = CGRectGetMidX(*(CGRect *)(a1 + 48));
      CGFloat v10 = MidX + CGRectGetWidth(*(CGRect *)(a1 + 48)) * -0.25;
      CGFloat v11 = CGRectGetMidY(*(CGRect *)(a1 + 48)) + 40.0;
      float v12 = *(double *)(a1 + 64) * 0.9;
      BOOL v13 = UIGraphicsGetCurrentContext();
      v24.CGFloat x = v10;
      v24.CGFloat y = v11;
      v25.CGFloat x = v10;
      v25.CGFloat y = v11;
      CGContextDrawRadialGradient(v13, v8, v24, 0.0, v25, v12, 2u);
      CGGradientRelease(v8);
    }
  }
  else
  {
    double v5 = *(double *)(a1 + 80);
    double v4 = *(double *)(a1 + 88);
    double v6 = *(double *)(a1 + 72);
  }
  double v14 = (double)(int)(v6 + -8.0 + -8.0);
  float v15 = (v6 - v14) * 0.5;
  double v16 = floorf(v15);
  float v17 = v5 * (v14 / v4);
  return (*(uint64_t (**)(double, double, double))(*(void *)(a1 + 40) + 16))(15.0, v16, ceilf(v17));
}

- (id)_dynamicUberImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 drawBlock:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  double v7 = a3.size.height;
  double v8 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v35[2] = *MEMORY[0x263EF8340];
  id v12 = a5;
  BOOL v13 = objc_msgSend(MEMORY[0x263F82DA0], "traitCollectionWithUserInterfaceLevel:", -[UITraitCollection userInterfaceLevel](self->_startingTraitCollection, "userInterfaceLevel"));
  double v14 = (void *)MEMORY[0x263F82DA0];
  v35[0] = v13;
  float v15 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:1];
  v35[1] = v15;
  double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
  float v17 = [v14 traitCollectionWithTraitsFromCollections:v16];

  id v18 = (void *)MEMORY[0x263F82DA0];
  v34[0] = v13;
  CGFloat v19 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:2];
  v34[1] = v19;
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
  uint64_t v21 = [v18 traitCollectionWithTraitsFromCollections:v20];

  double v22 = [(UIColor *)self->_backgroundColor resolvedColorWithTraitCollection:v17];
  uint64_t v23 = -[SUUIStyledImageDataConsumer _uberImageWithBounds:inputSize:backgroundColor:drawBlock:](self, "_uberImageWithBounds:inputSize:backgroundColor:drawBlock:", v22, v12, x, y, v8, v7, width, height);
  CGPoint v24 = [(UIColor *)self->_backgroundColor resolvedColorWithTraitCollection:v21];
  if ([v24 isEqual:v22])
  {
    id v25 = v23;
  }
  else
  {
    id v25 = objc_alloc_init(MEMORY[0x263F827E8]);
    CGFloat v26 = -[SUUIStyledImageDataConsumer _uberImageWithBounds:inputSize:backgroundColor:drawBlock:](self, "_uberImageWithBounds:inputSize:backgroundColor:drawBlock:", v24, v12, x, y, v8, v7, width, height);
    [v25 imageAsset];
    uint64_t v33 = v17;
    v28 = id v27 = v12;
    long long v29 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:1];
    [v28 registerImage:v23 withTraitCollection:v29];

    uint64_t v30 = [v25 imageAsset];
    uint64_t v31 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:2];
    [v30 registerImage:v26 withTraitCollection:v31];

    id v12 = v27;
    float v17 = v33;
  }
  return v25;
}

- (id)_uberImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 backgroundColor:(id)a5 drawBlock:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v14 = a5;
  id v15 = a6;
  BOOL v16 = [(SUUIStyledImageDataConsumer *)self _backgroundIsOpaque];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __88__SUUIStyledImageDataConsumer__uberImageWithBounds_inputSize_backgroundColor_drawBlock___block_invoke;
  v21[3] = &unk_265402B58;
  CGFloat v24 = x;
  CGFloat v25 = y;
  double v26 = v10;
  double v27 = v9;
  CGFloat v28 = width;
  CGFloat v29 = height;
  id v22 = v14;
  id v23 = v15;
  id v17 = v15;
  id v18 = v14;
  CGFloat v19 = -[SUUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v16, v21, v10, v9);

  return v19;
}

void __88__SUUIStyledImageDataConsumer__uberImageWithBounds_inputSize_backgroundColor_drawBlock___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 set];
    UIRectFill(*(CGRect *)(a1 + 48));
  }
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(a1 + 72);
  float v5 = *(double *)(a1 + 80) * (v4 / *(double *)(a1 + 88));
  double v6 = ceilf(v5);
  float v7 = (*(double *)(a1 + 64) - v6) * 0.5;
  double v8 = floorf(v7);
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(v8, v3, v6, v4);
  double v9 = *(void **)(a1 + 32);
  if (v9)
  {
    long long v18 = 0u;
    memset(v19, 0, 48);
    __asm { FMOV            V0.2D, #1.0 }
    _OWORD v19[3] = _Q0;
    [v9 getRed:&v18 green:(char *)&v18 + 8 blue:v19 alpha:0];
    *(_OWORD *)((char *)&v19[1] + 8) = v18;
    *((void *)&v19[2] + 1) = *(void *)&v19[0];
    float v15 = v4 * 0.48;
    double v16 = ceilf(v15);
    id v17 = (void *)[objc_alloc(MEMORY[0x263F82798]) initVerticalWithValues:&v18];
    v21.origin.CGFloat x = v8;
    v21.origin.CGFloat y = v3;
    v21.size.CGFloat width = v6;
    v21.size.CGFloat height = v4;
    objc_msgSend(v17, "fillRect:", v8, CGRectGetMaxY(v21) - v16, v6, v16);
  }
}

- (id)_leftToRightGradient:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.origin.x;
  id v14 = a5;
  if ([(IKColor *)self->_iKBackgroundColor colorType] == 3)
  {
    BOOL v15 = [(SUUIStyledImageDataConsumer *)self _backgroundIsOpaque];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __74__SUUIStyledImageDataConsumer__leftToRightGradient_contentRect_drawBlock___block_invoke;
    v18[3] = &unk_265402B30;
    v18[4] = self;
    CGFloat v20 = v12;
    CGFloat v21 = v11;
    double v22 = v10;
    double v23 = v9;
    id v19 = v14;
    CGFloat v24 = x;
    CGFloat v25 = y;
    CGFloat v26 = width;
    CGFloat v27 = height;
    double v16 = -[SUUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v15, v18, v10, v9);
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

void __74__SUUIStyledImageDataConsumer__leftToRightGradient_contentRect_drawBlock___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 40) color];

  if (v2)
  {
    double v3 = [*(id *)(*(void *)(a1 + 32) + 40) color];
    [v3 set];

    UIRectFill(*(CGRect *)(a1 + 48));
  }
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  __asm { FMOV            V0.2D, #1.0 }
  long long v30 = _Q0;
  double v9 = [*(id *)(*(void *)(a1 + 32) + 40) gradientColors];
  double v10 = [v9 firstObject];

  CGFloat v11 = [*(id *)(*(void *)(a1 + 32) + 40) gradientColors];
  CGFloat v12 = [v11 lastObject];

  [v10 getRed:&v26 green:(char *)&v26 + 8 blue:&v27 alpha:(char *)&v27 + 8];
  [v12 getRed:(char *)&v28 + 8 green:&v29 blue:(char *)&v29 + 8 alpha:&v30];
  CGFloat v13 = *(double *)(a1 + 64);
  *(_OWORD *)locations = xmmword_2568A0DF0;
  uint64_t v25 = 0x3FF0000000000000;
  v17[0] = v26;
  v17[1] = v27;
  uint64_t v18 = *((void *)&v28 + 1);
  long long v19 = v29;
  uint64_t v20 = v30;
  uint64_t v21 = *((void *)&v28 + 1);
  long long v22 = v29;
  uint64_t v23 = v30;
  CurrentContext = UIGraphicsGetCurrentContext();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v16 = CGGradientCreateWithColorComponents(DeviceRGB, (const CGFloat *)v17, locations, 3uLL);
  v32.CGFloat x = 0.0;
  v32.CGFloat y = 0.5;
  v33.CGFloat y = 0.5;
  v33.CGFloat x = v13;
  CGContextDrawLinearGradient(CurrentContext, v16, v32, v33, 0);
  CGColorSpaceRelease(DeviceRGB);
  CGGradientRelease(v16);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (UIEdgeInsets)borderWidths
{
  double top = self->_borderWidths.top;
  double left = self->_borderWidths.left;
  double bottom = self->_borderWidths.bottom;
  double right = self->_borderWidths.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBorderWidths:(UIEdgeInsets)a3
{
  self->_borderWidths = a3;
}

- (UIEdgeInsets)borderMargins
{
  double top = self->_borderMargins.top;
  double left = self->_borderMargins.left;
  double bottom = self->_borderMargins.bottom;
  double right = self->_borderMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBorderMargins:(UIEdgeInsets)a3
{
  self->_borderMargins = a3;
}

- (int64_t)imageContentMode
{
  return self->_imageContentMode;
}

- (void)setImageContentMode:(int64_t)a3
{
  self->_imageContentMode = a3;
}

- (UIEdgeInsets)imagePadding
{
  double top = self->_imagePadding.top;
  double left = self->_imagePadding.left;
  double bottom = self->_imagePadding.bottom;
  double right = self->_imagePadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setImagePadding:(UIEdgeInsets)a3
{
  self->_imagePadding = a3;
}

- (int64_t)imageTreatment
{
  return self->_imageTreatment;
}

- (void)setImageTreatment:(int64_t)a3
{
  self->_unint64_t imageTreatment = a3;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (CGSize)shadowOffset
{
  double width = self->_shadowOffset.width;
  double height = self->_shadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  self->_shadowOffset = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_double shadowRadius = a3;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_startingTraitCollection, 0);
  objc_storeStrong((id *)&self->_iKBackgroundColor, 0);
}

+ (id)appIconConsumerWithSize:(CGSize)a3
{
  double v3 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 1, a3.width, a3.height);
  return v3;
}

+ (id)applePackIconConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 36.0;
  if (v4 == 1) {
    double v5 = 47.0;
  }
  double v6 = objc_msgSend(a1, "appIconConsumerWithSize:", v5, v5);
  return v6;
}

+ (id)brickConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1)
  {
    double v5 = 103.0;
    double v6 = 210.0;
  }
  else
  {
    float v7 = [MEMORY[0x263F82B60] mainScreen];
    [v7 bounds];
    double v9 = v8;

    if (v9 <= 375.0)
    {
      double v10 = [MEMORY[0x263F82B60] mainScreen];
      [v10 bounds];
      double v12 = v11;

      double v5 = 100.0;
      if (v12 <= 320.0) {
        double v5 = 78.0;
      }
      double v6 = dbl_2568A1260[v12 > 320.0];
    }
    else
    {
      double v5 = 86.0;
      double v6 = 175.0;
    }
  }
  CGFloat v13 = objc_msgSend(a1, "brickConsumerWithBrickSize:", v6, v5);
  return v13;
}

+ (id)brickConsumerWithBrickSize:(CGSize)a3
{
  double v3 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 2, a3.width, a3.height);
  return v3;
}

+ (id)cardIconConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 64.0;
  if (v4 == 1) {
    double v5 = 72.0;
  }
  double v6 = objc_msgSend(a1, "appIconConsumerWithSize:", v5, v5);
  return v6;
}

+ (id)cardProductImageConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 64.0;
  if (v4 == 1) {
    double v5 = 72.0;
  }
  double v6 = objc_msgSend(a1, "productImageConsumerWithSize:", v5, v5);
  return v6;
}

+ (id)categoryIconConsumer
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", 33.0, 33.0);
}

+ (id)giftComposeProductImageConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 64.0;
  if (v4 == 1) {
    double v5 = 75.0;
  }
  double v6 = objc_msgSend(a1, "productImageConsumerWithSize:", v5, v5);
  return v6;
}

+ (id)giftResultIconConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 72.0;
  if (v4 == 1) {
    double v5 = 144.0;
  }
  double v6 = objc_msgSend(a1, "appIconConsumerWithSize:", v5, v5);
  return v6;
}

+ (id)giftResultProductImageConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 72.0;
  if (v4 == 1) {
    double v5 = 144.0;
  }
  double v6 = objc_msgSend(a1, "productImageConsumerWithSize:", v5, v5);
  return v6;
}

+ (id)giftThemeIconConsumer
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", 57.0, 57.0);
}

+ (id)giftThemeProductImageConsumer
{
  return (id)objc_msgSend(a1, "productImageConsumerWithSize:", 57.0, 57.0);
}

+ (id)gridIconConsumer
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", 75.0, 75.0);
}

+ (id)listIconConsumer
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", 64.0, 64.0);
}

+ (id)lockupIconConsumerWithSize:(int64_t)a3
{
  double v4 = SUUILockupImageSizeForLockupSize(a3, 12);
  return (id)[a1 appIconConsumerWithSize:v4];
}

+ (id)lockupProductImageConsumerWithSize:(int64_t)a3
{
  double v4 = SUUILockupImageSizeForLockupSize(a3, 12);
  return (id)[a1 productImageConsumerWithSize:v4];
}

+ (id)mixedTopChartsNewsstandConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 64.0;
  if (v4 == 1) {
    double v5 = 67.0;
  }
  double v6 = objc_msgSend(a1, "productImageConsumerWithSize:", v5, v5);
  return v6;
}

+ (id)newsstandRoomNewsstandConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  BOOL v4 = [v3 userInterfaceIdiom] == 1;

  double v5 = objc_msgSend(a1, "productImageConsumerWithSize:", dbl_2568A1D00[v4], dbl_2568A1D10[v4]);
  return v5;
}

+ (id)newsstandSwooshNewsstandConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 107.0;
  if (v4 != 1) {
    double v5 = 100.0;
  }
  double v6 = objc_msgSend(a1, "productImageConsumerWithSize:", dbl_2568A1D20[v4 == 1], v5);
  return v6;
}

+ (id)parentBundleIconConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 64.0;
  if (v4 == 1) {
    double v5 = 72.0;
  }
  double v6 = objc_msgSend(a1, "appIconConsumerWithSize:", v5, v5);
  return v6;
}

+ (id)productImageConsumerWithSize:(CGSize)a3
{
  double v3 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 5, a3.width, a3.height);
  return v3;
}

+ (id)productPageProductImageConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 100.0;
  if (v4 == 1) {
    double v5 = 170.0;
  }
  double v6 = objc_msgSend(a1, "productImageConsumerWithSize:", v5, v5);
  return v6;
}

+ (id)purchasedIconConsumer
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", 64.0, 64.0);
}

+ (id)purchasedProductImageConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 57.0;
  if (v4 == 1) {
    double v5 = 72.0;
  }
  double v6 = objc_msgSend(a1, "productImageConsumerWithSize:", v5, v5);
  return v6;
}

+ (id)roomIconConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 64.0;
  if (v4 == 1) {
    double v5 = 75.0;
  }
  double v6 = objc_msgSend(a1, "appIconConsumerWithSize:", v5, v5);
  return v6;
}

+ (id)roomProductImageConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 64.0;
  if (v4 == 1) {
    double v5 = 75.0;
  }
  double v6 = objc_msgSend(a1, "productImageConsumerWithSize:", v5, v5);
  return v6;
}

+ (id)shareSheetIconConsumer
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", 100.0, 100.0);
}

+ (id)swooshNewsstandConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 200.0;
  if (v4 != 1) {
    double v5 = 107.0;
  }
  double v6 = objc_msgSend(a1, "productImageConsumerWithSize:", dbl_2568A1D30[v4 == 1], v5);
  return v6;
}

+ (id)topChartsIconConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 64.0;
  if (v4 == 1) {
    double v5 = 75.0;
  }
  double v6 = objc_msgSend(a1, "appIconConsumerWithSize:", v5, v5);
  return v6;
}

+ (id)topChartsNewsstandConsumer
{
  double v3 = [MEMORY[0x263F82670] currentDevice];
  BOOL v4 = [v3 userInterfaceIdiom] == 1;

  double v5 = objc_msgSend(a1, "productImageConsumerWithSize:", dbl_2568A1D00[v4], dbl_2568A1D10[v4]);
  return v5;
}

+ (id)updatesIconConsumer
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", 57.0, 57.0);
}

+ (id)updatesProductImageConsumer
{
  return (id)objc_msgSend(a1, "productImageConsumerWithSize:", 57.0, 57.0);
}

+ (id)wishlistIconConsumer
{
  return (id)objc_msgSend(a1, "appIconConsumerWithSize:", 64.0, 64.0);
}

+ (id)wishlistProductImageConsumer
{
  return (id)objc_msgSend(a1, "productImageConsumerWithSize:", 64.0, 64.0);
}

+ (id)manageMessagesConsumer
{
  v2 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 15, 29.0, 22.0);
  return v2;
}

+ (id)categoriesMessagesConsumer
{
  v2 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 15, 35.0, 26.0);
  return v2;
}

+ (id)purchasedMessagesConsumer
{
  v2 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 15, 64.0, 48.0);
  return v2;
}

@end