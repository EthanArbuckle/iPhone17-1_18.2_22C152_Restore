@interface PushNotificationDisplayOperation
+ (BOOL)_shouldUseBulletinBoardForNotification:(id)a3;
- (BOOL)_URLHandlerExists;
- (BOOL)_clientExistsWithIdentifier:(id)a3;
- (BOOL)requiresClientIdentifier;
- (NSDictionary)notificationUserInfo;
- (PushNotificationDisplayOperation)init;
- (PushNotificationDisplayOperation)initWithNotificationUserInfo:(id)a3;
- (id)_clientIdentifierForDownloadKinds:(id)a3;
- (int64_t)_notificationClass;
- (void)_displayAlert;
- (void)_displayBadge;
- (void)_loadNotificationDownloadManifest;
- (void)_openNotificationURL;
- (void)_performNotificationAction:(BOOL)a3;
- (void)run;
@end

@implementation PushNotificationDisplayOperation

- (PushNotificationDisplayOperation)init
{
  return [(PushNotificationDisplayOperation *)self initWithNotificationUserInfo:0];
}

- (PushNotificationDisplayOperation)initWithNotificationUserInfo:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PushNotificationDisplayOperation.m" lineNumber:59 description:@"Must provide user info"];
  }
  v11.receiver = self;
  v11.super_class = (Class)PushNotificationDisplayOperation;
  v6 = [(PushNotificationDisplayOperation *)&v11 init];
  if (v6)
  {
    v7 = (SSRemoteNotification *)[objc_alloc((Class)SSRemoteNotification) initWithNotificationUserInfo:v5];
    notification = v6->_notification;
    v6->_notification = v7;
  }
  return v6;
}

- (NSDictionary)notificationUserInfo
{
  return (NSDictionary *)[(SSRemoteNotification *)self->_notification notificationUserInfo];
}

- (BOOL)requiresClientIdentifier
{
  unint64_t v2 = (unint64_t)[(SSRemoteNotification *)self->_notification actionType];
  return (v2 > 0x1D) | (0x1FBD0481u >> v2) & 1;
}

- (void)run
{
  v3 = [(SSRemoteNotification *)self->_notification valueForKey:SSRemoteNotificationKeyClientIdentifier];
  if (v3)
  {
    v4 = [(SSRemoteNotification *)self->_notification valueForKey:SSRemoteNotificationKeyAlertType];
    BOOL v5 = [v4 integerValue] == (id)1;

    if (![(PushNotificationDisplayOperation *)self _clientExistsWithIdentifier:v3])
    {
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
      v9 = [v6 OSLogObject];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        v8 &= 2u;
      }
      if (!v8) {
        goto LABEL_45;
      }
      *(_DWORD *)v29 = 138412546;
      *(void *)&v29[4] = objc_opt_class();
      *(_WORD *)&v29[12] = 2112;
      *(void *)&v29[14] = v3;
      id v10 = *(id *)&v29[4];
      LODWORD(v28) = 22;
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  if ([(PushNotificationDisplayOperation *)self _URLHandlerExists])
  {
    if (![(PushNotificationDisplayOperation *)self requiresClientIdentifier]
      || (id)[(PushNotificationDisplayOperation *)self _notificationClass] != (id)1)
    {
      [(PushNotificationDisplayOperation *)self _displayBadge];
LABEL_47:
      v6 = [(SSRemoteNotification *)self->_notification alertBodyString];
      if ([(SSRemoteNotification *)self->_notification actionType] == (id)12
        || ![v6 length])
      {
        [(PushNotificationDisplayOperation *)self _performNotificationAction:0];
      }
      else
      {
        [(PushNotificationDisplayOperation *)self _displayAlert];
      }
      goto LABEL_51;
    }
    if (!v3)
    {
      v6 = +[SSLogConfig sharedDaemonConfig];
      if (!v6)
      {
        v6 = +[SSLogConfig sharedConfig];
      }
      unsigned int v25 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v26 = v25 | 2;
      }
      else {
        int v26 = v25;
      }
      v9 = [v6 OSLogObject];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        v26 &= 2u;
      }
      if (!v26) {
        goto LABEL_45;
      }
      *(_DWORD *)v29 = 138412290;
      *(void *)&v29[4] = objc_opt_class();
      id v10 = *(id *)&v29[4];
      LODWORD(v28) = 12;
LABEL_12:
      objc_super v11 = (void *)_os_log_send_and_compose_impl();

      goto LABEL_43;
    }
    if (v5) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = 0;
    }
    v13 = +[SSLogConfig sharedDaemonConfig];
    if (!v13)
    {
      v13 = +[SSLogConfig sharedConfig];
    }
    unsigned int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    v16 = [v13 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15)
    {
      *(_DWORD *)v29 = 138412802;
      *(void *)&v29[4] = objc_opt_class();
      *(_WORD *)&v29[12] = 2112;
      *(void *)&v29[14] = v3;
      *(_WORD *)&v29[22] = 2048;
      uint64_t v30 = v12;
      id v17 = *(id *)&v29[4];
      LODWORD(v28) = 32;
      v27 = v29;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18) {
        goto LABEL_32;
      }
      v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, v29, v28, *(_OWORD *)v29, *(void *)&v29[16], v30);
      free(v18);
      v27 = v16;
      SSFileLog();
    }

LABEL_32:
    if (!v5) {
      goto LABEL_52;
    }
    goto LABEL_47;
  }
  v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6)
  {
    v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v19 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v20 = v19 | 2;
  }
  else {
    int v20 = v19;
  }
  v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    v20 &= 2u;
  }
  if (!v20) {
    goto LABEL_45;
  }
  v21 = objc_opt_class();
  notification = self->_notification;
  uint64_t v23 = SSRemoteNotificationKeyURLString;
  id v24 = v21;
  [(SSRemoteNotification *)notification valueForKey:v23];
  *(_DWORD *)v29 = 138412546;
  *(void *)&v29[4] = v21;
  *(void *)&v29[14] = *(_WORD *)&v29[12] = 2112;
  LODWORD(v28) = 22;
  objc_super v11 = (void *)_os_log_send_and_compose_impl();

LABEL_43:
  if (v11)
  {
    v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, v29, v28);
    free(v11);
    SSFileLog();
LABEL_45:
  }
LABEL_51:

LABEL_52:
}

- (BOOL)_clientExistsWithIdentifier:(id)a3
{
  v3 = +[LSApplicationProxy applicationProxyForIdentifier:a3 placeholder:0];
  unsigned __int8 v4 = [v3 foundBackingBundle];

  return v4;
}

- (id)_clientIdentifierForDownloadKinds:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:SSDownloadKindSoftwareApplication])
  {
    CFStringRef v4 = @"com.apple.AppStore";
  }
  else if ([v3 containsObject:SSDownloadKindEBook])
  {
    CFStringRef v4 = @"com.apple.iBooks";
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = v3;
    v6 = (char *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      unsigned int v7 = v6;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          if (SSDownloadKindIsMediaKind() & 1) != 0 || (SSDownloadKindIsToneKind())
          {
            CFStringRef v4 = @"com.apple.MobileStore";
            goto LABEL_17;
          }
        }
        unsigned int v7 = (char *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        CFStringRef v4 = 0;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      CFStringRef v4 = 0;
    }
LABEL_17:
  }
  return (id)v4;
}

- (void)_displayAlert
{
  id v3 = [(SSRemoteNotification *)self->_notification alertBodyString];
  if ([v3 length])
  {
    CFStringRef v4 = [(SSRemoteNotification *)self->_notification alertTitleString];
    unsigned int v5 = [(id)objc_opt_class() _shouldUseBulletinBoardForNotification:self->_notification];
    notification = self->_notification;
    if (v5)
    {
      unsigned int v7 = [(SSRemoteNotification *)notification valueForKey:SSRemoteNotificationKeyURLString];
      if ([v7 length])
      {
        uint64_t v8 = +[NSURL URLWithString:v7];
      }
      else
      {
        uint64_t v8 = 0;
      }
      id v9 = [(SSRemoteNotification *)self->_notification valueForKey:SSRemoteNotificationKeyClientIdentifier];
      id v16 = [(SSRemoteNotification *)self->_notification alertOKString];
      int v20 = [v9 lowercaseString];
      unsigned int v21 = [v20 isEqualToString:@"com.apple.appstore"];

      if (v21)
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100098010;
        v26[3] = &unk_1003A3568;
        v26[4] = self;
        +[AppStoreUtility postBulletinWithTitle:v4 message:v3 destinations:12 actionButtonTitle:v16 actionButtonURL:v8 launchURL:v8 completionBlock:v26];
      }
    }
    else
    {
      id v24 = v4;
      unsigned int v7 = [(SSRemoteNotification *)notification alertCancelString];
      uint64_t v8 = [(SSRemoteNotification *)self->_notification alertOKString];
      id v9 = objc_alloc_init((Class)ISDialog);
      id v10 = objc_alloc((Class)NSArray);
      long long v11 = ISDialogButton;
      uint64_t v12 = (uint64_t)v7;
      if (!v7)
      {
        uint64_t v23 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v12 = [v23 localizedStringForKey:@"CANCEL" value:&stru_1003B9B00 table:0];
      }
      v22 = (void *)v12;
      long long v13 = +[ISDialogButton buttonWithTitle:v12];
      long long v14 = v8;
      if (!v8)
      {
        long long v11 = +[NSBundle bundleForClass:objc_opt_class()];
        long long v14 = [v11 localizedStringForKey:@"OK" value:&stru_1003B9B00 table:0];
      }
      int v15 = +[ISDialogButton buttonWithTitle:v14];
      id v16 = objc_msgSend(v10, "initWithObjects:", v13, v15, 0);

      if (!v8)
      {
      }
      if (!v7)
      {
      }
      [v9 setButtons:v16];
      [v9 setDismissOnLock:1];
      [v9 setMessage:v3];
      [v9 setShouldDismissAfterUnlock:1];
      [v9 setShouldDisplayAsTopMost:1];
      CFStringRef v4 = v24;
      [v9 setTitle:v24];
      [v9 setUnlockActionButtonIndex:1];
      id v17 = [v9 copyUserNotification];
      v18 = +[UserNotificationCenter defaultCenter];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000981B8;
      v25[3] = &unk_1003A50D8;
      v25[4] = self;
      id v19 = [v18 showUserNotification:v17 withCompletionBlock:v25];
    }
  }
}

- (void)_displayBadge
{
  id v5 = [(SSRemoteNotification *)self->_notification valueForKey:SSRemoteNotificationKeyClientIdentifier];
  if (v5)
  {
    id v3 = +[SpringBoardUtility sharedInstance];
    CFStringRef v4 = [(SSRemoteNotification *)self->_notification badgeValue];
    [v3 setBadgeValue:v4 forIdentifier:v5];
  }
}

- (void)_loadNotificationDownloadManifest
{
  id v9 = [(SSRemoteNotification *)self->_notification valueForKey:SSRemoteNotificationKeyURLString];
  if (v9)
  {
    id v2 = [objc_alloc((Class)NSURL) initWithString:v9];
    if (v2)
    {
      id v3 = v2;
      id v4 = objc_alloc((Class)SSDownloadManifestRequest);
      id v5 = +[NSURLRequest requestWithURL:v3];
      id v6 = [v4 initWithURLRequest:v5];

      [v6 setManifestFormat:1];
      unsigned int v7 = [[LoadExternalDownloadManifestOperation alloc] initWithRequest:v6];
      uint64_t v8 = +[ISOperationQueue mainQueue];
      [v8 addOperation:v7];
    }
  }
}

- (int64_t)_notificationClass
{
  id v2 = [(SSRemoteNotification *)self->_notification valueForKey:SSRemoteNotificationKeyNotificationClass];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)_openNotificationURL
{
  id v7 = [(SSRemoteNotification *)self->_notification valueForKey:SSRemoteNotificationKeyURLString];
  if (v7)
  {
    id v2 = [objc_alloc((Class)NSURL) initWithString:v7];
    if (v2)
    {
      id v3 = v2;
      id v4 = [objc_alloc((Class)ISOpenURLRequest) initWithURL:v2];
      [v4 setITunesStoreURL:0];
      id v5 = [objc_alloc((Class)ISOpenURLOperation) initWithOpenURLRequest:v4];
      id v6 = +[ISOperationQueue mainQueue];
      [v6 addOperation:v5];
    }
  }
}

- (void)_performNotificationAction:(BOOL)a3
{
  BOOL v3 = a3;
  switch((unint64_t)[(SSRemoteNotification *)self->_notification actionType])
  {
    case 1uLL:
    case 4uLL:
      if (v3)
      {
        [(PushNotificationDisplayOperation *)self _openNotificationURL];
      }
      return;
    case 2uLL:
      id v71 = +[StoreDownloadQueue sharedDownloadQueue];
      [v71 checkAutomaticDownloadQueue];
      goto LABEL_123;
    case 3uLL:
      if (!v3) {
        return;
      }
      id v71 = [(SSRemoteNotification *)self->_notification valueForKey:SSRemoteNotificationKeyDownloadKinds];
      id v6 = [SetAutomaticDownloadKindsOperation alloc];
      id v7 = v6;
      if (v71)
      {
        uint64_t v8 = +[NSSet setWithArray:](NSSet, "setWithArray:");
        id v9 = (SetAutomaticDownloadKindsOperation *)[v7 initWithDownloadKinds:v8];

        id v7 = (void *)v8;
      }
      else
      {
        id v9 = -[SetAutomaticDownloadKindsOperation initWithDownloadKinds:](v6, "initWithDownloadKinds:");
      }

      v67 = +[ISOperationQueue mainQueue];
      [v67 addOperation:v9];

      goto LABEL_123;
    case 5uLL:
      [(PushNotificationDisplayOperation *)self _loadNotificationDownloadManifest];
      return;
    case 6uLL:
      id v10 = [(SSRemoteNotification *)self->_notification valueForKey:SSRemoteNotificationKeyAccountIdentifier];
      long long v11 = [(SSRemoteNotification *)self->_notification valueForKey:SSRemoteNotificationKeyAccountCredit];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_30;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_30;
      }
      uint64_t v12 = +[SSAccountStore defaultStore];
      long long v13 = [v12 accountWithUniqueIdentifier:v10];
      if (!v13) {
        goto LABEL_29;
      }
      long long v14 = +[SSLogConfig sharedAccountsConfig];
      if (!v14)
      {
        long long v14 = +[SSLogConfig sharedConfig];
      }
      unsigned int v15 = [v14 shouldLog];
      if ([v14 shouldLogToDisk]) {
        int v16 = v15 | 2;
      }
      else {
        int v16 = v15;
      }
      id v17 = [v14 OSLogObject];
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        v16 &= 2u;
      }
      if (!v16) {
        goto LABEL_27;
      }
      v18 = objc_opt_class();
      id v72 = v18;
      id v19 = [v13 accountName];
      SSHashIfNeeded();
      int v74 = 138543618;
      id v75 = v18;
      __int16 v76 = 2114;
      id v77 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v70) = 22;
      int v20 = (void *)_os_log_send_and_compose_impl();

      if (v20)
      {
        id v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v74, v70);
        free(v20);
        SSFileLog();
LABEL_27:
      }
      [v13 setCreditsString:v11];
      [v12 saveAccount:v13 verifyCredentials:0 completion:0];
LABEL_29:

LABEL_30:
      goto LABEL_119;
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
      id v5 = (void *)ISWeakLinkedClassForString();
      id v71 = [(SSRemoteNotification *)self->_notification notificationUserInfo];
      objc_msgSend(v5, "didReceiveStorePushNotificationWithPayload:");
      goto LABEL_123;
    case 0xBuLL:
      v22 = +[SSAccountStore defaultStore];
      uint64_t v23 = [v22 activeAccount];
      id v71 = [v23 uniqueIdentifier];

      unsigned int v21 = +[StoreDownloadQueue sharedDownloadQueue];
      [v21 checkQueuesWithReason:@"trigger-download" accountID:v71];
      goto LABEL_34;
    case 0xCuLL:
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFStringRef v25 = @"com.apple.itunesstored.PlaybackLeaseDidEnd";
      goto LABEL_53;
    case 0xDuLL:
      id v10 = [(SSRemoteNotification *)self->_notification valueForKey:SSRemoteNotificationKeyDelayedGotoIdentifier];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_119;
      }
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
      v29 = [v26 OSLogObject];
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        v28 &= 2u;
      }
      if (!v28) {
        goto LABEL_47;
      }
      int v74 = 138412546;
      id v75 = (id)objc_opt_class();
      __int16 v76 = 2112;
      id v77 = v10;
      id v30 = v75;
      LODWORD(v70) = 22;
      v31 = (void *)_os_log_send_and_compose_impl();

      if (v31)
      {
        v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v74, v70);
        free(v31);
        SSFileLog();
LABEL_47:
      }
      +[DelayedGotoSemaphore signalSemaphoreForPushToken:v10];
      goto LABEL_119;
    case 0xEuLL:
      id v10 = objc_alloc_init(SubscriptionStatusOperation);
      [(SubscriptionStatusOperation *)v10 setCarrierBundleProvisioningStyle:1];
      v32 = [(SSRemoteNotification *)self->_notification notificationUserInfo];

      if (v32)
      {
        v73[0] = _NSConcreteStackBlock;
        v73[1] = 3221225472;
        v73[2] = sub_100099370;
        v73[3] = &unk_1003A5100;
        v73[4] = self;
        [(SubscriptionStatusOperation *)v10 setStatusBlock:v73];
      }
      v33 = +[ISOperationQueue mainQueue];
      [v33 addOperation:v10];

      goto LABEL_119;
    case 0xFuLL:
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFStringRef v25 = @"com.apple.itunesstored.mediacontenttastechangednotification";
LABEL_53:
      CFNotificationCenterPostNotification(DarwinNotifyCenter, v25, 0, 0, 1u);
      return;
    case 0x11uLL:
      +[SSVSubscriptionEntitlementsCoordinator markCachedSubscriptionEntitlementsAsExpired];
      return;
    case 0x1DuLL:
      v34 = [(SSRemoteNotification *)self->_notification valueForKey:SSRemoteNotificationKeyAccountIdentifier];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35 = v34;
LABEL_63:
        id v10 = v35;
        goto LABEL_76;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v34 longLongValue]);
        v35 = (SubscriptionStatusOperation *)objc_claimAutoreleasedReturnValue();
        goto LABEL_63;
      }
      v36 = +[SSLogConfig sharedDaemonConfig];
      if (!v36)
      {
        v36 = +[SSLogConfig sharedConfig];
      }
      unsigned int v37 = [v36 shouldLog];
      if ([v36 shouldLogToDisk]) {
        int v38 = v37 | 2;
      }
      else {
        int v38 = v37;
      }
      v39 = [v36 OSLogObject];
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        v38 &= 2u;
      }
      if (!v38) {
        goto LABEL_74;
      }
      int v74 = 138543362;
      id v75 = (id)objc_opt_class();
      id v40 = v75;
      LODWORD(v70) = 12;
      v68 = &v74;
      v41 = (void *)_os_log_send_and_compose_impl();

      if (v41)
      {
        v39 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v41, 4, &v74, v70);
        free(v41);
        v68 = (int *)v39;
        SSFileLog();
LABEL_74:
      }
      id v10 = 0;
LABEL_76:
      v42 = -[SSRemoteNotification valueForKey:](self->_notification, "valueForKey:", SSRemoteNotificationKeyBuyParams, v68);

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v43 = +[NSURL queryStringForDictionary:v42 escapedValues:1];
LABEL_80:
        v44 = v43;
        goto LABEL_93;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v43 = v42;
        goto LABEL_80;
      }
      v45 = +[SSLogConfig sharedDaemonConfig];
      if (!v45)
      {
        v45 = +[SSLogConfig sharedConfig];
      }
      unsigned int v46 = [v45 shouldLog];
      if ([v45 shouldLogToDisk]) {
        int v47 = v46 | 2;
      }
      else {
        int v47 = v46;
      }
      v48 = [v45 OSLogObject];
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        v47 &= 2u;
      }
      if (!v47) {
        goto LABEL_91;
      }
      v49 = objc_opt_class();
      int v74 = 138543362;
      id v75 = v49;
      id v50 = v49;
      LODWORD(v70) = 12;
      v69 = &v74;
      v51 = (void *)_os_log_send_and_compose_impl();

      if (v51)
      {
        v48 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v51, 4, &v74, v70);
        free(v51);
        v69 = (int *)v48;
        SSFileLog();
LABEL_91:
      }
      v44 = 0;
LABEL_93:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v52 = objc_alloc_init((Class)SSPurchase);
          [v52 setAccountIdentifier:v10];
          [v52 setBuyParameters:v44];
          v53 = +[SSLogConfig sharedDaemonConfig];
          if (!v53)
          {
            v53 = +[SSLogConfig sharedConfig];
          }
          unsigned int v54 = objc_msgSend(v53, "shouldLog", v69);
          if ([v53 shouldLogToDisk]) {
            int v55 = v54 | 2;
          }
          else {
            int v55 = v54;
          }
          v56 = [v53 OSLogObject];
          if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
            v55 &= 2u;
          }
          if (v55)
          {
            v57 = objc_opt_class();
            int v74 = 138543362;
            id v75 = v57;
            id v58 = v57;
            LODWORD(v70) = 12;
            v59 = (void *)_os_log_send_and_compose_impl();

            if (!v59)
            {
LABEL_106:

              v60 = [[PurchaseOperation alloc] initWithPurchase:v52];
              v61 = +[ISOperationQueue mainQueue];
              [v61 addOperation:v60];

              goto LABEL_117;
            }
            v56 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v59, 4, &v74, v70);
            free(v59);
            SSFileLog();
          }

          goto LABEL_106;
        }
      }
      id v52 = +[SSLogConfig sharedDaemonConfig];
      if (!v52)
      {
        id v52 = +[SSLogConfig sharedConfig];
      }
      unsigned int v62 = [v52 shouldLog];
      if ([v52 shouldLogToDisk]) {
        int v63 = v62 | 2;
      }
      else {
        int v63 = v62;
      }
      v60 = [v52 OSLogObject];
      if (!os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_ERROR)) {
        v63 &= 2u;
      }
      if (v63)
      {
        v64 = objc_opt_class();
        int v74 = 138543362;
        id v75 = v64;
        id v65 = v64;
        LODWORD(v70) = 12;
        v66 = (void *)_os_log_send_and_compose_impl();

        if (!v66) {
          goto LABEL_118;
        }
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v66, 4, &v74, v70);
        v60 = (PurchaseOperation *)objc_claimAutoreleasedReturnValue();
        free(v66);
        SSFileLog();
      }
LABEL_117:

LABEL_118:
LABEL_119:

      return;
    default:
      if (!v3) {
        return;
      }
      id v71 = +[PushNotificationController sharedInstance];
      unsigned int v21 = [(SSRemoteNotification *)self->_notification notificationUserInfo];
      [v71 postClientNotificationWithUserInfo:v21];
LABEL_34:

LABEL_123:

      return;
  }
}

+ (BOOL)_shouldUseBulletinBoardForNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 valueForKey:SSRemoteNotificationKeyClientIdentifier];
  if ([v4 length])
  {
    id v5 = [v3 valueForKey:SSRemoteNotificationKeyAlertType];
    id v6 = [v5 integerValue];

    if (v6 == (id)1)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      unint64_t v8 = (unint64_t)[v3 actionType];
      if (v8 <= 0x16) {
        unsigned int v7 = (0x440002u >> v8) & 1;
      }
      else {
        LOBYTE(v7) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_URLHandlerExists
{
  id v2 = [(SSRemoteNotification *)self->_notification tapUrl];
  if (v2)
  {
    id v3 = [objc_alloc((Class)NSURL) initWithString:v2];
    id v4 = +[LSApplicationWorkspace defaultWorkspace];
    id v5 = [v4 applicationsAvailableForOpeningURL:v3];

    BOOL v6 = [v5 count] != 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end