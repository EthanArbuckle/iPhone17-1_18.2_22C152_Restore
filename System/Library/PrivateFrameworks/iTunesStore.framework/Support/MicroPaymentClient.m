@interface MicroPaymentClient
+ (id)entityForContext:(id)a3;
- (id)mergeResponse:(id)a3 withOptions:(int64_t)a4;
- (id)replacePayment:(id)a3 withPurchaseResponse:(id)a4;
- (void)setValuesWithClientIdentity:(id)a3;
@end

@implementation MicroPaymentClient

+ (id)entityForContext:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName");

  return [v3 objectForKey:@"MicroPaymentClient"];
}

- (id)mergeResponse:(id)a3 withOptions:(int64_t)a4
{
  char v4 = a4;
  id v6 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v50 = objc_alloc_init((Class)NSMutableArray);
  if (v4)
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    id v7 = objc_alloc_init((Class)NSMutableArray);
  }
  else
  {
    id v7 = 0;
    id v8 = 0;
  }
  id v58 = v7;
  if ((v4 & 2) != 0) {
    id v61 = objc_alloc_init((Class)NSMutableSet);
  }
  else {
    id v61 = 0;
  }
  v53 = v8;
  id v9 = [(MicroPaymentClient *)self payments];
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v57 = objc_alloc_init((Class)NSMutableDictionary);
  id v60 = objc_alloc_init((Class)NSMutableDictionary);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v11 = [v9 countByEnumeratingWithState:&v78 objects:v86 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v79;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v79 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        id v16 = [v15 transactionIdentifier];
        if (v16) {
          [v60 setObject:v15 forKey:v16];
        }
        else {
          [v10 addObject:v15];
        }
        if (objc_msgSend(objc_msgSend(v15, "supportsDeferredPayment"), "BOOLValue"))
        {
          id v17 = [v15 productIdentifier];
          if (v17) {
            [v57 setObject:v15 forKey:v17];
          }
        }
        [v61 addObject:v15];
      }
      id v12 = [v9 countByEnumeratingWithState:&v78 objects:v86 count:16];
    }
    while (v12);
  }
  id v55 = [(MicroPaymentClient *)self managedObjectContext];
  id v52 = +[MicroPayment paymentEntityFromContext:](MicroPayment, "paymentEntityFromContext:");
  id v51 = [a3 requestType];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = [a3 payments];
  id v18 = [obj countByEnumeratingWithState:&v74 objects:v85 count:16];
  v19 = v58;
  if (v18)
  {
    id v20 = v18;
    uint64_t v59 = *(void *)v75;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v75 != v59) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v74 + 1) + 8 * (void)j);
        id v23 = [v22 objectForKey:@"transaction-id"];
        if (v23)
        {
          id v24 = [v60 objectForKey:v23];
          if (v24) {
            goto LABEL_39;
          }
        }
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v25 = [v10 countByEnumeratingWithState:&v70 objects:v84 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v71;
LABEL_29:
          uint64_t v28 = 0;
          while (1)
          {
            if (*(void *)v71 != v27) {
              objc_enumerationMutation(v10);
            }
            id v24 = *(id *)(*((void *)&v70 + 1) + 8 * v28);
            if ([v24 isEqualToResponse:v22 compareAllFields:1]) {
              break;
            }
            if (v26 == (id)++v28)
            {
              id v26 = [v10 countByEnumeratingWithState:&v70 objects:v84 count:16];
              v19 = v58;
              if (v26) {
                goto LABEL_29;
              }
              goto LABEL_37;
            }
          }
          v19 = v58;
          if (v24) {
            goto LABEL_39;
          }
        }
LABEL_37:
        id v29 = [v22 objectForKey:@"item-id"];
        if (v29 && (id v24 = [v57 objectForKey:v29], objc_msgSend(v24, "setState:", &off_1003C8FA0), v24))
        {
LABEL_39:
          [v24 mergeValuesFromResponse:v22];
          [v61 removeObject:v24];
          [v19 addObject:v24];
        }
        else
        {
          v30 = [[MicroPayment alloc] initWithEntity:v52 insertIntoManagedObjectContext:v55];
          [(MicroPayment *)v30 mergeValuesFromResponse:v22];
          [(MicroPayment *)v30 setClient:self];
          if (v51 == (id)1)
          {
            uint64_t v31 = 6;
          }
          else if ([(MicroPayment *)v30 originalTransactionIdentifier])
          {
            uint64_t v31 = 7;
          }
          else
          {
            uint64_t v31 = 2;
          }
          [(MicroPayment *)v30 setState:+[NSNumber numberWithInteger:v31]];
          id v32 = [(MicroPayment *)v30 transactionIdentifier];
          if (v32) {
            [v60 setObject:v30 forKey:v32];
          }
          else {
            [v10 addObject:v30];
          }
          [v53 addObject:v30];
          [v19 addObject:v30];
        }
      }
      id v20 = [obj countByEnumeratingWithState:&v74 objects:v85 count:16];
    }
    while (v20);
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v33 = [v61 countByEnumeratingWithState:&v66 objects:v83 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v67;
    do
    {
      for (k = 0; k != v34; k = (char *)k + 1)
      {
        if (*(void *)v67 != v35) {
          objc_enumerationMutation(v61);
        }
        v37 = *(void **)(*((void *)&v66 + 1) + 8 * (void)k);
        id v38 = objc_msgSend(objc_msgSend(v37, "state"), "integerValue");
        BOOL v39 = v38 == (id)5 || v38 == (id)8;
        if (!v39 && [v37 transactionIdentifier])
        {
          id v40 = [v37 downloads];
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id v41 = [v40 countByEnumeratingWithState:&v62 objects:v82 count:16];
          if (v41)
          {
            id v42 = v41;
            uint64_t v43 = *(void *)v63;
            do
            {
              for (m = 0; m != v42; m = (char *)m + 1)
              {
                if (*(void *)v63 != v43) {
                  objc_enumerationMutation(v40);
                }
                id v45 = [*(id *)(*((void *)&v62 + 1) + 8 * (void)m) downloadID];
                if (v45) {
                  [v6 addObject:v45];
                }
              }
              id v42 = [v40 countByEnumeratingWithState:&v62 objects:v82 count:16];
            }
            while (v42);
          }
          [v50 addObject:v37];
          [v55 deleteObject:v37];
          v19 = v58;
        }
      }
      id v34 = [v61 countByEnumeratingWithState:&v66 objects:v83 count:16];
    }
    while (v34);
  }
  if (sub_10004BBA0(v55))
  {
    v46 = objc_alloc_init(MicroPaymentClientMergeResults);
    v47 = v53;
    [(MicroPaymentClientMergeResults *)v46 setAddedPayments:v53];
    [(MicroPaymentClientMergeResults *)v46 setChangedPayments:v19];
    [(MicroPaymentClientMergeResults *)v46 setRemovedDownloadIDs:v6];
    v48 = v50;
    [(MicroPaymentClientMergeResults *)v46 setRemovedPayments:v50];
  }
  else
  {
    [v55 rollback];
    v46 = 0;
    v48 = v50;
    v47 = v53;
  }

  return v46;
}

- (id)replacePayment:(id)a3 withPurchaseResponse:(id)a4
{
  id v36 = objc_alloc_init((Class)NSMutableArray);
  id v35 = objc_alloc_init((Class)NSMutableArray);
  id v34 = [(MicroPaymentClient *)self managedObjectContext];
  id v33 = +[MicroPayment paymentEntityFromContext:](MicroPayment, "paymentEntityFromContext:");
  id v7 = [a4 payments];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v38;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        if (objc_msgSend(a3, "isEqualToResponse:compareAllFields:", v12, 0, v31, v32))
        {
          [a3 mergeValuesFromResponse:v12];
          objc_msgSend(a3, "setState:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 2));
          [v35 addObject:a3];
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
          if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_INFO)) {
            v15 &= 2u;
          }
          if (v15) {
            goto LABEL_24;
          }
        }
        else
        {
          id v16 = [[MicroPayment alloc] initWithEntity:v33 insertIntoManagedObjectContext:v34];
          [(MicroPayment *)v16 mergeValuesFromResponse:v12];
          [(MicroPayment *)v16 setClient:self];
          [(MicroPayment *)v16 setState:+[NSNumber numberWithInteger:2]];
          [v36 addObject:v16];

          id v17 = +[SSLogConfig sharedDaemonConfig];
          if (!v17) {
            id v17 = +[SSLogConfig sharedConfig];
          }
          unsigned int v18 = [v17 shouldLog];
          if ([v17 shouldLogToDisk]) {
            int v19 = v18 | 2;
          }
          else {
            int v19 = v18;
          }
          if (!os_log_type_enabled((os_log_t)[v17 OSLogObject], OS_LOG_TYPE_INFO)) {
            v19 &= 2u;
          }
          if (v19)
          {
LABEL_24:
            uint64_t v20 = objc_opt_class();
            int v41 = 138412290;
            uint64_t v42 = v20;
            LODWORD(v32) = 12;
            uint64_t v31 = &v41;
            v21 = (void *)_os_log_send_and_compose_impl();
            if (v21)
            {
              v22 = +[NSString stringWithCString:v21 encoding:4];
              free(v21);
              uint64_t v31 = (int *)v22;
              SSFileLog();
            }
            continue;
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v9);
  }
  if (a3 && ![v35 count])
  {
    id v23 = +[SSLogConfig sharedDaemonConfig];
    if (!v23) {
      id v23 = +[SSLogConfig sharedConfig];
    }
    unsigned int v24 = objc_msgSend(v23, "shouldLog", v31);
    if ([v23 shouldLogToDisk]) {
      v24 |= 2u;
    }
    if (!os_log_type_enabled((os_log_t)[v23 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v24 &= 2u;
    }
    if (v24)
    {
      uint64_t v25 = objc_opt_class();
      int v41 = 138412290;
      uint64_t v42 = v25;
      LODWORD(v32) = 12;
      uint64_t v26 = _os_log_send_and_compose_impl();
      if (v26)
      {
        uint64_t v27 = (void *)v26;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v41, v32);
        free(v27);
        SSFileLog();
      }
    }
    sub_100174DB0();
    [a3 setFailedWithError:ISErrorWithDomain()];
    [v35 addObject:a3];
  }
  if (sub_10004BBA0(v34))
  {
    uint64_t v28 = objc_alloc_init(MicroPaymentClientMergeResults);
    id v29 = v36;
    [(MicroPaymentClientMergeResults *)v28 setAddedPayments:v36];
    [(MicroPaymentClientMergeResults *)v28 setChangedPayments:v35];
  }
  else
  {
    [v34 rollback];
    uint64_t v28 = 0;
    id v29 = v36;
  }

  return v28;
}

- (void)setValuesWithClientIdentity:(id)a3
{
  -[MicroPaymentClient setBundleVersion:](self, "setBundleVersion:", [a3 bundleVersion]);
  -[MicroPaymentClient setIdentifier:](self, "setIdentifier:", [a3 bundleIdentifier]);
  -[MicroPaymentClient setStoreIdentifier:](self, "setStoreIdentifier:", [a3 storeIdentifier]);
  -[MicroPaymentClient setStoreVersion:](self, "setStoreVersion:", [a3 storeVersion]);
  -[MicroPaymentClient setVendorIdentifier:](self, "setVendorIdentifier:", [a3 vendorIdentifier]);
  -[MicroPaymentClient setSandboxed:](self, "setSandboxed:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 isSandboxed]));
  -[MicroPaymentClient setUsesIdentityAttributes:](self, "setUsesIdentityAttributes:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 usesIdentityAttributes]));
  -[MicroPaymentClient setAllowsBootstrapCellularData:](self, "setAllowsBootstrapCellularData:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 allowsBootstrapCellularData]));
  -[MicroPaymentClient setHidesConfirmationDialogs:](self, "setHidesConfirmationDialogs:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 hidesConfirmationDialogs]));
  -[MicroPaymentClient setIgnoresInAppPurchaseRestriction:](self, "setIgnoresInAppPurchaseRestriction:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 ignoresInAppPurchaseRestriction]));
  -[MicroPaymentClient setReceiptDirectoryPath:](self, "setReceiptDirectoryPath:", [a3 receiptDirectoryPath]);
  v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 requiresAuthenticationForPayment]);

  [(MicroPaymentClient *)self setRequiresAuthenticationForPayment:v5];
}

@end