@interface FCProductLookup
- (id)initWithOfferName:(void *)a3 appAdamID:(void *)a4 storeExternalVersionID:(void *)a5 bundleID:;
- (void)lookup;
- (void)productsRequest:(id)a3 didReceiveResponse:(id)a4;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)requestDidFinish:(id)a3;
- (void)setProductLookupError:(uint64_t)a1;
@end

@implementation FCProductLookup

void __25__FCProductLookup_lookup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    v8 = *(NSObject **)(v7 + 40);
  }
  else {
    v8 = 0;
  }
  dispatch_group_enter(v8);
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    v10 = *(void **)(v9 + 48);
  }
  else {
    v10 = 0;
  }
  [v10 start];
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    v12 = *(NSObject **)(v11 + 40);
  }
  else {
    v12 = 0;
  }
  v13 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__FCProductLookup_lookup__block_invoke_2;
  block[3] = &unk_1E5B4E150;
  block[4] = v11;
  id v17 = v5;
  id v18 = v6;
  id v14 = v6;
  id v15 = v5;
  dispatch_group_notify(v12, v13, block);
}

- (void)lookup
{
  if (a1)
  {
    v2 = a1;
    if (a1[7])
    {
      a1 = (void *)[objc_alloc(MEMORY[0x1E4F81BF0]) initWithValue:a1[7]];
    }
    else
    {
      uint64_t v3 = a1[8];
      id v4 = objc_alloc(MEMORY[0x1E4F81BF0]);
      if (v3)
      {
        a1 = (void *)[v4 initWithError:v2[8]];
      }
      else
      {
        var38[0] = MEMORY[0x1E4F143A8];
        var38[1] = 3221225472;
        var38[2] = __25__FCProductLookup_lookup__block_invoke;
        var38[3] = &unk_1E5B4EEF0;
        var38[4] = v2;
        a1 = (void *)[v4 initWithResolver:var38];
      }
    }
    uint64_t v1 = var38[8];
  }
  return a1;
}

- (id)initWithOfferName:(void *)a3 appAdamID:(void *)a4 storeExternalVersionID:(void *)a5 bundleID:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)FCProductLookup;
    id v14 = (id *)objc_msgSendSuper2(&v27, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      dispatch_group_t v15 = dispatch_group_create();
      id v16 = a1[5];
      a1[5] = v15;

      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2050000000;
      id v17 = (void *)_MergedGlobals_220;
      uint64_t v36 = _MergedGlobals_220;
      if (!_MergedGlobals_220)
      {
        uint64_t v28 = MEMORY[0x1E4F143A8];
        uint64_t v29 = 3221225472;
        v30 = __getSKProductsRequestClass_block_invoke;
        v31 = &unk_1E5B516D8;
        v32 = &v33;
        __getSKProductsRequestClass_block_invoke((uint64_t)&v28);
        id v17 = (void *)v34[3];
      }
      id v18 = v17;
      _Block_object_dispose(&v33, 8);
      id v19 = [v18 alloc];
      v20 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v10, 0);
      uint64_t v21 = [v19 initWithProductIdentifiers:v20];
      id v22 = a1[6];
      a1[6] = (id)v21;

      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2050000000;
      v23 = (void *)qword_1EB5D1B38;
      uint64_t v36 = qword_1EB5D1B38;
      if (!qword_1EB5D1B38)
      {
        uint64_t v28 = MEMORY[0x1E4F143A8];
        uint64_t v29 = 3221225472;
        v30 = __getSKPaymentQueueClientClass_block_invoke_1;
        v31 = &unk_1E5B516D8;
        v32 = &v33;
        __getSKPaymentQueueClientClass_block_invoke_1((uint64_t)&v28);
        v23 = (void *)v34[3];
      }
      v24 = v23;
      _Block_object_dispose(&v33, 8);
      id v25 = objc_alloc_init(v24);
      [v25 setBundleIdentifier:@"com.apple.news"];
      [v25 setProductsRequestBundleIdentifier:v13];
      [v25 setBundleVersion:@"1.0"];
      [v25 setStoreExternalVersion:v12];
      [v25 setStoreItemIdentifier:v11];
      [a1[6] setPaymentQueueClient:v25];
      [a1[6] setDelegate:a1];
    }
  }

  return a1;
}

uint64_t __25__FCProductLookup_lookup__block_invoke_2(uint64_t *a1)
{
  uint64_t v2 = a1[4];
  if (!v2) {
    goto LABEL_6;
  }
  if (*(void *)(v2 + 56))
  {
    uint64_t v3 = *(uint64_t (**)(void))(a1[5] + 16);
    goto LABEL_8;
  }
  if (*(void *)(v2 + 64))
  {
    uint64_t v4 = a1[6];
  }
  else
  {
LABEL_6:
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.news.productlookup" code:1001 userInfo:0];
    -[FCProductLookup setProductLookupError:](a1[4], v5);

    uint64_t v4 = a1[6];
  }
  uint64_t v3 = *(uint64_t (**)(void))(v4 + 16);
LABEL_8:
  return v3();
}

- (void)setProductLookupError:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)productsRequest:(id)a3 didReceiveResponse:(id)a4
{
  v8 = objc_msgSend(a4, "products", a3);
  uint64_t v5 = [v8 count];
  id v6 = v8;
  if (v5)
  {
    uint64_t v7 = [v8 firstObject];
    if (self) {
      objc_storeStrong((id *)&self->_product, v7);
    }

    id v6 = v8;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (void)requestDidFinish:(id)a3
{
  if (self) {
    self = (FCProductLookup *)self->_productRequestGroup;
  }
  dispatch_group_leave(&self->super);
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  -[FCProductLookup setProductLookupError:]((uint64_t)self, a4);
  if (self) {
    productRequestGroup = self->_productRequestGroup;
  }
  else {
    productRequestGroup = 0;
  }
  dispatch_group_leave(productRequestGroup);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productLookupError, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_productRequestGroup, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_storeExternalVersionID, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
  objc_storeStrong((id *)&self->_offerName, 0);
}

@end