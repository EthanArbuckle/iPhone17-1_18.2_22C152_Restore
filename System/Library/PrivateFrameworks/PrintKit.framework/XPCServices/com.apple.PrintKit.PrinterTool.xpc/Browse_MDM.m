@interface Browse_MDM
- (Browse_MDM)initWithQueue:(id)a3;
- (void)start;
@end

@implementation Browse_MDM

- (Browse_MDM)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Browse_MDM;
  v6 = [(Browse_MDM *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)start
{
  v3 = [(objc_class *)off_1000C8A48() sharedConnection];
  v20 = [v3 knownAirPrintIPPURLStrings];

  v4 = [(Browse_Implementation *)self session];
  id v5 = [v4 clientBundleIdentifier];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v20;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
    do
    {
      objc_super v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = PKURLWithString(*(void **)(*((void *)&v23 + 1) + 8 * (void)v9));
        queue = self->_queue;
        v12 = [(Browse_Implementation *)self addEntity];
        sub_10005E6E0(v10, v5, queue, v12);

        objc_super v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v7);
  }

  v13 = +[NSUserDefaults standardUserDefaults];
  v14 = [v13 stringForKey:@"PrintKitManualPrinter"];

  if (v14)
  {
    v15 = PKURLWithString(v14);
    v16 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Manual printer from preferences: %@, checking reachability", buf, 0xCu);
    }

    if (v15)
    {
      v17 = [(Browse_Implementation *)self addEntity];
      v18 = self->_queue;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10005EB8C;
      v21[3] = &unk_1000A3BB8;
      id v22 = v17;
      id v19 = v17;
      sub_10005E6E0(v15, v5, v18, v21);
    }
  }
}

- (void).cxx_destruct
{
}

@end