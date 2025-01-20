@interface AppStoreUtility
+ (id)_newManifestWithManifestType:(int64_t)a3;
+ (id)_newRequestWithManifest:(id)a3;
+ (void)_addDownloads:(id)a3 toManifest:(id)a4 forClientID:(id)a5;
+ (void)_checkClaimsForAccountID:(id)a3 claimStyle:(int64_t)a4 clientAuditTokenData:(id)a5 establishActiveAccounts:(BOOL)a6 ignoresPreviousClaimAttempts:(BOOL)a7 completionBlock:(id)a8;
+ (void)_sendSoftwareManifest:(id)a3 withReason:(id)a4;
+ (void)checkClaimsEstablishingActiveAccounts:(BOOL)a3 ignoringPreviousClaimAttempts:(BOOL)a4 completionBlock:(id)a5;
+ (void)checkDownloadQueue;
+ (void)checkFirstPartyClaimsWithAuditTokenData:(id)a3 completionBlock:(id)a4;
+ (void)checkFirstPartyClaimsWithCompletionBlock:(id)a3;
+ (void)claimAppsWithPurchase:(id)a3;
+ (void)hidePendingUpdatesBadge;
+ (void)installManagedAppWithRequest:(id)a3 completionBlock:(id)a4;
+ (void)postBulletinWithTitle:(id)a3 message:(id)a4 destinations:(unint64_t)a5 actionButtonTitle:(id)a6 actionButtonURL:(id)a7 launchURL:(id)a8 completionBlock:(id)a9;
+ (void)reloadUpdatesWithCompletionBlock:(id)a3;
+ (void)repairAppWithRequest:(id)a3 completionBlock:(id)a4;
+ (void)restoreDemotedAppsWithBundleIDs:(id)a3;
+ (void)sendActivitySubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4;
+ (void)sendAppStoreSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4;
+ (void)sendClusterMappings:(id)a3;
+ (void)sendNewsSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4;
+ (void)sendSoftwareDownloads:(id)a3 withReason:(id)a4;
+ (void)sendSoftwareDownloads:(id)a3 withReason:(id)a4 forClientID:(id)a5;
+ (void)sendSoftwareDownloads:(id)a3 withReason:(id)a4 forClientID:(id)a5 manifestType:(int64_t)a6;
+ (void)sendSoftwareDownloads:(id)a3 withReason:(id)a4 manifestType:(int64_t)a5;
@end

@implementation AppStoreUtility

+ (void)checkClaimsEstablishingActiveAccounts:(BOOL)a3 ignoringPreviousClaimAttempts:(BOOL)a4 completionBlock:(id)a5
{
}

+ (void)checkDownloadQueue
{
  v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  int v13 = 138543362;
  id v14 = (id)objc_opt_class();
  id v7 = v14;
  LODWORD(v11) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v13, v11);
    free(v8);
    SSFileLog();
LABEL_11:
  }
  id v9 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithReason:1];
  id v10 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithOptions:v9];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001A74B8;
  v12[3] = &unk_1003A8F00;
  v12[4] = a1;
  [v10 sendRequestCompletionBlock:v12];
}

+ (void)checkFirstPartyClaimsWithAuditTokenData:(id)a3 completionBlock:(id)a4
{
}

+ (void)checkFirstPartyClaimsWithCompletionBlock:(id)a3
{
}

+ (void)claimAppsWithPurchase:(id)a3
{
  id v4 = a3;
  int v5 = [v4 gratisIdentifiers];
  v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6)
  {
    v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  id v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
    v8 &= 2u;
  }
  if (!v8) {
    goto LABEL_11;
  }
  id v10 = objc_opt_class();
  id v11 = v10;
  [v5 componentsJoinedByString:@", "];
  int v22 = 138543618;
  v23 = v10;
  __int16 v24 = 2114;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = 22;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v22, v20);
    free(v12);
    SSFileLog();
LABEL_11:
  }
  id v13 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithBundleIdentifiers:v5];
  id v14 = [v4 accountIdentifier];
  [v13 setAccountID:v14];

  v15 = [v4 valueForDownloadProperty:SSDownloadPropertyShouldSuppressErrorDialogs];
  objc_msgSend(v13, "setSuppressErrorDialogs:", objc_msgSend(v15, "BOOLValue"));

  v16 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v4 uniqueIdentifier]);
  [v13 setPurchaseID:v16];

  v17 = [v4 requestProperties];

  v18 = [v17 HTTPHeaders];
  [v13 setHttpHeaders:v18];

  id v19 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithOptions:v13];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001A79C0;
  v21[3] = &unk_1003A8F20;
  v21[4] = a1;
  [v19 sendRequestWithCompletionBlock:v21];
}

+ (void)hidePendingUpdatesBadge
{
  v2 = +[SSLogConfig sharedDaemonConfig];
  if (!v2)
  {
    v2 = +[SSLogConfig sharedConfig];
  }
  unsigned int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  int v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  LODWORD(v10) = 138543362;
  *(void *)((char *)&v10 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v10 + 4);
  LODWORD(v9) = 12;
  unsigned int v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    int v5 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v7, 4, &v10, v9, v10);
    free(v7);
    SSFileLog();
LABEL_11:
  }
  id v8 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  [v8 hideApplicationBadgeForPendingUpdates];
}

+ (void)installManagedAppWithRequest:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = [v5 itemIdentifier];
  id v8 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v7 longLongValue]);

  uint64_t v9 = +[SSLogConfig sharedDaemonConfig];
  if (!v9)
  {
    uint64_t v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    v11 &= 2u;
  }
  if (!v11) {
    goto LABEL_11;
  }
  id v13 = objc_opt_class();
  id v14 = v13;
  [v5 externalVersionIdentifier];
  int v23 = 138543874;
  __int16 v24 = v13;
  __int16 v25 = 2112;
  v26 = v8;
  __int16 v27 = 2112;
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 32;
  v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v23, v22);
    free(v15);
    SSFileLog();
LABEL_11:
  }
  id v16 = objc_alloc((Class)ISWeakLinkedClassForString());
  v17 = [v5 externalVersionIdentifier];
  v18 = [v5 bundleIdentifier];
  id v19 = [v5 bundleVersion];
  id v20 = objc_msgSend(v16, "initWithItemIdentifer:externalVersionIdentifier:bundleIdentifier:bundleVersion:skipDownloads:", v8, v17, v18, v19, objc_msgSend(v5, "skipDownloads"));

  id v21 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithOptions:v20];
  [v21 sendRequestWithCompletionBlock:v6];
}

+ (void)postBulletinWithTitle:(id)a3 message:(id)a4 destinations:(unint64_t)a5 actionButtonTitle:(id)a6 actionButtonURL:(id)a7 launchURL:(id)a8 completionBlock:(id)a9
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = a4;
  id v19 = +[SSLogConfig sharedDaemonConfig];
  if (!v19)
  {
    id v19 = +[SSLogConfig sharedConfig];
  }
  unsigned int v20 = [v19 shouldLog];
  if ([v19 shouldLogToDisk]) {
    v20 |= 2u;
  }
  id v21 = [v19 OSLogObject];
  if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
    v20 &= 2u;
  }
  if (v20)
  {
    int v29 = 138543618;
    id v30 = (id)objc_opt_class();
    __int16 v31 = 2112;
    id v32 = v13;
    id v22 = v30;
    LODWORD(v27) = 22;
    int v23 = (void *)_os_log_send_and_compose_impl();

    if (v23)
    {
      __int16 v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v29, v27);
      free(v23);
      SSFileLog();
    }
  }
  else
  {
  }
  id v25 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  [v25 setTitle:v13];
  [v25 setMessage:v18];

  [v25 setDestinations:a5];
  if (v14) {
    [v25 setActionButtonTitle:v14];
  }
  if (v15) {
    [v25 setActionButtonURL:v15];
  }
  if (v16) {
    [v25 setLaunchURL:v16];
  }
  id v26 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithOptions:v25];
  [v26 startWithCompletionBlock:v17];
}

+ (void)reloadUpdatesWithCompletionBlock:(id)a3
{
  id v3 = a3;
  int v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4)
  {
    int v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  unsigned int v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  int v15 = 138543362;
  id v16 = (id)objc_opt_class();
  id v8 = v16;
  LODWORD(v12) = 12;
  uint64_t v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    unsigned int v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v15, v12);
    free(v9);
    SSFileLog();
LABEL_11:
  }
  id v10 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001A84BC;
  v13[3] = &unk_1003A8F48;
  id v14 = v3;
  id v11 = v3;
  [v10 reloadForSettingsFromServerWithCompletionBlock:v13];
}

+ (void)repairAppWithRequest:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    unsigned int v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  id v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_11;
  }
  id v11 = objc_opt_class();
  id v12 = v11;
  id v13 = [v5 bundleID];
  [v5 accountDSID];
  int v22 = 138544130;
  int v23 = v11;
  __int16 v24 = 2112;
  id v25 = v13;
  __int16 v26 = 2112;
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  __int16 v28 = 2048;
  id v29 = [v5 claimStyle];
  LODWORD(v21) = 42;
  id v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v22, v21);
    free(v14);
    SSFileLog();
LABEL_11:
  }
  BOOL v15 = [v5 claimStyle] != 0;
  id v16 = objc_alloc((Class)ISWeakLinkedClassForString());
  id v17 = [v5 bundleID];
  id v18 = [v5 accountDSID];
  id v19 = [v16 initWithBundleID:v17 accountIdentifier:v18 claimStyle:v15];

  id v20 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithOptions:v19];
  [v20 sendRequestWithCompletionBlock:v6];
}

+ (void)restoreDemotedAppsWithBundleIDs:(id)a3
{
  id v4 = a3;
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  unsigned int v8 = [v5 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    int v9 = v7;
  }
  else {
    int v9 = v7 & 2;
  }
  if (!v9) {
    goto LABEL_12;
  }
  id v10 = objc_opt_class();
  id v11 = v10;
  id v12 = [v4 count];
  [v4 componentsJoinedByString:@", "];
  int v18 = 138543874;
  id v19 = v10;
  __int16 v20 = 2048;
  id v21 = v12;
  __int16 v22 = 2112;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 32;
  id v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    unsigned int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v18, v16);
    free(v13);
    SSFileLog();
LABEL_12:
  }
  id v14 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithBundleIDs:v4];
  id v15 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithOptions:v14];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001A89F0;
  v17[3] = &unk_1003A8F68;
  v17[4] = a1;
  [v15 startWithCompletionBlock:v17];
}

+ (void)sendClusterMappings:(id)a3
{
  id v4 = a3;
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  unsigned int v8 = [v5 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    int v9 = v7;
  }
  else {
    int v9 = v7 & 2;
  }
  id v30 = a1;
  if (v9)
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    int v39 = 138543618;
    v40 = v10;
    __int16 v41 = 2048;
    id v42 = [v4 count];
    LODWORD(v29) = 22;
    id v12 = (void *)_os_log_send_and_compose_impl();

    if (!v12) {
      goto LABEL_13;
    }
    unsigned int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v39, v29);
    free(v12);
    SSFileLog();
  }

LABEL_13:
  ISWeakLinkedClassForString();
  ISWeakLinkedClassForString();
  id v13 = objc_opt_new();
  id v14 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v15 = v4;
  id v16 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v35;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        __int16 v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v21 = objc_opt_new();
        __int16 v22 = [v20 bundleID];
        [v21 setBundleID:v22];

        id v23 = [v20 clusterID];
        [v21 setClusterID:v23];

        __int16 v24 = [v20 clusterVersionID];
        [v21 setClusterVersion:v24];

        id v25 = [v20 itemID];
        [v21 setItemID:v25];

        __int16 v26 = [v20 launchWeight];
        [v21 setLaunchesWeight:v26];

        id v27 = [v20 foregroundUsageWeight];
        [v21 setUsageWeight:v27];

        [v14 addObject:v21];
      }
      id v17 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v17);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1001A8F54;
  v31[3] = &unk_1003A8F90;
  id v32 = v15;
  id v33 = v30;
  id v28 = v15;
  [v13 setClusterMappings:v14 completionBlock:v31];
}

+ (void)sendSoftwareDownloads:(id)a3 withReason:(id)a4
{
}

+ (void)sendSoftwareDownloads:(id)a3 withReason:(id)a4 manifestType:(int64_t)a5
{
}

+ (void)sendSoftwareDownloads:(id)a3 withReason:(id)a4 forClientID:(id)a5
{
}

+ (void)sendSoftwareDownloads:(id)a3 withReason:(id)a4 forClientID:(id)a5 manifestType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = +[SSLogConfig sharedDaemonConfig];
  if (!v13)
  {
    id v13 = +[SSLogConfig sharedConfig];
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
    goto LABEL_11;
  }
  id v17 = objc_opt_class();
  id v18 = v17;
  int v22 = 138543874;
  id v23 = v17;
  __int16 v24 = 2048;
  id v25 = [v10 count];
  __int16 v26 = 2114;
  id v27 = v11;
  LODWORD(v21) = 32;
  id v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    id v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v22, v21);
    free(v19);
    SSFileLog();
LABEL_11:
  }
  id v20 = [a1 _newManifestWithManifestType:a6];
  [a1 _addDownloads:v10 toManifest:v20 forClientID:v12];

  [a1 _sendSoftwareManifest:v20 withReason:v11];
}

+ (void)sendNewsSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    int v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  id v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_11;
  }
  LODWORD(v15) = 138543362;
  *(void *)((char *)&v15 + 4) = objc_opt_class();
  id v11 = *(id *)((char *)&v15 + 4);
  LODWORD(v14) = 12;
  id v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v15, v14, v15);
    free(v12);
    SSFileLog();
LABEL_11:
  }
  ISWeakLinkedClassForString();
  id v13 = objc_opt_new();
  [v13 setSubscriptionEntitlementsWithDictionary:v6 forAccountID:v5 segment:0];
}

+ (void)sendActivitySubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    int v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  id v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_11;
  }
  LODWORD(v15) = 138543362;
  *(void *)((char *)&v15 + 4) = objc_opt_class();
  id v11 = *(id *)((char *)&v15 + 4);
  LODWORD(v14) = 12;
  id v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v15, v14, v15);
    free(v12);
    SSFileLog();
LABEL_11:
  }
  ISWeakLinkedClassForString();
  id v13 = objc_opt_new();
  [v13 setSubscriptionEntitlementsWithDictionary:v6 forAccountID:v5 segment:2];
}

+ (void)sendAppStoreSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    int v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  id v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_11;
  }
  LODWORD(v15) = 138543362;
  *(void *)((char *)&v15 + 4) = objc_opt_class();
  id v11 = *(id *)((char *)&v15 + 4);
  LODWORD(v14) = 12;
  id v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v15, v14, v15);
    free(v12);
    SSFileLog();
LABEL_11:
  }
  ISWeakLinkedClassForString();
  id v13 = objc_opt_new();
  [v13 setSubscriptionEntitlementsWithDictionary:v6 forAccountID:v5 segment:1];
}

+ (void)_addDownloads:(id)a3 toManifest:(id)a4 forClientID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = +[SSAccountStore defaultStore];
  id v11 = [v10 activeAccount];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001A9AD0;
  v15[3] = &unk_1003A8FB8;
  id v16 = v8;
  id v17 = v11;
  id v18 = v7;
  id v12 = v7;
  id v13 = v11;
  id v14 = v8;
  [v9 enumerateObjectsUsingBlock:v15];
}

+ (void)_checkClaimsForAccountID:(id)a3 claimStyle:(int64_t)a4 clientAuditTokenData:(id)a5 establishActiveAccounts:(BOOL)a6 ignoresPreviousClaimAttempts:(BOOL)a7 completionBlock:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v13 = a3;
  id v14 = a8;
  long long v15 = +[SSLogConfig sharedDaemonConfig];
  if (!v15)
  {
    long long v15 = +[SSLogConfig sharedConfig];
  }
  unsigned int v16 = [v15 shouldLog];
  if ([v15 shouldLogToDisk]) {
    int v17 = v16 | 2;
  }
  else {
    int v17 = v16;
  }
  id v18 = [v15 OSLogObject];
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
    v17 &= 2u;
  }
  if (v17)
  {
    int v30 = 138543874;
    id v31 = (id)objc_opt_class();
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 2048;
    int64_t v35 = a4;
    id v19 = v31;
    LODWORD(v26) = 32;
    id v25 = &v30;
    id v20 = (void *)_os_log_send_and_compose_impl();

    if (!v20) {
      goto LABEL_12;
    }
    id v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v30, v26);
    free(v20);
    id v25 = (int *)v18;
    SSFileLog();
  }

LABEL_12:
  id v21 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithClaimStyle:a4];
  int v22 = v21;
  if (v13) {
    [v21 setAccountID:v13];
  }
  objc_msgSend(v22, "setEstablishesActiveAccount:", v10, v25);
  [v22 setIgnoresPreviousClaimAttempts:v9];
  id v23 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithOptions:v22];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001A9EBC;
  v27[3] = &unk_1003A8FE0;
  id v28 = v14;
  id v29 = a1;
  id v24 = v14;
  [v23 sendRequestWithCompletionBlock:v27];
}

+ (id)_newManifestWithManifestType:(int64_t)a3
{
  id v4 = objc_alloc((Class)ISWeakLinkedClassForString());

  return [v4 initWithManifestType:a3];
}

+ (id)_newRequestWithManifest:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithManifest:v3];

  id v5 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithOptions:v4];
  return v5;
}

+ (void)_sendSoftwareManifest:(id)a3 withReason:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _newRequestWithManifest:a3];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001AA240;
  v9[3] = &unk_1003A9008;
  id v10 = v6;
  id v11 = a1;
  id v8 = v6;
  [v7 startWithCompletionBlock:v9];
}

@end