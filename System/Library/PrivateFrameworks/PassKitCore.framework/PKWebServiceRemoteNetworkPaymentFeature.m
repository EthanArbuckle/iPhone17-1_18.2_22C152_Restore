@interface PKWebServiceRemoteNetworkPaymentFeature
+ (id)remoteNetworkPaymentFeatureWithWebService:(id)a3;
- (BOOL)enabled;
- (NSArray)unsupportedIssuerCardCountryCodes;
- (NSArray)unsupportedNetworks;
- (PKWebServiceRemoteNetworkPaymentFeature)initWithDictionary:(id)a3 region:(id)a4;
@end

@implementation PKWebServiceRemoteNetworkPaymentFeature

- (PKWebServiceRemoteNetworkPaymentFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKWebServiceRemoteNetworkPaymentFeature;
  v7 = [(PKWebServiceRegionFeature *)&v19 initWithFeatureType:17 dictionary:v6 region:a4];
  if (v7)
  {
    v8 = [v6 PKNumberForKey:@"enabled"];
    v9 = v8;
    if (v8) {
      char v10 = [v8 BOOLValue];
    }
    else {
      char v10 = 1;
    }
    v7->_enabled = v10;
    uint64_t v11 = [v6 PKArrayForKey:@"unsupportedIssuerCardCountryCodes"];
    v12 = (void *)v11;
    v13 = (void *)MEMORY[0x1E4F1CBF0];
    if (v11) {
      v14 = (void *)v11;
    }
    else {
      v14 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v7->_unsupportedIssuerCardCountryCodes, v14);

    uint64_t v15 = [v6 PKArrayForKey:@"unsupportedNetworks"];
    v16 = (void *)v15;
    if (v15) {
      v17 = (void *)v15;
    }
    else {
      v17 = v13;
    }
    objc_storeStrong((id *)&v7->_unsupportedNetworks, v17);
  }
  return v7;
}

+ (id)remoteNetworkPaymentFeatureWithWebService:(id)a3
{
  return (id)[a3 supportedRegionFeatureOfType:17 didFailOSVersionRequirements:0];
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSArray)unsupportedIssuerCardCountryCodes
{
  return self->_unsupportedIssuerCardCountryCodes;
}

- (NSArray)unsupportedNetworks
{
  return self->_unsupportedNetworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsupportedNetworks, 0);
  objc_storeStrong((id *)&self->_unsupportedIssuerCardCountryCodes, 0);
}

@end