@interface RFTableSpacerColumnDefinition
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFTableSpacerColumnDefinition)initWithCoder:(id)a3;
- (RFTableSpacerColumnDefinition)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RFTableSpacerColumnDefinition

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
  v2 = [[_SFPBRFTableSpacerColumnDefinition alloc] initWithFacade:self];
  id v3 = [(_SFPBRFTableSpacerColumnDefinition *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFTableSpacerColumnDefinition alloc] initWithFacade:self];
  id v3 = [(_SFPBRFTableSpacerColumnDefinition *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBRFTableSpacerColumnDefinition alloc] initWithFacade:self];
  v5 = [(_SFPBRFTableSpacerColumnDefinition *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFTableSpacerColumnDefinition)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBRFTableSpacerColumnDefinition alloc] initWithData:v5];
  v7 = [(RFTableSpacerColumnDefinition *)self initWithProtobuf:v6];

  return v7;
}

- (RFTableSpacerColumnDefinition)initWithProtobuf:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RFTableSpacerColumnDefinition;
  id v3 = [(RFTableSpacerColumnDefinition *)&v7 init];
  id v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

@end