@interface PRPosterContentGradientStyle
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsVariation;
- (BOOL)desiresVibrancyEffectView;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupportedBackgroundStyle;
- (BOOL)isSupportedSystemStyle;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (NSArray)colors;
- (NSArray)locations;
- (NSString)localizedName;
- (NSString)lutIdentifier;
- (NSString)nonVariatedIdentifier;
- (PRPosterContentGradientStyle)initWithCoder:(id)a3;
- (PRPosterContentGradientStyle)initWithColors:(id)a3;
- (PRPosterContentGradientStyle)initWithColors:(id)a3 gradientType:(unint64_t)a4 locations:(id)a5 startPoint:(CGPoint)a6 endPoint:(CGPoint)a7;
- (UIColor)vibrancyEffectColor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)vibrancyEffectType;
- (unint64_t)gradientType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)applyStyleWithRenderer:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterContentGradientStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterContentGradientStyle)initWithColors:(id)a3
{
  return -[PRPosterContentGradientStyle initWithColors:gradientType:locations:startPoint:endPoint:](self, "initWithColors:gradientType:locations:startPoint:endPoint:", a3, 0, &unk_1ED9EEFE0, 0.5, 0.0, 0.5, 1.0);
}

- (PRPosterContentGradientStyle)initWithColors:(id)a3 gradientType:(unint64_t)a4 locations:(id)a5 startPoint:(CGPoint)a6 endPoint:(CGPoint)a7
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  CGFloat v9 = a6.y;
  CGFloat v10 = a6.x;
  id v14 = a3;
  id v15 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PRPosterContentGradientStyle;
  v16 = [(PRPosterContentGradientStyle *)&v22 init];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    colors = v16->_colors;
    v16->_colors = (NSArray *)v17;

    v16->_gradientType = a4;
    uint64_t v19 = [v15 copy];
    locations = v16->_locations;
    v16->_locations = (NSArray *)v19;

    v16->_startPoint.CGFloat x = v10;
    v16->_startPoint.CGFloat y = v9;
    v16->_endPoint.CGFloat x = x;
    v16->_endPoint.CGFloat y = y;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PRPosterContentGradientStyle *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PRPosterContentGradientStyle *)self colors];
      v7 = [(PRPosterContentGradientStyle *)v5 colors];
      int v8 = [v6 isEqualToArray:v7];

      if (v8
        && self->_gradientType == v5->_gradientType
        && ([(PRPosterContentGradientStyle *)self locations],
            CGFloat v9 = objc_claimAutoreleasedReturnValue(),
            [(PRPosterContentGradientStyle *)v5 locations],
            CGFloat v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = [v9 isEqualToArray:v10],
            v10,
            v9,
            v11)
        && BSPointEqualToPoint())
      {
        char v12 = BSPointEqualToPoint();
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F758]);
  id v4 = (id)[v3 appendObject:self->_colors];
  id v5 = (id)[v3 appendUnsignedInteger:self->_gradientType];
  id v6 = (id)[v3 appendObject:self->_locations];
  id v7 = (id)objc_msgSend(v3, "appendCGPoint:", self->_startPoint.x, self->_startPoint.y);
  id v8 = (id)objc_msgSend(v3, "appendCGPoint:", self->_endPoint.x, self->_endPoint.y);
  unint64_t v9 = [v3 hash];

  return v9;
}

- (NSString)nonVariatedIdentifier
{
  v18[6] = *MEMORY[0x1E4F143B8];
  id v3 = _PRPosterContentStyleStringForType([(PRPosterContentGradientStyle *)self type]);
  unint64_t gradientType = self->_gradientType;
  id v5 = @"A";
  if (gradientType == 1) {
    id v5 = @"R";
  }
  if (gradientType == 2) {
    id v6 = @"C";
  }
  else {
    id v6 = v5;
  }
  id v7 = v6;
  id v8 = [(PRPosterContentGradientStyle *)self colors];
  unint64_t v9 = objc_msgSend(v8, "bs_map:", &__block_literal_global_204);
  CGFloat v10 = [v9 componentsJoinedByString:@"_"];
  int v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray hash](self->_locations, "hash"));
  char v12 = [v11 stringValue];

  v13 = NSStringFromCGPoint(self->_startPoint);
  id v14 = NSStringFromCGPoint(self->_endPoint);
  v18[0] = v3;
  v18[1] = v7;
  v18[2] = v10;
  v18[3] = v12;
  v18[4] = v13;
  v18[5] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:6];

  v16 = [v15 componentsJoinedByString:@"-"];

  return (NSString *)v16;
}

uint64_t __53__PRPosterContentGradientStyle_nonVariatedIdentifier__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 hash];
  return [v2 numberWithUnsignedInteger:v3];
}

- (NSString)localizedName
{
  return 0;
}

- (NSArray)colors
{
  v2 = (void *)[(NSArray *)self->_colors copy];
  return (NSArray *)v2;
}

- (void)applyStyleWithRenderer:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 renderGradientStyle:self];
  }
}

- (BOOL)allowsVariation
{
  return 0;
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)isSupportedSystemStyle
{
  return 0;
}

- (BOOL)isSupportedBackgroundStyle
{
  return 1;
}

- (BOOL)desiresVibrancyEffectView
{
  return 0;
}

- (int64_t)vibrancyEffectType
{
  return 1;
}

- (UIColor)vibrancyEffectColor
{
  return (UIColor *)[(NSArray *)self->_colors firstObject];
}

- (NSString)lutIdentifier
{
  return 0;
}

- (PRPosterContentGradientStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"colors"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"gradientType"];
  id v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"locations"];
  [v4 decodeCGPointForKey:@"startPoint"];
  double v9 = v8;
  double v11 = v10;
  [v4 decodeCGPointForKey:@"endPoint"];
  double v13 = v12;
  double v15 = v14;

  v16 = -[PRPosterContentGradientStyle initWithColors:gradientType:locations:startPoint:endPoint:](self, "initWithColors:gradientType:locations:startPoint:endPoint:", v5, v6, v7, v9, v11, v13, v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  colors = self->_colors;
  id v5 = a3;
  [v5 encodeObject:colors forKey:@"colors"];
  [v5 encodeInteger:self->_gradientType forKey:@"gradientType"];
  [v5 encodeObject:self->_locations forKey:@"locations"];
  objc_msgSend(v5, "encodeCGPoint:forKey:", @"startPoint", self->_startPoint.x, self->_startPoint.y);
  objc_msgSend(v5, "encodeCGPoint:forKey:", @"endPoint", self->_endPoint.x, self->_endPoint.y);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PRPosterContentGradientStyle alloc];
  locations = self->_locations;
  unint64_t gradientType = self->_gradientType;
  colors = self->_colors;
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  double v10 = self->_endPoint.x;
  double v11 = self->_endPoint.y;
  return -[PRPosterContentGradientStyle initWithColors:gradientType:locations:startPoint:endPoint:](v4, "initWithColors:gradientType:locations:startPoint:endPoint:", colors, gradientType, locations, x, y, v10, v11);
}

- (CGPoint)startPoint
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x = self->_endPoint.x;
  double y = self->_endPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSArray)locations
{
  return self->_locations;
}

- (unint64_t)gradientType
{
  return self->_gradientType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end