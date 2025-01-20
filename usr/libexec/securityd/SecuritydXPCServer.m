@interface SecuritydXPCServer
- (BOOL)clientHasBooleanEntitlement:(id)a3;
- (NSXPCConnection)connection;
- (SecuritydXPCServer)initWithConnection:(id)a3;
- (SecuritydXPCServer)initWithSecurityClient:(SecurityClient *)a3;
- (void)SecItemAddAndNotifyOnSync:(id)a3 syncCallback:(id)a4 complete:(id)a5;
- (void)dealloc;
- (void)findItemPersistentRefByUUID:(id)a3 extraLoggingString:(id)a4 client:(SecurityClient *)a5 complete:(id)a6;
- (void)secItemDeleteForAppClipApplicationIdentifier:(id)a3 completion:(id)a4;
- (void)secItemDigest:(id)a3 accessGroup:(id)a4 complete:(id)a5;
- (void)secItemFetchCurrentItemAcrossAllDevices:(id)a3 identifier:(id)a4 viewHint:(id)a5 fetchCloudValue:(BOOL)a6 complete:(id)a7;
- (void)secItemFetchCurrentItemOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5;
- (void)secItemFetchPCSIdentityByKeyOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5;
- (void)secItemPersistKeychainWritesAtHighPerformanceCost:(id)a3;
- (void)secItemPromoteItemsForAppClip:(id)a3 toParentApp:(id)a4 completion:(id)a5;
- (void)secItemSetCurrentItemAcrossAllDevices:(id)a3 newCurrentItemHash:(id)a4 accessGroup:(id)a5 identifier:(id)a6 viewHint:(id)a7 oldCurrentItemReference:(id)a8 oldCurrentItemHash:(id)a9 complete:(id)a10;
- (void)secItemUnsetCurrentItemsAcrossAllDevices:(id)a3 identifiers:(id)a4 viewHint:(id)a5 complete:(id)a6;
- (void)secKeychainDeleteMultiuser:(id)a3 complete:(id)a4;
- (void)secKeychainForceUpgradeIfNeeded:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation SecuritydXPCServer

- (void)secKeychainForceUpgradeIfNeeded:(id)a3
{
  uint64_t v7 = 0;
  v3 = (void (**)(id, uint64_t))a3;
  v4 = sub_10000B070("secKeychainForceUpgradeIfNeeded");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Performing keychain database upgrade if needed", buf, 2u);
  }

  if (sub_10000CBA4(0, 1, 0, (uint64_t)&v7, (uint64_t)&stru_1002F71E8))
  {
    v5 = sub_10000B070("secKeychainForceUpgradeIfNeeded");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "succeeded", buf, 2u);
    }
    uint64_t v6 = 0;
  }
  else
  {
    v5 = sub_10000B070("SecError");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "secKeychainForceUpgradeIfNeeded: failed: %@", buf, 0xCu);
    }
    uint64_t v6 = 4294941020;
  }

  v3[2](v3, v6);
}

- (void)secItemPromoteItemsForAppClip:(id)a3 toParentApp:(id)a4 completion:(id)a5
{
  id v35 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t))a5;
  if ([(SecuritydXPCServer *)self clientHasBooleanEntitlement:@"com.apple.private.keychain.appclipdeletion"])
  {
    v10 = sub_10000B070("item");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v35;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Request to promote keychain items for app clip '%@' to parent app '%@'", buf, 0x16u);
    }
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2000000000;
    uint64_t v47 = 0;
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2000000000;
    char v43 = 1;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2000000000;
    v39 = (__CFDictionary *)0xAAAAAAAAAAAAAAAALL;
    v39 = sub_100105AF4(kCFAllocatorDefault, v11, v12, v13, v14, v15, v16, v17, (void *)kSecAttrAccessGroup, (uint64_t)v35);
    CFDictionaryRef v25 = sub_100139704(kCFAllocatorDefault, v18, v19, v20, v21, v22, v23, v24, @"clip", (uint64_t)kCFBooleanFalse);
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 0x40000000;
    *(void *)&buf[16] = sub_10013B36C;
    v51 = &unk_1002FBCC8;
    v52 = &v44;
    v53 = &v36;
    v54 = &v40;
    CFDictionaryRef v55 = v25;
    char v26 = sub_10000CBA4(1, 1, 0, (uint64_t)(v45 + 3), (uint64_t)buf);
    if (*((unsigned char *)v41 + 24)) {
      char v27 = v26;
    }
    else {
      char v27 = 0;
    }
    *((unsigned char *)v41 + 24) = v27;
    v28 = (const void *)v37[3];
    if (v28)
    {
      v37[3] = 0;
      CFRelease(v28);
    }
    if (v25) {
      CFRelease(v25);
    }
    int v29 = *((unsigned __int8 *)v41 + 24);
    v30 = sub_10000B070("item");
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v31)
      {
        *(_WORD *)v48 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Promotion reports success, now deleting leftover app clip items", v48, 2u);
      }
      uint64_t Code = sub_10013AF1C((uint64_t)v35);
    }
    else
    {
      if (v31)
      {
        uint64_t v33 = v45[3];
        *(_DWORD *)v48 = 138412290;
        uint64_t v49 = v33;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "App clip item promotion failed: %@", v48, 0xCu);
      }
      uint64_t Code = CFErrorGetCode((CFErrorRef)v45[3]);
      v34 = (const void *)v45[3];
      if (v34)
      {
        v45[3] = 0;
        CFRelease(v34);
      }
    }
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
  }
  else
  {
    uint64_t Code = 4294933278;
  }
  v9[2](v9, Code);
}

- (void)secItemPersistKeychainWritesAtHighPerformanceCost:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  if ([(SecuritydXPCServer *)self clientHasBooleanEntitlement:@"com.apple.private.keychain.performance_impacting_api"])
  {
    uint64_t v12 = 0;
    int v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    v5 = sub_10000B070("item");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Performing keychain database checkpoint", buf, 2u);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000217B4;
    v11[3] = &unk_1002F71A8;
    v11[4] = &v12;
    if (sub_10000CBA4(1, 1, 0, (uint64_t)(v13 + 3), (uint64_t)v11))
    {
      uint64_t v6 = sub_10000B070("item");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Keychain database checkpoint succeeded", buf, 2u);
      }
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v6 = sub_10000B070("SecError");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = v13[3];
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "item: keychain database checkpoint failed: %@", buf, 0xCu);
      }
      uint64_t v7 = 4294941020;
    }

    v4[2](v4, v7, v13[3]);
    v10 = (const void *)v13[3];
    if (v10)
    {
      v13[3] = 0;
      CFRelease(v10);
    }
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-34018 userInfo:0];
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 4294933278, v8);
  }
}

- (void)secItemDeleteForAppClipApplicationIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  if ([(SecuritydXPCServer *)self clientHasBooleanEntitlement:@"com.apple.private.keychain.appclipdeletion"])
  {
    uint64_t v7 = sub_10013AF1C((uint64_t)v8);
  }
  else
  {
    uint64_t v7 = 4294933278;
  }
  v6[2](v6, v7);
}

- (void)secKeychainDeleteMultiuser:(id)a3 complete:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, __CFString *))a4;
  uint64_t v16 = 0;
  uint64_t v17 = (__CFString **)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  if ([(SecuritydXPCServer *)self clientHasBooleanEntitlement:@"com.apple.keychain.multiuser-admin"])
  {
    sub_100012A40(-25291, v17 + 3, @"secKeychainDeleteMultiuser: %@ need entitlement %@", self->_client.task, @"com.apple.keychain.multiuser-admin");
    v7[2](v7, 0, v17[3]);
    id v8 = v17[3];
    if (v8) {
      goto LABEL_9;
    }
  }
  else
  {
    id v9 = [v6 length];
    v10 = v17;
    if (v9 == (id)16)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100021ABC;
      v13[3] = &unk_1002F7180;
      id v14 = v6;
      uint64_t v15 = &v16;
      uint64_t v11 = sub_10000CBA4(1, 1, 0, (uint64_t)(v10 + 3), (uint64_t)v13);
      v7[2](v7, v11, v17[3]);
      uint64_t v12 = v17[3];
      if (v12)
      {
        v17[3] = 0;
        CFRelease(v12);
      }
    }
    else
    {
      sub_100012A40(-25291, v17 + 3, @"secKeychainDeleteMultiuser: %@ uuid have wrong length: %d", self->_client.task, [v6 length]);
      v7[2](v7, 0, v17[3]);
      id v8 = v17[3];
      if (v8)
      {
LABEL_9:
        v17[3] = 0;
        CFRelease(v8);
      }
    }
  }
  _Block_object_dispose(&v16, 8);
}

- (void)secItemDigest:(id)a3 accessGroup:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  v10 = (void (**)(id, void, __CFString *))a5;
  p_client = &self->_client;
  accessGroups = self->_client.accessGroups;
  uint64_t v34 = 0;
  id v35 = (__CFString **)&v34;
  uint64_t v36 = 0x2020000000;
  v37 = 0;
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  if (!v8 || !v9)
  {
    sub_100012A40(-50, &v37, @"parameter missing: %@", p_client->task);
    v10[2](v10, 0, v35[3]);
    uint64_t v15 = v35[3];
    if (!v15) {
      goto LABEL_38;
    }
LABEL_18:
    v35[3] = 0;
    CFRelease(v15);
    goto LABEL_38;
  }
  if (([v8 isEqualToString:@"inet"] & 1) == 0
    && ([v8 isEqualToString:@"genp"] & 1) == 0)
  {
    sub_100012A40(-50, v35 + 3, @"class %@ is not supported: %@", v8, p_client->task);
    v10[2](v10, 0, v35[3]);
    uint64_t v15 = v35[3];
    if (!v15) {
      goto LABEL_38;
    }
    goto LABEL_18;
  }
  if ((sub_10000C1A8(accessGroups, v9, (uint64_t)p_client) & 1) == 0)
  {
    sub_100012A40(-34018, v35 + 3, @"Client is missing access-group %@: %@", v9, p_client->task);
    v10[2](v10, 0, v35[3]);
    uint64_t v15 = v35[3];
    if (!v15) {
      goto LABEL_38;
    }
    goto LABEL_18;
  }
  v40.length = CFArrayGetCount(accessGroups);
  v40.location = 0;
  if (CFArrayContainsValue(accessGroups, v40, @"*")) {
    int v13 = 0;
  }
  else {
    int v13 = accessGroups;
  }
  v38[0] = kSecClass;
  v38[1] = kSecAttrAccessGroup;
  v39[0] = v8;
  v39[1] = v9;
  v38[2] = kSecAttrSynchronizable;
  v38[3] = kSecReturnPersistentRef;
  v39[2] = kSecAttrSynchronizableAny;
  v39[3] = &__kCFBooleanTrue;
  CFDictionaryRef v14 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  *(_OWORD *)cf = 0u;
  if (qword_10035D098 != -1) {
    dispatch_once(&qword_10035D098, &stru_100303AB8);
  }
  if (byte_10035D090)
  {
    SecSecurityFixUpClientWithPersona();
  }
  else
  {
    long long v16 = *(_OWORD *)&p_client->allowSystemKeychain;
    long long v26 = *(_OWORD *)&p_client->task;
    *(_OWORD *)cf = v16;
    long long v17 = *(_OWORD *)&p_client->applicationIdentifier;
    long long v28 = *(_OWORD *)&p_client->keybag;
    long long v29 = v17;
  }
  uint64_t v18 = sub_10000C3CC(v14, cf[1], 0, (uint64_t)&v26, v35 + 3);
  if (v18)
  {
    uint64_t v19 = (const void **)v18;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10002200C;
    v25[3] = &unk_1002F7158;
    v25[6] = v18;
    v25[7] = v13;
    v25[4] = &v30;
    v25[5] = &v34;
    sub_10000CBA4(0, 1, 0, (uint64_t)(v35 + 3), (uint64_t)v25);
    v10[2](v10, v31[3], v35[3]);
    sub_10000C2C4(v19, (CFErrorRef *)v35 + 3);
    int v20 = (const void *)v31[3];
    if (v20)
    {
      v31[3] = 0;
      CFRelease(v20);
    }
    int v21 = v35[3];
    if (v21)
    {
      v35[3] = 0;
      CFRelease(v21);
    }
    if (qword_10035D098 != -1) {
      dispatch_once(&qword_10035D098, &stru_100303AB8);
    }
    if (byte_10035D090)
    {
      CFTypeRef v22 = cf[1];
      if (cf[1])
      {
        cf[1] = 0;
        CFRelease(v22);
      }
    }
  }
  else
  {
    sub_100012A40(-50, v35 + 3, @"failed to build query: %@", (void)v26);
    v10[2](v10, 0, v35[3]);
    int v23 = v35[3];
    if (v23)
    {
      v35[3] = 0;
      CFRelease(v23);
    }
    if (qword_10035D098 != -1) {
      dispatch_once(&qword_10035D098, &stru_100303AB8);
    }
    if (byte_10035D090)
    {
      CFTypeRef v24 = cf[1];
      if (cf[1])
      {
        cf[1] = 0;
        CFRelease(v24);
      }
    }
  }

LABEL_38:
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
}

- (void)findItemPersistentRefByUUID:(id)a3 extraLoggingString:(id)a4 client:(SecurityClient *)a5 complete:(id)a6
{
  id v21 = a3;
  id v20 = a4;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100022400;
  v24[3] = &unk_1002F7130;
  id v19 = a6;
  id v25 = v19;
  uint64_t v18 = objc_retainBlock(v24);
  CFTypeRef v22 = 0;
  CFTypeRef cf = 0;
  id v9 = &off_1002FE3E8;
  v10 = off_100300578;
  uint64_t v11 = kSecAttrUUID;
  while (1)
  {
    if (*((unsigned char *)v9 + 8))
    {
      CFTypeRef v12 = cf;
      if (cf)
      {
        CFTypeRef cf = 0;
        CFRelease(v12);
      }
      v34[0] = kSecClass;
      v35[0] = **(v10 - 1);
      v35[1] = kSecAttrSynchronizableAny;
      v34[1] = kSecAttrSynchronizable;
      v34[2] = kSecMatchLimit;
      v35[2] = kSecMatchLimitOne;
      v35[3] = v21;
      v34[3] = v11;
      v34[4] = kSecReturnPersistentRef;
      v35[4] = &__kCFBooleanTrue;
      sub_10000BA20((const __CFDictionary *)+[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:5], (uint64_t)a5, (uint64_t *)&v22, (__CFString **)&cf);
      if (!cf)
      {
        if (v22) {
          goto LABEL_15;
        }
        goto LABEL_10;
      }
      if (CFErrorGetCode((CFErrorRef)cf) != -25300 || v22) {
        break;
      }
    }
LABEL_10:
    int v13 = *v10++;
    id v9 = v13;
    if (!v13) {
      goto LABEL_11;
    }
  }
  if (!v22 || cf)
  {
LABEL_11:
    CFDictionaryRef v14 = sub_10000B070("SecError");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v15 = v20;
      id v27 = v20;
      __int16 v28 = 2112;
      id v29 = v21;
      __int16 v30 = 2112;
      CFTypeRef v31 = v22;
      __int16 v32 = 2112;
      CFTypeRef v33 = cf;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ckkscurrent: No current item for (%@,%@): %@ %@", buf, 0x2Au);
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_15:
  CFDictionaryRef v14 = sub_10000B070("ckkscurrent");
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
LABEL_16:
    uint64_t v15 = v20;
    goto LABEL_17;
  }
  *(_DWORD *)buf = 138412546;
  uint64_t v15 = v20;
  id v27 = v20;
  __int16 v28 = 2112;
  id v29 = v21;
  _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Found current item for (%@: %@)", buf, 0x16u);
LABEL_17:

  ((void (*)(void *, CFTypeRef, CFTypeRef))v18[2])(v18, v22, cf);
  CFTypeRef v16 = v22;
  if (v22)
  {
    CFTypeRef v22 = 0;
    CFRelease(v16);
  }
  CFTypeRef v17 = cf;
  if (cf)
  {
    CFTypeRef cf = 0;
    CFRelease(v17);
  }
}

- (void)secItemFetchPCSIdentityByKeyOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100022808;
  v28[3] = &unk_1002FB260;
  id v9 = a5;
  id v29 = v9;
  v10 = objc_retainBlock(v28);
  CFTypeRef cf = 0;
  if (![(SecuritydXPCServer *)self clientHasBooleanEntitlement:@"com.apple.private.keychain.deny"])
  {
    if ([v8 count])
    {
      CFTypeRef v12 = [v8 objectAtIndexedSubscript:0];
      int v13 = [v12 accessGroup];

      if (v13 && (sub_10000C1A8(self->_client.accessGroups, v13, (uint64_t)&self->_client) & 1) == 0)
      {
        sub_100012A40(-34018, (__CFString **)&cf, @"secItemFetchPCSIdentityByKeyOutOfBand: client is missing access-group %@: %@", v13, self->_client.task);
        ((void (*)(void *, void, CFTypeRef))v10[2])(v10, 0, cf);
        CFTypeRef v14 = cf;
        if (cf)
        {
          CFTypeRef cf = 0;
          CFRelease(v14);
        }
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      int v13 = 0;
    }
    uint64_t v15 = +[CKKSViewManager manager];
    CFTypeRef v16 = [v15 completedSecCKKSInitialize];
    id v17 = [v16 wait:10];

    if (v17)
    {
      uint64_t v18 = sub_10000B070("SecError");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "secItemFetchPCSIdentityByKeyOutOfBand: CKKSViewManager not initialized?", buf, 2u);
      }

      id v19 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:9 description:@"CKKS not yet initialized"];
      ((void (*)(void *, void, void *))v10[2])(v10, 0, v19);
    }
    else
    {
      if (qword_10035D098 != -1) {
        dispatch_once(&qword_10035D098, &stru_100303AB8);
      }
      if (byte_10035D090)
      {
        p_client = malloc_type_malloc(0x40uLL, 0x1060040B1A58C1AuLL);
        SecSecurityFixUpClientWithPersona();
      }
      else
      {
        p_client = &self->_client;
      }
      id v21 = +[CKKSViewManager manager];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100022884;
      v22[3] = &unk_1002F7108;
      id v23 = v8;
      CFTypeRef v24 = v10;
      id v25 = p_client;
      [v21 fetchPCSIdentityOutOfBand:v23 forceFetch:v6 complete:v22];
    }
    goto LABEL_20;
  }
  sub_100012A40(-25291, (__CFString **)&cf, @"secItemFetchPCSIdentityByKeyOutOfBand: %@ has entitlement %@", self->_client.task, @"com.apple.private.keychain.deny");
  ((void (*)(void *, void, CFTypeRef))v10[2])(v10, 0, cf);
  CFTypeRef v11 = cf;
  if (cf)
  {
    CFTypeRef cf = 0;
    CFRelease(v11);
  }
LABEL_21:
}

- (void)secItemFetchCurrentItemOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100022DA8;
  v28[3] = &unk_1002FB260;
  id v9 = a5;
  id v29 = v9;
  v10 = objc_retainBlock(v28);
  CFTypeRef cf = 0;
  if ([(SecuritydXPCServer *)self clientHasBooleanEntitlement:@"com.apple.private.keychain.deny"])
  {
    sub_100012A40(-25291, (__CFString **)&cf, @"secItemFetchCurrentItemOutOfBand: %@ has entitlement %@", self->_client.task, @"com.apple.private.keychain.deny");
    goto LABEL_10;
  }
  if ([(SecuritydXPCServer *)self clientHasBooleanEntitlement:@"com.apple.private.ckks.currentitempointers_read"])
  {
    if ([v8 count])
    {
      CFTypeRef v11 = [v8 objectAtIndexedSubscript:0];
      CFTypeRef v12 = [v11 accessGroup];

      if (v12 && (sub_10000C1A8(self->_client.accessGroups, v12, (uint64_t)&self->_client) & 1) == 0)
      {
        sub_100012A40(-34018, (__CFString **)&cf, @"secItemFetchCurrentItemOutOfBand: client is missing access-group %@: %@", v12, self->_client.task);
        ((void (*)(void *, void, CFTypeRef))v10[2])(v10, 0, cf);
        CFTypeRef v13 = cf;
        if (cf)
        {
          CFTypeRef cf = 0;
          CFRelease(v13);
        }
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      CFTypeRef v12 = 0;
    }
    uint64_t v15 = +[CKKSViewManager manager];
    CFTypeRef v16 = [v15 completedSecCKKSInitialize];
    id v17 = [v16 wait:10];

    if (v17)
    {
      uint64_t v18 = sub_10000B070("SecError");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "secItemFetchCurrentItemOutOfBand: CKKSViewManager not initialized?", buf, 2u);
      }

      id v19 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:9 description:@"CKKS not yet initialized"];
      ((void (*)(void *, void, void *))v10[2])(v10, 0, v19);
    }
    else
    {
      if (qword_10035D098 != -1) {
        dispatch_once(&qword_10035D098, &stru_100303AB8);
      }
      if (byte_10035D090)
      {
        p_client = malloc_type_malloc(0x40uLL, 0x1060040B1A58C1AuLL);
        SecSecurityFixUpClientWithPersona();
      }
      else
      {
        p_client = &self->_client;
      }
      id v21 = +[CKKSViewManager manager];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100022E24;
      v22[3] = &unk_1002F7108;
      id v23 = v8;
      CFTypeRef v24 = v10;
      id v25 = p_client;
      [v21 getCurrentItemOutOfBand:v23 forceFetch:v6 complete:v22];
    }
    goto LABEL_23;
  }
  sub_100012A40(-25291, (__CFString **)&cf, @"secItemFetchCurrentItemOutOfBand: %@ does not have entitlement %@", self->_client.task, @"com.apple.private.ckks.currentitempointers_read");
LABEL_10:
  ((void (*)(void *, void, CFTypeRef))v10[2])(v10, 0, cf);
  CFTypeRef v14 = cf;
  if (cf)
  {
    CFTypeRef cf = 0;
    CFRelease(v14);
  }
LABEL_24:
}

- (void)secItemFetchCurrentItemAcrossAllDevices:(id)a3 identifier:(id)a4 viewHint:(id)a5 fetchCloudValue:(BOOL)a6 complete:(id)a7
{
  BOOL v8 = a6;
  CFTypeRef v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = a5;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10002332C;
  v35[3] = &unk_1002F7090;
  id v15 = a7;
  id v36 = v15;
  CFTypeRef v16 = objc_retainBlock(v35);
  CFTypeRef cf = 0;
  if ([(SecuritydXPCServer *)self clientHasBooleanEntitlement:@"com.apple.private.keychain.deny"])
  {
    sub_100012A40(-25291, (__CFString **)&cf, @"SecItemFetchCurrentItemAcrossAllDevices: %@ has entitlement %@", self->_client.task, @"com.apple.private.keychain.deny");
    goto LABEL_10;
  }
  p_client = &self->_client;
  if (![(SecuritydXPCServer *)self clientHasBooleanEntitlement:@"com.apple.private.ckks.currentitempointers_read"])
  {
    sub_100012A40(-25291, (__CFString **)&cf, @"SecItemFetchCurrentItemAcrossAllDevices: %@ does not have entitlement %@", p_client->task, @"com.apple.private.ckks.currentitempointers_read");
    goto LABEL_10;
  }
  if ((sub_10000C1A8(self->_client.accessGroups, v12, (uint64_t)&self->_client) & 1) == 0)
  {
    sub_100012A40(-34018, (__CFString **)&cf, @"SecItemFetchCurrentItemAcrossAllDevices: client is missing access-group %@: %@", v12, p_client->task);
LABEL_10:
    ((void (*)(void *, void, void, CFTypeRef))v16[2])(v16, 0, 0, cf);
    CFTypeRef v23 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v23);
    }
    goto LABEL_12;
  }
  BOOL v26 = v8;
  uint64_t v18 = +[CKKSViewManager manager];
  id v19 = [v18 completedSecCKKSInitialize];
  id v20 = [v19 wait:10];

  if (v20)
  {
    id v21 = sub_10000B070("SecError");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SecItemFetchCurrentItemAcrossAllDevices: CKKSViewManager not initialized?", buf, 2u);
    }

    CFTypeRef v22 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:9 description:@"CKKS not yet initialized"];
    ((void (*)(void *, void, void, void *))v16[2])(v16, 0, 0, v22);
  }
  else
  {
    if (qword_10035D098 != -1) {
      dispatch_once(&qword_10035D098, &stru_100303AB8);
    }
    if (byte_10035D090)
    {
      CFTypeRef v24 = (SecurityClient *)malloc_type_malloc(0x40uLL, 0x1060040B1A58C1AuLL);
      SecSecurityFixUpClientWithPersona();
      p_client = v24;
    }
    id v25 = +[CKKSViewManager manager];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000233BC;
    v27[3] = &unk_1002F70E0;
    __int16 v28 = v12;
    id v29 = v13;
    CFTypeRef v31 = v16;
    __int16 v32 = p_client;
    __int16 v30 = self;
    [v25 getCurrentItemForAccessGroup:v28 identifier:v29 viewHint:v14 fetchCloudValue:v26 complete:v27];
  }
LABEL_12:
}

- (void)secItemUnsetCurrentItemsAcrossAllDevices:(id)a3 identifiers:(id)a4 viewHint:(id)a5 complete:(id)a6
{
  v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100023A74;
  v30[3] = &unk_1002FB1E8;
  id v13 = a6;
  id v31 = v13;
  id v14 = objc_retainBlock(v30);
  CFTypeRef cf = 0;
  if ([(SecuritydXPCServer *)self clientHasBooleanEntitlement:@"com.apple.private.keychain.deny"])
  {
    sub_100012A40(-25291, (__CFString **)&cf, @"SecItemUnsetCurrentItemsAcrossAllDevices: %@ has entitlement %@", self->_client.task, @"com.apple.private.keychain.deny");
    goto LABEL_13;
  }
  p_client = &self->_client;
  if ([(SecuritydXPCServer *)self clientHasBooleanEntitlement:@"com.apple.private.ckks.currentitempointers_write"])
  {
    if (sub_10000C1A8(self->_client.accessGroups, v10, (uint64_t)&self->_client))
    {
      CFTypeRef v16 = +[CKKSViewManager manager];
      id v17 = v16;
      if (v16)
      {
        uint64_t v18 = [v16 completedSecCKKSInitialize];
        id v19 = [v18 wait:10];

        if (!v19)
        {
          [v17 unsetCurrentItemsForAccessGroup:v10 identifiers:v11 viewHint:v12 complete:v14];
          goto LABEL_21;
        }
        id v20 = sub_10000B070("SecError");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SecItemUnsetCurrentItemsAcrossAllDevices: CKKSViewManager not initialized?", buf, 2u);
        }

        CFStringRef v21 = @"CKKS not yet initialized";
      }
      else
      {
        CFTypeRef v24 = sub_10000B070("SecError");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "SecItemUnsetCurrentItemsAcrossAllDevices: no view manager?", buf, 2u);
        }

        CFStringRef v21 = @"No view manager, cannot forward request";
      }
      id v25 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:9 description:v21];
      ((void (*)(void *, void *))v14[2])(v14, v25);

LABEL_21:
      goto LABEL_15;
    }
    BOOL v26 = v10;
    CFStringRef task = (const __CFString *)p_client->task;
    CFStringRef v22 = @"SecItemUnsetCurrentItemsAcrossAllDevices: client is missing access-group %@: %@";
  }
  else
  {
    BOOL v26 = p_client->task;
    CFStringRef task = @"com.apple.private.ckks.currentitempointers_write";
    CFStringRef v22 = @"SecItemUnsetCurrentItemsAcrossAllDevices: %@ does not have entitlement %@";
  }
  sub_100012A40(-34018, (__CFString **)&cf, v22, v26, task);
LABEL_13:
  ((void (*)(void *, CFTypeRef))v14[2])(v14, cf);
  CFTypeRef v23 = cf;
  if (cf)
  {
    CFTypeRef cf = 0;
    CFRelease(v23);
  }
LABEL_15:
}

- (void)secItemSetCurrentItemAcrossAllDevices:(id)a3 newCurrentItemHash:(id)a4 accessGroup:(id)a5 identifier:(id)a6 viewHint:(id)a7 oldCurrentItemReference:(id)a8 oldCurrentItemHash:(id)a9 complete:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  CFStringRef v39 = (const __CFString *)a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100023EC8;
  v42[3] = &unk_1002FB1E8;
  id v22 = a10;
  id v43 = v22;
  CFTypeRef v23 = objc_retainBlock(v42);
  CFTypeRef cf = 0;
  if ([(SecuritydXPCServer *)self clientHasBooleanEntitlement:@"com.apple.private.keychain.deny"])
  {
    sub_100012A40(-25291, (__CFString **)&cf, @"SecItemSetCurrentItemAcrossAllDevices: %@ has entitlement %@", self->_client.task, @"com.apple.private.keychain.deny");
    ((void (*)(void *, CFTypeRef))v23[2])(v23, cf);
    CFTypeRef v24 = cf;
    id v25 = (__CFString *)v39;
    if (!cf) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  id v38 = v21;
  id v26 = v19;
  p_client = &self->_client;
  if ([(SecuritydXPCServer *)self clientHasBooleanEntitlement:@"com.apple.private.ckks.currentitempointers_write"])
  {
    accessGroups = self->_client.accessGroups;
    id v25 = (__CFString *)v39;
    if (sub_10000C1A8(accessGroups, v39, (uint64_t)p_client))
    {
      id v29 = +[CKKSViewManager manager];
      __int16 v30 = [v29 completedSecCKKSInitialize];
      id v31 = [v30 wait:10];

      if (v31)
      {
        __int16 v32 = sub_10000B070("SecError");
        id v19 = v26;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "SecItemSetCurrentItemAcrossAllDevices: CKKSViewManager not initialized?", buf, 2u);
        }

        CFTypeRef v33 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:9 description:@"CKKS not yet initialized"];
        ((void (*)(void *, void *))v23[2])(v23, v33);

        id v21 = v38;
        id v25 = (__CFString *)v39;
      }
      else
      {
        uint64_t v34 = +[CKKSViewManager manager];
        id v35 = v34;
        id v19 = v26;
        if (v34)
        {
          id v21 = v38;
          [v34 setCurrentItemForAccessGroup:v16 hash:v17 accessGroup:v39 identifier:v18 viewHint:v19 replacing:v20 hash:v38 complete:v23];
        }
        else
        {
          id v36 = sub_10000B070("SecError");
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "SecItemSetCurrentItemAcrossAllDevices: no view manager?", buf, 2u);
          }

          v37 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:9 description:@"No view manager, cannot forward request"];
          ((void (*)(void *, void *))v23[2])(v23, v37);

          id v21 = v38;
        }

        id v25 = (__CFString *)v39;
      }
      goto LABEL_14;
    }
    sub_100012A40(-34018, (__CFString **)&cf, @"SecItemSetCurrentItemAcrossAllDevices: client is missing access-group %@: %@", v39, p_client->task);
    ((void (*)(void *, CFTypeRef))v23[2])(v23, cf);
    CFTypeRef v24 = cf;
  }
  else
  {
    sub_100012A40(-34018, (__CFString **)&cf, @"SecItemSetCurrentItemAcrossAllDevices: %@ does not have entitlement %@", p_client->task, @"com.apple.private.ckks.currentitempointers_write");
    ((void (*)(void *, CFTypeRef))v23[2])(v23, cf);
    CFTypeRef v24 = cf;
    id v25 = (__CFString *)v39;
  }
  id v21 = v38;
  if (v24)
  {
LABEL_13:
    CFTypeRef cf = 0;
    CFRelease(v24);
  }
LABEL_14:
}

- (void)SecItemAddAndNotifyOnSync:(id)a3 syncCallback:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10002446C;
  v41[3] = &unk_1002F7040;
  id v10 = a5;
  id v42 = v10;
  id v11 = objc_retainBlock(v41);
  CFTypeRef cf = 0;
  if ([(SecuritydXPCServer *)self clientHasBooleanEntitlement:@"com.apple.private.keychain.deny"])
  {
    sub_100012A40(-25291, (__CFString **)&cf, @"SecItemAddAndNotifyOnSync: %@ has entitlement %@", self->_client.task, @"com.apple.private.keychain.deny");
    goto LABEL_21;
  }
  id v12 = +[CKKSViewManager manager];
  id v13 = [v12 completedSecCKKSInitialize];
  [v13 wait:10];

  id v14 = [v8 objectForKeyedSubscript:kSecAttrDeriveSyncIDFromItemAttributes];
  if (v14
    || ([v8 objectForKeyedSubscript:kSecAttrPCSPlaintextServiceIdentifier],
        (id v14 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v8 objectForKeyedSubscript:kSecAttrPCSPlaintextPublicKey],
        (id v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    __int16 v30 = [v8 objectForKeyedSubscript:kSecAttrPCSPlaintextPublicIdentity];

    if (!v30) {
      goto LABEL_8;
    }
  }
  if (![(SecuritydXPCServer *)self clientHasBooleanEntitlement:@"com.apple.private.ckks.plaintextfields"])
  {
    sub_100012A40(-34018, (__CFString **)&cf, @"SecItemAddAndNotifyOnSync: %@ does not have entitlement %@, but is using SPI anyway", self->_client.task, @"com.apple.private.ckks.plaintextfields");
    goto LABEL_21;
  }
LABEL_8:
  id v15 = [v8 objectForKeyedSubscript:kSecDataInetExtraNotes];
  if (v15) {
    goto LABEL_13;
  }
  id v15 = [v8 objectForKeyedSubscript:kSecDataInetExtraHistory];
  if (v15
    || ([v8 objectForKeyedSubscript:kSecDataInetExtraClientDefined0],
        (id v15 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v8 objectForKeyedSubscript:kSecDataInetExtraClientDefined1],
        (id v15 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v8 objectForKeyedSubscript:kSecDataInetExtraClientDefined2],
        (id v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_13:
  }
  else
  {
    id v31 = [v8 objectForKeyedSubscript:kSecDataInetExtraClientDefined3];

    if (!v31) {
      goto LABEL_15;
    }
  }
  if (![(SecuritydXPCServer *)self clientHasBooleanEntitlement:@"com.apple.private.keychain.inet_expansion_fields"])
  {
    sub_100012A40(-34018, (__CFString **)&cf, @"SecItemAddAndNotifyOnSync: %@ does not have entitlement %@", self->_client.task, @"com.apple.private.keychain.inet_expansion_fields");
LABEL_21:
    ((void (*)(void *, void, void, CFTypeRef))v11[2])(v11, 0, 0, cf);
    CFTypeRef v22 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v22);
    }
    goto LABEL_23;
  }
LABEL_15:
  CFTypeRef v39 = 0;
  id v16 = [v8 mutableCopy];
  id v17 = [SecOSTransactionHolder alloc];
  id v18 = (void *)os_transaction_create();
  id v19 = [(SecOSTransactionHolder *)v17 init:v18];

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000244FC;
  v36[3] = &unk_1002F7068;
  id v37 = v9;
  id v20 = v19;
  id v38 = v20;
  id v21 = objc_retainBlock(v36);
  [v16 setObject:v21 forKeyedSubscript:@"f_ckkscallback"];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  *(_OWORD *)CFTypeRef v33 = 0u;
  if (qword_10035D098 != -1) {
    dispatch_once(&qword_10035D098, &stru_100303AB8);
  }
  if (byte_10035D090)
  {
    SecSecurityFixUpClientWithPersona();
  }
  else
  {
    long long v23 = *(_OWORD *)&self->_client.allowSystemKeychain;
    long long v32 = *(_OWORD *)&self->_client.task;
    *(_OWORD *)CFTypeRef v33 = v23;
    long long v24 = *(_OWORD *)&self->_client.applicationIdentifier;
    long long v34 = *(_OWORD *)&self->_client.keybag;
    long long v35 = v24;
  }
  sub_100145928((const __CFDictionary *)v16, (uint64_t)&v32, (uint64_t)&v39, (__CFString **)&cf);
  if (v39)
  {
    CFTypeID v25 = CFGetTypeID(v39);
    if (v25 == CFDictionaryGetTypeID())
    {
      ((void (*)(void *, CFTypeRef, void, CFTypeRef))v11[2])(v11, v39, 0, cf);
    }
    else
    {
      CFTypeID v29 = CFGetTypeID(v39);
      if (v29 == CFArrayGetTypeID()) {
        ((void (*)(void *, void, CFTypeRef, CFTypeRef))v11[2])(v11, 0, v39, cf);
      }
      else {
        ((void (*)(void *, void, void, void))v11[2])(v11, 0, 0, 0);
      }
    }
  }
  else
  {
    ((void (*)(void *, void, void, CFTypeRef))v11[2])(v11, 0, 0, cf);
  }
  CFTypeRef v26 = v39;
  if (v39)
  {
    CFTypeRef v39 = 0;
    CFRelease(v26);
  }
  CFTypeRef v27 = cf;
  if (cf)
  {
    CFTypeRef cf = 0;
    CFRelease(v27);
  }
  if (qword_10035D098 != -1) {
    dispatch_once(&qword_10035D098, &stru_100303AB8);
  }
  if (byte_10035D090)
  {
    CFTypeRef v28 = v33[1];
    if (v33[1])
    {
      v33[1] = 0;
      CFRelease(v28);
    }
  }

LABEL_23:
}

- (void).cxx_destruct
{
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)dealloc
{
  CFStringRef task = self->_client.task;
  if (task)
  {
    self->_client.CFStringRef task = 0;
    CFRelease(task);
  }
  accessGroups = self->_client.accessGroups;
  if (accessGroups)
  {
    self->_client.accessGroups = 0;
    CFRelease(accessGroups);
  }
  musr = self->_client.musr;
  if (musr)
  {
    self->_client.musr = 0;
    CFRelease(musr);
  }
  applicationIdentifier = self->_client.applicationIdentifier;
  if (applicationIdentifier)
  {
    self->_client.applicationIdentifier = 0;
    CFRelease(applicationIdentifier);
  }
  v7.receiver = self;
  v7.super_class = (Class)SecuritydXPCServer;
  [(SecuritydXPCServer *)&v7 dealloc];
}

- (BOOL)clientHasBooleanEntitlement:(id)a3
{
  return sub_10000DC40(self->_client.task, (const __CFString *)a3);
}

- (SecuritydXPCServer)initWithSecurityClient:(SecurityClient *)a3
{
  v3 = a3;
  if (a3)
  {
    v12.receiver = self;
    v12.super_class = (Class)SecuritydXPCServer;
    v4 = [(SecuritydXPCServer *)&v12 init];
    v5 = v4;
    if (v4)
    {
      objc_storeWeak((id *)&v4->_connection, 0);
      BOOL v6 = *(__SecTask **)v3;
      if (*(void *)v3) {
        CFRetain(*(CFTypeRef *)v3);
      }
      v5->_client.CFStringRef task = v6;
      objc_super v7 = (__CFArray *)*((void *)v3 + 1);
      if (v7) {
        CFRetain(*((CFTypeRef *)v3 + 1));
      }
      v5->_client.accessGroups = v7;
      unsigned int v8 = *((_DWORD *)v3 + 5);
      *(_DWORD *)&v5->_client.allowSystemKeychain = *((_DWORD *)v3 + 4);
      v5->_client.uid = v8;
      id v9 = (__CFData *)*((void *)v3 + 3);
      if (v9) {
        CFRetain(*((CFTypeRef *)v3 + 3));
      }
      v5->_client.musr = v9;
      v5->_client.keybag = *((_DWORD *)v3 + 8);
      v5->_client.inEduMode = *((unsigned char *)v3 + 36);
      v5->_client.activeUser = *((_DWORD *)v3 + 10);
      id v10 = (__CFString *)*((void *)v3 + 6);
      if (v10) {
        CFRetain(*((CFTypeRef *)v3 + 6));
      }
      v5->_client.applicationIdentifier = v10;
      v5->_client.isAppClip = *((unsigned char *)v3 + 44);
      v5->_client.allowKeychainSharing = *((unsigned char *)v3 + 57);
    }
    self = v5;
    v3 = self;
  }

  return (SecuritydXPCServer *)v3;
}

- (SecuritydXPCServer)initWithConnection:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SecuritydXPCServer;
  v5 = [(SecuritydXPCServer *)&v11 init];
  BOOL v6 = v5;
  if (!v5) {
    goto LABEL_6;
  }
  objc_storeWeak((id *)&v5->_connection, v4);
  int v7 = [v4 effectiveUserIdentifier];
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  if (!sub_10000D278((uint64_t)&v6->_client, v7, v10)) {
    unsigned int v8 = 0;
  }
  else {
LABEL_6:
  }
    unsigned int v8 = v6;

  return v8;
}

@end