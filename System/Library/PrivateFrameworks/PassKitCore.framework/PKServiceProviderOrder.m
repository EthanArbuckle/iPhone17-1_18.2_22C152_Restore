@interface PKServiceProviderOrder
+ (BOOL)supportsSecureCoding;
- (NSData)appletValue;
- (NSDictionary)serviceProviderData;
- (NSString)identifier;
- (NSString)itemDescription;
- (NSString)serviceProviderIdentifier;
- (NSString)transactionIdentifier;
- (PKServiceProviderOrder)init;
- (PKServiceProviderOrder)initWithCoder:(id)a3;
- (id)_itemDictionary;
- (id)_paymentInstrumentDictionary;
- (id)dictionaryRepresentation;
- (unint64_t)paymentInstrumentType;
- (void)encodeWithCoder:(id)a3;
- (void)setAppletValue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setItemDescription:(id)a3;
- (void)setPaymentInstrumentType:(unint64_t)a3;
- (void)setServiceProviderData:(id)a3;
- (void)setServiceProviderIdentifier:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
@end

@implementation PKServiceProviderOrder

- (PKServiceProviderOrder)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKServiceProviderOrder;
  v2 = [(PKServiceProviderOrder *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionary];
    serviceProviderData = v2->_serviceProviderData;
    v2->_serviceProviderData = (NSDictionary *)v6;

    v2->_paymentInstrumentType = 1;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKServiceProviderOrder)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKServiceProviderOrder;
  v5 = [(PKServiceProviderOrder *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemDescription"];
    itemDescription = v5->_itemDescription;
    v5->_itemDescription = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceProviderIdentifier"];
    serviceProviderIdentifier = v5->_serviceProviderIdentifier;
    v5->_serviceProviderIdentifier = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"serviceProviderData"];
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v18;

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentInstrumentType"];
    v5->_paymentInstrumentType = [@"Applet" isEqualToString:v20];

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appletValue"];
    appletValue = v5->_appletValue;
    v5->_appletValue = (NSData *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionIdentifier"];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v23;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"identifier"];
  [v6 encodeObject:self->_itemDescription forKey:@"itemDescription"];
  [v6 encodeObject:self->_serviceProviderIdentifier forKey:@"serviceProviderIdentifier"];
  [v6 encodeObject:self->_serviceProviderData forKey:@"serviceProviderData"];
  if (self->_paymentInstrumentType == 1) {
    v5 = @"Applet";
  }
  else {
    v5 = @"Unknown";
  }
  [v6 encodeObject:v5 forKey:@"paymentInstrumentType"];
  [v6 encodeObject:self->_appletValue forKey:@"appletValue"];
  [v6 encodeObject:self->_transactionIdentifier forKey:@"transactionIdentifier"];
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKeyedSubscript:@"orderId"];
  }
  id v6 = [(PKServiceProviderOrder *)self _itemDictionary];
  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:@"item"];
  }
  v7 = (void *)[v4 copy];

  return v7;
}

- (id)_itemDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  itemDescription = self->_itemDescription;
  if (itemDescription) {
    [v3 setObject:itemDescription forKeyedSubscript:@"description"];
  }
  serviceProviderIdentifier = self->_serviceProviderIdentifier;
  if (serviceProviderIdentifier) {
    [v4 setObject:serviceProviderIdentifier forKeyedSubscript:@"serviceProviderIdentifier"];
  }
  v7 = [(PKServiceProviderOrder *)self serviceProviderData];
  if (v7) {
    [v4 setObject:v7 forKeyedSubscript:@"serviceProviderData"];
  }
  uint64_t v8 = [(PKServiceProviderOrder *)self _paymentInstrumentDictionary];
  if (v8) {
    [v4 setObject:v8 forKeyedSubscript:@"paymentInstrument"];
  }
  transactionIdentifier = self->_transactionIdentifier;
  if (transactionIdentifier) {
    [v4 setObject:transactionIdentifier forKeyedSubscript:@"transactionIdentifier"];
  }
  uint64_t v10 = (void *)[v4 copy];

  return v10;
}

- (id)_paymentInstrumentDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  if (self->_paymentInstrumentType == 1) {
    v5 = @"Applet";
  }
  else {
    v5 = @"Unknown";
  }
  [v3 setObject:v5 forKeyedSubscript:@"type"];
  if (self->_paymentInstrumentType == 1)
  {
    appletValue = self->_appletValue;
    if (appletValue)
    {
      v7 = [(NSData *)appletValue hexEncoding];
      [v4 setObject:v7 forKeyedSubscript:@"value"];

      serviceProviderIdentifier = self->_serviceProviderIdentifier;
      if (serviceProviderIdentifier)
      {
        objc_super v9 = [(NSString *)serviceProviderIdentifier dataUsingEncoding:4];
        uint64_t v10 = [v9 SHA256Hash];
        v11 = [v10 hexEncoding];
        [v4 setObject:v11 forKeyedSubscript:@"merchantId"];
      }
    }
  }
  v12 = (void *)[v4 copy];

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
}

- (NSString)serviceProviderIdentifier
{
  return self->_serviceProviderIdentifier;
}

- (void)setServiceProviderIdentifier:(id)a3
{
}

- (NSDictionary)serviceProviderData
{
  return self->_serviceProviderData;
}

- (void)setServiceProviderData:(id)a3
{
}

- (unint64_t)paymentInstrumentType
{
  return self->_paymentInstrumentType;
}

- (void)setPaymentInstrumentType:(unint64_t)a3
{
  self->_paymentInstrumentType = a3;
}

- (NSData)appletValue
{
  return self->_appletValue;
}

- (void)setAppletValue:(id)a3
{
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_appletValue, 0);
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_serviceProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end