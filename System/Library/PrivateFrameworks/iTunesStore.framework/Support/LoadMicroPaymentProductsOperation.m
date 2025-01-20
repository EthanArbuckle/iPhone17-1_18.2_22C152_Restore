@interface LoadMicroPaymentProductsOperation
- (BOOL)_loadResponseForIdentity:(id)a3 batchSize:(int64_t)a4 returningError:(id *)a5;
- (LoadMicroPaymentProductsOperation)initWithProductIdentifiers:(id)a3;
- (NSArray)productIdentifiers;
- (StoreKitClientIdentity)clientIdentity;
- (id)_copyQueryStringDictionaryForIdentity:(id)a3 productIdentifiers:(id)a4;
- (id)_copyResponseForIdentity:(id)a3 identifiers:(id)a4 returningError:(id *)a5;
- (id)copyProductsResponse;
- (int64_t)_batchSizeForIdentity:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)run;
- (void)setClientIdentity:(id)a3;
@end

@implementation LoadMicroPaymentProductsOperation

- (LoadMicroPaymentProductsOperation)initWithProductIdentifiers:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LoadMicroPaymentProductsOperation;
  v4 = [(LoadMicroPaymentProductsOperation *)&v6 init];
  if (v4) {
    v4->_productIdentifiers = (NSArray *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LoadMicroPaymentProductsOperation;
  [(LoadMicroPaymentProductsOperation *)&v3 dealloc];
}

- (StoreKitClientIdentity)clientIdentity
{
  [(LoadMicroPaymentProductsOperation *)self lock];
  objc_super v3 = self->_clientIdentity;
  [(LoadMicroPaymentProductsOperation *)self unlock];
  return v3;
}

- (id)copyProductsResponse
{
  [(LoadMicroPaymentProductsOperation *)self lock];
  objc_super v3 = self->_response;
  [(LoadMicroPaymentProductsOperation *)self unlock];
  return v3;
}

- (NSArray)productIdentifiers
{
  v2 = self->_productIdentifiers;

  return v2;
}

- (void)setClientIdentity:(id)a3
{
  [(LoadMicroPaymentProductsOperation *)self lock];
  clientIdentity = self->_clientIdentity;
  if (clientIdentity != a3)
  {

    self->_clientIdentity = (StoreKitClientIdentity *)[a3 copy];
  }

  [(LoadMicroPaymentProductsOperation *)self unlock];
}

- (void)run
{
  v32 = 0;
  objc_super v3 = [(LoadMicroPaymentProductsOperation *)self clientIdentity];
  if (![(StoreKitClientIdentity *)v3 usesIdentityAttributes])
  {
    id v5 = +[LSApplicationProxy applicationProxyForIdentifier:[(StoreKitClientIdentity *)v3 bundleIdentifier]];
    id v6 = [v5 bundleType];
    if (([v6 isEqualToString:LSUserApplicationType] & 1) == 0) {
      id v5 = +[AppExtensionSupport supportedProxyExtensionForBundleIdentifier:[(StoreKitClientIdentity *)v3 bundleIdentifier]];
    }
    if (v5)
    {
      [(StoreKitClientIdentity *)v3 setValuesWithSoftwareApplicationProxy:v5];
LABEL_17:
      goto LABEL_18;
    }
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v33 = 138412546;
      uint64_t v34 = objc_opt_class();
      __int16 v35 = 2112;
      v36 = [(StoreKitClientIdentity *)v3 bundleIdentifier];
      LODWORD(v31) = 22;
      v29 = &v33;
      objc_super v3 = (StoreKitClientIdentity *)_os_log_send_and_compose_impl();
      if (!v3) {
        goto LABEL_17;
      }
      v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v3, 4, &v33, v31);
      free(v3);
      v29 = (int *)v10;
      SSFileLog();
    }
    objc_super v3 = 0;
    goto LABEL_17;
  }
LABEL_18:
  if (!v3)
  {
    v20 = self;
    v21 = 0;
LABEL_45:
    -[LoadMicroPaymentProductsOperation setError:](v20, "setError:", v21, v29);
    return;
  }
  uint64_t v11 = [(LoadMicroPaymentProductsOperation *)self _batchSizeForIdentity:v3 error:&v32];
  if (v11 <= 0)
  {
LABEL_44:
    v21 = v32;
    v20 = self;
    goto LABEL_45;
  }
  if (![(LoadMicroPaymentProductsOperation *)self _loadResponseForIdentity:v3 batchSize:v11 returningError:&v32])
  {
    id v22 = +[SSLogConfig sharedDaemonConfig];
    if (!v22) {
      id v22 = +[SSLogConfig sharedConfig];
    }
    unsigned int v23 = objc_msgSend(v22, "shouldLog", v29);
    if ([v22 shouldLogToDisk]) {
      int v24 = v23 | 2;
    }
    else {
      int v24 = v23;
    }
    if (!os_log_type_enabled((os_log_t)[v22 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v24 &= 2u;
    }
    if (v24)
    {
      uint64_t v25 = objc_opt_class();
      int v33 = 138412546;
      uint64_t v34 = v25;
      __int16 v35 = 2112;
      v36 = v32;
      LODWORD(v31) = 22;
      v29 = &v33;
      uint64_t v26 = _os_log_send_and_compose_impl();
      if (v26)
      {
        v27 = (void *)v26;
        v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v33, v31);
        free(v27);
        v29 = (int *)v28;
        SSFileLog();
      }
    }
    goto LABEL_44;
  }
  if (([(LoadMicroPaymentProductsOperation *)self isCancelled] & 1) == 0)
  {
    id v12 = +[SSLogConfig sharedDaemonConfig];
    if (!v12) {
      id v12 = +[SSLogConfig sharedConfig];
    }
    unsigned int v13 = objc_msgSend(v12, "shouldLog", v29);
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_INFO)) {
      v14 &= 2u;
    }
    if (v14)
    {
      uint64_t v15 = objc_opt_class();
      NSUInteger v16 = [(NSArray *)self->_productIdentifiers count];
      int v33 = 138412546;
      uint64_t v34 = v15;
      __int16 v35 = 2048;
      v36 = (NSString *)v16;
      LODWORD(v31) = 22;
      v30 = &v33;
      uint64_t v17 = _os_log_send_and_compose_impl();
      if (v17)
      {
        v18 = (void *)v17;
        v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v33, v31);
        free(v18);
        v30 = (int *)v19;
        SSFileLog();
      }
    }
    -[LoadMicroPaymentProductsOperation setSuccess:](self, "setSuccess:", 1, v30);
  }
}

- (int64_t)_batchSizeForIdentity:(id)a3 error:(id *)a4
{
  uint64_t v15 = 0;
  id v6 = +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", [a3 isSandboxed]);
  if ([(LoadMicroPaymentProductsOperation *)self loadURLBagWithContext:v6 returningError:&v15])
  {
    id v7 = objc_msgSend(objc_msgSend(+[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache"), "URLBagForContext:", v6), "valueForKey:", @"p2-product-offers-batch-limit");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (int64_t result = (int64_t)[v7 integerValue]) == 0) {
      int64_t result = 25;
    }
  }
  else
  {
    id v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (v11)
    {
      uint64_t v12 = objc_opt_class();
      int v16 = 138412290;
      uint64_t v17 = v12;
      LODWORD(v14) = 12;
      int64_t result = _os_log_send_and_compose_impl();
      if (!result) {
        goto LABEL_16;
      }
      unsigned int v13 = (void *)result;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", result, 4, &v16, v14);
      free(v13);
      SSFileLog();
    }
    int64_t result = 0;
  }
LABEL_16:
  if (a4) {
    *a4 = v15;
  }
  return result;
}

- (id)_copyQueryStringDictionaryForIdentity:(id)a3 productIdentifiers:(id)a4
{
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = [a3 bundleIdentifier];
  if (v7)
  {
    id v8 = [v7 copyUTF8StringOfLength:256];
    if (v8)
    {
      id v9 = v8;
      [v6 setObject:v8 forKey:@"bid"];
    }
  }
  id v10 = [a3 bundleVersion];
  if (v10)
  {
    id v11 = [v10 copyUTF8StringOfLength:100];
    if (v11)
    {
      uint64_t v12 = v11;
      [v6 setObject:v11 forKey:@"bvrs"];
    }
  }
  id v13 = [a3 storeIdentifier];
  if (v13) {
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v13, "stringValue"), @"appAdamId");
  }
  uint64_t v14 = +[NSLocale autoupdatingCurrentLocale];
  if (v14) {
    objc_msgSend(v6, "setObject:forKey:", -[NSLocale localeIdentifier](v14, "localeIdentifier"), @"icuLocale");
  }
  id v15 = [a4 componentsJoinedByString:@","];
  if ([v15 length]) {
    [v6 setObject:v15 forKey:@"offerNames"];
  }
  id v16 = objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "storeFrontIdentifier");
  if (v16) {
    [v6 setObject:v16 forKey:@"sfId"];
  }
  id v17 = [a3 storeVersion];
  if (v17) {
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v17, "stringValue"), @"appExtVrsId");
  }
  return v6;
}

- (id)_copyResponseForIdentity:(id)a3 identifiers:(id)a4 returningError:(id *)a5
{
  id v16 = 0;
  id v9 = objc_alloc_init((Class)ISStoreURLOperation);
  id v10 = objc_alloc_init(DaemonProtocolDataProvider);
  [v9 setDataProvider:v10];

  id v11 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v11 setAllowedRetryCount:0];
  objc_msgSend(v11, "setAllowsBootstrapCellularData:", objc_msgSend(a3, "allowsBootstrapCellularData"));
  [v11 setCachePolicy:1];
  [v11 setURLBagKey:@"p2-product-offers"];
  objc_msgSend(v11, "setURLBagType:", objc_msgSend(a3, "isSandboxed"));
  id v12 = [(LoadMicroPaymentProductsOperation *)self _copyQueryStringDictionaryForIdentity:a3 productIdentifiers:a4];
  [v11 setRequestParameters:v12];

  [v9 setRequestProperties:v11];
  unsigned int v13 = [(LoadMicroPaymentProductsOperation *)self runSubOperation:v9 returningError:&v16];
  uint64_t v14 = 0;
  if (v13)
  {
    uint64_t v14 = objc_alloc_init(MicroPaymentProductsResponse);
    [(MicroPaymentProductsResponse *)v14 setExpectedIdentifiers:a4];
    if (![(MicroPaymentProductsResponse *)v14 loadFromDictionary:[(DaemonProtocolDataProvider *)v10 output] error:&v16])
    {

      uint64_t v14 = 0;
    }
  }

  if (a5) {
    *a5 = v16;
  }
  return v14;
}

- (BOOL)_loadResponseForIdentity:(id)a3 batchSize:(int64_t)a4 returningError:(id *)a5
{
  v48 = 0;
  v43 = [(NSArray *)[(LoadMicroPaymentProductsOperation *)self productIdentifiers] sortedArrayUsingSelector:"compare:"];
  id v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig];
  }
  v40 = a5;
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_INFO)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v50 = 138412802;
    uint64_t v51 = objc_opt_class();
    __int16 v52 = 2048;
    NSUInteger v53 = [(NSArray *)v43 count];
    __int16 v54 = 2048;
    int64_t v55 = a4;
    LODWORD(v39) = 32;
    v38 = &v50;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      id v11 = (void *)v10;
      id v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v50, v39);
      free(v11);
      v38 = (int *)v12;
      SSFileLog();
    }
  }
  id v13 = objc_alloc_init((Class)NSMutableArray);
  id v14 = objc_alloc_init((Class)NSMutableArray);
  id v15 = objc_alloc_init((Class)NSMutableArray);
  NSUInteger v16 = [(NSArray *)v43 count];
  if ((v16 & 0x8000000000000000) == 0)
  {
    int64_t v17 = v16;
    uint64_t v18 = 0;
    int64_t v19 = 0;
    while (1)
    {
      if ([(LoadMicroPaymentProductsOperation *)self isCancelled]) {
        goto LABEL_34;
      }
      if (v19 >= v17) {
        break;
      }
      id v20 = [(NSArray *)v43 objectAtIndex:v19];
      unint64_t v21 = (unint64_t)[v20 length];
      if (v21 > 0x280) {
        goto LABEL_21;
      }
      if (!v20 || [v15 count] == (id)a4 || v21 + v18 >= 0x281)
      {
LABEL_23:
        id v23 = [(LoadMicroPaymentProductsOperation *)self _copyResponseForIdentity:a3 identifiers:v15 returningError:&v48];
        BOOL v22 = v23 == 0;
        if (v23)
        {
          int v24 = v23;
          objc_msgSend(v13, "addObjectsFromArray:", objc_msgSend(v23, "products"));
          objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(v24, "invalidIdentifiers"));
        }
        [v15 removeAllObjects];
        uint64_t v18 = 0;
        goto LABEL_26;
      }
LABEL_22:
      BOOL v22 = 0;
LABEL_26:
      if (v21 - 1 <= 0x27F)
      {
        [v15 addObject:v20];
        v18 += v21;
      }
      char v26 = v19++ >= v17 || v22;
      if (v26)
      {

        if (!v22) {
          goto LABEL_35;
        }
        [(LoadMicroPaymentProductsOperation *)self lock];

        self->_response = 0;
        [(LoadMicroPaymentProductsOperation *)self unlock];
        BOOL v27 = 0;
        v28 = v40;
        goto LABEL_45;
      }
    }
    unint64_t v21 = (unint64_t)[0 length];
    id v20 = 0;
    if (v21 < 0x281) {
      goto LABEL_23;
    }
LABEL_21:
    [v14 addObject:v20];
    goto LABEL_22;
  }
LABEL_34:

LABEL_35:
  id v29 = objc_alloc_init((Class)NSMutableArray);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v30 = [v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
  v28 = v40;
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v45;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(v13);
        }
        id v34 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * i), "copyProduct", v38);
        if (v34)
        {
          __int16 v35 = v34;
          [v29 addObject:v34];
        }
      }
      id v31 = [v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v31);
  }
  [(LoadMicroPaymentProductsOperation *)self lock];

  v36 = (SKProductsResponse *)objc_alloc_init((Class)sub_100174E3C());
  self->_response = v36;
  [(SKProductsResponse *)v36 _setInvalidIdentifiers:v14];
  [(SKProductsResponse *)self->_response _setProducts:v29];
  [(LoadMicroPaymentProductsOperation *)self unlock];

  BOOL v27 = 1;
LABEL_45:

  if (v28) {
    id *v28 = v48;
  }
  return v27;
}

@end