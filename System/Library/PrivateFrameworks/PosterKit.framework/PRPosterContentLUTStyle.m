@interface PRPosterContentLUTStyle
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
- (PRPosterContentLUTStyle)initWithCoder:(id)a3;
- (PRPosterContentLUTStyle)initWithLUTIdentifier:(id)a3;
- (UIColor)vibrancyEffectColor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)vibrancyEffectType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)applyStyleWithRenderer:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterContentLUTStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterContentLUTStyle)initWithLUTIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPosterContentLUTStyle;
  v6 = [(PRPosterContentLUTStyle *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lutIdentifier, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PRPosterContentLUTStyle *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(PRPosterContentLUTStyle *)v4 lutIdentifier];
      v6 = [(PRPosterContentLUTStyle *)self lutIdentifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F758]);
  id v4 = (id)[v3 appendString:self->_lutIdentifier];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (NSString)nonVariatedIdentifier
{
  id v3 = _PRPosterContentStyleStringForType([(PRPosterContentLUTStyle *)self type]);
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

- (void)applyStyleWithRenderer:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 renderLUTStyle:self];
  }
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

- (PRPosterContentLUTStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lutIdentifier"];

  v6 = [(PRPosterContentLUTStyle *)self initWithLUTIdentifier:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PRPosterContentLUTStyle alloc];
  lutIdentifier = self->_lutIdentifier;
  return [(PRPosterContentLUTStyle *)v4 initWithLUTIdentifier:lutIdentifier];
}

- (void).cxx_destruct
{
}

@end