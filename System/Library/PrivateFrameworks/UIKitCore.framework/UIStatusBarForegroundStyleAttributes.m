@interface UIStatusBarForegroundStyleAttributes
- (BOOL)_shouldUseBoldFontForStyle:(int64_t)a3;
- (BOOL)canShowBreadcrumbs;
- (BOOL)supportsShowingBuildVersion;
- (BOOL)usesVerticalLayout;
- (CGPoint)positionForMoonMaskInBounds:(CGRect)a3;
- (UIColor)tintColor;
- (UIEdgeInsets)edgeInsetsForBatteryInsides;
- (UIEdgeInsets)edgeInsetsForBluetoothBatteryInsides;
- (UIStatusBarForegroundStyleAttributes)initWithHeight:(double)a3 legibilityStyle:(int64_t)a4 tintColor:(id)a5 hasBusyBackground:(BOOL)a6;
- (UIStatusBarForegroundStyleAttributes)initWithHeight:(double)a3 legibilityStyle:(int64_t)a4 tintColor:(id)a5 hasBusyBackground:(BOOL)a6 idiom:(int64_t)a7;
- (double)_roundDimension:(double)a3;
- (double)baselineOffsetForStyle:(int64_t)a3;
- (double)batteryAccessoryMargin;
- (double)bluetoothBatteryExtraPadding;
- (double)height;
- (double)leftEdgePadding;
- (double)middlePadding;
- (double)rightEdgePadding;
- (double)scale;
- (double)shadowPadding;
- (double)sizeForMoonMaskVisible:(BOOL)a3;
- (double)standardPadding;
- (double)textOffsetForStyle:(int64_t)a3;
- (id)_batteryColorForCapacity:(int)a3 lowCapacity:(int)a4 style:(unint64_t)a5 usingTintColor:(BOOL)a6;
- (id)_cacheQueue_cachedImageNamed:(id)a3 inTempGroup:(id)a4 groupFullName:(id)a5;
- (id)_cachedImageNamed:(id)a3;
- (id)accessibilityHUDImageNamed:(id)a3;
- (id)batteryColorForCapacity:(int)a3 style:(unint64_t)a4 usingTintColor:(BOOL)a5;
- (id)bluetoothBatteryColorForCapacity:(double)a3 usingTintColor:(BOOL)a4;
- (id)bluetoothBatteryImageNameWithCapacity:(double)a3;
- (id)cachedImageNamed:(id)a3 inTempGroup:(id)a4;
- (id)cachedImageWithText:(id)a3 forWidth:(double)a4 lineBreakMode:(int64_t)a5 letterSpacing:(double)a6 textAlignment:(int64_t)a7 style:(int64_t)a8 itemType:(int)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expandedNameForImageName:(id)a3;
- (id)generateUniqueIdentifier;
- (id)imageIdWithText:(id)a3 forWidth:(double)a4 lineBreakMode:(int64_t)a5 letterSpacing:(double)a6 style:(int64_t)a7;
- (id)imageNamed:(id)a3;
- (id)imageNamed:(id)a3 withLegibilityStyle:(int64_t)a4 legibilityStrength:(double)a5;
- (id)imageWithText:(id)a3 ofItemType:(int)a4 forWidth:(double)a5 lineBreakMode:(int64_t)a6 letterSpacing:(double)a7 textAlignment:(int64_t)a8 style:(int64_t)a9 withLegibilityStyle:(int64_t)a10 legibilityStrength:(double)a11;
- (id)imageWithText:(id)a3 ofItemType:(int)a4 forWidth:(double)a5 lineBreakMode:(int64_t)a6 letterSpacing:(double)a7 textAlignment:(int64_t)a8 style:(int64_t)a9 withLegibilityStyle:(int64_t)a10 legibilityStrength:(double)a11 shouldCache:(BOOL)a12;
- (id)makeTextFontForStyle:(int64_t)a3;
- (id)shadowImageForImage:(id)a3 withIdentifier:(id)a4 forStyle:(int64_t)a5 withStrength:(double)a6;
- (id)shadowImageForImage:(id)a3 withIdentifier:(id)a4 forStyle:(int64_t)a5 withStrength:(double)a6 inTempGroup:(id)a7;
- (id)shadowImageForImage:(id)a3 withIdentifier:(id)a4 forStyle:(int64_t)a5 withStrength:(double)a6 inTempGroup:(id)a7 shouldCache:(BOOL)a8;
- (id)textFontForStyle:(int64_t)a3;
- (id)textForNetworkType:(int)a3;
- (id)uncachedImageNamed:(id)a3;
- (id)uniqueIdentifier;
- (id)untintedImageNamed:(id)a3;
- (int64_t)activityIndicatorStyleWithSyncActivity:(BOOL)a3;
- (int64_t)idiom;
- (int64_t)legibilityStyle;
- (void)_cacheImage:(id)a3 named:(id)a4;
- (void)_cacheQueue_cacheImage:(id)a3 named:(id)a4 inTempGroup:(id)a5 groupFullName:(id)a6 tintColor:(id)a7;
- (void)_drawText:(id)a3 inRect:(CGRect)a4 withFont:(id)a5 lineBreakMode:(int64_t)a6 letterSpacing:(double)a7 textAlignment:(int64_t)a8;
- (void)cacheImage:(id)a3 named:(id)a4 inTempGroup:(id)a5;
- (void)drawBatteryInsidesWithSize:(CGSize)a3 capacity:(int)a4 style:(unint64_t)a5;
- (void)drawBatteryInsidesWithSize:(CGSize)a3 capacity:(int)a4 style:(unint64_t)a5 usingTintColor:(BOOL)a6;
- (void)drawBluetoothBatteryInsidesWithSize:(CGSize)a3 capacity:(double)a4;
- (void)drawText:(id)a3 forWidth:(double)a4 lineBreakMode:(int64_t)a5 letterSpacing:(double)a6 textAlignment:(int64_t)a7 style:(int64_t)a8 textSize:(CGSize)a9 textHeight:(double)a10;
- (void)drawTextInRect:(CGRect)a3 withColor:(id)a4 withBlock:(id)a5;
- (void)setCanShowBreadcrumbs:(BOOL)a3;
@end

@implementation UIStatusBarForegroundStyleAttributes

- (UIStatusBarForegroundStyleAttributes)initWithHeight:(double)a3 legibilityStyle:(int64_t)a4 tintColor:(id)a5 hasBusyBackground:(BOOL)a6 idiom:(int64_t)a7
{
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)UIStatusBarForegroundStyleAttributes;
  v14 = [(UIStatusBarForegroundStyleAttributes *)&v18 init];
  v15 = v14;
  if (v14)
  {
    v14->_height = a3;
    v14->_legibilityStyle = a4;
    v14->_idiom = a7;
    objc_storeStrong((id *)&v14->_tintColor, a5);
    if (v13)
    {
      v16 = +[UIColor blackColor];
      v15->_isTintColorBlack = [v13 isEqual:v16];
    }
    else
    {
      v15->_isTintColorBlack = 1;
    }
    v15->_hasBusyBackground = a6;
  }

  return v15;
}

- (UIStatusBarForegroundStyleAttributes)initWithHeight:(double)a3 legibilityStyle:(int64_t)a4 tintColor:(id)a5 hasBusyBackground:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  v11 = [(UIStatusBarForegroundStyleAttributes *)self initWithHeight:a4 legibilityStyle:v10 tintColor:v6 hasBusyBackground:_UIDeviceNativeUserInterfaceIdiom() idiom:a3];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  *((unsigned char *)v4 + 56) = self->_canShowBreadcrumbs;
  objc_storeStrong((id *)v4 + 8, self->_tintColor);
  *((void *)v4 + 1) = *(void *)&self->_height;
  *((void *)v4 + 2) = self->_legibilityStyle;
  *((void *)v4 + 3) = self->_idiom;
  uint64_t v5 = [(NSMutableDictionary *)self->_cachedFonts mutableCopy];
  BOOL v6 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = v5;

  *((unsigned char *)v4 + 40) = self->_isTintColorBlack;
  *((unsigned char *)v4 + 41) = self->_hasBusyBackground;
  uint64_t v7 = [(NSString *)self->_cachedUniqueIdentifier copy];
  v8 = (void *)*((void *)v4 + 6);
  *((void *)v4 + 6) = v7;

  return v4;
}

- (id)generateUniqueIdentifier
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  double height = self->_height;
  [(UIStatusBarForegroundStyleAttributes *)self scale];
  uint64_t v8 = v7;
  v9 = [(UIColor *)self->_tintColor styleString];
  id v10 = [v3 stringWithFormat:@"%@_%.2f%.2f_%@", v5, *(void *)&height, v8, v9];

  return v10;
}

- (id)uniqueIdentifier
{
  cachedUniqueIdentifier = self->_cachedUniqueIdentifier;
  if (!cachedUniqueIdentifier)
  {
    id v4 = [(UIStatusBarForegroundStyleAttributes *)self generateUniqueIdentifier];
    uint64_t v5 = self->_cachedUniqueIdentifier;
    self->_cachedUniqueIdentifier = v4;

    cachedUniqueIdentifier = self->_cachedUniqueIdentifier;
  }
  return cachedUniqueIdentifier;
}

- (double)height
{
  return self->_height;
}

- (int64_t)legibilityStyle
{
  return self->_legibilityStyle;
}

- (int64_t)activityIndicatorStyleWithSyncActivity:(BOOL)a3
{
  if (a3) {
    return 7;
  }
  else {
    return 6;
  }
}

- (double)batteryAccessoryMargin
{
  return 3.0;
}

- (double)_roundDimension:(double)a3
{
  [(UIStatusBarForegroundStyleAttributes *)self scale];
  double v5 = round(v4 * a3) / v4;
  double result = 1.0 / v4;
  if (result < v5) {
    return v5;
  }
  return result;
}

- (UIEdgeInsets)edgeInsetsForBatteryInsides
{
  [(UIStatusBarForegroundStyleAttributes *)self scale];
  if (v2 <= 2.5) {
    double v3 = 4.5;
  }
  else {
    double v3 = 4.33333333;
  }
  double v4 = 2.0;
  double v5 = 2.0;
  double v6 = 2.0;
  result.right = v3;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (id)_batteryColorForCapacity:(int)a3 lowCapacity:(int)a4 style:(unint64_t)a5 usingTintColor:(BOOL)a6
{
  BOOL v6 = a6;
  if ((a5 & 2) != 0)
  {
    uint64_t v9 = +[UIColor systemYellowColor];
  }
  else if (a3 <= a4)
  {
    uint64_t v9 = +[UIColor systemRedColor];
  }
  else
  {
    if ((a5 & 1) == 0)
    {
      uint64_t v8 = 0;
      goto LABEL_10;
    }
    uint64_t v9 = +[UIColor systemGreenColor];
  }
  uint64_t v8 = (void *)v9;
  if (!v9 || self->_hasBusyBackground)
  {
LABEL_10:
    if (v6)
    {
      id v10 = [(UIStatusBarForegroundStyleAttributes *)self tintColor];
      uint64_t v11 = [v10 colorWithAlphaComponent:1.0];

      uint64_t v8 = v10;
    }
    else
    {
      uint64_t v11 = +[UIColor blackColor];
    }

    uint64_t v8 = (void *)v11;
  }
  return v8;
}

- (id)batteryColorForCapacity:(int)a3 style:(unint64_t)a4 usingTintColor:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = *(void *)&a3;
  int64_t v9 = +[UIStatusBar lowBatteryLevel];
  return [(UIStatusBarForegroundStyleAttributes *)self _batteryColorForCapacity:v7 lowCapacity:v9 style:a4 usingTintColor:v5];
}

- (void)drawBatteryInsidesWithSize:(CGSize)a3 capacity:(int)a4 style:(unint64_t)a5
{
}

- (void)drawBatteryInsidesWithSize:(CGSize)a3 capacity:(int)a4 style:(unint64_t)a5 usingTintColor:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a4;
  double height = a3.height;
  double width = a3.width;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    id v13 = 0;
  }
  else {
    id v13 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSaveGState(v13);
  v14 = [(UIStatusBarForegroundStyleAttributes *)self batteryColorForCapacity:v8 style:a5 usingTintColor:v6];
  if (v6)
  {
    id v31 = v14;
    v15 = [(UIStatusBarForegroundStyleAttributes *)self tintColor];
    [v15 alphaComponent];
    uint64_t v16 = objc_msgSend(v31, "colorWithAlphaComponent:");

    v14 = (void *)v16;
  }
  id v32 = v14;
  [v14 setFill];
  [(UIStatusBarForegroundStyleAttributes *)self edgeInsetsForBatteryInsides];
  double v18 = v17 + 0.0;
  double v20 = v19 + 0.0;
  double v22 = width - (v17 + v21);
  double v24 = height - (v19 + v23);
  [(UIStatusBarForegroundStyleAttributes *)self scale];
  if (v25 <= 2.5) {
    double v26 = 1.0;
  }
  else {
    double v26 = 1.33333333;
  }
  v34.origin.x = v18;
  v34.origin.y = v20;
  v34.size.double width = v22;
  v34.size.double height = v24;
  v27 = CGPathCreateWithRoundedRect(v34, v26, v26, 0);
  if (v27)
  {
    v28 = v27;
    CGContextAddPath(v13, v27);
    CGContextClip(v13);
    CGPathRelease(v28);
  }
  double v29 = (double)(int)v8 / 100.0 * v22;
  if (v29 < 1.0) {
    double v29 = 1.0;
  }
  [(UIStatusBarForegroundStyleAttributes *)self _roundDimension:v29];
  v35.size.double width = v30;
  v35.origin.x = v18;
  v35.origin.y = v20;
  v35.size.double height = v24;
  UIRectFillUsingBlendMode(v35, kCGBlendModeNormal);
  CGContextRestoreGState(v13);
}

- (UIEdgeInsets)edgeInsetsForBluetoothBatteryInsides
{
  [(UIStatusBarForegroundStyleAttributes *)self scale];
  double v2 = 2.0;
  double v3 = 1.0;
  double v4 = 1.0;
  double v5 = 1.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)bluetoothBatteryImageNameWithCapacity:(double)a3
{
  double v5 = [(UIStatusBarForegroundStyleAttributes *)self imageNamed:@"HeadsetBatteryBG"];
  [v5 size];
  double v7 = v6;
  [(UIStatusBarForegroundStyleAttributes *)self edgeInsetsForBluetoothBatteryInsides];
  [(UIStatusBarForegroundStyleAttributes *)self _roundDimension:(v7 - (v8 + v9)) * a3];
  double v11 = v10;
  [(UIStatusBarForegroundStyleAttributes *)self scale];
  LODWORD(v13) = vcvtpd_s64_f64(v11 * v12);
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"Battery_%u_%u", v13, self->_hasBusyBackground);

  return v14;
}

- (id)bluetoothBatteryColorForCapacity:(double)a3 usingTintColor:(BOOL)a4
{
  if (a3 <= 0.266666667)
  {
    uint64_t v6 = +[UIColor systemRedColor];
  }
  else
  {
    if (a4)
    {
      double v5 = 0;
LABEL_8:
      double v7 = [(UIStatusBarForegroundStyleAttributes *)self tintColor];
      uint64_t v8 = [v7 colorWithAlphaComponent:1.0];

      double v5 = (void *)v8;
      goto LABEL_9;
    }
    uint64_t v6 = +[UIColor blackColor];
  }
  double v5 = (void *)v6;
  if (!v6 || self->_hasBusyBackground) {
    goto LABEL_8;
  }
LABEL_9:
  return v5;
}

- (void)drawBluetoothBatteryInsidesWithSize:(CGSize)a3 capacity:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  id v19 = [(UIStatusBarForegroundStyleAttributes *)self bluetoothBatteryColorForCapacity:1 usingTintColor:a4];
  [v19 set];
  double v8 = *MEMORY[0x1E4F1DAD8];
  double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(UIStatusBarForegroundStyleAttributes *)self edgeInsetsForBluetoothBatteryInsides];
  CGFloat v11 = v8 + v10;
  double v13 = v9 + v12;
  CGFloat v15 = width - (v10 + v14);
  double v17 = height - (v12 + v16);
  [(UIStatusBarForegroundStyleAttributes *)self _roundDimension:v17 * a4];
  UIRectFillUsingOperation(1, v11, v13 + v17 - v18, v15, v18);
}

- (void)_drawText:(id)a3 inRect:(CGRect)a4 withFont:(id)a5 lineBreakMode:(int64_t)a6 letterSpacing:(double)a7 textAlignment:(int64_t)a8
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (a7 != 0.0 || a8 == 0)
  {
    id v16 = a5;
    id v17 = a3;
    v20.origin.double x = x;
    v20.origin.double y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    objc_msgSend(v17, "drawAtPoint:forWidth:withFont:lineBreakMode:letterSpacing:", v16, a6, x, y, CGRectGetWidth(v20), a7);
  }
  else
  {
    objc_msgSend(a3, "drawInRect:withFont:lineBreakMode:alignment:lineSpacing:", a5, a6, a8, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
}

- (double)textOffsetForStyle:(int64_t)a3
{
  return 2.0;
}

- (void)drawText:(id)a3 forWidth:(double)a4 lineBreakMode:(int64_t)a5 letterSpacing:(double)a6 textAlignment:(int64_t)a7 style:(int64_t)a8 textSize:(CGSize)a9 textHeight:(double)a10
{
  double height = a9.height;
  double width = a9.width;
  id v19 = a3;
  CGRect v20 = [(UIStatusBarForegroundStyleAttributes *)self textFontForStyle:a8];
  [(UIStatusBarForegroundStyleAttributes *)self textOffsetForStyle:a8];
  double v22 = floor((height - a10) * 0.5) + v21 + -1.0;
  if (!a7) {
    double width = a4;
  }
  double v23 = [(UIStatusBarForegroundStyleAttributes *)self textColorForStyle:a8];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __126__UIStatusBarForegroundStyleAttributes_drawText_forWidth_lineBreakMode_letterSpacing_textAlignment_style_textSize_textHeight___block_invoke;
  v26[3] = &unk_1E5304DE0;
  v26[4] = self;
  id v27 = v19;
  id v28 = v20;
  int64_t v29 = a5;
  double v30 = a6;
  int64_t v31 = a7;
  id v24 = v20;
  id v25 = v19;
  -[UIStatusBarForegroundStyleAttributes drawTextInRect:withColor:withBlock:](self, "drawTextInRect:withColor:withBlock:", v23, v26, 0.0, v22, width, height);
}

uint64_t __126__UIStatusBarForegroundStyleAttributes_drawText_forWidth_lineBreakMode_letterSpacing_textAlignment_style_textSize_textHeight___block_invoke(double *a1, void *a2, double a3, double a4, double a5, double a6)
{
  [a2 set];
  CGFloat v11 = (void *)*((void *)a1 + 4);
  uint64_t v12 = *((void *)a1 + 5);
  uint64_t v13 = *((void *)a1 + 6);
  uint64_t v14 = *((void *)a1 + 7);
  double v15 = a1[8];
  uint64_t v16 = *((void *)a1 + 9);
  return objc_msgSend(v11, "_drawText:inRect:withFont:lineBreakMode:letterSpacing:textAlignment:", v12, v13, v14, v16, a3, a4, a5, a6, v15);
}

- (void)drawTextInRect:(CGRect)a3 withColor:(id)a4 withBlock:(id)a5
{
}

- (double)scale
{
  double v2 = +[UIScreen mainScreen];
  [v2 scale];
  double v4 = v3;

  return v4;
}

- (double)standardPadding
{
  return 6.0;
}

- (double)middlePadding
{
  return 6.0;
}

- (double)leftEdgePadding
{
  return 6.0;
}

- (double)rightEdgePadding
{
  uint64_t v2 = _UIDeviceNativeUserInterfaceIdiom();
  double result = 6.0;
  if (v2 == 1) {
    return 5.0;
  }
  return result;
}

- (double)shadowPadding
{
  return 0.0;
}

- (id)_cachedImageNamed:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy__174;
  uint64_t v16 = __Block_byref_object_dispose__174;
  id v17 = 0;
  double v5 = _cacheAccessQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__UIStatusBarForegroundStyleAttributes__cachedImageNamed___block_invoke;
  block[3] = &unk_1E52E1B98;
  id v10 = v4;
  CGFloat v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__UIStatusBarForegroundStyleAttributes__cachedImageNamed___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = [v2 uniqueIdentifier];
  uint64_t v4 = objc_msgSend(v2, "_cacheQueue_cachedImageNamed:inTempGroup:groupFullName:", v3, 0, v7);
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_cacheQueue_cachedImageNamed:(id)a3 inTempGroup:(id)a4 groupFullName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CGFloat v11 = [v8 stringByAppendingString:v10];
  if (v9)
  {
    uint64_t v12 = [(UIStatusBarForegroundStyleAttributes *)self expandedNameForImageName:v8];

    uint64_t v13 = [(UIStatusBarForegroundStyleAttributes *)self tintColor];
    uint64_t v14 = v13;
    if (v13)
    {
      double v15 = [v13 styleString];
      uint64_t v16 = [v12 stringByAppendingString:v15];

      uint64_t v12 = (void *)v16;
    }
    uint64_t v17 = [v10 stringByAppendingString:v9];

    CGFloat v11 = v12;
    id v10 = (id)v17;
  }
  CGFloat v18 = +[UIStatusBarCache sharedInstance];
  [(UIStatusBarForegroundStyleAttributes *)self scale];
  id v19 = objc_msgSend(v18, "imageNamed:forGroup:withScale:", v11, v10);

  return v19;
}

- (id)cachedImageNamed:(id)a3 inTempGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  CGFloat v18 = &v17;
  uint64_t v19 = 0x3032000000;
  CGRect v20 = __Block_byref_object_copy__174;
  double v21 = __Block_byref_object_dispose__174;
  id v22 = 0;
  id v8 = _cacheAccessQueue();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__UIStatusBarForegroundStyleAttributes_cachedImageNamed_inTempGroup___block_invoke;
  v13[3] = &unk_1E52E9B00;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __69__UIStatusBarForegroundStyleAttributes_cachedImageNamed_inTempGroup___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v8 = [v2 uniqueIdentifier];
  uint64_t v5 = objc_msgSend(v2, "_cacheQueue_cachedImageNamed:inTempGroup:groupFullName:", v3, v4, v8);
  uint64_t v6 = *(void *)(a1[7] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)_cacheImage:(id)a3 named:(id)a4
{
}

- (void)_cacheQueue_cacheImage:(id)a3 named:(id)a4 inTempGroup:(id)a5 groupFullName:(id)a6 tintColor:(id)a7
{
  id v23 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  uint64_t v16 = [v23 stringByAppendingString:v13];
  if (v12)
  {
    uint64_t v17 = [(UIStatusBarForegroundStyleAttributes *)self expandedNameForImageName:v23];

    if (v14)
    {
      CGFloat v18 = [v14 styleString];
      uint64_t v19 = [v17 stringByAppendingString:v18];

      uint64_t v17 = (void *)v19;
    }
    uint64_t v20 = [v13 stringByAppendingString:v12];

    double v21 = +[UIStatusBarCache sharedInstance];
    [v21 removeImagesInGroup:v20];

    id v13 = (id)v20;
    uint64_t v16 = v17;
  }
  id v22 = +[UIStatusBarCache sharedInstance];
  [v22 cacheImage:v15 named:v16 forGroup:v13];
}

- (void)cacheImage:(id)a3 named:(id)a4 inTempGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _cacheAccessQueue();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__UIStatusBarForegroundStyleAttributes_cacheImage_named_inTempGroup___block_invoke;
  v15[3] = &unk_1E52DD450;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __69__UIStatusBarForegroundStyleAttributes_cacheImage_named_inTempGroup___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = [v2 uniqueIdentifier];
  uint64_t v6 = [*(id *)(a1 + 32) tintColor];
  objc_msgSend(v2, "_cacheQueue_cacheImage:named:inTempGroup:groupFullName:tintColor:", v3, v4, v5, v7, v6);
}

- (id)uncachedImageNamed:(id)a3
{
  uint64_t v4 = [(UIStatusBarForegroundStyleAttributes *)self expandedNameForImageName:a3];
  uint64_t v5 = [v4 stringByAppendingString:@".png"];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__UIStatusBarForegroundStyleAttributes_uncachedImageNamed___block_invoke;
  v9[3] = &unk_1E52F18A8;
  v9[4] = self;
  uint64_t v6 = +[UITraitCollection traitCollectionWithTraits:v9];
  id v7 = +[UIImage _kitImageNamed:v5 withTrait:v6];

  return v7;
}

void __59__UIStatusBarForegroundStyleAttributes_uncachedImageNamed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 scale];
  objc_msgSend(v4, "setDisplayScale:");
  objc_msgSend(v4, "setUserInterfaceIdiom:", objc_msgSend(*(id *)(a1 + 32), "idiom"));
}

- (id)untintedImageNamed:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(UIStatusBarForegroundStyleAttributes *)self expandedNameForImageName:v4];
    uint64_t v6 = [(UIStatusBarForegroundStyleAttributes *)self _cachedImageNamed:v5];
    if (!v6)
    {
      id v7 = [(UIStatusBarForegroundStyleAttributes *)self uncachedImageNamed:v4];
      [v7 size];
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      [(UIStatusBarForegroundStyleAttributes *)self scale];
      _UIGraphicsBeginImageContextWithOptions(0, 0, v9, v11, v12);
      objc_msgSend(v7, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      uint64_t v6 = _UIGraphicsGetImageFromCurrentImageContext(0);
      UIGraphicsEndImageContext();
      [(UIStatusBarForegroundStyleAttributes *)self _cacheImage:v6 named:v5];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)imageNamed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIStatusBarForegroundStyleAttributes *)self tintColor];
  if (v5)
  {
    uint64_t v6 = [(UIStatusBarForegroundStyleAttributes *)self expandedNameForImageName:v4];
    id v7 = [v5 styleString];
    double v8 = [v6 stringByAppendingString:v7];

    CGFloat v9 = [(UIStatusBarForegroundStyleAttributes *)self _cachedImageNamed:v8];
    if (v9) {
      goto LABEL_8;
    }
  }
  else
  {
    double v8 = 0;
  }
  double v10 = [(UIStatusBarForegroundStyleAttributes *)self untintedImageNamed:v4];
  CGFloat v9 = v10;
  if (v5 && v10)
  {
    uint64_t v11 = [v10 _flatImageWithColor:v5];

    [(UIStatusBarForegroundStyleAttributes *)self _cacheImage:v11 named:v8];
    CGFloat v9 = (void *)v11;
  }
LABEL_8:

  return v9;
}

- (id)accessibilityHUDImageNamed:(id)a3
{
  uint64_t v3 = [@"Black_" stringByAppendingString:a3];
  id v4 = [v3 stringByAppendingString:@".png"];

  uint64_t v5 = +[UIImage kitImageNamed:v4];

  return v5;
}

- (id)imageNamed:(id)a3 withLegibilityStyle:(int64_t)a4 legibilityStrength:(double)a5
{
  BOOL isTintColorBlack = self->_isTintColorBlack;
  id v9 = a3;
  if (isTintColorBlack) {
    [(UIStatusBarForegroundStyleAttributes *)self untintedImageNamed:v9];
  }
  else {
  double v10 = [(UIStatusBarForegroundStyleAttributes *)self imageNamed:v9];
  }
  uint64_t v11 = [(UIStatusBarForegroundStyleAttributes *)self expandedNameForImageName:v9];

  double v12 = [(UIStatusBarForegroundStyleAttributes *)self shadowImageForImage:v10 withIdentifier:v11 forStyle:a4 withStrength:a5];

  id v13 = +[_UILegibilityImageSet imageFromImage:v10 withShadowImage:v12];

  return v13;
}

- (id)shadowImageForImage:(id)a3 withIdentifier:(id)a4 forStyle:(int64_t)a5 withStrength:(double)a6
{
  return [(UIStatusBarForegroundStyleAttributes *)self shadowImageForImage:a3 withIdentifier:a4 forStyle:a5 withStrength:0 inTempGroup:a6];
}

- (id)shadowImageForImage:(id)a3 withIdentifier:(id)a4 forStyle:(int64_t)a5 withStrength:(double)a6 inTempGroup:(id)a7
{
  return [(UIStatusBarForegroundStyleAttributes *)self shadowImageForImage:a3 withIdentifier:a4 forStyle:a5 withStrength:a7 inTempGroup:1 shouldCache:a6];
}

- (id)shadowImageForImage:(id)a3 withIdentifier:(id)a4 forStyle:(int64_t)a5 withStrength:(double)a6 inTempGroup:(id)a7 shouldCache:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a7;
  id v16 = 0;
  if (v14 && a5)
  {
    id v17 = [NSString stringWithFormat:@"shadow_%@_%d_%.2f", a4, a5, *(void *)&a6];
    if (!v8
      || ([(UIStatusBarForegroundStyleAttributes *)self cachedImageNamed:v17 inTempGroup:v15], (id v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v18 = [[_UILegibilitySettings alloc] initWithStyle:a5];
      id v16 = [v14 _imageForLegibilitySettings:v18 strength:a6];
      if (v16) {
        BOOL v19 = !v8;
      }
      else {
        BOOL v19 = 1;
      }
      if (!v19) {
        [(UIStatusBarForegroundStyleAttributes *)self cacheImage:v16 named:v17 inTempGroup:v15];
      }
    }
  }

  return v16;
}

- (id)imageIdWithText:(id)a3 forWidth:(double)a4 lineBreakMode:(int64_t)a5 letterSpacing:(double)a6 style:(int64_t)a7
{
  double v12 = NSString;
  id v13 = [(UIStatusBarForegroundStyleAttributes *)self expandedNameForImageName:a3];
  id v14 = [(UIStatusBarForegroundStyleAttributes *)self textColorForStyle:a7];
  id v15 = [v14 styleString];
  int64_t v16 = [(UIStatusBarForegroundStyleAttributes *)self idiom];
  [(UIStatusBarForegroundStyleAttributes *)self scale];
  id v18 = [v12 stringWithFormat:@"%@_%d_%.2f_%d_%@_%ld-%.2f", v13, a5, *(void *)&a6, a7, v15, v16, v17];

  if (a4 != 1.79769313e308)
  {
    uint64_t v19 = [v18 stringByAppendingFormat:@"_%.2f", *(void *)&a4];

    id v18 = (void *)v19;
  }
  return v18;
}

- (id)imageWithText:(id)a3 ofItemType:(int)a4 forWidth:(double)a5 lineBreakMode:(int64_t)a6 letterSpacing:(double)a7 textAlignment:(int64_t)a8 style:(int64_t)a9 withLegibilityStyle:(int64_t)a10 legibilityStrength:(double)a11
{
  LOBYTE(v12) = 1;
  return [(UIStatusBarForegroundStyleAttributes *)self imageWithText:a3 ofItemType:*(void *)&a4 forWidth:a6 lineBreakMode:a8 letterSpacing:a9 textAlignment:a10 style:a5 withLegibilityStyle:a7 legibilityStrength:a11 shouldCache:v12];
}

- (id)imageWithText:(id)a3 ofItemType:(int)a4 forWidth:(double)a5 lineBreakMode:(int64_t)a6 letterSpacing:(double)a7 textAlignment:(int64_t)a8 style:(int64_t)a9 withLegibilityStyle:(int64_t)a10 legibilityStrength:(double)a11 shouldCache:(BOOL)a12
{
  uint64_t v19 = *(void *)&a4;
  id v21 = a3;
  if ([v21 length])
  {
    int64_t v50 = a10;
    id v22 = [(UIStatusBarForegroundStyleAttributes *)self imageIdWithText:v21 forWidth:a6 lineBreakMode:a9 letterSpacing:a5 style:a7];
    id v23 = objc_msgSend(NSString, "stringWithFormat:", @"TempText%d", v19);
    uint64_t v51 = objc_msgSend(NSString, "stringWithFormat:", @"TempTextShadow%d", v19);
    if (!a12
      || ([(UIStatusBarForegroundStyleAttributes *)self cachedImageNamed:v22 inTempGroup:v23], (id v24 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v25 = [(UIStatusBarForegroundStyleAttributes *)self textFontForStyle:a9];
      [v21 sizeWithFont:v25 forWidth:a6 lineBreakMode:a5 letterSpacing:a7];
      CGFloat v27 = v26;
      double v29 = v28;
      if ([(UIStatusBarForegroundStyleAttributes *)self usesVerticalLayout])
      {
        [(UIStatusBarForegroundStyleAttributes *)self height];
        CGFloat v27 = v30;
        CGFloat v31 = v29;
      }
      else
      {
        [(UIStatusBarForegroundStyleAttributes *)self height];
        CGFloat v31 = v33;
      }
      [(UIStatusBarForegroundStyleAttributes *)self scale];
      _UIGraphicsBeginImageContextWithOptions(0, 0, v27, v31, v34);
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1) {
        v36 = 0;
      }
      else {
        v36 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      }
      -[UIStatusBarForegroundStyleAttributes drawText:forWidth:lineBreakMode:letterSpacing:textAlignment:style:textSize:textHeight:](self, "drawText:forWidth:lineBreakMode:letterSpacing:textAlignment:style:textSize:textHeight:", v21, a6, a8, a9, a5, a7, v27, v31, v29);
      CGImageRef Image = CGBitmapContextCreateImage(v36);
      if (Image)
      {
        v38 = Image;
        [(UIStatusBarForegroundStyleAttributes *)self scale];
        CGFloat v40 = v27 * v39;
        v53.size.double height = (double)CGImageGetHeight(v38);
        v53.origin.double x = 0.0;
        v53.origin.double y = 0.0;
        v53.size.double width = v40;
        CGImageRef v41 = CGImageCreateWithImageInRect(v38, v53);
        if (v41)
        {
          CGImageRef v42 = v41;
          [(UIStatusBarForegroundStyleAttributes *)self scale];
          id v24 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v42, 0);
          CFRelease(v42);
        }
        else
        {
          id v24 = 0;
        }
        CFRelease(v38);
      }
      else
      {
        id v24 = 0;
      }
      UIGraphicsEndImageContext();
      if (a12) {
        [(UIStatusBarForegroundStyleAttributes *)self cacheImage:v24 named:v22 inTempGroup:v23];
      }
    }
    v43 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v44 = [v21 stringByTrimmingCharactersInSet:v43];
    uint64_t v45 = [v44 length];

    if (v45)
    {
      v46 = self;
      v47 = (void *)v51;
      id v32 = [(UIStatusBarForegroundStyleAttributes *)v46 shadowImageForImage:v24 withIdentifier:v22 forStyle:v50 withStrength:v51 inTempGroup:a12 shouldCache:a11];
    }
    else
    {
      id v32 = 0;
      v47 = (void *)v51;
    }
  }
  else
  {
    id v32 = 0;
    id v24 = 0;
  }
  v48 = +[_UILegibilityImageSet imageFromImage:v24 withShadowImage:v32];

  return v48;
}

- (id)cachedImageWithText:(id)a3 forWidth:(double)a4 lineBreakMode:(int64_t)a5 letterSpacing:(double)a6 textAlignment:(int64_t)a7 style:(int64_t)a8 itemType:(int)a9
{
  uint64_t v9 = *(void *)&a9;
  id v15 = a3;
  if ([v15 length])
  {
    int64_t v16 = [(UIStatusBarForegroundStyleAttributes *)self imageIdWithText:v15 forWidth:a5 lineBreakMode:a8 letterSpacing:a4 style:a6];
    uint64_t v17 = [(UIStatusBarForegroundStyleAttributes *)self _cachedImageNamed:v16];
    if (!v17)
    {
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"TempText%d", v9);
      uint64_t v17 = [(UIStatusBarForegroundStyleAttributes *)self cachedImageNamed:v16 inTempGroup:v18];
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)expandedNameForImageName:(id)a3
{
  return (id)[@"Black_" stringByAppendingString:a3];
}

- (id)textFontForStyle:(int64_t)a3
{
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  uint64_t v6 = [(NSMutableDictionary *)self->_cachedFonts objectForKeyedSubscript:v5];
  if (!v6)
  {
    uint64_t v6 = [(UIStatusBarForegroundStyleAttributes *)self makeTextFontForStyle:a3];
    if (v6)
    {
      cachedFonts = self->_cachedFonts;
      if (!cachedFonts)
      {
        BOOL v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v9 = self->_cachedFonts;
        self->_cachedFonts = v8;

        cachedFonts = self->_cachedFonts;
      }
      [(NSMutableDictionary *)cachedFonts setObject:v6 forKeyedSubscript:v5];
    }
  }

  return v6;
}

- (BOOL)_shouldUseBoldFontForStyle:(int64_t)a3
{
  if (a3 > 2) {
    return 1;
  }
  [(UIStatusBarForegroundStyleAttributes *)self scale];
  return v6 < 1.5;
}

- (id)makeTextFontForStyle:(int64_t)a3
{
  if ([(UIStatusBarForegroundStyleAttributes *)self idiom] == 1)
  {
    uint64_t v5 = [off_1E52D39B8 systemFontOfSize:12.0 weight:*(double *)off_1E52D6BF0];
  }
  else
  {
    double v6 = 12.0;
    if (a3 == 2)
    {
      [(UIStatusBarForegroundStyleAttributes *)self scale];
      if (v7 >= 1.5) {
        double v6 = 12.0;
      }
      else {
        double v6 = 13.0;
      }
    }
    if ([(UIStatusBarForegroundStyleAttributes *)self _shouldUseBoldFontForStyle:a3]) {
      [off_1E52D39B8 _opticalBoldSystemFontOfSize:v6];
    }
    else {
    uint64_t v5 = [off_1E52D39B8 _opticalSystemFontOfSize:v6];
    }
  }
  return v5;
}

- (double)baselineOffsetForStyle:(int64_t)a3
{
  uint64_t v5 = -[UIStatusBarForegroundStyleAttributes textFontForStyle:](self, "textFontForStyle:");
  [@"A" sizeWithFont:v5 forWidth:2 lineBreakMode:1.79769313e308 letterSpacing:0.0];
  double v7 = v6;
  [(UIStatusBarForegroundStyleAttributes *)self height];
  double v9 = v8;
  [(UIStatusBarForegroundStyleAttributes *)self textOffsetForStyle:a3];
  double v11 = v7 + v10 + -1.0 + floor((v9 - v7) * 0.5);
  [v5 descender];
  double v13 = v12 + v11;

  return v13;
}

- (double)bluetoothBatteryExtraPadding
{
  [(UIStatusBarForegroundStyleAttributes *)self standardPadding];
  return 1.0 - v2;
}

- (id)textForNetworkType:(int)a3
{
  uint64_t v3 = 0;
  switch(a3)
  {
    case 1:
      uint64_t v4 = @"E";
      goto LABEL_8;
    case 2:
      uint64_t v4 = @"3G";
      goto LABEL_8;
    case 3:
      uint64_t v4 = @"4G";
      goto LABEL_8;
    case 7:
      uint64_t v5 = _UIKitBundle();
      uint64_t v3 = [v5 localizedStringForKey:@"1x[statusBarDataNetwork]" value:@"1x" table:@"Localizable"];

      break;
    case 8:
      uint64_t v4 = @"5GE";
      double v6 = @"5G   ";
      goto LABEL_9;
    case 9:
      uint64_t v4 = @"LTE-A";
      goto LABEL_8;
    case 10:
      uint64_t v4 = @"LTE+";
LABEL_8:
      double v6 = v4;
LABEL_9:
      uint64_t v3 = _UINSLocalizedStringWithDefaultValue(v4, v6);
      break;
    default:
      break;
  }
  return v3;
}

- (double)sizeForMoonMaskVisible:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIStatusBarForegroundStyleAttributes *)self scale];
  if (v5 <= 2.5)
  {
    [(UIStatusBarForegroundStyleAttributes *)self scale];
    BOOL v8 = v7 <= 1.5;
    double result = 8.0;
    if (!v8) {
      double result = 7.5;
    }
  }
  else
  {
    double result = 7.66666667;
  }
  if (!v3) {
    return 11.0;
  }
  return result;
}

- (CGPoint)positionForMoonMaskInBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(UIStatusBarForegroundStyleAttributes *)self scale];
  if (v8 <= 2.5)
  {
    [(UIStatusBarForegroundStyleAttributes *)self scale];
    if (v10 <= 1.5) {
      double v9 = 2.0;
    }
    else {
      double v9 = 1.5;
    }
  }
  else
  {
    double v9 = 1.66666667;
  }
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v11 = v9 + CGRectGetMaxX(v14);
  double v12 = 4.0;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (BOOL)usesVerticalLayout
{
  return 0;
}

- (int64_t)idiom
{
  return self->_idiom;
}

- (BOOL)supportsShowingBuildVersion
{
  return 1;
}

- (BOOL)canShowBreadcrumbs
{
  return self->_canShowBreadcrumbs;
}

- (void)setCanShowBreadcrumbs:(BOOL)a3
{
  self->_canShowBreadcrumbs = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_cachedUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedFonts, 0);
}

@end