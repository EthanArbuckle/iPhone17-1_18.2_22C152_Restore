@interface PKServiceProviderPurchaseData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPKServiceProviderPurchaseData:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (PKServiceProviderPurchaseData)initWithCoder:(id)a3;
- (PKServiceProviderPurchaseData)initWithDictionary:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDictionaryRepresentation:(id)a3;
@end

@implementation PKServiceProviderPurchaseData

- (PKServiceProviderPurchaseData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKServiceProviderPurchaseData;
  v5 = [(PKServiceProviderPurchaseData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKServiceProviderPurchaseData)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKServiceProviderPurchaseData;
  v5 = [(PKServiceProviderPurchaseData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dictionary"];
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(PKServiceProviderPurchaseData *)self isEqualToPKServiceProviderPurchaseData:v4];

  return v5;
}

- (BOOL)isEqualToPKServiceProviderPurchaseData:(id)a3
{
  if (self == a3) {
    return 1;
  }
  dictionaryRepresentation = self->_dictionaryRepresentation;
  id v4 = [a3 dictionaryRepresentation];
  LOBYTE(dictionaryRepresentation) = [(NSDictionary *)dictionaryRepresentation isEqualToDictionary:v4];

  return (char)dictionaryRepresentation;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  dictionaryRepresentation = self->_dictionaryRepresentation;
  if (dictionaryRepresentation)
  {
    BOOL v5 = [(NSDictionary *)dictionaryRepresentation description];
    [v3 appendFormat:@"dictionary: '%@'; ", v5];
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void)setDictionaryRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end