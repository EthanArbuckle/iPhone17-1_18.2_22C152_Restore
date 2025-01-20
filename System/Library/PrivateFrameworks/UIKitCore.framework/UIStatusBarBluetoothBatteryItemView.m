@interface UIStatusBarBluetoothBatteryItemView
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (UIEdgeInsets)_accessibilityHUDBatteryInsidesInsets;
- (double)_normalizedCapacity;
- (double)extraLeftPadding;
- (id)accessibilityHUDRepresentation;
- (id)contentsImage;
@end

@implementation UIStatusBarBluetoothBatteryItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  double v5 = (double)*(int *)([a3 rawData] + 2264);
  if (v5 > 100.0) {
    double v5 = 100.0;
  }
  int v6 = (int)fmax(v5, 0.0);
  int capacity = self->_capacity;
  if (capacity != v6) {
    self->_int capacity = v6;
  }
  return capacity != v6;
}

- (double)_normalizedCapacity
{
  return (double)self->_capacity / 100.0;
}

- (id)contentsImage
{
  v3 = [(UIStatusBarItemView *)self imageWithShadowNamed:@"HeadsetBatteryBG"];
  [(UIStatusBarBluetoothBatteryItemView *)self _normalizedCapacity];
  double v5 = v4;
  int v6 = [(UIStatusBarItemView *)self foregroundStyle];
  v7 = [v6 bluetoothBatteryImageNameWithCapacity:v5];

  v8 = [(UIStatusBarItemView *)self foregroundStyle];
  v9 = [v8 cachedImageNamed:v7 inTempGroup:@"TempGroupBTBattery"];

  if (!v9)
  {
    v10 = [v3 image];
    [v10 size];
    double v12 = v11;
    double v14 = v13;
    v15 = [(UIStatusBarItemView *)self foregroundStyle];
    if ([v15 usesVerticalLayout]) {
      double v16 = v14;
    }
    else {
      double v16 = v12;
    }

    [(UIStatusBarItemView *)self beginImageContextWithMinimumWidth:v16];
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      v18 = 0;
    }
    else {
      v18 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    CGContextSaveGState(v18);
    v19 = [(UIStatusBarItemView *)self foregroundStyle];
    [v19 scale];
    double v21 = v20;

    v22 = [(UIStatusBarItemView *)self foregroundStyle];
    [v22 height];
    double v24 = (v23 - v14) * 0.5;

    CGContextTranslateCTM(v18, 0.0, round(v21 * v24) / v21);
    objc_msgSend(v10, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    v25 = [(UIStatusBarItemView *)self foregroundStyle];
    objc_msgSend(v25, "drawBluetoothBatteryInsidesWithSize:capacity:", v12, v14, v5);

    v9 = [(UIStatusBarItemView *)self imageFromImageContextClippedToWidth:v12];
    CGContextRestoreGState(v18);
    [(UIStatusBarItemView *)self endImageContext];
    v26 = [(UIStatusBarItemView *)self foregroundStyle];
    [v26 cacheImage:v9 named:v7 inTempGroup:@"TempGroupBTBattery"];
  }
  v27 = [v3 shadowImage];
  v28 = +[_UILegibilityImageSet imageFromImage:v9 withShadowImage:v27];

  return v28;
}

- (double)extraLeftPadding
{
  v2 = [(UIStatusBarItemView *)self foregroundStyle];
  [v2 bluetoothBatteryExtraPadding];
  double v4 = v3;

  return v4;
}

- (UIEdgeInsets)_accessibilityHUDBatteryInsidesInsets
{
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

- (id)accessibilityHUDRepresentation
{
  if (self->_capacity != self->_accessibilityCachedHUDCapacity || !self->_accessibilityCachedHUDImage)
  {
    [(UIStatusBarBluetoothBatteryItemView *)self _normalizedCapacity];
    double v4 = v3;
    double v5 = +[UIImage kitImageNamed:@"AXHUD_HeadsetBatteryBG.png"];
    int v6 = +[UIImage kitImageNamed:@"AXHUD_HeadsetBatteryInsides.png"];
    v7 = [(UIStatusBarItemView *)self foregroundStyle];
    v8 = [v7 bluetoothBatteryColorForCapacity:0 usingTintColor:v4];

    v9 = [v6 _flatImageWithColor:v8];

    [v5 size];
    double v11 = v10;
    [v5 size];
    double v13 = 75.0 / v12;
    CGFloat v14 = v11 * (75.0 / v12);
    CGFloat v15 = v12 * (75.0 / v12);
    double v16 = +[UIScreen mainScreen];
    [v16 scale];
    _UIGraphicsBeginImageContextWithOptions(0, 0, v14, v15, v17);

    double v18 = *MEMORY[0x1E4F1DAD8];
    double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v5 size];
    double v21 = v20;
    double v23 = v22;
    objc_msgSend(v5, "drawInRect:", v18, v19, v13 * v20, v13 * v22);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      v25 = 0;
    }
    else {
      v25 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    [(UIStatusBarBluetoothBatteryItemView *)self _accessibilityHUDBatteryInsidesInsets];
    CGFloat v27 = v18 + v26;
    double v29 = v19 + v28;
    CGFloat v31 = v21 - (v26 + v30);
    double v33 = v23 - (v28 + v32);
    CGFloat v34 = v4 * v33;
    CGFloat v35 = v29 + v33 - v34;
    long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v44.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v44.c = v36;
    *(_OWORD *)&v44.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransformScale(&v45, &v44, v13, v13);
    v47.origin.x = v27;
    v47.origin.y = v35;
    v47.size.width = v31;
    v47.size.height = v34;
    CGRect v48 = CGRectApplyAffineTransform(v47, &v45);
    CGContextClipToRect(v25, v48);
    [v9 size];
    double v38 = v13 * v37;
    [v9 size];
    objc_msgSend(v9, "drawInRect:", 0.0, 0.0, v38, v13 * v39);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v40 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    self->_accessibilityCachedHUDCapacity = self->_capacity;
    accessibilityCachedHUDImage = self->_accessibilityCachedHUDImage;
    self->_accessibilityCachedHUDImage = v40;
  }
  v42 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", 0, self->_accessibilityCachedHUDImage, 0.0, 0.0, 0.0, 0.0);
  [(UIAccessibilityHUDItem *)v42 setFlattenImage:0];
  return v42;
}

- (void).cxx_destruct
{
}

@end