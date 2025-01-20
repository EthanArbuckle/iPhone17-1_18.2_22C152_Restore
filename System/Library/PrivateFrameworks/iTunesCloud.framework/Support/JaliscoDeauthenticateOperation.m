@interface JaliscoDeauthenticateOperation
- (void)main;
@end

@implementation JaliscoDeauthenticateOperation

- (void)main
{
  v3 = +[ICDeviceInfo currentDeviceInfo];
  if ([v3 isWatch]
    && (+[ICNanoPairedDeviceStatusMonitor sharedMonitor],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isMediaSyncingSupported],
        v4,
        v5))
  {
    [(CloudLibraryOperation *)self setStatus:1];
    v6 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not running JaliscoDeauthenticateOperation on wOS platform", buf, 2u);
    }
  }
  else
  {
    v6 = [objc_alloc((Class)MSVXPCTransaction) initWithName:@"JaliscoDeauthenticateOperation"];
    [v6 beginTransaction];
    v7 = [(CloudLibraryOperation *)self musicLibrary];
    v8 = [(CloudLibraryOperation *)self clientIdentity];
    [v7 setClientIdentity:v8];

    [(CloudLibraryOperation *)self musicLibrary];
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_1000314AC;
    v15 = &unk_1001BE540;
    v16 = self;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v17;
    [v9 performDatabaseTransactionWithBlock:&v12];
    -[CloudLibraryOperation setStatus:](self, "setStatus:", 1, v12, v13, v14, v15, v16);
    v10 = [(CloudLibraryOperation *)self musicLibrary];
    v11 = MSVTCCIdentityForCurrentProcess();
    [v10 setClientIdentity:v11];

    [v6 endTransaction];
  }
}

@end