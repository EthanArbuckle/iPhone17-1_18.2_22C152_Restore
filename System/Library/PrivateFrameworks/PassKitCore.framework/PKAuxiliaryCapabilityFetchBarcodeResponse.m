@interface PKAuxiliaryCapabilityFetchBarcodeResponse
- (NSArray)barcodes;
- (PKAuxiliaryCapabilityFetchBarcodeResponse)initWithData:(id)a3;
@end

@implementation PKAuxiliaryCapabilityFetchBarcodeResponse

- (PKAuxiliaryCapabilityFetchBarcodeResponse)initWithData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PKAuxiliaryCapabilityFetchBarcodeResponse;
  v3 = [(PKWebServiceResponse *)&v18 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 objectForKey:@"barcodes"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __58__PKAuxiliaryCapabilityFetchBarcodeResponse_initWithData___block_invoke;
        v16[3] = &unk_1E56DF948;
        id v17 = v7;
        p_super = v7;
        [v6 enumerateObjectsUsingBlock:v16];
        uint64_t v9 = [p_super copy];
        barcodes = v4->_barcodes;
        v4->_barcodes = (NSArray *)v9;

LABEL_10:
        return v4;
      }
      p_super = &v4->super.super.super.super;
    }
    else
    {
      p_super = PKLogFacilityTypeGetObject(0x1CuLL);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138543618;
        v20 = v12;
        __int16 v21 = 2114;
        v22 = v14;
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
      v6 = v4;
    }
    v4 = 0;
    goto LABEL_10;
  }
  return v4;
}

void __58__PKAuxiliaryCapabilityFetchBarcodeResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = *(void **)(a1 + 32);
    v4 = [[PKBarcodeCredential alloc] initWithDictionary:v5];
    [v3 safelyAddObject:v4];
  }
}

- (NSArray)barcodes
{
  return self->_barcodes;
}

- (void).cxx_destruct
{
}

@end