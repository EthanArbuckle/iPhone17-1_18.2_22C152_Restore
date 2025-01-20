@interface FCReceiptRefresher
- (NFPendingPromise)pendingPromise;
- (NSString)restoreBundleID;
- (SKReceiptRefreshRequest)request;
- (id)refreshForPurchase:(id)a3;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)requestDidFinish:(id)a3;
- (void)setPendingPromise:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRestoreBundleID:(id)a3;
@end

@implementation FCReceiptRefresher

- (id)refreshForPurchase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F81BE8]);
  [(FCReceiptRefresher *)self setPendingPromise:v5];

  v6 = [v4 bundleID];
  [(FCReceiptRefresher *)self setRestoreBundleID:v6];

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2050000000;
  v7 = (void *)_MergedGlobals_180;
  uint64_t v34 = _MergedGlobals_180;
  if (!_MergedGlobals_180)
  {
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __getSKReceiptRefreshRequestClass_block_invoke;
    v29 = &unk_1E5B516D8;
    v30 = &v31;
    __getSKReceiptRefreshRequestClass_block_invoke((uint64_t)&v26);
    v7 = (void *)v32[3];
  }
  v8 = v7;
  _Block_object_dispose(&v31, 8);
  id v9 = objc_alloc_init(v8);
  [(FCReceiptRefresher *)self setRequest:v9];

  v10 = FCDeviceIdentifierForVendor();
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2050000000;
  v11 = (void *)qword_1EB5D1720;
  uint64_t v34 = qword_1EB5D1720;
  if (!qword_1EB5D1720)
  {
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __getSKPaymentQueueClientClass_block_invoke_0;
    v29 = &unk_1E5B516D8;
    v30 = &v31;
    __getSKPaymentQueueClientClass_block_invoke_0((uint64_t)&v26);
    v11 = (void *)v32[3];
  }
  v12 = v11;
  _Block_object_dispose(&v31, 8);
  id v13 = objc_alloc_init(v12);
  [v13 setBundleIdentifier:@"com.apple.news"];
  v14 = [v4 bundleID];
  [v13 setProductsRequestBundleIdentifier:v14];

  v15 = [v4 appAdamID];
  [v13 setStoreItemIdentifier:v15];

  [v13 setBundleVersion:@"1.0"];
  v16 = [v4 storeExternalVersion];
  [v13 setStoreExternalVersion:v16];

  [v13 setVendorIdentifier:v10];
  v17 = [(FCReceiptRefresher *)self restoreBundleID];
  v18 = FCPurchaseReceiptDirectoryURL(v17);

  v19 = [v18 path];
  [v13 setReceiptDirectoryPath:v19];

  v20 = [(FCReceiptRefresher *)self request];
  [v20 setPaymentQueueClient:v13];

  v21 = [(FCReceiptRefresher *)self request];
  [v21 setDelegate:self];

  v22 = [(FCReceiptRefresher *)self request];
  [v22 start];

  v23 = [(FCReceiptRefresher *)self pendingPromise];
  v24 = [v23 promise];

  return v24;
}

- (void)requestDidFinish:(id)a3
{
  id v4 = [(FCReceiptRefresher *)self restoreBundleID];
  id v5 = FCPurchaseReceiptDirectoryURL(v4);

  id v11 = [v5 URLByAppendingPathComponent:@"/StoreKit/receipt"];

  v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v11];
  v7 = [v6 base64EncodedStringWithOptions:0];
  if (v7)
  {
    v8 = [(FCReceiptRefresher *)self pendingPromise];
    id v9 = [v8 resolve];
    ((void (**)(void, void *))v9)[2](v9, v7);
  }
  else
  {
    v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.news.refresh.receipt" code:1001 userInfo:0];
    id v9 = [(FCReceiptRefresher *)self pendingPromise];
    v10 = [v9 reject];
    ((void (**)(void, void *))v10)[2](v10, v8);
  }
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v7 = [(FCReceiptRefresher *)self pendingPromise];
  v6 = [v7 reject];
  ((void (**)(void, id))v6)[2](v6, v5);
}

- (NSString)restoreBundleID
{
  return self->_restoreBundleID;
}

- (void)setRestoreBundleID:(id)a3
{
}

- (SKReceiptRefreshRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NFPendingPromise)pendingPromise
{
  return self->_pendingPromise;
}

- (void)setPendingPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPromise, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_restoreBundleID, 0);
}

@end