@interface UIKBGradient
+ (id)gradientWith3Colors:(id)a3 middleLocation:(double)a4;
+ (id)gradientWithColors:(id)a3 middleLocations:(id)a4;
+ (id)gradientWithFlatColor:(id)a3;
+ (id)gradientWithName:(id)a3;
+ (id)gradientWithStartColor:(id)a3 endColor:(id)a4;
- (BOOL)horizontal;
- (BOOL)isEqual:(id)a3;
- (BOOL)usesRGBColors;
- (CGGradient)CGGradient;
- (NSString)flatColorName;
- (UIKBGradient)initWith3Colors:(id)a3 middleLocation:(double)a4;
- (UIKBGradient)initWithColors:(id)a3 middleLocations:(id)a4;
- (UIKBGradient)initWithFlatColor:(id)a3;
- (UIKBGradient)initWithName:(id)a3;
- (UIKBGradient)initWithStartColor:(id)a3 endColor:(id)a4;
- (double)opacity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setHorizontal:(BOOL)a3;
- (void)setOpacity:(double)a3;
@end

@implementation UIKBGradient

- (BOOL)usesRGBColors
{
  if (!self->_didQueryRGBColors) {
    CGGradientRelease([(UIKBGradient *)self CGGradient]);
  }
  return self->_usesRGBColors;
}

- (NSString)flatColorName
{
  if (self->_gradientName) {
    goto LABEL_2;
  }
  flatColorName = self->_flatColorName;
  if (flatColorName)
  {
LABEL_4:
    startColorName = flatColorName;
    goto LABEL_5;
  }
  startColorName = self->_startColorName;
  if (startColorName)
  {
    if (!self->_endColorName || !-[NSString isEqualToString:](startColorName, "isEqualToString:"))
    {
LABEL_2:
      startColorName = 0;
      goto LABEL_5;
    }
    flatColorName = self->_startColorName;
    goto LABEL_4;
  }
LABEL_5:
  return startColorName;
}

- (CGGradient)CGGradient
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  self->_didQueryRGBColors = 1;
  gradientName = self->_gradientName;
  if (gradientName)
  {
    self->_usesRGBColors = 1;
    v4 = (CGGradient *)UIKBGetNamedLinearGradient(gradientName);
    CGGradientRetain(v4);
    return v4;
  }
  flatColorName = self->_flatColorName;
  if (flatColorName)
  {
    CopyWithAlpha = (CGColor *)UIKBGetNamedColor(flatColorName);
    self->_usesRGBColors = UIKBColorUsesRGB((BOOL)CopyWithAlpha);
    double opacity = self->_opacity;
    if (opacity == 1.0) {
      CGColorRetain(CopyWithAlpha);
    }
    else {
      CopyWithAlpha = CGColorCreateCopyWithAlpha(CopyWithAlpha, opacity);
    }
    v4 = UIKBCreateTwoColorLinearGradient((BOOL)CopyWithAlpha, (BOOL)CopyWithAlpha);
    CGColorRelease(CopyWithAlpha);
    return v4;
  }
  colors = self->_colors;
  if (colors)
  {
    uint64_t v9 = [(NSArray *)colors count];
    if (v9 == [(NSArray *)self->_middleLocations count] + 2)
    {
      v10 = (CGFloat *)malloc_type_calloc(8uLL, [(NSArray *)self->_middleLocations count] + 2, 0x1BF39E55uLL);
      CGFloat *v10 = 0.0;
      if ([(NSArray *)self->_middleLocations count])
      {
        unint64_t v11 = 0;
        do
        {
          v12 = [(NSArray *)self->_middleLocations objectAtIndex:v11];
          [v12 doubleValue];
          v10[v11 + 1] = v13;

          ++v11;
        }
        while (v11 < [(NSArray *)self->_middleLocations count]);
      }
      v10[[(NSArray *)self->_middleLocations count] + 1] = 1.0;
    }
    else
    {
      v10 = 0;
    }
    v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v19 = self->_colors;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = UIKBGetNamedColor(*(void **)(*((void *)&v27 + 1) + 8 * i));
          v25 = v24;
          if (!self->_usesRGBColors) {
            self->_usesRGBColors = UIKBColorUsesRGB((BOOL)v24);
          }
          objc_msgSend(v18, "addObject:", v25, (void)v27);
        }
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v21);
    }

    if (self->_usesRGBColors)
    {
      DeviceRGB = (CGColorSpace *)UIKBColorSpaceDeviceRGB_colorspace;
      if (!UIKBColorSpaceDeviceRGB_colorspace)
      {
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        UIKBColorSpaceDeviceRGB_colorspace = (uint64_t)DeviceRGB;
      }
    }
    else
    {
      DeviceRGB = (CGColorSpace *)UIKBColorSpaceDeviceGray_colorspace;
      if (!UIKBColorSpaceDeviceGray_colorspace)
      {
        DeviceRGB = CGColorSpaceCreateDeviceGray();
        UIKBColorSpaceDeviceGray_colorspace = (uint64_t)DeviceRGB;
      }
    }
    v4 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)v18, v10);
    if (v10) {
      free(v10);
    }

    return v4;
  }
  v14 = UIKBGetNamedColor(self->_startColorName);
  v15 = UIKBGetNamedColor(self->_endColorName);
  if (!self->_usesRGBColors)
  {
    BOOL v16 = UIKBColorUsesRGB((BOOL)v14);
    self->_usesRGBColors = v16;
    if (!v16) {
      self->_usesRGBColors = UIKBColorUsesRGB((BOOL)v15);
    }
  }
  return UIKBCreateTwoColorLinearGradient((BOOL)v14, (BOOL)v15);
}

+ (id)gradientWithName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithName:v4];

  return v5;
}

+ (id)gradientWithFlatColor:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFlatColor:v4];

  return v5;
}

+ (id)gradientWithStartColor:(id)a3 endColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithStartColor:v7 endColor:v6];

  return v8;
}

+ (id)gradientWith3Colors:(id)a3 middleLocation:(double)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWith3Colors:v6 middleLocation:a4];

  return v7;
}

+ (id)gradientWithColors:(id)a3 middleLocations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithColors:v7 middleLocations:v6];

  return v8;
}

- (UIKBGradient)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBGradient;
  id v6 = [(UIKBGradient *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_gradientName, a3);
    v7->_double opacity = 1.0;
  }

  return v7;
}

- (UIKBGradient)initWithFlatColor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBGradient;
  id v6 = [(UIKBGradient *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_flatColorName, a3);
    v7->_double opacity = 1.0;
  }

  return v7;
}

- (UIKBGradient)initWithStartColor:(id)a3 endColor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIKBGradient;
  objc_super v9 = [(UIKBGradient *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startColorName, a3);
    objc_storeStrong((id *)&v10->_endColorName, a4);
    v10->_double opacity = 1.0;
  }

  return v10;
}

- (UIKBGradient)initWith3Colors:(id)a3 middleLocation:(double)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIKBGradient;
  id v8 = [(UIKBGradient *)&v14 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_colors, a3);
    v10 = [NSNumber numberWithDouble:a4];
    v15[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    middleLocations = v9->_middleLocations;
    v9->_middleLocations = (NSArray *)v11;

    v9->_double opacity = 1.0;
  }

  return v9;
}

- (UIKBGradient)initWithColors:(id)a3 middleLocations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIKBGradient;
  objc_super v9 = [(UIKBGradient *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_colors, a3);
    uint64_t v11 = [v8 copy];
    middleLocations = v10->_middleLocations;
    v10->_middleLocations = (NSArray *)v11;

    v10->_double opacity = 1.0;
  }

  return v10;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  id v4 = v3;
  if (self->_horizontal) {
    [v3 appendString:@"; horizontal gradient"];
  }
  if (self->_gradientName)
  {
    [v4 appendFormat:@"; Named Gradient = %@", self->_gradientName, v8];
  }
  else if (self->_flatColorName)
  {
    [v4 appendFormat:@"; Flat Color Gradient = %@", self->_flatColorName, v8];
  }
  else if (self->_startColorName && (endColorName = self->_endColorName) != 0)
  {
    [v4 appendFormat:@"; 2-Color Gradient = %@ -> %@", self->_startColorName, endColorName];
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", @"; 3-Color Gradient = %@, middleLocations = %@",
      self->_colors,
      self->_middleLocations);
  }
  [(UIKBGradient *)self opacity];
  if (v6 != 1.0) {
    objc_msgSend(v4, "appendFormat:", @"; double opacity = %f", *(void *)&self->_opacity);
  }
  [v4 appendString:@">"];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIKBGradient *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v11 = (objc_opt_isKindOfClass() & 1) != 0
       && self->_horizontal == v4->_horizontal
       && (gradientName = self->_gradientName, (gradientName != 0) != (v4->_gradientName == 0))
       && (!gradientName || -[NSString isEqualToString:](gradientName, "isEqualToString:"))
       && (flatColorName = self->_flatColorName, (flatColorName != 0) != (v4->_flatColorName == 0))
       && (!flatColorName || -[NSString isEqualToString:](flatColorName, "isEqualToString:"))
       && (startColorName = self->_startColorName, (startColorName != 0) != (v4->_startColorName == 0))
       && (!startColorName || -[NSString isEqualToString:](startColorName, "isEqualToString:"))
       && (endColorName = self->_endColorName, (endColorName != 0) != (v4->_endColorName == 0))
       && (!endColorName || -[NSString isEqualToString:](endColorName, "isEqualToString:"))
       && (colors = self->_colors, (colors != 0) != (v4->_colors == 0))
       && (!colors || -[NSArray isEqualToArray:](colors, "isEqualToArray:"))
       && ((middleLocations = self->_middleLocations) == 0
        || [(NSArray *)middleLocations isEqualToArray:v4->_middleLocations])
       && self->_opacity == v4->_opacity;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[UIKBGradient allocWithZone:a3] initWithStartColor:self->_startColorName endColor:self->_endColorName];
  objc_storeStrong((id *)&v4->_gradientName, self->_gradientName);
  objc_storeStrong((id *)&v4->_flatColorName, self->_flatColorName);
  objc_storeStrong((id *)&v4->_colors, self->_colors);
  objc_storeStrong((id *)&v4->_middleLocations, self->_middleLocations);
  v4->_horizontal = self->_horizontal;
  v4->_double opacity = self->_opacity;
  return v4;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_double opacity = a3;
}

- (BOOL)horizontal
{
  return self->_horizontal;
}

- (void)setHorizontal:(BOOL)a3
{
  self->_horizontal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_middleLocations, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_endColorName, 0);
  objc_storeStrong((id *)&self->_startColorName, 0);
  objc_storeStrong((id *)&self->_flatColorName, 0);
  objc_storeStrong((id *)&self->_gradientName, 0);
}

@end