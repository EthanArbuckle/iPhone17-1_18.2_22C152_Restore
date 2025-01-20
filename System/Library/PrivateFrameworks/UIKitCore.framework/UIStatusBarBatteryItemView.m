@interface UIStatusBarBatteryItemView
- (BOOL)_needsAccessoryImage;
- (BOOL)cachedImageHasAccessoryImage;
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (CGSize)_batteryOffsetWithBackground:(id)a3;
- (UIImage)cachedAXHUDImage;
- (_UILegibilityImageSet)cachedImageSet;
- (double)extraRightPadding;
- (double)legibilityStrength;
- (id)_accessoryImage;
- (id)_contentsImage;
- (id)accessibilityHUDRepresentation;
- (id)contentsImage;
- (int)cachedAXHUDCapacity;
- (int)cachedCapacity;
- (unint64_t)cachedAXHUDStyle;
- (unint64_t)cachedBatteryStyle;
- (void)_updateAccessoryImage;
- (void)setCachedAXHUDCapacity:(int)a3;
- (void)setCachedAXHUDImage:(id)a3;
- (void)setCachedAXHUDStyle:(unint64_t)a3;
- (void)setCachedBatteryStyle:(unint64_t)a3;
- (void)setCachedCapacity:(int)a3;
- (void)setCachedImageHasAccessoryImage:(BOOL)a3;
- (void)setCachedImageSet:(id)a3;
@end

@implementation UIStatusBarBatteryItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5 = [a3 rawData];
  int v6 = (int)(float)(ceilf((float)*(int *)(v5 + 2104) / 5.0) * 5.0);
  int v7 = *(_DWORD *)(v5 + 2108);
  char v8 = *(unsigned char *)(v5 + 2536);
  int capacity = self->_capacity;
  BOOL v10 = capacity != v6;
  if (capacity != v6) {
    self->_int capacity = v6;
  }
  BOOL v11 = v8 & 1;
  if (v7 != self->_state)
  {
    self->_state = v7;
    BOOL v10 = 1;
  }
  if (v11 != self->_batterySaverModeActive)
  {
    self->_batterySaverModeActive = v11;
    BOOL v10 = 1;
  }
  [(UIStatusBarBatteryItemView *)self _updateAccessoryImage];
  return v10;
}

- (CGSize)_batteryOffsetWithBackground:(id)a3
{
  [a3 size];
  double v5 = v4;
  double v7 = v6;
  char v8 = [(UIStatusBarItemView *)self foregroundStyle];
  int v9 = [v8 usesVerticalLayout];

  BOOL v10 = [(UIStatusBarItemView *)self foregroundStyle];
  [v10 height];
  double v12 = v11;

  if (v9) {
    double v13 = v12;
  }
  else {
    double v13 = v5;
  }
  if (v9) {
    double v14 = v7;
  }
  else {
    double v14 = v12;
  }
  double v15 = (v13 - v5) * 0.5;
  double v16 = (v14 - v7) * 0.5;
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)_needsAccessoryImage
{
  return self->_state != 0;
}

- (id)_accessoryImage
{
  v2 = [(UIStatusBarItemView *)self foregroundStyle];
  v3 = [v2 imageNamed:@"BatteryChargingAccessory"];

  return v3;
}

- (id)_contentsImage
{
  BOOL v3 = [(UIStatusBarBatteryItemView *)self _needsAccessoryImage];
  BOOL v4 = v3;
  if (self->_batterySaverModeActive) {
    uint64_t v5 = v3 | 2;
  }
  else {
    uint64_t v5 = v3;
  }
  double v6 = [(UIStatusBarBatteryItemView *)self cachedImageSet];

  if (v6
    && (int capacity = self->_capacity, capacity == [(UIStatusBarBatteryItemView *)self cachedCapacity])
    && v4 == [(UIStatusBarBatteryItemView *)self cachedImageHasAccessoryImage]
    && v5 == [(UIStatusBarBatteryItemView *)self cachedBatteryStyle])
  {
    char v8 = [(UIStatusBarBatteryItemView *)self cachedImageSet];
  }
  else
  {
    int v9 = [(UIStatusBarItemView *)self imageWithShadowNamed:@"BatteryDrainingBG"];
    BOOL v10 = [v9 image];
    [v10 size];
    double v12 = v11;
    double v14 = v13;
    double v15 = [(UIStatusBarItemView *)self foregroundStyle];
    int v16 = [v15 usesVerticalLayout];

    if (v16) {
      double v17 = v14;
    }
    else {
      double v17 = v12;
    }
    if ((v16 & 1) == 0 && v4)
    {
      v18 = [(UIStatusBarBatteryItemView *)self _accessoryImage];
      [v18 size];
      double v20 = v19;
      v21 = [(UIStatusBarItemView *)self foregroundStyle];
      [v21 batteryAccessoryMargin];
      double v17 = v12 + v20 + v22;
    }
    double v23 = ceil(v17);
    [(UIStatusBarItemView *)self beginImageContextWithMinimumWidth:v23];
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      v25 = 0;
    }
    else {
      v25 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    CGContextSaveGState(v25);
    [(UIStatusBarBatteryItemView *)self _batteryOffsetWithBackground:v10];
    double v27 = v26;
    double v29 = v28;
    if (v4)
    {
      v30 = [(UIStatusBarItemView *)self foregroundStyle];
      int v31 = [v30 usesVerticalLayout];

      if (v31)
      {
        v32 = [(UIStatusBarBatteryItemView *)self _accessoryImage];
        [v32 size];
        double v34 = v33;
        v35 = [(UIStatusBarItemView *)self foregroundStyle];
        [v35 batteryAccessoryMargin];
        double v27 = v27 + (v34 + v36) * -0.5;
      }
    }
    v37 = [(UIStatusBarItemView *)self foregroundStyle];
    [v37 scale];
    double v39 = v38;

    CGContextTranslateCTM(v25, round(v27 * v39) / v39, round(v29 * v39) / v39);
    objc_msgSend(v10, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    v40 = [(UIStatusBarItemView *)self foregroundStyle];
    objc_msgSend(v40, "drawBatteryInsidesWithSize:capacity:style:", self->_capacity, v5, v12, v14);

    v41 = [(UIStatusBarItemView *)self imageFromImageContextClippedToWidth:v23];
    CGContextRestoreGState(v25);
    [(UIStatusBarItemView *)self endImageContext];
    v42 = [v9 shadowImage];
    char v8 = +[_UILegibilityImageSet imageFromImage:v41 withShadowImage:v42];

    [(UIStatusBarBatteryItemView *)self setCachedImageSet:v8];
    [(UIStatusBarBatteryItemView *)self setCachedCapacity:self->_capacity];
    [(UIStatusBarBatteryItemView *)self setCachedImageHasAccessoryImage:v4];
    [(UIStatusBarBatteryItemView *)self setCachedBatteryStyle:v5];
  }
  return v8;
}

- (id)contentsImage
{
  BOOL v3 = [(UIStatusBarBatteryItemView *)self _contentsImage];
  if ([(UIStatusBarItemView *)self _shouldReverseLayoutDirection])
  {
    uint64_t v4 = [v3 imageSetWithOrientation:4];

    BOOL v3 = (void *)v4;
  }
  return v3;
}

- (double)extraRightPadding
{
  BOOL v3 = [(UIStatusBarItemView *)self foregroundStyle];
  int v4 = [v3 usesVerticalLayout];

  double result = -1.0;
  if (v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIStatusBarBatteryItemView;
    [(UIStatusBarItemView *)&v6 extraRightPadding];
  }
  return result;
}

- (void)_updateAccessoryImage
{
  BOOL v3 = [(UIStatusBarBatteryItemView *)self _needsAccessoryImage];
  accessoryView = self->_accessoryView;
  if (!v3)
  {
    uint64_t v22 = 1;
    goto LABEL_15;
  }
  if (!accessoryView)
  {
    uint64_t v5 = [(UIStatusBarBatteryItemView *)self _accessoryImage];
    [(UIView *)self bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    double v14 = [(UIStatusBarItemView *)self foregroundStyle];
    uint64_t v15 = [v14 legibilityStyle];

    if (v15)
    {
      int v16 = [[_UILegibilityView alloc] initWithStyle:v15 image:v5];
      double v17 = self->_accessoryView;
      self->_accessoryView = &v16->super;

      if ([(UIStatusBarItemView *)self _shouldReverseLayoutDirection])
      {
        v41.origin.x = v7;
        v41.origin.y = v9;
        v41.size.width = v11;
        v41.size.height = v13;
        double MinX = CGRectGetMinX(v41);
        [v5 size];
        double v20 = MinX + v19 * 0.5;
        uint64_t v21 = 44;
LABEL_11:
        v43.origin.x = v7;
        v43.origin.y = v9;
        v43.size.width = v11;
        v43.size.height = v13;
        double MidY = CGRectGetMidY(v43);
        int v31 = [(UIStatusBarItemView *)self foregroundStyle];
        int v32 = [v31 usesVerticalLayout];

        if (v32)
        {
          v44.origin.x = v7;
          v44.origin.y = v9;
          v44.size.width = v11;
          v44.size.height = v13;
          double MidX = CGRectGetMidX(v44);
          double v34 = [(UIStatusBarItemView *)self imageWithShadowNamed:@"BatteryDrainingBG"];
          v35 = [v34 image];
          [v35 size];
          double v37 = MidX + v36 * 0.5;
          double v38 = [(UIStatusBarItemView *)self foregroundStyle];
          [v38 batteryAccessoryMargin];
          double v20 = v37 + v39 * 0.5;
        }
        -[UIView setCenter:](self->_accessoryView, "setCenter:", v20, MidY);
        [(UIView *)self->_accessoryView setAutoresizingMask:v21];
        [(UIView *)self addSubview:self->_accessoryView];

        accessoryView = self->_accessoryView;
        goto LABEL_14;
      }
    }
    else
    {
      id v23 = v5;
      if ([(UIStatusBarItemView *)self _shouldReverseLayoutDirection])
      {
        id v24 = v23;
        uint64_t v25 = [v24 CGImage];
        [v24 scale];
        +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v25, 4);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      double v26 = [[UIImageView alloc] initWithImage:v23];
      double v27 = self->_accessoryView;
      self->_accessoryView = &v26->super;

      [(UIStatusBarItemView *)self _shouldReverseLayoutDirection];
    }
    v42.origin.x = v7;
    v42.origin.y = v9;
    v42.size.width = v11;
    v42.size.height = v13;
    double MaxX = CGRectGetMaxX(v42);
    [v5 size];
    double v20 = MaxX + v29 * -0.5;
    uint64_t v21 = 41;
    goto LABEL_11;
  }
LABEL_14:
  uint64_t v22 = 0;
LABEL_15:
  [(UIView *)accessoryView setHidden:v22];
}

- (double)legibilityStrength
{
  return 0.15;
}

- (id)accessibilityHUDRepresentation
{
  BOOL v3 = [(UIStatusBarBatteryItemView *)self _needsAccessoryImage];
  int v4 = v3;
  if (self->_batterySaverModeActive) {
    uint64_t v5 = v3 | 2;
  }
  else {
    uint64_t v5 = v3;
  }
  if ([(UIStatusBarBatteryItemView *)self cachedAXHUDCapacity] != self->_capacity
    || [(UIStatusBarBatteryItemView *)self cachedAXHUDStyle] != v5
    || ([(UIStatusBarBatteryItemView *)self cachedAXHUDImage],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    CGFloat v7 = [(UIStatusBarItemView *)self foregroundStyle];
    double v8 = [v7 batteryColorForCapacity:self->_capacity style:v5 usingTintColor:0];

    CGFloat v9 = [(UIView *)self traitCollection];
    if ([v9 userInterfaceStyle] == 2) {
      +[UIColor whiteColor];
    }
    else {
    double v10 = +[UIColor blackColor];
    }

    double v11 = (float)((float)self->_capacity / 100.0);
    int v12 = [(UIStatusBarItemView *)self _shouldReverseLayoutDirection];
    CGFloat v13 = [(UIView *)self _screen];
    [v13 scale];
    uint64_t v15 = UIStatusBarCreateHUDBatteryImage(v8, v10, v4, v12, 0, v11, v14);
    [(UIStatusBarBatteryItemView *)self setCachedAXHUDImage:v15];

    [(UIStatusBarBatteryItemView *)self setCachedAXHUDCapacity:self->_capacity];
    [(UIStatusBarBatteryItemView *)self setCachedAXHUDStyle:v5];
  }
  int v16 = [UIAccessibilityHUDItem alloc];
  double v17 = [(UIStatusBarBatteryItemView *)self cachedAXHUDImage];
  v18 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:](v16, "initWithTitle:image:imageInsets:scaleImage:", 0, v17, 0, 0.0, 0.0, 0.0, 0.0);

  [(UIAccessibilityHUDItem *)v18 setFlattenImage:0];
  return v18;
}

- (_UILegibilityImageSet)cachedImageSet
{
  return self->_cachedImageSet;
}

- (void)setCachedImageSet:(id)a3
{
}

- (int)cachedCapacity
{
  return self->_cachedCapacity;
}

- (void)setCachedCapacity:(int)a3
{
  self->_cachedCapacity = a3;
}

- (BOOL)cachedImageHasAccessoryImage
{
  return self->_cachedImageHasAccessoryImage;
}

- (void)setCachedImageHasAccessoryImage:(BOOL)a3
{
  self->_cachedImageHasAccessoryImage = a3;
}

- (unint64_t)cachedBatteryStyle
{
  return self->_cachedBatteryStyle;
}

- (void)setCachedBatteryStyle:(unint64_t)a3
{
  self->_cachedBatteryStyle = a3;
}

- (int)cachedAXHUDCapacity
{
  return self->_cachedAXHUDCapacity;
}

- (void)setCachedAXHUDCapacity:(int)a3
{
  self->_cachedAXHUDCapacity = a3;
}

- (unint64_t)cachedAXHUDStyle
{
  return self->_cachedAXHUDStyle;
}

- (void)setCachedAXHUDStyle:(unint64_t)a3
{
  self->_cachedAXHUDStyle = a3;
}

- (UIImage)cachedAXHUDImage
{
  return self->_cachedAXHUDImage;
}

- (void)setCachedAXHUDImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAXHUDImage, 0);
  objc_storeStrong((id *)&self->_cachedImageSet, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end