@interface CSDCarrierBundlePhoneNumberProvider
- (CSDCarrierBundlePhoneNumberProvider)initWithUUID:(id)a3 carrierPhoneNumbers:(id)a4;
- (NSArray)carrierPhoneNumbers;
- (NSUUID)uuid;
@end

@implementation CSDCarrierBundlePhoneNumberProvider

- (CSDCarrierBundlePhoneNumberProvider)initWithUUID:(id)a3 carrierPhoneNumbers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSDCarrierBundlePhoneNumberProvider;
  v9 = [(CSDCarrierBundlePhoneNumberProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    v11 = (NSArray *)[v8 copy];
    carrierPhoneNumbers = v10->_carrierPhoneNumbers;
    v10->_carrierPhoneNumbers = v11;
  }
  return v10;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSArray)carrierPhoneNumbers
{
  return self->_carrierPhoneNumbers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierPhoneNumbers, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end