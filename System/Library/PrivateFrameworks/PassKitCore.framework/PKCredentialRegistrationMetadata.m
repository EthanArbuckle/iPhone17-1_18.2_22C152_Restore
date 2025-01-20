@interface PKCredentialRegistrationMetadata
- (PKCredentialRegistrationMetadata)initWithProductType:(int64_t)a3;
- (int64_t)productType;
@end

@implementation PKCredentialRegistrationMetadata

- (PKCredentialRegistrationMetadata)initWithProductType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKCredentialRegistrationMetadata;
  result = [(PKCredentialRegistrationMetadata *)&v5 init];
  if (result) {
    result->_productType = a3;
  }
  return result;
}

- (int64_t)productType
{
  return self->_productType;
}

@end