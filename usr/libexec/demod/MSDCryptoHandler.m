@interface MSDCryptoHandler
+ (id)sharedInstance;
- (BOOL)deleteSecretKeyInKeychain;
- (BOOL)preserveAndEncryptKeychainItemsForKey:(id)a3 toFile:(id)a4;
- (BOOL)restoreAndDecryptKeychainItemsForKey:(id)a3 fromFile:(id)a4;
- (BOOL)saveSecretKeyInKeychain:(id)a3;
- (id)archiveAndEncryptKeychainItems:(id)a3;
- (id)copySecretKeyFromKeychain;
- (id)decryptAndUnarchiveKeychainItems:(id)a3;
- (id)generateRandomBytesWithFixedLength;
- (id)performCryptoWithSecretKeyOnData:(id)a3 isDecipher:(BOOL)a4;
- (void)createSecretKeyIfNeeded;
- (void)deleteSecretKey;
@end

@implementation MSDCryptoHandler

+ (id)sharedInstance
{
  if (qword_100189CD8 != -1) {
    dispatch_once(&qword_100189CD8, &stru_100153F98);
  }
  v2 = (void *)qword_100189CD0;

  return v2;
}

- (void)createSecretKeyIfNeeded
{
  id v3 = [(MSDCryptoHandler *)self copySecretKeyFromKeychain];

  if (!v3)
  {
    uint64_t v4 = [(MSDCryptoHandler *)self generateRandomBytesWithFixedLength];
    if (v4)
    {
      v5 = v4;
      unsigned __int8 v6 = [(MSDCryptoHandler *)self saveSecretKeyInKeychain:v4];
      v7 = sub_100068600();
      v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Secret key for encryption is created.", v9, 2u);
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        sub_1000DBEFC();
      }
    }
    else
    {
      v5 = sub_100068600();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1000DBEC8();
      }
    }
  }
}

- (void)deleteSecretKey
{
  id v3 = [(MSDCryptoHandler *)self copySecretKeyFromKeychain];

  if (v3 && [(MSDCryptoHandler *)self deleteSecretKeyInKeychain])
  {
    uint64_t v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Secret key for encryption is deleted.", v5, 2u);
    }
  }
}

- (id)performCryptoWithSecretKeyOnData:(id)a3 isDecipher:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  size_t v39 = 0;
  CCOperation op = v4;
  if (v4)
  {
    v8 = (char *)[v6 length] - 32;
    id v9 = v7;
    +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", [v9 bytes], 32, 0);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", (char *)[v9 bytes] + 32, v8, 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v38 = [(MSDCryptoHandler *)self generateRandomBytesWithFixedLength];
    id v10 = v7;
  }
  v11 = v10;
  if (!v10)
  {
    v26 = sub_100068600();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000DBF30();
    }
    goto LABEL_37;
  }
  if (!v38)
  {
    v26 = sub_100068600();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000DBF64();
    }
LABEL_37:
    id v23 = 0;
    v27 = 0;
    id v37 = 0;
LABEL_29:

    goto LABEL_30;
  }
  id v37 = [(MSDCryptoHandler *)self copySecretKeyFromKeychain];
  if (v37)
  {
    v35 = v7;
    id v12 = [objc_alloc((Class)NSMutableData) initWithLength:((char *)[v11 length]) + 32];
    if (v12)
    {
      id v13 = v12;
      while (1)
      {
        id v14 = v37;
        id v15 = [v14 bytes];
        id v16 = [v14 length];
        id v17 = v38;
        id v18 = [v17 bytes];
        v19 = v11;
        id v20 = v11;
        id v21 = [v20 bytes];
        id v22 = [v20 length];
        id v23 = v13;
        CCCryptorStatus v24 = CCCrypt(op, 0, 1u, v15, (size_t)v16, v18, v21, (size_t)v22, [v23 mutableBytes], (size_t)[v23 length], &v39);
        if (v24 != -4301) {
          break;
        }
        v25 = sub_100068600();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          size_t v41 = v39;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Output data buffer too small. Retry with larger buffer = %tu bytes.", buf, 0xCu);
        }

        id v13 = [objc_alloc((Class)NSMutableData) initWithLength:v39];
        v11 = v19;
        if (!v13) {
          goto LABEL_13;
        }
      }
      int v28 = v24;
      if (v24)
      {
        v26 = sub_100068600();
        v11 = v19;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_1000DBFCC(op, v28, v26);
        }
        v27 = 0;
      }
      else
      {
        v11 = v19;
        if (op)
        {
          id v29 = [v23 mutableBytes];
          v27 = +[NSMutableData dataWithBytes:v29 length:v39];
        }
        else
        {
          v27 = +[NSMutableData dataWithData:v17];
          id v30 = [v23 mutableBytes];
          v31 = +[NSData dataWithBytes:v30 length:v39];
          [v27 appendData:v31];
        }
        v26 = sub_100068600();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v32 = "encrypted";
          if (op) {
            v32 = "decrypted";
          }
          *(_DWORD *)buf = 136446210;
          size_t v41 = (size_t)v32;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Input data is %{public}s.", buf, 0xCu);
        }
      }
      id v37 = v14;
    }
    else
    {
LABEL_13:
      v26 = sub_100068600();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1000DBF98();
      }
      id v23 = 0;
      v27 = 0;
    }
    v7 = v35;
    goto LABEL_29;
  }
  id v23 = 0;
  v27 = 0;
  id v37 = 0;
LABEL_30:
  id v33 = v27;

  return v33;
}

- (BOOL)preserveAndEncryptKeychainItemsForKey:(id)a3 toFile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[MSDKeychainManager sharedInstance];
  id v9 = [v8 getAllItemsForKey:v6 withAttributes:1];

  if (!v9)
  {
    id v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000DC06C();
    }
    goto LABEL_10;
  }
  id v10 = [(MSDCryptoHandler *)self archiveAndEncryptKeychainItems:v9];
  if (!v10)
  {
    id v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000DC0D4();
    }
LABEL_10:
    id v13 = 0;
    v11 = 0;
LABEL_13:

    BOOL v14 = 0;
    goto LABEL_5;
  }
  v11 = v10;
  id v17 = 0;
  unsigned __int8 v12 = [v10 writeToFile:v7 options:0 error:&v17];
  id v13 = v17;
  if ((v12 & 1) == 0)
  {
    id v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000DC108();
    }
    goto LABEL_13;
  }
  BOOL v14 = 1;
LABEL_5:

  return v14;
}

- (BOOL)restoreAndDecryptKeychainItemsForKey:(id)a3 fromFile:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  id v31 = 0;
  id v7 = +[NSData dataWithContentsOfFile:v6 options:0 error:&v31];
  id v8 = v31;
  if (!v7)
  {
    id v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000DC170();
    }
    goto LABEL_21;
  }
  id v9 = [(MSDCryptoHandler *)self decryptAndUnarchiveKeychainItems:v7];
  if (!v9)
  {
    id v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000DC1D8();
    }
LABEL_21:
    BOOL v20 = 0;
    goto LABEL_16;
  }
  id v23 = v8;
  CCCryptorStatus v24 = v7;
  id v25 = v6;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v16 = [v15 objectForKey:kSecValueData, v23, v24, v25];
        id v17 = [v15 mutableCopy];
        [v17 removeObjectForKey:kSecValueData];
        id v18 = +[MSDKeychainManager sharedInstance];
        unsigned __int8 v19 = [v18 saveItem:v16 forKey:v26 withAttributes:v17];

        if ((v19 & 1) == 0)
        {
          id v21 = sub_100068600();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_1000DC20C();
          }

          BOOL v20 = 0;
          goto LABEL_15;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  BOOL v20 = 1;
LABEL_15:
  id v7 = v24;
  id v6 = v25;
  id v8 = v23;
LABEL_16:

  return v20;
}

- (id)generateRandomBytesWithFixedLength
{
  v2 = malloc_type_malloc(0x20uLL, 0x1D54FF4FuLL);
  if (v2)
  {
    id v3 = v2;
    _OWORD *v2 = 0u;
    v2[1] = 0u;
    uint64_t v4 = SecRandomCopyBytes(kSecRandomDefault, 0x20uLL, v2);
    if (v4)
    {
      uint64_t v6 = v4;
      id v7 = sub_100068600();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000DC274(v6, v7, v8, v9, v10, v11, v12, v13);
      }

      v2 = 0;
    }
    else
    {
      v2 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v3 length:32 freeWhenDone:1];
    }
  }

  return v2;
}

- (BOOL)saveSecretKeyInKeychain:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[MSDKeychainManager sharedInstance];
  unsigned __int8 v5 = [v4 saveItem:v3 forKey:@"com.apple.mobilestoredemo.wifi.key"];

  uint64_t v6 = sub_100068600();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Secret key saved in keychain.", v16, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_1000DC2E0(v7, v9, v10, v11, v12, v13, v14, v15);
  }

  return v5;
}

- (id)copySecretKeyFromKeychain
{
  v2 = +[MSDKeychainManager sharedInstance];
  id v3 = [v2 getItemForKey:@"com.apple.mobilestoredemo.wifi.key"];

  return v3;
}

- (BOOL)deleteSecretKeyInKeychain
{
  v2 = +[MSDKeychainManager sharedInstance];
  unsigned __int8 v3 = [v2 deleteItemForKey:@"com.apple.mobilestoredemo.wifi.key"];

  uint64_t v4 = sub_100068600();
  unsigned __int8 v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Secret key deleted in keychain.", v14, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_1000DC350(v5, v7, v8, v9, v10, v11, v12, v13);
  }

  return v3;
}

- (id)archiveAndEncryptKeychainItems:(id)a3
{
  id v22 = self;
  id v3 = a3;
  v36[0] = kSecAttrService;
  v36[1] = kSecAttrAccount;
  v36[2] = kSecAttrLabel;
  v36[3] = kSecValueData;
  uint64_t v4 = +[NSArray arrayWithObjects:v36 count:4];
  id v24 = objc_alloc_init((Class)NSMutableArray);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v10 = [v9 mutableCopy:v22];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v11 = v9;
        id v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v27;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v27 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * (void)j);
              if (([v4 containsObject:v16] & 1) == 0) {
                [v10 removeObjectForKey:v16];
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v13);
        }

        [v24 addObject:v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }

  id v25 = 0;
  id v17 = +[NSPropertyListSerialization dataWithPropertyList:v24 format:200 options:0 error:&v25];
  id v18 = v25;
  if (v17)
  {
    unsigned __int8 v19 = [(MSDCryptoHandler *)v22 performCryptoWithSecretKeyOnData:v17 isDecipher:0];
    if (v19) {
      goto LABEL_19;
    }
    id v21 = sub_100068600();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000DC428();
    }
  }
  else
  {
    id v21 = sub_100068600();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000DC3C0();
    }
  }

  unsigned __int8 v19 = 0;
LABEL_19:

  return v19;
}

- (id)decryptAndUnarchiveKeychainItems:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[MSDCryptoHandler sharedInstance];
  id v5 = [v4 performCryptoWithSecretKeyOnData:v3 isDecipher:1];

  if (v5)
  {
    id v11 = 0;
    id v6 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:&v11];
    uint64_t v7 = v11;
    if (v6)
    {
      uint64_t v8 = v6;

      uint64_t v7 = v8;
      goto LABEL_4;
    }
    id v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000DC490();
    }
  }
  else
  {
    uint64_t v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000DC45C();
    }
  }
  uint64_t v8 = 0;
LABEL_4:

  return v8;
}

@end