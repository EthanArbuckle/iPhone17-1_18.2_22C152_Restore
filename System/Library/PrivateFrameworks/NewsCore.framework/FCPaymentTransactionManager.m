@interface FCPaymentTransactionManager
- (BOOL)canMakePayments;
- (FCPaymentTransactionManager)init;
- (FCPaymentTransactionManagerDelegate)delegate;
- (FCPaymentTransactionObserver)paymentTransactionObserver;
- (NSMutableDictionary)paymentQueueByProductID;
- (id)createPaymentQueueWithProductID:(id)a3 purchaseID:(id)a4 bundleID:(id)a5 webAccessOptIn:(BOOL)a6 appAdamID:(id)a7 storeExternalVersion:(id)a8;
- (void)paymentTransactionObserver:(id)a3 didFailPurchaseTransactionWithTransaction:(id)a4;
- (void)paymentTransactionObserver:(id)a3 didFinishPurchaseTransaction:(id)a4;
- (void)registerOngoingPurchaseTransactionsWithEntry:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPaymentQueueByProductID:(id)a3;
- (void)setPaymentTransactionObserver:(id)a3;
- (void)startPurchaseWithTagID:(id)a3 productID:(id)a4 purchaseID:(id)a5 bundleID:(id)a6 appAdamID:(id)a7 storeExternalVersion:(id)a8 price:(id)a9 webAccessOptIn:(BOOL)a10 payment:(id)a11;
@end

@implementation FCPaymentTransactionManager

- (void)setDelegate:(id)a3
{
}

- (FCPaymentTransactionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)FCPaymentTransactionManager;
  v2 = [(FCPaymentTransactionManager *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(FCPaymentTransactionObserver);
    paymentTransactionObserver = v2->_paymentTransactionObserver;
    v2->_paymentTransactionObserver = v3;

    [(FCPaymentTransactionObserver *)v2->_paymentTransactionObserver setDelegate:v2];
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    paymentQueueByProductID = v2->_paymentQueueByProductID;
    v2->_paymentQueueByProductID = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (BOOL)canMakePayments
{
  id SKPaymentQueueClass = getSKPaymentQueueClass();
  return [SKPaymentQueueClass canMakePayments];
}

- (void)registerOngoingPurchaseTransactionsWithEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 productID];
  v6 = [v4 purchaseID];
  v7 = [v4 bundleID];
  uint64_t v8 = [v4 webAccessOptIn];
  v9 = [v4 appAdamID];
  v10 = [v4 storeExternalVersion];
  id v14 = [(FCPaymentTransactionManager *)self createPaymentQueueWithProductID:v5 purchaseID:v6 bundleID:v7 webAccessOptIn:v8 appAdamID:v9 storeExternalVersion:v10];

  v11 = [(FCPaymentTransactionManager *)self paymentTransactionObserver];
  [v14 addTransactionObserver:v11];

  v12 = [(FCPaymentTransactionManager *)self paymentQueueByProductID];
  v13 = [v4 productID];

  [v12 setObject:v14 forKey:v13];
}

- (void)startPurchaseWithTagID:(id)a3 productID:(id)a4 purchaseID:(id)a5 bundleID:(id)a6 appAdamID:(id)a7 storeExternalVersion:(id)a8 price:(id)a9 webAccessOptIn:(BOOL)a10 payment:(id)a11
{
  v33[2] = *MEMORY[0x1E4F143B8];
  if (a10) {
    v16 = @"true";
  }
  else {
    v16 = @"false";
  }
  v32[0] = @"hasWebOptIn";
  v32[1] = @"mtApp";
  v33[0] = v16;
  v17 = (void *)MEMORY[0x1E4F28B50];
  v18 = v16;
  id v19 = a11;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  v25 = [v17 mainBundle];
  v26 = [v25 bundleIdentifier];
  v33[1] = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

  [v19 setRequestParameters:v27];
  v28 = [(FCPaymentTransactionManager *)self createPaymentQueueWithProductID:v24 purchaseID:v23 bundleID:v22 webAccessOptIn:a10 appAdamID:v21 storeExternalVersion:v20];

  v29 = [(FCPaymentTransactionManager *)self paymentTransactionObserver];
  [v28 addTransactionObserver:v29];

  [v28 addPayment:v19];
  v30 = [(FCPaymentTransactionManager *)self paymentQueueByProductID];
  [v30 setObject:v28 forKey:v24];
}

- (id)createPaymentQueueWithProductID:(id)a3 purchaseID:(id)a4 bundleID:(id)a5 webAccessOptIn:(BOOL)a6 appAdamID:(id)a7 storeExternalVersion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v18 = [(FCPaymentTransactionManager *)self paymentQueueByProductID];
  id v19 = [v18 objectForKey:v13];

  if (!v19)
  {
    id v20 = FCDeviceIdentifierForVendor();
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    id v21 = (void *)getSKPaymentQueueClientClass_softClass;
    uint64_t v31 = getSKPaymentQueueClientClass_softClass;
    if (!getSKPaymentQueueClientClass_softClass)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __getSKPaymentQueueClientClass_block_invoke;
      v27[3] = &unk_1E5B516D8;
      v27[4] = &v28;
      __getSKPaymentQueueClientClass_block_invoke((uint64_t)v27);
      id v21 = (void *)v29[3];
    }
    id v22 = v21;
    _Block_object_dispose(&v28, 8);
    id v23 = objc_alloc_init(v22);
    id v24 = [MEMORY[0x1E4F28B50] mainBundle];
    v25 = [v24 bundleIdentifier];
    [v23 setBundleIdentifier:v25];

    [v23 setBundleVersion:@"1.0"];
    [v23 setStoreItemIdentifier:v16];
    [v23 setStoreExternalVersion:v17];
    [v23 setVendorIdentifier:v20];
    id v19 = (void *)[objc_alloc((Class)getSKPaymentQueueClass()) initWithPaymentQueueClient:v23];
  }
  return v19;
}

- (void)paymentTransactionObserver:(id)a3 didFailPurchaseTransactionWithTransaction:(id)a4
{
  void v32[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [v5 payment];
  v7 = [v6 productIdentifier];

  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "transaction.payment.productIdentifier");
    *(_DWORD *)buf = 136315906;
    uint64_t v28 = "-[FCPaymentTransactionManager paymentTransactionObserver:didFailPurchaseTransactionWithTransaction:]";
    __int16 v29 = 2080;
    uint64_t v30 = "FCPaymentTransactionManager.m";
    __int16 v31 = 1024;
    LODWORD(v32[0]) = 151;
    WORD2(v32[0]) = 2114;
    *(void *)((char *)v32 + 6) = v23;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v8 = [v5 error];

  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "transaction.error");
    *(_DWORD *)buf = 136315906;
    uint64_t v28 = "-[FCPaymentTransactionManager paymentTransactionObserver:didFailPurchaseTransactionWithTransaction:]";
    __int16 v29 = 2080;
    uint64_t v30 = "FCPaymentTransactionManager.m";
    __int16 v31 = 1024;
    LODWORD(v32[0]) = 152;
    WORD2(v32[0]) = 2114;
    *(void *)((char *)v32 + 6) = v24;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v9 = [v5 payment];
  v10 = [v9 productIdentifier];

  uint64_t v11 = [v5 transactionState];
  v12 = [v5 error];
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = FCPurchaseTransactionGenericErrorCode;
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26 = @"The transaction returned with no error";
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v14 = [v15 errorWithDomain:@"com.apple.news.purchase" code:v16 userInfo:v17];
  }
  v18 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
  {
    id v21 = v18;
    uint64_t v22 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    uint64_t v28 = (const char *)v22;
    __int16 v29 = 2114;
    uint64_t v30 = v10;
    __int16 v31 = 2114;
    v32[0] = v14;
    _os_log_error_impl(&dword_1A460D000, v21, OS_LOG_TYPE_ERROR, "%{public}@ didFailPurchaseTransaction with productID: %{public}@ failed with error: %{public}@", buf, 0x20u);
  }
  if ((unint64_t)(v11 - 1) >= 4) {
    uint64_t v11 = 0;
  }
  id v19 = [(FCPaymentTransactionManager *)self paymentQueueByProductID];
  [v19 removeObjectForKey:v10];

  id v20 = [(FCPaymentTransactionManager *)self delegate];
  [v20 transactionFailedWithProductID:v10 transactionState:v11 transactionError:v14];
}

- (void)paymentTransactionObserver:(id)a3 didFinishPurchaseTransaction:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v41 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "transaction");
    *(_DWORD *)buf = 136315906;
    v49 = "-[FCPaymentTransactionManager paymentTransactionObserver:didFinishPurchaseTransaction:]";
    __int16 v50 = 2080;
    v51 = "FCPaymentTransactionManager.m";
    __int16 v52 = 1024;
    int v53 = 173;
    __int16 v54 = 2114;
    v55 = v41;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v7 = [v6 payment];
  uint64_t v8 = [v7 productIdentifier];

  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v42 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "transaction.payment.productIdentifier");
    *(_DWORD *)buf = 136315906;
    v49 = "-[FCPaymentTransactionManager paymentTransactionObserver:didFinishPurchaseTransaction:]";
    __int16 v50 = 2080;
    v51 = "FCPaymentTransactionManager.m";
    __int16 v52 = 1024;
    int v53 = 174;
    __int16 v54 = 2114;
    v55 = v42;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v9 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    uint64_t v11 = objc_opt_class();
    v12 = [v6 payment];
    id v13 = [v12 productIdentifier];
    *(_DWORD *)buf = 138543618;
    v49 = (const char *)v11;
    __int16 v50 = 2114;
    v51 = v13;
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ didFinishPurchaseTransaction with productID: %{public}@", buf, 0x16u);
  }
  id v14 = [(FCPaymentTransactionManager *)self paymentQueueByProductID];
  id v15 = [v6 payment];
  uint64_t v16 = [v15 productIdentifier];
  [v14 removeObjectForKey:v16];

  id v17 = [v6 appleIDAccountDetails];

  if (v17)
  {
    v18 = [v6 appleIDAccountDetails];
    id v19 = [v18 accountSignupError];

    if (v19)
    {
      id v20 = [FCPaymentTransactionAuthorizationResponse alloc];
      id v21 = [v6 appleIDAccountDetails];
      uint64_t v22 = [v21 accountSignupError];
      id v23 = [(FCPaymentTransactionAuthorizationResponse *)v20 initWithCredential:0 accountSignupError:v22];
    }
    else
    {
      id v24 = [v6 appleIDAccountDetails];
      id v21 = [v24 authorizationAppleIDCredential];

      id v25 = [NSString alloc];
      v26 = [v21 authorizationCode];
      uint64_t v22 = (void *)[v25 initWithData:v26 encoding:4];

      id v27 = [NSString alloc];
      uint64_t v28 = [v21 identityToken];
      v46 = (void *)[v27 initWithData:v28 encoding:4];

      v44 = [FCAuthKitAuthorizationCredential alloc];
      v43 = [v21 userIdentifier];
      v45 = [v21 userInformation];
      __int16 v29 = [v45 selectedEmail];
      uint64_t v30 = [v21 userInformation];
      __int16 v31 = [v30 familyName];
      v32 = [v21 userInformation];
      [v32 givenName];
      v34 = v33 = self;
      v35 = [(FCAuthKitAuthorizationCredential *)v44 initWithAuthorizationCode:v22 identityToken:v46 userIdentifier:v43 email:v29 familyName:v31 givenName:v34];

      self = v33;
      id v23 = [[FCPaymentTransactionAuthorizationResponse alloc] initWithCredential:v35 accountSignupError:0];
    }
  }
  else
  {
    id v23 = 0;
  }
  v36 = [FCCompletedPaymentTransaction alloc];
  v37 = [v6 payment];
  v38 = [v37 productIdentifier];
  v39 = [(FCCompletedPaymentTransaction *)v36 initWithProductID:v38 receipt:0 appleIDAccountDetails:v23];

  v40 = [(FCPaymentTransactionManager *)self delegate];
  [v40 transactionPurchased:v39];
}

- (FCPaymentTransactionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (FCPaymentTransactionManagerDelegate *)WeakRetained;
}

- (FCPaymentTransactionObserver)paymentTransactionObserver
{
  return self->_paymentTransactionObserver;
}

- (void)setPaymentTransactionObserver:(id)a3
{
}

- (NSMutableDictionary)paymentQueueByProductID
{
  return self->_paymentQueueByProductID;
}

- (void)setPaymentQueueByProductID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentQueueByProductID, 0);
  objc_storeStrong((id *)&self->_paymentTransactionObserver, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end