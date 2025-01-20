@interface PKPaymentPassRequest
- (NSString)passTypeID;
- (NSString)serialNumber;
- (PKPaymentPassRequest)initWithPassTypeID:(id)a3 serialNumber:(id)a4;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setPassTypeID:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation PKPaymentPassRequest

- (PKPaymentPassRequest)initWithPassTypeID:(id)a3 serialNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentPassRequest;
  v8 = [(PKOverlayableWebServiceRequest *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    passTypeID = v8->_passTypeID;
    v8->_passTypeID = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    serialNumber = v8->_serialNumber;
    v8->_serialNumber = (NSString *)v11;
  }
  return v8;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  passTypeID = self->_passTypeID;
  objc_super v14 = @"passes";
  v15 = passTypeID;
  serialNumber = self->_serialNumber;
  id v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 arrayWithObjects:&v14 count:3];
  uint64_t v11 = -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v9, v10, 0, v8, v14, v15, serialNumber, v17);

  [v11 setHTTPMethod:@"GET"];
  v12 = (void *)[v11 copy];

  return v12;
}

- (NSString)passTypeID
{
  return self->_passTypeID;
}

- (void)setPassTypeID:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeID, 0);
}

@end