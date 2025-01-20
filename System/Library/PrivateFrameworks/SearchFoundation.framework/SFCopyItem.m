@interface SFCopyItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFCopyItem)initWithCoder:(id)a3;
- (SFCopyItem)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFCopyItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v3 init];
}

- (NSData)jsonData
{
  v2 = [[_SFPBCopyItem alloc] initWithFacade:self];
  id v3 = [(_SFPBCopyItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCopyItem alloc] initWithFacade:self];
  id v3 = [(_SFPBCopyItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBCopyItem alloc] initWithFacade:self];
  v5 = [(_SFPBCopyItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCopyItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBCopyItem alloc] initWithData:v5];
  v7 = [(SFCopyItem *)self initWithProtobuf:v6];

  return v7;
}

- (SFCopyItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFCopyItem;
  v5 = [(SFCopyItem *)&v15 init];
  if (v5)
  {
    v6 = [v4 textCopyItem];

    if (v6)
    {
      v7 = [SFTextCopyItem alloc];
      uint64_t v8 = [v4 textCopyItem];
    }
    else
    {
      v10 = [v4 spotlightCopyItem];

      if (v10)
      {
        v7 = [SFCoreSpotlightCopyItem alloc];
        uint64_t v8 = [v4 spotlightCopyItem];
      }
      else
      {
        v11 = [v4 imageCopyItem];

        if (v11)
        {
          v7 = [SFImageCopyItem alloc];
          uint64_t v8 = [v4 imageCopyItem];
        }
        else
        {
          v12 = [v4 contactCopyItem];

          if (!v12)
          {
            v9 = v5;
            goto LABEL_12;
          }
          v7 = [SFContactCopyItem alloc];
          uint64_t v8 = [v4 contactCopyItem];
        }
      }
    }
    v13 = (void *)v8;
    v9 = [(SFTextCopyItem *)v7 initWithProtobuf:v8];
  }
  else
  {
    v9 = 0;
  }
LABEL_12:

  return v9;
}

@end