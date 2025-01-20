@interface XPCServer
- (BOOL)_hasClientAccessEntitlement;
- (id)_errorForCode:(int)a3 message:(id)a4;
- (id)substituteStandardURLPlaceholders:(id)a3 withAccount:(id)a4 withServiceIdentifier:(id)a5;
- (void)didChangeFMFAccountInfo:(id)a3 usingCallback:(id)a4;
- (void)refreshMyLocationWithCallback:(id)a3;
- (void)willDeleteiCloudAccountUsingCallback:(id)a3;
@end

@implementation XPCServer

- (void)didChangeFMFAccountInfo:(id)a3 usingCallback:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, void))a4;
  v9 = sub_10001B6D4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v17 = v10;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FRAMEWORK API: %@ with changeDesc %@", buf, 0x16u);
  }
  if ([(XPCServer *)self _hasClientAccessEntitlement])
  {
    v11 = +[AppleAccountManager sharedInstance];
    [v11 syncFMFAccountInfo];

    v8[2](v8, 0);
  }
  else
  {
    v12 = NSStringFromSelector(a2);
    v13 = +[NSString stringWithFormat:@"Entitlement not found for %@", v12];

    v14 = sub_10001B6D4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100038D98((uint64_t)v13, v14);
    }

    v15 = [(XPCServer *)self _errorForCode:103 message:v13];
    ((void (**)(id, void *))v8)[2](v8, v15);
  }
}

- (void)willDeleteiCloudAccountUsingCallback:(id)a3
{
  v5 = (void (**)(id, void))a3;
  v6 = sub_10001B6D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "FRAMEWORK API: %@", buf, 0xCu);
  }
  if ([(XPCServer *)self _hasClientAccessEntitlement])
  {
    v5[2](v5, 0);
  }
  else
  {
    v8 = NSStringFromSelector(a2);
    v9 = +[NSString stringWithFormat:@"Entitlement not found for %@", v8];

    v10 = sub_10001B6D4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100038D98((uint64_t)v9, v10);
    }

    v11 = [(XPCServer *)self _errorForCode:103 message:v9];
    ((void (**)(id, void *))v5)[2](v5, v11);
  }
}

- (void)refreshMyLocationWithCallback:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  id v7 = +[NSString stringWithFormat:@"%@-%X", v6, self];

  v8 = +[FMXPCTransactionManager sharedInstance];
  [v8 beginTransaction:v7];

  v9 = +[AccountManager sharedInstance];
  v10 = [v9 accounts];

  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100029C6C;
  v14[3] = &unk_10005A600;
  v16 = &v17;
  v14[4] = self;
  id v11 = v4;
  id v15 = v11;
  [v10 enumerateObjectsUsingBlock:v14];
  if (!*((unsigned char *)v18 + 24))
  {
    v12 = +[NSError fm_genericError];
    (*((void (**)(id, void *))v11 + 2))(v11, v12);
  }
  v13 = +[FMXPCTransactionManager sharedInstance];
  [v13 endTransaction:v7];

  _Block_object_dispose(&v17, 8);
}

- (id)substituteStandardURLPlaceholders:(id)a3 withAccount:(id)a4 withServiceIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[PreferencesMgr sharedInstance];
  id v11 = [v10 hostportOverride];

  if ([v11 length])
  {
    uint64_t v12 = [v7 stringByReplacingOccurrencesOfString:@"${hostname}" withString:v11];
  }
  else
  {
    v13 = [v8 serverHost];

    if (!v13) {
      goto LABEL_6;
    }
    uint64_t v14 = [v8 serverHost];
    uint64_t v12 = [v7 stringByReplacingOccurrencesOfString:@"${hostname}" withString:v14];

    id v7 = (id)v14;
  }

  id v7 = (id)v12;
LABEL_6:
  id v15 = +[PreferencesMgr sharedInstance];
  v16 = [v15 protocolSchemeOverride];

  if ([v16 length])
  {
    uint64_t v17 = [v7 stringByReplacingOccurrencesOfString:@"${scheme}" withString:v16];
  }
  else
  {
    __int16 v18 = [v8 serverProtocolScheme];

    if (!v18) {
      goto LABEL_11;
    }
    uint64_t v19 = [v8 serverProtocolScheme];
    uint64_t v17 = [v7 stringByReplacingOccurrencesOfString:@"${scheme}" withString:v19];

    id v7 = (id)v19;
  }

  id v7 = (id)v17;
LABEL_11:
  if (v9)
  {
    uint64_t v20 = [v7 stringByReplacingOccurrencesOfString:@"${service}" withString:v9];

    id v7 = (id)v20;
  }
  v21 = [v8 authId];

  if (v21)
  {
    v22 = [v8 authId];
    uint64_t v23 = [v7 stringByReplacingOccurrencesOfString:@"${dsid}" withString:v22];

    id v7 = (id)v23;
  }
  v24 = +[SystemConfig sharedInstance];
  v25 = [v24 deviceUDID];

  if (v25)
  {
    uint64_t v26 = [v7 stringByReplacingOccurrencesOfString:@"${udid}" withString:v25];

    id v7 = (id)v26;
  }

  return v7;
}

- (BOOL)_hasClientAccessEntitlement
{
  v2 = +[NSXPCConnection currentConnection];
  v3 = [v2 valueForEntitlement:@"com.apple.icloud.fmflocatord-access"];

  id v4 = +[NSXPCConnection currentConnection];
  v5 = [v4 valueForEntitlement:@"com.apple.icloud.fmfd.access"];

  if (v3 && ([&__kCFBooleanTrue isEqual:v3] & 1) != 0)
  {
    unsigned __int8 v6 = 1;
  }
  else if (v5)
  {
    unsigned __int8 v6 = [&__kCFBooleanTrue isEqual:v5];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)_errorForCode:(int)a3 message:(id)a4
{
  v5 = (__CFString *)a4;
  id v6 = objc_alloc((Class)NSError);
  if (v5) {
    CFStringRef v7 = v5;
  }
  else {
    CFStringRef v7 = &stru_10005BAE8;
  }
  NSErrorUserInfoKey v11 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v12 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  id v9 = [v6 initWithDomain:@"com.apple.icloud.fmflocatord" code:a3 userInfo:v8];

  return v9;
}

@end