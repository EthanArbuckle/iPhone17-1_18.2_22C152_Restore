@interface SFAppIconImage
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIconType;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)bundleIdentifier;
- (SFAppIconImage)initWithCoder:(id)a3;
- (SFAppIconImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)iconType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setIconType:(int)a3;
@end

@implementation SFAppIconImage

- (SFAppIconImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAppIconImage;
  v5 = [(SFAppIconImage *)&v10 init];
  if (v5)
  {
    v6 = [v4 bundleIdentifier];

    if (v6)
    {
      v7 = [v4 bundleIdentifier];
      [(SFAppIconImage *)v5 setBundleIdentifier:v7];
    }
    if ([v4 iconType]) {
      -[SFAppIconImage setIconType:](v5, "setIconType:", [v4 iconType]);
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (int)iconType
{
  return self->_iconType;
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
  v8.receiver = self;
  v8.super_class = (Class)SFAppIconImage;
  unint64_t v3 = [(SFImage *)&v8 hash];
  id v4 = [(SFAppIconImage *)self bundleIdentifier];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ [(SFAppIconImage *)self iconType] ^ v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (SFAppIconImage *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFAppIconImage *)v6 isMemberOfClass:objc_opt_class()])
    {
      v14.receiver = self;
      v14.super_class = (Class)SFAppIconImage;
      if ([(SFImage *)&v14 isEqual:v6])
      {
        v7 = v6;
        objc_super v8 = [(SFAppIconImage *)self bundleIdentifier];
        v9 = [(SFAppIconImage *)v7 bundleIdentifier];
        if ((v8 == 0) == (v9 != 0))
        {
          BOOL v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
        objc_super v10 = [(SFAppIconImage *)self bundleIdentifier];
        if (!v10
          || ([(SFAppIconImage *)self bundleIdentifier],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(SFAppIconImage *)v7 bundleIdentifier],
              id v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          int v12 = [(SFAppIconImage *)self iconType];
          BOOL v11 = v12 == [(SFAppIconImage *)v7 iconType];
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          BOOL v11 = 0;
        }

        goto LABEL_13;
      }
    }
    BOOL v11 = 0;
  }
LABEL_15:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFAppIconImage;
  id v4 = [(SFImage *)&v8 copyWithZone:a3];
  uint64_t v5 = [(SFAppIconImage *)self bundleIdentifier];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setBundleIdentifier:v6];

  objc_msgSend(v4, "setIconType:", -[SFAppIconImage iconType](self, "iconType"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBAppIconImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBAppIconImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBAppIconImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBAppIconImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBImage alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFAppIconImage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBImage alloc] initWithData:v5];
  v9.receiver = self;
  v9.super_class = (Class)SFAppIconImage;
  v7 = [(SFImage *)&v9 initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasIconType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIconType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_iconType = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end