@interface CKKSItem
+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6;
+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6;
+ (id)fromDatabaseRow:(id)a3;
+ (id)sqlColumns;
+ (void)setOSVersionInRecord:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesCKRecord:(id)a3;
- (CKKSItem)initWithCKRecord:(id)a3 contextID:(id)a4;
- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6;
- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6 encItem:(id)a7 wrappedkey:(id)a8 generationCount:(unint64_t)a9 encver:(unint64_t)a10;
- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6 encodedCKRecord:(id)a7 encItem:(id)a8 wrappedkey:(id)a9 generationCount:(unint64_t)a10 encver:(unint64_t)a11;
- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6 encodedCKRecord:(id)a7 encItem:(id)a8 wrappedkey:(id)a9 generationCount:(unint64_t)a10 encver:(unint64_t)a11 plaintextPCSServiceIdentifier:(id)a12 plaintextPCSPublicKey:(id)a13 plaintextPCSPublicIdentity:(id)a14;
- (CKKSWrappedAESSIVKey)wrappedkey;
- (NSData)encitem;
- (NSData)plaintextPCSPublicIdentity;
- (NSData)plaintextPCSPublicKey;
- (NSNumber)plaintextPCSServiceIdentifier;
- (NSString)base64Item;
- (NSString)parentKeyUUID;
- (NSString)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)initCopyingCKKSItem:(id)a3;
- (id)makeAuthenticatedDataDictionaryUpdatingCKKSItem:(id)a3 encryptionVersion:(unint64_t)a4;
- (id)makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer1;
- (id)makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer2:(id)a3;
- (id)sqlValues;
- (id)updateCKRecord:(id)a3 zoneID:(id)a4;
- (id)whereClauseToFindSelf;
- (unint64_t)encver;
- (unint64_t)generationCount;
- (void)setBase64Item:(id)a3;
- (void)setEncitem:(id)a3;
- (void)setEncver:(unint64_t)a3;
- (void)setFromCKRecord:(id)a3;
- (void)setGenerationCount:(unint64_t)a3;
- (void)setParentKeyUUID:(id)a3;
- (void)setPlaintextPCSPublicIdentity:(id)a3;
- (void)setPlaintextPCSPublicKey:(id)a3;
- (void)setPlaintextPCSServiceIdentifier:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWrappedkey:(id)a3;
@end

@implementation CKKSItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plaintextPCSPublicIdentity, 0);
  objc_storeStrong((id *)&self->_plaintextPCSPublicKey, 0);
  objc_storeStrong((id *)&self->_plaintextPCSServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_wrappedkey, 0);
  objc_storeStrong((id *)&self->_encitem, 0);
  objc_storeStrong((id *)&self->_parentKeyUUID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setPlaintextPCSPublicIdentity:(id)a3
{
}

- (NSData)plaintextPCSPublicIdentity
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPlaintextPCSPublicKey:(id)a3
{
}

- (NSData)plaintextPCSPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPlaintextPCSServiceIdentifier:(id)a3
{
}

- (NSNumber)plaintextPCSServiceIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setEncver:(unint64_t)a3
{
  self->_encver = a3;
}

- (unint64_t)encver
{
  return self->_encver;
}

- (void)setGenerationCount:(unint64_t)a3
{
  self->_generationCount = a3;
}

- (unint64_t)generationCount
{
  return self->_generationCount;
}

- (void)setWrappedkey:(id)a3
{
}

- (CKKSWrappedAESSIVKey)wrappedkey
{
  return (CKKSWrappedAESSIVKey *)objc_getProperty(self, a2, 80, 1);
}

- (void)setEncitem:(id)a3
{
}

- (NSData)encitem
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setParentKeyUUID:(id)a3
{
}

- (NSString)parentKeyUUID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (id)sqlValues
{
  v40[0] = @"contextID";
  v3 = [(CKKSCKRecordHolder *)self contextID];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSNull null];
  }
  id v6 = v5;

  v39 = v6;
  v41[0] = v6;
  v40[1] = @"UUID";
  v38 = [(CKKSItem *)self uuid];
  v41[1] = v38;
  v40[2] = @"parentKeyUUID";
  v37 = [(CKKSItem *)self parentKeyUUID];
  v41[2] = v37;
  v40[3] = @"ckzone";
  v7 = [(CKKSCKRecordHolder *)self zoneID];
  v8 = [v7 zoneName];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v9 = +[NSNull null];
  }
  id v10 = v9;

  v36 = v10;
  v41[3] = v10;
  v40[4] = @"encitem";
  v35 = [(CKKSItem *)self base64Item];
  v41[4] = v35;
  v40[5] = @"wrappedkey";
  v34 = [(CKKSItem *)self wrappedkey];
  v11 = [v34 base64WrappedKey];
  v41[5] = v11;
  v40[6] = @"gencount";
  v12 = +[NSNumber numberWithInteger:[(CKKSItem *)self generationCount]];
  v13 = [v12 stringValue];
  v41[6] = v13;
  v40[7] = @"encver";
  v14 = +[NSNumber numberWithInteger:[(CKKSItem *)self encver]];
  v15 = [v14 stringValue];
  v41[7] = v15;
  v40[8] = @"ckrecord";
  v16 = [(CKKSCKRecordHolder *)self encodedCKRecord];
  v17 = [v16 base64EncodedStringWithOptions:0];

  if (v17)
  {
    id v18 = v17;
  }
  else
  {
    id v18 = +[NSNull null];
  }
  v19 = v18;

  v41[8] = v19;
  v40[9] = @"pcss";
  v20 = [(CKKSItem *)self plaintextPCSServiceIdentifier];
  v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v22 = +[NSNull null];
  }
  v23 = v22;

  v41[9] = v23;
  v40[10] = @"pcsk";
  v24 = [(CKKSItem *)self plaintextPCSPublicKey];
  v25 = [v24 base64EncodedStringWithOptions:0];

  if (v25)
  {
    id v26 = v25;
  }
  else
  {
    id v26 = +[NSNull null];
  }
  v27 = v26;

  v41[10] = v27;
  v40[11] = @"pcsi";
  v28 = [(CKKSItem *)self plaintextPCSPublicIdentity];
  v29 = [v28 base64EncodedStringWithOptions:0];

  if (v29)
  {
    id v30 = v29;
  }
  else
  {
    id v30 = +[NSNull null];
  }
  v31 = v30;

  v41[11] = v31;
  v32 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:12];

  return v32;
}

- (id)whereClauseToFindSelf
{
  v12[0] = @"contextID";
  v3 = [(CKKSCKRecordHolder *)self contextID];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSNull null];
  }
  id v6 = v5;

  v13[0] = v6;
  v12[1] = @"UUID";
  v7 = [(CKKSItem *)self uuid];
  v13[1] = v7;
  v12[2] = @"ckzone";
  v8 = [(CKKSCKRecordHolder *)self zoneID];
  id v9 = [v8 zoneName];
  v13[2] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

- (void)setBase64Item:(id)a3
{
  id v4 = a3;
  id v5 = (NSData *)[objc_alloc((Class)NSData) initWithBase64EncodedString:v4 options:0];

  encitem = self->_encitem;
  self->_encitem = v5;
}

- (NSString)base64Item
{
  v2 = [(CKKSItem *)self encitem];
  v3 = [v2 base64EncodedStringWithOptions:0];

  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKKSItem;
  id v4 = [(CKKSCKRecordHolder *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 7, self->_uuid);
  objc_storeStrong(v4 + 8, self->_parentKeyUUID);
  objc_storeStrong(v4 + 9, self->_encitem);
  objc_storeStrong(v4 + 10, self->_wrappedkey);
  v4[11] = self->_generationCount;
  v4[12] = self->_encver;
  return v4;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(CKKSItem *)self uuid];
  objc_super v6 = +[NSString stringWithFormat:@"<%@: %@ %p>", v4, v5, self];

  return v6;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(CKKSItem *)self uuid];
  objc_super v6 = +[NSString stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (id)makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer2:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  objc_super v6 = [(CKKSItem *)self uuid];
  v7 = [v6 dataUsingEncoding:4];
  [v5 setObject:v7 forKeyedSubscript:@"UUID"];

  v8 = [(CKKSItem *)self parentKeyUUID];
  id v9 = [v8 dataUsingEncoding:4];
  [v5 setObject:v9 forKeyedSubscript:@"wrappedkey"];

  unint64_t v41 = [(CKKSItem *)self generationCount];
  id v10 = +[NSData dataWithBytes:&v41 length:8];
  [v5 setObject:v10 forKeyedSubscript:@"gen"];

  unint64_t v40 = [(CKKSItem *)self encver];
  v11 = +[NSData dataWithBytes:&v40 length:8];
  [v5 setObject:v11 forKeyedSubscript:@"encver"];

  v12 = [(CKKSItem *)self plaintextPCSServiceIdentifier];

  if (v12)
  {
    v13 = [(CKKSItem *)self plaintextPCSServiceIdentifier];
    id v14 = [v13 unsignedLongValue];

    id v39 = v14;
    v15 = +[NSData dataWithBytes:&v39 length:8];
    [v5 setObject:v15 forKeyedSubscript:@"pcsservice"];
  }
  v16 = [(CKKSItem *)self plaintextPCSPublicKey];
  [v5 setObject:v16 forKeyedSubscript:@"pcspublickey"];

  v17 = [(CKKSItem *)self plaintextPCSPublicIdentity];
  [v5 setObject:v17 forKeyedSubscript:@"pcspublicidentity"];

  if (!v4) {
    goto LABEL_36;
  }
  id v18 = [v4 storedCKRecord];
  if (!v18) {
    goto LABEL_35;
  }
  v32 = v5;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v33 = v18;
  v19 = [v18 allKeys];
  id v20 = [v19 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (!v20) {
    goto LABEL_34;
  }
  id v21 = v20;
  uint64_t v22 = *(void *)v36;
  do
  {
    v23 = 0;
    do
    {
      if (*(void *)v36 != v22) {
        objc_enumerationMutation(v19);
      }
      v24 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v23);
      if (([v24 isEqualToString:@"UUID"] & 1) == 0
        && ([v24 isEqualToString:@"uploadver"] & 1) == 0
        && ([v24 isEqualToString:@"data"] & 1) == 0
        && ([v24 isEqualToString:@"wrappedkey"] & 1) == 0
        && ([v24 isEqualToString:@"gen"] & 1) == 0
        && ([v24 isEqualToString:@"encver"] & 1) == 0
        && ([v24 isEqualToString:@"pcsservice"] & 1) == 0
        && ([v24 isEqualToString:@"pcspublickey"] & 1) == 0
        && ([v24 isEqualToString:@"pcspublicidentity"] & 1) == 0
        && ([v24 hasPrefix:@"server_"] & 1) == 0)
      {
        v34 = [v33 objectForKeyedSubscript:v24];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v25 = [v34 dataUsingEncoding:4];
LABEL_24:
          id v30 = v25;
          [v32 setObject:v25 forKeyedSubscript:v24];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v25 = [v34 copy];
            goto LABEL_24;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v31 = objc_alloc_init((Class)NSISO8601DateFormatter);
            v29 = [v31 stringForObjectValue:v34];
            v28 = [v29 dataUsingEncoding:4];
            [v32 setObject:v28 forKeyedSubscript:v24];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v39 = (id)0xAAAAAAAAAAAAAAAALL;
              id v39 = [v34 unsignedLongLongValue];
              id v25 = +[NSData dataWithBytes:&v39 length:8];
              goto LABEL_24;
            }
          }
        }
      }
      v23 = (char *)v23 + 1;
    }
    while (v21 != v23);
    id v26 = [v19 countByEnumeratingWithState:&v35 objects:v42 count:16];
    id v21 = v26;
  }
  while (v26);
LABEL_34:

  id v5 = v32;
  id v18 = v33;
LABEL_35:

LABEL_36:

  return v5;
}

- (id)makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer1
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(CKKSItem *)self uuid];
  id v5 = [v4 dataUsingEncoding:4];
  [v3 setObject:v5 forKeyedSubscript:@"UUID"];

  objc_super v6 = [(CKKSItem *)self parentKeyUUID];
  v7 = [v6 dataUsingEncoding:4];
  [v3 setObject:v7 forKeyedSubscript:@"wrappedkey"];

  unint64_t v12 = [(CKKSItem *)self generationCount];
  v8 = +[NSData dataWithBytes:&v12 length:8];
  [v3 setObject:v8 forKeyedSubscript:@"gen"];

  unint64_t v11 = [(CKKSItem *)self encver];
  id v9 = +[NSData dataWithBytes:&v11 length:8];
  [v3 setObject:v9 forKeyedSubscript:@"encver"];

  [v3 setObject:0 forKeyedSubscript:@"pcsservice"];
  [v3 setObject:0 forKeyedSubscript:@"pcspublickey"];
  [v3 setObject:0 forKeyedSubscript:@"pcspublicidentity"];

  return v3;
}

- (id)makeAuthenticatedDataDictionaryUpdatingCKKSItem:(id)a3 encryptionVersion:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    uint64_t v7 = [(CKKSItem *)self makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer2:v6];
  }
  else
  {
    if (a4 != 1)
    {
      id v10 = +[NSString stringWithFormat:@"%d is not a known encryption version", a4];
      id v11 = +[NSException exceptionWithName:@"WrongEncryptionVersionException" reason:v10 userInfo:0];

      objc_exception_throw(v11);
    }
    uint64_t v7 = [(CKKSItem *)self makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer1];
  }
  v8 = (void *)v7;

  return v8;
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordType];
  unsigned int v6 = [v5 isEqual:@"item"];

  if (!v6) {
    goto LABEL_41;
  }
  uint64_t v7 = [v4 recordID];
  v8 = [v7 recordName];
  id v9 = [(CKKSItem *)self uuid];
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    id v39 = sub_1000CD884(@"ckksitem", 0);
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_40;
    }
    *(_WORD *)v42 = 0;
    unint64_t v40 = "UUID does not match";
    goto LABEL_39;
  }
  id v11 = [v4 objectForKeyedSubscript:@"parentkeyref"];
  unint64_t v12 = [v11 recordID];
  v13 = [v12 recordName];
  id v14 = [(CKKSItem *)self parentKeyUUID];
  unsigned __int8 v15 = [v13 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    id v39 = sub_1000CD884(@"ckksitem", 0);
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_40;
    }
    *(_WORD *)v42 = 0;
    unint64_t v40 = "wrapping key reference does not match";
    goto LABEL_39;
  }
  v16 = [v4 objectForKeyedSubscript:@"gen"];
  v17 = +[NSNumber numberWithInteger:[(CKKSItem *)self generationCount]];
  unsigned __int8 v18 = [v16 isEqual:v17];

  if ((v18 & 1) == 0)
  {
    id v39 = sub_1000CD884(@"ckksitem", 0);
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_40;
    }
    *(_WORD *)v42 = 0;
    unint64_t v40 = "SecCKRecordGenerationCountKey does not match";
    goto LABEL_39;
  }
  v19 = [v4 objectForKeyedSubscript:@"wrappedkey"];
  id v20 = [(CKKSItem *)self wrappedkey];
  id v21 = [v20 base64WrappedKey];
  unsigned __int8 v22 = [v19 isEqual:v21];

  if ((v22 & 1) == 0)
  {
    id v39 = sub_1000CD884(@"ckksitem", 0);
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_40;
    }
    *(_WORD *)v42 = 0;
    unint64_t v40 = "SecCKRecordWrappedKeyKey does not match";
    goto LABEL_39;
  }
  v23 = [v4 objectForKeyedSubscript:@"data"];
  v24 = [(CKKSItem *)self encitem];
  unsigned __int8 v25 = [v23 isEqual:v24];

  if ((v25 & 1) == 0)
  {
    id v39 = sub_1000CD884(@"ckksitem", 0);
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_40;
    }
    *(_WORD *)v42 = 0;
    unint64_t v40 = "SecCKRecordDataKey does not match";
    goto LABEL_39;
  }
  id v26 = [v4 objectForKeyedSubscript:@"pcsservice"];
  if (v26
    || ([(CKKSItem *)self plaintextPCSServiceIdentifier],
        (v24 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v27 = [v4 objectForKeyedSubscript:@"pcsservice"];
    v28 = [(CKKSItem *)self plaintextPCSServiceIdentifier];
    unsigned __int8 v29 = [v27 isEqual:v28];

    if (v26)
    {

      if (v29) {
        goto LABEL_11;
      }
    }
    else
    {

      if (v29) {
        goto LABEL_11;
      }
    }
    id v39 = sub_1000CD884(@"ckksitem", 0);
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_40;
    }
    *(_WORD *)v42 = 0;
    unint64_t v40 = "SecCKRecordPCSServiceIdentifier does not match";
    goto LABEL_39;
  }
LABEL_11:
  id v30 = [v4 objectForKeyedSubscript:@"pcspublickey"];
  if (v30
    || ([(CKKSItem *)self plaintextPCSPublicKey],
        (v24 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v31 = [v4 objectForKeyedSubscript:@"pcspublickey"];
    v32 = [(CKKSItem *)self plaintextPCSPublicKey];
    unsigned __int8 v33 = [v31 isEqual:v32];

    if (v30)
    {

      if (v33) {
        goto LABEL_15;
      }
    }
    else
    {

      if (v33) {
        goto LABEL_15;
      }
    }
    id v39 = sub_1000CD884(@"ckksitem", 0);
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_40;
    }
    *(_WORD *)v42 = 0;
    unint64_t v40 = "SecCKRecordPCSPublicKey does not match";
LABEL_39:
    _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, v40, v42, 2u);
    goto LABEL_40;
  }
LABEL_15:
  v34 = [v4 objectForKeyedSubscript:@"pcspublicidentity"];
  if (!v34)
  {
    v24 = [(CKKSItem *)self plaintextPCSPublicIdentity];
    if (!v24) {
      goto LABEL_19;
    }
  }
  long long v35 = [v4 objectForKeyedSubscript:@"pcspublicidentity"];
  long long v36 = [(CKKSItem *)self plaintextPCSPublicIdentity];
  unsigned __int8 v37 = [v35 isEqual:v36];

  if (!v34)
  {

    if (v37) {
      goto LABEL_19;
    }
LABEL_37:
    id v39 = sub_1000CD884(@"ckksitem", 0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v42 = 0;
      unint64_t v40 = "SecCKRecordPCSPublicIdentity does not match";
      goto LABEL_39;
    }
LABEL_40:

LABEL_41:
    BOOL v38 = 0;
    goto LABEL_42;
  }

  if ((v37 & 1) == 0) {
    goto LABEL_37;
  }
LABEL_19:
  BOOL v38 = 1;
LABEL_42:

  return v38;
}

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 recordType];
  unsigned __int8 v9 = [v8 isEqual:@"item"];

  if ((v9 & 1) == 0)
  {
    v24 = [v6 recordType];
    unsigned __int8 v25 = +[NSString stringWithFormat:@"CKRecordType (%@) was not %@", v24, @"item"];
    id v26 = +[NSException exceptionWithName:@"WrongCKRecordTypeException" reason:v25 userInfo:0];

    objc_exception_throw(v26);
  }
  id v10 = objc_alloc((Class)CKReference);
  id v11 = objc_alloc((Class)CKRecordID);
  unint64_t v12 = [(CKKSItem *)self parentKeyUUID];
  id v13 = [v11 initWithRecordName:v12 zoneID:v7];
  id v14 = [v10 initWithRecordID:v13 action:CKReferenceActionValidate];
  [v6 setObject:v14 forKeyedSubscript:@"parentkeyref"];

  +[CKKSItem setOSVersionInRecord:v6];
  unsigned __int8 v15 = [(CKKSItem *)self encitem];
  [v6 setObject:v15 forKeyedSubscript:@"data"];

  v16 = [(CKKSItem *)self wrappedkey];
  v17 = [v16 base64WrappedKey];
  [v6 setObject:v17 forKeyedSubscript:@"wrappedkey"];

  unsigned __int8 v18 = +[NSNumber numberWithInteger:[(CKKSItem *)self generationCount]];
  [v6 setObject:v18 forKeyedSubscript:@"gen"];

  v19 = +[NSNumber numberWithInteger:[(CKKSItem *)self encver]];
  [v6 setObject:v19 forKeyedSubscript:@"encver"];

  id v20 = [(CKKSItem *)self plaintextPCSServiceIdentifier];
  [v6 setObject:v20 forKeyedSubscript:@"pcsservice"];

  id v21 = [(CKKSItem *)self plaintextPCSPublicKey];
  [v6 setObject:v21 forKeyedSubscript:@"pcspublickey"];

  unsigned __int8 v22 = [(CKKSItem *)self plaintextPCSPublicIdentity];
  [v6 setObject:v22 forKeyedSubscript:@"pcspublicidentity"];

  return v6;
}

- (void)setFromCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordType];
  unsigned __int8 v6 = [v5 isEqual:@"item"];

  if ((v6 & 1) == 0)
  {
    id v26 = [v4 recordType];
    v27 = +[NSString stringWithFormat:@"CKRecordType (%@) was not %@", v26, @"item"];
    id v28 = +[NSException exceptionWithName:@"WrongCKRecordTypeException" reason:v27 userInfo:0];

    objc_exception_throw(v28);
  }
  [(CKKSCKRecordHolder *)self setStoredCKRecord:v4];
  id v7 = [v4 recordID];
  v8 = [v7 recordName];
  uuid = self->_uuid;
  self->_uuid = v8;

  id v10 = [v4 objectForKeyedSubscript:@"parentkeyref"];
  id v11 = [v10 recordID];
  unint64_t v12 = [v11 recordName];
  [(CKKSItem *)self setParentKeyUUID:v12];

  id v13 = [v4 objectForKeyedSubscript:@"data"];
  [(CKKSItem *)self setEncitem:v13];

  id v14 = [v4 objectForKeyedSubscript:@"wrappedkey"];
  if (v14)
  {
    unsigned __int8 v15 = [[CKKSWrappedAESSIVKey alloc] initWithBase64:v14];
  }
  else
  {
    v16 = [v4 recordID];
    v17 = [v16 zoneID];
    unsigned __int8 v18 = [v17 zoneName];
    v19 = sub_1000CD884(@"ckksitem", v18);

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Corrupt item recieved with no wrapped key", buf, 2u);
    }

    unsigned __int8 v15 = +[CKKSWrappedAESSIVKey zeroedKey];
  }
  id v20 = v15;
  [(CKKSItem *)self setWrappedkey:v15];

  id v21 = [v4 objectForKeyedSubscript:@"gen"];
  -[CKKSItem setGenerationCount:](self, "setGenerationCount:", [v21 unsignedIntegerValue]);

  unsigned __int8 v22 = [v4 objectForKeyedSubscript:@"encver"];
  -[CKKSItem setEncver:](self, "setEncver:", [v22 unsignedIntegerValue]);

  v23 = [v4 objectForKeyedSubscript:@"pcsservice"];
  [(CKKSItem *)self setPlaintextPCSServiceIdentifier:v23];

  v24 = [v4 objectForKeyedSubscript:@"pcspublickey"];
  [(CKKSItem *)self setPlaintextPCSPublicKey:v24];

  unsigned __int8 v25 = [v4 objectForKeyedSubscript:@"pcspublicidentity"];
  [(CKKSItem *)self setPlaintextPCSPublicIdentity:v25];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unsigned __int8 v6 = [(CKKSItem *)self uuid];
    id v7 = [v5 uuid];
    if (![v6 isEqual:v7])
    {
      BOOL v14 = 0;
LABEL_41:

      goto LABEL_42;
    }
    v8 = [(CKKSItem *)self parentKeyUUID];
    unsigned __int8 v9 = [v5 parentKeyUUID];
    if (![v8 isEqual:v9])
    {
      BOOL v14 = 0;
LABEL_40:

      goto LABEL_41;
    }
    id v10 = [(CKKSCKRecordHolder *)self zoneID];
    id v11 = [v5 zoneID];
    unsigned __int8 v33 = v10;
    if (![v10 isEqual:v11])
    {
      BOOL v14 = 0;
LABEL_39:

      goto LABEL_40;
    }
    uint64_t v32 = [(CKKSCKRecordHolder *)self contextID];
    if (v32 || (v12 = 0, [v5 contextID], (unsigned __int8 v25 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v13 = [(CKKSCKRecordHolder *)self contextID];
      uint64_t v30 = [v5 contextID];
      id v31 = v13;
      if (!objc_msgSend(v13, "isEqualToString:"))
      {
        BOOL v14 = 0;
        unsigned __int8 v15 = (void *)v30;
        unint64_t v12 = (void *)v32;
LABEL_35:

        goto LABEL_36;
      }
      int v28 = 1;
      unint64_t v12 = (void *)v32;
    }
    else
    {
      unsigned __int8 v25 = 0;
      int v28 = 0;
    }
    unsigned __int8 v29 = [(CKKSItem *)self encitem];
    if (v29 || ([v5 encitem], (v23 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = [(CKKSItem *)self encitem];
      id v26 = [v5 encitem];
      v27 = v16;
      if (![v16 isEqual:v26])
      {
        BOOL v14 = 0;
        goto LABEL_28;
      }
      int v24 = 1;
    }
    else
    {
      v23 = 0;
      int v24 = 0;
    }
    v17 = [(CKKSItem *)self wrappedkey];
    unsigned __int8 v18 = [v5 wrappedkey];
    if ([v17 isEqual:v18]
      && (id v22 = -[CKKSItem generationCount](self, "generationCount"), v22 == [v5 generationCount]))
    {
      id v19 = [(CKKSItem *)self encver];
      BOOL v14 = v19 == [v5 encver];

      if ((v24 & 1) == 0) {
        goto LABEL_24;
      }
    }
    else
    {

      BOOL v14 = 0;
      if (!v24)
      {
LABEL_24:
        unint64_t v12 = (void *)v32;
        if (v29) {

        }
        else {
        if ((v28 & 1) == 0)
        {
LABEL_36:
          if (!v12) {

          }
          goto LABEL_39;
        }
        goto LABEL_34;
      }
    }
    unint64_t v12 = (void *)v32;
LABEL_28:

    id v20 = v29;
    if (!v29)
    {

      id v20 = 0;
    }

    if (!v28) {
      goto LABEL_36;
    }
LABEL_34:
    unsigned __int8 v15 = (void *)v30;
    goto LABEL_35;
  }
  BOOL v14 = 0;
LABEL_42:

  return v14;
}

- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6 encodedCKRecord:(id)a7 encItem:(id)a8 wrappedkey:(id)a9 generationCount:(unint64_t)a10 encver:(unint64_t)a11 plaintextPCSServiceIdentifier:(id)a12 plaintextPCSPublicKey:(id)a13 plaintextPCSPublicIdentity:(id)a14
{
  id v30 = a3;
  id v29 = a4;
  id v19 = a8;
  id v28 = a9;
  id v27 = a12;
  id v20 = a13;
  id v21 = a14;
  v31.receiver = self;
  v31.super_class = (Class)CKKSItem;
  id v22 = [(CKKSCKRecordHolder *)&v31 initWithCKRecordType:@"item" encodedCKRecord:a7 contextID:a5 zoneID:a6];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_uuid, a3);
    objc_storeStrong((id *)&v23->_parentKeyUUID, a4);
    v23->_generationCount = a10;
    [(CKKSItem *)v23 setEncitem:v19];
    objc_storeStrong((id *)&v23->_wrappedkey, a9);
    v23->_encver = a11;
    objc_storeStrong((id *)&v23->_plaintextPCSServiceIdentifier, a12);
    objc_storeStrong((id *)&v23->_plaintextPCSPublicKey, a13);
    objc_storeStrong((id *)&v23->_plaintextPCSPublicIdentity, a14);
  }

  return v23;
}

- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6 encodedCKRecord:(id)a7 encItem:(id)a8 wrappedkey:(id)a9 generationCount:(unint64_t)a10 encver:(unint64_t)a11
{
  return [(CKKSItem *)self initWithUUID:a3 parentKeyUUID:a4 contextID:a5 zoneID:a6 encodedCKRecord:a7 encItem:a8 wrappedkey:a9 generationCount:a10 encver:a11 plaintextPCSServiceIdentifier:0 plaintextPCSPublicKey:0 plaintextPCSPublicIdentity:0];
}

- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6 encItem:(id)a7 wrappedkey:(id)a8 generationCount:(unint64_t)a9 encver:(unint64_t)a10
{
  return [(CKKSItem *)self initWithUUID:a3 parentKeyUUID:a4 contextID:a5 zoneID:a6 encodedCKRecord:0 encItem:a7 wrappedkey:a8 generationCount:a9 encver:a10];
}

- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6
{
  return [(CKKSItem *)self initWithUUID:a3 parentKeyUUID:a4 contextID:a5 zoneID:a6 encodedCKRecord:0 encItem:0 wrappedkey:0 generationCount:0 encver:0];
}

- (id)initCopyingCKKSItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 ckRecordType];
  unsigned __int8 v6 = [v4 encodedCKRecord];
  id v7 = [v4 contextID];
  v8 = [v4 zoneID];
  v25.receiver = self;
  v25.super_class = (Class)CKKSItem;
  unsigned __int8 v9 = [(CKKSCKRecordHolder *)&v25 initWithCKRecordType:v5 encodedCKRecord:v6 contextID:v7 zoneID:v8];

  if (v9)
  {
    uint64_t v10 = [v4 uuid];
    uuid = v9->_uuid;
    v9->_uuid = (NSString *)v10;

    uint64_t v12 = [v4 parentKeyUUID];
    parentKeyUUID = v9->_parentKeyUUID;
    v9->_parentKeyUUID = (NSString *)v12;

    v9->_generationCount = (unint64_t)[v4 generationCount];
    uint64_t v14 = [v4 encitem];
    encitem = v9->_encitem;
    v9->_encitem = (NSData *)v14;

    uint64_t v16 = [v4 wrappedkey];
    wrappedkey = v9->_wrappedkey;
    v9->_wrappedkey = (CKKSWrappedAESSIVKey *)v16;

    v9->_encver = (unint64_t)[v4 encver];
    uint64_t v18 = [v4 plaintextPCSServiceIdentifier];
    plaintextPCSServiceIdentifier = v9->_plaintextPCSServiceIdentifier;
    v9->_plaintextPCSServiceIdentifier = (NSNumber *)v18;

    uint64_t v20 = [v4 plaintextPCSPublicKey];
    plaintextPCSPublicKey = v9->_plaintextPCSPublicKey;
    v9->_plaintextPCSPublicKey = (NSData *)v20;

    uint64_t v22 = [v4 plaintextPCSPublicIdentity];
    plaintextPCSPublicIdentity = v9->_plaintextPCSPublicIdentity;
    v9->_plaintextPCSPublicIdentity = (NSData *)v22;
  }
  return v9;
}

- (CKKSItem)initWithCKRecord:(id)a3 contextID:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CKKSItem;
  return [(CKKSCKRecordHolder *)&v5 initWithCKRecord:a3 contextID:a4];
}

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  v8 = (__CFString *)a3;
  id v9 = a4;
  uint64_t v10 = [(__CFString *)v8 zoneID];
  id v11 = [v10 zoneName];
  uint64_t v12 = sub_1000CD884(@"ckks", v11);

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v65 = @"item";
    __int16 v66 = 2112;
    v67 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CloudKit notification: deleted record(%@): %@", buf, 0x16u);
  }

  id v13 = [(__CFString *)v8 recordName];
  uint64_t v14 = [(__CFString *)v8 zoneID];
  unsigned __int8 v15 = +[CKKSMirrorEntry tryFromDatabase:v13 contextID:v9 zoneID:v14 error:a6];

  if (!v15) {
    goto LABEL_38;
  }
  id v63 = 0;
  unsigned __int8 v16 = [(__CFString *)v15 deleteFromDatabase:&v63];
  v17 = v63;
  uint64_t v18 = v17;
  if ((v16 & 1) == 0)
  {
    if (a6)
    {
      uint64_t v18 = v17;
      BOOL v27 = 0;
      v23 = 0;
      *a6 = v18;
    }
    else
    {
      BOOL v27 = 0;
      v23 = 0;
    }
LABEL_41:

    goto LABEL_42;
  }
  id v19 = [CKKSIncomingQueueEntry alloc];
  uint64_t v20 = [(__CFString *)v15 item];
  id v21 = [(CKKSIncomingQueueEntry *)v19 initWithCKKSItem:v20 action:@"delete" state:@"new"];

  id v62 = 0;
  [(CKKSSQLDatabaseObject *)v21 saveToDatabase:&v62];
  uint64_t v22 = (__CFString *)v62;
  if (v22)
  {
    v23 = v22;
    int v24 = [(__CFString *)v8 zoneID];
    objc_super v25 = [v24 zoneName];
    id v26 = sub_1000CD884(@"ckks", v25);

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v65 = v23;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Couldn't save incoming queue entry: %@", buf, 0xCu);
    }

    if (a6) {
      *a6 = v23;
    }

    BOOL v27 = 0;
    goto LABEL_41;
  }
  v54 = v21;
  id v28 = [(CKKSIncomingQueueEntry *)v21 uuid];
  v71[0] = @"new";
  v71[1] = @"reencrypt";
  v71[2] = @"error";
  id v29 = +[NSArray arrayWithObjects:v71 count:3];
  id v30 = [(__CFString *)v8 zoneID];
  id v61 = 0;
  objc_super v31 = +[CKKSOutgoingQueueEntry allWithUUID:v28 states:v29 contextID:v9 zoneID:v30 error:&v61];
  uint64_t v32 = (__CFString *)v61;

  if (v32)
  {
    unsigned __int8 v33 = v31;
    v34 = [(__CFString *)v8 zoneID];
    long long v35 = [v34 zoneName];
    long long v36 = sub_1000CD884(@"ckks", v35);

    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v37 = [(CKKSIncomingQueueEntry *)v54 uuid];
      *(_DWORD *)buf = 138412546;
      CFStringRef v65 = v37;
      __int16 v66 = 2112;
      v67 = v32;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Couldn't load OQE sibling for %@: %@", buf, 0x16u);
    }
    if (a6) {
      *a6 = v32;
    }
    int v38 = 1;
    objc_super v31 = v33;
  }
  else
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = v31;
    id v39 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
    if (v39)
    {
      id v40 = v39;
      v53 = v31;
      uint64_t v41 = *(void *)v58;
      while (2)
      {
        for (i = 0; i != v40; i = (char *)i + 1)
        {
          if (*(void *)v58 != v41) {
            objc_enumerationMutation(obj);
          }
          v43 = *(__CFString **)(*((void *)&v57 + 1) + 8 * i);
          id v56 = 0;
          [(__CFString *)v43 deleteFromDatabase:&v56];
          id v44 = v56;
          if (v44)
          {
            v45 = v44;
            v46 = [(__CFString *)v8 zoneID];
            v47 = [v46 zoneName];
            v48 = sub_1000CD884(@"ckks", v47);

            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              v49 = [(CKKSIncomingQueueEntry *)v54 uuid];
              *(_DWORD *)buf = 138412802;
              CFStringRef v65 = v43;
              __int16 v66 = 2112;
              v67 = v49;
              __int16 v68 = 2112;
              v69 = v45;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Couldn't delete OQE sibling(%@) for %@: %@", buf, 0x20u);
            }
            objc_super v31 = v53;
            if (a6) {
              *a6 = v45;
            }

            int v38 = 1;
            goto LABEL_35;
          }
        }
        id v40 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
        if (v40) {
          continue;
        }
        break;
      }
      int v38 = 0;
      objc_super v31 = v53;
    }
    else
    {
      int v38 = 0;
    }
LABEL_35:

    uint64_t v32 = 0;
  }

  if (!v38)
  {
LABEL_38:
    v50 = [(__CFString *)v8 zoneID];
    v51 = [v50 zoneName];
    uint64_t v18 = sub_1000CD884(@"ckks", v51);

    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v65 = v8;
      __int16 v66 = 2112;
      v67 = v15;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "CKKSMirrorEntry was deleted: %@ %@", buf, 0x16u);
    }
    v23 = 0;
    BOOL v27 = 1;
    goto LABEL_41;
  }
  BOOL v27 = 0;
  v23 = 0;
LABEL_42:

  return v27;
}

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  v8 = (CKKSMirrorEntry *)a3;
  id v9 = a4;
  uint64_t v10 = [(CKKSMirrorEntry *)v8 recordID];
  id v11 = [v10 recordName];
  uint64_t v12 = [(CKKSMirrorEntry *)v8 recordID];
  id v13 = [v12 zoneID];
  id v131 = 0;
  uint64_t v14 = +[CKKSMirrorEntry tryFromDatabase:v11 contextID:v9 zoneID:v13 error:&v131];
  unsigned __int8 v15 = (CKKSMirrorEntry *)v131;

  if (v15)
  {
    unsigned __int8 v16 = [(CKKSMirrorEntry *)v8 recordID];
    v17 = [v16 zoneID];
    uint64_t v18 = [v17 zoneName];
    id v19 = sub_1000CD884(@"ckks", v18);

    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 138412290;
    v135 = v15;
    uint64_t v20 = "error loading a CKKSMirrorEntry from database: %@";
    id v21 = v19;
    uint32_t v22 = 12;
    goto LABEL_4;
  }
  if (v6)
  {
    if (v14)
    {
      unsigned __int8 v24 = [(CKKSMirrorEntry *)v14 matchesCKRecord:v8];
      objc_super v25 = [(CKKSMirrorEntry *)v8 recordID];
      id v26 = [v25 zoneID];
      BOOL v27 = [v26 zoneName];
      id v28 = sub_1000CD884(@"ckksresync", v27);

      if (v24)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = [(CKKSMirrorEntry *)v8 recordID];
          *(_DWORD *)buf = 138412290;
          v135 = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Already know about this item record, updating anyway: %@", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v135 = v14;
        __int16 v136 = 2112;
        v137 = v8;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "BUG: Local item doesn't match resynced CloudKit record: %@ %@", buf, 0x16u);
      }

      goto LABEL_21;
    }
    id v30 = [(CKKSMirrorEntry *)v8 recordID];
    objc_super v31 = [v30 zoneID];
    uint64_t v32 = [v31 zoneName];
    unsigned __int8 v33 = sub_1000CD884(@"ckksresync", v32);

    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v135 = v8;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "BUG: No local item matching resynced CloudKit record: %@", buf, 0xCu);
    }

LABEL_17:
    uint64_t v14 = [[CKKSMirrorEntry alloc] initWithCKRecord:v8 contextID:v9];
    CFStringRef v34 = @"add";
    goto LABEL_35;
  }
  if (!v14) {
    goto LABEL_17;
  }
LABEL_21:
  uint64_t v35 = [(CKKSMirrorEntry *)v14 item];
  if (v35)
  {
    long long v36 = (void *)v35;
    unsigned __int8 v37 = [(CKKSMirrorEntry *)v14 item];
    id v38 = [v37 generationCount];
    id v39 = [(CKKSMirrorEntry *)v8 objectForKeyedSubscript:@"gen"];
    id v40 = [v39 unsignedLongLongValue];

    if (v38 > v40)
    {
      uint64_t v41 = [(CKKSMirrorEntry *)v8 recordID];
      v42 = [v41 zoneID];
      v43 = [v42 zoneName];
      id v44 = sub_1000CD884(@"ckks", v43);

      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = [(CKKSMirrorEntry *)v14 uuid];
        v46 = [(CKKSMirrorEntry *)v14 item];
        v47 = (CKKSMirrorEntry *)[v46 generationCount];
        v48 = [(CKKSMirrorEntry *)v8 objectForKeyedSubscript:@"gen"];
        *(_DWORD *)buf = 138412802;
        v135 = v45;
        __int16 v136 = 2048;
        v137 = v47;
        __int16 v138 = 2112;
        v139 = v48;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "received a record from CloudKit with a bad generation count: %@ (%ld > %@)", buf, 0x20u);
      }
      if (a6)
      {
        v49 = [(CKKSMirrorEntry *)v14 uuid];
        v50 = [(CKKSMirrorEntry *)v14 item];
        id v51 = [v50 generationCount];
        v52 = [(CKKSMirrorEntry *)v8 objectForKeyedSubscript:@"gen"];
        v53 = +[NSString stringWithFormat:@"Received a record(%@) with a bad generation count (%ld > %@)", v49, v51, v52];
        *a6 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:58 description:v53];
      }
      unsigned __int8 v15 = 0;
      goto LABEL_28;
    }
  }
  if ([(CKKSMirrorEntry *)v14 matchesCKRecord:v8] && !v6)
  {
    v54 = [(CKKSMirrorEntry *)v8 recordID];
    v55 = [v54 zoneID];
    id v56 = [v55 zoneName];
    long long v57 = sub_1000CD884(@"ckks", v56);

    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      long long v58 = [(CKKSMirrorEntry *)v14 uuid];
      *(_DWORD *)buf = 138412290;
      v135 = v58;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "CloudKit has told us of record we already know about for %@; skipping update",
        buf,
        0xCu);
    }
    unsigned __int8 v15 = 0;
    BOOL v23 = 1;
    goto LABEL_85;
  }
  [(CKKSMirrorEntry *)v14 setFromCKRecord:v8];
  CFStringRef v34 = @"modify";
LABEL_35:
  id v130 = 0;
  unsigned int v59 = [(CKKSSQLDatabaseObject *)v14 saveToDatabase:&v130];
  unsigned __int8 v15 = (CKKSMirrorEntry *)v130;
  long long v60 = [(CKKSMirrorEntry *)v8 recordID];
  id v61 = [v60 zoneID];
  id v62 = [v61 zoneName];
  id v19 = sub_1000CD884(@"ckks", v62);

  if (!v59 || v15)
  {
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      if (a6)
      {
        unsigned __int8 v15 = v15;
        BOOL v23 = 0;
        *a6 = v15;
        goto LABEL_85;
      }
LABEL_28:
      BOOL v23 = 0;
      goto LABEL_85;
    }
    *(_DWORD *)buf = 138412546;
    v135 = v8;
    __int16 v136 = 2112;
    v137 = v15;
    uint64_t v20 = "couldn't save new CKRecord to database: %@ %@";
    id v21 = v19;
    uint32_t v22 = 22;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
    goto LABEL_5;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v135 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "CKKSMirrorEntry was created: %@", buf, 0xCu);
  }

  id v63 = [(CKKSMirrorEntry *)v14 item];
  v64 = [v63 uuid];
  CFStringRef v65 = [(CKKSMirrorEntry *)v14 item];
  __int16 v66 = [v65 zoneID];
  id v129 = 0;
  v67 = +[CKKSIncomingQueueEntry tryFromDatabase:v64 contextID:v9 zoneID:v66 error:&v129];
  __int16 v68 = (CKKSMirrorEntry *)v129;

  v119 = v68;
  if (v68)
  {
    v69 = [(CKKSMirrorEntry *)v8 recordID];
    v70 = [v69 zoneID];
    v71 = [v70 zoneName];
    v72 = sub_1000CD884(@"ckks", v71);

    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v135 = v119;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "Couldn't load possible existing incoming queue entry: %@", buf, 0xCu);
    }
  }
  if (v67)
  {
    v73 = [(CKKSMirrorEntry *)v8 recordID];
    v74 = [v73 zoneID];
    v75 = [v74 zoneName];
    v76 = sub_1000CD884(@"ckks", v75);

    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v135 = v67;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Deleting existing CKKSIncomingQueueEntry: %@", buf, 0xCu);
    }

    id v128 = 0;
    [(CKKSSQLDatabaseObject *)v67 deleteFromDatabase:&v128];
    v77 = (CKKSMirrorEntry *)v128;
    if (v77)
    {
      v78 = [(CKKSMirrorEntry *)v8 recordID];
      v79 = [v78 zoneID];
      v80 = [v79 zoneName];
      v81 = sub_1000CD884(@"ckks", v80);

      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v135 = v77;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "Couldn't delete existing incoming queue entry: %@", buf, 0xCu);
      }
    }
  }
  v118 = v67;
  v82 = [CKKSIncomingQueueEntry alloc];
  v83 = [(CKKSMirrorEntry *)v14 item];
  v84 = [(CKKSIncomingQueueEntry *)v82 initWithCKKSItem:v83 action:v34 state:@"new"];

  id v127 = 0;
  LODWORD(v82) = [(CKKSSQLDatabaseObject *)v84 saveToDatabase:&v127];
  v85 = (CKKSMirrorEntry *)v127;
  v86 = [(CKKSMirrorEntry *)v8 recordID];
  v87 = [v86 zoneID];
  v88 = [v87 zoneName];
  v89 = sub_1000CD884(@"ckks", v88);

  v90 = v85;
  if (!v82 || v85)
  {
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v135 = v85;
      _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "Couldn't save modified incoming queue entry: %@", buf, 0xCu);
    }

    v108 = v118;
    if (a6)
    {
      v109 = v85;
      unsigned __int8 v15 = 0;
      BOOL v23 = 0;
      *a6 = v109;
    }
    else
    {
      unsigned __int8 v15 = 0;
      BOOL v23 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v135 = (CKKSMirrorEntry *)v84;
      _os_log_debug_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEBUG, "CKKSIncomingQueueEntry was created: %@", buf, 0xCu);
    }

    v91 = [(CKKSIncomingQueueEntry *)v84 uuid];
    v133[0] = @"new";
    v133[1] = @"reencrypt";
    v133[2] = @"error";
    v92 = +[NSArray arrayWithObjects:v133 count:3];
    v93 = [(CKKSMirrorEntry *)v8 recordID];
    v94 = [v93 zoneID];
    id v126 = 0;
    v95 = +[CKKSOutgoingQueueEntry allWithUUID:v91 states:v92 contextID:v9 zoneID:v94 error:&v126];
    unsigned __int8 v15 = (CKKSMirrorEntry *)v126;

    if (!v95 || v15)
    {
      v96 = [(CKKSMirrorEntry *)v8 recordID];
      v97 = [v96 zoneID];
      v98 = [v97 zoneName];
      v99 = sub_1000CD884(@"ckks", v98);

      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        v100 = [(CKKSIncomingQueueEntry *)v84 uuid];
        *(_DWORD *)buf = 138412546;
        v135 = v100;
        __int16 v136 = 2112;
        v137 = v15;
        _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "Couldn't load OQE sibling for %@: %@", buf, 0x16u);
      }
    }
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id v101 = v95;
    id v102 = [v101 countByEnumeratingWithState:&v122 objects:v132 count:16];
    if (v102)
    {
      id v103 = v102;
      v117 = v84;
      uint64_t v104 = *(void *)v123;
      while (2)
      {
        for (i = 0; i != v103; i = (char *)i + 1)
        {
          if (*(void *)v123 != v104) {
            objc_enumerationMutation(v101);
          }
          v106 = *(CKKSMirrorEntry **)(*((void *)&v122 + 1) + 8 * i);
          id v121 = 0;
          [(CKKSSQLDatabaseObject *)v106 deleteFromDatabase:&v121];
          id v107 = v121;
          if (v107)
          {
            v110 = v107;
            v111 = [(CKKSMirrorEntry *)v8 recordID];
            v112 = [v111 zoneID];
            v113 = [v112 zoneName];
            oslog = sub_1000CD884(@"ckks", v113);

            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              v114 = [(CKKSIncomingQueueEntry *)v117 uuid];
              *(_DWORD *)buf = 138412802;
              v135 = v106;
              __int16 v136 = 2112;
              v137 = v114;
              __int16 v138 = 2112;
              v139 = v110;
              _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Couldn't delete OQE sibling(%@) for %@: %@", buf, 0x20u);
            }
            v90 = 0;
            if (a6) {
              *a6 = v110;
            }

            BOOL v23 = 0;
            v84 = v117;
            goto LABEL_83;
          }
        }
        id v103 = [v101 countByEnumeratingWithState:&v122 objects:v132 count:16];
        if (v103) {
          continue;
        }
        break;
      }
      BOOL v23 = 1;
      v84 = v117;
    }
    else
    {
      BOOL v23 = 1;
    }
    v90 = 0;
LABEL_83:

    v108 = v118;
  }

LABEL_85:
  return v23;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  unsigned __int8 v24 = [CKKSItem alloc];
  objc_super v31 = [v3 objectForKeyedSubscript:@"UUID"];
  uint64_t v4 = [v31 asString];
  id v29 = [v3 objectForKeyedSubscript:@"parentKeyUUID"];
  unsigned __int8 v37 = [v29 asString];
  id v28 = [v3 objectForKeyedSubscript:@"contextID"];
  long long v36 = [v28 asString];
  id v5 = objc_alloc((Class)CKRecordZoneID);
  BOOL v27 = [v3 objectForKeyedSubscript:@"ckzone"];
  id v26 = [v27 asString];
  id v35 = [v5 initWithZoneName:x0 ownerName:x1];
  objc_super v25 = [v3 objectForKeyedSubscript:@"ckrecord"];
  CFStringRef v34 = [v25 asBase64DecodedData];
  BOOL v23 = [v3 objectForKeyedSubscript:@"encitem"];
  unsigned __int8 v33 = [v23 asBase64DecodedData];
  uint32_t v22 = [v3 objectForKeyedSubscript:@"wrappedkey"];
  id v21 = [v22 asString];
  id v30 = (void *)v4;
  if (v21)
  {
    BOOL v6 = [CKKSWrappedAESSIVKey alloc];
    id v19 = [v3 objectForKeyedSubscript:@"wrappedkey"];
    uint64_t v18 = [v19 asString];
    uint64_t v32 = -[CKKSWrappedAESSIVKey initWithBase64:](v6, "initWithBase64:");
  }
  else
  {
    uint64_t v32 = 0;
  }
  uint64_t v20 = [v3 objectForKeyedSubscript:@"gencount"];
  id v7 = [v20 asNSInteger];
  v8 = [v3 objectForKeyedSubscript:@"encver"];
  id v9 = [v8 asNSInteger];
  uint64_t v10 = [v3 objectForKeyedSubscript:@"pcss"];
  id v11 = [v10 asNSNumberInteger];
  uint64_t v12 = [v3 objectForKeyedSubscript:@"pcsk"];
  id v13 = [v12 asBase64DecodedData];
  uint64_t v14 = [v3 objectForKeyedSubscript:@"pcsi"];
  unsigned __int8 v15 = [v14 asBase64DecodedData];
  unsigned __int8 v16 = [(CKKSItem *)v24 initWithUUID:v30 parentKeyUUID:v37 contextID:v36 zoneID:v35 encodedCKRecord:v34 encItem:v33 wrappedkey:v32 generationCount:v7 encver:v9 plaintextPCSServiceIdentifier:v11 plaintextPCSPublicKey:v13 plaintextPCSPublicIdentity:v15];

  if (v21)
  {
  }

  return v16;
}

+ (id)sqlColumns
{
  return &off_100326CC8;
}

+ (void)setOSVersionInRecord:(id)a3
{
  id v3 = a3;
  -[OTDeviceInformationActualAdapter osVersion]_0();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKeyedSubscript:@"uploadver"];
}

@end