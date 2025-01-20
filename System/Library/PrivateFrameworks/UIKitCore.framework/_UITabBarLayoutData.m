@interface _UITabBarLayoutData
+ (id)decodeFromCoder:(id)a3 prefix:(id)a4;
+ (id)standardLayoutData;
- (BOOL)checkEqualTo:(id)a3;
- (UIColor)selectionIndicatorTintColor;
- (UIImage)selectionIndicatorImage;
- (double)itemSpacing;
- (double)itemWidth;
- (id)replicate;
- (int64_t)hashInto:(int64_t)a3;
- (int64_t)itemPositioning;
- (int64_t)positioningForTraitCollection:(id)a3;
- (void)describeInto:(id)a3;
- (void)encodeToCoder:(id)a3 prefix:(id)a4;
- (void)setItemPositioning:(int64_t)a3;
- (void)setItemSpacing:(double)a3;
- (void)setItemWidth:(double)a3;
- (void)setSelectionIndicatorImage:(id)a3;
- (void)setSelectionIndicatorTintColor:(id)a3;
@end

@implementation _UITabBarLayoutData

+ (id)standardLayoutData
{
  v2 = (void *)_UITabBarLayoutStandard;
  if (!_UITabBarLayoutStandard)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)_UITabBarLayoutStandard;
    _UITabBarLayoutStandard = v3;

    id v5 = (id)[(id)_UITabBarLayoutStandard markReadOnly];
    v2 = (void *)_UITabBarLayoutStandard;
  }
  return v2;
}

- (UIColor)selectionIndicatorTintColor
{
  return self->_selectionIndicatorTintColor;
}

- (UIImage)selectionIndicatorImage
{
  return self->_selectionIndicatorImage;
}

- (double)itemWidth
{
  return self->_itemWidth;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (int64_t)itemPositioning
{
  return self->_itemPositioning;
}

+ (id)decodeFromCoder:(id)a3 prefix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  if (v6)
  {
    v8 = [NSString stringWithFormat:@"%@.%@", v6, @"SelectionIndicatorTintColor"];
    v9 = [v5 decodeObjectOfClass:v7 forKey:v8];

    uint64_t v10 = objc_opt_class();
    v11 = [NSString stringWithFormat:@"%@.%@", v6, @"SelectionIndicatorImage"];
    v12 = [v5 decodeObjectOfClass:v10 forKey:v11];

    v13 = [NSString stringWithFormat:@"%@.%@", v6, @"Positioning"];
    if ([v5 containsValueForKey:v13])
    {
      v14 = [NSString stringWithFormat:@"%@.%@", v6, @"Positioning"];
      uint64_t v15 = [v5 decodeIntegerForKey:v14];
    }
    else
    {
      uint64_t v15 = 0;
    }

    v16 = [NSString stringWithFormat:@"%@.%@", v6, @"Width"];
    double v17 = 0.0;
    double v18 = 0.0;
    if ([v5 containsValueForKey:v16])
    {
      v19 = [NSString stringWithFormat:@"%@.%@", v6, @"Width"];
      [v5 decodeDoubleForKey:v19];
      double v18 = v20;
    }
    v21 = [NSString stringWithFormat:@"%@.%@", v6, @"Spacing"];
    if ([v5 containsValueForKey:v21])
    {
      v22 = [NSString stringWithFormat:@"%@.%@", v6, @"Spacing"];
      [v5 decodeDoubleForKey:v22];
      double v17 = v23;
    }
  }
  else
  {
    v9 = [v5 decodeObjectOfClass:v7 forKey:@"SelectionIndicatorTintColor"];
    v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"SelectionIndicatorImage"];
    if ([v5 containsValueForKey:@"Positioning"]) {
      uint64_t v15 = [v5 decodeIntegerForKey:@"Positioning"];
    }
    else {
      uint64_t v15 = 0;
    }
    double v17 = 0.0;
    double v18 = 0.0;
    if ([v5 containsValueForKey:@"Width"])
    {
      [v5 decodeDoubleForKey:@"Width"];
      double v18 = v24;
    }
    if ([v5 containsValueForKey:@"Spacing"])
    {
      [v5 decodeDoubleForKey:@"Spacing"];
      double v17 = v25;
    }
  }
  if (v9 || v12 || v15 || v18 != 0.0 || v17 != 0.0)
  {
    uint64_t v26 = objc_opt_new();
    objc_storeStrong((id *)(v26 + 16), v9);
    objc_storeStrong((id *)(v26 + 24), v12);
    *(void *)(v26 + 32) = v15;
    *(double *)(v26 + 40) = v18;
    *(double *)(v26 + 48) = v17;
  }
  else
  {
    uint64_t v26 = 0;
  }

  return (id)v26;
}

- (void)encodeToCoder:(id)a3 prefix:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if ((_UITabBarLayoutData *)_UITabBarLayoutStandard == self) {
    goto LABEL_26;
  }
  selectionIndicatorTintColor = self->_selectionIndicatorTintColor;
  if (!selectionIndicatorTintColor) {
    goto LABEL_5;
  }
  if (v6)
  {
    v9 = [NSString stringWithFormat:@"%@.%@", v6, @"SelectionIndicatorTintColor"];
    [v22 encodeObject:selectionIndicatorTintColor forKey:v9];

LABEL_5:
    selectionIndicatorImage = self->_selectionIndicatorImage;
    if (!selectionIndicatorImage) {
      goto LABEL_12;
    }
    if (v7)
    {
      v11 = [NSString stringWithFormat:@"%@.%@", v7, @"SelectionIndicatorImage"];
      [v22 encodeObject:selectionIndicatorImage forKey:v11];

      goto LABEL_12;
    }
    v13 = v22;
    v12 = self->_selectionIndicatorImage;
    goto LABEL_11;
  }
  [v22 encodeObject:self->_selectionIndicatorTintColor forKey:@"SelectionIndicatorTintColor"];
  v12 = self->_selectionIndicatorImage;
  if (!v12) {
    goto LABEL_12;
  }
  v13 = v22;
LABEL_11:
  [v13 encodeObject:v12 forKey:@"SelectionIndicatorImage"];
LABEL_12:
  int64_t itemPositioning = self->_itemPositioning;
  if (!itemPositioning)
  {
LABEL_15:
    double itemWidth = self->_itemWidth;
    if (itemWidth == 0.0) {
      goto LABEL_22;
    }
    if (v7)
    {
      double v17 = [NSString stringWithFormat:@"%@.%@", v7, @"Width"];
      [v22 encodeDouble:v17 forKey:itemWidth];

      goto LABEL_22;
    }
    v19 = v22;
    double v18 = self->_itemWidth;
    goto LABEL_21;
  }
  if (v7)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%@.%@", v7, @"Positioning"];
    [v22 encodeInteger:itemPositioning forKey:v15];

    goto LABEL_15;
  }
  [v22 encodeInteger:self->_itemPositioning forKey:@"Positioning"];
  double v18 = self->_itemWidth;
  if (v18 == 0.0) {
    goto LABEL_22;
  }
  v19 = v22;
LABEL_21:
  [v19 encodeDouble:@"Width" forKey:v18];
LABEL_22:
  double itemSpacing = self->_itemSpacing;
  if (itemSpacing != 0.0)
  {
    if (v7)
    {
      v21 = [NSString stringWithFormat:@"%@.%@", v7, @"Spacing"];
      [v22 encodeDouble:v21 forKey:itemSpacing];
    }
    else
    {
      [v22 encodeDouble:@"Spacing" forKey:self->_itemSpacing];
    }
  }
LABEL_26:
}

- (void)describeInto:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UITabBarLayoutData;
  [(_UIBarAppearanceData *)&v7 describeInto:v4];
  [v4 appendString:@" positioning="];
  int64_t itemPositioning = self->_itemPositioning;
  switch(itemPositioning)
  {
    case 2:
      id v6 = @"centered";
      goto LABEL_7;
    case 1:
      id v6 = @"fill";
      goto LABEL_7;
    case 0:
      id v6 = @"automatic";
LABEL_7:
      [v4 appendString:v6];
      goto LABEL_9;
  }
  objc_msgSend(v4, "appendFormat:", @"unknown(%li)", self->_itemPositioning);
LABEL_9:
  if (self->_selectionIndicatorImage) {
    [v4 appendFormat:@" selectionIndicatorImage=%@", self->_selectionIndicatorImage];
  }
  if (self->_selectionIndicatorTintColor) {
    [v4 appendFormat:@" selectionIndicatorTintColor=%@", self->_selectionIndicatorTintColor];
  }
  if (self->_itemWidth > 0.0) {
    objc_msgSend(v4, "appendFormat:", @" itemWidth=%f", *(void *)&self->_itemWidth);
  }
  if (self->_itemSpacing > 0.0) {
    objc_msgSend(v4, "appendFormat:", @" itemSpacing=%f", *(void *)&self->_itemSpacing);
  }
}

- (int64_t)hashInto:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UITabBarLayoutData;
  id v4 = [(_UIBarAppearanceData *)&v10 hashInto:a3];
  uint64_t itemWidth = (uint64_t)self->_itemWidth;
  uint64_t itemSpacing = (uint64_t)self->_itemSpacing;
  unint64_t v7 = [(UIImage *)self->_selectionIndicatorImage hash];
  unint64_t v8 = [(UIColor *)self->_selectionIndicatorTintColor hash];
  return (int64_t)v4
       + itemWidth
       + itemSpacing
       + v7
       + v8
       + ((void)v4 + itemWidth + itemSpacing + v7 + v8) * self->_itemPositioning;
}

- (BOOL)checkEqualTo:(id)a3
{
  id v4 = (double *)a3;
  v16.receiver = self;
  v16.super_class = (Class)_UITabBarLayoutData;
  if ([(_UIBarAppearanceData *)&v16 checkEqualTo:v4]
    && self->_itemPositioning == *((void *)v4 + 4)
    && self->_itemWidth == v4[5]
    && self->_itemSpacing == v4[6])
  {
    id v5 = (void *)*((void *)v4 + 3);
    id v6 = self->_selectionIndicatorImage;
    unint64_t v7 = v5;
    if (v6 == v7)
    {

      goto LABEL_14;
    }
    unint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      char v10 = 0;
LABEL_21:

      goto LABEL_19;
    }
    BOOL v11 = [(UIImage *)v6 isEqual:v7];

    if (v11)
    {
LABEL_14:
      selectionIndicatorTintColor = self->_selectionIndicatorTintColor;
      v13 = (void *)*((void *)v4 + 2);
      id v6 = selectionIndicatorTintColor;
      v14 = v13;
      if (v6 == v14)
      {
        char v10 = 1;
        unint64_t v8 = v6;
      }
      else
      {
        unint64_t v8 = v14;
        char v10 = 0;
        if (v6 && v14) {
          char v10 = [(UIImage *)v6 isEqual:v14];
        }
      }
      goto LABEL_21;
    }
  }
  char v10 = 0;
LABEL_19:

  return v10;
}

- (id)replicate
{
  v5.receiver = self;
  v5.super_class = (Class)_UITabBarLayoutData;
  uint64_t v3 = [(_UIBarAppearanceData *)&v5 replicate];
  objc_storeStrong((id *)(v3 + 24), self->_selectionIndicatorImage);
  objc_storeStrong((id *)(v3 + 16), self->_selectionIndicatorTintColor);
  *(void *)(v3 + 32) = self->_itemPositioning;
  *(double *)(v3 + 40) = self->_itemWidth;
  *(double *)(v3 + 48) = self->_itemSpacing;
  return (id)v3;
}

- (void)setItemPositioning:(int64_t)a3
{
  self->_int64_t itemPositioning = a3;
}

- (void)setItemWidth:(double)a3
{
  self->_uint64_t itemWidth = a3;
}

- (void)setItemSpacing:(double)a3
{
  self->_uint64_t itemSpacing = a3;
}

- (void)setSelectionIndicatorTintColor:(id)a3
{
  id v5 = a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  id v10 = v5;
  if (v10
    && (+[UIColor clearColor],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v10 isEqual:v6],
        v6,
        (v7 & 1) == 0))
  {
    unint64_t v8 = (UIColor *)v10;
  }
  else
  {
    unint64_t v8 = 0;
  }

  selectionIndicatorTintColor = self->_selectionIndicatorTintColor;
  self->_selectionIndicatorTintColor = v8;
}

- (void)setSelectionIndicatorImage:(id)a3
{
  id v5 = a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  id v6 = v5;
  id v11 = v6;
  if (v6)
  {
    [v6 size];
    unint64_t v8 = 0;
    if (v9 != 0.0 && v7 != 0.0) {
      unint64_t v8 = (UIImage *)v11;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  selectionIndicatorImage = self->_selectionIndicatorImage;
  self->_selectionIndicatorImage = v8;
}

- (int64_t)positioningForTraitCollection:(id)a3
{
  if (!self->_itemPositioning) {
    return 0;
  }
  if ([a3 horizontalSizeClass] == 2) {
    return 2;
  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionIndicatorImage, 0);
  objc_storeStrong((id *)&self->_selectionIndicatorTintColor, 0);
}

@end