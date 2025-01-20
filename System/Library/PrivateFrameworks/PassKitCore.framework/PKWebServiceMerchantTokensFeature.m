@interface PKWebServiceMerchantTokensFeature
- (PKWebServiceMerchantTokensFeature)initWithDictionary:(id)a3 region:(id)a4;
@end

@implementation PKWebServiceMerchantTokensFeature

- (PKWebServiceMerchantTokensFeature)initWithDictionary:(id)a3 region:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKWebServiceMerchantTokensFeature;
  return [(PKWebServiceRegionFeature *)&v5 initWithFeatureType:3 dictionary:a3 region:a4];
}

@end