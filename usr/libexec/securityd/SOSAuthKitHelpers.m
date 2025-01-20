@interface SOSAuthKitHelpers
+ (BOOL)accountIsCDPCapable;
+ (BOOL)peerinfoHasMID:(id)a3;
+ (BOOL)updateMIDInPeerInfo:(id)a3;
+ (id)machineID;
+ (void)activeMIDs:(id)a3;
- (BOOL)isUseful;
- (BOOL)midIsValidInList:(id)a3;
- (BOOL)serialIsValidInList:(id)a3;
- (NSSet)machineIDs;
- (NSSet)midList;
- (NSSet)serialNumbers;
- (SOSAuthKitHelpers)initWithActiveMIDS:(id)a3;
- (void)setMachineIDs:(id)a3;
- (void)setMidList:(id)a3;
- (void)setSerialNumbers:(id)a3;
@end

@implementation SOSAuthKitHelpers

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumbers, 0);
  objc_storeStrong((id *)&self->_machineIDs, 0);

  objc_storeStrong((id *)&self->_midList, 0);
}

- (void)setSerialNumbers:(id)a3
{
}

- (NSSet)serialNumbers
{
  return self->_serialNumbers;
}

- (void)setMachineIDs:(id)a3
{
}

- (NSSet)machineIDs
{
  return self->_machineIDs;
}

- (void)setMidList:(id)a3
{
}

- (NSSet)midList
{
  return self->_midList;
}

- (BOOL)isUseful
{
  return [(NSSet *)self->_machineIDs count] != 0;
}

- (BOOL)serialIsValidInList:(id)a3
{
  if (a3) {
    return -[NSSet containsObject:](self->_serialNumbers, "containsObject:");
  }
  else {
    return 1;
  }
}

- (BOOL)midIsValidInList:(id)a3
{
  if (a3) {
    return -[NSSet containsObject:](self->_machineIDs, "containsObject:");
  }
  else {
    return 1;
  }
}

- (SOSAuthKitHelpers)initWithActiveMIDS:(id)a3
{
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SOSAuthKitHelpers;
  v6 = [(SOSAuthKitHelpers *)&v32 init];
  if (v6)
  {
    v7 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
    v8 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
    v9 = (NSSet *)objc_alloc_init((Class)NSSet);
    machineIDs = v6->_machineIDs;
    v6->_machineIDs = v9;

    v11 = (NSSet *)objc_alloc_init((Class)NSSet);
    serialNumbers = v6->_serialNumbers;
    v6->_serialNumbers = v11;

    if (!v5)
    {

      v26 = 0;
      goto LABEL_17;
    }
    objc_storeStrong((id *)&v6->_midList, a3);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v13 = v6->_midList;
    id v14 = [(NSSet *)v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v19 = [v18 machineID];

          if (v19)
          {
            v20 = [v18 machineID];
            [(NSSet *)v7 addObject:v20];
          }
          v21 = [v18 serialNumber];

          if (v21)
          {
            v22 = [v18 serialNumber];
            [(NSSet *)v8 addObject:v22];
          }
        }
        id v15 = [(NSSet *)v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v15);
    }

    v23 = v6->_machineIDs;
    v6->_machineIDs = v7;
    v24 = v7;

    v25 = v6->_serialNumbers;
    v6->_serialNumbers = v8;
  }
  v26 = v6;
LABEL_17:

  return v26;
}

+ (BOOL)accountIsCDPCapable
{
  if (objc_opt_class() && objc_opt_class())
  {
    v2 = sub_10020B8D4();
    v3 = +[AKAccountManager sharedInstance];
    v4 = v3;
    if (v3) {
      BOOL v5 = v2 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      v6 = sub_10000B070("sosauthkit");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to get manager", buf, 2u);
      }
      LOBYTE(v7) = 0;
      goto LABEL_32;
    }
    v8 = [v3 altDSIDForAccount:v2];
    id v19 = 0;
    v9 = [v4 authKitAccountWithAltDSID:v8 error:&v19];
    v10 = v19;
    v6 = v10;
    if (v9)
    {
      unint64_t v11 = (unint64_t)[v4 securityLevelForAccount:v9];
      if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
        BOOL v7 = 1;
        goto LABEL_23;
      }
    }
    else
    {
      v12 = sub_10000B070("sosauthkit");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v21 = (unint64_t)v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "failed to get ak account: %@", buf, 0xCu);
      }

      unint64_t v11 = 0;
    }
    v13 = sub_10000B070("sosauthkit");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Security level is %lu", buf, 0xCu);
    }

    BOOL v7 = 0;
    if (v11 > 5)
    {
      CFStringRef v14 = @"oh no please file a radar to Security | iCloud Keychain security level";
      goto LABEL_25;
    }
LABEL_23:
    CFStringRef v14 = *(&off_100308A80 + v11);
LABEL_25:
    id v15 = sub_10000B070("sosauthkit");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      unint64_t v21 = (unint64_t)v8;
      __int16 v22 = 2048;
      unint64_t v23 = v11;
      __int16 v24 = 2112;
      CFStringRef v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Security level for altDSID %@ is %lu.  Account type: %@", buf, 0x20u);
    }

    uint64_t v16 = sub_10000B070("sosauthkit");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = "isn't";
      if (v7) {
        v17 = "is";
      }
      *(_DWORD *)buf = 136315138;
      unint64_t v21 = (unint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Account %s CDP Capable", buf, 0xCu);
    }

LABEL_32:
    goto LABEL_33;
  }
  v2 = sub_10000B070("sosauthkit");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "ACAccount not available", buf, 2u);
  }
  LOBYTE(v7) = 0;
LABEL_33:

  return v7;
}

+ (BOOL)updateMIDInPeerInfo:(id)a3
{
  id v3 = a3;
  v4 = +[SOSAuthKitHelpers machineID];
  if (v4)
  {
    CFTypeRef cf = 0;
    sub_1001FF4C0(v3, sMachineIDKey, (uint64_t)v4, &cf);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10020BB80;
    v9[3] = &unk_100308A60;
    id v10 = v4;
    char v5 = sub_1001F0E0C(v3, @"Add Machine ID", (uint64_t)&cf, v9);
    if ((v5 & 1) == 0)
    {
      v6 = sub_10000B070("sosauthkit");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFTypeRef v13 = cf;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to record MID in PeerInfo: %@", buf, 0xCu);
      }
    }
    CFTypeRef v7 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v7);
    }
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

+ (BOOL)peerinfoHasMID:(id)a3
{
  [a3 fullPeerInfo];
  if (!SOSFullPeerInfoGetPeerInfo()) {
    return 1;
  }

  return SOSPeerInfoV2DictionaryHasString();
}

+ (void)activeMIDs:(id)a3
{
  id v3 = a3;
  if (objc_opt_class() && objc_opt_class())
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = AKServiceNameiCloud;
    if (v4 && AKServiceNameiCloud != 0)
    {
      uint64_t v10 = sub_10020B8D4();
      v8 = (void *)v10;
      if (v10)
      {
        uint64_t v11 = objc_opt_new();
        if (v11)
        {
          v9 = (void *)v11;
          v12 = [v8 aa_altDSID];
          [v9 setAltDSID:v12];

          uint64_t v26 = v5;
          CFTypeRef v13 = +[NSArray arrayWithObjects:&v26 count:1];
          [v9 setServices:v13];

          CFStringRef v14 = objc_opt_new();
          if (v14)
          {
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472;
            v21[2] = sub_10020C0D4;
            v21[3] = &unk_100308A38;
            id v22 = v3;
            [v14 deviceListWithContext:v9 completion:v21];
            id v15 = v22;
          }
          else
          {
            NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
            CFStringRef v25 = @"can't get authController";
            id v15 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
            v20 = +[NSError errorWithDomain:kCFErrorDomainOSStatus code:-50 userInfo:v15];
            (*((void (**)(id, void, void *))v3 + 2))(v3, 0, v20);
          }
          goto LABEL_23;
        }
        CFErrorDomain v17 = kCFErrorDomainOSStatus;
        NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
        CFStringRef v28 = @"can't get AKDeviceListRequestContextClass";
        v18 = &v28;
        id v19 = &v27;
      }
      else
      {
        uint64_t v16 = sub_10000B070("sosauthkit");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "can't get account", buf, 2u);
        }

        CFErrorDomain v17 = kCFErrorDomainOSStatus;
        NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
        CFStringRef v30 = @"no primary account";
        v18 = &v30;
        id v19 = &v29;
      }
      v9 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v19 count:1];
      CFStringRef v14 = +[NSError errorWithDomain:v17 code:-50 userInfo:v9];
      (*((void (**)(id, void, void *))v3 + 2))(v3, 0, v14);
LABEL_23:

      goto LABEL_11;
    }
  }
  CFTypeRef v7 = sub_10000B070("sosauthkit");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ACAccount not available", buf, 2u);
  }

  NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
  CFStringRef v32 = @"AuthKit/AppleAccount not available";
  v8 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  v9 = +[NSError errorWithDomain:kCFErrorDomainOSStatus code:-50 userInfo:v8];
  (*((void (**)(id, void, void *))v3 + 2))(v3, 0, v9);
LABEL_11:
}

+ (id)machineID
{
  v2 = sub_10000B070("sosauthkit");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Entering machineID", buf, 2u);
  }

  if (objc_opt_class() && objc_opt_class())
  {
    id v3 = objc_opt_new();
    uint64_t v4 = v3;
    if (!v3)
    {
      uint64_t v5 = sub_10000B070("sosauthkit");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "can't get controller", buf, 2u);
      }
      v6 = 0;
      v8 = 0;
      goto LABEL_23;
    }
    id v16 = 0;
    uint64_t v5 = [v3 anisetteDataWithError:&v16];
    v6 = v16;
    if (v5)
    {
      CFTypeRef v7 = [v5 machineID];
      v8 = [v7 copy];

      v9 = sub_10000B070("sosauthkit");
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          *(_DWORD *)buf = 138412290;
          v18 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "machineID is %@", buf, 0xCu);
        }
        goto LABEL_22;
      }
      if (v10)
      {
        *(_WORD *)buf = 0;
        v12 = "Failed to get machineID";
        CFTypeRef v13 = v9;
        uint32_t v14 = 2;
        goto LABEL_20;
      }
    }
    else
    {
      v9 = sub_10000B070("sosauthkit");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        v12 = "can't get mID: %@";
        CFTypeRef v13 = v9;
        uint32_t v14 = 12;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
    v8 = 0;
LABEL_22:

LABEL_23:
    uint64_t v11 = v8;

    goto LABEL_24;
  }
  v6 = sub_10000B070("sosauthkit");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AKAnisette not available", buf, 2u);
  }
  uint64_t v11 = 0;
LABEL_24:

  return v11;
}

@end