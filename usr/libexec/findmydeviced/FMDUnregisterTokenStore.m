@interface FMDUnregisterTokenStore
+ (id)computeAccessoryIdentifierWithIdentifier:(id)a3;
+ (id)keychainLookupKeyForIdentifier:(id)a3;
+ (id)tokenKeyForIdentifier:(id)a3;
- (BOOL)accessoriesNeedUnregister;
- (BOOL)isTokenDictionaryValid:(id)a3 error:(id *)a4;
- (FMDUnregisterTokenStore)init;
- (NSString)bundleIdentifier;
- (id)allKeychainLookupKeys;
- (id)allTokenKeys;
- (id)unregisterTokenForIdentifier:(id)a3;
- (void)clearUnregisterTokens;
- (void)expungeUnregisterTokens:(id)a3;
- (void)removeKeychainItemForKey:(id)a3;
- (void)removeUnregisterTokenForIdentifier:(id)a3;
- (void)removeUnregisterTokenForKey:(id)a3;
- (void)saveUnregisterToken:(id)a3 identifier:(id)a4 expiryDate:(id)a5;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation FMDUnregisterTokenStore

- (FMDUnregisterTokenStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)FMDUnregisterTokenStore;
  v2 = [(FMDUnregisterTokenStore *)&v6 init];
  if (v2)
  {
    v3 = +[NSBundle mainBundle];
    v4 = [v3 bundleIdentifier];
    [(FMDUnregisterTokenStore *)v2 setBundleIdentifier:v4];
  }
  return v2;
}

+ (id)tokenKeyForIdentifier:(id)a3
{
  v3 = [a3 stringValue];
  v4 = +[FMDUnregisterTokenStore computeAccessoryIdentifierWithIdentifier:v3];

  v5 = +[NSString stringWithFormat:@"%@:%@", @"AccessoryUnregisterToken", v4];

  return v5;
}

+ (id)keychainLookupKeyForIdentifier:(id)a3
{
  v3 = [a3 stringValue];
  v4 = +[FMDUnregisterTokenStore computeAccessoryIdentifierWithIdentifier:v3];

  v5 = +[NSString stringWithFormat:@"%@:%@", @"AccessoryUnregisterToken", v4];

  return v5;
}

- (BOOL)accessoriesNeedUnregister
{
  v2 = +[FMDProtectedContextManager sharedManager];
  v3 = [v2 contextKeysForType:@"AccessoryUnregisterToken" enumerationOption:2];

  id v4 = [v3 count];
  v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 67109120;
    LODWORD(v9) = v4 != 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore accessoriesNeedUnregister %i", (uint8_t *)&v8, 8u);
  }

  objc_super v6 = sub_100059DD0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Watch Migration: Stored token count %lu", (uint8_t *)&v8, 0xCu);
  }

  return v4 != 0;
}

- (id)unregisterTokenForIdentifier:(id)a3
{
  id v4 = (FMDCipherKeychainItemAdaptor *)a3;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_1000C712C;
  v42 = sub_1000C713C;
  id v43 = 0;
  v5 = [(id)objc_opt_class() tokenKeyForIdentifier:v4];
  objc_super v6 = [(id)objc_opt_class() keychainLookupKeyForIdentifier:v4];
  if (v6 && v5)
  {
    v7 = +[FMDProtectedContextManager sharedManager];
    id v37 = 0;
    int v8 = [v7 contextForKey:v5 contextUUID:0 error:&v37];
    id v9 = v37;

    if (v9)
    {
      v10 = sub_100004238();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = (FMDCipherKeychainItemAdaptor *)v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore could not fetch unregister token %@", buf, 0xCu);
      }

      v11 = sub_100059DD0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Watch Migration: could not fetch unregister token for %@", buf, 0xCu);
      }
      goto LABEL_42;
    }
    if (!v8)
    {
      v11 = sub_100004238();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_1002440D8();
      }
      goto LABEL_42;
    }
    v11 = [(FMDUnregisterTokenStore *)self bundleIdentifier];
    v12 = +[FMKeychainManager sharedInstance];
    id v36 = 0;
    v13 = [v12 itemForAccount:v6 service:v11 error:&v36];
    id v14 = v36;

    if (v14)
    {
      v15 = sub_100004238();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v45 = v4;
        __int16 v46 = 2112;
        id v47 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore could not read keychain item for %@ %@", buf, 0x16u);
      }

      sub_100059DD0();
      v16 = (FMDCipherKeychainItemAdaptor *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v4;
        _os_log_impl((void *)&_mh_execute_header, &v16->super, OS_LOG_TYPE_DEFAULT, "Watch Migration: could not read keychain item for %@", buf, 0xCu);
      }
      goto LABEL_41;
    }
    v16 = [[FMDCipherKeychainItemAdaptor alloc] initWithKeychainItem:v13];
    v31 = [(FMDCipherKeychainItemAdaptor *)v16 cipher];
    if (v31)
    {
      if ([(FMDUnregisterTokenStore *)self isTokenDictionaryValid:v8 error:0])
      {
        uint64_t v30 = [v8 objectForKeyedSubscript:@"encryptedToken"];
        if (v30)
        {
          v29 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v30 options:0];
          if (v29)
          {
            id v17 = [objc_alloc((Class)FMSynchronizer) initWithDescription:@"FMDUnregisterTokenStore-Decryption" andTimeout:10.0];
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_1000C7144;
            v32[3] = &unk_1002DD160;
            v35 = &v38;
            v33 = v4;
            v18 = v17;
            v34 = v18;
            [v29 decryptWithCipher:v31 completion:v32];
            [v18 wait];
            v28 = v18;
            if ([v18 timeoutOccurred])
            {
              v19 = sub_100004238();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                sub_1002441B4();
              }
            }
          }
          else
          {
            v28 = sub_100004238();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              sub_10024414C();
            }
          }
        }
        else
        {
          v25 = sub_100004238();
          v29 = v25;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore could not read unregister token - FMDUnregisterTokenStoreRecordEncryptedTokenKey", buf, 2u);
          }
        }

        v21 = v30;
        goto LABEL_40;
      }
      v21 = sub_100004238();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
LABEL_40:

LABEL_41:
LABEL_42:

        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v22 = "FMDUnregisterTokenStore token was not valid - expired.";
      v23 = v21;
      uint32_t v24 = 2;
    }
    else
    {
      v20 = sub_100004238();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v16;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore could not read cipher from keychain %@", buf, 0xCu);
      }

      v21 = sub_100059DD0();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_40;
      }
      *(_DWORD *)buf = 138412290;
      v45 = v4;
      v22 = "Watch Migration: could not decode keychain item for %@";
      v23 = v21;
      uint32_t v24 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    goto LABEL_40;
  }
  id v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore no token keys for %@", buf, 0xCu);
  }
LABEL_43:

  id v26 = (id)v39[5];
  _Block_object_dispose(&v38, 8);

  return v26;
}

- (void)removeUnregisterTokenForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() tokenKeyForIdentifier:v4];
  [(FMDUnregisterTokenStore *)self removeUnregisterTokenForKey:v5];
  objc_super v6 = [(id)objc_opt_class() keychainLookupKeyForIdentifier:v4];

  v7 = sub_100004238();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore deleting keychain item : %@", (uint8_t *)&v8, 0xCu);
  }

  [(FMDUnregisterTokenStore *)self removeKeychainItemForKey:v6];
}

- (void)saveUnregisterToken:(id)a3 identifier:(id)a4 expiryDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = sub_100059DD0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Watch Migration: Saving token and cipher for %@", buf, 0xCu);
  }

  v12 = [(id)objc_opt_class() tokenKeyForIdentifier:v8];
  v13 = [(id)objc_opt_class() keychainLookupKeyForIdentifier:v8];
  id v14 = [v10 dataUsingEncoding:4];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000C755C;
  v19[3] = &unk_1002DD188;
  id v20 = v9;
  id v21 = v12;
  v22 = self;
  id v23 = v13;
  id v24 = v8;
  id v15 = v8;
  id v16 = v13;
  id v17 = v12;
  id v18 = v9;
  [v14 encryptWithcompletion:v19];
}

- (void)expungeUnregisterTokens:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v6 = objc_alloc_init((Class)NSMutableOrderedSet);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000C7AD0;
  v22[3] = &unk_1002DD1B0;
  id v7 = v5;
  id v23 = v7;
  id v24 = self;
  id v8 = v6;
  id v25 = v8;
  [v4 enumerateObjectsUsingBlock:v22];

  id v9 = [(FMDUnregisterTokenStore *)self allTokenKeys];
  id v10 = sub_100004238();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore expungeUnregisterTokens listing all keys %@", buf, 0xCu);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000C7BB0;
  v18[3] = &unk_1002DD1D8;
  id v19 = v7;
  id v20 = self;
  id v11 = v8;
  id v21 = v11;
  id v12 = v7;
  [v9 enumerateObjectsUsingBlock:v18];
  v13 = [(FMDUnregisterTokenStore *)self allKeychainLookupKeys];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000C7DC0;
  v15[3] = &unk_1002DAFA8;
  id v16 = v11;
  id v17 = self;
  id v14 = v11;
  [v13 enumerateObjectsUsingBlock:v15];
}

- (void)clearUnregisterTokens
{
  v3 = [(FMDUnregisterTokenStore *)self allTokenKeys];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C7F98;
  v6[3] = &unk_1002DD200;
  v6[4] = self;
  [v3 enumerateObjectsUsingBlock:v6];
  id v4 = [(FMDUnregisterTokenStore *)self allKeychainLookupKeys];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C7FF8;
  v5[3] = &unk_1002D9968;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

- (BOOL)isTokenDictionaryValid:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v5 = [a3 objectForKeyedSubscript:@"expiryDate"];
    if (v5)
    {
      id v6 = sub_100059DD0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 134217984;
        id v16 = [v5 fm_epoch];
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Watch Migration: Found Token Expiry %lli", (uint8_t *)&v15, 0xCu);
      }

      id v7 = +[NSDate date];
      [v5 timeIntervalSinceReferenceDate];
      double v9 = v8;
      [v7 timeIntervalSinceReferenceDate];
      BOOL v11 = v9 > v10;
      if (a4 && v9 <= v10)
      {
        *a4 = +[NSError errorWithDomain:@"com.apple.icloud.findmydeviced.FMDUnregisterTokenStore" code:2 userInfo:0];
      }
    }
    else
    {
      id v12 = sub_100004238();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100244338(v12);
      }

      v13 = sub_100059DD0();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Watch Migration: Invalid token. No expiry date found.", (uint8_t *)&v15, 2u);
      }

      if (a4)
      {
        +[NSError errorWithDomain:@"com.apple.icloud.findmydeviced.FMDUnregisterTokenStore" code:1 userInfo:0];
        BOOL v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v11 = 0;
      }
    }
  }
  else
  {
    id v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1002442F4(v5);
    }
    BOOL v11 = 1;
  }

  return v11;
}

- (void)removeKeychainItemForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(FMDUnregisterTokenStore *)self bundleIdentifier];
    id v6 = +[FMKeychainManager sharedInstance];
    unsigned __int8 v7 = [v6 deleteDataForAccount:v4 service:v5];

    if (v7)
    {
      double v8 = sub_100059DD0();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        goto LABEL_15;
      }
      int v12 = 138412290;
      id v13 = v4;
      double v9 = "Watch Migration: Deleted Keychain Item %@";
    }
    else
    {
      BOOL v11 = sub_100004238();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1002443C0();
      }

      double v8 = sub_100059DD0();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      int v12 = 138412290;
      id v13 = v4;
      double v9 = "Watch Migration: Failed to delete keychain item %@";
    }
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0xCu);
    goto LABEL_14;
  }
  double v10 = sub_100004238();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10024437C(v10);
  }

  id v5 = sub_100059DD0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Watch Migration: Failed to delete keychain, programmer error. Nil key.", (uint8_t *)&v12, 2u);
  }
LABEL_15:
}

- (void)removeUnregisterTokenForKey:(id)a3
{
  id v3 = a3;
  id v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore deleting token : %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = sub_100059DD0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Watch Migration: Deleting token from disk %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = +[FMDProtectedContextManager sharedManager];
  [v6 cleanupAllContextsForKey:v3];
}

- (id)allTokenKeys
{
  v2 = +[FMDProtectedContextManager sharedManager];
  id v3 = [v2 contextKeysForType:@"AccessoryUnregisterToken" enumerationOption:1];

  return v3;
}

- (id)allKeychainLookupKeys
{
  v2 = [(FMDUnregisterTokenStore *)self bundleIdentifier];
  id v3 = +[FMKeychainManager sharedInstance];
  id v4 = [v3 allAccountsForService:v2];

  return v4;
}

+ (id)computeAccessoryIdentifierWithIdentifier:(id)a3
{
  id v3 = +[NSString stringWithFormat:@"NR_%@", a3];
  id v4 = [v3 dataUsingEncoding:4];
  id v5 = [v4 fm_sha256Hash];
  id v6 = [v5 fm_hexString];
  int v7 = [v6 lowercaseString];

  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end