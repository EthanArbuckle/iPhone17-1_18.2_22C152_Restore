@interface SUAskPermissionRequestExtension
- (void)checkDownloadQueue;
- (void)requestUpdatedWithResult:(id)a3 completion:(id)a4;
@end

@implementation SUAskPermissionRequestExtension

- (void)checkDownloadQueue
{
  v2 = +[SSLogConfig sharedConfig];
  unsigned int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_9;
  }
  int v15 = 138543362;
  uint64_t v16 = objc_opt_class();
  LODWORD(v12) = 12;
  v6 = (void *)_os_log_send_and_compose_impl();

  if (v6)
  {
    v5 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v6, 4, &v15, v12);
    free(v6);
    SSFileLog();
LABEL_9:
  }
  id v7 = objc_alloc_init((Class)SSDownloadManagerOptions);
  v8 = +[SSDownloadManager allStoreDownloadKinds];
  [v7 setDownloadKinds:v8];

  uint64_t v14 = SSDownloadExternalPropertyPercentComplete;
  v9 = +[NSArray arrayWithObjects:&v14 count:1];
  [v7 setPrefetchedDownloadExternalProperties:v9];

  v13[0] = SSDownloadPropertyStoreItemIdentifier;
  v13[1] = SSDownloadPropertyDownloadPhase;
  v13[2] = SSDownloadPropertyIsHighDefinition;
  v13[3] = SSDownloadPropertyIsRental;
  v13[4] = SSDownloadPropertyIsSample;
  v10 = +[NSArray arrayWithObjects:v13 count:5];
  [v7 setPrefetchedDownloadProperties:v10];

  id v11 = [objc_alloc((Class)SSDownloadManager) initWithManagerOptions:v7];
  [v11 reloadFromServer];
}

- (void)requestUpdatedWithResult:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(void))a4;
  id v7 = +[SSLogConfig sharedConfig];
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
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v11 = objc_opt_class();
  [v5 compile];
  int v20 = 138543618;
  uint64_t v21 = v11;
  __int16 v22 = 2114;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 22;
  uint64_t v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v20, v18);
    free(v12);
    SSFileLog();
LABEL_9:
  }
  v13 = [v5 buyParams];
  uint64_t v14 = +[SSPurchase purchaseWithBuyParameters:v13];

  [v14 setCreatesDownloads:1];
  id v15 = objc_alloc((Class)SSPurchaseRequest);
  v19 = v14;
  uint64_t v16 = +[NSArray arrayWithObjects:&v19 count:1];
  id v17 = [v15 initWithPurchases:v16];

  [v17 start];
  v6[2](v6);
}

@end