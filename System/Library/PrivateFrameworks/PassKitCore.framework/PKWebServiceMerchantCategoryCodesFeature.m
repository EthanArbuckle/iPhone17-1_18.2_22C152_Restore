@interface PKWebServiceMerchantCategoryCodesFeature
+ (id)merchantCategoryCodesFeatureWithWebService:(id)a3;
- (NSArray)appleCardUnsupportedMerchantCategoryCodes;
- (NSArray)appleCashUnsupportedMerchantCategoryCodes;
- (PKWebServiceMerchantCategoryCodesFeature)initWithDictionary:(id)a3 region:(id)a4;
@end

@implementation PKWebServiceMerchantCategoryCodesFeature

- (PKWebServiceMerchantCategoryCodesFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKWebServiceMerchantCategoryCodesFeature;
  v7 = [(PKWebServiceRegionFeature *)&v13 initWithFeatureType:16 dictionary:v6 region:a4];
  if (v7)
  {
    uint64_t v8 = [v6 PKArrayForKey:@"appleCardUnsupportedMerchantCategoryCodes"];
    appleCardUnsupportedMerchantCategoryCodes = v7->_appleCardUnsupportedMerchantCategoryCodes;
    v7->_appleCardUnsupportedMerchantCategoryCodes = (NSArray *)v8;

    uint64_t v10 = [v6 PKArrayForKey:@"appleCashUnsupportedMerchantCategoryCodes"];
    appleCashUnsupportedMerchantCategoryCodes = v7->_appleCashUnsupportedMerchantCategoryCodes;
    v7->_appleCashUnsupportedMerchantCategoryCodes = (NSArray *)v10;
  }
  return v7;
}

+ (id)merchantCategoryCodesFeatureWithWebService:(id)a3
{
  return (id)[a3 supportedRegionFeatureOfType:16 didFailOSVersionRequirements:0];
}

- (NSArray)appleCardUnsupportedMerchantCategoryCodes
{
  return self->_appleCardUnsupportedMerchantCategoryCodes;
}

- (NSArray)appleCashUnsupportedMerchantCategoryCodes
{
  return self->_appleCashUnsupportedMerchantCategoryCodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleCashUnsupportedMerchantCategoryCodes, 0);
  objc_storeStrong((id *)&self->_appleCardUnsupportedMerchantCategoryCodes, 0);
}

@end