@interface EPKey
+ (id)derivedKeyFrom:(id)a3 salt:(id)a4;
+ (id)keyFromData:(id)a3;
+ (id)paddedSalt:(id)a3 forEncryption:(BOOL)a4;
+ (id)randomData:(unint64_t)a3;
+ (id)timeDerivedKeyFrom:(id)a3 keyIndex:(int64_t)a4 salt:(id)a5;
+ (id)timeDerivedKeyFrom:(id)a3 keyIndex:(int64_t)a4 salt:(id)a5 date:(id)a6;
- (BOOL)storeKey:(id)a3;
- (NRPBMigrationKeyForKeychain)key;
- (NSData)legacyKey;
- (id)decryptPayload:(id)a3;
- (id)decryptPayloadRaw:(id)a3 withSalt:(id)a4 date:(id)a5;
- (id)decryptPayloadRaw:(id)a3 withSalt:(id)a4 key:(id)a5;
- (id)encryptPayload:(id)a3;
- (id)encryptPayloadRaw:(id)a3 withSalt:(id)a4 date:(id)a5;
- (id)encryptPayloadRaw:(id)a3 withSalt:(id)a4 key:(id)a5;
@end

@implementation EPKey

+ (id)randomData:(unint64_t)a3
{
  id v3 = [objc_alloc((Class)NSMutableData) initWithLength:a3];
  id v4 = [v3 length];
  id v5 = v3;
  if (SecRandomCopyBytes(kSecRandomDefault, (size_t)v4, [v5 mutableBytes]))
  {
    v6 = nr_daemon_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      v8 = nr_daemon_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000FBEEC();
      }
    }
    id v9 = 0;
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

+ (id)paddedSalt:(id)a3 forEncryption:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4) {
    CFStringRef v6 = @"EEE5EDA5-3A09-4C03-85B8-0CB4E21F177E";
  }
  else {
    CFStringRef v6 = @"6B9E7887-637E-45F5-BB83-CB02708CB573";
  }
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
  v8 = v7;
  if (v7)
  {
    v19[0] = 0;
    v19[1] = 0;
    [v7 getUUIDBytes:v19];
    id v9 = [v5 mutableCopy];
    [v9 appendBytes:v19 length:16];
    if (v5 && v9 && (v10 = (char *)[v9 length], v10 == (char *)objc_msgSend(v5, "length") + 16))
    {
      id v11 = v9;
    }
    else
    {
      v12 = nr_framework_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (v13)
      {
        v14 = nr_framework_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1000FBF54();
        }
      }
      id v11 = 0;
    }
  }
  else
  {
    v15 = nr_framework_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      v17 = nr_framework_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000FBF20();
      }
    }
    id v11 = 0;
  }

  return v11;
}

- (NSData)legacyKey
{
  return (NSData *)+[EPKeychain retrieveKeyWithName:@"migration" keychainGroup:@"com.apple.nanoregistry.migration"];
}

- (NRPBMigrationKeyForKeychain)key
{
  id v3 = [NRPBMigrationKeyForKeychain alloc];
  BOOL v4 = [(EPKey *)self keymaster];
  id v5 = [v4 name];
  CFStringRef v6 = +[EPKeychain retrieveKeyWithName:v5 keychainGroup:@"com.apple.nanoregistry.migration2"];
  id v7 = [(NRPBMigrationKeyForKeychain *)v3 initWithData:v6];

  return v7;
}

- (id)encryptPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(EPKey *)self key];
  CFStringRef v6 = sub_10001D51C((uint64_t)v5);

  if (v6 || ([(EPKey *)self legacyKey], (CFStringRef v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = [(id)objc_opt_class() randomData:8];
    if (v7)
    {
      v8 = [(id)objc_opt_class() paddedSalt:v7 forEncryption:1];
      if (v8)
      {
        id v9 = objc_opt_new();
        sub_100071138((uint64_t)v9, v7);
        v10 = +[NSDate date];
        id v11 = [(EPKey *)self encryptPayloadRaw:v4 withSalt:v8 date:v10];
        sub_100071150((uint64_t)v9, v11);

        v12 = sub_1000712E8((uint64_t)v9);

        if (v12)
        {
          v12 = [v9 data];
        }

        goto LABEL_16;
      }
      v15 = nr_framework_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (v16)
      {
        v17 = nr_framework_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1000FBFF0();
        }
      }
    }
    else
    {
      BOOL v13 = nr_daemon_log();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

      if (!v14)
      {
        v12 = 0;
        goto LABEL_17;
      }
      v8 = nr_daemon_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000FBFBC();
      }
    }
    v12 = 0;
LABEL_16:

LABEL_17:
LABEL_18:

    goto LABEL_19;
  }
  v19 = nr_framework_log();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

  if (v20)
  {
    CFStringRef v6 = nr_framework_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FBF88();
    }
    v12 = 0;
    goto LABEL_18;
  }
  v12 = 0;
LABEL_19:

  return v12;
}

- (id)decryptPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(EPKey *)self key];
  CFStringRef v6 = sub_10001D51C((uint64_t)v5);

  if (v6 || ([(EPKey *)self legacyKey], (CFStringRef v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = [[NRPBBTMigrationCiphertext alloc] initWithData:v4];
    v8 = objc_opt_class();
    id v9 = sub_1000712D4((uint64_t)v7);
    v10 = [v8 paddedSalt:v9 forEncryption:0];

    if (v10)
    {
      id v11 = sub_1000712E8((uint64_t)v7);
      v12 = +[NSDate date];
      BOOL v13 = [(EPKey *)self decryptPayloadRaw:v11 withSalt:v10 date:v12];
    }
    else
    {
      BOOL v14 = nr_framework_log();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

      if (v15)
      {
        BOOL v16 = nr_framework_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1000FBFF0();
        }
      }
      BOOL v13 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  v18 = nr_framework_log();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

  if (v19)
  {
    CFStringRef v6 = nr_framework_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FC024();
    }
    BOOL v13 = 0;
    goto LABEL_11;
  }
  BOOL v13 = 0;
LABEL_12:

  return v13;
}

- (id)encryptPayloadRaw:(id)a3 withSalt:(id)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(EPKey *)self key];
  v12 = sub_10001D51C((uint64_t)v11);

  if (v12 || ([(EPKey *)self legacyKey], (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v13 = +[EPKey timeDerivedKeyFrom:v12 keyIndex:0 salt:v9 date:v10];
    if (v13)
    {
      BOOL v14 = [(EPKey *)self encryptPayloadRaw:v8 withSalt:v9 key:v13];
    }
    else
    {
      BOOL v15 = nr_framework_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (v16)
      {
        v17 = nr_framework_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1000FC08C();
        }
      }
      BOOL v14 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  BOOL v19 = nr_framework_log();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

  if (v20)
  {
    v12 = nr_framework_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000FC058();
    }
    BOOL v14 = 0;
    goto LABEL_11;
  }
  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (id)decryptPayloadRaw:(id)a3 withSalt:(id)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(EPKey *)self key];
  v12 = sub_10001D51C((uint64_t)v11);

  if (v12 || ([(EPKey *)self legacyKey], (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v13 = 0;
    while (1)
    {
      BOOL v14 = +[EPKey timeDerivedKeyFrom:v12 keyIndex:v13 salt:v9 date:v10];
      if (v14)
      {
        uint64_t v15 = [(EPKey *)self decryptPayloadRaw:v8 withSalt:v9 key:v14];
        if (v15)
        {
          BOOL v16 = (void *)v15;
          goto LABEL_17;
        }
      }
      if (v13)
      {
        if (v13 == 1)
        {
          v17 = nr_framework_log();
          BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

          if (v18)
          {
            BOOL v19 = nr_framework_log();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              sub_1000FC0F4();
            }
          }
          BOOL v16 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        uint64_t v13 = 1;
      }
      else
      {
        uint64_t v13 = -1;
      }
    }
  }
  v21 = nr_framework_log();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

  if (v22)
  {
    v12 = nr_framework_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000FC0C0();
    }
    BOOL v16 = 0;
    goto LABEL_18;
  }
  BOOL v16 = 0;
LABEL_19:

  return v16;
}

- (id)encryptPayloadRaw:(id)a3 withSalt:(id)a4 key:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  if (v7)
  {
    id v8 = [v6 NRSHA256];
    if (v8)
    {
      id v9 = [v6 mutableCopy];
      [v9 appendData:v8];
      id v10 = +[NSInputStream inputStreamWithData:v9];
      id v11 = +[NSOutputStream outputStreamToMemory];
      [v10 open];
      [v11 open];
      uint64_t v12 = sub_1000DAA14((__CFReadStream *)v10, (__CFWriteStream *)v11, (uint64_t)[v7 bytes]);
      [v10 close];
      [v11 close];
      if (v12)
      {
        uint64_t v13 = nr_framework_log();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

        if (v14)
        {
          uint64_t v15 = nr_framework_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_1000FC190(v12);
          }
        }
        BOOL v16 = 0;
      }
      else
      {
        BOOL v16 = [v11 propertyForKey:NSStreamDataWrittenToMemoryStreamKey];
      }

LABEL_20:
      goto LABEL_21;
    }
    BOOL v19 = nr_framework_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

    if (v20)
    {
      id v9 = nr_framework_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000FC15C();
      }
      BOOL v16 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    v17 = nr_framework_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

    if (!v18)
    {
      BOOL v16 = 0;
      goto LABEL_22;
    }
    id v8 = nr_framework_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000FC128();
    }
  }
  BOOL v16 = 0;
LABEL_21:

LABEL_22:

  return v16;
}

- (id)decryptPayloadRaw:(id)a3 withSalt:(id)a4 key:(id)a5
{
  id v6 = a5;
  if (v6)
  {
    id v7 = +[NSInputStream inputStreamWithData:a3];
    id v8 = +[NSOutputStream outputStreamToMemory];
    [v7 open];
    [v8 open];
    int v9 = sub_1000DAA14((__CFReadStream *)v7, (__CFWriteStream *)v8, (uint64_t)[v6 bytes]);
    [v8 close];
    [v7 close];
    id v10 = [v8 propertyForKey:NSStreamDataWrittenToMemoryStreamKey];
    if ((unint64_t)[v10 length] < 0x21)
    {
      id v13 = 0;
    }
    else
    {
      id v11 = [v10 subdataWithRange:0, [v10 length] - 32];
      uint64_t v12 = [v10 subdataWithRange:[v11 length] length:32];
      id v13 = 0;
      if (!v9)
      {
        BOOL v14 = [v11 NRSHA256];
        unsigned int v15 = [v12 isEqual:v14];

        if (v15) {
          id v13 = v11;
        }
        else {
          id v13 = 0;
        }
      }
    }
  }
  else
  {
    BOOL v16 = nr_framework_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      BOOL v18 = nr_framework_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000FC224();
      }
    }
    id v13 = 0;
  }

  return v13;
}

+ (id)keyFromData:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  sub_10001D354((uint64_t)v4, v3);
  int v7 = 0;
  do
  {
    id v5 = +[EPKey randomData:4];
    [v5 getBytes:&v7 length:[v5 length]];
  }
  while (v7 < 1);
  sub_10001CF0C((uint64_t)v4, v7);

  return v4;
}

- (BOOL)storeKey:(id)a3
{
  id v4 = +[EPKey keyFromData:a3];
  id v5 = +[EPKeychain removeKeyWithName:@"migration" keychainGroup:@"com.apple.nanoregistry.migration"];
  id v6 = [(EPKey *)self keymaster];
  int v7 = [v6 name];
  id v8 = +[EPKeychain removeKeyWithName:v7 keychainGroup:@"com.apple.nanoregistry.migration"];

  int v9 = [(EPKey *)self keymaster];
  id v10 = [v9 name];
  id v11 = +[EPKeychain removeKeyWithName:v10 keychainGroup:@"com.apple.nanoregistry.migration2"];

  uint64_t v12 = sub_10001D51C((uint64_t)v4);
  unsigned int v13 = +[EPKeychain storeKeyWithData:v12 name:@"migration" keychainGroup:@"com.apple.nanoregistry.migration"];

  BOOL v14 = [v4 data];
  unsigned int v15 = [(EPKey *)self keymaster];
  BOOL v16 = [v15 name];
  unsigned __int8 v17 = +[EPKeychain storeKeyWithData:v14 name:v16 keychainGroup:@"com.apple.nanoregistry.migration2"];

  char v18 = v13 & v17;
  if ((v13 & v17 & 1) == 0)
  {
    BOOL v19 = sub_1000A3CF0();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

    if (v20)
    {
      v21 = sub_1000A3CF0();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        if (v13) {
          CFStringRef v23 = 0;
        }
        else {
          CFStringRef v23 = @"migration";
        }
        if (v17)
        {
          v24 = 0;
        }
        else
        {
          self = [(EPKey *)self keymaster];
          v24 = [(EPKey *)self name];
        }
        int v25 = 138412546;
        CFStringRef v26 = v23;
        __int16 v27 = 2112;
        v28 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "EPKey: Unable to store key %@ %@", (uint8_t *)&v25, 0x16u);
        if ((v17 & 1) == 0)
        {
        }
      }
    }
  }

  return v18;
}

+ (id)derivedKeyFrom:(id)a3 salt:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v5 length] < 0x20)
  {
    BOOL v20 = nr_framework_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

    if (!v21)
    {
      BOOL v22 = 0;
      goto LABEL_14;
    }
    BOOL v14 = nr_framework_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000FC2EC();
    }
  }
  else
  {
    int v7 = +[NSMutableData dataWithLength:32];
    id v8 = v5;
    int v9 = (const char *)[v8 bytes];
    id v10 = [v8 length];
    id v11 = v6;
    uint64_t v12 = (const uint8_t *)[v11 bytes];
    id v13 = [v11 length];
    BOOL v14 = v7;
    uint64_t v15 = CCKeyDerivationPBKDF(2u, v9, (size_t)v10, v12, (size_t)v13, 3u, 0x2710u, (uint8_t *)[v14 mutableBytes], (size_t)[v14 length]);
    if (!v15)
    {
      BOOL v14 = v14;
      BOOL v22 = v14;
      goto LABEL_13;
    }
    uint64_t v16 = v15;
    unsigned __int8 v17 = nr_framework_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

    if (v18)
    {
      BOOL v19 = nr_framework_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000FC258(v16);
      }
    }
  }
  BOOL v22 = 0;
LABEL_13:

LABEL_14:

  return v22;
}

+ (id)timeDerivedKeyFrom:(id)a3 keyIndex:(int64_t)a4 salt:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  int v9 = objc_opt_class();
  id v10 = +[NSDate date];
  id v11 = [v9 timeDerivedKeyFrom:v8 keyIndex:a4 salt:v7 date:v10];

  return v11;
}

+ (id)timeDerivedKeyFrom:(id)a3 keyIndex:(int64_t)a4 salt:(id)a5 date:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if ((unint64_t)(a4 - 2) > 0xFFFFFFFFFFFFFFFCLL)
  {
    [v12 timeIntervalSinceReferenceDate];
    if ((unint64_t)v17)
    {
      unint64_t v23 = a4 + (unint64_t)v17 / 0x12C;
      BOOL v18 = +[NSMutableData dataWithBytes:&v23 length:8];
      [v18 appendData:v10];
      BOOL v19 = [a1 derivedKeyFrom:v18 salt:v11];

      goto LABEL_12;
    }
    BOOL v20 = nr_framework_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

    if (v21)
    {
      uint64_t v16 = nr_framework_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000FC354();
      }
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v14 = nr_framework_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (v15)
    {
      uint64_t v16 = nr_framework_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000FC320();
      }
LABEL_10:
    }
  }
  BOOL v19 = 0;
LABEL_12:

  return v19;
}

@end