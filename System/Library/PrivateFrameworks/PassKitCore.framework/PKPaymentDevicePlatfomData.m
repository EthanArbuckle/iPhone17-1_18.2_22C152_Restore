@interface PKPaymentDevicePlatfomData
+ (BOOL)supportsSecureCoding;
- (NSData)platformData;
- (NSData)platformDataSignature;
- (PKPaymentDevicePlatfomData)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPlatformData:(id)a3;
- (void)setPlatformDataSignature:(id)a3;
@end

@implementation PKPaymentDevicePlatfomData

- (PKPaymentDevicePlatfomData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentDevicePlatfomData;
  v5 = [(PKPaymentDevicePlatfomData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platformData"];
    platformData = v5->_platformData;
    v5->_platformData = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platformDataSignature"];
    platformDataSignature = v5->_platformDataSignature;
    v5->_platformDataSignature = (NSData *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  platformData = self->_platformData;
  id v5 = a3;
  [v5 encodeObject:platformData forKey:@"platformData"];
  [v5 encodeObject:self->_platformDataSignature forKey:@"platformDataSignature"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentDevicePlatfomData allocWithZone:](PKPaymentDevicePlatfomData, "allocWithZone:") init];
  uint64_t v6 = [(NSData *)self->_platformData copyWithZone:a3];
  platformData = v5->_platformData;
  v5->_platformData = (NSData *)v6;

  uint64_t v8 = [(NSData *)self->_platformDataSignature copyWithZone:a3];
  platformDataSignature = v5->_platformDataSignature;
  v5->_platformDataSignature = (NSData *)v8;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)platformData
{
  return self->_platformData;
}

- (void)setPlatformData:(id)a3
{
}

- (NSData)platformDataSignature
{
  return self->_platformDataSignature;
}

- (void)setPlatformDataSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformDataSignature, 0);
  objc_storeStrong((id *)&self->_platformData, 0);
}

@end