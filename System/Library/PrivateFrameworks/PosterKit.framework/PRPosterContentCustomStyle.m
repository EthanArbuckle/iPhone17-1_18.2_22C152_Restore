@interface PRPosterContentCustomStyle
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsVariation;
- (BOOL)desiresVibrancyEffectView;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupportedBackgroundStyle;
- (BOOL)isSupportedSystemStyle;
- (NSArray)colors;
- (NSString)localizedName;
- (NSString)lutIdentifier;
- (NSString)nonVariatedIdentifier;
- (PRPosterContentCustomStyle)initWithCoder:(id)a3;
- (PRPosterContentCustomStyle)initWithIdentifier:(id)a3 localizedName:(id)a4;
- (UIColor)vibrancyEffectColor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)vibrancyEffectType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)applyStyleWithRenderer:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterContentCustomStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterContentCustomStyle)initWithIdentifier:(id)a3 localizedName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRPosterContentCustomStyle;
  v8 = [(PRPosterContentCustomStyle *)&v14 init];
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
  v4 = (PRPosterContentCustomStyle *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([(NSString *)self->_localizedName isEqual:v5->_localizedName]) {
        char v6 = [(NSString *)self->_identifier isEqual:v5->_identifier];
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F758]);
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

- (void)applyStyleWithRenderer:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 renderCustomStyle:self];
  }
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

- (PRPosterContentCustomStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];

  id v7 = [(PRPosterContentCustomStyle *)self initWithIdentifier:v5 localizedName:v6];
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
  id v4 = +[PRPosterContentCustomStyle allocWithZone:a3];
  identifier = self->_identifier;
  localizedName = self->_localizedName;
  return [(PRPosterContentCustomStyle *)v4 initWithIdentifier:identifier localizedName:localizedName];
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