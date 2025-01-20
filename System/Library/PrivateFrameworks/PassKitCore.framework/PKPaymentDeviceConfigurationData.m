@interface PKPaymentDeviceConfigurationData
+ (BOOL)supportsSecureCoding;
- (BOOL)devSigned;
- (NSNumber)primaryJSBLSequenceCounter;
- (NSString)secureElementIdentifier;
- (PKPaymentDeviceConfigurationData)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDevSigned:(BOOL)a3;
- (void)setPrimaryJSBLSequenceCounter:(id)a3;
- (void)setSecureElementIdentifier:(id)a3;
@end

@implementation PKPaymentDeviceConfigurationData

- (PKPaymentDeviceConfigurationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentDeviceConfigurationData;
  v5 = [(PKPaymentDeviceConfigurationData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureElementIdentifier"];
    secureElementIdentifier = v5->_secureElementIdentifier;
    v5->_secureElementIdentifier = (NSString *)v6;

    v5->_devSigned = [v4 decodeBoolForKey:@"devSigned"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"jsblSequenceCounter"];
    primaryJSBLSequenceCounter = v5->_primaryJSBLSequenceCounter;
    v5->_primaryJSBLSequenceCounter = (NSNumber *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKPaymentDeviceConfigurationData *)self secureElementIdentifier];
  [v4 encodeObject:v5 forKey:@"secureElementIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[PKPaymentDeviceConfigurationData devSigned](self, "devSigned"), @"devSigned");
  id v6 = [(PKPaymentDeviceConfigurationData *)self primaryJSBLSequenceCounter];
  [v4 encodeObject:v6 forKey:@"jsblSequenceCounter"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKPaymentDeviceConfigurationData allocWithZone:](PKPaymentDeviceConfigurationData, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_secureElementIdentifier copyWithZone:a3];
  secureElementIdentifier = v5->_secureElementIdentifier;
  v5->_secureElementIdentifier = (NSString *)v6;

  v5->_devSigned = self->_devSigned;
  objc_storeStrong((id *)&v5->_primaryJSBLSequenceCounter, self->_primaryJSBLSequenceCounter);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)primaryJSBLSequenceCounter
{
  return self->_primaryJSBLSequenceCounter;
}

- (void)setPrimaryJSBLSequenceCounter:(id)a3
{
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
}

- (BOOL)devSigned
{
  return self->_devSigned;
}

- (void)setDevSigned:(BOOL)a3
{
  self->_devSigned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryJSBLSequenceCounter, 0);
}

@end