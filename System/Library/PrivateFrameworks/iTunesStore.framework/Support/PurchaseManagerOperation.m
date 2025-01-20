@interface PurchaseManagerOperation
- (BOOL)_isDeviceCapableForPurchase;
- (BOOL)useRemoteAuthentication;
- (NSString)clientIdentifier;
- (NSString)clientIdentifierHeader;
- (PurchaseManagerOperation)initWithPurchase:(id)a3;
- (SSPurchase)purchase;
- (id)_appleIDForApp:(id)a3 error:(id *)a4;
- (id)_familyPurchaserAccountIdentifierForApplication:(id)a3;
- (id)_incompatibleErrorWithPurchase:(id)a3;
- (id)_installedSoftwareApplicationForPurchase:(id)a3;
- (id)_localRedownloadParametersForPurchase:(id)a3;
- (id)_newPurchaseOperationWithPurchase:(id)a3;
- (id)_personalizedRedownloadParametersForPurchase:(id)a3;
- (id)_urlBagKey;
- (id)purchaseBlock;
- (id)remoteAuthenticationHandler;
- (int64_t)URLBagType;
- (void)_performSetup;
- (void)_performTeardownWithResult:(BOOL)a3 queueResponse:(id)a4;
- (void)_showDialogForPurchase:(id)a3 error:(id)a4;
- (void)_updateAccount:(id)a3 withPurchaseResponse:(id)a4;
- (void)run;
- (void)setClientIdentifier:(id)a3;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setPurchaseBlock:(id)a3;
- (void)setRemoteAuthenticationHandler:(id)a3;
- (void)setURLBagType:(int64_t)a3;
- (void)setUseRemoteAuthentication:(BOOL)a3;
@end

@implementation PurchaseManagerOperation

- (PurchaseManagerOperation)initWithPurchase:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PurchaseManagerOperation;
  v6 = [(PurchaseManagerOperation *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_purchase, a3);
    v8 = [v5 requestProperties];
    v7->_urlBagType = (int64_t)[v8 URLBagType];
  }
  return v7;
}

- (NSString)clientIdentifier
{
  [(PurchaseManagerOperation *)self lock];
  id v3 = [(NSString *)self->_clientIdentifier copy];
  [(PurchaseManagerOperation *)self unlock];

  return (NSString *)v3;
}

- (NSString)clientIdentifierHeader
{
  [(PurchaseManagerOperation *)self lock];
  id v3 = [(NSString *)self->_clientIdentifierHeader copy];
  [(PurchaseManagerOperation *)self unlock];

  return (NSString *)v3;
}

- (SSPurchase)purchase
{
  return self->_purchase;
}

- (id)purchaseBlock
{
  [(PurchaseManagerOperation *)self lock];
  id v3 = [self->_purchaseBlock copy];
  [(PurchaseManagerOperation *)self unlock];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setClientIdentifier:(id)a3
{
  v6 = (NSString *)a3;
  [(PurchaseManagerOperation *)self lock];
  if (self->_clientIdentifier != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copy];
    clientIdentifier = self->_clientIdentifier;
    self->_clientIdentifier = v4;
  }
  [(PurchaseManagerOperation *)self unlock];
}

- (void)setClientIdentifierHeader:(id)a3
{
  v6 = (NSString *)a3;
  [(PurchaseManagerOperation *)self lock];
  if (self->_clientIdentifierHeader != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copy];
    clientIdentifierHeader = self->_clientIdentifierHeader;
    self->_clientIdentifierHeader = v4;
  }
  [(PurchaseManagerOperation *)self unlock];
}

- (void)setPurchaseBlock:(id)a3
{
  id v6 = a3;
  [(PurchaseManagerOperation *)self lock];
  if (self->_purchaseBlock != v6)
  {
    id v4 = [v6 copy];
    id purchaseBlock = self->_purchaseBlock;
    self->_id purchaseBlock = v4;
  }
  [(PurchaseManagerOperation *)self unlock];
}

- (void)setURLBagType:(int64_t)a3
{
  [(PurchaseManagerOperation *)self lock];
  self->_urlBagType = a3;

  [(PurchaseManagerOperation *)self unlock];
}

- (void)setUseRemoteAuthentication:(BOOL)a3
{
  [(PurchaseManagerOperation *)self lock];
  self->_useRemoteAuthentication = a3;

  [(PurchaseManagerOperation *)self unlock];
}

- (int64_t)URLBagType
{
  [(PurchaseManagerOperation *)self lock];
  int64_t urlBagType = self->_urlBagType;
  [(PurchaseManagerOperation *)self unlock];
  return urlBagType;
}

- (BOOL)useRemoteAuthentication
{
  [(PurchaseManagerOperation *)self lock];
  BOOL useRemoteAuthentication = self->_useRemoteAuthentication;
  [(PurchaseManagerOperation *)self unlock];
  return useRemoteAuthentication;
}

- (void)run
{
  v2 = self;
  if ([(PurchaseManagerOperation *)self _isDeviceCapableForPurchase])
  {
    [(PurchaseManagerOperation *)v2 _performSetup];
    id v3 = [(SSPurchase *)v2->_purchase gratisIdentifiers];
    id v4 = [v3 count];

    if (v4)
    {
      if ([(SSPurchase *)v2->_purchase isGratisSoftwareClaim])
      {
        +[AppStoreUtility claimAppsWithPurchase:v2->_purchase];
        unint64_t v5 = 0;
        uint64_t v6 = 0;
        v7 = 0;
        uint64_t v105 = 0;
        v8 = 0;
        v114 = 0;
        v115 = 0;
        goto LABEL_45;
      }
      v22 = [[GratisClaimOperation alloc] initWithPurchase:v2->_purchase];
      id v117 = 0;
      unint64_t v5 = (unint64_t)[(PurchaseManagerOperation *)v2 runSubOperation:v22 returningError:&v117];
      id v116 = v117;
      uint64_t v6 = [(GratisClaimOperation *)v22 authenticatedAccountDSID];
      v7 = [(GratisClaimOperation *)v22 rawOutput];
      v114 = [(GratisClaimOperation *)v22 URLResponse];
      v115 = 0;
      uint64_t v105 = 0;
      v19 = 0;
      goto LABEL_42;
    }
    v22 = [(PurchaseManagerOperation *)v2 _newPurchaseOperationWithPurchase:v2->_purchase];
    id v118 = 0;
    unint64_t v5 = (unint64_t)[(PurchaseManagerOperation *)v2 runSubOperation:v22 returningError:&v118];
    id v116 = v118;
    v23 = [(GratisClaimOperation *)v22 shim];

    if (v23)
    {
      v24 = [(GratisClaimOperation *)v22 shim];
      uint64_t v6 = [v24 authenticatedAccountDSID];

      v25 = [(GratisClaimOperation *)v22 shim];
      v7 = [v25 rawOutput];

      v26 = [(GratisClaimOperation *)v22 shim];
      uint64_t v105 = [v26 requestPerformanceMetrics];

      v27 = [(GratisClaimOperation *)v22 shim];
      v19 = [v27 storeCorrelationID];

      v28 = [(GratisClaimOperation *)v22 shim];
      v115 = [v28 tidHeaders];

      v29 = [(GratisClaimOperation *)v22 shim];
      v114 = [v29 URLResponse];
    }
    else
    {
      uint64_t v6 = [(GratisClaimOperation *)v22 authenticatedAccountDSID];
      v7 = [(GratisClaimOperation *)v22 rawOutput];
      uint64_t v105 = [(GratisClaimOperation *)v22 requestPerformanceMetrics];
      v19 = [(GratisClaimOperation *)v22 storeCorrelationID];
      v115 = [(GratisClaimOperation *)v22 tidHeaders];
      v114 = [(GratisClaimOperation *)v22 URLResponse];
    }
    if (![(GratisClaimOperation *)v22 isMoveToiOS])
    {
LABEL_42:

      v39 = [v7 objectForKey:@"cancel-purchase-batch"];
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        unsigned int v108 = 0;
LABEL_48:

        if (v6) {
          goto LABEL_52;
        }
        goto LABEL_49;
      }
      unsigned int v40 = [v39 BOOLValue];

      if (!v40)
      {
        unsigned int v108 = 0;
        if (v6) {
          goto LABEL_52;
        }
LABEL_49:
        uint64_t v6 = -[SSPurchase valueForDownloadProperty:](v2->_purchase, "valueForDownloadProperty:", SSDownloadPropertyStoreAccountIdentifier, v91);
        if (!v6)
        {
LABEL_53:
          v109 = (void *)v6;
          if (!v7)
          {
            v21 = 0;
            v20 = (void *)v105;
LABEL_85:
            -[PurchaseManagerOperation _performTeardownWithResult:queueResponse:](v2, "_performTeardownWithResult:queueResponse:", v5, v21, v91);
            goto LABEL_86;
          }
          v42 = [(SSPurchase *)v2->_purchase valueForDownloadProperty:SSDownloadPropertyPreferredAssetFlavor];
          v21 = [[StoreDownloadQueueResponse alloc] initWithDictionary:v7 userIdentifier:v6 preferredAssetFlavor:v42];
          if ([v19 length]) {
            [(StoreDownloadQueueResponse *)v21 setStoreCorrelationID:v19];
          }
          v43 = [v7 objectForKey:@"jingleAction"];
          objc_opt_class();
          v20 = (void *)v105;
          if ((objc_opt_isKindOfClass() & 1) != 0
            && [v43 isEqualToString:@"inAppBuy"])
          {
            v44 = v21;
            v45 = [[MicroPaymentQueueResponse alloc] initWithRequestType:0];
            if ([(MicroPaymentQueueResponse *)v45 loadFromPropertyList:v7])
            {
              +[MicroPaymentQueue paymentQueue];
              v98 = v43;
              v46 = v2;
              v47 = v19;
              v49 = v48 = v42;
              [v49 updateWithPurchaseResponse:v45];

              v42 = v48;
              v19 = v47;
              v2 = v46;
              v43 = v98;
            }

            v21 = v44;
          }
          v112 = v7;
          v50 = [v7 objectForKeyedSubscript:@"ad-network"];
          v51 = v50;
          if (!v50)
          {
LABEL_84:

            v7 = v112;
            goto LABEL_85;
          }
          v99 = v43;
          v100 = v21;
          v52 = [v50 objectForKeyedSubscript:@"error"];

          unsigned int v103 = v5;
          if (v52)
          {
            v53 = +[SSLogConfig sharedDaemonConfig];
            if (!v53)
            {
              v53 = +[SSLogConfig sharedConfig];
            }
            unsigned int v54 = [v53 shouldLog];
            if ([v53 shouldLogToDisk]) {
              int v55 = v54 | 2;
            }
            else {
              int v55 = v54;
            }
            v56 = [v53 OSLogObject];
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
              int v57 = v55;
            }
            else {
              int v57 = v55 & 2;
            }
            if (!v57)
            {
              unint64_t v5 = v103;
              v21 = v100;
LABEL_82:

              goto LABEL_83;
            }
            v97 = v42;
            v106 = v19;
            v58 = objc_opt_class();
            id v59 = v58;
            v60 = [v51 objectForKeyedSubscript:@"error"];
            int v119 = 138543618;
            v120 = v58;
            __int16 v121 = 2112;
            v122 = v60;
            LODWORD(v92) = 22;
            v91 = &v119;
            v61 = (void *)_os_log_send_and_compose_impl();

            if (!v61)
            {
              unint64_t v5 = v103;
              v19 = v106;
              v21 = v100;
              v42 = v97;
LABEL_83:

              v43 = v99;
              goto LABEL_84;
            }
            v56 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v61, 4, &v119, v92);
            free(v61);
            v91 = (int *)v56;
            SSFileLog();
          }
          else
          {
            v106 = v19;
            v53 = [v51 objectForKeyedSubscript:@"ad-network-id"];
            v56 = [v51 objectForKeyedSubscript:@"adam-id"];
            v95 = [v51 objectForKeyedSubscript:@"campaign-id"];
            v62 = [v51 objectForKeyedSubscript:@"transaction-id"];
            v96 = [v51 objectForKeyedSubscript:@"signature"];
            uint64_t v63 = [v51 objectForKeyedSubscript:@"url"];
            v97 = v42;
            v93 = (void *)v63;
            if (v63)
            {
              v94 = +[NSURL URLWithString:v63];
            }
            else
            {
              v94 = 0;
            }
            v64 = +[NSDate date];
            [v64 timeIntervalSince1970];
            uint64_t v66 = (uint64_t)(v65 * 1000.0);

            v67 = [InstallAttributionPingback alloc];
            v68 = +[NSNumber numberWithLongLong:v66];
            v69 = [(InstallAttributionPingback *)v67 initWithAppAdamId:v56 transactionId:v62 campaignId:v95 adNetworkId:v53 attributionSignature:v96 pingbackUrl:v94 retryCount:0 localTimestamp:v68];

            v70 = +[PurchaseActionsManager sharedInstance];
            [v70 insertInstallAttributionPingback:v69];

            v71 = +[PurchaseActionsManager sharedInstance];
            [v71 removeInstallAttributionParamsForApp:v56];
          }
          unint64_t v5 = v103;
          v19 = v106;
          v21 = v100;
          v42 = v97;
          goto LABEL_82;
        }
LABEL_52:
        -[PurchaseManagerOperation _updateAccount:withPurchaseResponse:](v2, "_updateAccount:withPurchaseResponse:", v6, v7, v91);
        goto LABEL_53;
      }
LABEL_44:
      v8 = v19;
      if (v116)
      {
LABEL_46:
        unsigned int v108 = 1;
        v39 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1, v91);
        uint64_t v41 = SSErrorBySettingUserInfoValue();

        id v116 = (id)v41;
        v19 = v8;
        goto LABEL_48;
      }
LABEL_45:
      SSError();
      id v116 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    }
    v111 = v7;
    unsigned int v102 = v5;
    v30 = +[SSLogConfig sharedDaemonConfig];
    if (!v30)
    {
      v30 = +[SSLogConfig sharedConfig];
    }
    unsigned int v31 = [v30 shouldLog];
    if ([v30 shouldLogToDisk]) {
      int v32 = v31 | 2;
    }
    else {
      int v32 = v31;
    }
    v33 = [v30 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
      int v34 = v32;
    }
    else {
      int v34 = v32 & 2;
    }
    if (v34)
    {
      uint64_t v35 = v6;
      v36 = objc_opt_class();
      id v110 = v36;
      AMSLogableError();
      v37 = (SSPurchase *)objc_claimAutoreleasedReturnValue();
      int v119 = 138412546;
      v120 = v36;
      uint64_t v6 = v35;
      __int16 v121 = 2112;
      v122 = v37;
      LODWORD(v92) = 22;
      v91 = &v119;
      v38 = (void *)_os_log_send_and_compose_impl();

      unint64_t v5 = v102;
      if (!v38) {
        goto LABEL_37;
      }
      v33 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v119, v92);
      free(v38);
      v91 = (int *)v33;
      SSFileLog();
    }
    else
    {
      unint64_t v5 = v102;
    }

LABEL_37:
    if ((objc_msgSend(v116, "ams_hasDomain:code:", ISErrorDomain, 16) & 1) != 0
      || (objc_msgSend(v116, "ams_hasDomain:code:", SSErrorDomain, 140) & 1) != 0
      || (objc_msgSend(v116, "ams_hasDomain:code:", AMSErrorDomain, 6) & 1) != 0)
    {

      v7 = v111;
      goto LABEL_44;
    }
    v7 = v111;
    goto LABEL_42;
  }
  v9 = +[SSLogConfig sharedDaemonConfig];
  if (!v9)
  {
    v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    v11 &= 2u;
  }
  if (!v11) {
    goto LABEL_15;
  }
  v13 = objc_opt_class();
  purchase = v2->_purchase;
  int v119 = 138412546;
  v120 = v13;
  __int16 v121 = 2112;
  v122 = purchase;
  id v15 = v13;
  LODWORD(v92) = 22;
  v91 = &v119;
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v119, v92);
    free(v16);
    v91 = (int *)v12;
    SSFileLog();
LABEL_15:
  }
  id v116 = [(PurchaseManagerOperation *)v2 _incompatibleErrorWithPurchase:v2->_purchase];
  v17 = [(SSPurchase *)v2->_purchase valueForDownloadProperty:SSDownloadPropertyShouldSuppressErrorDialogs];
  unsigned __int8 v18 = [v17 BOOLValue];

  if ((v18 & 1) == 0) {
    [(PurchaseManagerOperation *)v2 _showDialogForPurchase:v2->_purchase error:v116];
  }
  v114 = 0;
  v115 = 0;
  v19 = 0;
  unsigned int v108 = 0;
  v20 = 0;
  v7 = 0;
  v21 = 0;
  v109 = 0;
  unint64_t v5 = 0;
LABEL_86:
  v72 = [(SSPurchase *)v2->_purchase enabledServiceType];
  v73 = v72;
  if (v5 && v72 && ![v72 integerValue])
  {
    v101 = v21;
    v74 = objc_alloc_init(SubscriptionOperation);
    [(SubscriptionOperation *)v74 setOperationType:1];
    [(SSPurchase *)v2->_purchase requestProperties];
    v75 = unsigned int v104 = v5;
    v76 = [v75 HTTPHeaders];
    v77 = [v76 objectForKey:SSHTTPHeaderUserAgent];
    [(SubscriptionOperation *)v74 setUserAgent:v77];

    unint64_t v5 = v104;
    [(PurchaseManagerOperation *)v2 runSubOperation:v74 returningError:0];

    v21 = v101;
  }
  v78 = [(PurchaseManagerOperation *)v2 purchaseBlock];
  if (v78)
  {
    v79 = v21;
    v113 = v7;
    id v80 = v116;
    if (v80) {
      char v81 = 1;
    }
    else {
      char v81 = v5;
    }
    if ((v81 & 1) == 0)
    {
      SSError();
      id v80 = (id)objc_claimAutoreleasedReturnValue();
    }
    v82 = objc_alloc_init(DaemonPurchaseResponse);
    [(DaemonPurchaseResponse *)v82 setCancelsPurchaseBatch:v108];
    [(DaemonPurchaseResponse *)v82 setDecodedResponse:v79];
    [(DaemonPurchaseResponse *)v82 setError:v80];
    [(DaemonPurchaseResponse *)v82 setPurchase:v2->_purchase];
    [(DaemonPurchaseResponse *)v82 setTidHeaders:v115];
    [(DaemonPurchaseResponse *)v82 setURLResponse:v114];
    if (v20)
    {
      [v20 startTime];
      double v84 = v83;
      +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      v107 = v19;
      v86 = unint64_t v85 = v5;
      [v86 timeIntervalSince1970];
      -[DaemonPurchaseResponse setRequestStartTime:](v82, "setRequestStartTime:");

      [v20 receivedResponseInterval];
      v88 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v84 + v87];
      [v88 timeIntervalSince1970];
      -[DaemonPurchaseResponse setResponseStartTime:](v82, "setResponseStartTime:");

      [v20 finishInterval];
      v90 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v84 + v89];
      [v90 timeIntervalSince1970];
      -[DaemonPurchaseResponse setResponseEndTime:](v82, "setResponseEndTime:");

      unint64_t v5 = v85;
      v19 = v107;
    }
    ((void (**)(void, DaemonPurchaseResponse *))v78)[2](v78, v82);

    v7 = v113;
    v21 = v79;
  }
  [(PurchaseManagerOperation *)v2 setError:v116];
  [(PurchaseManagerOperation *)v2 setSuccess:v5];
}

- (id)_appleIDForApp:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 appState];
  unsigned __int8 v7 = [v6 isValid];

  if ((v7 & 1) == 0)
  {
    v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9)
    {
      v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    unsigned __int8 v18 = [v9 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (v17)
    {
      int v29 = 138543618;
      id v30 = (id)objc_opt_class();
      __int16 v31 = 2114;
      id v32 = v5;
      id v19 = v30;
      LODWORD(v27) = 22;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_21:
        id v15 = 0;
        goto LABEL_39;
      }
      unsigned __int8 v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v29, v27);
      free(v20);
      SSFileLog();
    }

    goto LABEL_21;
  }
  v8 = [v5 bundleContainerURL];
  v9 = [v8 URLByAppendingPathComponent:@"iTunesMetadata.plist"];

  if (v9)
  {
    v28[0] = @"com.apple.iTunesStore.downloadInfo";
    v28[1] = @"accountInfo";
    v28[2] = @"AppleID";
    unsigned int v10 = +[NSArray arrayWithObjects:v28 count:3];
    int v11 = [v10 componentsJoinedByString:@":"];

    v12 = +[MappedPropertyList readKeyPath:v11 fromURL:v9 error:a4];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v15 = 0;
LABEL_37:

      goto LABEL_38;
    }
    v13 = [v12 objectForKey:@"com.apple.iTunesStore.downloadInfo"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v15 = 0;
      goto LABEL_36;
    }
    v14 = [v13 objectForKey:@"accountInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = [v14 objectForKey:@"AppleID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_9:

LABEL_36:
        goto LABEL_37;
      }
    }
    id v15 = 0;
    goto LABEL_9;
  }
  int v11 = +[SSLogConfig sharedDaemonConfig];
  if (!v11)
  {
    int v11 = +[SSLogConfig sharedConfig];
  }
  unsigned int v21 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v22 = v21 | 2;
  }
  else {
    int v22 = v21;
  }
  v23 = [v11 OSLogObject];
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    v22 &= 2u;
  }
  if (!v22) {
    goto LABEL_32;
  }
  int v29 = 138543618;
  id v30 = (id)objc_opt_class();
  __int16 v31 = 2114;
  id v32 = v5;
  id v24 = v30;
  LODWORD(v27) = 22;
  v25 = (void *)_os_log_send_and_compose_impl();

  if (v25)
  {
    v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v29, v27);
    free(v25);
    SSFileLog();
LABEL_32:
  }
  id v15 = 0;
LABEL_38:

LABEL_39:

  return v15;
}

- (id)_familyPurchaserAccountIdentifierForApplication:(id)a3
{
  id v3 = [a3 bundleIdentifier];
  if (v3)
  {
    id v4 = +[ApplicationWorkspace defaultWorkspace];
    id v5 = [v4 sinfPathForBundleID:v3];

    if (v5)
    {
      id v6 = [objc_alloc((Class)NSData) initWithContentsOfFile:v5];
      unsigned __int8 v7 = v6;
      if (v6)
      {
        uint64_t v14 = 0;
        sub_10002E284(v6, 4uLL, &v14);
        v8 = 0;
        if (v9) {
          BOOL v10 = 1;
        }
        else {
          BOOL v10 = v14 == 0;
        }
        if (!v10)
        {
          uint64_t v13 = 0;
          sub_10002E284(v7, 2uLL, &v13);
          v8 = 0;
          if (!v11)
          {
            if (v13)
            {
              v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
            }
          }
        }
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_incompatibleErrorWithPurchase:(id)a3
{
  id v3 = [a3 valueForDownloadProperty:SSDownloadPropertyTitle];
  id v4 = ISDeviceIncompatibleAppErrorWithAppTitle();

  return v4;
}

- (id)_installedSoftwareApplicationForPurchase:(id)a3
{
  id v3 = a3;
  id v4 = [v3 valueForDownloadProperty:SSDownloadPropertyStoreItemIdentifier];
  if (!v4
    || (+[LSApplicationProxy applicationProxyForItemID:v4], (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = [v3 valueForDownloadProperty:SSDownloadPropertyBundleIdentifier];
    if (v6)
    {
      id v5 = +[LSApplicationProxy applicationProxyForIdentifier:v6];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (BOOL)_isDeviceCapableForPurchase
{
  v2 = [(SSPurchase *)self->_purchase requiredDeviceCapabilities];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
    CFDictionaryRef v5 = (const __CFDictionary *)MobileInstallationCheckCapabilitiesMatch();
    if (v5)
    {
      CFDictionaryRef v6 = v5;
      CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v5, @"CapabilitiesMatch");
      if (Value) {
        BOOL v8 = CFBooleanGetValue(Value) != 0;
      }
      else {
        BOOL v8 = 0;
      }
      CFRelease(v6);
    }
    else
    {
      BOOL v8 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (id)_localRedownloadParametersForPurchase:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_10019BDAC;
  id v15 = sub_10019BDBC;
  id v16 = 0;
  id v4 = [v3 valueForDownloadProperty:SSDownloadPropertyStoreItemIdentifier];
  if (v4)
  {
    id v5 = +[SSAppPurchaseHistoryDatabase newDefaultInstance];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10019BDC4;
    v8[3] = &unk_1003A8D38;
    id v9 = v4;
    BOOL v10 = &v11;
    [v5 readUsingTransactionBlock:v8];
  }
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)_newPurchaseOperationWithPurchase:(id)a3
{
  id v4 = a3;
  id v5 = [[PurchaseOperation alloc] initWithPurchase:v4];

  [(PurchaseOperation *)v5 setBagType:[(PurchaseManagerOperation *)self URLBagType]];
  id v6 = [(PurchaseManagerOperation *)self clientIdentifier];
  [(PurchaseOperation *)v5 setClientIdentifier:v6];

  unsigned __int8 v7 = [(PurchaseManagerOperation *)self clientIdentifierHeader];
  [(PurchaseOperation *)v5 setClientIdentifierHeader:v7];

  [(PurchaseOperation *)v5 setOriginalProductOwnerAccountDSID:self->_applicationOwnerAccountDSID];
  [(PurchaseOperation *)v5 setShouldSendKeyBagSyncData:1];
  BOOL v8 = [(PurchaseManagerOperation *)self _urlBagKey];
  [(PurchaseOperation *)v5 setUrlBagKey:v8];

  if ([(PurchaseManagerOperation *)self useRemoteAuthentication])
  {
    [(PurchaseOperation *)v5 setUseRemoteAuthentication:1];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10019C1D0;
    v10[3] = &unk_1003A8D60;
    v10[4] = self;
    [(PurchaseOperation *)v5 setRemoteAuthenticationHandler:v10];
  }
  return v5;
}

- (void)_performSetup
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_alloc_init(RingtonePurchaseStore);
    purchase = self->_purchase;
    id v4 = +[NSArray arrayWithObjects:&purchase count:1];
    [(RingtonePurchaseStore *)v3 addRingtonesForPurchases:v4];
  }
  id v5 = [(SSPurchase *)self->_purchase valueForDownloadProperty:SSDownloadPropertyKind];
  if (v5)
  {
    id v6 = +[DownloadController controller];
    [v6 beginUsingNetworkForDownloadKind:v5];
  }
  if (SSDownloadKindIsSoftwareKind())
  {
    if (![(SSPurchase *)self->_purchase usesLocalRedownloadParametersIfPossible])
    {
      v88 = 0;
      goto LABEL_31;
    }
    v88 = [(PurchaseManagerOperation *)self _installedSoftwareApplicationForPurchase:self->_purchase];
    if (v88) {
      goto LABEL_31;
    }
    unsigned __int8 v7 = [(PurchaseManagerOperation *)self _personalizedRedownloadParametersForPurchase:self->_purchase];
    BOOL v8 = v7;
    if (v7)
    {
      id v86 = [v7 length];
    }
    else
    {
      BOOL v8 = [(PurchaseManagerOperation *)self _localRedownloadParametersForPurchase:self->_purchase];
      id v86 = [v8 length];
      if (!v8) {
        goto LABEL_31;
      }
    }
    id v9 = [(SSPurchase *)self->_purchase buyParameters];
    id v10 = +[NSURL copyDictionaryForQueryString:v9 unescapedValues:1];

    uint64_t v11 = 0;
    long long v97 = *(_OWORD *)off_1003A8D80;
    char v12 = 1;
    do
    {
      char v13 = v12;
      uint64_t v14 = [v10 objectForKey:*((void *)&v97 + v11)];
      id v15 = (void *)v14;
      if (v14)
      {
        uint64_t v16 = [v8 stringByAppendingFormat:@"&%@=%@", *((void *)&v97 + v11), v14];

        BOOL v8 = (void *)v16;
      }

      char v12 = 0;
      uint64_t v11 = 1;
    }
    while ((v13 & 1) != 0);
    int v17 = +[SSLogConfig sharedDaemonConfig];
    if (!v17)
    {
      int v17 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      v18 |= 2u;
    }
    id v19 = [v17 OSLogObject];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      v18 &= 2u;
    }
    if (v18)
    {
      *(_DWORD *)v93 = 138412546;
      *(void *)&v93[4] = objc_opt_class();
      *(_WORD *)&v93[12] = 2112;
      *(void *)&v93[14] = v8;
      id v20 = *(id *)&v93[4];
      LODWORD(v81) = 22;
      v79 = v93;
      unsigned int v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_26:

        if (v86) {
          [(SSPurchase *)self->_purchase setValue:&__kCFBooleanTrue forDownloadProperty:SSDownloadPropertyIsRedownload];
        }
        -[SSPurchase setBuyParameters:](self->_purchase, "setBuyParameters:", v8, v79);
        for (uint64_t i = 8; i != -8; i -= 8)

LABEL_31:
        v23 = [(SSPurchase *)self->_purchase accountIdentifier];
        if (v23) {
          goto LABEL_54;
        }
        if ([(SSPurchase *)self->_purchase skipSoftwareAccountPreflight])
        {
          v23 = 0;
          goto LABEL_54;
        }
        id v24 = v88;
        if (!v88)
        {
          id v24 = [(PurchaseManagerOperation *)self _installedSoftwareApplicationForPurchase:self->_purchase];
        }
        v88 = v24;
        if ([v24 hasMIDBasedSINF]) {
          goto LABEL_37;
        }
        applicationOwnerAccountDSID = [v88 purchaserDSID];
        if ([applicationOwnerAccountDSID unsignedLongLongValue] == (id)-1)
        {
          v23 = 0;
        }
        else
        {
          v26 = [v88 purchaserDSID];
          BOOL v27 = [v26 unsignedLongLongValue] == 0;

          if (v27)
          {
LABEL_37:
            v23 = 0;
            goto LABEL_43;
          }
          v23 = [v88 purchaserDSID];
          v28 = (NSNumber *)[v23 copy];
          applicationOwnerAccountDSID = self->_applicationOwnerAccountDSID;
          self->_applicationOwnerAccountDSID = v28;
        }

LABEL_43:
        int v29 = +[SSAccountStore defaultStore];
        id v30 = [v29 activeAccount];
        __int16 v31 = [v30 uniqueIdentifier];

        if (!v23)
        {
LABEL_53:

LABEL_54:
          v38 = [(SSPurchase *)self->_purchase ownerAccountDSID];

          if (v38)
          {
            v39 = [(SSPurchase *)self->_purchase ownerAccountDSID];
            unsigned int v40 = (NSNumber *)[v39 copy];
            uint64_t v41 = self->_applicationOwnerAccountDSID;
            self->_applicationOwnerAccountDSID = v40;
          }
          if (!v23)
          {
LABEL_83:
            v61 = [(SSPurchase *)self->_purchase downloadProperties];
            v62 = [v61 objectForKeyedSubscript:SSDownloadPropertyIsRedownload];
            BOOL v63 = [v62 integerValue] == 0;

            if (!v63)
            {
LABEL_97:

              goto LABEL_98;
            }
            dispatch_semaphore_t v64 = dispatch_semaphore_create(0);
            *(void *)v93 = 0;
            *(void *)&v93[8] = v93;
            *(void *)&v93[16] = 0x3032000000;
            v94 = sub_10019BDAC;
            v95 = sub_10019BDBC;
            double v65 = [(SSPurchase *)self->_purchase buyParameters];
            id v96 = [v65 copy];

            uint64_t v66 = +[PurchaseActionsManager sharedInstance];
            v67 = [(SSPurchase *)self->_purchase downloadProperties];
            v68 = [v67 objectForKeyedSubscript:SSDownloadPropertyStoreItemIdentifier];
            v89[0] = _NSConcreteStackBlock;
            v89[1] = 3221225472;
            v89[2] = sub_10019CF7C;
            v89[3] = &unk_1003A8D98;
            v89[4] = self;
            v91 = v93;
            v69 = v64;
            v90 = v69;
            [v66 getInstallAttributionParamsForApp:v68 completionHandler:v89];

            dispatch_time_t v70 = dispatch_time(0, 30000000000);
            if (!dispatch_semaphore_wait(v69, v70))
            {
LABEL_96:
              -[SSPurchase setBuyParameters:](self->_purchase, "setBuyParameters:", *(void *)(*(void *)&v93[8] + 40), v80);

              _Block_object_dispose(v93, 8);
              goto LABEL_97;
            }
            v71 = +[SSLogConfig sharedDaemonConfig];
            if (!v71)
            {
              v71 = +[SSLogConfig sharedConfig];
            }
            unsigned int v72 = [v71 shouldLog];
            unsigned int v73 = [v71 shouldLogToDisk];
            v74 = [v71 OSLogObject];
            v75 = v74;
            if (v73) {
              v72 |= 2u;
            }
            if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
              v72 &= 2u;
            }
            if (v72)
            {
              v76 = objc_opt_class();
              LODWORD(v97) = 138543362;
              *(void *)((char *)&v97 + 4) = v76;
              id v77 = v76;
              LODWORD(v81) = 12;
              id v80 = &v97;
              v78 = (void *)_os_log_send_and_compose_impl();

              if (!v78)
              {
LABEL_95:

                goto LABEL_96;
              }
              v75 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v78, 4, &v97, v81);
              free(v78);
              id v80 = (long long *)v75;
              SSFileLog();
            }

            goto LABEL_95;
          }
          double v87 = +[SSAccountStore defaultStore];
          v42 = [v87 accountWithUniqueIdentifier:v23];
          if (v42)
          {
LABEL_82:

            goto LABEL_83;
          }
          id v92 = 0;
          double v84 = [(PurchaseManagerOperation *)self _appleIDForApp:v88 error:&v92];
          double v83 = (uint64_t (*)(uint64_t, uint64_t))v92;
          if (!v84)
          {
            v53 = +[SSLogConfig sharedAccountsConfig];
            if (!v53)
            {
              v53 = +[SSLogConfig sharedConfig];
            }
            id v85 = v53;
            unsigned int v54 = [v53 shouldLog];
            if ([v85 shouldLogToDisk]) {
              v54 |= 2u;
            }
            int v55 = [v85 OSLogObject];
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT)) {
              int v56 = v54;
            }
            else {
              int v56 = v54 & 2;
            }
            if (v56)
            {
              int v57 = objc_opt_class();
              id v58 = v57;
              id v59 = [v88 bundleIdentifier];
              *(_DWORD *)v93 = 138543874;
              *(void *)&v93[4] = v57;
              *(_WORD *)&v93[12] = 2114;
              *(void *)&v93[14] = v59;
              *(_WORD *)&v93[22] = 2114;
              v94 = v83;
              LODWORD(v81) = 32;
              v79 = v93;
              v60 = (void *)_os_log_send_and_compose_impl();

              if (!v60) {
                goto LABEL_81;
              }
              int v55 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v60, 4, v93, v81);
              free(v60);
              v79 = v55;
              SSFileLog();
            }

            goto LABEL_81;
          }
          id v85 = objc_alloc_init((Class)SSAccount);
          [v85 setAccountName:v84];
          v43 = [v87 activeAccount];
          [v85 setActive:v43 == 0];

          v44 = [v88 storeFront];
          v45 = [v44 stringValue];
          [v85 setStoreFrontIdentifier:v45];

          [v85 setUniqueIdentifier:v23];
          v46 = +[SSLogConfig sharedAccountsConfig];
          if (!v46)
          {
            v46 = +[SSLogConfig sharedConfig];
          }
          unsigned int v47 = [v46 shouldLog];
          if ([v46 shouldLogToDisk]) {
            v47 |= 2u;
          }
          v48 = [v46 OSLogObject];
          if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
            v47 &= 2u;
          }
          if (v47)
          {
            v49 = objc_opt_class();
            id v82 = v49;
            v50 = [v85 accountName];
            v51 = SSHashIfNeeded();
            *(_DWORD *)v93 = 138543618;
            *(void *)&v93[4] = v49;
            *(_WORD *)&v93[12] = 2114;
            *(void *)&v93[14] = v51;
            LODWORD(v81) = 22;
            v79 = v93;
            v52 = (void *)_os_log_send_and_compose_impl();

            if (!v52)
            {
LABEL_69:

              [v87 saveAccount:v85 verifyCredentials:0 completion:0];
LABEL_81:

              v42 = 0;
              goto LABEL_82;
            }
            v48 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v52, 4, v93, v81);
            free(v52);
            v79 = v48;
            SSFileLog();
          }

          goto LABEL_69;
        }
        if (([v23 isEqual:v31] & 1) == 0)
        {
          id v32 = [(PurchaseManagerOperation *)self _familyPurchaserAccountIdentifierForApplication:v88];
          if (v32)
          {
LABEL_46:
            v33 = [(SSPurchase *)self->_purchase buyParameters];
            int v34 = objc_msgSend(v33, "stringByAppendingFormat:", @"&ownerDsid=%llu", objc_msgSend(v32, "unsignedLongLongValue"));

            [(SSPurchase *)self->_purchase setBuyParameters:v34];
            v23 = 0;
            goto LABEL_53;
          }
          uint64_t v35 = objc_alloc_init(FamilyCircleOperation);
          if ([(PurchaseManagerOperation *)self runSubOperation:v35 returningError:0])
          {
            v36 = [(FamilyCircleOperation *)v35 familyCircle];
            v37 = [v36 allITunesIdentifiers];

            if ([v37 containsObject:v23])
            {
              id v32 = v23;

              goto LABEL_46;
            }
          }
        }
        [(SSPurchase *)self->_purchase setAccountIdentifier:v23];
        goto LABEL_53;
      }
      id v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, v93, v81);
      free(v21);
      v79 = v19;
      SSFileLog();
    }

    goto LABEL_26;
  }
LABEL_98:
}

- (void)_performTeardownWithResult:(BOOL)a3 queueResponse:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v7 = objc_alloc_init(RingtonePurchaseStore);
    if (a3)
    {
      purchase = self->_purchase;
      BOOL v8 = +[NSArray arrayWithObjects:&purchase count:1];
      id v9 = [v6 downloads];
      [(RingtonePurchaseStore *)v7 updateRingtonesForPurchases:v8 withDownloads:v9];
    }
    else
    {
      char v13 = self->_purchase;
      BOOL v8 = +[NSArray arrayWithObjects:&v13 count:1];
      [(RingtonePurchaseStore *)v7 removeRingtonesForPurchases:v8];
    }
  }
  id v10 = [(SSPurchase *)self->_purchase valueForDownloadProperty:SSDownloadPropertyKind];
  if (v10)
  {
    uint64_t v11 = +[DownloadController controller];
    [v11 endUsingNetworkForDownloadKind:v10];
  }
}

- (id)_personalizedRedownloadParametersForPurchase:(id)a3
{
  id v4 = [a3 valueForDownloadProperty:SSDownloadPropertyStoreItemIdentifier];
  id v5 = [v4 stringValue];

  if (v5)
  {
    id v6 = objc_alloc_init((Class)SSLookupProperties);
    [v6 setKeyProfile:@"offer"];
    [v6 setTimeoutInterval:&off_1003C9FC0];
    [v6 setValue:@"itunesstored" forRequestParameter:SSLookupParameterCaller];
    [v6 setValue:v5 forRequestParameter:SSLookupParameterItemIdentifiers];
    [v6 setValue:@"1" forRequestParameter:SSLookupParameterProtocolVersion];
    unsigned __int8 v7 = [[LookupRequestOperation alloc] initWithLookupProperties:v6];
    [(LookupRequestOperation *)v7 setPersonalizationStyle:0];
    id v8 = 0;
    if ([(PurchaseManagerOperation *)self runSubOperation:v7 returningError:0])
    {
      id v9 = [(LookupRequestOperation *)v7 lookupResponse];
      id v10 = [v9 itemForKey:v5];

      [v10 offers];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        id v13 = v12;
        unsigned int v21 = v10;
        int v22 = v5;
        uint64_t v14 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            int v17 = objc_msgSend(v16, "offerType", v21, v22, (void)v23);
            unsigned int v18 = [v17 isEqualToString:@"redownload"];

            if (v18)
            {
              id v19 = [v16 buyParameters];
              id v8 = [v19 copy];

              goto LABEL_14;
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v13) {
            continue;
          }
          break;
        }
        id v8 = 0;
LABEL_14:
        id v10 = v21;
        id v5 = v22;
      }
      else
      {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_showDialogForPurchase:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v10 = [objc_alloc((Class)ISDialog) initWithError:v5];

  unsigned __int8 v7 = [[DaemonDialogOperation alloc] initWithDialog:v10];
  id v8 = [v6 displaysOnLockScreen];

  [(DaemonDialogOperation *)v7 setDisplaysOnLockscreen:v8];
  id v9 = +[ISOperationQueue mainQueue];
  [v9 addOperation:v7];
}

- (void)_updateAccount:(id)a3 withPurchaseResponse:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned __int8 v7 = +[SSAccountStore defaultStore];
  id v8 = [v7 accountWithUniqueIdentifier:v6];

  id v9 = [v8 copy];
  if (!v9) {
    goto LABEL_22;
  }
  id v10 = [v5 objectForKey:@"newCustomer"];
  if (!v10)
  {
    id v11 = 0;
    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector())
  {
    id v11 = [v10 BOOLValue];
LABEL_6:
    [v9 setNewCustomer:v11];
  }
  id v30 = v5;
  id v12 = [v5 valueForKey:@"passwordSettings"];
  id v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 valueForKey:@"free"];
    id v15 = [v13 valueForKey:@"paid"];
    int64_t v16 = +[UpdateAccountPasswordSettingsOperation _accountPasswordSettingValueForServerValue:v14];
    int64_t v17 = +[UpdateAccountPasswordSettingsOperation _accountPasswordSettingValueForServerValue:v15];
    [v9 setFreeDownloadsPasswordSetting:v16];
    [v9 setPaidPurchasesPasswordSetting:v17];
  }
  unsigned int v18 = +[SSLogConfig sharedAccountsConfig];
  if (!v18)
  {
    unsigned int v18 = +[SSLogConfig sharedConfig];
  }
  unsigned int v19 = [v18 shouldLog];
  if ([v18 shouldLogToDisk]) {
    int v20 = v19 | 2;
  }
  else {
    int v20 = v19;
  }
  unsigned int v21 = [v18 OSLogObject];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
    int v22 = v20;
  }
  else {
    int v22 = v20 & 2;
  }
  if (v22)
  {
    long long v23 = objc_opt_class();
    id v29 = v23;
    [v9 accountName];
    v25 = long long v24 = v10;
    SSHashIfNeeded();
    int v31 = 138543618;
    id v32 = v23;
    __int16 v33 = 2114;
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = 22;
    long long v26 = (void *)_os_log_send_and_compose_impl();

    id v10 = v24;
    if (v26)
    {
      BOOL v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v31, v28);
      free(v26);
      SSFileLog();
    }
  }
  else
  {
  }
  [v7 saveAccount:v9 verifyCredentials:0 completion:0];

  id v5 = v30;
LABEL_22:
}

- (id)_urlBagKey
{
  id v3 = [(SSPurchase *)self->_purchase valueForDownloadProperty:SSDownloadPropertyStorePreorderIdentifier];
  uint64_t v4 = SSGetItemIdentifierFromValue();

  if (v4)
  {
    id v5 = @"p2-order-pre-order";
  }
  else
  {
    id v6 = [(SSPurchase *)self->_purchase requestProperties];
    id v5 = [v6 URLBagKey];
  }

  return v5;
}

- (id)remoteAuthenticationHandler
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setRemoteAuthenticationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteAuthenticationHandler, 0);
  objc_storeStrong(&self->_purchaseBlock, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_clientIdentifierHeader, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_storeStrong((id *)&self->_applicationOwnerAccountDSID, 0);
}

@end