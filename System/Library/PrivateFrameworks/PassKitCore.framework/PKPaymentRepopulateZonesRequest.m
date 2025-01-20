@interface PKPaymentRepopulateZonesRequest
- (NSArray)cloudStoreZoneNames;
- (PKPaymentRepopulateZonesRequest)initWithCloudStoreZoneNames:(id)a3;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
@end

@implementation PKPaymentRepopulateZonesRequest

- (PKPaymentRepopulateZonesRequest)initWithCloudStoreZoneNames:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentRepopulateZonesRequest;
  v6 = [(PKOverlayableWebServiceRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cloudStoreZoneNames, a3);
  }

  return v7;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v18 = @"devices";
  id v19 = v8;
  v20 = @"repopulateZones";
  objc_super v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 arrayWithObjects:&v18 count:3];
  v13 = -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v10, v18, v19, v20, v21);

  [v13 setHTTPMethod:@"POST"];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(NSArray *)self->_cloudStoreZoneNames count]) {
    [v14 setObject:self->_cloudStoreZoneNames forKey:@"cloudStoreZoneNames"];
  }
  v15 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v14];
  [v13 setHTTPBody:v15];

  v16 = (void *)[v13 copy];
  return v16;
}

- (NSArray)cloudStoreZoneNames
{
  return self->_cloudStoreZoneNames;
}

- (void).cxx_destruct
{
}

@end