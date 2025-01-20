@interface NTKExplorerDotLayoutConstraints
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLayoutConstraints:(id)a3;
- (NTKExplorerDotLayoutConstraints)initWithCoder:(id)a3;
- (double)dotBorderWidth;
- (double)dotDiameter;
- (double)dotSpacing;
- (double)noServiceDotHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDotBorderWidth:(double)a3;
- (void)setDotDiameter:(double)a3;
- (void)setDotSpacing:(double)a3;
- (void)setNoServiceDotHeight:(double)a3;
@end

@implementation NTKExplorerDotLayoutConstraints

- (BOOL)isEqualToLayoutConstraints:(id)a3
{
  id v4 = a3;
  double dotDiameter = self->_dotDiameter;
  [v4 dotDiameter];
  if (vabdd_f64(dotDiameter, v6) >= 2.22044605e-16
    || (double dotBorderWidth = self->_dotBorderWidth,
        [v4 dotBorderWidth],
        vabdd_f64(dotBorderWidth, v8) >= 2.22044605e-16)
    || (double dotSpacing = self->_dotSpacing, [v4 dotSpacing], vabdd_f64(dotSpacing, v10) >= 2.22044605e-16))
  {
    BOOL v13 = 0;
  }
  else
  {
    double noServiceDotHeight = self->_noServiceDotHeight;
    [v4 noServiceDotHeight];
    BOOL v13 = vabdd_f64(noServiceDotHeight, v12) < 2.22044605e-16;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NTKExplorerDotLayoutConstraints *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NTKExplorerDotLayoutConstraints *)self isEqualToLayoutConstraints:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithDouble:self->_dotDiameter];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [NSNumber numberWithDouble:self->_dotBorderWidth];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [NSNumber numberWithDouble:self->_dotSpacing];
  uint64_t v8 = [v7 hash];
  v9 = [NSNumber numberWithDouble:self->_noServiceDotHeight];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(NTKExplorerDotLayoutConstraints);
  BOOL v5 = v4;
  if (v4)
  {
    [(NTKExplorerDotLayoutConstraints *)v4 setDotDiameter:self->_dotDiameter];
    [(NTKExplorerDotLayoutConstraints *)v5 setDotBorderWidth:self->_dotBorderWidth];
    [(NTKExplorerDotLayoutConstraints *)v5 setDotSpacing:self->_dotSpacing];
    [(NTKExplorerDotLayoutConstraints *)v5 setNoServiceDotHeight:self->_noServiceDotHeight];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double dotDiameter = self->_dotDiameter;
  id v5 = a3;
  [v5 encodeDouble:@"dotDiameterKey" forKey:dotDiameter];
  [v5 encodeDouble:@"dotBorderWidthKey" forKey:self->_dotBorderWidth];
  [v5 encodeDouble:@"dotSpacingKey" forKey:self->_dotSpacing];
  [v5 encodeDouble:@"noServiceDotHeightKey" forKey:self->_noServiceDotHeight];
}

- (NTKExplorerDotLayoutConstraints)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKExplorerDotLayoutConstraints *)self init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"dotDiameterKey"];
    v5->_double dotDiameter = v6;
    [v4 decodeDoubleForKey:@"dotBorderWidthKey"];
    v5->_double dotBorderWidth = v7;
    [v4 decodeDoubleForKey:@"dotSpacingKey"];
    v5->_double dotSpacing = v8;
    [v4 decodeDoubleForKey:@"noServiceDotHeightKey"];
    v5->_double noServiceDotHeight = v9;
  }

  return v5;
}

- (double)dotDiameter
{
  return self->_dotDiameter;
}

- (void)setDotDiameter:(double)a3
{
  self->_double dotDiameter = a3;
}

- (double)dotBorderWidth
{
  return self->_dotBorderWidth;
}

- (void)setDotBorderWidth:(double)a3
{
  self->_double dotBorderWidth = a3;
}

- (double)dotSpacing
{
  return self->_dotSpacing;
}

- (void)setDotSpacing:(double)a3
{
  self->_double dotSpacing = a3;
}

- (double)noServiceDotHeight
{
  return self->_noServiceDotHeight;
}

- (void)setNoServiceDotHeight:(double)a3
{
  self->_double noServiceDotHeight = a3;
}

@end