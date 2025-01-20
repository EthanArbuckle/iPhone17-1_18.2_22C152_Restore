@interface PKCarKeyCredentialRegistrationMetadata
- (NSString)make;
- (NSString)model;
- (NSString)personalizedVehicleIdentifier;
- (PKCarKeyCredentialRegistrationMetadata)initWithMake:(id)a3 model:(id)a4 keyType:(int64_t)a5;
- (int64_t)keyType;
- (void)setPersonalizedVehicleIdentifier:(id)a3;
@end

@implementation PKCarKeyCredentialRegistrationMetadata

- (PKCarKeyCredentialRegistrationMetadata)initWithMake:(id)a3 model:(id)a4 keyType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKCarKeyCredentialRegistrationMetadata;
  v11 = [(PKCredentialRegistrationMetadata *)&v14 initWithProductType:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_make, a3);
    objc_storeStrong((id *)&v12->_model, a4);
    v12->_keyType = a5;
  }

  return v12;
}

- (NSString)make
{
  return self->_make;
}

- (NSString)model
{
  return self->_model;
}

- (int64_t)keyType
{
  return self->_keyType;
}

- (NSString)personalizedVehicleIdentifier
{
  return self->_personalizedVehicleIdentifier;
}

- (void)setPersonalizedVehicleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizedVehicleIdentifier, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_make, 0);
}

@end