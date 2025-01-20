@interface PKServiceProviderPaymentRequest
+ (BOOL)supportsSecureCoding;
+ (id)availableNetworks;
- (BOOL)isEqual:(id)a3;
- (NSString)targetDeviceSerialNumber;
- (PKServiceProviderOrder)serviceProviderOrder;
- (PKServiceProviderPaymentRequest)initWithCoder:(id)a3;
- (PKServiceProviderPaymentRequest)initWithServiceProviderOrder:(id)a3;
- (PKServiceProviderPaymentRequest)initWithServiceProviderOrder:(id)a3 targetDeviceSerialNumber:(id)a4;
- (id)merchantIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKServiceProviderPaymentRequest

- (PKServiceProviderPaymentRequest)initWithServiceProviderOrder:(id)a3
{
  return [(PKServiceProviderPaymentRequest *)self initWithServiceProviderOrder:a3 targetDeviceSerialNumber:0];
}

- (PKServiceProviderPaymentRequest)initWithServiceProviderOrder:(id)a3 targetDeviceSerialNumber:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKServiceProviderPaymentRequest;
  v9 = [(PKPaymentRequest *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceProviderOrder, a3);
    uint64_t v11 = [v8 copy];
    targetDeviceSerialNumber = v10->_targetDeviceSerialNumber;
    v10->_targetDeviceSerialNumber = (NSString *)v11;

    [(PKPaymentRequest *)v10 setRequestType:8];
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKServiceProviderPaymentRequest;
  if ([(PKPaymentRequest *)&v11 isEqual:v4])
  {
    serviceProviderOrder = self->_serviceProviderOrder;
    uint64_t v6 = [v4 serviceProviderOrder];
    id v7 = (void *)v6;
    if (serviceProviderOrder) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8) {
      char v9 = serviceProviderOrder == (PKServiceProviderOrder *)v6;
    }
    else {
      char v9 = [(PKServiceProviderOrder *)serviceProviderOrder isEqual:v6];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKServiceProviderPaymentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKServiceProviderPaymentRequest;
  v5 = [(PKPaymentRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceProviderOrder"];
    serviceProviderOrder = v5->_serviceProviderOrder;
    v5->_serviceProviderOrder = (PKServiceProviderOrder *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetDeviceSerialNumber"];
    targetDeviceSerialNumber = v5->_targetDeviceSerialNumber;
    v5->_targetDeviceSerialNumber = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKServiceProviderPaymentRequest;
  id v4 = a3;
  [(PKPaymentRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_serviceProviderOrder, @"serviceProviderOrder", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_targetDeviceSerialNumber forKey:@"targetDeviceSerialNumber"];
}

+ (id)availableNetworks
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___PKServiceProviderPaymentRequest;
  v2 = objc_msgSendSuper2(&v5, sel_availableNetworks);
  v3 = [v2 arrayByAddingObject:@"Barcode"];

  return v3;
}

- (id)merchantIdentifier
{
  return [(PKServiceProviderOrder *)self->_serviceProviderOrder serviceProviderIdentifier];
}

- (PKServiceProviderOrder)serviceProviderOrder
{
  return self->_serviceProviderOrder;
}

- (NSString)targetDeviceSerialNumber
{
  return self->_targetDeviceSerialNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDeviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_serviceProviderOrder, 0);
}

@end