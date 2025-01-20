@interface MIBUCertHelper
+ (BOOL)SUCertPresent;
+ (__SecKey)suCertKeyFromData:(id)a3 isSEPKey:(BOOL)a4 error:(id *)a5;
+ (id)_getCertDataFromPath:(id)a3 error:(id *)a4;
+ (id)_parseDERCertificates:(id)a3 error:(id *)a4;
+ (id)certificatesFromData:(id)a3 error:(id *)a4;
+ (void)deleteSUCert:(id *)a3;
+ (void)readSUIdentityWithCompletion:(id)a3;
+ (void)trustCertificatesWithCompletion:(id)a3;
@end

@implementation MIBUCertHelper

+ (BOOL)SUCertPresent
{
  if (os_variant_has_internal_content()
    && (+[MIBUTestPreferences sharedInstance],
        v2 = objc_claimAutoreleasedReturnValue(),
        unsigned int v3 = [v2 factorySUCertExist],
        v2,
        v3))
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059E60);
    }
    v4 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Overriding factory SU certificate existence to YES", buf, 2u);
    }
    return 1;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v6 = off_10006C520;
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = *(void *)v19;
      BOOL v5 = 1;
      *(void *)&long long v8 = 138543362;
      long long v17 = v8;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v11);
          v13 = +[NSFileManager defaultManager];
          unsigned __int8 v14 = [v13 fileExistsAtPath:v12];

          if ((v14 & 1) == 0)
          {
            if (qword_10006C958 != -1) {
              dispatch_once(&qword_10006C958, &stru_100059E80);
            }
            v15 = qword_10006C950;
            BOOL v5 = 0;
            if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              uint64_t v23 = v12;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Certificate file %{public}@ does not exist", buf, 0xCu);
              BOOL v5 = 0;
            }
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v9);
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  return v5;
}

+ (void)readSUIdentityWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void *, id))a3;
  if (os_variant_has_internal_content())
  {
    BOOL v5 = +[MIBUTestPreferences sharedInstance];
    v6 = [v5 factorySUCertPath];

    if (v6)
    {
      id v7 = +[MIBUTestPreferences sharedInstance];
      long long v8 = [v7 factorySUCertPath];

      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059EA0);
      }
      id v9 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Overriding SU certificate path to %{public}@", buf, 0xCu);
      }
    }
    else
    {
      long long v8 = @"/private/var/hardware/factory/su/su0-cert.der";
    }
    v11 = +[MIBUTestPreferences sharedInstance];
    uint64_t v12 = [v11 factorySUKeyPath];

    if (v12)
    {
      v13 = +[MIBUTestPreferences sharedInstance];
      uint64_t v10 = [v13 factorySUKeyPath];

      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059EC0);
      }
      unsigned __int8 v14 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Overriding SU key path to %{public}@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v10 = @"/private/var/hardware/factory/su/su0-key.der";
    }
  }
  else
  {
    uint64_t v10 = @"/private/var/hardware/factory/su/su0-key.der";
    long long v8 = @"/private/var/hardware/factory/su/su0-cert.der";
  }
  id v23 = 0;
  v15 = [a1 _getCertDataFromPath:v8 error:&v23];
  id v16 = v23;
  if (v16)
  {
    id v20 = v16;
    long long v19 = 0;
    long long v17 = 0;
  }
  else
  {
    id v22 = 0;
    long long v17 = [a1 _parseDERCertificates:v15 error:&v22];
    id v18 = v22;
    if (v18)
    {
      id v20 = v18;
      long long v19 = 0;
    }
    else
    {
      id v21 = 0;
      long long v19 = [a1 _getCertDataFromPath:v10 error:&v21];
      id v20 = v21;
    }
  }
  v4[2](v4, v17, v19, v20);
}

+ (void)trustCertificatesWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void *, id))a3;
  if (!os_variant_has_internal_content())
  {
    uint64_t v10 = 0;
    v11 = 0;
    v31 = 0;
    long long v8 = 0;
    uint64_t v12 = @"retail-wifi-cert.apple.com";
    goto LABEL_31;
  }
  BOOL v5 = +[MIBUTestPreferences sharedInstance];
  v6 = [v5 iseTrustCertPaths];

  if (v6)
  {
    id v7 = +[MIBUTestPreferences sharedInstance];
    long long v8 = [v7 iseTrustCertPaths];

    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059EE0);
    }
    id v9 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = (uint64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Overriding ISE trust certificate paths to: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    long long v8 = 0;
  }
  v13 = +[MIBUTestPreferences sharedInstance];
  unsigned __int8 v14 = [v13 iseTrustCertName];

  if (!v14)
  {
    uint64_t v12 = @"retail-wifi-cert.apple.com";
    if (!v8) {
      goto LABEL_27;
    }
    goto LABEL_16;
  }
  v15 = +[MIBUTestPreferences sharedInstance];
  uint64_t v16 = [v15 iseTrustCertName];

  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059F00);
  }
  long long v17 = qword_10006C950;
  if (!os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (__CFString *)v16;
    if (!v8) {
      goto LABEL_27;
    }
    goto LABEL_16;
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v40 = v16;
  uint64_t v12 = (__CFString *)v16;
  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Overriding ISE trust certificate name to: %{public}@", buf, 0xCu);
  if (v8)
  {
LABEL_16:
    v29 = v12;
    v30 = v4;
    v31 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v28 = v8;
    id v18 = v8;
    id v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v19)
    {
      id v20 = v19;
      v11 = 0;
      uint64_t v10 = 0;
      uint64_t v21 = *(void *)v35;
      while (2)
      {
        id v22 = 0;
        id v23 = v11;
        v24 = v10;
        do
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v22);
          id v33 = 0;
          uint64_t v10 = [a1 _getCertDataFromPath:v25 error:&v33];
          id v26 = v33;

          if (v26)
          {
            v11 = v23;
LABEL_34:
            long long v8 = v18;

            v27 = 0;
            uint64_t v12 = v29;
            v4 = v30;
            goto LABEL_32;
          }
          id v32 = 0;
          v11 = [a1 _parseDERCertificates:v10 error:&v32];
          id v26 = v32;

          if (v26) {
            goto LABEL_34;
          }
          [v31 addObjectsFromArray:v11];
          id v22 = (char *)v22 + 1;
          id v23 = v11;
          v24 = v10;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
    else
    {
      v11 = 0;
      uint64_t v10 = 0;
    }

    uint64_t v12 = v29;
    v4 = v30;
    long long v8 = v28;
    if (!v29) {
      goto LABEL_28;
    }
LABEL_31:
    v27 = objc_opt_new();
    [v27 addObject:v12];
    id v26 = 0;
    goto LABEL_32;
  }
LABEL_27:
  v31 = 0;
  v11 = 0;
  uint64_t v10 = 0;
  if (v12) {
    goto LABEL_31;
  }
LABEL_28:
  id v26 = 0;
  v27 = 0;
LABEL_32:
  v4[2](v4, v31, v27, v26);
}

+ (__SecKey)suCertKeyFromData:(id)a3 isSEPKey:(BOOL)a4 error:(id *)a5
{
  CFDataRef v7 = (const __CFData *)a3;
  CFErrorRef error = 0;
  if (!os_variant_has_internal_content() || a4)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059F40);
    }
    long long v17 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Factory SU key is SEP key", buf, 2u);
    }
    SecAccessControlRef v18 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
    if (v18)
    {
      v34[0] = kSecAttrIsPermanent;
      v34[1] = kSecAttrTokenID;
      v35[0] = &__kCFBooleanFalse;
      v35[1] = kSecAttrTokenIDAppleKeyStore;
      v34[2] = kSecAttrTokenOID;
      v34[3] = kSecAttrAccessControl;
      v35[2] = v7;
      v35[3] = v18;
      CFDictionaryRef v16 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
      unsigned __int8 v14 = SecKeyCreateWithData((CFDataRef)+[NSData data], v16, &error);
      if (v14)
      {
        id v15 = 0;
      }
      else
      {
        id v29 = 0;
        sub_1000102B8(&v29, 50331648, error, @"Failed to convert RK data blob.", v23, v24, v25, v26, v28);
        id v15 = v29;
      }
    }
    else
    {
      id v30 = 0;
      sub_1000102B8(&v30, 0x1000000, error, @"Failed to create access control.", v19, v20, v21, v22, v28);
      id v15 = v30;
      CFDictionaryRef v16 = 0;
      unsigned __int8 v14 = 0;
    }
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059F20);
    }
    long long v8 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Factory SU key is not SEP key", buf, 2u);
    }
    v36[0] = kSecAttrType;
    v36[1] = kSecAttrKeyClass;
    v37[0] = kSecAttrKeyTypeRSA;
    v37[1] = kSecAttrKeyClassPrivate;
    CFDictionaryRef v9 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
    unsigned __int8 v14 = SecKeyCreateWithData(v7, v9, &error);
    if (!v14 || error)
    {
      id v31 = 0;
      sub_1000102B8(&v31, 50331648, error, @"Failed to create SecKeyRef with data", v10, v11, v12, v13, v28);
      id v15 = v31;
    }
    else
    {
      id v15 = 0;
    }

    CFDictionaryRef v16 = 0;
  }
  if (a5) {
    *a5 = v15;
  }

  return v14;
}

+ (id)certificatesFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        SecCertificateRef v11 = SecCertificateCreateWithData(0, *(CFDataRef *)(*((void *)&v20 + 1) + 8 * i));
        if (!v11)
        {
          id v19 = 0;
          sub_1000102B8(&v19, 50331648, 0, @"Failed to create certificate from data.", v12, v13, v14, v15, v18);
          id v8 = v19;
          goto LABEL_11;
        }
        SecCertificateRef v16 = v11;
        [v6 addObject:v11];
      }
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (a4) {
    *a4 = v8;
  }

  return v6;
}

+ (void)deleteSUCert:(id *)a3
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059F60);
  }
  unsigned int v3 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deleting SU Certificate ...", buf, 2u);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v4 = off_10006C520;
  id v5 = [v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v9);
        SecCertificateRef v11 = +[NSFileManager defaultManager];
        unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

        if (v12)
        {
          uint64_t v13 = +[NSFileManager defaultManager];
          id v23 = v7;
          unsigned __int8 v14 = [v13 removeItemAtPath:v10 error:&v23];
          id v15 = v23;

          if ((v14 & 1) == 0)
          {
            if (qword_10006C958 != -1) {
              dispatch_once(&qword_10006C958, &stru_100059FA0);
            }
            SecCertificateRef v16 = qword_10006C950;
            if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v29 = v10;
              __int16 v30 = 2114;
              id v31 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to delete %{public}@ with error: %{public}@", buf, 0x16u);
            }
            sub_1000102B8(a3, 50331650, v15, @"Failed to delete %@", v17, v18, v19, v20, v10);
          }
          id v7 = v15;
        }
        else
        {
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_100059F80);
          }
          long long v21 = qword_10006C950;
          if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v29 = v10;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Certificate file %{public}@ does not exist, skip deletion...", buf, 0xCu);
          }
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
}

+ (id)_getCertDataFromPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSFileManager defaultManager];
  unsigned __int8 v7 = [v6 fileExistsAtPath:v5];

  if (v7)
  {
    id v8 = [objc_alloc((Class)NSData) initWithContentsOfFile:v5];
    if (v8) {
      goto LABEL_3;
    }
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059FE0);
    }
    id v15 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003F2B8((uint64_t)v5, v15);
    }
    sub_1000102B8(a4, 50331648, 0, @"Failed to load %@", v16, v17, v18, v19, (uint64_t)v5);
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059FC0);
    }
    uint64_t v10 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003F330((uint64_t)v5, v10);
    }
    sub_1000102B8(a4, 50331649, 0, @"%@ does not exist", v11, v12, v13, v14, (uint64_t)v5);
  }
  id v8 = 0;
LABEL_3:

  return v8;
}

+ (id)_parseDERCertificates:(id)a3 error:(id *)a4
{
  memset(v19, 0, sizeof(v19));
  unint64_t v18 = 0;
  id v5 = a3;
  id v6 = [v5 bytes];
  uint64_t v7 = CTParseCertificateSet((unint64_t)v6, (unint64_t)[v5 length] + (void)v6, v19, 3, &v18);
  if (v7) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v18 == 0;
  }
  if (v12)
  {
    sub_1000102B8(a4, 50331648, 0, @"Failed to parse certificate set: 0x%08x", v8, v9, v10, v11, v7);
    id v13 = 0;
  }
  else
  {
    id v13 = objc_alloc_init((Class)NSMutableArray);
    if (v13 && v18)
    {
      uint64_t v14 = 0;
      int v15 = 0;
      do
      {
        id v16 = [objc_alloc((Class)NSData) initWithBytes:*(void *)&v19[v14] length:*((void *)&v19[v14] + 1)];
        [v13 setObject:v16 atIndexedSubscript:v14];

        uint64_t v14 = ++v15;
      }
      while (v18 > v15);
    }
  }

  return v13;
}

@end