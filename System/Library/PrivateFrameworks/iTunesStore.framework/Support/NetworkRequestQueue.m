@interface NetworkRequestQueue
+ (id)sharedNetworkRequestQueue;
+ (void)_addSubscriptionOperationWithType:(int64_t)a3 message:(id)a4 connection:(id)a5;
+ (void)authenticationRequestWithMessage:(id)a3 connection:(id)a4;
+ (void)claimAppsWithMessage:(id)a3 connection:(id)a4;
+ (void)disableAutomaticDownloadKindsWithMessage:(id)a3 connection:(id)a4;
+ (void)disableSubscriptionWithMessage:(id)a3 connection:(id)a4;
+ (void)enableSubscriptionWithMessage:(id)a3 connection:(id)a4;
+ (void)getDownloadQueueWithMessage:(id)a3 connection:(id)a4;
+ (void)getMatchStatusWithMessage:(id)a3 connection:(id)a4;
+ (void)getSubscriptionEntitlements:(id)a3 connection:(id)a4;
+ (void)getSubscriptionStatusWithMessage:(id)a3 connection:(id)a4;
+ (void)importDownloadToIPodLibraryWithMessage:(id)a3 connection:(id)a4;
+ (void)installManagedAppWithMessage:(id)a3 connection:(id)a4;
+ (void)installManagedAppWithMessage:(id)a3 connection:(id)a4 provideDetailedResponse:(BOOL)a5;
+ (void)installManagedAppWithMessageAndDetailedResponse:(id)a3 connection:(id)a4;
+ (void)keybagSyncWithMessage:(id)a3 connection:(id)a4;
+ (void)loadURLBagWithMessage:(id)a3 connection:(id)a4;
+ (void)lookupItemsWithMessage:(id)a3 connection:(id)a4;
+ (void)lookupWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)performMigrationWithMessage:(id)a3 connection:(id)a4;
+ (void)presentRemoteWebViewWithMessage:(id)a3 connection:(id)a4;
+ (void)refreshSubscriptionWithMessage:(id)a3 connection:(id)a4;
+ (void)rentalInformationRequestWithMessage:(id)a3 connection:(id)a4;
+ (void)repairAppWithMessage:(id)a3 connection:(id)a4;
+ (void)requestURLWithMessage:(id)a3 connection:(id)a4;
+ (void)restoreDemotedApplicationsWithMessage:(id)a3 connection:(id)a4;
+ (void)sdk_getCloudServiceCapabilities:(id)a3 connection:(id)a4;
+ (void)sdk_loadStoreFrontIdentifierWithMessage:(id)a3 connection:(id)a4;
+ (void)sdk_requestAPITokenWithMessage:(id)a3 connection:(id)a4;
+ (void)serverAuthenticateWithMessage:(id)a3 connection:(id)a4;
+ (void)silentEnrollmentVerificationWithMessage:(id)a3 connection:(id)a4;
+ (void)silentEnrollmentWithMessage:(id)a3 connection:(id)a4;
+ (void)updateMediaContentTasteWithMessage:(id)a3 connection:(id)a4;
+ (void)wishlistAddItemsWithMessage:(id)a3 connection:(id)a4;
- (NetworkRequestQueue)init;
- (id)_copyAuthenticationContextWithContext:(id)a3 client:(id)a4;
- (id)_managedQueue;
- (id)_newClientWithMessage:(id)a3 connection:(id)a4;
- (void)_dequeueSubscriptionStatusOperation:(id)a3;
- (void)_enqueueOperationsForStoreServicesURL:(id)a3;
- (void)_enqueueSubscriptionStatusOperation:(id)a3 forClient:(id)a4;
- (void)_sendMessageWithError:(id)a3 toClient:(id)a4;
- (void)_sendNotSupportedMessageToClient:(id)a3;
- (void)_sendUnentitledMessageToClient:(id)a3;
- (void)_sendUnentitledReplyForMessage:(id)a3 connection:(id)a4;
@end

@implementation NetworkRequestQueue

- (NetworkRequestQueue)init
{
  v7.receiver = self;
  v7.super_class = (Class)NetworkRequestQueue;
  v2 = [(RequestQueue *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("NetworkRequestQueueSubscriptionStatusAccessQueue", 0);
    subscriptionStatusOperationAccessQueue = v2->_subscriptionStatusOperationAccessQueue;
    v2->_subscriptionStatusOperationAccessQueue = (OS_dispatch_queue *)v3;

    id v5 = objc_alloc_init((Class)ISOperationQueue);
    [v5 setAdjustsMaxConcurrentOperationCount:0];
    [v5 setMaxConcurrentOperationCount:24];
    [(RequestQueue *)v2 setOperationQueue:v5];
  }
  return v2;
}

+ (id)sharedNetworkRequestQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BD6B0;
  block[3] = &unk_1003A31A0;
  block[4] = a1;
  if (qword_100401D80 != -1) {
    dispatch_once(&qword_100401D80, block);
  }
  v2 = (void *)qword_100401D78;

  return v2;
}

+ (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:a1 selector:"claimAppsWithMessage:connection:" forMessage:138];
  [v4 addObserver:a1 selector:"getMatchStatusWithMessage:connection:" forMessage:130];
  [v4 addObserver:a1 selector:"disableAutomaticDownloadKindsWithMessage:connection:" forMessage:194];
  [v4 addObserver:a1 selector:"keybagSyncWithMessage:connection:" forMessage:144];
  [v4 addObserver:a1 selector:"installManagedAppWithMessage:connection:" forMessage:112];
  [v4 addObserver:a1 selector:"installManagedAppWithMessageAndDetailedResponse:connection:" forMessage:113];
  [v4 addObserver:a1 selector:"getDownloadQueueWithMessage:connection:" forMessage:65];
  [v4 addObserver:a1 selector:"importDownloadToIPodLibraryWithMessage:connection:" forMessage:66];
  [v4 addObserver:a1 selector:"loadURLBagWithMessage:connection:" forMessage:25];
  [v4 addObserver:a1 selector:"lookupItemsWithMessage:connection:" forMessage:54];
  [v4 addObserver:a1 selector:"lookupWithMessage:connection:" forMessage:85];
  [v4 addObserver:a1 selector:"sdk_loadStoreFrontIdentifierWithMessage:connection:" forMessage:174];
  [v4 addObserver:a1 selector:"sdk_getCloudServiceCapabilities:connection:" forMessage:175];
  [v4 addObserver:a1 selector:"performMigrationWithMessage:connection:" forMessage:116];
  [v4 addObserver:a1 selector:"repairAppWithMessage:connection:" forMessage:148];
  [v4 addObserver:a1 selector:"requestURLWithMessage:connection:" forMessage:62];
  [v4 addObserver:a1 selector:"restoreDemotedApplicationsWithMessage:connection:" forMessage:162];
  [v4 addObserver:a1 selector:"serverAuthenticateWithMessage:connection:" forMessage:132];
  [v4 addObserver:a1 selector:"authenticationRequestWithMessage:connection:" forMessage:133];
  [v4 addObserver:a1 selector:"updateMediaContentTasteWithMessage:connection:" forMessage:163];
  [v4 addObserver:a1 selector:"wishlistAddItemsWithMessage:connection:" forMessage:166];
  [v4 addObserver:a1 selector:"presentRemoteWebViewWithMessage:connection:" forMessage:209];
  [v4 addObserver:a1 selector:"disableSubscriptionWithMessage:connection:" forMessage:145];
  [v4 addObserver:a1 selector:"enableSubscriptionWithMessage:connection:" forMessage:146];
  [v4 addObserver:a1 selector:"getSubscriptionStatusWithMessage:connection:" forMessage:149];
  [v4 addObserver:a1 selector:"getSubscriptionEntitlements:connection:" forMessage:150];
  [v4 addObserver:a1 selector:"refreshSubscriptionWithMessage:connection:" forMessage:147];
  [v4 addObserver:a1 selector:"rentalInformationRequestWithMessage:connection:" forMessage:170];
  [v4 addObserver:a1 selector:"sdk_requestAPITokenWithMessage:connection:" forMessage:191];
  [v4 addObserver:a1 selector:"silentEnrollmentWithMessage:connection:" forMessage:211];
  [v4 addObserver:a1 selector:"silentEnrollmentVerificationWithMessage:connection:" forMessage:212];
}

+ (void)claimAppsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if ((SSXPCConnectionHasEntitlement() & 1) == 0 && (SSXPCConnectionHasEntitlement() & 1) == 0)
  {
    v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14)
    {
      v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v14 shouldLog];
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
      int v25 = 138412546;
      id v26 = (id)objc_opt_class();
      __int16 v27 = 2112;
      id v28 = v9;
      id v18 = v26;
      LODWORD(v20) = 22;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_18:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_19;
      }
      v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v25, v20);
      free(v19);
      SSFileLog();
    }

    goto LABEL_18;
  }
  id v10 = objc_alloc((Class)SSVClaimApplicationsRequest);
  v11 = xpc_dictionary_get_value(v6, "1");
  id v12 = [v10 initWithXPCEncoding:v11];

  if ([v12 claimStyle])
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000BDE18;
    v21[3] = &unk_1003A5C30;
    v13 = &v22;
    id v22 = v9;
    +[AppStoreUtility checkClaimsEstablishingActiveAccounts:1 ignoringPreviousClaimAttempts:1 completionBlock:v21];
  }
  else
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000BDD4C;
    v23[3] = &unk_1003A5C30;
    v13 = &v24;
    id v24 = v9;
    +[AppStoreUtility checkFirstPartyClaimsWithCompletionBlock:v23];
  }

LABEL_19:
}

+ (void)disableAutomaticDownloadKindsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if ((SSXPCConnectionHasEntitlement() & 1) == 0)
  {
    v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14)
    {
      v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v14 shouldLog];
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
      int v23 = 138543618;
      id v24 = (id)objc_opt_class();
      __int16 v25 = 2114;
      id v26 = v9;
      id v18 = v24;
      LODWORD(v20) = 22;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_14:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_15;
      }
      v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v23, v20);
      free(v19);
      SSFileLog();
    }

    goto LABEL_14;
  }
  id v10 = [[SetAutomaticDownloadKindsOperation alloc] initWithDownloadKinds:0];
  [(SetAutomaticDownloadKindsOperation *)v10 setShouldSuppressServerDialogs:1];
  objc_opt_class();
  v11 = (void *)SSXPCDictionaryCopyObjectWithClass();
  id v12 = [v8 _copyAuthenticationContextWithContext:v11 client:v9];

  [(SetAutomaticDownloadKindsOperation *)v10 setAuthenticationContext:v12];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000BE1C4;
  v21[3] = &unk_1003A5C58;
  id v22 = v10;
  v13 = v10;
  [v8 addOperation:v13 forMessage:v6 connection:v7 replyBlock:v21];

LABEL_15:
}

+ (void)disableSubscriptionWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)enableSubscriptionWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)getMatchStatusWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if ((SSXPCConnectionHasEntitlement() & 1) == 0 && (SSXPCConnectionHasEntitlement() & 1) == 0)
  {
    v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14)
    {
      v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v14 shouldLog];
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
      int v23 = 138412546;
      id v24 = (id)objc_opt_class();
      __int16 v25 = 2112;
      id v26 = v9;
      id v18 = v24;
      LODWORD(v20) = 22;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_15:

        [v8 _sendUnentitledReplyForMessage:v6 connection:v7];
        goto LABEL_16;
      }
      v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v23, v20);
      free(v19);
      SSFileLog();
    }

    goto LABEL_15;
  }
  objc_opt_class();
  id v10 = (void *)SSXPCDictionaryCopyObjectWithClass();
  v11 = [[LoadMatchStatusOperation alloc] initWithAccountIdentifier:v10];
  id v12 = [v9 userAgent];
  [(LoadMatchStatusOperation *)v11 setUserAgent:v12];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000BE540;
  v21[3] = &unk_1003A5C58;
  id v22 = v11;
  v13 = v11;
  [v8 addOperation:v13 forMessage:v6 connection:v7 replyBlock:v21];

LABEL_16:
}

+ (void)getSubscriptionStatusWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if (SSXPCConnectionHasEntitlement() & 1) != 0 || (SSIsDaemon())
  {
    id v10 = objc_alloc_init(SubscriptionStatusOperation);
    id v11 = objc_alloc((Class)SSVSubscriptionStatusRequest);
    id v12 = xpc_dictionary_get_value(v6, "1");
    id v13 = [v11 initWithXPCEncoding:v12];

    -[SubscriptionStatusOperation setAuthenticatesIfNecessary:](v10, "setAuthenticatesIfNecessary:", [v13 authenticatesIfNecessary]);
    v14 = [v13 authenticationContext];
    [(SubscriptionStatusOperation *)v10 setAuthenticationContext:v14];

    -[SubscriptionStatusOperation setCarrierBundleProvisioningStyle:](v10, "setCarrierBundleProvisioningStyle:", [v13 carrierBundleProvisioningStyle]);
    unsigned int v15 = [v13 localizedAuthenticationReason];
    [(SubscriptionStatusOperation *)v10 setLocalizedAuthenticationReason:v15];

    int v16 = [v13 reason];
    [(SubscriptionStatusOperation *)v10 setReason:v16];

    objc_initWeak((id *)location, v10);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000BE9A4;
    v27[3] = &unk_1003A5C80;
    id v17 = v9;
    id v28 = v17;
    objc_copyWeak(&v30, (id *)location);
    id v18 = v8;
    id v29 = v18;
    [(SubscriptionStatusOperation *)v10 setStatusBlock:v27];
    [v18 _enqueueSubscriptionStatusOperation:v10 forClient:v17];

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v19 = +[SSLogConfig sharedDaemonConfig];
    if (!v19)
    {
      v19 = +[SSLogConfig sharedConfig];
    }
    unsigned int v20 = [v19 shouldLog];
    if ([v19 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    id v22 = [v19 OSLogObject];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      v21 &= 2u;
    }
    if (v21)
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = objc_opt_class();
      __int16 v32 = 2112;
      id v33 = v9;
      id v23 = *(id *)&location[4];
      LODWORD(v26) = 22;
      id v24 = (void *)_os_log_send_and_compose_impl();

      if (v24)
      {
        __int16 v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, location, v26);
        free(v24);
        SSFileLog();
      }
    }
    else
    {
    }
    [v8 _sendUnentitledMessageToClient:v9];
  }
}

+ (void)getDownloadQueueWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  id v10 = objc_alloc((Class)SSVDownloadQueueRequest);
  id v11 = xpc_dictionary_get_value(v6, "1");
  id v12 = [v10 initWithXPCEncoding:v11];

  id v13 = [v12 queueType];
  if ([v9 hasEntitlements])
  {
    CFStringRef v14 = @"pendingApps";
    if (v13 == (id)1) {
      CFStringRef v14 = @"pendingRentals";
    }
    if (v13) {
      CFStringRef v15 = v14;
    }
    else {
      CFStringRef v15 = @"pendingSongs";
    }
    id v16 = objc_alloc_init((Class)SSMutableURLRequestProperties);
    id v17 = [v9 auditTokenData];
    [v16 setClientAuditTokenData:v17];

    [v16 setURLBagKey:v15];
    id v18 = [v9 userAgent];
    [v16 setValue:v18 forHTTPHeaderField:SSHTTPHeaderUserAgent];

    v19 = [[LoadDownloadQueueOperation alloc] initWithRequestProperties:v16];
    unsigned int v20 = +[SSAccountStore defaultStore];
    int v21 = [v20 activeAccount];

    id v22 = [v21 uniqueIdentifier];
    [(LoadDownloadQueueOperation *)v19 setAccountIdentifier:v22];

    [(LoadDownloadQueueOperation *)v19 setNeedsAuthentication:0];
    objc_initWeak((id *)location, v19);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000BEEB8;
    v32[3] = &unk_1003A4FE8;
    objc_copyWeak(&v34, (id *)location);
    id v33 = v9;
    [(LoadDownloadQueueOperation *)v19 setCompletionBlock:v32];
    id v23 = [v8 operationQueue];
    [v23 addOperation:v19];

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v24 = +[SSLogConfig sharedDaemonConfig];
    if (!v24)
    {
      id v24 = +[SSLogConfig sharedConfig];
    }
    unsigned int v25 = [v24 shouldLog];
    if ([v24 shouldLogToDisk]) {
      int v26 = v25 | 2;
    }
    else {
      int v26 = v25;
    }
    __int16 v27 = [v24 OSLogObject];
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      v26 &= 2u;
    }
    if (v26)
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = objc_opt_class();
      __int16 v36 = 2112;
      id v37 = v9;
      id v28 = *(id *)&location[4];
      LODWORD(v31) = 22;
      id v29 = (void *)_os_log_send_and_compose_impl();

      if (v29)
      {
        id v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4, location, v31);
        free(v29);
        SSFileLog();
      }
    }
    else
    {
    }
    [v8 _sendUnentitledMessageToClient:v9];
  }
}

+ (void)importDownloadToIPodLibraryWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  id v10 = objc_alloc((Class)SSImportDownloadToIPodLibraryRequest);
  id v11 = xpc_dictionary_get_value(v6, "1");
  id v37 = [v10 initWithXPCEncoding:v11];

  if ([v9 hasEntitlements])
  {
    __int16 v36 = [a1 sharedNetworkRequestQueue];
    id v12 = [v37 downloadMetadata];
    if (v12) {
      goto LABEL_4;
    }
    id v13 = [v37 purchaseResponse];
    CFStringRef v14 = [v13 purchase];
    CFStringRef v15 = [v14 valueForDownloadProperty:SSDownloadPropertyStoreItemIdentifier];

    id v12 = objc_msgSend(v13, "downloadMetadataForItemIdentifier:", objc_msgSend(v15, "unsignedLongLongValue"));

    if (v12)
    {
LABEL_4:
      id v16 = objc_alloc_init(IPodLibraryItem);
      id v17 = [StoreDownload alloc];
      id v18 = [v12 dictionary];
      v19 = [(StoreDownload *)v17 initWithDictionary:v18];

      [(IPodLibraryItem *)v16 setItemMetadata:v19];
      if ([(StoreDownload *)v19 isRental])
      {
        [(IPodLibraryItem *)v16 setUpdateType:2];
        unsigned int v20 = [(StoreDownload *)v19 fullSizeImageURL];

        if (v20)
        {
          int v21 = [(StoreDownload *)v19 fullSizeImageURL];
          id v22 = +[NSData dataWithContentsOfURL:v21];

          [(IPodLibraryItem *)v16 setItemArtworkData:v22];
        }
      }
      id v23 = [[AddItemToIPodLibraryOperation alloc] initWithIPodLibraryItem:v16];
      objc_initWeak((id *)location, v23);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1000BF664;
      v38[3] = &unk_1003A5CA8;
      objc_copyWeak(&v42, (id *)location);
      id v39 = v6;
      id v40 = v7;
      id v24 = v36;
      id v41 = v24;
      [(AddItemToIPodLibraryOperation *)v23 setCompletionBlock:v38];
      [v24 setClient:v9 forOperation:v23];
      unsigned int v25 = [v24 operationQueue];
      [v25 addOperation:v23];

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)location);
    }
    else
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v6);
      id v34 = reply;
      if (reply)
      {
        xpc_dictionary_set_int64(reply, "0", 1011);
        xpc_dictionary_set_BOOL(v34, "1", 0);
        xpc_connection_send_message((xpc_connection_t)v7, v34);
      }
    }
  }
  else
  {
    int v26 = +[SSLogConfig sharedDaemonConfig];
    if (!v26)
    {
      int v26 = +[SSLogConfig sharedConfig];
    }
    unsigned int v27 = [v26 shouldLog];
    if ([v26 shouldLogToDisk]) {
      v27 |= 2u;
    }
    id v28 = [v26 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      int v29 = v27;
    }
    else {
      int v29 = v27 & 2;
    }
    if (v29)
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = objc_opt_class();
      __int16 v44 = 2112;
      id v45 = v9;
      id v30 = *(id *)&location[4];
      LODWORD(v35) = 22;
      uint64_t v31 = (void *)_os_log_send_and_compose_impl();

      if (v31)
      {
        __int16 v32 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, location, v35);
        free(v31);
        SSFileLog();
      }
    }
    else
    {
    }
    [v8 _sendUnentitledMessageToClient:v9];
  }
}

+ (void)sdk_getCloudServiceCapabilities:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  long long v26 = 0u;
  long long v27 = 0u;
  xpc_connection_get_audit_token();
  if ((SSXPCConnectionHasEntitlement() & 1) != 0
    || (*(_OWORD *)location = v26, long long v29 = v27, TCCAccessCheckAuditToken()))
  {
    id v10 = objc_alloc((Class)SSVCloudServiceCapabilitiesRequest);
    id v11 = xpc_dictionary_get_value(v6, "1");
    id v12 = [v10 initWithXPCEncoding:v11];

    id v13 = objc_alloc_init(CloudServiceCapabilitiesOperation);
    -[CloudServiceCapabilitiesOperation setAllowsPromptingForPrivacyAcknowledgement:](v13, "setAllowsPromptingForPrivacyAcknowledgement:", [v12 allowsPromptingForPrivacyAcknowledgement]);
    CFStringRef v14 = (void *)SSXPCConnectionCopyValueForEntitlement();
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector()) {
      [(CloudServiceCapabilitiesOperation *)v13 setAllowsBypassOfPrivacyAcknowledgement:1];
    }
    objc_initWeak(location, v13);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000BFB04;
    v22[3] = &unk_1003A5CD0;
    objc_copyWeak(&v25, location);
    id v15 = v9;
    id v23 = v15;
    id v16 = v8;
    id v24 = v16;
    [(CloudServiceCapabilitiesOperation *)v13 setResponseBlock:v22];
    [v16 setClient:v15 forOperation:v13];
    [v16 addOperation:v13];

    objc_destroyWeak(&v25);
    objc_destroyWeak(location);
  }
  else
  {
    id v12 = +[SSLogConfig sharedDaemonConfig];
    if (!v12)
    {
      id v12 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    id v13 = [v12 OSLogObject];
    if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT)) {
      v18 &= 2u;
    }
    if (v18)
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      id v19 = *(id *)((char *)location + 4);
      LODWORD(v21) = 12;
      unsigned int v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20) {
        goto LABEL_8;
      }
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, location, v21);
      id v13 = (CloudServiceCapabilitiesOperation *)objc_claimAutoreleasedReturnValue();
      free(v20);
      SSFileLog();
    }
  }

LABEL_8:
}

+ (void)getSubscriptionEntitlements:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if (SSXPCConnectionHasEntitlement() & 1) != 0 || (SSIsDaemon())
  {
    BOOL v10 = xpc_dictionary_get_BOOL(v6, "1");
    id v11 = objc_alloc_init(SubscriptionEntitlementsOperation);
    [(SubscriptionEntitlementsOperation *)v11 setIgnoreCaches:v10];
    id v12 = [v9 clientIdentifier];
    [(SubscriptionEntitlementsOperation *)v11 setClientIdentifier:v12];

    objc_initWeak((id *)location, v11);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000BFF38;
    v22[3] = &unk_1003A5CF8;
    objc_copyWeak(&v26, (id *)location);
    id v23 = v6;
    id v24 = v7;
    id v13 = v8;
    id v25 = v13;
    [(SubscriptionEntitlementsOperation *)v11 setSubscriptionEntitlementsBlock:v22];
    [v13 setClient:v9 forOperation:v11];
    [v13 addOperation:v11];

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)location);
  }
  else
  {
    CFStringRef v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14)
    {
      CFStringRef v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    unsigned int v17 = [v14 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (v16)
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = objc_opt_class();
      __int16 v28 = 2112;
      id v29 = v9;
      id v18 = *(id *)&location[4];
      LODWORD(v21) = 22;
      id v19 = (void *)_os_log_send_and_compose_impl();

      if (v19)
      {
        unsigned int v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, location, v21);
        free(v19);
        SSFileLog();
      }
    }
    else
    {
    }
    [v8 _sendUnentitledMessageToClient:v9];
  }
}

+ (void)installManagedAppWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)installManagedAppWithMessageAndDetailedResponse:(id)a3 connection:(id)a4
{
}

+ (void)installManagedAppWithMessage:(id)a3 connection:(id)a4 provideDetailedResponse:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = [a1 sharedNetworkRequestQueue];
  id v11 = [v10 _newClientWithMessage:v9 connection:v8];

  id v12 = objc_alloc((Class)SSVInstallManagedApplicationRequest);
  id v13 = xpc_dictionary_get_value(v9, "1");

  id v14 = [v12 initWithXPCEncoding:v13];
  if (([v11 hasEntitlements] & 1) == 0)
  {
    id v24 = +[SSLogConfig sharedDaemonConfig];
    if (!v24)
    {
      id v24 = +[SSLogConfig sharedConfig];
    }
    unsigned int v25 = [v24 shouldLog];
    if ([v24 shouldLogToDisk]) {
      int v26 = v25 | 2;
    }
    else {
      int v26 = v25;
    }
    long long v27 = [v24 OSLogObject];
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      v26 &= 2u;
    }
    if (v26)
    {
      int v42 = 138412546;
      id v43 = (id)objc_opt_class();
      __int16 v44 = 2112;
      id v45 = v11;
      id v28 = v43;
      LODWORD(v36) = 22;
      id v29 = (void *)_os_log_send_and_compose_impl();

      if (!v29)
      {
LABEL_26:

        [v10 _sendUnentitledMessageToClient:v11];
        goto LABEL_39;
      }
      long long v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4, &v42, v36);
      free(v29);
      SSFileLog();
    }

    goto LABEL_26;
  }
  unsigned int v15 = [v14 itemIdentifier];

  uint64_t v16 = +[SSLogConfig sharedDaemonConfig];
  unsigned int v17 = (void *)v16;
  if (!v15)
  {
    if (!v16)
    {
      unsigned int v17 = +[SSLogConfig sharedConfig];
    }
    unsigned int v30 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v31 = v30 | 2;
    }
    else {
      int v31 = v30;
    }
    __int16 v32 = [v17 OSLogObject];
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      v31 &= 2u;
    }
    if (v31)
    {
      int v42 = 138412290;
      id v43 = (id)objc_opt_class();
      id v33 = v43;
      LODWORD(v36) = 12;
      id v34 = (void *)_os_log_send_and_compose_impl();

      if (!v34)
      {
LABEL_38:

        uint64_t v35 = SSError();
        [v10 _sendMessageWithError:v35 toClient:v11];

        goto LABEL_39;
      }
      __int16 v32 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v34, 4, &v42, v36);
      free(v34);
      SSFileLog();
    }

    goto LABEL_38;
  }
  if (!v16)
  {
    unsigned int v17 = +[SSLogConfig sharedConfig];
  }
  unsigned int v18 = [v17 shouldLog];
  if ([v17 shouldLogToDisk]) {
    int v19 = v18 | 2;
  }
  else {
    int v19 = v18;
  }
  unsigned int v20 = [v17 OSLogObject];
  if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
    v19 &= 2u;
  }
  if (!v19) {
    goto LABEL_13;
  }
  uint64_t v21 = objc_opt_class();
  id v22 = v21;
  [v14 itemIdentifier];
  int v42 = 138412802;
  id v43 = v21;
  __int16 v44 = 2112;
  id v45 = v11;
  __int16 v46 = 2112;
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v36) = 32;
  id v23 = (void *)_os_log_send_and_compose_impl();

  if (v23)
  {
    unsigned int v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v42, v36);
    free(v23);
    SSFileLog();
LABEL_13:
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000C0580;
  v37[3] = &unk_1003A5D20;
  id v38 = v10;
  id v39 = v14;
  BOOL v41 = a5;
  id v40 = v11;
  +[AppStoreUtility installManagedAppWithRequest:v39 completionBlock:v37];

LABEL_39:
}

+ (void)keybagSyncWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  char HasEntitlement = SSXPCConnectionHasEntitlement();

  if ((HasEntitlement & 1) == 0)
  {
    unsigned int v15 = +[SSLogConfig sharedDaemonConfig];
    if (!v15)
    {
      unsigned int v15 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    unsigned int v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      int v24 = 138412546;
      id v25 = (id)objc_opt_class();
      __int16 v26 = 2112;
      id v27 = v9;
      id v19 = v25;
      LODWORD(v21) = 22;
      unsigned int v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_14:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_15;
      }
      unsigned int v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v24, v21);
      free(v20);
      SSFileLog();
    }

    goto LABEL_14;
  }
  id v11 = objc_alloc((Class)SSVKeybagSyncRequest);
  id v12 = xpc_dictionary_get_value(v6, "1");
  id v13 = [v11 initWithXPCEncoding:v12];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000C0B24;
  v22[3] = &unk_1003A5C58;
  id v23 = [[KeybagSyncOperation alloc] initWithKeybagSyncRequest:v13];
  id v14 = v23;
  [v8 addOperation:v14 forClient:v9 withMessageBlock:v22];

LABEL_15:
}

+ (void)loadURLBagWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 sharedNetworkRequestQueue];
  if (SSXPCConnectionHasEntitlement() & 1) != 0 || (SSXPCConnectionHasEntitlement())
  {
    id v9 = [[XPCClient alloc] initWithInputConnection:v7];
    id v10 = objc_alloc((Class)SSURLBagContext);
    id v11 = xpc_dictionary_get_value(v6, "1");
    id v12 = [v10 initWithXPCEncoding:v11];

    id v13 = [(XPCClient *)v9 auditTokenData];
    [v12 setClientAuditTokenData:v13];

    uint64_t v14 = SSHTTPHeaderUserAgent;
    unsigned int v15 = [v12 valueForHTTPHeaderField:SSHTTPHeaderUserAgent];

    if (!v15)
    {
      unsigned int v16 = [(XPCClient *)v9 userAgent];
      [v12 setValue:v16 forHTTPHeaderField:v14];
    }
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000C0EEC;
    v23[3] = &unk_1003A5C58;
    id v24 = [objc_alloc((Class)ISLoadURLBagOperation) initWithBagContext:v12];
    id v17 = v24;
    [v8 addOperation:v17 forMessage:v6 connection:v7 replyBlock:v23];
  }
  else
  {
    id v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9)
    {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [(XPCClient *)v9 shouldLog];
    if ([(XPCClient *)v9 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    id v12 = [(XPCClient *)v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      v19 &= 2u;
    }
    if (v19)
    {
      int v25 = 138412290;
      id v26 = (id)objc_opt_class();
      id v20 = v26;
      LODWORD(v22) = 12;
      uint64_t v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21) {
        goto LABEL_7;
      }
      id v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v25, v22);
      free(v21);
      SSFileLog();
    }
  }

LABEL_7:
}

+ (void)lookupItemsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if ([v9 hasEntitlements])
  {
    id v10 = objc_alloc_init((Class)ISStoreURLOperation);
    id v11 = +[DaemonProtocolDataProvider provider];
    [v10 setDataProvider:v11];

    id v12 = objc_alloc((Class)SSItemLookupRequest);
    id v13 = xpc_dictionary_get_value(v6, "1");
    id v14 = [v12 initWithXPCEncoding:v13];

    id v15 = objc_alloc_init((Class)SSMutableURLRequestProperties);
    unsigned int v16 = [v9 clientIdentifierHeader];
    [v15 setClientIdentifier:v16];

    [v15 setURLBagKey:@"adkit-product-url"];
    id v17 = [v9 userAgent];
    [v15 setValue:v17 forHTTPHeaderField:SSHTTPHeaderUserAgent];

    id v18 = [v14 copyQueryStringParameters];
    [v15 setRequestParameters:v18];
    [v10 setRequestProperties:v15];
    objc_initWeak((id *)location, v10);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000C13A4;
    v26[3] = &unk_1003A4FE8;
    objc_copyWeak(&v28, (id *)location);
    id v27 = v9;
    [v10 setCompletionBlock:v26];
    [v8 addOperation:v10];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10)
    {
      id v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v19 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    uint64_t v21 = [v10 OSLogObject];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      v20 &= 2u;
    }
    if (v20)
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = objc_opt_class();
      __int16 v30 = 2112;
      id v31 = v9;
      id v22 = *(id *)&location[4];
      LODWORD(v25) = 22;
      id v23 = (void *)_os_log_send_and_compose_impl();

      if (v23)
      {
        id v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, location, v25);
        free(v23);
        SSFileLog();
      }
    }
    else
    {
    }
  }
}

+ (void)lookupWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if ((SSXPCConnectionHasEntitlement() & 1) == 0
    && (SSXPCConnectionHasEntitlement() & 1) == 0
    && (SSIsDaemon() & 1) == 0)
  {
    id v23 = +[SSLogConfig sharedDaemonConfig];
    if (!v23)
    {
      id v23 = +[SSLogConfig sharedConfig];
    }
    unsigned int v24 = [v23 shouldLog];
    if ([v23 shouldLogToDisk]) {
      int v25 = v24 | 2;
    }
    else {
      int v25 = v24;
    }
    id v26 = [v23 OSLogObject];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      v25 &= 2u;
    }
    if (v25)
    {
      int v32 = 138412546;
      id v33 = (id)objc_opt_class();
      __int16 v34 = 2112;
      id v35 = v9;
      id v27 = v33;
      LODWORD(v29) = 22;
      id v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_22:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_10;
      }
      id v26 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v32, v29);
      free(v28);
      SSFileLog();
    }

    goto LABEL_22;
  }
  id v10 = objc_alloc((Class)SSLookupRequest);
  id v11 = xpc_dictionary_get_value(v6, "1");
  id v12 = [v10 initWithXPCEncoding:v11];

  id v13 = [v12 _lookupProperties];
  id v14 = [v13 valueForRequestParameter:@"caller"];
  if (!v14)
  {
    id v15 = [v9 clientIdentifier];
    [v13 setValue:v15 forRequestParameter:@"caller"];
  }
  unsigned int v16 = [[LookupRequestOperation alloc] initWithLookupProperties:v13];
  id v17 = [v12 authenticationContext];
  [(LookupRequestOperation *)v16 setAuthenticationContext:v17];

  id v18 = [v9 clientIdentifierHeader];
  [(LookupRequestOperation *)v16 setClientIdentifierHeader:v18];

  -[LookupRequestOperation setPersonalizationStyle:](v16, "setPersonalizationStyle:", [v12 personalizationStyle]);
  unsigned int v19 = [v9 userAgent];
  [(LookupRequestOperation *)v16 setUserAgent:v19];

  if ([v12 personalizationStyle] == (id)2)
  {
    int v20 = [v9 clientIdentifier];
    unsigned int v21 = [v20 isEqualToString:@"com.apple.Health"];

    if (v21) {
      [(LookupRequestOperation *)v16 setShouldSuppressCookies:1];
    }
  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000C1930;
  v30[3] = &unk_1003A5C58;
  id v31 = v16;
  id v22 = v16;
  [v8 addOperation:v22 forClient:v9 withMessageBlock:v30];

LABEL_10:
}

+ (void)performMigrationWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = (_xpc_connection_s *)a4;
  id v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if (SSXPCConnectionHasEntitlement())
  {
    objc_opt_class();
    id v33 = (void *)SSXPCDictionaryCopyObjectWithClass();
    id v10 = [v33 integerValue];
    id v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11)
    {
      id v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    id v14 = [v11 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      int v15 = v13;
    }
    else {
      int v15 = v13 & 2;
    }
    if (v15)
    {
      *(_DWORD *)id v38 = 138412290;
      *(void *)&void v38[4] = objc_opt_class();
      id v16 = *(id *)&v38[4];
      LODWORD(v32) = 12;
      id v17 = (void *)_os_log_send_and_compose_impl();

      if (v17)
      {
        id v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, v38, v32);
        free(v17);
        SSFileLog();
      }
    }
    else
    {
    }
    id v26 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithMigrationType:v10];
    id v27 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithOptions:v26];
    dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
    *(void *)id v38 = 0;
    *(void *)&v38[8] = v38;
    *(void *)&v38[16] = 0x2020000000;
    char v39 = 0;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000C1E9C;
    v34[3] = &unk_1003A5D48;
    uint64_t v36 = v38;
    id v37 = a1;
    uint64_t v29 = v28;
    id v35 = v29;
    [v27 startWithCompletionBlock:v34];
    dispatch_time_t v30 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v29, v30);
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    xpc_dictionary_set_int64(reply, "0", 1011);
    xpc_dictionary_set_BOOL(reply, "1", *(unsigned char *)(*(void *)&v38[8] + 24));
    xpc_connection_send_message(v7, reply);

    _Block_object_dispose(v38, 8);
  }
  else
  {
    unsigned int v19 = +[SSLogConfig sharedDaemonConfig];
    if (!v19)
    {
      unsigned int v19 = +[SSLogConfig sharedConfig];
    }
    unsigned int v20 = [v19 shouldLog];
    if ([v19 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    id v22 = [v19 OSLogObject];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      v21 &= 2u;
    }
    if (v21)
    {
      *(_DWORD *)id v38 = 138412546;
      *(void *)&void v38[4] = objc_opt_class();
      *(_WORD *)&v38[12] = 2112;
      *(void *)&v38[14] = v9;
      id v23 = *(id *)&v38[4];
      LODWORD(v32) = 22;
      unsigned int v24 = (void *)_os_log_send_and_compose_impl();

      if (v24)
      {
        int v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, v38, v32);
        free(v24);
        SSFileLog();
      }
    }
    else
    {
    }
    [v8 _sendUnentitledMessageToClient:v9];
  }
}

+ (void)presentRemoteWebViewWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];

  if (([v9 hasEntitlements] & 1) == 0)
  {
    id v17 = +[SSLogConfig sharedDaemonConfig];
    if (!v17)
    {
      id v17 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    unsigned int v20 = [v17 OSLogObject];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      v19 &= 2u;
    }
    if (v19)
    {
      *(_DWORD *)unsigned int v24 = 138412546;
      *(void *)&v24[4] = objc_opt_class();
      *(_WORD *)&v24[12] = 2112;
      *(void *)&v24[14] = v9;
      id v21 = *(id *)&v24[4];
      LODWORD(v23) = 22;
      id v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_14:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_15;
      }
      unsigned int v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, v24, v23, *(_OWORD *)v24, *(void *)&v24[16]);
      free(v22);
      SSFileLog();
    }

    goto LABEL_14;
  }
  id v10 = objc_alloc((Class)SSRemoteWebViewRequest);
  id v11 = xpc_dictionary_get_value(v6, "1");
  id v12 = [v10 initWithXPCEncoding:v11];

  int v13 = [[RemoteWebViewOperation alloc] initWithWebViewRequest:v12];
  id v14 = [v8 operationQueue];
  [v14 addOperation:v13];

  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v15, "0", 1011);
  id v16 = [v9 outputConnection];
  [v16 sendMessage:v15];

LABEL_15:
}

+ (void)refreshSubscriptionWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)rentalInformationRequestWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  id v10 = objc_alloc((Class)SSRentalInformationRequest);
  id v11 = xpc_dictionary_get_value(v6, "1");
  id v12 = [v10 initWithXPCEncoding:v11];

  if ([v9 hasEntitlements])
  {
    int v13 = [v12 accountIdentifier];
    id v14 = [v12 rentalKeyIdentifier];
    xpc_object_t v15 = [[LoadRentalInformationOperation alloc] initWithAccountIdentifier:v13 rentalKeyIdentifier:v14];
    objc_initWeak((id *)location, v15);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000C266C;
    v25[3] = &unk_1003A4FE8;
    objc_copyWeak(&v27, (id *)location);
    id v26 = v9;
    [(LoadRentalInformationOperation *)v15 setCompletionBlock:v25];
    id v16 = [v8 operationQueue];
    [v16 addOperation:v15];

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v17 = +[SSLogConfig sharedDaemonConfig];
    if (!v17)
    {
      id v17 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    unsigned int v20 = [v17 OSLogObject];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      v19 &= 2u;
    }
    if (v19)
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = objc_opt_class();
      __int16 v29 = 2112;
      id v30 = v9;
      id v21 = *(id *)&location[4];
      LODWORD(v24) = 22;
      id v22 = (void *)_os_log_send_and_compose_impl();

      if (v22)
      {
        uint64_t v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, location, v24);
        free(v22);
        SSFileLog();
      }
    }
    else
    {
    }
    [v8 _sendUnentitledMessageToClient:v9];
  }
}

+ (void)repairAppWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];

  if (([v9 hasEntitlements] & 1) == 0)
  {
    id v22 = +[SSLogConfig sharedDaemonConfig];
    if (!v22)
    {
      id v22 = +[SSLogConfig sharedConfig];
    }
    unsigned int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v24 = v23 | 2;
    }
    else {
      int v24 = v23;
    }
    int v25 = [v22 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      int v26 = v24;
    }
    else {
      int v26 = v24 & 2;
    }
    if (v26)
    {
      int v36 = 138412546;
      id v37 = (id)objc_opt_class();
      __int16 v38 = 2112;
      id v39 = v9;
      id v27 = v37;
      LODWORD(v30) = 22;
      dispatch_semaphore_t v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_25:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_28;
      }
      int v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v36, v30);
      free(v28);
      SSFileLog();
    }

    goto LABEL_25;
  }
  id v10 = objc_alloc((Class)SSVRepairApplicationRequest);
  id v11 = xpc_dictionary_get_value(v6, "1");
  id v12 = [v10 initWithXPCEncoding:v11];

  int v13 = +[SSLogConfig sharedDaemonConfig];
  if (!v13)
  {
    int v13 = +[SSLogConfig sharedConfig];
  }
  unsigned int v14 = [v13 shouldLog];
  if ([v13 shouldLogToDisk]) {
    int v15 = v14 | 2;
  }
  else {
    int v15 = v14;
  }
  id v16 = [v13 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
    int v17 = v15;
  }
  else {
    int v17 = v15 & 2;
  }
  if (v17)
  {
    unsigned int v18 = objc_opt_class();
    id v31 = v18;
    int v19 = [v12 accountDSID];
    [v12 bundleID];
    int v36 = 138412802;
    id v37 = v18;
    __int16 v38 = 2112;
    id v39 = v19;
    __int16 v40 = 2112;
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = 32;
    unsigned int v20 = (void *)_os_log_send_and_compose_impl();

    if (v20)
    {
      id v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v36, v30);
      free(v20);
      SSFileLog();
    }
  }
  else
  {
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000C2BC8;
  v32[3] = &unk_1003A5D70;
  id v35 = a1;
  id v33 = v12;
  id v34 = v9;
  id v29 = v12;
  +[AppStoreUtility repairAppWithRequest:v29 completionBlock:v32];

LABEL_28:
}

+ (void)requestURLWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];

  if (([v9 hasEntitlements] & 1) == 0)
  {
    int v26 = +[SSLogConfig sharedDaemonConfig];
    if (!v26)
    {
      int v26 = +[SSLogConfig sharedConfig];
    }
    unsigned int v27 = [v26 shouldLog];
    if ([v26 shouldLogToDisk]) {
      int v28 = v27 | 2;
    }
    else {
      int v28 = v27;
    }
    id v29 = [v26 OSLogObject];
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      v28 &= 2u;
    }
    if (v28)
    {
      int v38 = 138412546;
      id v39 = (id)objc_opt_class();
      __int16 v40 = 2112;
      id v41 = v9;
      id v30 = v39;
      LODWORD(v35) = 22;
      id v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
LABEL_19:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_22;
      }
      id v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v38, v35);
      free(v31);
      SSFileLog();
    }

    goto LABEL_19;
  }
  id v10 = objc_alloc((Class)SSURLConnectionRequest);
  id v11 = xpc_dictionary_get_value(v6, "1");
  id v12 = [v10 initWithXPCEncoding:v11];

  int v13 = [v12 requestProperties];
  id v14 = [v13 mutableCopy];

  int v15 = [v9 auditTokenData];
  [v14 setClientAuditTokenData:v15];

  id v16 = [v14 clientIdentifier];

  if (!v16)
  {
    int v17 = [v9 clientIdentifierHeader];
    [v14 setClientIdentifier:v17];
  }
  unsigned int v18 = [v14 HTTPHeaders];
  uint64_t v19 = SSHTTPHeaderUserAgent;
  unsigned int v20 = [v18 objectForKey:SSHTTPHeaderUserAgent];

  if (!v20)
  {
    id v21 = [v9 userAgent];
    [v14 setValue:v21 forHTTPHeaderField:v19];
  }
  id v22 = [v14 URL];
  unsigned int v23 = [v22 scheme];
  unsigned int v24 = [v23 isEqualToString:SSActionURLScheme];

  if (v24)
  {
    int v25 = [v14 URL];
    [v8 _enqueueOperationsForStoreServicesURL:v25];
  }
  else
  {
    uint64_t v32 = [[URLConnectionRequestOperation alloc] initWithRequestProperties:v14];
    id v33 = [v12 authenticationContext];
    [(URLConnectionRequestOperation *)v32 setAuthenticationContext:v33];

    id v34 = [v12 destinationFileURL];
    [(URLConnectionRequestOperation *)v32 setDestinationFileURL:v34];

    -[URLConnectionRequestOperation setSendsResponseForHTTPFailures:](v32, "setSendsResponseForHTTPFailures:", [v12 sendsResponseForHTTPFailures]);
    -[URLConnectionRequestOperation setShouldMescalSign:](v32, "setShouldMescalSign:", [v12 shouldMescalSign]);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000C32AC;
    v36[3] = &unk_1003A5C58;
    id v37 = v32;
    int v25 = v32;
    [v8 addOperation:v25 forClient:v9 withMessageBlock:v36];
  }
LABEL_22:
}

+ (void)restoreDemotedApplicationsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = (_xpc_connection_s *)a4;
  id v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];
  if (([v9 hasEntitlements] & 1) == 0)
  {
    int v15 = +[SSLogConfig sharedDaemonConfig];
    if (!v15)
    {
      int v15 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    unsigned int v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      int v28 = 138412546;
      id v29 = (id)objc_opt_class();
      __int16 v30 = 2112;
      id v31 = v9;
      id v19 = v29;
      LODWORD(v24) = 22;
      unsigned int v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_17:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_23;
      }
      unsigned int v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v28, v24);
      free(v20);
      SSFileLog();
    }

    goto LABEL_17;
  }
  id v10 = objc_alloc_init((Class)NSMutableArray);
  objc_opt_class();
  id v11 = (void *)SSXPCDictionaryCopyObjectWithClass();
  id v12 = xpc_dictionary_get_value(v6, "1");
  int v13 = v12;
  if (v12)
  {
    xpc_type_t type = xpc_get_type(v12);
    if (type == (xpc_type_t)&_xpc_type_string)
    {
      id v21 = (void *)SSXPCCreateCFObjectFromXPCObject();
      [v10 addObject:v21];
    }
    else if (type == (xpc_type_t)&_xpc_type_array)
    {
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_1000C36E8;
      applier[3] = &unk_1003A41C8;
      id v26 = v13;
      id v27 = v10;
      xpc_array_apply(v26, applier);
    }
  }
  if (SSDebugShouldUseAppstored())
  {
    +[AppStoreUtility restoreDemotedAppsWithBundleIDs:v10];
  }
  else
  {
    id v22 = +[UpdateMigrator sharedInstance];
    [v22 restoreDemotedBundleIdentifiers:v10 options:v11];
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v6);
  xpc_dictionary_set_int64(reply, "0", 1011);
  xpc_dictionary_set_BOOL(reply, "1", 1);
  SSXPCDictionarySetObject();
  xpc_connection_send_message(v7, reply);

LABEL_23:
}

+ (void)sdk_loadStoreFrontIdentifierWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 sharedNetworkRequestQueue];
  long long v24 = 0u;
  long long v25 = 0u;
  xpc_connection_get_audit_token();
  memset(v26, 0, sizeof(v26));
  if (TCCAccessCheckAuditToken())
  {
    id v9 = objc_alloc((Class)SSURLBagContext);
    id v10 = xpc_dictionary_get_value(v6, "1");
    id v11 = [v9 initWithXPCEncoding:v10];

    uint64_t v12 = SSHTTPHeaderUserAgent;
    int v13 = [v11 valueForHTTPHeaderField:SSHTTPHeaderUserAgent];

    if (!v13)
    {
      id v14 = [[XPCClient alloc] initWithInputConnection:v7];
      int v15 = [(XPCClient *)v14 userAgent];
      [v11 setValue:v15 forHTTPHeaderField:v12];
    }
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000C3A58;
    v22[3] = &unk_1003A5C58;
    id v23 = [objc_alloc((Class)ISLoadURLBagOperation) initWithBagContext:v11];
    unsigned int v16 = v23;
    [v8 addOperation:v16 forMessage:v6 connection:v7 replyBlock:v22];
  }
  else
  {
    id v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11)
    {
      id v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    unsigned int v16 = [v11 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      v18 &= 2u;
    }
    if (v18)
    {
      LODWORD(v26[0]) = 138412290;
      *(void *)((char *)v26 + 4) = objc_opt_class();
      id v19 = *(id *)((char *)v26 + 4);
      LODWORD(v21) = 12;
      unsigned int v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20) {
        goto LABEL_6;
      }
      unsigned int v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, v26, v21);
      free(v20);
      SSFileLog();
    }
  }

LABEL_6:
}

+ (void)sdk_requestAPITokenWithMessage:(id)a3 connection:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  id v26 = [a1 sharedNetworkRequestQueue];
  id v7 = [v26 _newClientWithMessage:xdict connection:v6];
  long long v31 = 0u;
  long long v32 = 0u;
  xpc_connection_get_audit_token();
  *(_OWORD *)location = 0u;
  long long v34 = 0u;
  if (TCCAccessCheckAuditToken())
  {
    id v8 = objc_alloc((Class)SSVCloudServiceAPITokenRequest);
    id v9 = xpc_dictionary_get_value(xdict, "1");
    id v10 = [v8 initWithXPCEncoding:v9];

    id v11 = [v7 clientIdentifier];
    long long v24 = [v7 clientVersion];
    uint64_t v12 = +[SSAccountStore defaultStore];
    int v13 = [v12 activeAccount];

    if (v13) {
      id v14 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccount:v13];
    }
    else {
      id v14 = objc_alloc_init((Class)SSMutableAuthenticationContext);
    }
    int v18 = v14;
    [v14 setPromptStyle:0];
    [v18 setAllowsSilentAuthentication:1];
    id v19 = objc_alloc_init(CloudServiceAPITokenOperation);
    [(CloudServiceAPITokenOperation *)v19 setAuthenticationContext:v18];
    unsigned int v20 = [v10 clientToken];
    [(CloudServiceAPITokenOperation *)v19 setClientToken:v20];

    [(CloudServiceAPITokenOperation *)v19 setRequestingBundleID:v11];
    [(CloudServiceAPITokenOperation *)v19 setRequestingBundleVersion:v24];
    objc_initWeak(location, v19);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000C3F18;
    v27[3] = &unk_1003A5D98;
    objc_copyWeak(&v30, location);
    id v21 = v7;
    id v28 = v21;
    id v22 = v26;
    id v29 = v22;
    [(CloudServiceAPITokenOperation *)v19 setResponseBlock:v27];
    [v22 setClient:v21 forOperation:v19];
    [v22 addOperation:v19];

    objc_destroyWeak(&v30);
    objc_destroyWeak(location);

    goto LABEL_13;
  }
  id v10 = +[SSLogConfig sharedConfig];
  unsigned int v15 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    v15 |= 2u;
  }
  id v11 = [v10 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    v15 &= 2u;
  }
  if (!v15) {
    goto LABEL_13;
  }
  LODWORD(location[0]) = 138412290;
  *(id *)((char *)location + 4) = (id)objc_opt_class();
  id v16 = *(id *)((char *)location + 4);
  LODWORD(v23) = 12;
  unsigned int v17 = (void *)_os_log_send_and_compose_impl();

  if (v17)
  {
    id v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, location, v23);
    free(v17);
    SSFileLog();
LABEL_13:
  }
}

+ (void)silentEnrollmentWithMessage:(id)a3 connection:(id)a4
{
  id v40 = a3;
  id v6 = a4;
  id v7 = [a1 sharedNetworkRequestQueue];
  id v41 = [v7 _newClientWithMessage:v40 connection:v6];
  if (SSXPCConnectionHasEntitlement())
  {
    id v8 = objc_alloc((Class)SSSilentEnrollment);
    id v9 = xpc_dictionary_get_value(v40, "1");
    id v10 = [v8 initWithXPCEncoding:v9];

    id v11 = [v10 context];
    id v39 = [v11 accountIdentifier];

    uint64_t v12 = [v10 context];
    int v38 = [v12 headerADSID];

    int v13 = [v10 context];
    id v37 = [v13 headerGSToken];

    id v14 = [v10 context];
    int v36 = [v14 headerGuid];

    unsigned int v15 = [v10 context];
    uint64_t v35 = [v15 headerMMeClientInfo];

    id v16 = [v10 context];
    long long v34 = [v16 headerMMeDeviceId];

    unsigned int v17 = [v10 context];
    int v18 = [v17 URLString];
    id v33 = +[NSURL URLWithString:v18];

    id v19 = objc_alloc_init((Class)ISStoreURLOperation);
    id v20 = objc_alloc_init((Class)ISJSONDataProvider);
    [v19 setDataProvider:v20];
    id v21 = [objc_alloc((Class)SSAuthenticationContext) initWithAccountIdentifier:v39];
    [v19 setAuthenticationContext:v21];
    id v22 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v33];
    [v22 setHTTPMethod:@"GET"];
    [v22 setValue:v38 forHTTPHeaderField:SSHTTPHeaderXAppleADSID];
    [v22 setValue:v37 forHTTPHeaderField:SSHTTPHeaderXAppleGSToken];
    [v22 setValue:v36 forHTTPHeaderField:SSHTTPHeaderGUID];
    [v22 setValue:v35 forHTTPHeaderField:SSHTTPHeaderXAppleMMeClientInfo];
    [v22 setValue:v34 forHTTPHeaderField:SSHTTPHeaderXAppleMMeDeviceID];
    id v23 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURLRequest:v22];
    [v19 setRequestProperties:v23];
    objc_initWeak((id *)location, v19);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000C4560;
    v42[3] = &unk_1003A4FE8;
    objc_copyWeak(&v44, (id *)location);
    id v24 = v41;
    id v43 = v24;
    [v19 setCompletionBlock:v42];
    [v7 setClient:v24 forOperation:v19];
    [v7 addOperation:v19];

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)location);
  }
  else
  {
    long long v25 = +[SSLogConfig sharedDaemonConfig];
    if (!v25)
    {
      long long v25 = +[SSLogConfig sharedConfig];
    }
    unsigned int v26 = [v25 shouldLog];
    if ([v25 shouldLogToDisk]) {
      int v27 = v26 | 2;
    }
    else {
      int v27 = v26;
    }
    id v28 = [v25 OSLogObject];
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      v27 &= 2u;
    }
    if (v27)
    {
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = objc_opt_class();
      __int16 v46 = 2114;
      id v47 = v41;
      id v29 = *(id *)&location[4];
      LODWORD(v32) = 22;
      id v30 = (void *)_os_log_send_and_compose_impl();

      if (v30)
      {
        long long v31 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v30, 4, location, v32);
        free(v30);
        SSFileLog();
      }
    }
    else
    {
    }
    [v7 _sendUnentitledMessageToClient:v41];
  }
}

+ (void)silentEnrollmentVerificationWithMessage:(id)a3 connection:(id)a4
{
  id v41 = a3;
  id v42 = a4;
  id v6 = [a1 sharedNetworkRequestQueue];
  id v43 = [v6 _newClientWithMessage:v41 connection:v42];
  if (SSXPCConnectionHasEntitlement())
  {
    id v7 = objc_alloc((Class)SSSilentEnrollment);
    id v8 = xpc_dictionary_get_value(v41, "1");
    id v9 = [v7 initWithXPCEncoding:v8];

    id v10 = [v9 context];
    id v40 = [v10 accountIdentifier];

    id v11 = [v9 context];
    id v39 = [v11 headerADSID];

    uint64_t v12 = [v9 context];
    int v38 = [v12 headerGSToken];

    int v13 = [v9 context];
    id v37 = [v13 headerGuid];

    id v14 = [v9 context];
    int v36 = [v14 headerMMeClientInfo];

    unsigned int v15 = [v9 context];
    uint64_t v35 = [v15 headerMMeDeviceId];

    id v16 = [v9 context];
    long long v34 = [v16 parameters];

    unsigned int v17 = [v9 context];
    int v18 = [v17 URLString];
    id v19 = +[NSURL URLWithString:v18];

    id v20 = objc_alloc_init((Class)ISStoreURLOperation);
    id v21 = objc_alloc_init((Class)ISJSONDataProvider);
    [v20 setDataProvider:v21];
    id v22 = [objc_alloc((Class)SSAuthenticationContext) initWithAccountIdentifier:v40];
    [v20 setAuthenticationContext:v22];
    id v23 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v19];
    [v23 setHTTPBody:v34];
    [v23 setHTTPMethod:@"POST"];
    [v23 setHTTPContentType:@"application/json"];
    [v23 setValue:v39 forHTTPHeaderField:SSHTTPHeaderXAppleADSID];
    [v23 setValue:v38 forHTTPHeaderField:SSHTTPHeaderXAppleGSToken];
    [v23 setValue:v37 forHTTPHeaderField:SSHTTPHeaderGUID];
    [v23 setValue:v36 forHTTPHeaderField:SSHTTPHeaderXAppleMMeClientInfo];
    [v23 setValue:v35 forHTTPHeaderField:SSHTTPHeaderXAppleMMeDeviceID];
    id v24 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURLRequest:v23];
    [v20 setRequestProperties:v24];
    objc_initWeak((id *)location, v20);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000C4D64;
    v44[3] = &unk_1003A4FE8;
    objc_copyWeak(&v46, (id *)location);
    id v25 = v43;
    id v45 = v25;
    [v20 setCompletionBlock:v44];
    [v6 setClient:v25 forOperation:v20];
    [v6 addOperation:v20];

    objc_destroyWeak(&v46);
    objc_destroyWeak((id *)location);
  }
  else
  {
    unsigned int v26 = +[SSLogConfig sharedDaemonConfig];
    if (!v26)
    {
      unsigned int v26 = +[SSLogConfig sharedConfig];
    }
    unsigned int v27 = [v26 shouldLog];
    if ([v26 shouldLogToDisk]) {
      v27 |= 2u;
    }
    id v28 = [v26 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      int v29 = v27;
    }
    else {
      int v29 = v27 & 2;
    }
    if (v29)
    {
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = objc_opt_class();
      __int16 v48 = 2114;
      id v49 = v43;
      id v30 = *(id *)&location[4];
      LODWORD(v33) = 22;
      long long v31 = (void *)_os_log_send_and_compose_impl();

      if (v31)
      {
        uint64_t v32 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, location, v33);
        free(v31);
        SSFileLog();
      }
    }
    else
    {
    }
    [v6 _sendUnentitledMessageToClient:v43];
  }
}

+ (void)authenticationRequestWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];

  if (([v9 hasEntitlements] & 1) == 0)
  {
    int v13 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v13)
    {
      int v13 = +[SSLogConfig sharedConfig];
    }
    unsigned int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    id v16 = [v13 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      v15 &= 2u;
    }
    if (v15)
    {
      int v22 = 138543618;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2114;
      id v25 = v9;
      id v17 = v23;
      LODWORD(v19) = 22;
      int v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_14:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_15;
      }
      id v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v22, v19);
      free(v18);
      SSFileLog();
    }

    goto LABEL_14;
  }
  +[SSVSubscriptionStatusCoordinator beginSuspendingSubscriptionStatusChangeNotifications];
  id v10 = objc_alloc((Class)SSAuthenticateRequest);
  id v11 = xpc_dictionary_get_value(v6, "1");
  id v12 = [v10 initWithXPCEncoding:v11];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000C5230;
  v20[3] = &unk_1003A5DC0;
  id v21 = v9;
  [v12 startWithAuthenticateResponseBlock:v20];

LABEL_15:
}

+ (void)serverAuthenticateWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v6 connection:v7];

  if (([v9 hasEntitlements] & 1) == 0)
  {
    id v21 = +[SSLogConfig sharedDaemonConfig];
    if (!v21)
    {
      id v21 = +[SSLogConfig sharedConfig];
    }
    unsigned int v22 = [v21 shouldLog];
    if ([v21 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    __int16 v24 = [v21 OSLogObject];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      v23 &= 2u;
    }
    if (v23)
    {
      int v31 = 138412546;
      id v32 = (id)objc_opt_class();
      __int16 v33 = 2112;
      id v34 = v9;
      id v25 = v32;
      LODWORD(v27) = 22;
      unsigned int v26 = (void *)_os_log_send_and_compose_impl();

      if (!v26)
      {
LABEL_14:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_15;
      }
      __int16 v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v31, v27);
      free(v26);
      SSFileLog();
    }

    goto LABEL_14;
  }
  id v10 = objc_alloc((Class)SSVServerAuthenticateRequest);
  id v11 = xpc_dictionary_get_value(v6, "1");
  id v12 = [v10 initWithXPCEncoding:v11];

  int v13 = [v12 authenticationContext];
  id v14 = [v8 _copyAuthenticationContextWithContext:v13 client:v9];

  id v15 = objc_alloc((Class)ISDialog);
  id v16 = [v12 encodedDialog];
  id v17 = [v15 initWithXPCEncoding:v16];

  int v18 = [[ServerAuthenticationOperation alloc] initWithDialog:v17];
  [(ServerAuthenticationOperation *)v18 setAuthenticationContext:v14];
  [(ServerAuthenticationOperation *)v18 setPerformsButtonAction:0];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000C564C;
  v28[3] = &unk_1003A5DE8;
  int v29 = v18;
  id v30 = v17;
  id v19 = v17;
  id v20 = v18;
  [v8 addOperation:v20 forClient:v9 withMessageBlock:v28];

LABEL_15:
}

+ (void)updateMediaContentTasteWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 sharedNetworkRequestQueue];
  id v9 = [v8 _newClientWithMessage:v7 connection:v6];

  LOBYTE(v7) = SSXPCConnectionHasEntitlement();
  if ((v7 & 1) == 0 && (SSIsDaemon() & 1) == 0)
  {
    id v16 = +[SSLogConfig sharedDaemonConfig];
    if (!v16)
    {
      id v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    id v19 = [v16 OSLogObject];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      v18 &= 2u;
    }
    if (v18)
    {
      *(_DWORD *)int v23 = 138412546;
      *(void *)&void v23[4] = objc_opt_class();
      *(_WORD *)&v23[12] = 2112;
      *(void *)&v23[14] = v9;
      id v20 = *(id *)&v23[4];
      LODWORD(v22) = 22;
      id v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_26:

        [v8 _sendUnentitledMessageToClient:v9];
        goto LABEL_27;
      }
      id v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, v23, v22, *(void *)v23, *(_OWORD *)&v23[8]);
      free(v21);
      SSFileLog();
    }

    goto LABEL_26;
  }
  id v10 = +[SSLogConfig sharedDaemonConfig];
  if (!v10)
  {
    id v10 = +[SSLogConfig sharedConfig];
  }
  unsigned int v11 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  int v13 = [v10 OSLogObject];
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    v12 &= 2u;
  }
  if (!v12) {
    goto LABEL_13;
  }
  *(_DWORD *)int v23 = 138412546;
  *(void *)&void v23[4] = objc_opt_class();
  *(_WORD *)&v23[12] = 2112;
  *(void *)&v23[14] = v9;
  id v14 = *(id *)&v23[4];
  LODWORD(v22) = 22;
  id v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    int v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, v23, v22, *(_OWORD *)v23, *(void *)&v23[16]);
    free(v15);
    SSFileLog();
LABEL_13:
  }
  [v8 _sendNotSupportedMessageToClient:v9];
LABEL_27:
}

+ (void)wishlistAddItemsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v29 = a4;
  id v7 = [a1 sharedNetworkRequestQueue];
  id v8 = [v7 _newClientWithMessage:v6 connection:v29];
  if ([v8 hasEntitlements])
  {
    id v9 = objc_alloc_init((Class)ISStoreURLOperation);
    id v10 = +[DaemonProtocolDataProvider provider];
    [v9 setDataProvider:v10];

    unsigned int v11 = +[SSAccountStore defaultStore];
    int v12 = [v11 activeAccount];

    if (!v12 || ([v12 isAuthenticated] & 1) == 0) {
      [v9 setNeedsAuthentication:1];
    }
    int v13 = [v8 clientIdentifier];
    id v14 = ISClientIdentifierForBundleIdentifier();

    if ([v14 isEqualToString:ISClientIdentifierMoveToiOS]) {
      [v9 setNeedsTermsAndConditionsAcceptance:1];
    }
    id v15 = objc_alloc((Class)SSWishlistAddItemsRequest);
    id v16 = xpc_dictionary_get_value(v6, "1");
    id v17 = [v15 initWithXPCEncoding:v16];

    id v18 = objc_alloc_init((Class)SSMutableURLRequestProperties);
    id v19 = [v8 clientIdentifier];
    [v18 setClientIdentifier:v19];

    [v18 setURLBagKey:@"addItemsToWishlistBaseUrl"];
    id v20 = [v8 userAgent];
    [v18 setValue:v20 forHTTPHeaderField:SSHTTPHeaderUserAgent];

    id v21 = [v17 copyQueryStringParameters];
    [v18 setRequestParameters:v21];
    [v9 setRequestProperties:v18];
    objc_initWeak((id *)location, v9);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000C5F30;
    v30[3] = &unk_1003A4FE8;
    objc_copyWeak(&v32, (id *)location);
    id v31 = v8;
    [v9 setCompletionBlock:v30];
    [v7 addOperation:v9];

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)location);
  }
  else
  {
    uint64_t v22 = +[SSLogConfig sharedDaemonConfig];
    if (!v22)
    {
      uint64_t v22 = +[SSLogConfig sharedConfig];
    }
    unsigned int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      v23 |= 2u;
    }
    __int16 v24 = [v22 OSLogObject];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      v23 &= 2u;
    }
    if (v23)
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = objc_opt_class();
      __int16 v34 = 2112;
      id v35 = v8;
      id v25 = *(id *)&location[4];
      LODWORD(v28) = 22;
      unsigned int v26 = (void *)_os_log_send_and_compose_impl();

      if (v26)
      {
        uint64_t v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, location, v28);
        free(v26);
        SSFileLog();
      }
    }
    else
    {
    }
    [v7 _sendUnentitledMessageToClient:v8];
  }
}

+ (void)_addSubscriptionOperationWithType:(int64_t)a3 message:(id)a4 connection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a1 sharedNetworkRequestQueue];
  id v11 = [v10 _newClientWithMessage:v8 connection:v9];

  if ([v11 hasEntitlements])
  {
    if (a3 == 2)
    {
      id v19 = objc_alloc((Class)SSVRefreshSubscriptionRequest);
      id v20 = xpc_dictionary_get_value(v8, "1");
      id v21 = [v19 initWithXPCEncoding:v20];

      uint64_t v22 = [v21 authenticationContext];
      id v23 = [v10 _copyAuthenticationContextWithContext:v22 client:v11];

      id v24 = [v21 isRequestingOfflineSlot];
    }
    else
    {
      if (a3 == 1)
      {
        int v12 = (objc_class *)SSVEnableSubscriptionRequest;
      }
      else
      {
        if (a3)
        {
          id v23 = 0;
          id v24 = 0;
          goto LABEL_23;
        }
        int v12 = (objc_class *)SSVDisableSubscriptionRequest;
      }
      id v25 = [v12 alloc];
      unsigned int v26 = xpc_dictionary_get_value(v8, "1");
      id v21 = [v25 initWithXPCEncoding:v26];

      uint64_t v27 = [v21 authenticationContext];
      id v23 = [v10 _copyAuthenticationContextWithContext:v27 client:v11];

      id v24 = 0;
    }

LABEL_23:
    uint64_t v28 = objc_alloc_init(SubscriptionOperation);
    [(SubscriptionOperation *)v28 setAuthenticationContext:v23];
    [(SubscriptionOperation *)v28 setOperationType:a3];
    [(SubscriptionOperation *)v28 setRequestingOfflineSlot:v24];
    id v29 = [v11 userAgent];
    [(SubscriptionOperation *)v28 setUserAgent:v29];

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000C6408;
    v32[3] = &unk_1003A5C58;
    __int16 v33 = v28;
    id v30 = v28;
    [v10 addOperation:v30 forClient:v11 withMessageBlock:v32];

    goto LABEL_24;
  }
  int v13 = +[SSLogConfig sharedDaemonConfig];
  if (!v13)
  {
    int v13 = +[SSLogConfig sharedConfig];
  }
  unsigned int v14 = [v13 shouldLog];
  if ([v13 shouldLogToDisk]) {
    int v15 = v14 | 2;
  }
  else {
    int v15 = v14;
  }
  id v16 = [v13 OSLogObject];
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
    v15 &= 2u;
  }
  if (!v15) {
    goto LABEL_16;
  }
  int v34 = 138412546;
  id v35 = (id)objc_opt_class();
  __int16 v36 = 2112;
  id v37 = v11;
  id v17 = v35;
  LODWORD(v31) = 22;
  id v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    id v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v34, v31);
    free(v18);
    SSFileLog();
LABEL_16:
  }
  [v10 _sendUnentitledMessageToClient:v11];
LABEL_24:
}

- (id)_copyAuthenticationContextWithContext:(id)a3 client:(id)a4
{
  id v5 = a4;
  id v6 = [a3 mutableCopy];
  if (!v6)
  {
    id v7 = objc_alloc((Class)SSMutableAuthenticationContext);
    id v8 = +[SSAccountStore defaultStore];
    id v9 = [v8 activeAccount];
    id v6 = [v7 initWithAccount:v9];
  }
  id v10 = [v6 clientIdentifierHeader];

  if (!v10)
  {
    id v11 = [v5 clientIdentifierHeader];
    [v6 setClientIdentifierHeader:v11];
  }
  int v12 = [v6 HTTPHeaders];
  uint64_t v13 = SSHTTPHeaderUserAgent;
  unsigned int v14 = [v12 objectForKey:SSHTTPHeaderUserAgent];

  if (!v14)
  {
    int v15 = [v5 userAgent];
    [v6 setValue:v15 forHTTPHeaderField:v13];
  }
  return v6;
}

- (void)_enqueueOperationsForStoreServicesURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableString);
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = objc_alloc_init((Class)NSMutableArray);
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1000C6D60;
  v61[3] = &unk_1003A5E10;
  id v8 = v5;
  id v62 = v8;
  id v9 = v6;
  id v63 = v9;
  id v10 = v7;
  id v64 = v10;
  [v4 enumerateQueryWithBlock:v61];
  if (![v8 isEqualToString:@"download-manifest"])
  {
    id v30 = v10;
    uint64_t v31 = v9;
    unsigned int v32 = [v8 isEqualToString:@"redeem-codes"];
    uint64_t v33 = +[SSLogConfig sharedDaemonConfig];
    uint64_t v13 = (RedeemCodesOperation *)v33;
    if (!v32)
    {
      if (!v33)
      {
        uint64_t v13 = +[SSLogConfig sharedConfig];
      }
      unsigned int v48 = [(RedeemCodesOperation *)v13 shouldLog];
      if ([(RedeemCodesOperation *)v13 shouldLogToDisk]) {
        v48 |= 2u;
      }
      id v43 = [(RedeemCodesOperation *)v13 OSLogObject];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
        int v49 = v48;
      }
      else {
        int v49 = v48 & 2;
      }
      if (v49)
      {
        v50 = objc_opt_class();
        int v66 = 138412546;
        v67 = v50;
        __int16 v68 = 2112;
        id v69 = v8;
        id v51 = v50;
        LODWORD(v53) = 22;
        v52 = (void *)_os_log_send_and_compose_impl();

        if (!v52)
        {
          id v10 = v30;
          goto LABEL_60;
        }
        id v43 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v52, 4, &v66, v53);
        free(v52);
        SSFileLog();
      }
      id v10 = v30;
      goto LABEL_59;
    }
    if (!v33)
    {
      uint64_t v13 = +[SSLogConfig sharedConfig];
    }
    unsigned int v34 = [(RedeemCodesOperation *)v13 shouldLog];
    if ([(RedeemCodesOperation *)v13 shouldLogToDisk]) {
      v34 |= 2u;
    }
    id v35 = [(RedeemCodesOperation *)v13 OSLogObject];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
      int v36 = v34;
    }
    else {
      int v36 = v34 & 2;
    }
    if (v36)
    {
      id v37 = objc_opt_class();
      id v38 = v4;
      id v39 = v37;
      id v40 = [v31 count];
      int v66 = 138412546;
      v67 = v37;
      __int16 v68 = 2048;
      id v69 = v40;
      LODWORD(v53) = 22;
      id v41 = (void *)_os_log_send_and_compose_impl();

      id v4 = v38;
      id v9 = v31;

      id v10 = v30;
      if (!v41)
      {
LABEL_57:

        uint64_t v13 = [[RedeemCodesOperation alloc] initWithRedeemCodes:v9];
        [(RequestQueue *)self addOperation:v13];
        goto LABEL_60;
      }
      id v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v41, 4, &v66, v53);
      free(v41);
      SSFileLog();
    }
    else
    {
      id v10 = v30;
    }

    goto LABEL_57;
  }
  int v11 = SSRestrictionsIsOnDeviceAppInstallationAllowed();
  uint64_t v12 = +[SSLogConfig sharedDaemonConfig];
  uint64_t v13 = (RedeemCodesOperation *)v12;
  if (!v11)
  {
    if (!v12)
    {
      uint64_t v13 = +[SSLogConfig sharedConfig];
    }
    unsigned int v42 = [(RedeemCodesOperation *)v13 shouldLog];
    if ([(RedeemCodesOperation *)v13 shouldLogToDisk]) {
      v42 |= 2u;
    }
    id v43 = [(RedeemCodesOperation *)v13 OSLogObject];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
      int v44 = v42;
    }
    else {
      int v44 = v42 & 2;
    }
    if (v44)
    {
      id v45 = objc_opt_class();
      int v66 = 138412290;
      v67 = v45;
      id v46 = v45;
      LODWORD(v53) = 12;
      id v47 = (void *)_os_log_send_and_compose_impl();

      if (!v47) {
        goto LABEL_60;
      }
      id v43 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v47, 4, &v66, v53);
      free(v47);
      SSFileLog();
    }
LABEL_59:

    goto LABEL_60;
  }
  if (!v12)
  {
    uint64_t v13 = +[SSLogConfig sharedConfig];
  }
  id v55 = v9;
  id v56 = v4;
  unsigned int v14 = [(RedeemCodesOperation *)v13 shouldLog];
  if ([(RedeemCodesOperation *)v13 shouldLogToDisk]) {
    int v15 = v14 | 2;
  }
  else {
    int v15 = v14;
  }
  id v16 = [(RedeemCodesOperation *)v13 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
    int v17 = v15;
  }
  else {
    int v17 = v15 & 2;
  }
  if (v17)
  {
    id v18 = objc_opt_class();
    id v19 = v18;
    id v20 = [v10 count];
    int v66 = 138412546;
    v67 = v18;
    __int16 v68 = 2048;
    id v69 = v20;
    LODWORD(v53) = 22;
    id v21 = (void *)_os_log_send_and_compose_impl();

    if (!v21) {
      goto LABEL_15;
    }
    id v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v66, v53);
    free(v21);
    SSFileLog();
  }

LABEL_15:
  uint64_t v22 = (objc_class *)ISWeakLinkedClassForString();
  id v23 = (objc_class *)ISWeakLinkedClassForString();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v13 = (RedeemCodesOperation *)v10;
  id v24 = [(RedeemCodesOperation *)v13 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v24)
  {
    id v25 = v24;
    id v54 = v10;
    uint64_t v26 = *(void *)v58;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v58 != v26) {
          objc_enumerationMutation(v13);
        }
        id v28 = [[v22 alloc] initWithURL:*(void *)(*((void *)&v57 + 1) + 8 * i)];
        id v29 = [[v23 alloc] initWithOptions:v28];
        [v29 startWithCompletionBlock:&stru_1003A5E50];
      }
      id v25 = [(RedeemCodesOperation *)v13 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v25);
    id v9 = v55;
    id v4 = v56;
    id v10 = v54;
  }
  else
  {
    id v4 = v56;
  }
LABEL_60:
}

- (id)_managedQueue
{
  managedQueue = self->_managedQueue;
  if (!managedQueue)
  {
    id v4 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    id v5 = self->_managedQueue;
    self->_managedQueue = v4;

    [(ISOperationQueue *)self->_managedQueue setAdjustsMaxConcurrentOperationCount:0];
    [(ISOperationQueue *)self->_managedQueue setMaxConcurrentOperationCount:1];
    managedQueue = self->_managedQueue;
  }

  return managedQueue;
}

- (id)_newClientWithMessage:(id)a3 connection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[XPCClient alloc] initWithInputConnection:v5];

  xpc_dictionary_get_value(v6, "2");
  id v8 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue();

  if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_endpoint)
  {
    xpc_connection_t v9 = xpc_connection_create_from_endpoint(v8);
    if (v9) {
      [(XPCClient *)v7 setOutputConnectionWithConnection:v9];
    }
  }
  return v7;
}

- (void)_sendMessageWithError:(id)a3 toClient:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v8, "0", 1011);
  SSXPCDictionarySetObject();

  id v7 = [v5 outputConnection];

  [v7 sendMessage:v8];
}

- (void)_sendNotSupportedMessageToClient:(id)a3
{
  id v4 = a3;
  SSError();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(NetworkRequestQueue *)self _sendMessageWithError:v5 toClient:v4];
}

- (void)_sendUnentitledMessageToClient:(id)a3
{
  id v3 = a3;
  id v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v6, "0", 1011);
  id v4 = SSError();
  SSXPCDictionarySetObject();

  id v5 = [v3 outputConnection];

  [v5 sendMessage:v6];
}

- (void)_sendUnentitledReplyForMessage:(id)a3 connection:(id)a4
{
  connection = (_xpc_connection_s *)a4;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    id v6 = SSError();
    SSXPCDictionarySetObject();

    xpc_connection_send_message(connection, reply);
  }
}

- (void)_enqueueSubscriptionStatusOperation:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  subscriptionStatusOperationAccessQueue = self->_subscriptionStatusOperationAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C72E8;
  block[3] = &unk_1003A4298;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(subscriptionStatusOperationAccessQueue, block);
}

- (void)_dequeueSubscriptionStatusOperation:(id)a3
{
  id v4 = a3;
  subscriptionStatusOperationAccessQueue = self->_subscriptionStatusOperationAccessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C7440;
  v7[3] = &unk_1003A3268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(subscriptionStatusOperationAccessQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSubscriptionStatusOperations, 0);
  objc_storeStrong((id *)&self->_currentSubsctionStatusOperation, 0);
  objc_storeStrong((id *)&self->_subscriptionStatusOperationAccessQueue, 0);

  objc_storeStrong((id *)&self->_managedQueue, 0);
}

@end