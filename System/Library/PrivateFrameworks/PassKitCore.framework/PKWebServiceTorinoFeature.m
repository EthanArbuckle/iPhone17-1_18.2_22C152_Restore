@interface PKWebServiceTorinoFeature
- (NSArray)implicitFeatureSupportedNetworks;
- (PKWebServiceTorinoFeature)initWithDictionary:(id)a3 region:(id)a4;
@end

@implementation PKWebServiceTorinoFeature

- (PKWebServiceTorinoFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6 = a3;
  v7 = [(PKWebServiceRegionFeature *)self initWithFeatureType:6 dictionary:v6 region:a4];
  if (v7)
  {
    uint64_t v8 = [v6 PKArrayForKey:@"implicitFeatureSupportedNetworks"];
    implicitFeatureSupportedNetworks = v7->_implicitFeatureSupportedNetworks;
    v7->_implicitFeatureSupportedNetworks = (NSArray *)v8;
  }
  return v7;
}

- (void).cxx_destruct
{
}

- (NSArray)implicitFeatureSupportedNetworks
{
  return self->_implicitFeatureSupportedNetworks;
}

@end