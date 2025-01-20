@interface PKBarcodeEventMetadataRequest
+ (BOOL)supportsSecureCoding;
- (NSString)deviceAccountIdentifier;
- (NSString)lastUsedBarcodeIdentifier;
- (PKBarcodeEventMetadataRequest)initWithBarcodeIdentifier:(id)a3 deviceAccountIdentifier:(id)a4;
- (PKBarcodeEventMetadataRequest)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceAccountIdentifier:(id)a3;
- (void)setLastUsedBarcodeIdentifier:(id)a3;
@end

@implementation PKBarcodeEventMetadataRequest

- (PKBarcodeEventMetadataRequest)initWithBarcodeIdentifier:(id)a3 deviceAccountIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKBarcodeEventMetadataRequest;
  v9 = [(PKBarcodeEventMetadataRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lastUsedBarcodeIdentifier, a3);
    objc_storeStrong((id *)&v10->_deviceAccountIdentifier, a4);
  }

  return v10;
}

- (PKBarcodeEventMetadataRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKBarcodeEventMetadataRequest;
  v5 = [(PKBarcodeEventMetadataRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"barcodeIdentifier"];
    lastUsedBarcodeIdentifier = v5->_lastUsedBarcodeIdentifier;
    v5->_lastUsedBarcodeIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceAccountIdentifier"];
    deviceAccountIdentifier = v5->_deviceAccountIdentifier;
    v5->_deviceAccountIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  lastUsedBarcodeIdentifier = self->_lastUsedBarcodeIdentifier;
  id v5 = a3;
  [v5 encodeObject:lastUsedBarcodeIdentifier forKey:@"barcodeIdentifier"];
  [v5 encodeObject:self->_deviceAccountIdentifier forKey:@"deviceAccountIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; lastUsedBarcodeIdentifier: %@; deviceAccountIdentifier: %@>",
               objc_opt_class(),
               self,
               self->_lastUsedBarcodeIdentifier,
               self->_deviceAccountIdentifier);
}

- (NSString)deviceAccountIdentifier
{
  return self->_deviceAccountIdentifier;
}

- (void)setDeviceAccountIdentifier:(id)a3
{
}

- (NSString)lastUsedBarcodeIdentifier
{
  return self->_lastUsedBarcodeIdentifier;
}

- (void)setLastUsedBarcodeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedBarcodeIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceAccountIdentifier, 0);
}

@end