@interface PKDiscoveryManifestResponse
- (PKDiscoveryManifest)manifest;
- (PKDiscoveryManifestResponse)initWithData:(id)a3;
- (PKDiscoveryManifestResponse)initWithManifest:(id)a3;
@end

@implementation PKDiscoveryManifestResponse

- (PKDiscoveryManifestResponse)initWithData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PKDiscoveryManifestResponse;
  v3 = [(PKWebServiceResponse *)&v15 initWithData:a3];
  v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [[PKDiscoveryManifest alloc] initWithDictionary:v5];
    manifest = v4->_manifest;
    v4->_manifest = v6;

LABEL_4:
    v8 = v4;
    goto LABEL_8;
  }
  v9 = PKLogFacilityTypeGetObject(0x10uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    __int16 v18 = 2114;
    v19 = v13;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (PKDiscoveryManifestResponse)initWithManifest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryManifestResponse;
  v6 = [(PKDiscoveryManifestResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_manifest, a3);
  }

  return v7;
}

- (PKDiscoveryManifest)manifest
{
  return self->_manifest;
}

- (void).cxx_destruct
{
}

@end