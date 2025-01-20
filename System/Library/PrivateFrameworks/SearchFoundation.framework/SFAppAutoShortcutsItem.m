@interface SFAppAutoShortcutsItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)bundleIdentifier;
- (SFAppAutoShortcutsItem)initWithCoder:(id)a3;
- (SFAppAutoShortcutsItem)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation SFAppAutoShortcutsItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unint64_t)hash
{
  v2 = [(SFAppAutoShortcutsItem *)self bundleIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFAppAutoShortcutsItem *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFAppAutoShortcutsItem *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    v6 = [(SFAppAutoShortcutsItem *)self bundleIdentifier];
    v7 = [(SFAppAutoShortcutsItem *)v5 bundleIdentifier];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFAppAutoShortcutsItem *)self bundleIdentifier];
      if (v8)
      {
        v9 = [(SFAppAutoShortcutsItem *)self bundleIdentifier];
        v10 = [(SFAppAutoShortcutsItem *)v5 bundleIdentifier];
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
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFAppAutoShortcutsItem *)self bundleIdentifier];
  v6 = (void *)[v5 copy];
  [v4 setBundleIdentifier:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBAppAutoShortcutsItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBAppAutoShortcutsItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBAppAutoShortcutsItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBAppAutoShortcutsItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBAppAutoShortcutsItem alloc] initWithFacade:self];
  v5 = [(_SFPBAppAutoShortcutsItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFAppAutoShortcutsItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBAppAutoShortcutsItem alloc] initWithData:v5];
  v7 = [(SFAppAutoShortcutsItem *)self initWithProtobuf:v6];

  return v7;
}

- (SFAppAutoShortcutsItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAppAutoShortcutsItem;
  v5 = [(SFAppAutoShortcutsItem *)&v10 init];
  if (v5)
  {
    v6 = [v4 bundleIdentifier];

    if (v6)
    {
      v7 = [v4 bundleIdentifier];
      [(SFAppAutoShortcutsItem *)v5 setBundleIdentifier:v7];
    }
    v8 = v5;
  }

  return v5;
}

@end