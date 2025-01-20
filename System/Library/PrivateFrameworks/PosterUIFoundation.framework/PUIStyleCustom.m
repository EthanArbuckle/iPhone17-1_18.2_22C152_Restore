@interface PUIStyleCustom
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
- (NSString)localizedName;
- (NSString)lutIdentifier;
- (NSString)nonVariatedIdentifier;
- (PUIStyleCustom)initWithCoder:(id)a3;
- (PUIStyleCustom)initWithIdentifier:(id)a3 localizedName:(id)a4;
- (UIColor)vibrancyEffectColor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)vibrancyEffectType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUIStyleCustom

- (PUIStyleCustom)initWithIdentifier:(id)a3 localizedName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUIStyleCustom;
  v8 = [(PUIStyleCustom *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    localizedName = v8->_localizedName;
    v8->_localizedName = (NSString *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  return [(PUIStyleCustom *)self isEqual:a3 ignoringVariation:1];
}

- (BOOL)isEqualToStyle:(id)a3
{
  return [(PUIStyleCustom *)self isEqualToStyle:a3 ignoringVariation:1];
}

- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (PUIStyleCustom *)a3;
  if (v6 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PUIStyleCustom *)self isEqualToStyle:v6 ignoringVariation:v4];
  }

  return v7;
}

- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (PUIStyleCustom *)a3;
  BOOL v7 = v6;
  if (v6 == self) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6
  }
      && _PUIStyleCompareUsingIdentifiers(self, v6, v4)
      && [(NSString *)self->_localizedName isEqualToString:v7->_localizedName]
      && [(NSString *)self->_identifier isEqualToString:v7->_identifier];

  return v8;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C60]);
  id v4 = (id)[v3 appendString:self->_identifier];
  id v5 = (id)[v3 appendString:self->_localizedName];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (NSString)nonVariatedIdentifier
{
  return self->_identifier;
}

- (NSArray)colors
{
  return 0;
}

- (unint64_t)type
{
  return 999;
}

- (BOOL)allowsVariation
{
  return 0;
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
  return 0;
}

- (UIColor)vibrancyEffectColor
{
  return 0;
}

- (NSString)lutIdentifier
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIStyleCustom)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];

  BOOL v7 = [(PUIStyleCustom *)self initWithIdentifier:v5 localizedName:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_localizedName forKey:@"localizedName"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[PUIStyleCustom allocWithZone:a3];
  identifier = self->_identifier;
  localizedName = self->_localizedName;
  return [(PUIStyleCustom *)v4 initWithIdentifier:identifier localizedName:localizedName];
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end