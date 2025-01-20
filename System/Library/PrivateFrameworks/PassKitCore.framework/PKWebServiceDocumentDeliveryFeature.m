@interface PKWebServiceDocumentDeliveryFeature
+ (BOOL)isEnabledWithWebService:(id)a3;
+ (id)featureWithWebService:(id)a3;
+ (id)webServiceURLWithWebService:(id)a3;
- (BOOL)isEnabled;
- (NSURL)webServiceURL;
- (PKWebServiceDocumentDeliveryFeature)initWithDictionary:(id)a3 region:(id)a4;
@end

@implementation PKWebServiceDocumentDeliveryFeature

- (PKWebServiceDocumentDeliveryFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKWebServiceDocumentDeliveryFeature;
  v7 = [(PKWebServiceRegionFeature *)&v14 initWithFeatureType:12 dictionary:v6 region:a4];
  if (v7
    && (v7->_enabled = [v6 PKBoolForKey:@"enabled"],
        [v6 PKURLForKey:@"webServiceURL"],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        webServiceURL = v7->_webServiceURL,
        v7->_webServiceURL = (NSURL *)v8,
        webServiceURL,
        v7->_enabled)
    && !v7->_webServiceURL)
  {
    v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Missing webServiceURL for document delivery feature", v13, 2u);
    }

    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

+ (id)featureWithWebService:(id)a3
{
  id v3 = a3;
  if (!os_variant_has_internal_ui()
    || ([v3 supportedRegionFeatureOfType:13 didFailOSVersionRequirements:0],
        (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = [v3 supportedRegionFeatureOfType:12 didFailOSVersionRequirements:0];
  }

  return v4;
}

+ (BOOL)isEnabledWithWebService:(id)a3
{
  id v3 = [a1 featureWithWebService:a3];
  char v4 = [v3 isEnabled];

  return v4;
}

+ (id)webServiceURLWithWebService:(id)a3
{
  id v3 = [a1 featureWithWebService:a3];
  char v4 = [v3 webServiceURL];

  return v4;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSURL)webServiceURL
{
  return self->_webServiceURL;
}

- (void).cxx_destruct
{
}

@end