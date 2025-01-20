@interface PKBarcodeCredential
+ (BOOL)supportsSecureCoding;
- (NSDate)expirationTimestamp;
- (NSString)identifier;
- (PKBarcodeCredential)initWithCoder:(id)a3;
- (PKBarcodeCredential)initWithDictionary:(id)a3;
- (PKEncryptedDataObject)value;
- (id)asDictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setExpirationTimestamp:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PKBarcodeCredential

- (PKBarcodeCredential)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKBarcodeCredential;
  v5 = [(PKBarcodeCredential *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 objectForKey:@"expirationTimestamp"];
    uint64_t v9 = _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v8, 0, 0);
    expirationTimestamp = v5->_expirationTimestamp;
    v5->_expirationTimestamp = (NSDate *)v9;

    v11 = [PKEncryptedDataObject alloc];
    v12 = [v4 objectForKey:@"value"];
    uint64_t v13 = [(PKEncryptedDataObject *)v11 initWithWebServiceDictionary:v12];
    value = v5->_value;
    v5->_value = (PKEncryptedDataObject *)v13;
  }
  return v5;
}

- (id)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  id v4 = PKW3CDateStringFromDate(self->_expirationTimestamp);
  [v3 setObject:v4 forKeyedSubscript:@"expirationTimestamp"];

  v5 = [(PKEncryptedDataObject *)self->_value asWebServiceDictionary];
  [v3 setObject:v5 forKeyedSubscript:@"value"];

  uint64_t v6 = (void *)[v3 copy];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKBarcodeCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKBarcodeCredential;
  v5 = [(PKBarcodeCredential *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (PKEncryptedDataObject *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationTimestamp"];
    expirationTimestamp = v5->_expirationTimestamp;
    v5->_expirationTimestamp = (NSDate *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_value forKey:@"value"];
  [v5 encodeObject:self->_expirationTimestamp forKey:@"expirationTimestamp"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDate)expirationTimestamp
{
  return self->_expirationTimestamp;
}

- (void)setExpirationTimestamp:(id)a3
{
}

- (PKEncryptedDataObject)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_expirationTimestamp, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end