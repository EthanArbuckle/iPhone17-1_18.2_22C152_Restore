@interface CKKSKey
+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 flagHandler:(id)a6 error:(id *)a7;
+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (id)allKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)countsByClassWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)countsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)currentKeyForClass:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)currentKeysForClass:(id)a3 contextID:(id)a4 state:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)fromDatabaseAnyState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)fromDatabaseRow:(id)a3;
+ (id)isItemKeyForKeychainView:(SecDbItem *)a3;
+ (id)loadFromProtobuf:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (id)loadKeyWithUUID:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)localKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)randomKeyWrappedByParent:(id)a3 error:(id *)a4;
+ (id)randomKeyWrappedByParent:(id)a3 keyclass:(id)a4 error:(id *)a5;
+ (id)randomKeyWrappedBySelf:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (id)remoteKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ selfWrappedKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)tryFromDatabaseAnyState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
- (BOOL)currentkey;
- (BOOL)deleteKeyMaterialFromKeychain:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)loadKeyMaterialFromKeychain:(id *)a3;
- (BOOL)matchesCKRecord:(id)a3;
- (BOOL)saveKeyMaterialToKeychain:(BOOL)a3 error:(id *)a4;
- (BOOL)saveKeyMaterialToKeychain:(id *)a3;
- (BOOL)saveToDatabaseAsOnlyCurrentKeyForClassAndState:(id *)a3;
- (BOOL)tlkMaterialPresentOrRecoverableViaTLKShareForContextID:(id)a3 forTrustStates:(id)a4 error:(id *)a5;
- (BOOL)trySelfWrappedKeyCandidate:(id)a3 error:(id *)a4;
- (BOOL)unwrapViaTLKSharesTrustedBy:(id)a3 contextID:(id)a4 error:(id *)a5;
- (BOOL)validTLK:(id *)a3;
- (BOOL)wrapUnder:(id)a3 error:(id *)a4;
- (BOOL)wrapsSelf;
- (CKKSKey)init;
- (CKKSKey)initWithKeyCore:(id)a3 contextID:(id)a4 state:(id)a5 currentkey:(BOOL)a6;
- (CKKSKey)initWithWrappedKeyData:(id)a3 contextID:(id)a4 uuid:(id)a5 parentKeyUUID:(id)a6 keyclass:(id)a7 state:(id)a8 zoneID:(id)a9 encodedCKRecord:(id)a10 currentkey:(int64_t)a11;
- (CKKSKeychainBackedKey)keycore;
- (NSData)wrappedKeyData;
- (NSData)wrappedKeyDataBackingStore;
- (NSString)parentKeyUUID;
- (NSString)uuid;
- (NSString)zoneName;
- (SecCKKSKeyClass)keyclass;
- (SecCKKSProcessedState)state;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5;
- (id)description;
- (id)encryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5;
- (id)ensureKeyLoadedForContextID:(id)a3 cache:(id)a4 error:(id *)a5;
- (id)getKeychainBackedKey:(id *)a3;
- (id)initSelfWrappedWithAESKey:(id)a3 contextID:(id)a4 uuid:(id)a5 keyclass:(id)a6 state:(id)a7 zoneID:(id)a8 encodedCKRecord:(id)a9 currentkey:(int64_t)a10;
- (id)serializeAsProtobuf:(id *)a3;
- (id)sqlValues;
- (id)topKeyInAnyState:(id *)a3;
- (id)unwrapAESKey:(id)a3 error:(id *)a4;
- (id)unwrapViaKeyHierarchy:(id *)a3;
- (id)unwrapViaKeyHierarchy:(id)a3 error:(id *)a4;
- (id)updateCKRecord:(id)a3 zoneID:(id)a4;
- (id)whereClauseToFindSelf;
- (id)wrapAESKey:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)setCurrentkey:(BOOL)a3;
- (void)setFromCKRecord:(id)a3;
- (void)setKeyclass:(id)a3;
- (void)setKeycore:(id)a3;
- (void)setParentKeyUUID:(id)a3;
- (void)setState:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWrappedKeyDataBackingStore:(id)a3;
@end

@implementation CKKSKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedKeyDataBackingStore, 0);
  objc_storeStrong((id *)&self->_keycore, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_keyclass, 0);
  objc_storeStrong((id *)&self->_parentKeyUUID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setWrappedKeyDataBackingStore:(id)a3
{
}

- (NSData)wrappedKeyDataBackingStore
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setKeycore:(id)a3
{
}

- (CKKSKeychainBackedKey)keycore
{
  return (CKKSKeychainBackedKey *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCurrentkey:(BOOL)a3
{
  self->_currentkey = a3;
}

- (BOOL)currentkey
{
  return self->_currentkey;
}

- (void)setState:(id)a3
{
}

- (SecCKKSProcessedState)state
{
  return (SecCKKSProcessedState *)objc_getProperty(self, a2, 88, 1);
}

- (void)setKeyclass:(id)a3
{
}

- (SecCKKSKeyClass)keyclass
{
  return (SecCKKSKeyClass *)objc_getProperty(self, a2, 80, 1);
}

- (void)setParentKeyUUID:(id)a3
{
}

- (NSString)parentKeyUUID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (id)serializeAsProtobuf:(id *)a3
{
  v5 = [(CKKSCKRecordHolder *)self contextID];
  v6 = [(CKKSKey *)self ensureKeyLoadedForContextID:v5 cache:0 error:a3];

  if (v6)
  {
    v7 = objc_alloc_init(CKKSSerializedKey);
    v8 = [(CKKSKey *)self uuid];
    [(CKKSSerializedKey *)v7 setUuid:v8];

    v9 = [(CKKSCKRecordHolder *)self zoneID];
    v10 = [v9 zoneName];
    [(CKKSSerializedKey *)v7 setZoneName:v10];

    v11 = [(CKKSKey *)self keyclass];
    [(CKKSSerializedKey *)v7 setKeyclass:v11];

    v12 = [(CKKSKey *)self keycore];
    v13 = [v12 aessivkey];
    v14 = [(CKKSKey *)self keycore];
    v15 = [v14 aessivkey];
    id v16 = +[NSData _newZeroingDataWithBytes:v13 + 8 length:v15[11]];
    [(CKKSSerializedKey *)v7 setKey:v16];

    v17 = [(CKKSSerializedKey *)v7 data];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKKSKey;
  id v5 = -[CKKSCKRecordHolder copyWithZone:](&v9, "copyWithZone:");
  id v6 = [(CKKSKeychainBackedKey *)self->_keycore copyWithZone:a3];
  v7 = (void *)*((void *)v5 + 12);
  *((void *)v5 + 12) = v6;

  objc_storeStrong((id *)v5 + 11, self->_state);
  *((unsigned char *)v5 + 56) = self->_currentkey;
  return v5;
}

- (id)sqlValues
{
  v31[0] = @"contextID";
  v30 = [(CKKSCKRecordHolder *)self contextID];
  v32[0] = v30;
  v31[1] = @"UUID";
  v3 = [(CKKSKey *)self uuid];
  v32[1] = v3;
  v31[2] = @"parentKeyUUID";
  v4 = [(CKKSKey *)self parentKeyUUID];
  if (v4) {
    [(CKKSKey *)self parentKeyUUID];
  }
  else {
  id v5 = [(CKKSKey *)self uuid];
  }
  v32[2] = v5;
  v31[3] = @"ckzone";
  id v6 = [(CKKSCKRecordHolder *)self zoneID];
  v7 = [v6 zoneName];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = +[NSNull null];
  }
  objc_super v9 = v8;

  v32[3] = v9;
  v31[4] = @"ckrecord";
  v10 = [(CKKSCKRecordHolder *)self encodedCKRecord];
  v11 = [v10 base64EncodedStringWithOptions:0];

  if (v11)
  {
    id v12 = v11;
  }
  else
  {
    id v12 = +[NSNull null];
  }
  v13 = v12;

  v32[4] = v13;
  v31[5] = @"keyclass";
  v14 = [(CKKSKey *)self keyclass];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[NSNull null];
  }
  v17 = v16;

  v32[5] = v17;
  v31[6] = @"state";
  v18 = [(CKKSKey *)self state];
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = +[NSNull null];
  }
  v21 = v20;

  v32[6] = v21;
  v31[7] = @"wrappedkey";
  v22 = [(CKKSKey *)self wrappedKeyData];
  v23 = [v22 base64EncodedDataWithOptions:0];

  if (v23)
  {
    id v24 = v23;
  }
  else
  {
    id v24 = +[NSNull null];
  }
  v25 = v24;

  v32[7] = v25;
  v31[8] = @"currentkey";
  unsigned int v26 = [(CKKSKey *)self currentkey];
  CFStringRef v27 = @"0";
  if (v26) {
    CFStringRef v27 = @"1";
  }
  v32[8] = v27;
  v28 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:9];

  return v28;
}

- (id)whereClauseToFindSelf
{
  v10[0] = @"contextID";
  v3 = [(CKKSCKRecordHolder *)self contextID];
  v11[0] = v3;
  v10[1] = @"UUID";
  v4 = [(CKKSKey *)self uuid];
  v11[1] = v4;
  v10[2] = @"state";
  id v5 = [(CKKSKey *)self state];
  v11[2] = v5;
  v10[3] = @"ckzone";
  id v6 = [(CKKSCKRecordHolder *)self zoneID];
  v7 = [v6 zoneName];
  v11[3] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];

  return v8;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(CKKSCKRecordHolder *)self contextID];
  id v6 = [(CKKSCKRecordHolder *)self zoneID];
  v7 = [v6 zoneName];
  id v8 = [(CKKSKey *)self uuid];
  objc_super v9 = [(CKKSKey *)self keyclass];
  v10 = [(CKKSKey *)self state];
  v11 = +[NSString stringWithFormat:@"<%@[%@](%@): %@ (%@,%@:%d)>", v4, v5, v7, v8, v9, v10, [(CKKSKey *)self currentkey]];

  return v11;
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordType];
  unsigned int v6 = [v5 isEqual:@"synckey"];

  if (!v6) {
    goto LABEL_20;
  }
  v7 = [v4 recordID];
  id v8 = [v7 recordName];
  objc_super v9 = [(CKKSKey *)self uuid];
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    v17 = sub_1000CD884(@"ckkskey", 0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v18 = "UUID does not match";
      v19 = buf;
      goto LABEL_9;
    }
LABEL_19:

LABEL_20:
    BOOL v27 = 0;
    goto LABEL_21;
  }
  v11 = [v4 objectForKeyedSubscript:@"parentkeyref"];

  if (v11)
  {
    id v12 = [v4 objectForKeyedSubscript:@"parentkeyref"];
    v13 = [v12 recordID];
    v14 = [v13 recordName];
    v15 = [(CKKSKey *)self parentKeyUUID];
    unsigned __int8 v16 = [v14 isEqualToString:v15];

    if ((v16 & 1) == 0)
    {
      v17 = sub_1000CD884(@"ckkskey", 0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        __int16 v31 = 0;
        v18 = "wrapping key reference (non-self-wrapped) does not match";
        v19 = (uint8_t *)&v31;
LABEL_9:
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, v18, v19, 2u);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
  }
  else if (![(CKKSKey *)self wrapsSelf])
  {
    v17 = sub_1000CD884(@"ckkskey", 0);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_19;
    }
    __int16 v32 = 0;
    v18 = "wrapping key reference (self-wrapped) does not match";
    v19 = (uint8_t *)&v32;
    goto LABEL_9;
  }
  id v20 = [v4 objectForKeyedSubscript:@"class"];
  v21 = [(CKKSKey *)self keyclass];
  unsigned __int8 v22 = [v20 isEqual:v21];

  if ((v22 & 1) == 0)
  {
    v17 = sub_1000CD884(@"ckkskey", 0);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_19;
    }
    __int16 v30 = 0;
    v18 = "key class does not match";
    v19 = (uint8_t *)&v30;
    goto LABEL_9;
  }
  v23 = [v4 objectForKeyedSubscript:@"wrappedkey"];
  id v24 = [(CKKSKey *)self wrappedKeyData];
  v25 = [v24 base64EncodedStringWithOptions:0];
  unsigned __int8 v26 = [v23 isEqual:v25];

  if ((v26 & 1) == 0)
  {
    v17 = sub_1000CD884(@"ckkskey", 0);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_19;
    }
    __int16 v29 = 0;
    v18 = "wrapped key does not match";
    v19 = (uint8_t *)&v29;
    goto LABEL_9;
  }
  BOOL v27 = 1;
LABEL_21:

  return v27;
}

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 recordType];
  unsigned __int8 v9 = [v8 isEqual:@"synckey"];

  if ((v9 & 1) == 0)
  {
    unsigned __int8 v22 = [v6 recordType];
    v23 = +[NSString stringWithFormat:@"CKRecordType (%@) was not %@", v22, @"synckey"];
    id v24 = +[NSException exceptionWithName:@"WrongCKRecordTypeException" reason:v23 userInfo:0];

    objc_exception_throw(v24);
  }
  unsigned __int8 v10 = [(CKKSKey *)self parentKeyUUID];
  v11 = [(CKKSKey *)self uuid];
  unsigned int v12 = [v10 isEqual:v11];

  if (v12)
  {
    [v6 setObject:0 forKeyedSubscript:@"parentkeyref"];
  }
  else
  {
    id v13 = objc_alloc((Class)CKReference);
    id v14 = objc_alloc((Class)CKRecordID);
    v15 = [(CKKSKey *)self parentKeyUUID];
    id v16 = [v14 initWithRecordName:v15 zoneID:v7];
    id v17 = [v13 initWithRecordID:v16 action:CKReferenceActionValidate];
    [v6 setObject:v17 forKeyedSubscript:@"parentkeyref"];
  }
  +[CKKSItem setOSVersionInRecord:v6];
  v18 = [(CKKSKey *)self keyclass];
  [v6 setObject:v18 forKeyedSubscript:@"class"];

  v19 = [(CKKSKey *)self wrappedKeyData];
  id v20 = [v19 base64EncodedStringWithOptions:0];
  [v6 setObject:v20 forKeyedSubscript:@"wrappedkey"];

  return v6;
}

- (void)setFromCKRecord:(id)a3
{
  id v19 = a3;
  id v4 = [v19 recordType];
  unsigned __int8 v5 = [v4 isEqual:@"synckey"];

  if ((v5 & 1) == 0)
  {
    id v16 = [v19 recordType];
    id v17 = +[NSString stringWithFormat:@"CKRecordType (%@) was not %@", v16, @"synckey"];
    id v18 = +[NSException exceptionWithName:@"WrongCKRecordTypeException" reason:v17 userInfo:0];

    objc_exception_throw(v18);
  }
  [(CKKSCKRecordHolder *)self setStoredCKRecord:v19];
  id v6 = [v19 recordID];
  id v7 = [v6 recordName];
  [(CKKSKey *)self setUuid:v7];

  id v8 = [v19 objectForKeyedSubscript:@"parentkeyref"];

  if (v8)
  {
    unsigned __int8 v9 = [v19 objectForKeyedSubscript:@"parentkeyref"];
    unsigned __int8 v10 = [v9 recordID];
    v11 = [v10 recordName];
    [(CKKSKey *)self setParentKeyUUID:v11];
  }
  else
  {
    unsigned __int8 v9 = [(CKKSKey *)self uuid];
    [(CKKSKey *)self setParentKeyUUID:v9];
  }

  unsigned int v12 = [v19 objectForKeyedSubscript:@"class"];
  [(CKKSKey *)self setKeyclass:v12];

  id v13 = objc_alloc((Class)NSData);
  id v14 = [v19 objectForKeyedSubscript:@"wrappedkey"];
  id v15 = [v13 initWithBase64EncodedString:v14 options:0];
  [(CKKSKey *)self setWrappedKeyDataBackingStore:v15];

  [(CKKSKey *)self setKeycore:0];
  [(CKKSKey *)self setState:@"remote"];
}

- (BOOL)saveToDatabaseAsOnlyCurrentKeyForClassAndState:(id *)a3
{
  [(CKKSKey *)self setCurrentkey:1];
  unsigned __int8 v5 = [(CKKSKey *)self keyclass];
  id v6 = [(CKKSCKRecordHolder *)self contextID];
  id v7 = [(CKKSKey *)self state];
  id v8 = [(CKKSCKRecordHolder *)self zoneID];
  unsigned __int8 v9 = +[CKKSKey currentKeysForClass:v5 contextID:v6 state:v7 zoneID:v8 error:a3];

  if (v9)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          [v15 setCurrentkey:0, (void)v18];
          if (![v15 saveToDatabase:a3])
          {

            goto LABEL_12;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    BOOL v16 = [(CKKSSQLDatabaseObject *)self saveToDatabase:a3];
  }
  else
  {
LABEL_12:
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)deleteKeyMaterialFromKeychain:(id *)a3
{
  unsigned __int8 v5 = -[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:");

  if (!v5) {
    return 0;
  }
  id v6 = [(CKKSKey *)self keycore];
  unsigned __int8 v7 = [v6 deleteKeyMaterialFromKeychain:a3];

  return v7;
}

- (BOOL)loadKeyMaterialFromKeychain:(id *)a3
{
  unsigned __int8 v5 = -[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:");

  if (!v5) {
    return 0;
  }
  id v6 = [(CKKSKey *)self keycore];
  unsigned __int8 v7 = [v6 loadKeyMaterialFromKeychain:a3];

  return v7;
}

- (BOOL)saveKeyMaterialToKeychain:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  unsigned __int8 v7 = [(CKKSKey *)self getKeychainBackedKey:a4];

  if (!v7) {
    return 0;
  }
  id v8 = [(CKKSKey *)self keycore];
  unsigned __int8 v9 = [v8 saveKeyMaterialToKeychain:v5 error:a4];

  return v9;
}

- (BOOL)saveKeyMaterialToKeychain:(id *)a3
{
  BOOL v5 = -[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:");

  if (!v5) {
    return 0;
  }
  id v6 = [(CKKSKey *)self keycore];
  unsigned __int8 v7 = [v6 saveKeyMaterialToKeychain:1 error:a3];

  return v7;
}

- (id)decryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CKKSKey *)self getKeychainBackedKey:a5];

  if (v10)
  {
    id v11 = [(CKKSKey *)self keycore];
    id v12 = [v11 decryptData:v8 authenticatedData:v9 error:a5];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)encryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CKKSKey *)self getKeychainBackedKey:a5];

  if (v10)
  {
    id v11 = [(CKKSKey *)self keycore];
    id v12 = [v11 encryptData:v8 authenticatedData:v9 error:a5];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)unwrapAESKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(CKKSKey *)self getKeychainBackedKey:a4];

  if (v7)
  {
    id v8 = [(CKKSKey *)self keycore];
    id v9 = [v8 unwrapAESKey:v6 error:a4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)wrapAESKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(CKKSKey *)self getKeychainBackedKey:a4];

  if (v7)
  {
    id v8 = [(CKKSKey *)self keycore];
    id v9 = [v8 wrapAESKey:v6 error:a4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)trySelfWrappedKeyCandidate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(CKKSKey *)self getKeychainBackedKey:a4];

  if (v7)
  {
    id v8 = [(CKKSKey *)self keycore];
    unsigned __int8 v9 = [v8 trySelfWrappedKeyCandidate:v6 error:a4];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)tlkMaterialPresentOrRecoverableViaTLKShareForContextID:(id)a3 forTrustStates:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CKKSKey *)self getKeychainBackedKey:a5];

  if (v10)
  {
    id v38 = 0;
    id v11 = [(CKKSKey *)self ensureKeyLoadedForContextID:v8 cache:0 error:&v38];
    id v12 = v38;

    if (v11)
    {
      uint64_t v13 = [(CKKSKey *)self keycore];
      id v37 = v12;
      id v11 = [v13 ensureKeyLoadedFromKeychain:&v37];
      id v14 = v37;

      if (v11 && !v14)
      {
        id v36 = 0;
        uint64_t v15 = [(CKKSKey *)self trySelfWrappedKeyCandidate:v11 error:&v36];
        id v12 = v36;
        if (v15)
        {
          BOOL v16 = 1;
LABEL_34:

          goto LABEL_35;
        }
        unsigned __int8 v22 = [(CKKSKey *)self zoneName];
        long long v19 = sub_1000CD884(@"ckksshare", v22);

        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v40 = v12;
          long long v21 = "Some key is present, but the key is not self-wrapped: %@";
          goto LABEL_18;
        }
        goto LABEL_19;
      }
      id v12 = v14;
    }
    id v17 = [v12 code];
    long long v18 = [(CKKSKey *)self zoneName];
    long long v19 = sub_1000CD884(@"ckksshare", v18);

    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v17 == (id)-25308)
    {
      if (v20)
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v12;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to load key due to lock state: %@", buf, 0xCu);
      }

      if (a5)
      {
        id v12 = v12;
        BOOL v16 = 0;
        *a5 = v12;
      }
      else
      {
        BOOL v16 = 0;
      }
      goto LABEL_34;
    }
    if (v20)
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v12;
      long long v21 = "Do not yet have this key in the keychain: %@";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v21, buf, 0xCu);
    }
LABEL_19:

    id v35 = 0;
    unsigned int v23 = [(CKKSKey *)self unwrapViaTLKSharesTrustedBy:v9 contextID:v8 error:&v35];
    id v24 = v35;
    id v25 = v24;
    if (!v23 || v24)
    {
      __int16 v30 = [(CKKSKey *)self zoneName];
      __int16 v31 = sub_1000CD884(@"ckksshare", v30);

      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        __int16 v32 = [(CKKSKey *)self uuid];
        *(_DWORD *)buf = 138412546;
        id v40 = v32;
        __int16 v41 = 2112;
        id v42 = v25;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to unwrap tlk(%@) via shares: %@", buf, 0x16u);
      }
      if (!a5)
      {
        BOOL v16 = 0;
        goto LABEL_33;
      }
    }
    else
    {
      id v34 = 0;
      BOOL v16 = 1;
      unsigned int v26 = [(CKKSKey *)self saveKeyMaterialToKeychain:1 error:&v34];
      id v27 = v34;
      id v25 = v27;
      if (v26 && !v27) {
        goto LABEL_33;
      }
      v28 = [(CKKSKey *)self zoneName];
      __int16 v29 = sub_1000CD884(@"ckksshare", v28);

      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v25;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Errored saving TLK to keychain: %@", buf, 0xCu);
      }

      if (!a5)
      {
        BOOL v16 = 1;
LABEL_33:

        goto LABEL_34;
      }
    }
    id v25 = v25;
    BOOL v16 = 0;
    *a5 = v25;
    goto LABEL_33;
  }
  BOOL v16 = 0;
LABEL_35:

  return v16;
}

- (BOOL)validTLK:(id *)a3
{
  BOOL v5 = [(CKKSKey *)self wrapsSelf];
  if (!v5)
  {
    id v6 = [(CKKSKey *)self parentKeyUUID];
    unsigned __int8 v7 = +[NSString stringWithFormat:@"Potential TLK %@ doesn't wrap itself: %@", self, v6];
    id v8 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:18 description:v7 underlying:0];

    id v9 = [(CKKSKey *)self zoneName];
    id v10 = sub_1000CD884(@"ckksshare", v9);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error with TLK: %@", buf, 0xCu);
    }

    if (a3) {
      *a3 = v8;
    }
  }
  return v5;
}

- (BOOL)unwrapViaTLKSharesTrustedBy:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    id v10 = [(CKKSKey *)self uuid];
    id v11 = [(CKKSCKRecordHolder *)self zoneID];
    id v42 = 0;
    uint64_t v12 = +[CKKSTLKShareRecord allForUUID:v10 contextID:v9 zoneID:v11 error:&v42];
    id v13 = v42;

    id v36 = (void *)v12;
    if (!v12 || v13)
    {
      v28 = [(CKKSKey *)self zoneName];
      __int16 v29 = sub_1000CD884(@"ckksshare", v28);

      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v44 = self;
        __int16 v45 = 2112;
        id v46 = v13;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Unable to load TLK shares for TLK(%@): %@", buf, 0x16u);
      }

      if (a5)
      {
        id v13 = v13;
        BOOL v27 = 0;
        *a5 = v13;
      }
      else
      {
        BOOL v27 = 0;
      }
    }
    else
    {
      __int16 v32 = a5;
      id v33 = v9;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v34 = v8;
      id obj = v8;
      id v14 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
      if (v14)
      {
        id v15 = v14;
        id v16 = 0;
        uint64_t v17 = *(void *)v39;
        while (2)
        {
          long long v18 = 0;
          id v19 = v16;
          do
          {
            if (*(void *)v39 != v17) {
              objc_enumerationMutation(obj);
            }
            BOOL v20 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v18);
            id v37 = 0;
            unsigned int v21 = [v20 unwrapKey:self fromShares:v36 error:&v37];
            id v16 = v37;
            unsigned __int8 v22 = [(CKKSKey *)self zoneName];
            unsigned int v23 = sub_1000CD884(@"ckksshare", v22);

            BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
            if (v21) {
              BOOL v25 = v16 == 0;
            }
            else {
              BOOL v25 = 0;
            }
            if (v25)
            {
              if (v24)
              {
                __int16 v30 = [(CKKSKey *)self uuid];
                *(_DWORD *)buf = 138412546;
                v44 = v30;
                __int16 v45 = 2112;
                id v46 = v20;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Recovered tlk (%@) from trust state (%@)", buf, 0x16u);
              }
              BOOL v27 = 1;
              goto LABEL_33;
            }
            if (v24)
            {
              unsigned int v26 = [(CKKSKey *)self uuid];
              *(_DWORD *)buf = 138412802;
              v44 = v26;
              __int16 v45 = 2112;
              id v46 = v20;
              __int16 v47 = 2112;
              id v48 = v16;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to recover tlk (%@) from trust state (%@): %@", buf, 0x20u);
            }
            long long v18 = (char *)v18 + 1;
            id v19 = v16;
          }
          while (v15 != v18);
          id v15 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v16 = 0;
      }

      if (v32)
      {
        id v19 = v16;
        BOOL v27 = 0;
        *__int16 v32 = v19;
      }
      else
      {
        BOOL v27 = 0;
        id v19 = v16;
      }
LABEL_33:
      id v9 = v33;
      id v8 = v34;

      id v13 = 0;
    }
  }
  else if (a5)
  {
    +[NSError errorWithDomain:@"CKKSErrorDomain" code:52 description:@"No current trust states; can't unwrap TLK"];
    BOOL v27 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (id)unwrapViaKeyHierarchy:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(CKKSKey *)self getKeychainBackedKey:a4];

  if (v7)
  {
    id v8 = [(CKKSKey *)self keycore];
    id v9 = [v8 aessivkey];

    id v10 = [(CKKSKey *)self keycore];
    id v11 = v10;
    if (v9)
    {
      uint64_t v12 = [v10 aessivkey];
    }
    else
    {
      id v40 = 0;
      unsigned int v13 = [v10 loadKeyMaterialFromKeychain:&v40];
      id v14 = v40;

      if (v13)
      {
        id v15 = [(CKKSKey *)self keycore];
        uint64_t v12 = [v15 aessivkey];
      }
      else
      {
        id v16 = [(CKKSKey *)self keyclass];
        unsigned int v17 = [v16 isEqual:@"tlk"];

        if (!v17) {
          goto LABEL_12;
        }
        uint64_t v18 = [(CKKSKey *)self parentKeyUUID];
        if (!v18) {
          goto LABEL_10;
        }
        id v19 = (void *)v18;
        BOOL v20 = [(CKKSKey *)self parentKeyUUID];
        unsigned int v21 = [(CKKSKey *)self uuid];
        unsigned int v22 = [v20 isEqualToString:v21];

        if (v22)
        {
LABEL_10:
          uint64_t v12 = 0;
          if (a4) {
            *a4 = v14;
          }
        }
        else
        {
LABEL_12:
          unsigned int v23 = [(CKKSKey *)self parentKeyUUID];
          BOOL v24 = [(CKKSCKRecordHolder *)self contextID];
          BOOL v25 = [(CKKSCKRecordHolder *)self zoneID];
          if (v6)
          {
            uint64_t v39 = 0;
            unsigned int v26 = (id *)&v39;
            uint64_t v27 = [v6 loadKeyForUUID:v23 contextID:v24 zoneID:v25 error:&v39];
          }
          else
          {
            uint64_t v38 = 0;
            unsigned int v26 = (id *)&v38;
            uint64_t v27 = +[CKKSKey fromDatabaseAnyState:v23 contextID:v24 zoneID:v25 error:&v38];
          }
          v28 = (void *)v27;
          id v29 = *v26;

          if (v29 || !v28)
          {
            __int16 v30 = sub_1000CD884(@"ckks", 0);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v42 = v29;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Errored fetching parent key: %@", buf, 0xCu);
            }

            if (a4) {
              *a4 = v29;
            }
          }
          __int16 v31 = [v28 unwrapViaKeyHierarchy:v6 error:a4];

          if (v31)
          {
            __int16 v32 = [(CKKSKey *)self keycore];
            id v33 = [v32 wrappedkey];
            id v34 = [v28 unwrapAESKey:v33 error:a4];
            id v35 = [(CKKSKey *)self keycore];
            [v35 setAessivkey:v34];

            id v36 = [(CKKSKey *)self keycore];
            uint64_t v12 = [v36 aessivkey];
          }
          else
          {
            uint64_t v12 = 0;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)unwrapViaKeyHierarchy:(id *)a3
{
  return [(CKKSKey *)self unwrapViaKeyHierarchy:0 error:a3];
}

- (id)ensureKeyLoadedForContextID:(id)a3 cache:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = [(CKKSKey *)self getKeychainBackedKey:a5];

  if (v8)
  {
    id v9 = [(CKKSKey *)self keycore];
    id v25 = 0;
    id v10 = [v9 ensureKeyLoadedFromKeychain:&v25];
    id v11 = v25;

    if (v10)
    {
      uint64_t v12 = [(CKKSKey *)self keycore];
    }
    else
    {
      id v24 = 0;
      unsigned int v13 = [(CKKSKey *)self unwrapViaKeyHierarchy:v7 error:&v24];
      id v14 = v24;

      if (v13)
      {
        id v23 = 0;
        unsigned int v15 = [(CKKSKey *)self saveKeyMaterialToKeychain:&v23];
        id v16 = v23;
        unsigned int v17 = v16;
        if (!v15 || v16)
        {
          uint64_t v18 = [(CKKSCKRecordHolder *)self zoneID];
          id v19 = [v18 zoneName];
          BOOL v20 = sub_1000CD884(@"ckkskey", v19);

          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v27 = v17;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Resaving missing key failed, continuing: %@", buf, 0xCu);
          }
        }
        uint64_t v12 = [(CKKSKey *)self keycore];
      }
      else if (a5)
      {
        if (v14) {
          unsigned int v21 = v14;
        }
        else {
          unsigned int v21 = v11;
        }
        uint64_t v12 = 0;
        *a5 = v21;
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)topKeyInAnyState:(id *)a3
{
  id v5 = objc_alloc_init((Class)NSMutableSet);
  id v6 = self;
  if (!v6) {
    goto LABEL_11;
  }
  do
  {
    if ([(CKKSKey *)v6 wrapsSelf])
    {
      id v6 = v6;
      uint64_t v12 = v6;
      goto LABEL_12;
    }
    id v7 = [(CKKSKey *)v6 uuid];
    unsigned int v8 = [v5 containsObject:v7];

    if (v8) {
      break;
    }
    id v9 = [(CKKSKey *)v6 uuid];
    [v5 addObject:v9];

    v18[0] = @"UUID";
    id v10 = [(CKKSKey *)v6 parentKeyUUID];
    v18[1] = @"state";
    v19[0] = v10;
    v19[1] = @"remote";
    id v11 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    uint64_t v12 = +[CKKSSQLDatabaseObject tryFromDatabaseWhere:v11 error:a3];

    if (!v12)
    {
      CFStringRef v16 = @"UUID";
      unsigned int v13 = [(CKKSKey *)v6 parentKeyUUID];
      unsigned int v17 = v13;
      id v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      uint64_t v12 = +[CKKSSQLDatabaseObject fromDatabaseWhere:v14 error:a3];
    }
    id v6 = v12;
  }
  while (v12);
  if (a3)
  {
    +[NSError errorWithDomain:@"CKKSErrorDomain" code:54 description:@"Circular reference in key hierarchy"];
    uint64_t v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    uint64_t v12 = 0;
  }
LABEL_12:

  return v12;
}

- (BOOL)wrapUnder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CKKSKey *)self getKeychainBackedKey:a4];

  if (v7
    && ([(CKKSKey *)self keycore],
        unsigned int v8 = objc_claimAutoreleasedReturnValue(),
        [v6 keycore],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v8 wrapUnder:v9 error:a4],
        v9,
        v8,
        v10))
  {
    id v11 = [(CKKSKey *)self keycore];
    uint64_t v12 = [v11 parentKeyUUID];
    [(CKKSKey *)self setParentKeyUUID:v12];

    unsigned int v13 = [(CKKSKey *)self keycore];
    id v14 = [v13 wrappedkey];
    unsigned int v15 = [v14 wrappedData];
    [(CKKSKey *)self setWrappedKeyDataBackingStore:v15];

    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)wrapsSelf
{
  v3 = [(CKKSKey *)self uuid];
  id v4 = [(CKKSKey *)self parentKeyUUID];
  unsigned __int8 v5 = [v3 isEqual:v4];

  return v5;
}

- (NSString)zoneName
{
  v2 = [(CKKSCKRecordHolder *)self zoneID];
  v3 = [v2 zoneName];

  return (NSString *)v3;
}

- (NSData)wrappedKeyData
{
  v3 = [(CKKSKey *)self keycore];

  if (v3)
  {
    id v4 = [(CKKSKey *)self keycore];
    unsigned __int8 v5 = [v4 wrappedkey];
    id v6 = [v5 wrappedData];
    id v7 = [(CKKSKey *)self wrappedKeyDataBackingStore];
    unsigned __int8 v8 = [v6 isEqualToData:v7];

    if ((v8 & 1) == 0)
    {
      id v9 = [(CKKSCKRecordHolder *)self zoneID];
      unsigned int v10 = [v9 zoneName];
      id v11 = sub_1000CD884(@"ckkskey", v10);

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Probable bug: wrapped key data does not match cached version", v19, 2u);
      }

      uint64_t v12 = [(CKKSKey *)self keycore];
      unsigned int v13 = [v12 wrappedkey];
      id v14 = [v13 wrappedData];
      [(CKKSKey *)self setWrappedKeyDataBackingStore:v14];
    }
    unsigned int v15 = [(CKKSKey *)self keycore];
    BOOL v16 = [v15 wrappedkey];
    unsigned int v17 = [v16 wrappedData];
  }
  else
  {
    unsigned int v17 = [(CKKSKey *)self wrappedKeyDataBackingStore];
  }

  return (NSData *)v17;
}

- (id)getKeychainBackedKey:(id *)a3
{
  unsigned __int8 v5 = [(CKKSKey *)self keycore];

  if (v5)
  {
    id v6 = [(CKKSKey *)self keycore];
  }
  else
  {
    id v7 = [(CKKSKey *)self wrappedKeyDataBackingStore];
    id v8 = [v7 length];

    if (v8 == (id)80)
    {
      id v9 = [CKKSWrappedAESSIVKey alloc];
      unsigned int v10 = [(CKKSKey *)self wrappedKeyDataBackingStore];
      id v11 = [(CKKSWrappedAESSIVKey *)v9 initWithData:v10];

      uint64_t v12 = [CKKSKeychainBackedKey alloc];
      unsigned int v13 = [(CKKSKey *)self uuid];
      id v14 = [(CKKSKey *)self parentKeyUUID];
      unsigned int v15 = [(CKKSKey *)self keyclass];
      BOOL v16 = [(CKKSCKRecordHolder *)self zoneID];
      unsigned int v17 = [(CKKSKeychainBackedKey *)v12 initWithWrappedAESKey:v11 uuid:v13 parentKeyUUID:v14 keyclass:v15 zoneID:v16];
      [(CKKSKey *)self setKeycore:v17];

      id v6 = [(CKKSKey *)self keycore];
    }
    else if (a3)
    {
      +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 description:@"Wrong key size"];
      id v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(CKKSKey *)self uuid];
    id v7 = [v5 uuid];
    if ([v6 isEqualToString:v7])
    {
      id v8 = [(CKKSKey *)self parentKeyUUID];
      id v9 = [v5 parentKeyUUID];
      if ([v8 isEqualToString:v9])
      {
        unsigned int v10 = [(CKKSKey *)self wrappedKeyData];
        id v11 = [v5 wrappedKeyData];
        if ([v10 isEqualToData:v11])
        {
          uint64_t v12 = [(CKKSCKRecordHolder *)self zoneID];
          uint64_t v18 = [v5 zoneID];
          if (objc_msgSend(v12, "isEqual:"))
          {
            BOOL v16 = [(CKKSKey *)self keyclass];
            [v5 keyclass];
            unsigned int v13 = v17 = v12;
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

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CKKSKey;
  [(CKKSKey *)&v2 dealloc];
}

- (CKKSKey)initWithKeyCore:(id)a3 contextID:(id)a4 state:(id)a5 currentkey:(BOOL)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a4;
  unsigned __int8 v14 = [v11 zoneID];
  v26.receiver = self;
  v26.super_class = (Class)CKKSKey;
  unsigned int v15 = [(CKKSCKRecordHolder *)&v26 initWithCKRecordType:@"synckey" encodedCKRecord:0 contextID:v13 zoneID:v14];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_keycore, a3);
    BOOL v16 = [(CKKSKeychainBackedKey *)v15->_keycore wrappedkey];
    uint64_t v17 = [v16 wrappedData];
    wrappedKeyDataBackingStore = v15->_wrappedKeyDataBackingStore;
    v15->_wrappedKeyDataBackingStore = (NSData *)v17;

    uint64_t v19 = [v11 uuid];
    uuid = v15->_uuid;
    v15->_uuid = (NSString *)v19;

    uint64_t v21 = [v11 parentKeyUUID];
    parentKeyUUID = v15->_parentKeyUUID;
    v15->_parentKeyUUID = (NSString *)v21;

    uint64_t v23 = [v11 keyclass];
    keyclass = v15->_keyclass;
    v15->_keyclass = (SecCKKSKeyClass *)v23;

    v15->_currentkey = a6;
    objc_storeStrong((id *)&v15->_state, a5);
  }

  return v15;
}

- (CKKSKey)initWithWrappedKeyData:(id)a3 contextID:(id)a4 uuid:(id)a5 parentKeyUUID:(id)a6 keyclass:(id)a7 state:(id)a8 zoneID:(id)a9 encodedCKRecord:(id)a10 currentkey:(int64_t)a11
{
  id v25 = a3;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)CKKSKey;
  uint64_t v19 = [(CKKSCKRecordHolder *)&v26 initWithCKRecordType:@"synckey" encodedCKRecord:a10 contextID:a4 zoneID:a9];
  BOOL v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_wrappedKeyDataBackingStore, a3);
    objc_storeStrong((id *)&v20->_uuid, a5);
    objc_storeStrong((id *)&v20->_parentKeyUUID, a6);
    objc_storeStrong((id *)&v20->_keyclass, a7);
    v20->_currentkey = a11 != 0;
    objc_storeStrong((id *)&v20->_state, a8);
  }

  return v20;
}

- (id)initSelfWrappedWithAESKey:(id)a3 contextID:(id)a4 uuid:(id)a5 keyclass:(id)a6 state:(id)a7 zoneID:(id)a8 encodedCKRecord:(id)a9 currentkey:(int64_t)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id obj = a7;
  id v32 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)CKKSKey;
  BOOL v20 = [(CKKSCKRecordHolder *)&v34 initWithCKRecordType:@"synckey" encodedCKRecord:a9 contextID:a4 zoneID:v19];
  uint64_t v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_uuid, a5);
    objc_storeStrong((id *)&v21->_parentKeyUUID, a5);
    objc_storeStrong((id *)&v21->_keyclass, a6);
    id v33 = 0;
    uint64_t v22 = +[CKKSKeychainBackedKey keyWrappedBySelf:v16 uuid:v17 keyclass:v18 zoneID:v19 error:&v33];
    id v23 = v33;
    keycore = v21->_keycore;
    v21->_keycore = (CKKSKeychainBackedKey *)v22;

    id v25 = v21->_keycore;
    if (!v25)
    {

      id v29 = 0;
      goto LABEL_6;
    }
    objc_super v26 = [(CKKSKeychainBackedKey *)v25 wrappedkey];
    uint64_t v27 = [v26 wrappedData];
    wrappedKeyDataBackingStore = v21->_wrappedKeyDataBackingStore;
    v21->_wrappedKeyDataBackingStore = (NSData *)v27;

    v21->_currentkey = a10 != 0;
    objc_storeStrong((id *)&v21->_state, obj);
  }
  id v29 = v21;
LABEL_6:

  return v29;
}

- (CKKSKey)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKKSKey;
  return [(CKKSKey *)&v3 init];
}

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  while (1)
  {
    id v9 = [v7 recordName];
    unsigned int v10 = [v7 zoneID];
    id v24 = 0;
    id v11 = +[CKKSKey tryFromDatabaseAnyState:v9 contextID:v8 zoneID:v10 error:&v24];
    id v12 = v24;

    if (!v11) {
      break;
    }
    id v23 = 0;
    [v11 deleteFromDatabase:&v23];
    id v13 = v23;
    if (v13)
    {
      id v18 = v13;
      id v19 = [v7 zoneID];
      BOOL v20 = [v19 zoneName];
      uint64_t v21 = sub_1000CD884(@"ckkskey", v20);

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v26 = v7;
        __int16 v27 = 2112;
        id v28 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Couldn't delete key record from database: %@: %@", buf, 0x16u);
      }

LABEL_13:
      BOOL v17 = 0;
      goto LABEL_15;
    }
  }
  if (v12)
  {
    unsigned __int8 v14 = [v7 zoneID];
    unsigned int v15 = [v14 zoneName];
    id v16 = sub_1000CD884(@"ckkskey", v15);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v7;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Couldn't load key record from database: %@: %@", buf, 0x16u);
    }

    if (a5)
    {
      id v12 = v12;
      BOOL v17 = 0;
      *a5 = v12;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  BOOL v17 = 1;
LABEL_15:

  return v17;
}

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 flagHandler:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  unsigned int v10 = (CKKSKey *)a3;
  id v11 = a4;
  id v61 = a6;
  if (!v8)
  {
LABEL_17:
    id v16 = [(CKKSCKRecordHolder *)[CKKSKey alloc] initWithCKRecord:v10 contextID:v11];
    id v35 = [(CKKSKey *)v16 uuid];
    id v36 = [(CKKSKey *)v10 recordID];
    id v37 = [v36 zoneID];
    id v64 = 0;
    id v26 = +[CKKSKey tryFromDatabase:v35 contextID:v11 zoneID:v37 error:&v64];
    uint64_t v38 = (CKKSKey *)v64;

    if (v38)
    {
      uint64_t v39 = [(CKKSKey *)v10 recordID];
      id v40 = [v39 zoneID];
      long long v41 = [v40 zoneName];
      id v42 = sub_1000CD884(@"ckkskey", v41);

      id v28 = v61;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v67 = v16;
        __int16 v68 = 2112;
        v69 = v38;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Error finding existing local key for %@: %@", buf, 0x16u);
      }
    }
    else
    {
      id v28 = v61;
      if (v26 && [v26 matchesCKRecord:v10])
      {
        [v26 setStoredCKRecord:v10];
        id v63 = 0;
        unsigned int v53 = [v26 saveToDatabase:&v63];
        v54 = (CKKSKey *)v63;
        BOOL v17 = v54;
        if (v53 && !v54) {
          goto LABEL_24;
        }
        v55 = [(CKKSKey *)v10 recordID];
        v56 = [v55 zoneID];
        v57 = [v56 zoneName];
        v52 = sub_1000CD884(@"ckkskey", v57);

        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v67 = (CKKSKey *)v26;
          __int16 v68 = 2112;
          v69 = v17;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Couldn't update existing key: %@: %@", buf, 0x16u);
        }
        goto LABEL_29;
      }
    }
    [(CKKSKey *)v16 setState:@"remote", a7];
    [(CKKSKey *)v16 setCurrentkey:0];
    id v62 = 0;
    unsigned int v43 = [(CKKSSQLDatabaseObject *)v16 saveToDatabase:&v62];
    v44 = (CKKSKey *)v62;
    BOOL v17 = v44;
    if (v43 && !v44)
    {
      [v28 _onqueueHandleFlag:@"key_process_requested"];
LABEL_24:
      BOOL v27 = 1;
      goto LABEL_38;
    }
    __int16 v45 = [(CKKSKey *)v10 recordID];
    id v46 = [v45 zoneID];
    __int16 v47 = [v46 zoneName];
    id v48 = sub_1000CD884(@"ckkskey", v47);

    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v67 = v16;
      __int16 v68 = 2112;
      v69 = v17;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Couldn't save key record to database: %@: %@", buf, 0x16u);
    }

    v49 = [(CKKSKey *)v10 recordID];
    v50 = [v49 zoneID];
    v51 = [v50 zoneName];
    v52 = sub_1000CD884(@"ckkskey", v51);

    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "CKRecord was %@", buf, 0xCu);
    }
LABEL_29:

    if (v60)
    {
      BOOL v17 = v17;
      BOOL v27 = 0;
      *v60 = v17;
    }
    else
    {
      BOOL v27 = 0;
    }
    goto LABEL_38;
  }
  id v12 = [(CKKSKey *)v10 recordID];
  id v13 = [v12 recordName];
  unsigned __int8 v14 = [(CKKSKey *)v10 recordID];
  unsigned int v15 = [v14 zoneID];
  id v65 = 0;
  id v16 = +[CKKSKey tryFromDatabaseAnyState:v13 contextID:v11 zoneID:v15 error:&v65];
  BOOL v17 = (CKKSKey *)v65;

  if (v17)
  {
    id v18 = [(CKKSKey *)v10 recordID];
    id v19 = [v18 zoneID];
    BOOL v20 = [v19 zoneName];
    uint64_t v21 = sub_1000CD884(@"ckksresync", v20);

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "error loading key: %@", buf, 0xCu);
    }
  }
  if (!v16)
  {
    id v29 = [(CKKSKey *)v10 recordID];
    __int16 v30 = [v29 zoneID];
    __int16 v31 = [v30 zoneName];
    id v26 = sub_1000CD884(@"ckksresync", v31);

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v10;
      id v32 = "BUG: No sync key matching resynced CloudKit record: %@";
      id v33 = v26;
      uint32_t v34 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
    }
LABEL_16:

    goto LABEL_17;
  }
  unsigned __int8 v22 = [(CKKSKey *)v16 matchesCKRecord:v10];
  id v23 = [(CKKSKey *)v10 recordID];
  id v24 = [v23 zoneID];
  id v25 = [v24 zoneName];
  id v26 = sub_1000CD884(@"ckksresync", v25);

  if ((v22 & 1) == 0)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v67 = v16;
      __int16 v68 = 2112;
      v69 = v10;
      id v32 = "BUG: Local sync key doesn't match resynced CloudKit record(s): %@ %@";
      id v33 = v26;
      uint32_t v34 = 22;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v10;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Already know about this sync key, skipping update: %@", buf, 0xCu);
  }
  BOOL v27 = 1;
  id v28 = v61;
LABEL_38:

  return v27;
}

+ (id)loadFromProtobuf:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[CKKSSerializedKey alloc] initWithData:v8];

  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = [(CKKSSerializedKey *)v9 uuid];
  if (!v10) {
    goto LABEL_9;
  }
  id v11 = (void *)v10;
  uint64_t v12 = [(CKKSSerializedKey *)v9 zoneName];
  if (!v12) {
    goto LABEL_8;
  }
  id v13 = (void *)v12;
  uint64_t v14 = [(CKKSSerializedKey *)v9 keyclass];
  if (!v14)
  {

LABEL_8:
    goto LABEL_9;
  }
  unsigned int v15 = (void *)v14;
  id v16 = [(CKKSSerializedKey *)v9 key];

  if (v16)
  {
    BOOL v17 = [CKKSKey alloc];
    id v18 = [CKKSAESSIVKey alloc];
    id v19 = [(CKKSSerializedKey *)v9 key];
    id v20 = [v19 bytes];
    uint64_t v21 = [(CKKSSerializedKey *)v9 key];
    unsigned __int8 v22 = -[CKKSAESSIVKey initWithBytes:len:](v18, "initWithBytes:len:", v20, [v21 length]);
    id v23 = [(CKKSSerializedKey *)v9 uuid];
    id v24 = [(CKKSSerializedKey *)v9 keyclass];
    id v25 = objc_alloc((Class)CKRecordZoneID);
    id v26 = [(CKKSSerializedKey *)v9 zoneName];
    id v27 = [v25 initWithZoneName:v26 ownerName:CKCurrentUserDefaultName];
    id v28 = [(CKKSKey *)v17 initSelfWrappedWithAESKey:v22 contextID:v7 uuid:v23 keyclass:v24 state:@"remote" zoneID:v27 encodedCKRecord:0 currentkey:0];

    goto LABEL_12;
  }
LABEL_9:
  if (a5)
  {
    +[NSError errorWithDomain:@"CKKSErrorDomain" code:21 description:@"Data failed to parse as a CKKSSerializedKey"];
    id v28 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v28 = 0;
  }
LABEL_12:

  return v28;
}

+ (id)countsByClassWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v10 = [(id)objc_opt_class() sqlTable];
  v19[0] = @"contextID";
  v19[1] = @"ckzone";
  v20[0] = v7;
  id v11 = [v8 zoneName];

  if (v11)
  {
    id v12 = v11;
  }
  else
  {
    id v12 = +[NSNull null];
  }
  id v13 = v12;

  v20[1] = v13;
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100109FF4;
  v17[3] = &unk_1002FA668;
  id v15 = v9;
  id v18 = v15;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v10 where:v14 columns:&off_100326F80 groupBy:&off_100326F98 orderBy:0 limit:-1 processRow:v17 error:a5];

  return v15;
}

+ (id)countsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_10010A340;
  unsigned __int8 v22 = sub_10010A350;
  id v23 = 0;
  id v9 = [(id)objc_opt_class() sqlTable];
  v25[0] = v7;
  v24[0] = @"contextID";
  v24[1] = @"ckzone";
  uint64_t v10 = [v8 zoneName];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = +[NSNull null];
  }
  id v13 = v12;

  v25[1] = v13;
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10010A358;
  v17[3] = &unk_100306000;
  void v17[4] = &v18;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v9 where:v14 columns:&off_100326F68 groupBy:0 orderBy:0 limit:-1 processRow:v17 error:a5];

  id v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v15;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = [CKKSKey alloc];
  id v24 = [v3 objectForKeyedSubscript:@"wrappedkey"];
  id v25 = [v24 asBase64DecodedData];
  id v23 = [v3 objectForKeyedSubscript:@"contextID"];
  id v5 = [v23 asString];
  unsigned __int8 v22 = [v3 objectForKeyedSubscript:@"UUID"];
  id v6 = [v22 asString];
  uint64_t v21 = [v3 objectForKeyedSubscript:@"parentKeyUUID"];
  uint64_t v18 = [v21 asString];
  uint64_t v20 = [v3 objectForKeyedSubscript:@"keyclass"];
  BOOL v17 = [v20 asString];
  id v19 = [v3 objectForKeyedSubscript:@"state"];
  uint64_t v14 = [v19 asString];
  id v7 = objc_alloc((Class)CKRecordZoneID);
  id v16 = [v3 objectForKeyedSubscript:@"ckzone"];
  id v8 = [v16 asString];
  id v9 = [v7 initWithZoneName:v8 ownerName:CKCurrentUserDefaultName];
  uint64_t v10 = [v3 objectForKeyedSubscript:@"ckrecord"];
  id v11 = [v10 asBase64DecodedData];
  id v12 = [v3 objectForKeyedSubscript:@"currentkey"];

  id v15 = -[CKKSKey initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:](v4, "initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:", v25, v5, v6, v18, v17, v14, v9, v11, [v12 asNSInteger]);

  return v15;
}

+ (id)sqlColumns
{
  return &off_100326F50;
}

+ (id)sqlTable
{
  return @"synckeys";
}

+ (id)localKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v18[0] = @"contextID";
  id v10 = v8;
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = +[NSNull null];
  }
  id v13 = v12;

  v19[0] = v13;
  v19[1] = @"local";
  v18[1] = @"state";
  void v18[2] = @"ckzone";
  uint64_t v14 = [v9 zoneName];
  void v19[2] = v14;
  id v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  id v16 = [a1 allWhere:v15 error:a5];

  return v16;
}

+ (id)remoteKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v18[0] = @"contextID";
  id v10 = v8;
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = +[NSNull null];
  }
  id v13 = v12;

  v19[0] = v13;
  v19[1] = @"remote";
  v18[1] = @"state";
  void v18[2] = @"ckzone";
  uint64_t v14 = [v9 zoneName];
  void v19[2] = v14;
  id v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  id v16 = [a1 allWhere:v15 error:a5];

  return v16;
}

+ (id)allKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v18[0] = @"contextID";
  id v10 = v8;
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = +[NSNull null];
  }
  id v13 = v12;

  v18[1] = @"ckzone";
  v19[0] = v13;
  uint64_t v14 = [v9 zoneName];
  v19[1] = v14;
  id v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  id v16 = [a1 allWhere:v15 error:a5];

  return v16;
}

+ (id)currentKeysForClass:(id)a3 contextID:(id)a4 state:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (__CFString *)a5;
  id v15 = a6;
  v26[0] = v12;
  v25[0] = @"keyclass";
  v25[1] = @"contextID";
  id v16 = v13;
  BOOL v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = +[NSNull null];
  }
  id v19 = v18;

  v26[1] = v19;
  v26[2] = @"1";
  void v25[2] = @"currentkey";
  v25[3] = @"state";
  CFStringRef v20 = @"local";
  if (v14) {
    CFStringRef v20 = v14;
  }
  v26[3] = v20;
  v25[4] = @"ckzone";
  uint64_t v21 = [v15 zoneName];
  v26[4] = v21;
  unsigned __int8 v22 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:5];
  id v23 = [a1 allWhere:v22 error:a7];

  return v23;
}

+ (id)currentKeyForClass:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = +[CKKSCurrentKeyPointer fromDatabase:a3 contextID:v10 zoneID:v11 error:a6];
  id v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 currentKeyUUID];
    id v15 = [a1 fromDatabase:v14 contextID:v10 zoneID:v11 error:a6];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ selfWrappedKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v19[0] = @"UUID";
  id v9 = a4;
  id v10 = +[CKKSSQLWhereColumn op:1 column:2];
  v20[0] = v10;
  v19[1] = @"contextID";
  id v11 = v8;
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = +[NSNull null];
  }
  uint64_t v14 = v13;

  v20[1] = v14;
  void v20[2] = @"local";
  void v19[2] = @"state";
  void v19[3] = @"ckzone";
  id v15 = [v9 zoneName];

  v20[3] = v15;
  id v16 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  BOOL v17 = [a1 allWhere:v16 error:a5];

  return v17;
}

+ (id)tryFromDatabaseAnyState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = @"contextID";
  id v13 = v11;
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = +[NSNull null];
  }
  id v16 = v15;

  v22[0] = v16;
  v22[1] = v10;
  v21[1] = @"UUID";
  v21[2] = @"ckzone";
  BOOL v17 = [v12 zoneName];
  v22[2] = v17;
  id v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  id v19 = [a1 tryFromDatabaseWhere:v18 error:a6];

  return v19;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = @"contextID";
  id v13 = v11;
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = +[NSNull null];
  }
  id v16 = v15;

  v22[0] = v16;
  v22[1] = v10;
  v21[1] = @"UUID";
  v21[2] = @"state";
  v22[2] = @"local";
  void v21[3] = @"ckzone";
  BOOL v17 = [v12 zoneName];
  void v22[3] = v17;
  id v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
  id v19 = [a1 tryFromDatabaseWhere:v18 error:a6];

  return v19;
}

+ (id)fromDatabaseAnyState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = @"contextID";
  id v13 = v11;
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = +[NSNull null];
  }
  id v16 = v15;

  v22[0] = v16;
  v22[1] = v10;
  v21[1] = @"UUID";
  v21[2] = @"ckzone";
  BOOL v17 = [v12 zoneName];
  v22[2] = v17;
  id v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  id v19 = [a1 fromDatabaseWhere:v18 error:a6];

  return v19;
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = @"contextID";
  id v13 = v11;
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = +[NSNull null];
  }
  id v16 = v15;

  v22[0] = v16;
  v22[1] = v10;
  v21[1] = @"UUID";
  v21[2] = @"state";
  v22[2] = @"local";
  void v21[3] = @"ckzone";
  BOOL v17 = [v12 zoneName];
  void v22[3] = v17;
  id v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
  id v19 = [a1 fromDatabaseWhere:v18 error:a6];

  return v19;
}

+ (id)isItemKeyForKeychainView:(SecDbItem *)a3
{
  id v4 = sub_100119CB8(a3, kSecAttrAccessGroup);
  id v5 = sub_100119CB8(a3, kSecAttrDescription);
  uint64_t v6 = sub_100119CB8(a3, kSecAttrServer);
  id v7 = (void *)v6;
  if (v4) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || v6 == 0) {
    goto LABEL_23;
  }
  id v10 = +[NSNull null];
  if ([v4 isEqual:v10]) {
    goto LABEL_22;
  }
  id v11 = +[NSNull null];
  if ([v5 isEqual:v11])
  {
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  id v12 = +[NSNull null];
  if (([v7 isEqual:v12] & 1) != 0
    || ![v4 isEqualToString:@"com.apple.security.ckks"])
  {

    goto LABEL_21;
  }
  if ([v5 isEqualToString:@"tlk"])
  {
LABEL_18:

LABEL_19:
    id v15 = v7;
    goto LABEL_24;
  }
  id v13 = +[NSString stringWithFormat:@"%@-nonsync", @"tlk"];
  if ([v5 isEqualToString:v13])
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v14 = +[NSString stringWithFormat:@"%@-piggy", @"tlk"];
  if (([v5 isEqualToString:v14] & 1) != 0
    || ([v5 isEqualToString:@"classA"] & 1) != 0)
  {

    goto LABEL_17;
  }
  unsigned __int8 v17 = [v5 isEqualToString:@"classC"];

  if (v17) {
    goto LABEL_19;
  }
LABEL_23:
  id v15 = 0;
LABEL_24:

  return v15;
}

+ (id)randomKeyWrappedBySelf:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7 = a4;
  BOOL v8 = +[CKKSKeychainBackedKey randomKeyWrappedBySelf:a3 error:a5];
  if (v8) {
    id v9 = [[CKKSKey alloc] initWithKeyCore:v8 contextID:v7 state:@"local" currentkey:0];
  }
  else {
    id v9 = 0;
  }

  return v9;
}

+ (id)randomKeyWrappedByParent:(id)a3 keyclass:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 getKeychainBackedKey:a5];
  if (v9)
  {
    id v10 = +[CKKSKeychainBackedKey randomKeyWrappedByParent:v9 keyclass:v8 error:a5];
    if (v10)
    {
      id v11 = [CKKSKey alloc];
      id v12 = [v7 contextID];
      id v13 = [(CKKSKey *)v11 initWithKeyCore:v10 contextID:v12 state:@"local" currentkey:0];
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)randomKeyWrappedByParent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 keyclass];
  id v8 = [a1 randomKeyWrappedByParent:v6 keyclass:v7 error:a4];

  return v8;
}

+ (id)loadKeyWithUUID:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = +[CKKSKey fromDatabase:a3 contextID:v9 zoneID:a5 error:a6];
  id v11 = [v10 ensureKeyLoadedForContextID:v9 cache:0 error:a6];

  if (v11) {
    id v11 = v10;
  }

  return v11;
}

@end