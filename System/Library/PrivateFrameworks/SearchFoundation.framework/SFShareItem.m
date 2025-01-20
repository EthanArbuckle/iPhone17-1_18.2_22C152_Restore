@interface SFShareItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFShareItem)initWithCoder:(id)a3;
- (SFShareItem)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFShareItem

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
  v2 = [[_SFPBShareItem alloc] initWithFacade:self];
  id v3 = [(_SFPBShareItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBShareItem alloc] initWithFacade:self];
  id v3 = [(_SFPBShareItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBShareItem alloc] initWithFacade:self];
  v5 = [(_SFPBShareItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFShareItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBShareItem alloc] initWithData:v5];
  v7 = [(SFShareItem *)self initWithProtobuf:v6];

  return v7;
}

- (SFShareItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFShareItem;
  v5 = [(SFShareItem *)&v13 init];
  if (v5)
  {
    v6 = [v4 urlShareItem];

    if (v6)
    {
      v7 = [SFURLShareItem alloc];
      uint64_t v8 = [v4 urlShareItem];
    }
    else
    {
      v10 = [v4 spotlightShareItem];

      if (!v10)
      {
        v9 = v5;
        goto LABEL_8;
      }
      v7 = [SFCoreSpotlightShareItem alloc];
      uint64_t v8 = [v4 spotlightShareItem];
    }
    v11 = (void *)v8;
    v9 = [(SFURLShareItem *)v7 initWithProtobuf:v8];
  }
  else
  {
    v9 = 0;
  }
LABEL_8:

  return v9;
}

@end