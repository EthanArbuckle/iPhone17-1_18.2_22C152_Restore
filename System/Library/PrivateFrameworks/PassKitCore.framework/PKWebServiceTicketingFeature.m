@interface PKWebServiceTicketingFeature
- (BOOL)isIntegrationTypeSupported:(int64_t)a3;
- (PKWebServiceTicketingFeature)initWithDictionary:(id)a3 region:(id)a4;
@end

@implementation PKWebServiceTicketingFeature

- (PKWebServiceTicketingFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKWebServiceTicketingFeature;
  v8 = [(PKWebServiceRegionFeature *)&v17 initWithFeatureType:18 dictionary:v6 region:v7];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    for (uint64_t i = 0; i != 4; ++i)
    {
      v11 = [v6 objectForKey:off_1E56DD430[i]];
      v12 = v11;
      if (!v11 || [v11 PKBoolForKey:@"enabled"])
      {
        v13 = [NSNumber numberWithInteger:i];
        [v9 addObject:v13];
      }
    }
    uint64_t v14 = [v9 copy];
    supportedFeatures = v8->_supportedFeatures;
    v8->_supportedFeatures = (NSSet *)v14;
  }
  return v8;
}

- (BOOL)isIntegrationTypeSupported:(int64_t)a3
{
  supportedFeatures = self->_supportedFeatures;
  v4 = [NSNumber numberWithInteger:a3];
  LOBYTE(supportedFeatures) = [(NSSet *)supportedFeatures containsObject:v4];

  return (char)supportedFeatures;
}

- (void).cxx_destruct
{
}

@end