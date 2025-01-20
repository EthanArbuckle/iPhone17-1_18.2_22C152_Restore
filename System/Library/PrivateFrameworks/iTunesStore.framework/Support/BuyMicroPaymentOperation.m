@interface BuyMicroPaymentOperation
- (BOOL)purchaseOperation:(id)a3 shouldContinueWithNewStorefront:(id)a4;
- (BOOL)simulatesAskToBuyInSandbox;
- (MicroPaymentQueueResponse)response;
- (NSData)clientAuditTokenData;
- (NSData)requestData;
- (NSManagedObjectID)paymentID;
- (NSNumber)discountTimestamp;
- (NSString)applicationUsername;
- (NSString)buyParameters;
- (NSString)discountIdentifier;
- (NSString)discountKeyIdentifier;
- (NSString)discountNonceString;
- (NSString)discountSignature;
- (NSString)originatingStorefront;
- (NSString)partnerIdentifier;
- (NSString)partnerTransactionIdentifier;
- (NSString)productIdentifier;
- (StoreKitClientIdentity)clientIdentity;
- (id)_appProxy;
- (id)_fullBuyParametersWithAppProxy:(id)a3;
- (int64_t)quantity;
- (void)run;
- (void)setApplicationUsername:(id)a3;
- (void)setBuyParameters:(id)a3;
- (void)setClientAuditTokenData:(id)a3;
- (void)setClientIdentity:(id)a3;
- (void)setDiscountIdentifier:(id)a3;
- (void)setDiscountKeyIdentifier:(id)a3;
- (void)setDiscountNonceString:(id)a3;
- (void)setDiscountSignature:(id)a3;
- (void)setDiscountTimestamp:(id)a3;
- (void)setOriginatingStorefront:(id)a3;
- (void)setPartnerIdentifier:(id)a3;
- (void)setPartnerTransactionIdentifier:(id)a3;
- (void)setPaymentID:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setQuantity:(int64_t)a3;
- (void)setRequestData:(id)a3;
- (void)setSimulatesAskToBuyInSandbox:(BOOL)a3;
@end

@implementation BuyMicroPaymentOperation

- (NSString)applicationUsername
{
  [(BuyMicroPaymentOperation *)self lock];
  id v3 = [(NSString *)self->_applicationUsername copy];
  [(BuyMicroPaymentOperation *)self unlock];

  return (NSString *)v3;
}

- (NSString)buyParameters
{
  [(BuyMicroPaymentOperation *)self lock];
  id v3 = [(NSString *)self->_buyParameters copy];
  [(BuyMicroPaymentOperation *)self unlock];

  return (NSString *)v3;
}

- (NSData)clientAuditTokenData
{
  [(BuyMicroPaymentOperation *)self lock];
  id v3 = self->_clientAuditTokenData;
  [(BuyMicroPaymentOperation *)self unlock];

  return v3;
}

- (StoreKitClientIdentity)clientIdentity
{
  [(BuyMicroPaymentOperation *)self lock];
  id v3 = self->_clientIdentity;
  [(BuyMicroPaymentOperation *)self unlock];

  return v3;
}

- (NSString)partnerIdentifier
{
  [(BuyMicroPaymentOperation *)self lock];
  id v3 = [(NSString *)self->_partnerIdentifier copy];
  [(BuyMicroPaymentOperation *)self unlock];

  return (NSString *)v3;
}

- (NSString)partnerTransactionIdentifier
{
  [(BuyMicroPaymentOperation *)self lock];
  id v3 = [(NSString *)self->_partnerTransactionIdentifier copy];
  [(BuyMicroPaymentOperation *)self unlock];

  return (NSString *)v3;
}

- (NSString)productIdentifier
{
  [(BuyMicroPaymentOperation *)self lock];
  id v3 = [(NSString *)self->_productIdentifier copy];
  [(BuyMicroPaymentOperation *)self unlock];

  return (NSString *)v3;
}

- (int64_t)quantity
{
  [(BuyMicroPaymentOperation *)self lock];
  int64_t quantity = self->_quantity;
  [(BuyMicroPaymentOperation *)self unlock];
  return quantity;
}

- (NSData)requestData
{
  [(BuyMicroPaymentOperation *)self lock];
  id v3 = [(NSData *)self->_requestData copy];
  [(BuyMicroPaymentOperation *)self unlock];

  return (NSData *)v3;
}

- (MicroPaymentQueueResponse)response
{
  [(BuyMicroPaymentOperation *)self lock];
  id v3 = self->_response;
  [(BuyMicroPaymentOperation *)self unlock];

  return v3;
}

- (BOOL)simulatesAskToBuyInSandbox
{
  [(BuyMicroPaymentOperation *)self lock];
  BOOL simulatesAskToBuyInSandbox = self->_simulatesAskToBuyInSandbox;
  [(BuyMicroPaymentOperation *)self unlock];
  return simulatesAskToBuyInSandbox;
}

- (void)setApplicationUsername:(id)a3
{
  v6 = (NSString *)a3;
  [(BuyMicroPaymentOperation *)self lock];
  if (self->_applicationUsername != v6)
  {
    v4 = (NSString *)[(NSString *)v6 copy];
    applicationUsername = self->_applicationUsername;
    self->_applicationUsername = v4;
  }
  [(BuyMicroPaymentOperation *)self unlock];
}

- (void)setBuyParameters:(id)a3
{
  v6 = (NSString *)a3;
  [(BuyMicroPaymentOperation *)self lock];
  if (self->_buyParameters != v6)
  {
    v4 = (NSString *)[(NSString *)v6 copy];
    buyParameters = self->_buyParameters;
    self->_buyParameters = v4;
  }
  [(BuyMicroPaymentOperation *)self unlock];
}

- (void)setClientAuditTokenData:(id)a3
{
  v5 = (NSData *)a3;
  [(BuyMicroPaymentOperation *)self lock];
  if (self->_clientAuditTokenData != v5) {
    objc_storeStrong((id *)&self->_clientAuditTokenData, a3);
  }
  [(BuyMicroPaymentOperation *)self unlock];
}

- (void)setClientIdentity:(id)a3
{
  v5 = (StoreKitClientIdentity *)a3;
  [(BuyMicroPaymentOperation *)self lock];
  if (self->_clientIdentity != v5) {
    objc_storeStrong((id *)&self->_clientIdentity, a3);
  }
  [(BuyMicroPaymentOperation *)self unlock];
}

- (void)setPartnerIdentifier:(id)a3
{
  v6 = (NSString *)a3;
  [(BuyMicroPaymentOperation *)self lock];
  if (self->_partnerIdentifier != v6)
  {
    v4 = (NSString *)[(NSString *)v6 copy];
    partnerIdentifier = self->_partnerIdentifier;
    self->_partnerIdentifier = v4;
  }
  [(BuyMicroPaymentOperation *)self unlock];
}

- (void)setPartnerTransactionIdentifier:(id)a3
{
  v6 = (NSString *)a3;
  [(BuyMicroPaymentOperation *)self lock];
  if (self->_partnerTransactionIdentifier != v6)
  {
    v4 = (NSString *)[(NSString *)v6 copy];
    partnerTransactionIdentifier = self->_partnerTransactionIdentifier;
    self->_partnerTransactionIdentifier = v4;
  }
  [(BuyMicroPaymentOperation *)self unlock];
}

- (void)setProductIdentifier:(id)a3
{
  v6 = (NSString *)a3;
  [(BuyMicroPaymentOperation *)self lock];
  if (self->_productIdentifier != v6)
  {
    v4 = (NSString *)[(NSString *)v6 copy];
    productIdentifier = self->_productIdentifier;
    self->_productIdentifier = v4;
  }
  [(BuyMicroPaymentOperation *)self unlock];
}

- (void)setQuantity:(int64_t)a3
{
  [(BuyMicroPaymentOperation *)self lock];
  self->_int64_t quantity = a3;

  [(BuyMicroPaymentOperation *)self unlock];
}

- (void)setRequestData:(id)a3
{
  v6 = (NSData *)a3;
  [(BuyMicroPaymentOperation *)self lock];
  if (self->_requestData != v6)
  {
    v4 = (NSData *)[(NSData *)v6 copy];
    requestData = self->_requestData;
    self->_requestData = v4;
  }
  [(BuyMicroPaymentOperation *)self unlock];
}

- (void)setSimulatesAskToBuyInSandbox:(BOOL)a3
{
  [(BuyMicroPaymentOperation *)self lock];
  self->_BOOL simulatesAskToBuyInSandbox = a3;

  [(BuyMicroPaymentOperation *)self unlock];
}

- (BOOL)purchaseOperation:(id)a3 shouldContinueWithNewStorefront:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(BuyMicroPaymentOperation *)self delegate];
  if (v6
    && (v7 = (void *)v6,
        [(BuyMicroPaymentOperation *)self delegate],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    v10 = [(BuyMicroPaymentOperation *)self delegate];
    unsigned __int8 v11 = [v10 buyMicroPaymentOperation:self shouldContinueWithNewStorefront:v5];
  }
  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

- (void)run
{
  id v3 = [(BuyMicroPaymentOperation *)self clientIdentity];
  v4 = [[ClaimStoreKitClientOperation alloc] initWithClientIdentity:v3];
  id v5 = [(BuyMicroPaymentOperation *)self clientAuditTokenData];
  [(ClaimStoreKitClientOperation *)v4 setClientAuditTokenData:v5];

  if ([(BuyMicroPaymentOperation *)self runSubOperation:v4 returningError:0])
  {
    uint64_t v6 = [(ClaimStoreKitClientOperation *)v4 clientIdentity];

    [(BuyMicroPaymentOperation *)self setClientIdentity:v6];
    id v3 = (void *)v6;
  }
  v7 = [(BuyMicroPaymentOperation *)self _appProxy];
  uint64_t v8 = [(BuyMicroPaymentOperation *)self _fullBuyParametersWithAppProxy:v7];
  if (!v8)
  {
    v26 = +[SSLogConfig sharedDaemonConfig];
    if (!v26)
    {
      v26 = +[SSLogConfig sharedConfig];
    }
    unsigned int v27 = [v26 shouldLog];
    if ([v26 shouldLogToDisk]) {
      int v28 = v27 | 2;
    }
    else {
      int v28 = v27;
    }
    v29 = [v26 OSLogObject];
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      v28 &= 2u;
    }
    if (v28)
    {
      int v59 = 138412290;
      id v60 = (id)objc_opt_class();
      id v30 = v60;
      LODWORD(v52) = 12;
      v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
LABEL_31:

        v32 = ISError();
        [(BuyMicroPaymentOperation *)self setError:v32];
        goto LABEL_62;
      }
      v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v59, v52);
      free(v31);
      SSFileLog();
    }

    goto LABEL_31;
  }
  char v9 = (void *)v8;
  v10 = objc_alloc_init(PurchaseOperation);
  [(PurchaseOperation *)v10 setMicroPayment:1];
  unsigned __int8 v11 = [(BuyMicroPaymentOperation *)self clientAuditTokenData];
  [(PurchaseOperation *)v10 setClientAuditTokenData:v11];

  if (([v3 usesIdentityAttributes] & 1) == 0)
  {
    v12 = [v3 bundleIdentifier];
    v13 = +[LSApplicationProxy applicationProxyForIdentifier:v12];
    if (v13
      || (+[AppExtensionSupport supportedProxyExtensionForBundleIdentifier:v12], (v13 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if ([v13 hasMIDBasedSINF]) {
        [(PurchaseOperation *)v10 setRequiresSerialNumber:1];
      }
    }
  }
  v14 = [v3 bundleIdentifier];
  id v15 = [v14 length];

  if (v15)
  {
    v16 = [v3 bundleIdentifier];
    v17 = ISClientIdentifierForBundleIdentifier();
    [(PurchaseOperation *)v10 setClientIdentifierHeader:v17];

    v18 = [v3 bundleIdentifier];
    v19 = +[NSURL escapedStringForString:v18];

    uint64_t v20 = [v9 stringByAppendingFormat:@"&%@=%@", @"originatingBundleID", v19];

    char v9 = (void *)v20;
  }
  [(PurchaseOperation *)v10 setBuyParameters:v9];
  v21 = [(BuyMicroPaymentOperation *)self originatingStorefront];
  [(PurchaseOperation *)v10 setOriginatingStorefront:v21];

  [(PurchaseOperation *)v10 setShouldSendKeyBagSyncData:1];
  [(PurchaseOperation *)v10 setUrlBagKey:@"p2-in-app-buy"];
  if ([v3 allowsBootstrapCellularData]) {
    [(PurchaseOperation *)v10 setAllowsBootstrapCellularData:1];
  }
  if ([v3 hidesConfirmationDialogs]) {
    [(PurchaseOperation *)v10 setSkipsConfirmationDialogs:1];
  }
  v56 = v7;
  if ([v7 isBetaApp])
  {
    [(PurchaseOperation *)v10 setBagType:1];
    v22 = +[ACAccountStore ams_sharedAccountStoreForMediaType:AMSAccountMediaTypeAppStoreBeta];
    v23 = objc_msgSend(v22, "ams_activeiTunesAccount");

    if (!v23)
    {
      v24 = +[ACAccountStore ams_sharedAccountStoreForMediaType:AMSAccountMediaTypeAppStore];
      v23 = objc_msgSend(v24, "ams_activeiTunesAccount");

      if (!v23)
      {
        v25 = 0;
        goto LABEL_38;
      }
    }
  }
  else
  {
    if (![v3 isSandboxed])
    {
      v23 = +[SSAccountStore defaultStore];
      id v34 = [v23 activeAccount];
      goto LABEL_36;
    }
    [(PurchaseOperation *)v10 setBagType:1];
    v33 = +[ACAccountStore ams_sharedAccountStoreForMediaType:AMSAccountMediaTypeAppStoreSandbox];
    v23 = objc_msgSend(v33, "ams_activeiTunesAccount");

    if (!v23)
    {
      v25 = 0;
      goto LABEL_37;
    }
  }
  id v34 = [objc_alloc((Class)SSAccount) initWithBackingAccount:v23];
LABEL_36:
  v25 = v34;
LABEL_37:

LABEL_38:
  id v35 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccount:v25];
  [v35 setShouldCreateNewSession:1];
  [v35 setTokenType:1];
  if ([v3 allowsBootstrapCellularData]) {
    [v35 setAllowsBootstrapCellularData:1];
  }
  v55 = v9;
  if ([v3 requiresAuthenticationForPayment])
  {
    [v35 setPromptStyle:1];
    [(PurchaseOperation *)v10 setRequiresAuthentication:1];
  }
  v57 = v4;
  [(PurchaseOperation *)v10 setAuthenticationContext:v35];
  id v58 = 0;
  id v36 = [(BuyMicroPaymentOperation *)self runSubOperation:v10 returningError:&v58];
  id v37 = v58;
  v38 = objc_alloc_init(MicroPaymentQueueResponse);
  v39 = [(PurchaseOperation *)v10 authenticatedAccountDSID];
  if (!v39)
  {
    v39 = [v25 uniqueIdentifier];
  }
  v54 = v25;
  [(MicroPaymentQueueResponse *)v38 setUserIdentifier:v39];
  v40 = [(PurchaseOperation *)v10 rawOutput];
  unsigned int v41 = v36 & ~[(MicroPaymentQueueResponse *)v38 loadFromPropertyList:v40];

  if (v41 == 1)
  {
    v42 = +[SSLogConfig sharedDaemonConfig];
    if (!v42)
    {
      v42 = +[SSLogConfig sharedConfig];
    }
    unsigned int v43 = [v42 shouldLog];
    if ([v42 shouldLogToDisk]) {
      v43 |= 2u;
    }
    v44 = [v42 OSLogObject];
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
      v43 &= 2u;
    }
    if (v43)
    {
      v45 = objc_opt_class();
      int v59 = 138412290;
      id v60 = v45;
      id v53 = v45;
      LODWORD(v52) = 12;
      v46 = (void *)_os_log_send_and_compose_impl();

      if (!v46)
      {
LABEL_55:

        ISError();
        id v36 = 0;
        v47 = v37;
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_57;
      }
      v44 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v46, 4, &v59, v52);
      free(v46);
      SSFileLog();
    }

    goto LABEL_55;
  }
  v47 = [(MicroPaymentQueueResponse *)v38 appReceipt];
  +[AppReceipt writeReceipt:v47 forStoreKitClient:v3];
LABEL_57:
  v4 = v57;

  [(BuyMicroPaymentOperation *)self setError:v37];
  [(BuyMicroPaymentOperation *)self setSuccess:v36];
  [(BuyMicroPaymentOperation *)self lock];
  response = self->_response;
  self->_response = v38;
  v49 = v38;

  [(BuyMicroPaymentOperation *)self unlock];
  LODWORD(response) = [(MicroPaymentQueueResponse *)v49 shouldTriggerQueueCheck];

  if (response && (v36 & 1) == 0 && !v37)
  {
    v50 = sub_100174DB0();
    v51 = ISErrorWithDomain();
    [(BuyMicroPaymentOperation *)self setError:v51];
  }
  v32 = v55;
  v7 = v56;
LABEL_62:
}

- (id)_appProxy
{
  v2 = [(BuyMicroPaymentOperation *)self clientIdentity];
  if ([v2 usesIdentityAttributes])
  {
    id v3 = 0;
    goto LABEL_30;
  }
  v4 = [v2 bundleIdentifier];
  id v3 = +[LSApplicationProxy applicationProxyForIdentifier:v4];
  id v5 = [v3 appState];
  unsigned __int8 v6 = [v5 isValid];

  if ((v6 & 1) == 0)
  {
    v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7)
    {
      v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      *(_DWORD *)v24 = 138543618;
      *(void *)&v24[4] = objc_opt_class();
      *(_WORD *)&v24[12] = 2114;
      *(void *)&v24[14] = v4;
      id v11 = *(id *)&v24[4];
      LODWORD(v23) = 22;
      v22 = v24;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_15:

        uint64_t v13 = +[AppExtensionSupport supportedProxyExtensionForBundleIdentifier:v4];

        id v3 = (void *)v13;
        goto LABEL_16;
      }
      v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, v24, v23, *(_OWORD *)v24, *(void *)&v24[16]);
      free(v12);
      v22 = v10;
      SSFileLog();
    }

    goto LABEL_15;
  }
LABEL_16:
  if (!v3)
  {
    v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14)
    {
      v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = objc_msgSend(v14, "shouldLog", v22);
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    v17 = [v14 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (v16)
    {
      v18 = objc_opt_class();
      *(_DWORD *)v24 = 138412546;
      *(void *)&v24[4] = v18;
      *(_WORD *)&v24[12] = 2112;
      *(void *)&v24[14] = v4;
      id v19 = v18;
      LODWORD(v23) = 22;
      uint64_t v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_28:

        goto LABEL_29;
      }
      v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, v24, v23);
      free(v20);
      SSFileLog();
    }

    goto LABEL_28;
  }
LABEL_29:

LABEL_30:

  return v3;
}

- (id)_fullBuyParametersWithAppProxy:(id)a3
{
  id v4 = a3;
  id v5 = [(BuyMicroPaymentOperation *)self clientIdentity];
  id v6 = [v5 copy];

  if (v4) {
    [v6 setValuesWithSoftwareApplicationProxy:v4];
  }
  v7 = sub_1000616A4(v6);
  [v7 removeObjectForKey:@"vid"];
  [v7 setObject:@"true" forKey:@"generateBuyParams"];
  unsigned int v8 = +[NSString stringWithFormat:@"%ld", [(BuyMicroPaymentOperation *)self quantity]];
  [v7 setObject:v8 forKey:@"quantity"];

  int v9 = [(BuyMicroPaymentOperation *)self productIdentifier];
  if (v9)
  {
    v10 = v9;
    id v11 = [v9 copyUTF8StringOfLength:100];

    if (v11)
    {
      [v7 setObject:v11 forKey:@"offerName"];
    }
  }
  uint64_t v12 = [(BuyMicroPaymentOperation *)self buyParameters];
  if (v12)
  {
    id v13 = +[NSURL copyDictionaryForQueryString:v12 unescapedValues:1];
    if (v13) {
      [v7 addEntriesFromDictionary:v13];
    }
  }
  v47 = (void *)v12;
  v48 = v7;
  v14 = +[NSURL queryStringForDictionary:v7 escapedValues:0];
  id v50 = [(BuyMicroPaymentOperation *)self requestData];
  if ([v50 length])
  {
    id v15 = v50;
    [v15 bytes];
    [v15 length];
    int v16 = (void *)ISCopyEncodedBase64();
    if (v16)
    {
      v17 = +[NSCharacterSet URLQueryAllowedCharacterSet];
      id v18 = [v17 mutableCopy];

      [v18 removeCharactersInString:@"?=&+"];
      uint64_t v19 = [v16 stringByAddingPercentEncodingWithAllowedCharacters:v18];
      uint64_t v20 = (void *)v19;
      if (v19) {
        [v14 appendFormat:@"&%@=%@", @"requestData", v19];
      }
    }
  }
  v21 = [v4 purchaserDSID];
  if ([v21 integerValue])
  {
    v22 = [v21 stringValue];
    [v14 appendFormat:@"&%@=%@", @"appDsid", v22];
  }
  uint64_t v23 = [v4 storeCohortMetadata];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v24 = +[NSURL escapedStringForString:v23];
    v25 = (void *)v24;
    if (v24) {
      [v14 appendFormat:@"&%@=%@", @"storeCohort", v24];
    }
  }
  uint64_t v26 = [v6 vendorIdentifier];
  unsigned int v27 = (void *)v26;
  if (v26) {
    [v14 appendFormat:@"&%@=%@", @"vid", v26];
  }
  if ([v4 isBetaApp]) {
    [v14 appendString:@"&beta=true"];
  }
  v46 = v27;
  v49 = v4;
  if ([v6 isSandboxed]
    && [(BuyMicroPaymentOperation *)self simulatesAskToBuyInSandbox])
  {
    [v14 appendString:@"&requiresAskToBuy=true"];
  }
  [(BuyMicroPaymentOperation *)self lock];
  uint64_t v28 = 0;
  applicationUsername = self->_applicationUsername;
  v52[0] = @"applicationUsername";
  v52[1] = applicationUsername;
  partnerIdentifier = self->_partnerIdentifier;
  v52[2] = @"partnerId";
  v52[3] = partnerIdentifier;
  partnerTransactionIdentifier = self->_partnerTransactionIdentifier;
  v52[4] = @"partnerTransactionId";
  v52[5] = partnerTransactionIdentifier;
  do
  {
    v32 = (void *)v52[v28 + 1];
    if (v32)
    {
      v33 = +[NSCharacterSet characterSetWithCharactersInString:@"?=&+"];
      id v34 = [v32 stringByAddingPercentEncodingWithAllowedCharacters:v33];

      if (v34) {
        [v14 appendFormat:@"&%@=%@", v52[v28], v34];
      }
    }
    v28 += 2;
  }
  while (v28 != 6);
  if (self->_discountIdentifier
    && self->_discountKeyIdentifier
    && self->_discountNonceString
    && self->_discountSignature
    && self->_discountTimestamp)
  {
    id v35 = +[NSCharacterSet URLQueryAllowedCharacterSet];
    id v36 = [v35 mutableCopy];

    [v36 removeCharactersInString:@"?=&+"];
    discountIdentifier = self->_discountIdentifier;
    v51[0] = @"adHocOfferId";
    v51[1] = discountIdentifier;
    discountKeyIdentifier = self->_discountKeyIdentifier;
    v51[2] = @"adHocKeyId";
    v51[3] = discountKeyIdentifier;
    discountNonceString = self->_discountNonceString;
    v51[4] = @"adHocNonce";
    v51[5] = discountNonceString;
    discountSignature = self->_discountSignature;
    v51[6] = @"adHocSignature";
    v51[7] = discountSignature;
    v51[8] = @"adHocTimestamp";
    uint64_t v41 = 0;
    v51[9] = [(NSNumber *)self->_discountTimestamp stringValue];
    do
    {
      v42 = (void *)v51[v41 + 1];
      if (v42)
      {
        uint64_t v43 = [v42 stringByAddingPercentEncodingWithAllowedCharacters:v36];
        v44 = (void *)v43;
        if (v43) {
          [v14 appendFormat:@"&%@=%@", v51[v41], v43];
        }
      }
      v41 += 2;
    }
    while (v41 != 10);
  }
  [(BuyMicroPaymentOperation *)self unlock];

  return v14;
}

- (NSString)originatingStorefront
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setOriginatingStorefront:(id)a3
{
}

- (NSManagedObjectID)paymentID
{
  return (NSManagedObjectID *)objc_getProperty(self, a2, 192, 1);
}

- (void)setPaymentID:(id)a3
{
}

- (NSString)discountIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setDiscountIdentifier:(id)a3
{
}

- (NSString)discountKeyIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDiscountKeyIdentifier:(id)a3
{
}

- (NSString)discountNonceString
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setDiscountNonceString:(id)a3
{
}

- (NSString)discountSignature
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setDiscountSignature:(id)a3
{
}

- (NSNumber)discountTimestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 232, 1);
}

- (void)setDiscountTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discountTimestamp, 0);
  objc_storeStrong((id *)&self->_discountSignature, 0);
  objc_storeStrong((id *)&self->_discountNonceString, 0);
  objc_storeStrong((id *)&self->_discountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_discountIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentID, 0);
  objc_storeStrong((id *)&self->_originatingStorefront, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_clientAuditTokenData, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);

  objc_storeStrong((id *)&self->_applicationUsername, 0);
}

@end