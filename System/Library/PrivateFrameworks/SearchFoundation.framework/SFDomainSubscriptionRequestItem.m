@interface SFDomainSubscriptionRequestItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFDomainSubscriptionRequestItem)initWithCoder:(id)a3;
- (SFDomainSubscriptionRequestItem)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFDomainSubscriptionRequestItem

- (SFDomainSubscriptionRequestItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFDomainSubscriptionRequestItem;
  v5 = [(SFDomainSubscriptionRequestItem *)&v11 init];
  if (v5)
  {
    v6 = [v4 sportsSubscriptionRequestItem];

    if (v6)
    {
      v7 = [SFSportsSubscriptionRequestItem alloc];
      v8 = [v4 sportsSubscriptionRequestItem];
      v9 = [(SFSportsSubscriptionRequestItem *)v7 initWithProtobuf:v8];
    }
    else
    {
      v9 = v5;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

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
  v2 = [[_SFPBDomainSubscriptionRequestItem alloc] initWithFacade:self];
  id v3 = [(_SFPBDomainSubscriptionRequestItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBDomainSubscriptionRequestItem alloc] initWithFacade:self];
  id v3 = [(_SFPBDomainSubscriptionRequestItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBDomainSubscriptionRequestItem alloc] initWithFacade:self];
  v5 = [(_SFPBDomainSubscriptionRequestItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFDomainSubscriptionRequestItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBDomainSubscriptionRequestItem alloc] initWithData:v5];
  v7 = [(SFDomainSubscriptionRequestItem *)self initWithProtobuf:v6];

  return v7;
}

@end