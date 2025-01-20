@interface PKPassBarcodeSettings
+ (BOOL)supportsSecureCoding;
- (NSURL)barcodeServiceURL;
- (PKPassBarcodeSettings)initWithCoder:(id)a3;
- (PKPassBarcodeSettings)initWithDictionary:(id)a3;
- (int64_t)initialBarcodeFetchCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassBarcodeSettings

- (void).cxx_destruct
{
}

- (PKPassBarcodeSettings)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)PKPassBarcodeSettings;
    id v5 = [(PKPassBarcodeSettings *)&v8 init];
    if (v5)
    {
      *((void *)v5 + 1) = [v4 PKIntegerForKey:@"initialBarcodeFetchCount"];
      uint64_t v6 = [v4 PKURLForKey:@"barcodeServiceURL"];
      self = (PKPassBarcodeSettings *)*((void *)v5 + 2);
      *((void *)v5 + 2) = v6;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return (PKPassBarcodeSettings *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassBarcodeSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassBarcodeSettings;
  id v5 = [(PKPassBarcodeSettings *)&v9 init];
  if (v5)
  {
    v5->_initialBarcodeFetchCount = [v4 decodeIntegerForKey:@"initialBarcodeFetchCount"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"barcodeServiceURL"];
    barcodeServiceURL = v5->_barcodeServiceURL;
    v5->_barcodeServiceURL = (NSURL *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t initialBarcodeFetchCount = self->_initialBarcodeFetchCount;
  id v5 = a3;
  [v5 encodeInteger:initialBarcodeFetchCount forKey:@"initialBarcodeFetchCount"];
  [v5 encodeObject:self->_barcodeServiceURL forKey:@"barcodeServiceURL"];
}

- (int64_t)initialBarcodeFetchCount
{
  return self->_initialBarcodeFetchCount;
}

- (NSURL)barcodeServiceURL
{
  return self->_barcodeServiceURL;
}

@end