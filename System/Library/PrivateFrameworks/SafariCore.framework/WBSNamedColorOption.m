@interface WBSNamedColorOption
+ (BOOL)supportsSecureCoding;
+ (id)colorWithData:(id)a3;
- (BOOL)isClearColor;
- (BOOL)isEqual:(id)a3;
- (NSString)accessibilityName;
- (NSString)colorName;
- (WBSNamedColorOption)initWithCoder:(id)a3;
- (WBSNamedColorOption)initWithColorName:(id)a3 red:(double)a4 green:(double)a5 blue:(double)a6 alpha:(double)a7 accessibilityName:(id)a8;
- (double)alphaComponent;
- (double)blueComponent;
- (double)greenComponent;
- (double)redComponent;
- (id)dataRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSNamedColorOption

- (WBSNamedColorOption)initWithColorName:(id)a3 red:(double)a4 green:(double)a5 blue:(double)a6 alpha:(double)a7 accessibilityName:(id)a8
{
  id v15 = a3;
  id v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)WBSNamedColorOption;
  v17 = [(WBSNamedColorOption *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_colorName, a3);
    v18->_redComponent = a4;
    v18->_greenComponent = a5;
    v18->_blueComponent = a6;
    v18->_alphaComponent = a7;
    objc_storeStrong((id *)&v18->_accessibilityName, a8);
    v19 = v18;
  }

  return v18;
}

+ (id)colorWithData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = 0;
    v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v7];
    id v5 = 0;
    if (!v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)dataRepresentation
{
  uint64_t v6 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v6];
  id v3 = v2;
  id v4 = 0;
  if (!v6) {
    id v4 = v2;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  colorName = self->_colorName;
  id v5 = a3;
  [v5 encodeObject:colorName forKey:@"colorName"];
  uint64_t v6 = [NSNumber numberWithDouble:self->_redComponent];
  [v5 encodeObject:v6 forKey:@"redComponent"];

  uint64_t v7 = [NSNumber numberWithDouble:self->_greenComponent];
  [v5 encodeObject:v7 forKey:@"greenComponent"];

  v8 = [NSNumber numberWithDouble:self->_blueComponent];
  [v5 encodeObject:v8 forKey:@"blueComponent"];

  id v9 = [NSNumber numberWithDouble:self->_alphaComponent];
  [v5 encodeObject:v9 forKey:@"alphaComponent"];
}

- (WBSNamedColorOption)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colorName"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"redComponent"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"greenComponent"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blueComponent"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alphaComponent"];

  [v6 floatValue];
  double v11 = v10;
  [v7 floatValue];
  double v13 = v12;
  [v8 floatValue];
  double v15 = v14;
  [v9 floatValue];
  v17 = [(WBSNamedColorOption *)self initWithColorName:v5 red:0 green:v11 blue:v13 alpha:v15 accessibilityName:v16];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSNamedColorOption *)a3;
  if (self == v4)
  {
    BOOL v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      colorName = self->_colorName;
      uint64_t v7 = [(WBSNamedColorOption *)v5 colorName];
      if (WBSIsEqual(colorName, v7)
        && (double redComponent = self->_redComponent,
            [(WBSNamedColorOption *)v5 redComponent],
            redComponent == v9)
        && (double greenComponent = self->_greenComponent,
            [(WBSNamedColorOption *)v5 greenComponent],
            greenComponent == v11)
        && (double blueComponent = self->_blueComponent,
            [(WBSNamedColorOption *)v5 blueComponent],
            blueComponent == v13))
      {
        double alphaComponent = self->_alphaComponent;
        [(WBSNamedColorOption *)v5 alphaComponent];
        BOOL v16 = alphaComponent == v15;
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_colorName hash];
  id v4 = [NSNumber numberWithDouble:self->_redComponent];
  uint64_t v5 = [v4 hash] ^ v3;
  uint64_t v6 = [NSNumber numberWithDouble:self->_greenComponent];
  uint64_t v7 = [v6 hash];
  v8 = [NSNumber numberWithDouble:self->_blueComponent];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  float v10 = [NSNumber numberWithDouble:self->_alphaComponent];
  unint64_t v11 = v9 ^ [v10 hash];

  return v11;
}

- (BOOL)isClearColor
{
  return [(NSString *)self->_colorName isEqualToString:@"clear"];
}

- (NSString)colorName
{
  return self->_colorName;
}

- (double)redComponent
{
  return self->_redComponent;
}

- (double)greenComponent
{
  return self->_greenComponent;
}

- (double)blueComponent
{
  return self->_blueComponent;
}

- (double)alphaComponent
{
  return self->_alphaComponent;
}

- (NSString)accessibilityName
{
  return self->_accessibilityName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityName, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
}

@end