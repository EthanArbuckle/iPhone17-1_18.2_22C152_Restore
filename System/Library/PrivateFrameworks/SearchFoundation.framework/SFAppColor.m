@interface SFAppColor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)applicationBundleIdentifier;
- (SFAppColor)initWithCoder:(id)a3;
- (SFAppColor)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
@end

@implementation SFAppColor

- (void).cxx_destruct
{
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFAppColor;
  unint64_t v3 = [(SFColor *)&v7 hash];
  v4 = [(SFAppColor *)self applicationBundleIdentifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFAppColor *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFAppColor *)v4 isMemberOfClass:objc_opt_class()] {
         && (v13.receiver = self,
  }
             v13.super_class = (Class)SFAppColor,
             [(SFColor *)&v13 isEqual:v4]))
  {
    unint64_t v5 = v4;
    v6 = [(SFAppColor *)self applicationBundleIdentifier];
    objc_super v7 = [(SFAppColor *)v5 applicationBundleIdentifier];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFAppColor *)self applicationBundleIdentifier];
      if (v8)
      {
        v9 = [(SFAppColor *)self applicationBundleIdentifier];
        v10 = [(SFAppColor *)v5 applicationBundleIdentifier];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 1;
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFAppColor;
  id v4 = [(SFColor *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SFAppColor *)self applicationBundleIdentifier];
  v6 = (void *)[v5 copy];
  [v4 setApplicationBundleIdentifier:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBAppColor alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBAppColor *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBAppColor alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBAppColor *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFAppColor;
  [(SFColor *)&v3 encodeWithCoder:a3];
}

- (SFAppColor)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SFAppColor *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  objc_super v7 = [[_SFPBColor alloc] initWithData:v6];
  objc_super v8 = [[SFColor alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFColor *)v8 applicationBundleIdentifier];
    [(SFAppColor *)v5 setApplicationBundleIdentifier:v9];

    [(SFColor *)v8 redComponent];
    -[SFColor setRedComponent:](v5, "setRedComponent:");
    [(SFColor *)v8 greenComponent];
    -[SFColor setGreenComponent:](v5, "setGreenComponent:");
    [(SFColor *)v8 blueComponent];
    -[SFColor setBlueComponent:](v5, "setBlueComponent:");
    [(SFColor *)v8 alphaComponent];
    -[SFColor setAlphaComponent:](v5, "setAlphaComponent:");
    [(SFColor *)v5 setColorTintStyle:[(SFColor *)v8 colorTintStyle]];
    v10 = [(SFColor *)v8 darkModeColor];
    [(SFColor *)v5 setDarkModeColor:v10];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAppColor)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAppColor;
  unint64_t v5 = [(SFAppColor *)&v10 init];
  if (v5)
  {
    v6 = [v4 applicationBundleIdentifier];

    if (v6)
    {
      objc_super v7 = [v4 applicationBundleIdentifier];
      [(SFAppColor *)v5 setApplicationBundleIdentifier:v7];
    }
    objc_super v8 = v5;
  }

  return v5;
}

@end