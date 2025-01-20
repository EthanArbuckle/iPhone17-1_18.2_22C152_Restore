@interface SFKeychainControlManager
+ (id)sharedManager;
- (BOOL)deleteCorruptedItemsWithError:(id *)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_init;
- (id)findCorruptedItemsWithError:(id *)a3;
- (id)xpcControlEndpoint;
- (void)rpcDeleteCorruptedItemsWithReply:(id)a3;
- (void)rpcFindCorruptedItemsWithReply:(id)a3;
@end

@implementation SFKeychainControlManager

- (void).cxx_destruct
{
}

- (void)rpcDeleteCorruptedItemsWithReply:(id)a3
{
  id v7 = 0;
  v4 = (void (**)(id, BOOL, id))a3;
  BOOL v5 = [(SFKeychainControlManager *)self deleteCorruptedItemsWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)rpcFindCorruptedItemsWithReply:(id)a3
{
  id v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  BOOL v5 = [(SFKeychainControlManager *)self findCorruptedItemsWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (BOOL)deleteCorruptedItemsWithError:(id *)a3
{
  id v25 = 0;
  v4 = [(SFKeychainControlManager *)self findCorruptedItemsWithError:&v25];
  id v5 = v25;
  BOOL v6 = v5 == 0;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        OSStatus v13 = SecItemDelete(*(CFDictionaryRef *)(*((void *)&v21 + 1) + 8 * i));
        if (v13)
        {
          v20 = 0;
          sub_100012A40(v13, &v20, @"failed to delete corrupted item");
          v14 = v20;
          [v7 addObject:v20];

          BOOL v6 = 0;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v10);
  }

  if (a3 && (v5 || [v7 count]))
  {
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    v15 = [v5 userInfo];
    v16 = [v15 objectForKeyedSubscript:@"searchingErrorCount"];
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"encountered %@ errors searching for corrupted items and %d errors attempting to delete corrupted items", v16, [v7 count]);
    v27 = v17;
    v18 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    *a3 = +[NSError errorWithDomain:@"com.apple.security.keychainhealth" code:2 userInfo:v18];
  }
  return v6;
}

- (id)findCorruptedItemsWithError:(id *)a3
{
  id v22 = objc_alloc_init((Class)NSMutableArray);
  id v3 = objc_alloc_init((Class)NSMutableArray);
  CFTypeRef result = 0;
  v44[0] = kSecClass;
  v44[1] = kSecReturnPersistentRef;
  v45[0] = kSecClassGenericPassword;
  v45[1] = &__kCFBooleanTrue;
  v44[2] = kSecUseDataProtectionKeychain;
  v44[3] = kSecMatchLimit;
  v45[2] = &__kCFBooleanTrue;
  v45[3] = kSecMatchLimitAll;
  CFDictionaryRef v24 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:4];
  OSStatus v4 = SecItemCopyMatching(v24, &result);
  v34 = 0;
  if (v4 != -25300)
  {
    sub_100012A40(v4, &v34, @"generic password query failed");
    id v5 = v34;
    if (v34)
    {
      [v3 addObject:v34];
    }
  }
  CFTypeRef v33 = 0;
  v42[0] = kSecClass;
  v42[1] = kSecReturnPersistentRef;
  v43[0] = kSecClassInternetPassword;
  v43[1] = &__kCFBooleanTrue;
  v42[2] = kSecUseDataProtectionKeychain;
  v42[3] = kSecMatchLimit;
  v43[2] = &__kCFBooleanTrue;
  v43[3] = kSecMatchLimitAll;
  CFDictionaryRef v23 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:4];
  OSStatus v6 = SecItemCopyMatching(v23, &v33);
  v32 = 0;
  if (v6 != -25300)
  {
    sub_100012A40(v6, &v32, @"internet password query failed");
    id v7 = v32;
    if (v32)
    {
      [v3 addObject:v32];
    }
  }
  CFTypeRef v31 = 0;
  v40[0] = kSecClass;
  v40[1] = kSecReturnPersistentRef;
  v41[0] = kSecClassKey;
  v41[1] = &__kCFBooleanTrue;
  v40[2] = kSecUseDataProtectionKeychain;
  v40[3] = kSecMatchLimit;
  v41[2] = &__kCFBooleanTrue;
  v41[3] = kSecMatchLimitAll;
  CFDictionaryRef v21 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:4];
  SecItemCopyMatching(v21, &v31);
  CFTypeRef v30 = 0;
  v38[0] = kSecClass;
  v38[1] = kSecReturnPersistentRef;
  v39[0] = kSecClassCertificate;
  v39[1] = &__kCFBooleanTrue;
  v38[2] = kSecUseDataProtectionKeychain;
  v38[3] = kSecMatchLimit;
  v39[2] = &__kCFBooleanTrue;
  v39[3] = kSecMatchLimitAll;
  CFDictionaryRef v8 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
  OSStatus v9 = SecItemCopyMatching(v8, &v30);
  OSStatus v10 = v9;
  v29 = 0;
  if (v9 != -25300)
  {
    sub_100012A40(v9, &v29, @"certificate query failed");
    uint64_t v11 = v29;
    if (v29)
    {
      [v3 addObject:v29];
    }
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100074920;
  v26[3] = &unk_1002F8700;
  OSStatus v28 = v10;
  id v12 = v22;
  id v27 = v12;
  OSStatus v13 = objc_retainBlock(v26);
  ((void (*)(void *, CFTypeRef, const CFStringRef))v13[2])(v13, result, kSecClassGenericPassword);
  ((void (*)(void *, CFTypeRef, const CFStringRef))v13[2])(v13, v33, kSecClassInternetPassword);
  ((void (*)(void *, CFTypeRef, const CFStringRef))v13[2])(v13, v31, kSecClassKey);
  ((void (*)(void *, CFTypeRef, const CFStringRef))v13[2])(v13, v30, kSecClassCertificate);
  id v14 = [v3 count];
  if (a3 && v14)
  {
    v36[0] = NSLocalizedDescriptionKey;
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"encountered %d errors searching for corrupted items", [v3 count]);
    v37[0] = v15;
    v36[1] = NSUnderlyingErrorKey;
    v16 = [v3 firstObject];
    v37[1] = v16;
    v36[2] = @"searchingErrorCount";
    v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 count]);
    v37[2] = v17;
    v18 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
    *a3 = +[NSError errorWithDomain:@"com.apple.security.keychainhealth" code:1 userInfo:v18];
  }
  id v19 = v12;

  return v19;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  OSStatus v6 = [v5 valueForEntitlement:@"com.apple.private.keychain.keychaincontrol"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 BOOLValue])
  {
    id v7 = +[SecXPCHelper safeErrorClasses];
    CFDictionaryRef v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFKeychainControl];
    BOOL v9 = 1;
    [v8 setClasses:v7 forSelector:"rpcFindCorruptedItemsWithReply:" argumentIndex:1 ofReply:1];
    [v8 setClasses:v7 forSelector:"rpcDeleteCorruptedItemsWithReply:" argumentIndex:1 ofReply:1];
    [v5 setExportedInterface:v8];
    [v5 setExportedObject:self];
    [v5 resume];
  }
  else
  {
    OSStatus v10 = sub_10000B070("SecError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109378;
      v12[1] = [v5 processIdentifier];
      __int16 v13 = 2112;
      CFStringRef v14 = @"com.apple.private.keychain.keychaincontrol";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SFKeychainControl: Client pid (%d) doesn't have entitlement: %@", (uint8_t *)v12, 0x12u);
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (id)xpcControlEndpoint
{
  v2 = [(NSXPCListener *)self->_listener endpoint];
  id v3 = [v2 _endpoint];

  return v3;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)SFKeychainControlManager;
  v2 = [(SFKeychainControlManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSXPCListener anonymousListener];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

+ (id)sharedManager
{
  if (qword_10035CD68 != -1) {
    dispatch_once(&qword_10035CD68, &stru_1002F86D8);
  }
  v2 = (void *)qword_10035CD60;

  return v2;
}

@end