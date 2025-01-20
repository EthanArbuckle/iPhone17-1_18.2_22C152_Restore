@interface ApplicationWorkspaceInstallPlaceholderOperation
- (ApplicationWorkspaceInstallPlaceholderOperation)initWithApplicationHandle:(id)a3 forceUpdate:(BOOL)a4;
- (ApplicationWorkspaceInstallPlaceholderOperation)initWithApplicationHandle:(id)a3 iconData:(id)a4;
- (BOOL)blocksAppInstallation;
- (id)_download;
- (void)runWithCompletionBlock:(id)a3;
@end

@implementation ApplicationWorkspaceInstallPlaceholderOperation

- (ApplicationWorkspaceInstallPlaceholderOperation)initWithApplicationHandle:(id)a3 forceUpdate:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ApplicationWorkspaceInstallPlaceholderOperation;
  return -[ApplicationWorkspaceOperation initWithApplicationHandle:](&v5, "initWithApplicationHandle:", a3, a4);
}

- (ApplicationWorkspaceInstallPlaceholderOperation)initWithApplicationHandle:(id)a3 iconData:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ApplicationWorkspaceInstallPlaceholderOperation;
  return -[ApplicationWorkspaceOperation initWithApplicationHandle:](&v5, "initWithApplicationHandle:", a3, a4);
}

- (BOOL)blocksAppInstallation
{
  return 1;
}

- (void)runWithCompletionBlock:(id)a3
{
  id v5 = [(ApplicationWorkspaceInstallPlaceholderOperation *)self _download];
  v6 = [(ApplicationHandle *)[(ApplicationWorkspaceOperation *)self applicationHandle] bundleID];
  if (!v6) {
    v6 = (NSString *)[v5 valueForProperty:@"bundle_id"];
  }
  +[ApplicationWorkspaceState completeNotificationForInstallingBundleIdentifier:v6];
  if (a3)
  {
    v7 = (void (*)(id, uint64_t, void, void))*((void *)a3 + 2);
    v7(a3, 1, 0, 0);
  }
}

- (id)_download
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3052000000;
  v8 = sub_1001ADB88;
  v9 = sub_1001ADB98;
  uint64_t v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001ADBA4;
  v4[3] = &unk_1003A8670;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "readUsingTransactionBlock:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

@end