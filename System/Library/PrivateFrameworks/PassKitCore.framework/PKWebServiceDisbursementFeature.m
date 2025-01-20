@interface PKWebServiceDisbursementFeature
+ (id)disbursementFeatureWithWebService:(id)a3;
+ (id)fallbackSupportedNetworksIfNoFeatureFound;
- (NSSet)supportedNetworks;
- (PKWebServiceDisbursementFeature)initWithDictionary:(id)a3 region:(id)a4;
- (PKWebServiceDisbursementFeature)initWithSupportedNetworks:(id)a3;
@end

@implementation PKWebServiceDisbursementFeature

- (PKWebServiceDisbursementFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKWebServiceDisbursementFeature;
  v7 = [(PKWebServiceRegionFeature *)&v11 initWithFeatureType:9 dictionary:v6 region:a4];
  if (v7)
  {
    v8 = [v6 PKSetContaining:objc_opt_class() forKey:@"implicitFeatureSupportedNetworks"];
    v9 = v8;
    if (!v8) {
      v9 = objc_opt_new();
    }
    objc_storeStrong((id *)&v7->_supportedNetworks, v9);
    if (!v8) {
  }
    }
  return v7;
}

- (PKWebServiceDisbursementFeature)initWithSupportedNetworks:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKWebServiceDisbursementFeature;
  v5 = [(PKWebServiceDisbursementFeature *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    supportedNetworks = v5->_supportedNetworks;
    v5->_supportedNetworks = (NSSet *)v6;
  }
  return v5;
}

+ (id)disbursementFeatureWithWebService:(id)a3
{
  id v4 = a3;
  v5 = [v4 targetDevice];
  uint64_t v6 = [v5 paymentWebService:v4 supportedRegionFeatureOfType:9];

  if (!v6)
  {
    v7 = [PKWebServiceDisbursementFeature alloc];
    v8 = [a1 fallbackSupportedNetworksIfNoFeatureFound];
    uint64_t v6 = [(PKWebServiceDisbursementFeature *)v7 initWithSupportedNetworks:v8];
  }
  return v6;
}

+ (id)fallbackSupportedNetworksIfNoFeatureFound
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EE22B8D0, &unk_1EE22B8E8, &unk_1EE22B900, &unk_1EE22B918, 0);
}

- (NSSet)supportedNetworks
{
  return self->_supportedNetworks;
}

- (void).cxx_destruct
{
}

@end