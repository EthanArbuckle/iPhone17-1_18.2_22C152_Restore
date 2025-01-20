@interface PKDiscoveryArticleLayoutResponse
- (PKDiscoveryArticleLayout)discoveryArticleLayout;
- (PKDiscoveryArticleLayoutResponse)initWithData:(id)a3;
@end

@implementation PKDiscoveryArticleLayoutResponse

- (PKDiscoveryArticleLayoutResponse)initWithData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PKDiscoveryArticleLayoutResponse;
  v3 = [(PKWebServiceResponse *)&v16 initWithData:a3];
  v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      __int16 v19 = 2114;
      v20 = v14;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  v6 = [[PKDiscoveryArticleLayout alloc] initWithDictionary:v5];
  discoveryArticleLayout = v4->_discoveryArticleLayout;
  v4->_discoveryArticleLayout = v6;

  v8 = v4->_discoveryArticleLayout;
  if (!v8)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
LABEL_4:
  v9 = v4;
LABEL_9:

  return v9;
}

- (PKDiscoveryArticleLayout)discoveryArticleLayout
{
  return self->_discoveryArticleLayout;
}

- (void).cxx_destruct
{
}

@end