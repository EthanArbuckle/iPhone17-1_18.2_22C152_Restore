@interface CKKSKeychainBackedKey
+ (BOOL)supportsSecureCoding;
+ (id)fetchKeyMaterialItemFromKeychain:(id)a3 resave:(BOOL *)a4 error:(id *)a5;
+ (id)key:(id)a3 wrappedByKey:(id)a4 uuid:(id)a5 parentKeyUUID:(id)a6 keyclass:(id)a7 zoneID:(id)a8 error:(id *)a9;
+ (id)keyWrappedBySelf:(id)a3 uuid:(id)a4 keyclass:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)loadFromProtobuf:(id)a3 error:(id *)a4;
+ (id)queryKeyMaterialInKeychain:(id)a3 error:(id *)a4;
+ (id)randomKeyWrappedByParent:(id)a3 error:(id *)a4;
+ (id)randomKeyWrappedByParent:(id)a3 keyclass:(id)a4 error:(id *)a5;
+ (id)randomKeyWrappedBySelf:(id)a3 error:(id *)a4;
+ (id)setKeyMaterialInKeychain:(id)a3 error:(id *)a4;
- (BOOL)deleteKeyMaterialFromKeychain:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)loadKeyMaterialFromKeychain:(id *)a3;
- (BOOL)saveKeyMaterialToKeychain:(BOOL)a3 error:(id *)a4;
- (BOOL)saveKeyMaterialToKeychain:(id *)a3;
- (BOOL)trySelfWrappedKeyCandidate:(id)a3 error:(id *)a4;
- (BOOL)unwrapSelfWithAESKey:(id)a3 error:(id *)a4;
- (BOOL)wrapUnder:(id)a3 error:(id *)a4;
- (BOOL)wrapsSelf;
- (CKKSAESSIVKey)aessivkey;
- (CKKSKeychainBackedKey)initWithAESKey:(id)a3 wrappedAESKey:(id)a4 uuid:(id)a5 parentKeyUUID:(id)a6 keyclass:(id)a7 zoneID:(id)a8;
- (CKKSKeychainBackedKey)initWithCoder:(id)a3;
- (CKKSKeychainBackedKey)initWithWrappedAESKey:(id)a3 uuid:(id)a4 parentKeyUUID:(id)a5 keyclass:(id)a6 zoneID:(id)a7;
- (CKKSWrappedAESSIVKey)wrappedkey;
- (CKRecordZoneID)zoneID;
- (NSString)parentKeyUUID;
- (NSString)uuid;
- (SecCKKSKeyClass)keyclass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5;
- (id)description;
- (id)encryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5;
- (id)ensureKeyLoadedFromKeychain:(id *)a3;
- (id)serializeAsProtobuf:(id *)a3;
- (id)unwrapAESKey:(id)a3 error:(id *)a4;
- (id)wrapAESKey:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAessivkey:(id)a3;
- (void)setKeyclass:(id)a3;
- (void)setParentKeyUUID:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWrappedkey:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKKSKeychainBackedKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aessivkey, 0);
  objc_storeStrong((id *)&self->_wrappedkey, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_keyclass, 0);
  objc_storeStrong((id *)&self->_parentKeyUUID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setAessivkey:(id)a3
{
}

- (CKKSAESSIVKey)aessivkey
{
  return (CKKSAESSIVKey *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWrappedkey:(id)a3
{
}

- (CKKSWrappedAESSIVKey)wrappedkey
{
  return (CKKSWrappedAESSIVKey *)objc_getProperty(self, a2, 40, 1);
}

- (void)setZoneID:(id)a3
{
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKeyclass:(id)a3
{
}

- (SecCKKSKeyClass)keyclass
{
  return (SecCKKSKeyClass *)objc_getProperty(self, a2, 24, 1);
}

- (void)setParentKeyUUID:(id)a3
{
}

- (NSString)parentKeyUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (CKKSKeychainBackedKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKKSKeychainBackedKey;
  v5 = [(CKKSKeychainBackedKey *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentKeyUUID"];
    parentKeyUUID = v5->_parentKeyUUID;
    v5->_parentKeyUUID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyclass"];
    keyclass = v5->_keyclass;
    v5->_keyclass = (SecCKKSKeyClass *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneID"];
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappedkey"];
    wrappedkey = v5->_wrappedkey;
    v5->_wrappedkey = (CKKSWrappedAESSIVKey *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CKKSKeychainBackedKey *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];

  uint64_t v6 = [(CKKSKeychainBackedKey *)self parentKeyUUID];
  [v4 encodeObject:v6 forKey:@"parentKeyUUID"];

  v7 = [(CKKSKeychainBackedKey *)self keyclass];
  [v4 encodeObject:v7 forKey:@"keyclass"];

  uint64_t v8 = [(CKKSKeychainBackedKey *)self zoneID];
  [v4 encodeObject:v8 forKey:@"zoneID"];

  id v9 = [(CKKSKeychainBackedKey *)self wrappedkey];
  [v4 encodeObject:v9 forKey:@"wrappedkey"];
}

- (id)serializeAsProtobuf:(id *)a3
{
  id v4 = [(CKKSKeychainBackedKey *)self ensureKeyLoadedFromKeychain:a3];

  if (v4)
  {
    v5 = objc_alloc_init(CKKSSerializedKey);
    uint64_t v6 = [(CKKSKeychainBackedKey *)self uuid];
    [(CKKSSerializedKey *)v5 setUuid:v6];

    v7 = [(CKKSKeychainBackedKey *)self zoneID];
    uint64_t v8 = [v7 zoneName];
    [(CKKSSerializedKey *)v5 setZoneName:v8];

    id v9 = [(CKKSKeychainBackedKey *)self keyclass];
    [(CKKSSerializedKey *)v5 setKeyclass:v9];

    id v10 = objc_alloc((Class)NSData);
    v11 = [(CKKSKeychainBackedKey *)self aessivkey];
    uint64_t v12 = [(CKKSKeychainBackedKey *)self aessivkey];
    id v13 = [v10 initWithBytes:v11 + 8 length:v12[11]];
    [(CKKSSerializedKey *)v5 setKey:v13];

    uint64_t v14 = [(CKKSSerializedKey *)v5 data];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(CKKSKeychainBackedKey *)self zoneID];
  uint64_t v6 = [v5 zoneName];
  v7 = [(CKKSKeychainBackedKey *)self uuid];
  uint64_t v8 = [(CKKSKeychainBackedKey *)self keyclass];
  id v9 = +[NSString stringWithFormat:@"<%@(%@): %@ (%@)>", v4, v6, v7, v8];

  return v9;
}

- (BOOL)deleteKeyMaterialFromKeychain:(id *)a3
{
  v19[0] = kSecClass;
  v19[1] = kSecUseDataProtectionKeychain;
  v20[0] = kSecClassInternetPassword;
  v20[1] = &__kCFBooleanTrue;
  v20[2] = @"com.apple.security.ckks";
  v19[2] = kSecAttrAccessGroup;
  v19[3] = kSecAttrDescription;
  v5 = [(CKKSKeychainBackedKey *)self keyclass];
  v20[3] = v5;
  v19[4] = kSecAttrAccount;
  uint64_t v6 = [(CKKSKeychainBackedKey *)self uuid];
  v20[4] = v6;
  v19[5] = kSecAttrServer;
  v7 = [(CKKSKeychainBackedKey *)self zoneID];
  uint64_t v8 = [v7 zoneName];
  v19[6] = kSecReturnData;
  v20[5] = v8;
  v20[6] = &__kCFBooleanTrue;
  id v9 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:7];
  id v10 = [v9 mutableCopy];

  v11 = [(CKKSKeychainBackedKey *)self keyclass];
  LODWORD(v6) = [v11 isEqualToString:@"tlk"];

  if (v6) {
    [v10 setObject:kCFBooleanTrue forKeyedSubscript:kSecAttrSynchronizable];
  }
  uint64_t v12 = SecItemDelete((CFDictionaryRef)v10);
  int v13 = v12;
  if (a3 && v12)
  {
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    uint64_t v14 = +[NSString stringWithFormat:@"Couldn't delete %@ from keychain: %d", self, v12];
    v18 = v14;
    v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    *a3 = +[NSError errorWithDomain:@"securityd" code:v13 userInfo:v15];
  }
  return v13 == 0;
}

- (BOOL)loadKeyMaterialFromKeychain:(id *)a3
{
  char v21 = 0;
  v5 = +[CKKSKeychainBackedKey fetchKeyMaterialItemFromKeychain:self resave:&v21 error:a3];
  uint64_t v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKeyedSubscript:kSecValueData];
    id v8 = [objc_alloc((Class)NSMutableData) initWithBase64EncodedData:v7 options:0];
    if (v8)
    {
      id v9 = [CKKSAESSIVKey alloc];
      id v10 = v8;
      v11 = -[CKKSAESSIVKey initWithBytes:len:](v9, "initWithBytes:len:", [v10 bytes], [v10 length]);
      id v12 = v10;
      memset_s([v12 mutableBytes], (rsize_t)[v12 length], 0, (rsize_t)[v12 length]);
      [(CKKSKeychainBackedKey *)self setAessivkey:v11];
      if (v21)
      {
        int v13 = sub_1000CD884(@"ckkskey", 0);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v23 = self;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Resaving %@ as per request", buf, 0xCu);
        }

        id v20 = 0;
        [(CKKSKeychainBackedKey *)self saveKeyMaterialToKeychain:&v20];
        id v14 = v20;
        if (v14)
        {
          v15 = sub_1000CD884(@"ckkskey", 0);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v23 = self;
            __int16 v24 = 2112;
            id v25 = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Resaving %@ failed: %@", buf, 0x16u);
          }
        }
      }
      v16 = [(CKKSKeychainBackedKey *)self aessivkey];
      BOOL v17 = v16 != 0;
    }
    else
    {
      v18 = sub_1000CD884(@"ckkskey", 0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = self;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unable to unbase64 key: %@", buf, 0xCu);
      }

      if (!a3)
      {
        BOOL v17 = 0;
        goto LABEL_18;
      }
      v11 = +[NSString stringWithFormat:@"unable to unbase64 key: %@", self];
      +[NSError errorWithDomain:@"CKKSErrorDomain" code:36 description:v11];
      BOOL v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_18:
    goto LABEL_19;
  }
  BOOL v17 = 0;
LABEL_19:

  return v17;
}

- (BOOL)saveKeyMaterialToKeychain:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  v7 = [(CKKSKeychainBackedKey *)self ensureKeyLoadedFromKeychain:a4];

  if (!v7) {
    return 0;
  }
  BOOL v44 = v5;
  id v8 = objc_alloc((Class)NSData);
  id v9 = [(CKKSKeychainBackedKey *)self aessivkey];
  id v10 = [(CKKSKeychainBackedKey *)self aessivkey];
  id v11 = [v8 initWithBytes:v9 + 8 length:v10[11]];
  uint64_t v12 = [v11 base64EncodedDataWithOptions:0];

  v52[0] = kSecClass;
  v52[1] = kSecAttrAccessible;
  v53[0] = kSecClassInternetPassword;
  v53[1] = kSecAttrAccessibleWhenUnlocked;
  v52[2] = kSecUseDataProtectionKeychain;
  v52[3] = kSecAttrAccessGroup;
  v53[2] = &__kCFBooleanTrue;
  v53[3] = @"com.apple.security.ckks";
  v52[4] = kSecAttrDescription;
  int v13 = [(CKKSKeychainBackedKey *)self keyclass];
  v53[4] = v13;
  v52[5] = kSecAttrServer;
  id v14 = [(CKKSKeychainBackedKey *)self zoneID];
  v15 = [v14 zoneName];
  v53[5] = v15;
  v52[6] = kSecAttrAccount;
  v16 = [(CKKSKeychainBackedKey *)self uuid];
  v53[6] = v16;
  v52[7] = kSecAttrPath;
  BOOL v17 = [(CKKSKeychainBackedKey *)self parentKeyUUID];
  v53[7] = v17;
  v53[8] = &__kCFBooleanTrue;
  v52[8] = kSecAttrIsInvisible;
  v52[9] = kSecValueData;
  v45 = (void *)v12;
  v53[9] = v12;
  v18 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:10];
  id v19 = [v18 mutableCopy];

  id v20 = [(CKKSKeychainBackedKey *)self keyclass];
  LODWORD(v18) = [v20 isEqualToString:@"tlk"];

  if (v18)
  {
    [v19 setObject:kSecAttrViewHintPCSMasterKey forKeyedSubscript:kSecAttrSyncViewHint];
    [v19 setObject:kCFBooleanTrue forKeyedSubscript:kSecAttrSynchronizable];
  }
  char v21 = [(CKKSKeychainBackedKey *)self keyclass];
  unsigned int v22 = [v21 isEqualToString:@"classC"];

  if (v22) {
    CFStringRef v23 = kSecAttrAccessibleAfterFirstUnlock;
  }
  else {
    CFStringRef v23 = kSecAttrAccessibleWhenUnlocked;
  }
  [v19 setObject:v23 forKeyedSubscript:kSecAttrAccessible];
  id v47 = 0;
  id v24 = +[CKKSKeychainBackedKey setKeyMaterialInKeychain:v19 error:&v47];
  id v25 = v47;
  v26 = v25;
  if (a4 && v25)
  {
    id v27 = [v25 code];
    v50[0] = NSLocalizedDescriptionKey;
    v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Couldn't save %@ to keychain: %d", self, [v26 code]);
    v50[1] = NSUnderlyingErrorKey;
    v51[0] = v28;
    v51[1] = v26;
    v29 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
    *a4 = +[NSError errorWithDomain:@"securityd" code:v27 userInfo:v29];
  }
  if (v44)
  {
    v30 = [(CKKSKeychainBackedKey *)self keyclass];
    unsigned int v31 = [v30 isEqualToString:@"tlk"];

    if (v31)
    {
      v48[0] = kSecClass;
      v48[1] = kSecAttrAccessible;
      v49[0] = kSecClassInternetPassword;
      v49[1] = kSecAttrAccessibleWhenUnlocked;
      v48[2] = kSecUseDataProtectionKeychain;
      v48[3] = kSecAttrAccessGroup;
      v49[2] = &__kCFBooleanTrue;
      v49[3] = @"com.apple.security.ckks";
      v48[4] = kSecAttrDescription;
      v32 = [(CKKSKeychainBackedKey *)self keyclass];
      v33 = [v32 stringByAppendingString:@"-nonsync"];
      v49[4] = v33;
      v48[5] = kSecAttrServer;
      v34 = [(CKKSKeychainBackedKey *)self zoneID];
      v35 = [v34 zoneName];
      v49[5] = v35;
      v48[6] = kSecAttrAccount;
      v36 = [(CKKSKeychainBackedKey *)self uuid];
      v49[6] = v36;
      v48[7] = kSecAttrPath;
      v37 = [(CKKSKeychainBackedKey *)self parentKeyUUID];
      v49[7] = v37;
      v49[8] = &__kCFBooleanTrue;
      v48[8] = kSecAttrIsInvisible;
      v48[9] = kSecValueData;
      v49[9] = v45;
      v38 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:10];
      id v39 = [v38 mutableCopy];

      [v39 setObject:kCFBooleanFalse forKeyedSubscript:kSecAttrSynchronizable];
      id v46 = v26;
      id v40 = +[CKKSKeychainBackedKey setKeyMaterialInKeychain:v39 error:&v46];
      id v41 = v46;

      id v19 = v39;
      v26 = v41;
    }
  }
  BOOL v42 = v26 == 0;

  return v42;
}

- (BOOL)saveKeyMaterialToKeychain:(id *)a3
{
  return [(CKKSKeychainBackedKey *)self saveKeyMaterialToKeychain:1 error:a3];
}

- (id)decryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(CKKSKeychainBackedKey *)self ensureKeyLoadedFromKeychain:a5];
  id v11 = [v10 decryptData:v9 authenticatedData:v8 error:a5];

  return v11;
}

- (id)encryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(CKKSKeychainBackedKey *)self ensureKeyLoadedFromKeychain:a5];
  id v11 = [v10 encryptData:v9 authenticatedData:v8 error:a5];

  return v11;
}

- (id)unwrapAESKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CKKSKeychainBackedKey *)self ensureKeyLoadedFromKeychain:a4];
  id v8 = [v7 unwrapAESKey:v6 error:a4];

  return v8;
}

- (id)wrapAESKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CKKSKeychainBackedKey *)self ensureKeyLoadedFromKeychain:a4];
  id v8 = [v7 wrapAESKey:v6 error:a4];

  return v8;
}

- (BOOL)trySelfWrappedKeyCandidate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(CKKSKeychainBackedKey *)self wrapsSelf])
  {
    v7 = [(CKKSKeychainBackedKey *)self wrappedkey];
    id v8 = [v6 unwrapAESKey:v7 error:a4];

    if (v8 && [v8 isEqual:v6])
    {
      objc_storeStrong((id *)&self->_aessivkey, v8);
      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    if (a4)
    {
      id v10 = +[NSString stringWithFormat:@"%@ is not self-wrapped", self, NSLocalizedDescriptionKey];
      id v14 = v10;
      id v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      *a4 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:18 userInfo:v11];
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (id)ensureKeyLoadedFromKeychain:(id *)a3
{
  BOOL v5 = [(CKKSKeychainBackedKey *)self aessivkey];

  if (v5 || [(CKKSKeychainBackedKey *)self loadKeyMaterialFromKeychain:a3])
  {
    id v6 = [(CKKSKeychainBackedKey *)self aessivkey];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)unwrapSelfWithAESKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CKKSKeychainBackedKey *)self wrappedkey];
  id v8 = [v6 unwrapAESKey:v7 error:a4];

  aessivkey = self->_aessivkey;
  self->_aessivkey = v8;

  return self->_aessivkey != 0;
}

- (BOOL)wrapUnder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CKKSKeychainBackedKey *)self aessivkey];
  id v13 = 0;
  id v8 = [v6 wrapAESKey:v7 error:&v13];
  id v9 = v13;

  if (v8)
  {
    [(CKKSKeychainBackedKey *)self setWrappedkey:v8];
    id v10 = [v6 uuid];
    [(CKKSKeychainBackedKey *)self setParentKeyUUID:v10];
  }
  else
  {
    id v11 = sub_1000CD884(@"ckkskey", 0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "couldn't wrap key: %@", buf, 0xCu);
    }

    if (a4) {
      *a4 = v9;
    }
  }

  return v8 != 0;
}

- (BOOL)wrapsSelf
{
  v3 = [(CKKSKeychainBackedKey *)self uuid];
  id v4 = [(CKKSKeychainBackedKey *)self parentKeyUUID];
  unsigned __int8 v5 = [v3 isEqual:v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(CKKSKeychainBackedKey *)self uuid];
    v7 = [v5 uuid];
    if ([v6 isEqual:v7])
    {
      id v8 = [(CKKSKeychainBackedKey *)self parentKeyUUID];
      id v9 = [v5 parentKeyUUID];
      if ([v8 isEqual:v9])
      {
        id v10 = [(CKKSKeychainBackedKey *)self zoneID];
        id v11 = [v5 zoneID];
        if ([v10 isEqual:v11])
        {
          uint64_t v12 = [(CKKSKeychainBackedKey *)self wrappedkey];
          v18 = [v5 wrappedkey];
          if (objc_msgSend(v12, "isEqual:"))
          {
            v16 = [(CKKSKeychainBackedKey *)self keyclass];
            [v5 keyclass];
            v13 = BOOL v17 = v12;
            unsigned __int8 v14 = [v16 isEqual:v13];

            uint64_t v12 = v17;
          }
          else
          {
            unsigned __int8 v14 = 0;
          }
        }
        else
        {
          unsigned __int8 v14 = 0;
        }
      }
      else
      {
        unsigned __int8 v14 = 0;
      }
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CKKSKeychainBackedKey allocWithZone:a3];
  id v5 = [(CKKSKeychainBackedKey *)self aessivkey];
  id v6 = [v5 copy];
  v7 = [(CKKSKeychainBackedKey *)self wrappedkey];
  id v8 = [(CKKSKeychainBackedKey *)self uuid];
  id v9 = [(CKKSKeychainBackedKey *)self parentKeyUUID];
  id v10 = [(CKKSKeychainBackedKey *)self keyclass];
  id v11 = [(CKKSKeychainBackedKey *)self zoneID];
  uint64_t v12 = [(CKKSKeychainBackedKey *)v4 initWithAESKey:v6 wrappedAESKey:v7 uuid:v8 parentKeyUUID:v9 keyclass:v10 zoneID:v11];

  return v12;
}

- (CKKSKeychainBackedKey)initWithAESKey:(id)a3 wrappedAESKey:(id)a4 uuid:(id)a5 parentKeyUUID:(id)a6 keyclass:(id)a7 zoneID:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CKKSKeychainBackedKey;
  v18 = [(CKKSKeychainBackedKey *)&v24 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uuid, a5);
    objc_storeStrong((id *)&v19->_parentKeyUUID, a6);
    objc_storeStrong((id *)&v19->_zoneID, a8);
    objc_storeStrong((id *)&v19->_wrappedkey, a4);
    objc_storeStrong((id *)&v19->_keyclass, a7);
    objc_storeStrong((id *)&v19->_aessivkey, a3);
  }

  return v19;
}

- (CKKSKeychainBackedKey)initWithWrappedAESKey:(id)a3 uuid:(id)a4 parentKeyUUID:(id)a5 keyclass:(id)a6 zoneID:(id)a7
{
  return [(CKKSKeychainBackedKey *)self initWithAESKey:0 wrappedAESKey:a3 uuid:a4 parentKeyUUID:a5 keyclass:a6 zoneID:a7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)loadFromProtobuf:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[CKKSSerializedKey alloc] initWithData:v5];

  if (!v6) {
    goto LABEL_9;
  }
  uint64_t v7 = [(CKKSSerializedKey *)v6 uuid];
  if (!v7) {
    goto LABEL_9;
  }
  id v8 = (void *)v7;
  uint64_t v9 = [(CKKSSerializedKey *)v6 zoneName];
  if (!v9) {
    goto LABEL_8;
  }
  id v10 = (void *)v9;
  uint64_t v11 = [(CKKSSerializedKey *)v6 keyclass];
  if (!v11)
  {

LABEL_8:
    goto LABEL_9;
  }
  uint64_t v12 = (void *)v11;
  id v13 = [(CKKSSerializedKey *)v6 key];

  if (v13)
  {
    unsigned __int8 v14 = [CKKSAESSIVKey alloc];
    id v15 = [(CKKSSerializedKey *)v6 key];
    id v16 = [v15 bytes];
    id v17 = [(CKKSSerializedKey *)v6 key];
    v18 = -[CKKSAESSIVKey initWithBytes:len:](v14, "initWithBytes:len:", v16, [v17 length]);

    id v19 = [(CKKSSerializedKey *)v6 uuid];
    id v20 = [(CKKSSerializedKey *)v6 keyclass];
    id v21 = objc_alloc((Class)CKRecordZoneID);
    id v22 = [(CKKSSerializedKey *)v6 zoneName];
    id v23 = [v21 initWithZoneName:v22 ownerName:CKCurrentUserDefaultName];
    objc_super v24 = +[CKKSKeychainBackedKey keyWrappedBySelf:v18 uuid:v19 keyclass:v20 zoneID:v23 error:a4];

    goto LABEL_12;
  }
LABEL_9:
  if (a4)
  {
    +[NSError errorWithDomain:@"CKKSErrorDomain" code:21 description:@"Data failed to parse as a CKKSSerializedKey"];
    objc_super v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v24 = 0;
  }
LABEL_12:

  return v24;
}

+ (id)fetchKeyMaterialItemFromKeychain:(id)a3 resave:(BOOL *)a4 error:(id *)a5
{
  id v7 = a3;
  v78[0] = kSecClass;
  v78[1] = kSecUseDataProtectionKeychain;
  v79[0] = kSecClassInternetPassword;
  v79[1] = &__kCFBooleanTrue;
  v79[2] = @"com.apple.security.ckks";
  v78[2] = kSecAttrAccessGroup;
  v78[3] = kSecAttrDescription;
  id v8 = [v7 keyclass];
  v79[3] = v8;
  v78[4] = kSecAttrAccount;
  uint64_t v9 = [v7 uuid];
  v79[4] = v9;
  v78[5] = kSecAttrServer;
  id v10 = [v7 zoneID];
  uint64_t v11 = [v10 zoneName];
  v79[5] = v11;
  v78[6] = kSecAttrPath;
  uint64_t v12 = [v7 parentKeyUUID];
  v79[6] = v12;
  v79[7] = &__kCFBooleanTrue;
  v78[7] = kSecReturnAttributes;
  v78[8] = kSecReturnData;
  v79[8] = &__kCFBooleanTrue;
  id v13 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:9];
  id v14 = [v13 mutableCopy];

  id v15 = [v7 keyclass];
  LODWORD(v10) = [v15 isEqualToString:@"tlk"];

  if (v10) {
    [v14 setObject:kCFBooleanTrue forKeyedSubscript:kSecAttrSynchronizable];
  }
  id v65 = 0;
  id v16 = a1;
  id v17 = [a1 queryKeyMaterialInKeychain:v14 error:&v65];
  id v18 = v65;
  id v19 = v18;
  if (v17)
  {
    id v20 = v17;
    id v21 = v20;
    id v22 = v14;
    id v23 = v19;
LABEL_5:
    objc_super v24 = v20;
    goto LABEL_6;
  }
  if (!v18 || [v18 code] == (id)-25300)
  {
    v59 = a5;

    v26 = [v7 keyclass];
    unsigned int v27 = [v26 isEqualToString:@"tlk"];

    if (v27)
    {
      v74[0] = kSecClass;
      v74[1] = kSecUseDataProtectionKeychain;
      v75[0] = kSecClassInternetPassword;
      v75[1] = &__kCFBooleanTrue;
      v75[2] = @"com.apple.security.ckks";
      v74[2] = kSecAttrAccessGroup;
      v74[3] = kSecAttrDescription;
      v58 = [v7 keyclass];
      v57 = [v58 stringByAppendingString:@"-piggy"];
      v75[3] = v57;
      v75[4] = kSecAttrSynchronizableAny;
      v74[4] = kSecAttrSynchronizable;
      v74[5] = kSecAttrAccount;
      v28 = [v7 uuid];
      v29 = +[NSString stringWithFormat:@"%@-piggy", v28];
      v75[5] = v29;
      v74[6] = kSecAttrServer;
      v30 = [v7 zoneID];
      unsigned int v31 = [v30 zoneName];
      v75[6] = v31;
      v75[7] = &__kCFBooleanTrue;
      v74[7] = kSecReturnAttributes;
      v74[8] = kSecReturnData;
      v74[9] = kSecMatchLimit;
      v75[8] = &__kCFBooleanTrue;
      v75[9] = kSecMatchLimitOne;
      v32 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:10];
      id v22 = [v32 mutableCopy];

      id v16 = a1;
      id v64 = 0;
      objc_super v24 = [a1 queryKeyMaterialInKeychain:v22 error:&v64];
      id v33 = v64;
      if (!v33)
      {
        id v47 = sub_1000CD884(@"ckkskey", 0);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = [v7 uuid];
          *(_DWORD *)buf = 138412290;
          v73 = v48;
          v49 = "loaded a piggy TLK (%@)";
LABEL_33:
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, v49, buf, 0xCu);
        }
LABEL_34:

        if (a4) {
          *a4 = 1;
        }
        id v20 = v24;
        id v21 = v20;
        id v23 = 0;
        goto LABEL_5;
      }
      id v23 = v33;
      if ([v33 code] != (id)-25300)
      {
        if (!v59)
        {
LABEL_40:
          id v21 = 0;
          goto LABEL_6;
        }
        v50 = v59;
        id v51 = [v23 code];
        v70[0] = NSLocalizedDescriptionKey;
        v52 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Couldn't load %@ from keychain: %d", v7, [v23 code]);
        v70[1] = NSUnderlyingErrorKey;
        v71[0] = v52;
        v71[1] = v23;
        v53 = v71;
        v54 = v70;
LABEL_39:
        v55 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v54 count:2];
        id *v50 = +[NSError errorWithDomain:@"securityd" code:v51 userInfo:v55];

        goto LABEL_40;
      }
      id v14 = v22;
      v34 = v24;
    }
    else
    {
      id v23 = 0;
      v34 = 0;
    }

    v35 = [v7 keyclass];
    unsigned int v36 = [v35 isEqualToString:@"tlk"];

    if (!v36)
    {
      id v23 = 0;
      id v22 = v14;
      goto LABEL_24;
    }
    v68[0] = kSecClass;
    v68[1] = kSecUseDataProtectionKeychain;
    v69[0] = kSecClassInternetPassword;
    v69[1] = &__kCFBooleanTrue;
    v69[2] = @"com.apple.security.ckks";
    v68[2] = kSecAttrAccessGroup;
    v68[3] = kSecAttrDescription;
    v61 = [v7 keyclass];
    v37 = [v61 stringByAppendingString:@"-nonsync"];
    v69[3] = v37;
    v68[4] = kSecAttrServer;
    v38 = [v7 zoneID];
    id v39 = [v38 zoneName];
    v69[4] = v39;
    v68[5] = kSecAttrAccount;
    [v7 uuid];
    id v40 = v62 = v16;
    v69[5] = v40;
    v69[6] = &__kCFBooleanTrue;
    v68[6] = kSecReturnAttributes;
    v68[7] = kSecReturnData;
    v68[8] = kSecAttrSynchronizable;
    v69[7] = &__kCFBooleanTrue;
    v69[8] = &__kCFBooleanFalse;
    id v41 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:9];
    id v22 = [v41 mutableCopy];

    id v63 = 0;
    objc_super v24 = [v62 queryKeyMaterialInKeychain:v22 error:&v63];
    id v23 = v63;

    if (v23)
    {
      if ([v23 code] == (id)-25300)
      {
        v34 = v24;
LABEL_24:
        if (v59)
        {
          v45 = v34;
          if (v19) {
            uint64_t v46 = (uint64_t)[v19 code];
          }
          else {
            uint64_t v46 = -50;
          }
          v56 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Couldn't load %@ from keychain: %d", v7, [v19 code]);
          id *v59 = +[NSError errorWithDomain:@"securityd" code:v46 description:v56 underlying:v19];

          v34 = v45;
        }
        id v20 = v34;
        id v21 = v20;
        goto LABEL_5;
      }
      if (!v59) {
        goto LABEL_40;
      }
      v50 = v59;
      id v51 = [v23 code];
      v66[0] = NSLocalizedDescriptionKey;
      v52 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Couldn't load %@ from keychain: %d", v7, [v23 code]);
      v66[1] = NSUnderlyingErrorKey;
      v67[0] = v52;
      v67[1] = v23;
      v53 = v67;
      v54 = v66;
      goto LABEL_39;
    }
    id v47 = sub_1000CD884(@"ckkskey", 0);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = [v7 uuid];
      *(_DWORD *)buf = 138412290;
      v73 = v48;
      v49 = "loaded a stashed TLK (%@)";
      goto LABEL_33;
    }
    goto LABEL_34;
  }
  id v21 = a5;
  if (a5)
  {
    id v42 = [v19 code];
    v76[0] = NSLocalizedDescriptionKey;
    v43 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Couldn't load %@ from keychain: %d", v7, [v19 code]);
    v76[1] = NSUnderlyingErrorKey;
    v77[0] = v43;
    v77[1] = v19;
    BOOL v44 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
    *id v21 = +[NSError errorWithDomain:@"securityd" code:v42 userInfo:v44];

    id v21 = 0;
  }
  objc_super v24 = 0;
  id v22 = v14;
  id v23 = v19;
LABEL_6:

  return v21;
}

+ (id)queryKeyMaterialInKeychain:(id)a3 error:(id *)a4
{
  CFTypeRef result = 0;
  uint64_t v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  id v6 = (void *)result;
  if (v5)
  {
    if (result)
    {
      CFTypeRef result = 0;
      CFRelease(v6);
    }
    if (a4)
    {
      uint64_t v7 = (int)v5;
      NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
      id v8 = +[NSString stringWithFormat:@"SecItemCopyMatching: %d", v5];
      id v13 = v8;
      uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      *a4 = +[NSError errorWithDomain:@"securityd" code:v7 userInfo:v9];
    }
    id v6 = 0;
  }

  return v6;
}

+ (id)setKeyMaterialInKeychain:(id)a3 error:(id *)a4
{
  CFDictionaryRef v5 = (const __CFDictionary *)a3;
  CFTypeRef result = 0;
  uint64_t v6 = SecItemAdd(v5, &result);
  if (v6 == -25299)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    id v8 = [(__CFDictionary *)v5 objectForKeyedSubscript:kSecClass];
    [v7 setObject:v8 forKeyedSubscript:kSecClass];

    uint64_t v9 = [(__CFDictionary *)v5 objectForKeyedSubscript:kSecAttrSynchronizable];
    [v7 setObject:v9 forKeyedSubscript:kSecAttrSynchronizable];

    id v10 = [(__CFDictionary *)v5 objectForKeyedSubscript:kSecAttrSyncViewHint];
    [v7 setObject:v10 forKeyedSubscript:kSecAttrSyncViewHint];

    uint64_t v11 = [(__CFDictionary *)v5 objectForKeyedSubscript:kSecAttrAccessGroup];
    [v7 setObject:v11 forKeyedSubscript:kSecAttrAccessGroup];

    NSErrorUserInfoKey v12 = [(__CFDictionary *)v5 objectForKeyedSubscript:kSecAttrAccount];
    [v7 setObject:v12 forKeyedSubscript:kSecAttrAccount];

    id v13 = [(__CFDictionary *)v5 objectForKeyedSubscript:kSecAttrServer];
    [v7 setObject:v13 forKeyedSubscript:kSecAttrServer];

    id v14 = [(__CFDictionary *)v5 objectForKeyedSubscript:kSecAttrPath];
    [v7 setObject:v14 forKeyedSubscript:kSecAttrPath];

    id v15 = [(__CFDictionary *)v5 objectForKeyedSubscript:kSecUseDataProtectionKeychain];
    [v7 setObject:v15 forKeyedSubscript:kSecUseDataProtectionKeychain];

    id v16 = [(__CFDictionary *)v5 mutableCopy];
    [v16 setObject:0 forKeyedSubscript:kSecClass];
    uint64_t v17 = SecItemUpdate((CFDictionaryRef)v7, (CFDictionaryRef)v16);
    if (v17)
    {
      id v18 = +[NSString stringWithFormat:@"SecItemUpdate: %d", v17];
      id v19 = +[NSError errorWithDomain:@"securityd" code:(int)v17 description:v18];
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    LODWORD(v17) = v6;
    uint64_t v20 = (int)v6;
    id v7 = +[NSString stringWithFormat:@"SecItemAdd: %d", v6];
    id v19 = +[NSError errorWithDomain:@"securityd" code:v20 description:v7];
  }

  id v21 = (void *)result;
  if (v17)
  {
    if (result)
    {
      CFTypeRef result = 0;
      CFRelease(v21);
    }
    id v21 = 0;
    if (a4) {
      *a4 = v19;
    }
  }

  return v21;
}

+ (id)key:(id)a3 wrappedByKey:(id)a4 uuid:(id)a5 parentKeyUUID:(id)a6 keyclass:(id)a7 zoneID:(id)a8 error:(id *)a9
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v24 = 0;
  id v19 = [a4 wrapAESKey:v14 error:&v24];
  id v20 = v24;
  if (v19)
  {
    id v21 = [[CKKSKeychainBackedKey alloc] initWithAESKey:v14 wrappedAESKey:v19 uuid:v15 parentKeyUUID:v16 keyclass:v17 zoneID:v18];
  }
  else
  {
    id v22 = sub_1000CD884(@"ckkskey", 0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v20;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "couldn't wrap key: %@", buf, 0xCu);
    }

    id v21 = 0;
    if (a9) {
      *a9 = v20;
    }
  }

  return v21;
}

+ (id)keyWrappedBySelf:(id)a3 uuid:(id)a4 keyclass:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  return [a1 key:a3 wrappedByKey:a3 uuid:a4 parentKeyUUID:a4 keyclass:a5 zoneID:a6 error:a7];
}

+ (id)randomKeyWrappedBySelf:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[CKKSAESSIVKey randomKey:a4];
  if (v7)
  {
    id v8 = +[NSUUID UUID];
    uint64_t v9 = [v8 UUIDString];
    id v10 = [a1 keyWrappedBySelf:v7 uuid:v9 keyclass:@"tlk" zoneID:v6 error:a4];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)randomKeyWrappedByParent:(id)a3 keyclass:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[CKKSAESSIVKey randomKey:a5];
  if (v9)
  {
    id v10 = [v7 wrapAESKey:v9 error:a5];
    if (v10)
    {
      uint64_t v11 = [CKKSKeychainBackedKey alloc];
      NSErrorUserInfoKey v12 = +[NSUUID UUID];
      id v13 = [v12 UUIDString];
      id v14 = [v7 uuid];
      id v15 = [v7 zoneID];
      id v16 = [(CKKSKeychainBackedKey *)v11 initWithAESKey:v9 wrappedAESKey:v10 uuid:v13 parentKeyUUID:v14 keyclass:v8 zoneID:v15];
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)randomKeyWrappedByParent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 keyclass];
  id v8 = [a1 randomKeyWrappedByParent:v6 keyclass:v7 error:a4];

  return v8;
}

@end