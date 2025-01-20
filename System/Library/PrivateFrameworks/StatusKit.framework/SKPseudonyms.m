@interface SKPseudonyms
- (IDSService)service;
- (SKPseudonyms)initWithIDSService:(id)a3;
- (id)propertiesWithUpdatedServices:(id)a3;
- (id)pseudonymForPseudonymURI:(id)a3;
- (id)pseudonymPropertiesWithFeatureID:(id)a3 expiryDurationInSeconds:(double)a4;
- (id)pseudonymPropertiesWithFeatureID:(id)a3 scopeID:(id)a4 expiryDurationInSeconds:(double)a5;
- (id)pseudonymsForMaskedURI:(id)a3;
- (id)pseudonymsForMaskedURI:(id)a3 matchingProperties:(id)a4;
- (void)provisionPseudonymForURI:(id)a3 withProperties:(id)a4 completion:(id)a5;
- (void)provisionPseudonymForURI:(id)a3 withProperties:(id)a4 requestProperties:(id)a5 completion:(id)a6;
- (void)provisionPseudonymWithProperties:(id)a3 completion:(id)a4;
- (void)provisionPseudonymWithProperties:(id)a3 requestProperties:(id)a4 completion:(id)a5;
- (void)renewPseudonym:(id)a3 forUpdatedDuration:(double)a4 completion:(id)a5;
- (void)revokePseudonym:(id)a3 completion:(id)a4;
- (void)setService:(id)a3;
@end

@implementation SKPseudonyms

- (SKPseudonyms)initWithIDSService:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKPseudonyms;
  v5 = [(SKPseudonyms *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:v4];
    service = v5->_service;
    v5->_service = (IDSService *)v6;
  }
  return v5;
}

- (id)pseudonymForPseudonymURI:(id)a3
{
  return (id)[(IDSService *)self->_service pseudonymForPseudonymURI:a3];
}

- (id)pseudonymsForMaskedURI:(id)a3
{
  return (id)[(IDSService *)self->_service pseudonymsForMaskedURI:a3];
}

- (id)pseudonymsForMaskedURI:(id)a3 matchingProperties:(id)a4
{
  service = self->_service;
  id v7 = a3;
  v8 = [(SKPseudonyms *)self propertiesWithUpdatedServices:a4];
  objc_super v9 = [(IDSService *)service pseudonymsForMaskedURI:v7 matchingProperties:v8];

  return v9;
}

- (void)provisionPseudonymWithProperties:(id)a3 completion:(id)a4
{
  service = self->_service;
  id v7 = a4;
  id v8 = [(SKPseudonyms *)self propertiesWithUpdatedServices:a3];
  [(IDSService *)service provisionPseudonymWithProperties:v8 completion:v7];
}

- (void)provisionPseudonymWithProperties:(id)a3 requestProperties:(id)a4 completion:(id)a5
{
  service = self->_service;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(SKPseudonyms *)self propertiesWithUpdatedServices:a3];
  [(IDSService *)service provisionPseudonymWithProperties:v11 requestProperties:v10 completion:v9];
}

- (void)provisionPseudonymForURI:(id)a3 withProperties:(id)a4 completion:(id)a5
{
  service = self->_service;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(SKPseudonyms *)self propertiesWithUpdatedServices:a4];
  [(IDSService *)service provisionPseudonymForURI:v10 withProperties:v11 completion:v9];
}

- (void)provisionPseudonymForURI:(id)a3 withProperties:(id)a4 requestProperties:(id)a5 completion:(id)a6
{
  service = self->_service;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [(SKPseudonyms *)self propertiesWithUpdatedServices:a4];
  [(IDSService *)service provisionPseudonymForURI:v13 withProperties:v14 requestProperties:v12 completion:v11];
}

- (void)renewPseudonym:(id)a3 forUpdatedDuration:(double)a4 completion:(id)a5
{
}

- (void)revokePseudonym:(id)a3 completion:(id)a4
{
}

- (id)pseudonymPropertiesWithFeatureID:(id)a3 scopeID:(id)a4 expiryDurationInSeconds:(double)a5
{
  return (id)[(IDSService *)self->_service pseudonymPropertiesWithFeatureID:a3 scopeID:a4 expiryDurationInSeconds:a5];
}

- (id)pseudonymPropertiesWithFeatureID:(id)a3 expiryDurationInSeconds:(double)a4
{
  return (id)[(IDSService *)self->_service pseudonymPropertiesWithFeatureID:a3 expiryDurationInSeconds:a4];
}

- (id)propertiesWithUpdatedServices:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [v5 allowedServices];
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = MEMORY[0x263EFFA68];
  }
  id v10 = (void *)[v6 initWithArray:v9];

  id v11 = [(IDSService *)self->_service serviceIdentifier];
  [v10 addObject:v11];

  [v10 addObject:@"com.apple.private.alloy.status.keysharing"];
  id v12 = [v10 allObjects];
  id v13 = [v5 withUpdatedAllowedServices:v12];

  return v13;
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end