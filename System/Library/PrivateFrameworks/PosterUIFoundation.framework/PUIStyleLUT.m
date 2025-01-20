@interface PUIStyleLUT
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsVariation;
- (BOOL)desiresVibrancyEffectView;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4;
- (BOOL)isEqualToStyle:(id)a3;
- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4;
- (BOOL)isSupportedBackgroundStyle;
- (BOOL)isSupportedSystemStyle;
- (NSArray)colors;
- (NSString)LUTIdentifier;
- (NSString)localizedName;
- (NSString)lutIdentifier;
- (NSString)nonVariatedIdentifier;
- (PUIStyleLUT)initWithCoder:(id)a3;
- (PUIStyleLUT)initWithLUTIdentifier:(id)a3;
- (UIColor)vibrancyEffectColor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)vibrancyEffectType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUIStyleLUT

- (PUIStyleLUT)initWithLUTIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUIStyleLUT;
  v6 = [(PUIStyleLUT *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lutIdentifier, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  return [(PUIStyleLUT *)self isEqual:a3 ignoringVariation:1];
}

- (BOOL)isEqualToStyle:(id)a3
{
  return [(PUIStyleLUT *)self isEqualToStyle:a3 ignoringVariation:1];
}

- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (PUIStyleLUT *)a3;
  if (v6 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PUIStyleLUT *)self isEqualToStyle:v6 ignoringVariation:v4];
  }

  return v7;
}

- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (PUIStyleLUT *)a3;
  BOOL v7 = v6;
  if (v6 == self)
  {
    char v10 = 1;
  }
  else if (v6 && _PUIStyleCompareUsingIdentifiers(self, v6, v4))
  {
    v8 = [(PUIStyleLUT *)v7 lutIdentifier];
    objc_super v9 = [(PUIStyleLUT *)self lutIdentifier];
    char v10 = [v8 isEqual:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C60]);
  id v4 = (id)[v3 appendString:self->_lutIdentifier];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (NSString)nonVariatedIdentifier
{
  id v3 = NSStringFromPUIStyleType([(PUIStyleLUT *)self type]);
  id v4 = [v3 stringByAppendingFormat:@"-%@", self->_lutIdentifier];

  return (NSString *)v4;
}

- (NSString)localizedName
{
  return 0;
}

- (NSArray)colors
{
  return 0;
}

- (unint64_t)type
{
  return 4;
}

- (BOOL)allowsVariation
{
  return 0;
}

- (BOOL)isSupportedSystemStyle
{
  return 1;
}

- (BOOL)isSupportedBackgroundStyle
{
  return 0;
}

- (BOOL)desiresVibrancyEffectView
{
  return 1;
}

- (int64_t)vibrancyEffectType
{
  return 3;
}

- (UIColor)vibrancyEffectColor
{
  return 0;
}

- (NSString)lutIdentifier
{
  return self->_lutIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIStyleLUT)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lutIdentifier"];

  v6 = [(PUIStyleLUT *)self initWithLUTIdentifier:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PUIStyleLUT alloc];
  lutIdentifier = self->_lutIdentifier;
  return [(PUIStyleLUT *)v4 initWithLUTIdentifier:lutIdentifier];
}

- (NSString)LUTIdentifier
{
  return self->_LUTIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_LUTIdentifier, 0);
  objc_storeStrong((id *)&self->_lutIdentifier, 0);
}

@end