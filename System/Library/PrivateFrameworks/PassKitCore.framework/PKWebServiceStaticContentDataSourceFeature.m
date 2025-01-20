@interface PKWebServiceStaticContentDataSourceFeature
- (BOOL)blockStaticContentFetching;
- (BOOL)isEnabled;
- (NSURL)contentURL;
- (PKWebServiceStaticContentDataSourceFeature)initWithDictionary:(id)a3 region:(id)a4;
- (id)createProductsRequestWithIsFetchBlocked:(BOOL *)a3;
@end

@implementation PKWebServiceStaticContentDataSourceFeature

- (PKWebServiceStaticContentDataSourceFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKWebServiceStaticContentDataSourceFeature;
  v7 = [(PKWebServiceRegionFeature *)&v11 initWithFeatureType:14 dictionary:v6 region:a4];
  if (v7)
  {
    v7->_enabled = [v6 PKBoolForKey:@"enabled"];
    v7->_blockStaticContentFetching = [v6 PKBoolForKey:@"blockStaticContentFetching"];
    uint64_t v8 = [v6 PKURLForKey:@"staticContentURL"];
    contentURL = v7->_contentURL;
    v7->_contentURL = (NSURL *)v8;
  }
  return v7;
}

- (void).cxx_destruct
{
}

- (id)createProductsRequestWithIsFetchBlocked:(BOOL *)a3
{
  BOOL blockStaticContentFetching = self->_blockStaticContentFetching;
  if (a3) {
    *a3 = blockStaticContentFetching;
  }
  if (blockStaticContentFetching || self->_contentURL == 0) {
    v5 = 0;
  }
  else {
    v5 = [[PKPaymentCommonAvailableProductsRequest alloc] initWithContentURL:self->_contentURL];
  }
  return v5;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)blockStaticContentFetching
{
  return self->_blockStaticContentFetching;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

@end