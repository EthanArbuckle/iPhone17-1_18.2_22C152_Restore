@interface PUIStyleGradient
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsVariation;
- (BOOL)desiresVibrancyEffectView;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4;
- (BOOL)isEqualToStyle:(id)a3;
- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4;
- (BOOL)isSupportedBackgroundStyle;
- (BOOL)isSupportedSystemStyle;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (NSArray)colors;
- (NSArray)locations;
- (NSString)localizedName;
- (NSString)lutIdentifier;
- (NSString)nonVariatedIdentifier;
- (PUIStyleGradient)initWithCoder:(id)a3;
- (PUIStyleGradient)initWithColors:(id)a3;
- (PUIStyleGradient)initWithColors:(id)a3 gradientType:(unint64_t)a4 locations:(id)a5 startPoint:(CGPoint)a6 endPoint:(CGPoint)a7;
- (UIColor)vibrancyEffectColor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)vibrancyEffectType;
- (unint64_t)gradientType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUIStyleGradient

- (PUIStyleGradient)initWithColors:(id)a3
{
  return -[PUIStyleGradient initWithColors:gradientType:locations:startPoint:endPoint:](self, "initWithColors:gradientType:locations:startPoint:endPoint:", a3, 0, &unk_27081B4D0, 0.5, 0.0, 0.5, 1.0);
}

- (PUIStyleGradient)initWithColors:(id)a3 gradientType:(unint64_t)a4 locations:(id)a5 startPoint:(CGPoint)a6 endPoint:(CGPoint)a7
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  CGFloat v9 = a6.y;
  CGFloat v10 = a6.x;
  id v14 = a3;
  id v15 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PUIStyleGradient;
  v16 = [(PUIStyleGradient *)&v22 init];
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
  return [(PUIStyleGradient *)self isEqual:a3 ignoringVariation:1];
}

- (BOOL)isEqualToStyle:(id)a3
{
  return [(PUIStyleGradient *)self isEqualToStyle:a3 ignoringVariation:1];
}

- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (PUIStyleGradient *)a3;
  if (v6 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PUIStyleGradient *)self isEqualToStyle:v6 ignoringVariation:v4];
  }

  return v7;
}

- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (PUIStyleGradient *)a3;
  BOOL v7 = v6;
  if (v6 == self)
  {
    char v15 = 1;
  }
  else if (v6 && _PUIStyleCompareUsingIdentifiers(self, v6, v4))
  {
    v8 = v7;
    CGFloat v9 = [(PUIStyleGradient *)self colors];
    CGFloat v10 = [(PUIStyleGradient *)v8 colors];
    int v11 = [v9 isEqualToArray:v10];

    if (v11
      && self->_gradientType == v8->_gradientType
      && ([(PUIStyleGradient *)self locations],
          v12 = objc_claimAutoreleasedReturnValue(),
          [(PUIStyleGradient *)v8 locations],
          v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v12 isEqualToArray:v13],
          v13,
          v12,
          v14)
      && BSPointEqualToPoint())
    {
      char v15 = BSPointEqualToPoint();
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C60]);
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
  v18[6] = *MEMORY[0x263EF8340];
  id v3 = NSStringFromPUIStyleType([(PUIStyleGradient *)self type]);
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
  id v8 = [(PUIStyleGradient *)self colors];
  unint64_t v9 = objc_msgSend(v8, "bs_map:", &__block_literal_global_198);
  CGFloat v10 = [v9 componentsJoinedByString:@"_"];
  int v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray hash](self->_locations, "hash"));
  v12 = [v11 stringValue];

  v13 = NSStringFromCGPoint(self->_startPoint);
  int v14 = NSStringFromCGPoint(self->_endPoint);
  v18[0] = v3;
  v18[1] = v7;
  v18[2] = v10;
  v18[3] = v12;
  v18[4] = v13;
  v18[5] = v14;
  char v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:6];

  v16 = [v15 componentsJoinedByString:@"-"];

  return (NSString *)v16;
}

uint64_t __41__PUIStyleGradient_nonVariatedIdentifier__block_invoke(uint64_t a1, void *a2)
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIStyleGradient)initWithCoder:(id)a3
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

  v16 = -[PUIStyleGradient initWithColors:gradientType:locations:startPoint:endPoint:](self, "initWithColors:gradientType:locations:startPoint:endPoint:", v5, v6, v7, v9, v11, v13, v15);
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
  id v4 = objc_alloc((Class)objc_opt_class());
  locations = self->_locations;
  unint64_t gradientType = self->_gradientType;
  colors = self->_colors;
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  double v10 = self->_endPoint.x;
  double v11 = self->_endPoint.y;
  return (id)objc_msgSend(v4, "initWithColors:gradientType:locations:startPoint:endPoint:", colors, gradientType, locations, x, y, v10, v11);
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