@interface StoreServicesRequestQueue
+ (id)sharedInstance;
+ (void)setSharedInstance:(id)a3;
- (id)_newClientWithMessage:(id)a3 connection:(id)a4;
- (void)_sendMessageWithError:(id)a3 toClient:(id)a4;
- (void)_sendUnentitledMessageToClient:(id)a3;
- (void)_sendUnentitledReplyForMessage:(id)a3 connection:(id)a4;
- (void)addDownloadsUsingManifestWithMessage:(id)a3 connection:(id)a4;
- (void)addMediaSocialPostWithMessage:(id)a3 connection:(id)a4;
- (void)addOperation:(id)a3 forClient:(id)a4 withMessageBlock:(id)a5;
- (void)addOperation:(id)a3 forMessage:(id)a4 connection:(id)a5 replyBlock:(id)a6;
- (void)authorizeMachineWithMessage:(id)a3 connection:(id)a4;
- (void)checkinRentalWithMessage:(id)a3 connection:(id)a4;
- (void)checkoutRentalWithMessage:(id)a3 connection:(id)a4;
- (void)collectURLSessionDataWithMessage:(id)a3 connection:(id)a4;
- (void)demoteApplicationWithMessage:(id)a3 connection:(id)a4;
- (void)getAccountPurchaseHistoryWithMessage:(id)a3 connection:(id)a4;
- (void)getApplicationCapabilitiesMessage:(id)a3 connection:(id)a4;
- (void)getApplicationWithMessage:(id)a3 connection:(id)a4;
- (void)getAvailableItemKindsWithMessage:(id)a3 connection:(id)a4;
- (void)getFamilyCircleWithMessage:(id)a3 connection:(id)a4;
- (void)getKBSyncWithMessage:(id)a3 connection:(id)a4;
- (void)getMediaSocialShareExtensionVisibilityWithMessage:(id)a3 connection:(id)a4;
- (void)getPlayInfoWithMessage:(id)a3 connection:(id)a4;
- (void)getRemovableSytemApplicationsWithMessage:(id)a3 connection:(id)a4;
- (void)getSoftwareLibraryItemsWithMessage:(id)a3 connection:(id)a4;
- (void)getUserApplicationsWithMessage:(id)a3 connection:(id)a4;
- (void)handlePurchaseIntentActionWithMessage:(id)a3 connection:(id)a4;
- (void)hasDemotedApplicationsWithMessage2:(id)a3 connection:(id)a4;
- (void)hasDemotedApplicationsWithMessage:(id)a3 connection:(id)a4;
- (void)haveApplicationsOfTypeWithMessage:(id)a3 connection:(id)a4;
- (void)invalidateURLBagWithMessage:(id)a3 connection:(id)a4;
- (void)isInstalledAppWithMessage:(id)a3 connection:(id)a4;
- (void)isRemovedSystemAppWithMessage:(id)a3 connection:(id)a4;
- (void)keybagRequestWithMessage:(id)a3 connection:(id)a4;
- (void)observeXPCServer:(id)a3;
- (void)personalizeOffersWithMessage:(id)a3 connection:(id)a4;
- (void)playableApplicationsWithMessage:(id)a3 connection:(id)a4;
- (void)pushNotificationRequestWithMessage:(id)a3 connection:(id)a4;
- (void)pushNotificationTokenRequestWithMessage:(id)a3 connection:(id)a4;
- (void)redeemCodesWithMessage:(id)a3 connection:(id)a4;
- (void)rentalSyncRequestWithMessage:(id)a3 connection:(id)a4;
- (void)saveInstallAttributionParamsWithMessage:(id)a3 connection:(id)a4;
- (void)sdk_getStorefrontCountryCodeWithMessage:(id)a3 connection:(id)a4;
- (void)sendAskToBuyWithMessage:(id)a3 connection:(id)a4;
- (void)sendInstallAttributionPingbackWithMessage:(id)a3 connection:(id)a4;
- (void)showDialogRequestWithMessage:(id)a3 connection:(id)a4;
- (void)showServerPromptWithMessage:(id)a3 connection:(id)a4;
- (void)softwareLibraryItemSetValuesWithMessage:(id)a3 connection:(id)a4;
@end

@implementation StoreServicesRequestQueue

+ (void)setSharedInstance:(id)a3
{
  pthread_mutex_lock(&stru_100400B58);
  if ((id)qword_100401CE8 != a3)
  {

    qword_100401CE8 = (uint64_t)a3;
  }

  pthread_mutex_unlock(&stru_100400B58);
}

+ (id)sharedInstance
{
  pthread_mutex_lock(&stru_100400B58);
  id v3 = (id)qword_100401CE8;
  if (!qword_100401CE8)
  {
    id v3 = objc_alloc_init((Class)a1);
    qword_100401CE8 = (uint64_t)v3;
  }
  id v4 = v3;
  pthread_mutex_unlock(&stru_100400B58);
  return v4;
}

- (void)observeXPCServer:(id)a3
{
  [a3 addObserver:self selector:"addDownloadsUsingManifestWithMessage:connection:" forMessage:56];
  [a3 addObserver:self selector:"authorizeMachineWithMessage:connection:" forMessage:57];
  [a3 addObserver:self selector:"checkinRentalWithMessage:connection:" forMessage:59];
  [a3 addObserver:self selector:"checkoutRentalWithMessage:connection:" forMessage:60];
  [a3 addObserver:self selector:"demoteApplicationWithMessage:connection:" forMessage:161];
  [a3 addObserver:self selector:"getAccountPurchaseHistoryWithMessage:connection:" forMessage:67];
  [a3 addObserver:self selector:"getApplicationWithMessage:connection:" forMessage:136];
  [a3 addObserver:self selector:"getApplicationCapabilitiesMessage:connection:" forMessage:164];
  [a3 addObserver:self selector:"getAvailableItemKindsWithMessage:connection:" forMessage:68];
  [a3 addObserver:self selector:"getFamilyCircleWithMessage:connection:" forMessage:141];
  [a3 addObserver:self selector:"getKBSyncWithMessage:connection:" forMessage:139];
  [a3 addObserver:self selector:"getPlayInfoWithMessage:connection:" forMessage:58];
  [a3 addObserver:self selector:"getSoftwareLibraryItemsWithMessage:connection:" forMessage:89];
  [a3 addObserver:self selector:"getUserApplicationsWithMessage:connection:" forMessage:137];
  [a3 addObserver:self selector:"haveApplicationsOfTypeWithMessage:connection:" forMessage:135];
  [a3 addObserver:self selector:"invalidateURLBagWithMessage:connection:" forMessage:49];
  [a3 addObserver:self selector:"keybagRequestWithMessage:connection:" forMessage:86];
  [a3 addObserver:self selector:"personalizeOffersWithMessage:connection:" forMessage:55];
  [a3 addObserver:self selector:"pushNotificationRequestWithMessage:connection:" forMessage:127];
  [a3 addObserver:self selector:"pushNotificationTokenRequestWithMessage:connection:" forMessage:210];
  [a3 addObserver:self selector:"redeemCodesWithMessage:connection:" forMessage:91];
  [a3 addObserver:self selector:"rentalSyncRequestWithMessage:connection:" forMessage:1016];
  [a3 addObserver:self selector:"sendAskToBuyWithMessage:connection:" forMessage:140];
  [a3 addObserver:self selector:"showDialogRequestWithMessage:connection:" forMessage:134];
  [a3 addObserver:self selector:"showServerPromptWithMessage:connection:" forMessage:69];
  [a3 addObserver:self selector:"softwareLibraryItemSetValuesWithMessage:connection:" forMessage:90];
  [a3 addObserver:self selector:"addMediaSocialPostWithMessage:connection:" forMessage:159];
  [a3 addObserver:self selector:"getMediaSocialShareExtensionVisibilityWithMessage:connection:" forMessage:160];
  [a3 addObserver:self selector:"isRemovedSystemAppWithMessage:connection:" forMessage:168];
  [a3 addObserver:self selector:"playableApplicationsWithMessage:connection:" forMessage:186];
  [a3 addObserver:self selector:"hasDemotedApplicationsWithMessage:connection:" forMessage:169];
  [a3 addObserver:self selector:"getRemovableSytemApplicationsWithMessage:connection:" forMessage:172];
  [a3 addObserver:self selector:"isInstalledAppWithMessage:connection:" forMessage:167];
  [a3 addObserver:self selector:"sdk_getStorefrontCountryCodeWithMessage:connection:" forMessage:173];
  [a3 addObserver:self selector:"handlePurchaseIntentActionWithMessage:connection:" forMessage:198];
  [a3 addObserver:self selector:"saveInstallAttributionParamsWithMessage:connection:" forMessage:200];
  [a3 addObserver:self selector:"sendInstallAttributionPingbackWithMessage:connection:" forMessage:201];
  if (SSIsInternalBuild()) {
    [a3 addObserver:self selector:"collectURLSessionDataWithMessage:connection:" forMessage:199];
  }
  v5.receiver = self;
  v5.super_class = (Class)StoreServicesRequestQueue;
  [(RequestQueue *)&v5 observeXPCServer:a3];
}

- (void)addDownloadsUsingManifestWithMessage:(id)a3 connection:(id)a4
{
  id v6 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend(objc_alloc((Class)SSDownloadManifestRequest), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    if (v7)
    {
      v8 = v7;
      v9 = [[LoadExternalDownloadManifestOperation alloc] initWithRequest:v7];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100068A2C;
      v18[3] = &unk_1003A4310;
      v18[4] = v9;
      [(StoreServicesRequestQueue *)self addOperation:v9 forClient:v6 withMessageBlock:v18];
    }
  }
  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v19 = 138412546;
      uint64_t v20 = objc_opt_class();
      __int16 v21 = 2112;
      id v22 = v6;
      LODWORD(v17) = 22;
      v16 = &v19;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        v14 = (void *)v13;
        v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v19, v17);
        free(v14);
        v16 = (int *)v15;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v16);
  }
}

- (void)addMediaSocialPostWithMessage:(id)a3 connection:(id)a4
{
  id v10 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:");
  if (SSXPCConnectionHasEntitlement() & 1) != 0 || (SSXPCConnectionHasEntitlement())
  {
    id v6 = objc_msgSend(objc_alloc((Class)SSVMediaSocialPostRequest), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    id v7 = [v6 postDescription];
    if ([v7 accountIdentifier]
      || (id v8 = objc_msgSend(objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"), "uniqueIdentifier"), objc_msgSend(v7, "setAccountIdentifier:", v8), v8))
    {
      objc_msgSend(+[DirectUploadController sharedController](DirectUploadController, "sharedController"), "addMediaSocialPostWithDescription:client:", v7, v10);
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = SSError();
    }
    [(StoreServicesRequestQueue *)self _sendMessageWithError:v9 toClient:v10];
  }
  else
  {
    [(StoreServicesRequestQueue *)self _sendUnentitledMessageToClient:v10];
  }
}

- (void)authorizeMachineWithMessage:(id)a3 connection:(id)a4
{
  id v6 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend(objc_alloc((Class)SSAuthorizationRequest), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    id v8 = [[AuthorizeMachineOperation alloc] initWithAuthorizationRequest:v7];
    if (objc_msgSend(objc_msgSend(v7, "clientIdentifierHeader"), "length")) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = v6;
    }
    -[AuthorizeMachineOperation setClientIdentifierHeader:](v8, "setClientIdentifierHeader:", [v9 clientIdentifierHeader]);
    if (objc_msgSend(objc_msgSend(v7, "userAgent"), "length")) {
      id v10 = v7;
    }
    else {
      id v10 = v6;
    }
    -[AuthorizeMachineOperation setUserAgent:](v8, "setUserAgent:", [v10 userAgent]);
    -[AuthorizeMachineOperation setShouldPromptForCredentials:](v8, "setShouldPromptForCredentials:", [v7 shouldPromptForCredentials]);
    -[AuthorizeMachineOperation setShouldAddKeysToKeyBag:](v8, "setShouldAddKeysToKeyBag:", [v7 shouldAddKeysToKeyBag]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100068E88;
    v19[3] = &unk_1003A4310;
    v19[4] = v8;
    [(StoreServicesRequestQueue *)self addOperation:v8 forClient:v6 withMessageBlock:v19];
  }
  else
  {
    id v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11) {
      id v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (v13)
    {
      int v20 = 138412546;
      uint64_t v21 = objc_opt_class();
      __int16 v22 = 2112;
      id v23 = v6;
      LODWORD(v18) = 22;
      uint64_t v17 = &v20;
      uint64_t v14 = _os_log_send_and_compose_impl();
      if (v14)
      {
        v15 = (void *)v14;
        v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v20, v18);
        free(v15);
        uint64_t v17 = (int *)v16;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v17);
  }
}

- (void)checkinRentalWithMessage:(id)a3 connection:(id)a4
{
  id v6 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend(objc_alloc((Class)SSRentalCheckinRequest), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    id v8 = [[CheckinRentalOperation alloc] initWithCheckinRequest:v7];
    -[CheckinRentalOperation setClientIdentifierHeader:](v8, "setClientIdentifierHeader:", [v6 clientIdentifierHeader]);
    -[CheckinRentalOperation setUserAgent:](v8, "setUserAgent:", [v6 userAgent]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100069144;
    v15[3] = &unk_1003A4310;
    v15[4] = v8;
    [(StoreServicesRequestQueue *)self addOperation:v8 forClient:v6 withMessageBlock:v15];
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
      int v16 = 138412546;
      uint64_t v17 = objc_opt_class();
      __int16 v18 = 2112;
      id v19 = v6;
      LODWORD(v14) = 22;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        int v13 = (void *)v12;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v14);
        free(v13);
        SSFileLog();
      }
    }
  }
}

- (void)checkoutRentalWithMessage:(id)a3 connection:(id)a4
{
  id v6 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend(objc_alloc((Class)SSRentalCheckoutRequest), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    if ([v7 accountIdentifier] && objc_msgSend(v7, "rentalKeyIdentifier"))
    {
      id v8 = -[CheckoutRentalKeysOperation initWithAccountIdentifier:rentalKeyIdentifier:]([CheckoutRentalKeysOperation alloc], "initWithAccountIdentifier:rentalKeyIdentifier:", [v7 accountIdentifier], objc_msgSend(v7, "rentalKeyIdentifier"));
    }
    else
    {
      id v14 = [v7 sinfs];
      if (![v14 count])
      {
        id v17 = [v7 downloadIdentifier];
        if (v17)
        {
          __int16 v18 = -[StoreDownload initWithContentsOfFile:]([StoreDownload alloc], "initWithContentsOfFile:", objc_msgSend(+[ScratchManager directoryPathForDownloadID:kind:createIfNeeded:](ScratchManager, "directoryPathForDownloadID:kind:createIfNeeded:", v17, 0, 1), "stringByAppendingPathComponent:", @"iTunesMetadata.plist"));
          v15 = (CheckoutRentalKeysOperation *)[(StoreDownload *)v18 sinfs];
          if (v15) {
            v15 = [[CheckoutRentalKeysOperation alloc] initWithStoreDownloadSinfs:v15];
          }

          if (v15) {
            goto LABEL_18;
          }
        }
        goto LABEL_25;
      }
      id v8 = [[CheckoutRentalKeysOperation alloc] initWithSinfs:v14];
    }
    v15 = v8;
    if (v8)
    {
LABEL_18:
      [(CheckoutRentalKeysOperation *)v15 setBackgroundCheckout:1];
      -[CheckoutRentalKeysOperation setCheckoutWithPlay:](v15, "setCheckoutWithPlay:", [v7 shouldCheckoutWithPlay]);
      -[CheckoutRentalKeysOperation setClientIdentifierHeader:](v15, "setClientIdentifierHeader:", [v6 clientIdentifierHeader]);
      int v16 = (char *)[v7 checkoutType];
      if ((unint64_t)(v16 - 1) <= 1) {
        [(CheckoutRentalKeysOperation *)v15 setCheckoutType:v16];
      }
      -[CheckoutRentalKeysOperation setShouldValidateRentalInfo:](v15, "setShouldValidateRentalInfo:", [v7 shouldValidateRentalInfo]);
      -[CheckoutRentalKeysOperation setUserAgent:](v15, "setUserAgent:", [v6 userAgent]);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000695C0;
      v20[3] = &unk_1003A4310;
      v20[4] = v15;
      [(StoreServicesRequestQueue *)self addOperation:v15 forClient:v6 withMessageBlock:v20];

      goto LABEL_26;
    }
LABEL_25:
    [(StoreServicesRequestQueue *)self _sendMessageWithError:SSError() toClient:v6];
LABEL_26:

    goto LABEL_27;
  }
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
    int v21 = 138412546;
    uint64_t v22 = objc_opt_class();
    __int16 v23 = 2112;
    id v24 = v6;
    LODWORD(v19) = 22;
    uint64_t v12 = _os_log_send_and_compose_impl();
    if (v12)
    {
      int v13 = (void *)v12;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v21, v19);
      free(v13);
      SSFileLog();
    }
  }
LABEL_27:
}

- (void)demoteApplicationWithMessage:(id)a3 connection:(id)a4
{
  if (SSXPCConnectionHasEntitlement())
  {
    objc_opt_class();
    id v7 = (void *)SSXPCDictionaryCopyCFObjectWithClass();
    id v8 = [[DemoteApplicationOperation alloc] initWithBundleIdentifier:v7];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000697B0;
    v9[3] = &unk_1003A4310;
    v9[4] = v8;
    [(StoreServicesRequestQueue *)self addOperation:v8 forMessage:a3 connection:a4 replyBlock:v9];
  }
  else
  {
    [(StoreServicesRequestQueue *)self _sendUnentitledReplyForMessage:a3 connection:a4];
  }
}

- (void)getAccountPurchaseHistoryWithMessage:(id)a3 connection:(id)a4
{
  id v7 = [[XPCClient alloc] initWithInputConnection:a4];
  if ([(XPCClient *)v7 hasEntitlements])
  {
    id v8 = objc_msgSend(objc_alloc((Class)SSMutableAuthenticationContext), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    xpc_dictionary_get_value(a3, "2");
    objc_opt_class();
    id v9 = (void *)SSXPCCreateNSArrayFromXPCEncodedArray();
    if (![v8 clientIdentifierHeader]) {
      objc_msgSend(v8, "setClientIdentifierHeader:", -[XPCClient clientIdentifierHeader](v7, "clientIdentifierHeader"));
    }
    id v10 = [v8 HTTPHeaders];
    uint64_t v11 = SSHTTPHeaderUserAgent;
    if (![v10 objectForKey:SSHTTPHeaderUserAgent]) {
      objc_msgSend(v8, "setValue:forHTTPHeaderField:", -[XPCClient userAgent](v7, "userAgent"), v11);
    }
    uint64_t v12 = [[PurchaseHistoryOperation alloc] initWithPurchaseHistoryItems:v9 authenticationContext:v8];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100069B00;
    v21[3] = &unk_1003A4310;
    v21[4] = v12;
    [(StoreServicesRequestQueue *)self addOperation:v12 forMessage:a3 connection:a4 replyBlock:v21];
  }
  else
  {
    id v13 = +[SSLogConfig sharedDaemonConfig];
    if (!v13) {
      id v13 = +[SSLogConfig sharedConfig];
    }
    unsigned int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15)
    {
      int v22 = 138412546;
      uint64_t v23 = objc_opt_class();
      __int16 v24 = 2112;
      v25 = v7;
      LODWORD(v20) = 22;
      uint64_t v19 = &v22;
      uint64_t v16 = _os_log_send_and_compose_impl();
      if (v16)
      {
        id v17 = (void *)v16;
        __int16 v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v22, v20);
        free(v17);
        uint64_t v19 = (int *)v18;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v7, v19);
  }
}

- (void)getApplicationWithMessage:(id)a3 connection:(id)a4
{
  if (SSXPCConnectionHasEntitlement() & 1) != 0 || (SSXPCConnectionHasEntitlement())
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100069C5C;
    v8[3] = &unk_1003A3380;
    v8[4] = a3;
    v8[5] = a4;
    dispatch_async(global_queue, v8);
  }
  else
  {
    [(StoreServicesRequestQueue *)self _sendUnentitledReplyForMessage:a3 connection:a4];
  }
}

- (void)getApplicationCapabilitiesMessage:(id)a3 connection:(id)a4
{
  BOOL v7 = (SSXPCConnectionHasEntitlement() & 1) != 0 || SSXPCConnectionHasEntitlement();
  global_queue = dispatch_get_global_queue(0, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100069E30;
  v9[3] = &unk_1003A4B60;
  v9[4] = self;
  void v9[5] = a3;
  v9[6] = a4;
  BOOL v10 = v7;
  dispatch_async(global_queue, v9);
}

- (void)getAvailableItemKindsWithMessage:(id)a3 connection:(id)a4
{
  BOOL v7 = [[XPCClient alloc] initWithInputConnection:a4];
  CFPreferencesSynchronize(kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  id v8 = +[SSDevice copyCachedAvailableItemKinds];
  if (v8)
  {
    id v9 = v8;
    xpc_object_t reply = xpc_dictionary_create_reply(a3);
    [v9 allObjects];
    SSXPCDictionarySetCFObject();
    xpc_connection_send_message((xpc_connection_t)a4, reply);

    xpc_release(reply);
  }
  else
  {
    uint64_t v11 = +[SSURLBagContext contextWithBagType:0];
    uint64_t v12 = [(XPCClient *)v7 userAgent];
    [(SSURLBagContext *)v11 setValue:v12 forHTTPHeaderField:SSHTTPHeaderUserAgent];
    id v13 = [objc_alloc((Class)ISLoadURLBagOperation) initWithBagContext:v11];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10006A0E4;
    v14[3] = &unk_1003A4310;
    v14[4] = v13;
    [(StoreServicesRequestQueue *)self addOperation:v13 forMessage:a3 connection:a4 replyBlock:v14];
  }
}

- (void)getFamilyCircleWithMessage:(id)a3 connection:(id)a4
{
  id v6 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend(objc_alloc((Class)SSFamilyCircleRequest), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    id v8 = objc_alloc_init(FamilyCircleOperation);
    -[FamilyCircleOperation setAuthenticationPromptStyle:](v8, "setAuthenticationPromptStyle:", [v7 authenticationPromptStyle]);
    -[FamilyCircleOperation setClientAuditTokenData:](v8, "setClientAuditTokenData:", [v6 auditTokenData]);
    -[FamilyCircleOperation setFetchITunesAccountNames:](v8, "setFetchITunesAccountNames:", [v7 fetchITunesAccountNames]);
    -[FamilyCircleOperation setUserAgent:](v8, "setUserAgent:", [v6 userAgent]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006A3AC;
    v15[3] = &unk_1003A4310;
    v15[4] = v8;
    [(StoreServicesRequestQueue *)self addOperation:v8 forClient:v6 withMessageBlock:v15];
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
      int v16 = 138412290;
      uint64_t v17 = objc_opt_class();
      LODWORD(v14) = 12;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        id v13 = (void *)v12;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v14);
        free(v13);
        SSFileLog();
      }
    }
  }
}

- (void)getKBSyncWithMessage:(id)a3 connection:(id)a4
{
  if (SSXPCConnectionHasEntitlement())
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006A4F0;
    v8[3] = &unk_1003A3380;
    v8[4] = a3;
    v8[5] = a4;
    dispatch_async(global_queue, v8);
  }
  else
  {
    [(StoreServicesRequestQueue *)self _sendUnentitledReplyForMessage:a3 connection:a4];
  }
}

- (void)getMediaSocialShareExtensionVisibilityWithMessage:(id)a3 connection:(id)a4
{
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  xpc_dictionary_set_BOOL(reply, "1", (BOOL)objc_msgSend(+[SSVMediaSocialAdminPermissionsCoordinator sharedCoordinator](SSVMediaSocialAdminPermissionsCoordinator, "sharedCoordinator"), "isCurrentUserAdmin"));
  xpc_connection_send_message((xpc_connection_t)a4, reply);

  xpc_release(reply);
}

- (void)getPlayInfoWithMessage:(id)a3 connection:(id)a4
{
  id v6 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend(objc_alloc((Class)SSPlayInfoRequest), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    id v8 = -[GetPlayInfoOperation initWithPlayInfoRequestContext:]([GetPlayInfoOperation alloc], "initWithPlayInfoRequestContext:", [v7 playInfoContext]);
    -[GetPlayInfoOperation setClientIdentifierHeader:](v8, "setClientIdentifierHeader:", [v6 clientIdentifierHeader]);
    -[GetPlayInfoOperation setUserAgent:](v8, "setUserAgent:", [v6 userAgent]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10006A8CC;
    v17[3] = &unk_1003A4310;
    v17[4] = v8;
    [(StoreServicesRequestQueue *)self addOperation:v8 forClient:v6 withMessageBlock:v17];
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
      int v18 = 138412546;
      uint64_t v19 = objc_opt_class();
      __int16 v20 = 2112;
      id v21 = v6;
      LODWORD(v16) = 22;
      int v15 = &v18;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        id v13 = (void *)v12;
        uint64_t v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v18, v16);
        free(v13);
        int v15 = (int *)v14;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v15);
  }
}

- (void)getSoftwareLibraryItemsWithMessage:(id)a3 connection:(id)a4
{
  if (SSXPCConnectionHasEntitlement() & 1) != 0 || (SSXPCConnectionHasEntitlement())
  {
    id v7 = (void *)SSXPCConnectionCopyClientIdentifier();
    id v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v28 = 138543618;
      uint64_t v29 = objc_opt_class();
      __int16 v30 = 2114;
      v31 = v7;
      LODWORD(v26) = 22;
      v25 = &v28;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        id v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v28, v26);
        free(v12);
        v25 = (int *)v13;
        SSFileLog();
      }
    }

    objc_opt_class();
    uint64_t v14 = (void *)SSXPCDictionaryCopyCFObjectWithClass();
    objc_opt_class();
    int v15 = (void *)SSXPCDictionaryCopyCFObjectWithClass();
    uint64_t v16 = [SoftwareLibraryLookupOperation alloc];
    if (v15) {
      uint64_t v17 = [(SoftwareLibraryLookupOperation *)v16 initWithItemIdentifiers:v15];
    }
    else {
      uint64_t v17 = [(SoftwareLibraryLookupOperation *)v16 initWithBundleIdentifiers:v14];
    }
    int v18 = v17;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10006ACCC;
    v27[3] = &unk_1003A4310;
    v27[4] = v17;
    -[StoreServicesRequestQueue addOperation:forMessage:connection:replyBlock:](self, "addOperation:forMessage:connection:replyBlock:", v17, a3, a4, v27, v25);
  }
  else
  {
    id v19 = +[SSLogConfig sharedDaemonConfig];
    if (!v19) {
      id v19 = +[SSLogConfig sharedConfig];
    }
    unsigned int v20 = [v19 shouldLog];
    if ([v19 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    if (!os_log_type_enabled((os_log_t)[v19 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v21 &= 2u;
    }
    if (v21)
    {
      int v28 = 138412290;
      uint64_t v29 = objc_opt_class();
      LODWORD(v26) = 12;
      v25 = &v28;
      uint64_t v22 = _os_log_send_and_compose_impl();
      if (v22)
      {
        uint64_t v23 = (void *)v22;
        __int16 v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v28, v26);
        free(v23);
        v25 = (int *)v24;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:](self, "_sendUnentitledReplyForMessage:connection:", a3, a4, v25);
  }
}

- (void)getRemovableSytemApplicationsWithMessage:(id)a3 connection:(id)a4
{
  if (SSXPCConnectionHasEntitlement() & 1) != 0 || (SSXPCConnectionHasEntitlement())
  {
    id v7 = objc_alloc_init(RemoveableSoftwareLookupOperation);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10006AF4C;
    v16[3] = &unk_1003A4310;
    v16[4] = v7;
    [(StoreServicesRequestQueue *)self addOperation:v7 forMessage:a3 connection:a4 replyBlock:v16];
  }
  else
  {
    id v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v17 = 138412290;
      uint64_t v18 = objc_opt_class();
      LODWORD(v15) = 12;
      uint64_t v14 = &v17;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        id v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v17, v15);
        free(v12);
        uint64_t v14 = (int *)v13;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:](self, "_sendUnentitledReplyForMessage:connection:", a3, a4, v14);
  }
}

- (void)getUserApplicationsWithMessage:(id)a3 connection:(id)a4
{
  if (SSXPCConnectionHasEntitlement() & 1) != 0 || (SSXPCConnectionHasEntitlement())
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006B0A8;
    v8[3] = &unk_1003A3380;
    v8[4] = a3;
    v8[5] = a4;
    dispatch_async(global_queue, v8);
  }
  else
  {
    [(StoreServicesRequestQueue *)self _sendUnentitledReplyForMessage:a3 connection:a4];
  }
}

- (void)handlePurchaseIntentActionWithMessage:(id)a3 connection:(id)a4
{
  id v6 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend(objc_alloc((Class)SSPurchaseIntentActionRequest), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    if (v7)
    {
      id v8 = v7;
      unsigned int v9 = [[PurchaseIntentActionOperation alloc] initWithRequest:v7];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10006B354;
      v18[3] = &unk_1003A4310;
      v18[4] = v9;
      [(StoreServicesRequestQueue *)self addOperation:v9 forClient:v6 withMessageBlock:v18];
    }
  }
  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v19 = 138412546;
      uint64_t v20 = objc_opt_class();
      __int16 v21 = 2112;
      id v22 = v6;
      LODWORD(v17) = 22;
      uint64_t v16 = &v19;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        uint64_t v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v19, v17);
        free(v14);
        uint64_t v16 = (int *)v15;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v16);
  }
}

- (void)hasDemotedApplicationsWithMessage:(id)a3 connection:(id)a4
{
  if (SSXPCConnectionHasEntitlement() & 1) != 0 || (SSXPCConnectionHasEntitlement())
  {
    id v7 = objc_alloc_init(CheckForDemotedApplicationsOperation);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10006B5B4;
    v16[3] = &unk_1003A4310;
    v16[4] = v7;
    [(StoreServicesRequestQueue *)self addOperation:v7 forMessage:a3 connection:a4 replyBlock:v16];
  }
  else
  {
    id v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v17 = 138412290;
      uint64_t v18 = objc_opt_class();
      LODWORD(v15) = 12;
      uint64_t v14 = &v17;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        int v12 = (void *)v11;
        uint64_t v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v17, v15);
        free(v12);
        uint64_t v14 = (int *)v13;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:](self, "_sendUnentitledReplyForMessage:connection:", a3, a4, v14);
  }
}

- (void)hasDemotedApplicationsWithMessage2:(id)a3 connection:(id)a4
{
  id v5 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  if ([v5 hasEntitlements])
  {
    id v6 = objc_alloc_init(CheckForDemotedApplicationsOperation);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006B7FC;
    v13[3] = &unk_1003A4310;
    v13[4] = v6;
    [(StoreServicesRequestQueue *)self addOperation:v6 forClient:v5 withMessageBlock:v13];
  }
  else
  {
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
      int v14 = 138412290;
      uint64_t v15 = objc_opt_class();
      LODWORD(v12) = 12;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v14, v12);
        free(v11);
        SSFileLog();
      }
    }
  }
}

- (void)haveApplicationsOfTypeWithMessage:(id)a3 connection:(id)a4
{
  if (SSXPCConnectionHasEntitlement() & 1) != 0 || (SSXPCConnectionHasEntitlement())
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006B94C;
    v8[3] = &unk_1003A3380;
    v8[4] = a3;
    v8[5] = a4;
    dispatch_async(global_queue, v8);
  }
  else
  {
    [(StoreServicesRequestQueue *)self _sendUnentitledReplyForMessage:a3 connection:a4];
  }
}

- (void)invalidateURLBagWithMessage:(id)a3 connection:(id)a4
{
  id v5 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  if ([v5 hasEntitlements])
  {
    id v6 = objc_msgSend(objc_alloc((Class)SSURLBagContext), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    uint64_t v7 = SSHTTPHeaderUserAgent;
    if (![v6 valueForHTTPHeaderField:SSHTTPHeaderUserAgent]) {
      objc_msgSend(v6, "setValue:forHTTPHeaderField:", objc_msgSend(v5, "userAgent"), v7);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(+[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache"), "invalidateURLBagForContext:", v6);
    }
  }
  else
  {
    id v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v14 = 138412546;
      uint64_t v15 = objc_opt_class();
      __int16 v16 = 2112;
      id v17 = v5;
      LODWORD(v13) = 22;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v14, v13);
        free(v12);
        SSFileLog();
      }
    }
  }
}

- (void)isInstalledAppWithMessage:(id)a3 connection:(id)a4
{
  id v7 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:");
  if ([v7 hasEntitlements])
  {
    objc_opt_class();
    id v8 = (void *)SSXPCDictionaryCopyCFObjectWithClass();
    unsigned int v9 = v8;
    if (v8 && [v8 length]) {
      unsigned __int8 v10 = objc_msgSend(+[ApplicationWorkspace defaultWorkspace](ApplicationWorkspace, "defaultWorkspace"), "isInstalledApp:", v9);
    }
    else {
      unsigned __int8 v10 = 0;
    }
    xpc_object_t reply = xpc_dictionary_create_reply(a3);
    xpc_dictionary_set_BOOL(reply, "0", v10);
    xpc_connection_send_message((xpc_connection_t)a4, reply);
    xpc_release(reply);
  }
  else
  {
    id v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11) {
      id v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (v13)
    {
      int v20 = 138412546;
      uint64_t v21 = objc_opt_class();
      __int16 v22 = 2112;
      id v23 = v7;
      LODWORD(v19) = 22;
      uint64_t v18 = &v20;
      uint64_t v14 = _os_log_send_and_compose_impl();
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        __int16 v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v20, v19);
        free(v15);
        uint64_t v18 = (int *)v16;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v7, v18);
  }
}

- (void)isRemovedSystemAppWithMessage:(id)a3 connection:(id)a4
{
  id v7 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:");
  if ([v7 hasEntitlements])
  {
    objc_opt_class();
    id v8 = (void *)SSXPCDictionaryCopyCFObjectWithClass();
    unsigned int v9 = v8;
    if (v8 && [v8 length]) {
      unsigned __int8 v10 = objc_msgSend(+[ApplicationWorkspace defaultWorkspace](ApplicationWorkspace, "defaultWorkspace"), "isRemovedSystemApp:", v9);
    }
    else {
      unsigned __int8 v10 = 0;
    }
    xpc_object_t reply = xpc_dictionary_create_reply(a3);
    xpc_dictionary_set_BOOL(reply, "0", v10);
    xpc_connection_send_message((xpc_connection_t)a4, reply);
    xpc_release(reply);
  }
  else
  {
    id v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11) {
      id v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (v13)
    {
      int v20 = 138412546;
      uint64_t v21 = objc_opt_class();
      __int16 v22 = 2112;
      id v23 = v7;
      LODWORD(v19) = 22;
      uint64_t v18 = &v20;
      uint64_t v14 = _os_log_send_and_compose_impl();
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        __int16 v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v20, v19);
        free(v15);
        uint64_t v18 = (int *)v16;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v7, v18);
  }
}

- (void)playableApplicationsWithMessage:(id)a3 connection:(id)a4
{
  id v7 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:");
  if (SSXPCConnectionHasEntitlement() & 1) != 0 || (SSXPCConnectionHasEntitlement())
  {
    objc_opt_class();
    id v8 = (void *)SSXPCDictionaryCopyCFObjectWithClass();
    id v9 = objc_alloc_init((Class)NSMutableArray);
    xpc_object_t reply = xpc_dictionary_create_reply(a3);
    xpc_dictionary_set_int64(reply, "0", 1011);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          if (SSVApplicationIsPlayable()) {
            [v9 addObject:v15];
          }
        }
        id v12 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }
    SSXPCDictionarySetCFObject();
    xpc_connection_send_message((xpc_connection_t)a4, reply);
    xpc_release(reply);
  }
  else
  {
    id v16 = +[SSLogConfig sharedDaemonConfig];
    if (!v16) {
      id v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    if (!os_log_type_enabled((os_log_t)[v16 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v18 &= 2u;
    }
    if (v18)
    {
      int v29 = 138412546;
      uint64_t v30 = objc_opt_class();
      __int16 v31 = 2112;
      id v32 = v7;
      LODWORD(v23) = 22;
      __int16 v22 = &v29;
      uint64_t v19 = _os_log_send_and_compose_impl();
      if (v19)
      {
        int v20 = (void *)v19;
        uint64_t v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v29, v23);
        free(v20);
        __int16 v22 = (int *)v21;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:](self, "_sendUnentitledReplyForMessage:connection:", a3, a4, v22);
  }
}

- (void)keybagRequestWithMessage:(id)a3 connection:(id)a4
{
  id v6 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend(objc_alloc((Class)SSKeybagRequest), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    id v8 = [[KeybagRequestOperation alloc] initWithKeybagRequest:v7 client:v6];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10006C69C;
    v17[3] = &unk_1003A4310;
    v17[4] = v8;
    [(StoreServicesRequestQueue *)self addOperation:v8 forClient:v6 withMessageBlock:v17];
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
      int v18 = 138412546;
      uint64_t v19 = objc_opt_class();
      __int16 v20 = 2112;
      id v21 = v6;
      LODWORD(v16) = 22;
      uint64_t v15 = &v18;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        uint64_t v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v18, v16);
        free(v13);
        uint64_t v15 = (int *)v14;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v15);
  }
}

- (void)personalizeOffersWithMessage:(id)a3 connection:(id)a4
{
  id v6 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend(objc_alloc((Class)SSPersonalizeOffersRequest), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    id v8 = objc_msgSend(objc_alloc((Class)ISPersonalizeOffersRequest), "initWithItems:", objc_msgSend(v7, "items"));
    objc_msgSend(v8, "setAccountIdentifier:", objc_msgSend(objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"), "uniqueIdentifier"));
    id v9 = [objc_alloc((Class)ISPersonalizeOffersOperation) initWithPersonalizeOffersRequest:v8];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10006C988;
    v18[3] = &unk_1003A4310;
    v18[4] = v9;
    [(StoreServicesRequestQueue *)self addOperation:v9 forClient:v6 withMessageBlock:v18];
  }
  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v19 = 138412546;
      uint64_t v20 = objc_opt_class();
      __int16 v21 = 2112;
      id v22 = v6;
      LODWORD(v17) = 22;
      uint64_t v16 = &v19;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        uint64_t v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v19, v17);
        free(v14);
        uint64_t v16 = (int *)v15;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v16);
  }
}

- (void)pushNotificationTokenRequestWithMessage:(id)a3 connection:(id)a4
{
  id v7 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:");
  if (SSXPCConnectionHasEntitlement() & 1) != 0 || (SSXPCConnectionHasEntitlement())
  {
    id v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v24 = 138543362;
      uint64_t v25 = objc_opt_class();
      LODWORD(v23) = 12;
      id v22 = &v24;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        int v12 = (void *)v11;
        uint64_t v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v24, v23);
        free(v12);
        id v22 = (int *)v13;
        SSFileLog();
      }
    }
    [+[PushNotificationController sharedInstance] postPushTokens];
    xpc_object_t reply = xpc_dictionary_create_reply(a3);
    if (reply)
    {
      uint64_t v15 = reply;
      xpc_dictionary_set_BOOL(reply, "1", 1);
      SSXPCDictionarySetCFObject();
      xpc_connection_send_message((xpc_connection_t)a4, v15);
      xpc_release(v15);
    }
  }
  else
  {
    id v16 = +[SSLogConfig sharedDaemonConfig];
    if (!v16) {
      id v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    if (!os_log_type_enabled((os_log_t)[v16 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v18 &= 2u;
    }
    if (v18)
    {
      int v24 = 138543618;
      uint64_t v25 = objc_opt_class();
      __int16 v26 = 2114;
      id v27 = v7;
      LODWORD(v23) = 22;
      id v22 = &v24;
      uint64_t v19 = _os_log_send_and_compose_impl();
      if (v19)
      {
        uint64_t v20 = (void *)v19;
        __int16 v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v24, v23);
        free(v20);
        id v22 = (int *)v21;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v7, v22);
  }
}

- (void)pushNotificationRequestWithMessage:(id)a3 connection:(id)a4
{
  id v6 = -[StoreServicesRequestQueue _newClientWithMessage:connection:](self, "_newClientWithMessage:connection:");
  if (SSXPCConnectionHasEntitlement() & 1) != 0 || (SSXPCConnectionHasEntitlement())
  {
    id v7 = objc_msgSend(objc_alloc((Class)SSVPushNotificationRequest), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    id v8 = -[PushNotificationRequestOperation initWithPushNotificationParameters:]([PushNotificationRequestOperation alloc], "initWithPushNotificationParameters:", [v7 pushNotificationParameters]);
    -[PushNotificationRequestOperation setUserAgent:](v8, "setUserAgent:", [v6 userAgent]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10006CF84;
    v17[3] = &unk_1003A4310;
    v17[4] = v8;
    [(StoreServicesRequestQueue *)self addOperation:v8 forClient:v6 withMessageBlock:v17];
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
      int v18 = 138412546;
      uint64_t v19 = objc_opt_class();
      __int16 v20 = 2112;
      id v21 = v6;
      LODWORD(v16) = 22;
      uint64_t v15 = &v18;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        uint64_t v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v18, v16);
        free(v13);
        uint64_t v15 = (int *)v14;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v15);
  }
}

- (void)redeemCodesWithMessage:(id)a3 connection:(id)a4
{
  id v6 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend(objc_alloc((Class)SSRedeemCodesRequest), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    id v8 = -[RedeemCodesOperation initWithRedeemCodes:]([RedeemCodesOperation alloc], "initWithRedeemCodes:", [v7 redeemCodes]);
    -[RedeemCodesOperation setHeadless:](v8, "setHeadless:", [v7 headless]);
    -[RedeemCodesOperation setCameraRecognized:](v8, "setCameraRecognized:", [v7 cameraRecognized]);
    -[RedeemCodesOperation setAuthenticationContext:](v8, "setAuthenticationContext:", [v7 authenticationContext]);
    -[RedeemCodesOperation setLogCorrelationKey:](v8, "setLogCorrelationKey:", [v7 logCorrelationKey]);
    -[RedeemCodesOperation setParams:](v8, "setParams:", [v7 params]);
    -[RedeemCodesOperation setUserAgent:](v8, "setUserAgent:", [v6 userAgent]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10006D2AC;
    v17[3] = &unk_1003A4310;
    v17[4] = v8;
    [(StoreServicesRequestQueue *)self addOperation:v8 forClient:v6 withMessageBlock:v17];
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
      int v18 = 138412546;
      uint64_t v19 = objc_opt_class();
      __int16 v20 = 2112;
      id v21 = v6;
      LODWORD(v16) = 22;
      uint64_t v15 = &v18;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        uint64_t v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v18, v16);
        free(v13);
        uint64_t v15 = (int *)v14;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v15);
  }
}

- (void)rentalSyncRequestWithMessage:(id)a3 connection:(id)a4
{
  id v6 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend(objc_alloc((Class)SSRentalSyncRequest), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    id v8 = [v7 accountIdentifier];
    id v9 = [v7 sinfs];
    if (v8)
    {
      unsigned int v10 = -[SyncRentalOperation initWithAccountIdentifier:]([SyncRentalOperation alloc], "initWithAccountIdentifier:", [v7 accountIdentifier]);
    }
    else
    {
      id v17 = v9;
      if (![v9 count]) {
        goto LABEL_19;
      }
      unsigned int v10 = [[SyncRentalOperation alloc] initWithSinfs:v17];
    }
    int v18 = v10;
    if (v10)
    {
      -[SyncRentalOperation setClientIdentifierHeader:](v10, "setClientIdentifierHeader:", [v6 clientIdentifierHeader]);
      -[SyncRentalOperation setUserAgent:](v18, "setUserAgent:", [v6 userAgent]);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10006D5F0;
      v21[3] = &unk_1003A4310;
      v21[4] = v18;
      [(StoreServicesRequestQueue *)self addOperation:v18 forClient:v6 withMessageBlock:v21];

LABEL_20:
      goto LABEL_21;
    }
LABEL_19:
    [(StoreServicesRequestQueue *)self _sendMessageWithError:SSError() toClient:v6];
    goto LABEL_20;
  }
  id v11 = +[SSLogConfig sharedDaemonConfig];
  if (!v11) {
    id v11 = +[SSLogConfig sharedConfig];
  }
  unsigned int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v13 &= 2u;
  }
  if (v13)
  {
    int v22 = 138412546;
    uint64_t v23 = objc_opt_class();
    __int16 v24 = 2112;
    id v25 = v6;
    LODWORD(v20) = 22;
    uint64_t v19 = &v22;
    uint64_t v14 = _os_log_send_and_compose_impl();
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      uint64_t v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v22, v20);
      free(v15);
      uint64_t v19 = (int *)v16;
      SSFileLog();
    }
  }
  -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v19);
LABEL_21:
}

- (void)saveInstallAttributionParamsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend(objc_alloc((Class)SSInstallAttributionParamsRequest), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    if (v7)
    {
      id v8 = v7;
      id v9 = [[SaveInstallAttributionParamsOperation alloc] initWithRequest:v7];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10006D91C;
      v18[3] = &unk_1003A4310;
      v18[4] = v9;
      [(StoreServicesRequestQueue *)self addOperation:v9 forClient:v6 withMessageBlock:v18];
    }
    else
    {
      [(StoreServicesRequestQueue *)self _sendMessageWithError:SSError() toClient:v6];
    }
  }
  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v19 = 138412546;
      uint64_t v20 = objc_opt_class();
      __int16 v21 = 2112;
      id v22 = v6;
      LODWORD(v17) = 22;
      uint64_t v16 = &v19;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        uint64_t v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v19, v17);
        free(v14);
        uint64_t v16 = (int *)v15;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v16);
  }
}

- (void)sdk_getStorefrontCountryCodeWithMessage:(id)a3 connection:(id)a4
{
  long long v18 = 0u;
  long long v19 = 0u;
  xpc_connection_get_audit_token();
  memset(v20, 0, sizeof(v20));
  if (TCCAccessCheckAuditToken())
  {
    id v7 = [[XPCClient alloc] initWithInputConnection:a4];
    id v8 = +[SSURLBagContext contextWithBagType:0];
    id v9 = [(XPCClient *)v7 userAgent];
    [(SSURLBagContext *)v8 setValue:v9 forHTTPHeaderField:SSHTTPHeaderUserAgent];
    id v10 = [objc_alloc((Class)ISLoadURLBagOperation) initWithBagContext:v8];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10006DBCC;
    v17[3] = &unk_1003A4310;
    v17[4] = v10;
    [(StoreServicesRequestQueue *)self addOperation:v10 forMessage:a3 connection:a4 replyBlock:v17];
  }
  else
  {
    id v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11) {
      id v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (v13)
    {
      LODWORD(v20[0]) = 138543362;
      *(void *)((char *)v20 + 4) = objc_opt_class();
      LODWORD(v16) = 12;
      uint64_t v14 = _os_log_send_and_compose_impl();
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, v20, v16);
        free(v15);
        SSFileLog();
      }
    }
  }
}

- (void)sendAskToBuyWithMessage:(id)a3 connection:(id)a4
{
  id v6 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend(objc_alloc((Class)SSAskPermissionActionRequest), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    id v8 = -[AskPermissionActionOperation initWithURL:account:]([AskPermissionActionOperation alloc], "initWithURL:account:", [v7 URL], objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006DFE8;
    v15[3] = &unk_1003A4310;
    v15[4] = v8;
    [(StoreServicesRequestQueue *)self addOperation:v8 forClient:v6 withMessageBlock:v15];
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
      int v16 = 138412290;
      uint64_t v17 = objc_opt_class();
      LODWORD(v14) = 12;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        int v13 = (void *)v12;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v14);
        free(v13);
        SSFileLog();
      }
    }
  }
}

- (void)sendInstallAttributionPingbackWithMessage:(id)a3 connection:(id)a4
{
  id v5 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  id v6 = +[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", [v5 clientIdentifier], 0);
  if (!v6)
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
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v11 &= 2u;
    }
    if (v11)
    {
      int v21 = 138543618;
      uint64_t v22 = objc_opt_class();
      __int16 v23 = 2114;
      id v24 = [v5 clientIdentifier];
      LODWORD(v19) = 22;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        int v13 = (void *)v12;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v21, v19);
        free(v13);
        SSFileLog();
      }
    }
    goto LABEL_25;
  }
  id v7 = [v6 itemID];
  if (!v7)
  {
    id v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14) {
      id v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v16 &= 2u;
    }
    if (v16)
    {
      int v21 = 138543618;
      uint64_t v22 = objc_opt_class();
      __int16 v23 = 2114;
      id v24 = [v5 clientIdentifier];
      LODWORD(v19) = 22;
      uint64_t v17 = _os_log_send_and_compose_impl();
      if (v17)
      {
        long long v18 = (void *)v17;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v21, v19);
        free(v18);
        SSFileLog();
      }
    }
LABEL_25:
    [(StoreServicesRequestQueue *)self _sendMessageWithError:SSError() toClient:v5];
    goto LABEL_26;
  }
  id v8 = [[SendInstallAttributionPingbackOperation alloc] initWithAdamId:v7];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  _OWORD v20[2] = sub_10006E3A0;
  v20[3] = &unk_1003A4310;
  v20[4] = v8;
  [(StoreServicesRequestQueue *)self addOperation:v8 forClient:v5 withMessageBlock:v20];

LABEL_26:
}

- (void)showDialogRequestWithMessage:(id)a3 connection:(id)a4
{
  id v6 = [(StoreServicesRequestQueue *)self _newClientWithMessage:a3 connection:a4];
  if ([v6 hasEntitlements])
  {
    id v7 = objc_msgSend(objc_alloc((Class)SSVShowDialogRequest), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
    id v8 = objc_msgSend(objc_alloc((Class)ISDialog), "initWithXPCEncoding:", objc_msgSend(v7, "encodedDialog"));
    id v9 = [[DaemonDialogOperation alloc] initWithDialog:v8];
    -[DaemonDialogOperation setDisplaysOnLockscreen:](v9, "setDisplaysOnLockscreen:", objc_msgSend(objc_msgSend(v8, "authenticationContext"), "displaysOnLockScreen"));
    [(DaemonDialogOperation *)v9 setOutputBlock:&stru_1003A4BC8];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10006E678;
    v18[3] = &unk_1003A4310;
    v18[4] = v9;
    [(StoreServicesRequestQueue *)self addOperation:v9 forClient:v6 withMessageBlock:v18];
  }
  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v19 = 138412546;
      uint64_t v20 = objc_opt_class();
      __int16 v21 = 2112;
      id v22 = v6;
      LODWORD(v17) = 22;
      int v16 = &v19;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        id v14 = (void *)v13;
        unsigned int v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v19, v17);
        free(v14);
        int v16 = (int *)v15;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledMessageToClient:](self, "_sendUnentitledMessageToClient:", v6, v16);
  }
}

- (void)showServerPromptWithMessage:(id)a3 connection:(id)a4
{
  if (SSXPCConnectionHasEntitlement())
  {
    objc_opt_class();
    id v7 = (void *)SSXPCDictionaryCopyCFObjectWithClass();
    id v8 = [[ShowServerPromptOperation alloc] initWithPromptIdentifier:v7];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10006E910;
    v17[3] = &unk_1003A4310;
    v17[4] = v8;
    [(StoreServicesRequestQueue *)self addOperation:v8 forMessage:a3 connection:a4 replyBlock:v17];
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
      int v18 = 138412290;
      uint64_t v19 = objc_opt_class();
      LODWORD(v16) = 12;
      unsigned int v15 = &v18;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        id v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v18, v16);
        free(v13);
        unsigned int v15 = (int *)v14;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:](self, "_sendUnentitledReplyForMessage:connection:", a3, a4, v15);
  }
}

- (void)softwareLibraryItemSetValuesWithMessage:(id)a3 connection:(id)a4
{
  if (SSXPCConnectionHasEntitlement())
  {
    objc_opt_class();
    id v7 = (void *)SSXPCDictionaryCopyCFObjectWithClass();
    objc_opt_class();
    id v8 = (void *)SSXPCDictionaryCopyCFObjectWithClass();
    id v9 = [[SoftwareLibraryUpdateOperation alloc] initWithBundleIdentifier:v7 changeset:v8];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10006EBB4;
    v18[3] = &unk_1003A4310;
    v18[4] = v9;
    [(StoreServicesRequestQueue *)self addOperation:v9 forMessage:a3 connection:a4 replyBlock:v18];
  }
  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v19 = 138412290;
      uint64_t v20 = objc_opt_class();
      LODWORD(v17) = 12;
      uint64_t v16 = &v19;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        id v14 = (void *)v13;
        unsigned int v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v19, v17);
        free(v14);
        uint64_t v16 = (int *)v15;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:](self, "_sendUnentitledReplyForMessage:connection:", a3, a4, v16);
  }
}

- (void)collectURLSessionDataWithMessage:(id)a3 connection:(id)a4
{
  if (SSXPCConnectionHasEntitlement())
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006EE04;
    block[3] = &unk_1003A3380;
    block[4] = a3;
    block[5] = a4;
    dispatch_async(global_queue, block);
  }
  else
  {
    id v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v17 = 138412290;
      uint64_t v18 = objc_opt_class();
      LODWORD(v15) = 12;
      id v14 = &v17;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        int v12 = (void *)v11;
        uint64_t v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v17, v15);
        free(v12);
        id v14 = (int *)v13;
        SSFileLog();
      }
    }
    -[StoreServicesRequestQueue _sendUnentitledReplyForMessage:connection:](self, "_sendUnentitledReplyForMessage:connection:", a3, a4, v14);
  }
}

- (void)addOperation:(id)a3 forClient:(id)a4 withMessageBlock:(id)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006EF10;
  v6[3] = &unk_1003A4338;
  v6[4] = a5;
  v5.receiver = self;
  v5.super_class = (Class)StoreServicesRequestQueue;
  [(RequestQueue *)&v5 addOperation:a3 forClient:a4 withMessageBlock:v6];
}

- (void)addOperation:(id)a3 forMessage:(id)a4 connection:(id)a5 replyBlock:(id)a6
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006EFFC;
  v7[3] = &unk_1003A4338;
  v7[4] = a6;
  v6.receiver = self;
  v6.super_class = (Class)StoreServicesRequestQueue;
  [(RequestQueue *)&v6 addOperation:a3 forMessage:a4 connection:a5 replyBlock:v7];
}

- (id)_newClientWithMessage:(id)a3 connection:(id)a4
{
  objc_super v5 = [[XPCClient alloc] initWithInputConnection:a4];
  value = (_xpc_endpoint_s *)xpc_dictionary_get_value(a3, "2");
  if (value)
  {
    id v7 = value;
    if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_endpoint)
    {
      xpc_connection_t v8 = xpc_connection_create_from_endpoint(v7);
      if (v8)
      {
        xpc_connection_t v9 = v8;
        [(XPCClient *)v5 setOutputConnectionWithConnection:v8];
        xpc_release(v9);
      }
    }
  }
  return v5;
}

- (void)_sendMessageWithError:(id)a3 toClient:(id)a4
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, "0", 1011);
  SSXPCDictionarySetCFObject();
  objc_msgSend(objc_msgSend(a4, "outputConnection"), "sendMessage:", v5);

  xpc_release(v5);
}

- (void)_sendUnentitledMessageToClient:(id)a3
{
  uint64_t v5 = SSError();

  [(StoreServicesRequestQueue *)self _sendMessageWithError:v5 toClient:a3];
}

- (void)_sendUnentitledReplyForMessage:(id)a3 connection:(id)a4
{
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    objc_super v6 = reply;
    SSError();
    SSXPCDictionarySetCFObject();
    xpc_connection_send_message((xpc_connection_t)a4, v6);
    xpc_release(v6);
  }
}

@end