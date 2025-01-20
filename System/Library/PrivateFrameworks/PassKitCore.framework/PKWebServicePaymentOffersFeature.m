@interface PKWebServicePaymentOffersFeature
- (BOOL)isSupportedOnDevice:(id)a3;
- (PKWebServicePaymentOffersFeature)initWithDictionary:(id)a3 region:(id)a4;
- (id)description;
@end

@implementation PKWebServicePaymentOffersFeature

- (PKWebServicePaymentOffersFeature)initWithDictionary:(id)a3 region:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKWebServicePaymentOffersFeature;
  return [(PKWebServiceRegionFeature *)&v5 initWithFeatureType:15 dictionary:a3 region:a4];
}

- (BOOL)isSupportedOnDevice:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PKWebServiceRegionFeature *)self versionRange];

  if (v5)
  {
    v6 = [v4 deviceClass];
    v7 = +[PKOSVersionRequirement fromDeviceVersion];
    v8 = [(PKWebServiceRegionFeature *)self versionRange];
    char v9 = [v8 versionMeetsRequirements:v7 deviceClass:v6];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  v7 = [(PKWebServiceRegionFeature *)self versionRange];
  v8 = [v7 asDictionary];
  [v6 appendFormat:@"versionRange: '%@'; ", v8];

  [v6 appendFormat:@">"];
  char v9 = [NSString stringWithString:v6];

  return v9;
}

@end