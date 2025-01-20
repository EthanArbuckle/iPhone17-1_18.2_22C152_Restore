@interface SecEscrowPendingRecord
+ (id)loadAllFromKeychain:(id *)a3;
+ (id)loadFromKeychain:(id)a3 error:(id *)a4;
- (BOOL)certCached;
- (BOOL)deleteFromKeychain:(id *)a3;
- (BOOL)escrowAttemptedWithinLastSeconds:(double)a3;
- (BOOL)hasAltDSID;
- (BOOL)hasCertCached;
- (BOOL)hasLastCloudServicesTriggerTime;
- (BOOL)hasLastEscrowAttemptTime;
- (BOOL)hasSerializedPrerecord;
- (BOOL)hasSerializedReason;
- (BOOL)hasTriggerRequestTime;
- (BOOL)hasUploadCompleted;
- (BOOL)hasUploadRetries;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)saveToKeychain:(id *)a3;
- (BOOL)uploadCompleted;
- (NSData)serializedPrerecord;
- (NSData)serializedReason;
- (NSString)altDSID;
- (NSString)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)lastCloudServicesTriggerTime;
- (unint64_t)lastEscrowAttemptTime;
- (unint64_t)triggerRequestTime;
- (unint64_t)uploadRetries;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setCertCached:(BOOL)a3;
- (void)setHasCertCached:(BOOL)a3;
- (void)setHasLastCloudServicesTriggerTime:(BOOL)a3;
- (void)setHasLastEscrowAttemptTime:(BOOL)a3;
- (void)setHasTriggerRequestTime:(BOOL)a3;
- (void)setHasUploadCompleted:(BOOL)a3;
- (void)setHasUploadRetries:(BOOL)a3;
- (void)setLastCloudServicesTriggerTime:(unint64_t)a3;
- (void)setLastEscrowAttemptTime:(unint64_t)a3;
- (void)setSerializedPrerecord:(id)a3;
- (void)setSerializedReason:(id)a3;
- (void)setTriggerRequestTime:(unint64_t)a3;
- (void)setUploadCompleted:(BOOL)a3;
- (void)setUploadRetries:(unint64_t)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SecEscrowPendingRecord

- (BOOL)deleteFromKeychain:(id *)a3
{
  v11[0] = kSecClass;
  v11[1] = kSecAttrAccessGroup;
  v12[0] = kSecClassInternetPassword;
  v12[1] = @"com.apple.sbd";
  v12[2] = @"escrow-prerecord";
  v11[2] = kSecAttrServer;
  v11[3] = kSecAttrAccount;
  v4 = [(SecEscrowPendingRecord *)self uuid];
  v12[3] = v4;
  v12[4] = &__kCFBooleanTrue;
  v11[4] = kSecUseDataProtectionKeychain;
  v11[5] = kSecAttrSynchronizable;
  v12[5] = &__kCFBooleanFalse;
  v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];
  CFDictionaryRef v6 = (const __CFDictionary *)[v5 mutableCopy];

  uint64_t v7 = SecItemDelete(v6);
  int v8 = v7;
  if (a3 && v7)
  {
    v9 = +[NSString stringWithFormat:@"SecItemAdd: %d", v7];
    *a3 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v8 description:v9];
  }
  return v8 == 0;
}

- (BOOL)saveToKeychain:(id *)a3
{
  v31[0] = kSecClass;
  v31[1] = kSecAttrAccessible;
  v32[0] = kSecClassInternetPassword;
  v32[1] = kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
  v31[2] = kSecAttrAccessGroup;
  v31[3] = kSecAttrServer;
  v32[2] = @"com.apple.sbd";
  v32[3] = @"escrow-prerecord";
  v31[4] = kSecAttrDescription;
  v4 = [(SecEscrowPendingRecord *)self uuid];
  v5 = +[NSString stringWithFormat:@"Escrow Prerecord: %@", v4];
  v32[4] = v5;
  v31[5] = kSecAttrAccount;
  CFDictionaryRef v6 = [(SecEscrowPendingRecord *)self uuid];
  v32[5] = v6;
  v31[6] = kSecValueData;
  uint64_t v7 = [(SecEscrowPendingRecord *)self data];
  v32[6] = v7;
  v32[7] = &__kCFBooleanTrue;
  v31[7] = kSecAttrIsInvisible;
  v31[8] = kSecUseDataProtectionKeychain;
  v31[9] = kSecAttrSynchronizable;
  v32[8] = &__kCFBooleanTrue;
  v32[9] = &__kCFBooleanFalse;
  int v8 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:10];
  CFDictionaryRef v9 = (const __CFDictionary *)[v8 mutableCopy];

  CFTypeRef result = 0;
  uint64_t v10 = SecItemAdd(v9, &result);
  if (v10)
  {
    if (v10 == -25299)
    {
      id v11 = objc_alloc_init((Class)NSMutableDictionary);
      v12 = [(__CFDictionary *)v9 objectForKeyedSubscript:kSecClass];
      [v11 setObject:v12 forKeyedSubscript:kSecClass];

      v13 = [(__CFDictionary *)v9 objectForKeyedSubscript:kSecAttrSynchronizable];
      [v11 setObject:v13 forKeyedSubscript:kSecAttrSynchronizable];

      v14 = [(__CFDictionary *)v9 objectForKeyedSubscript:kSecAttrSyncViewHint];
      [v11 setObject:v14 forKeyedSubscript:kSecAttrSyncViewHint];

      v15 = [(__CFDictionary *)v9 objectForKeyedSubscript:kSecAttrAccessGroup];
      [v11 setObject:v15 forKeyedSubscript:kSecAttrAccessGroup];

      v16 = [(__CFDictionary *)v9 objectForKeyedSubscript:kSecAttrAccount];
      [v11 setObject:v16 forKeyedSubscript:kSecAttrAccount];

      v17 = [(__CFDictionary *)v9 objectForKeyedSubscript:kSecAttrServer];
      [v11 setObject:v17 forKeyedSubscript:kSecAttrServer];

      v18 = [(__CFDictionary *)v9 objectForKeyedSubscript:kSecAttrPath];
      [v11 setObject:v18 forKeyedSubscript:kSecAttrPath];

      v19 = [(__CFDictionary *)v9 objectForKeyedSubscript:kSecUseDataProtectionKeychain];
      [v11 setObject:v19 forKeyedSubscript:kSecUseDataProtectionKeychain];

      id v20 = [(__CFDictionary *)v9 mutableCopy];
      [v20 setObject:0 forKeyedSubscript:kSecClass];
      uint64_t v21 = SecItemUpdate((CFDictionaryRef)v11, (CFDictionaryRef)v20);
      if (v21)
      {
        uint64_t v22 = (int)v21;
        v23 = +[NSString stringWithFormat:@"SecItemUpdate: %d", v21];
        id v24 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v22 description:v23];
      }
      else
      {
        id v24 = 0;
      }
      v27 = a3;
    }
    else
    {
      uint64_t v26 = (int)v10;
      id v11 = +[NSString stringWithFormat:@"SecItemAdd: %d", v10];
      id v24 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v26 description:v11];
      v27 = a3;
    }

    BOOL v25 = v24 == 0;
    if (v27 && v24)
    {
      id v24 = v24;
      BOOL v25 = 0;
      id *v27 = v24;
    }
  }
  else
  {
    id v24 = 0;
    BOOL v25 = 1;
  }

  return v25;
}

- (BOOL)escrowAttemptedWithinLastSeconds:(double)a3
{
  v4 = +[NSDate dateWithTimeIntervalSinceNow:-a3];
  [v4 timeIntervalSince1970];
  double v6 = v5;
  BOOL v7 = [(SecEscrowPendingRecord *)self hasLastEscrowAttemptTime]
    && [(SecEscrowPendingRecord *)self lastEscrowAttemptTime] >= (unint64_t)(v6 * 1000.0);

  return v7;
}

+ (id)loadAllFromKeychain:(id *)a3
{
  v32[0] = kSecClass;
  v32[1] = kSecAttrAccessGroup;
  v33[0] = kSecClassInternetPassword;
  v33[1] = @"com.apple.sbd";
  v32[2] = kSecAttrServer;
  v32[3] = kSecMatchLimit;
  v33[2] = @"escrow-prerecord";
  v33[3] = kSecMatchLimitAll;
  v32[4] = kSecAttrSynchronizable;
  v32[5] = kSecUseDataProtectionKeychain;
  v33[4] = &__kCFBooleanFalse;
  v33[5] = &__kCFBooleanTrue;
  v32[6] = kSecReturnAttributes;
  v32[7] = kSecReturnData;
  v33[6] = &__kCFBooleanTrue;
  v33[7] = &__kCFBooleanTrue;
  v4 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:8];
  CFDictionaryRef v5 = (const __CFDictionary *)[v4 mutableCopy];

  CFTypeRef result = 0;
  uint64_t v6 = SecItemCopyMatching(v5, &result);
  if (v6)
  {
    uint64_t v7 = v6;
    CFTypeRef v8 = result;
    if (result)
    {
      CFTypeRef result = 0;
      CFRelease(v8);
    }
    if (!a3)
    {
      id v11 = 0;
      goto LABEL_22;
    }
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    CFDictionaryRef v9 = +[NSString stringWithFormat:@"SecItemCopyMatching: %d", v7];
    v31 = v9;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    +[NSError errorWithDomain:NSOSStatusErrorDomain code:(int)v7 userInfo:v10];
    id v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = +[NSMutableArray array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v10 = (id)result;
    id v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v12)
    {
      id v13 = v12;
      CFDictionaryRef v22 = v5;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v17 = [SecEscrowPendingRecord alloc];
          v18 = [v16 objectForKeyedSubscript:kSecValueData];
          v19 = [(SecEscrowPendingRecord *)v17 initWithData:v18];

          if (v19)
          {
            [v11 addObject:v19];
          }
          else
          {
            id v20 = sub_10000B070("SecError");
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "escrowrequest: Unable to deserialize keychain item", buf, 2u);
            }
          }
        }
        id v13 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v13);
      CFDictionaryRef v9 = v10;
      CFDictionaryRef v5 = v22;
    }
    else
    {
      CFDictionaryRef v9 = v10;
    }
  }

LABEL_22:

  return v11;
}

+ (id)loadFromKeychain:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v18[0] = kSecClass;
  v18[1] = kSecAttrAccessGroup;
  v19[0] = kSecClassInternetPassword;
  v19[1] = @"com.apple.sbd";
  v18[2] = kSecAttrServer;
  v18[3] = kSecAttrAccount;
  v19[2] = @"escrow-prerecord";
  v19[3] = v5;
  v18[4] = kSecMatchLimit;
  v18[5] = kSecAttrSynchronizable;
  v19[4] = kSecMatchLimitOne;
  v19[5] = &__kCFBooleanFalse;
  v18[6] = kSecUseDataProtectionKeychain;
  v18[7] = kSecReturnAttributes;
  v19[6] = &__kCFBooleanTrue;
  v19[7] = &__kCFBooleanTrue;
  v18[8] = kSecReturnData;
  v19[8] = &__kCFBooleanTrue;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:9];
  CFDictionaryRef v7 = (const __CFDictionary *)[v6 mutableCopy];

  CFTypeRef result = 0;
  uint64_t v8 = SecItemCopyMatching(v7, &result);
  CFDictionaryRef v9 = (void *)result;
  if (!v8)
  {
    id v13 = [SecEscrowPendingRecord alloc];
    id v11 = [v9 objectForKeyedSubscript:kSecValueData];
    id v12 = [(SecEscrowPendingRecord *)v13 initWithData:v11];
    goto LABEL_7;
  }
  uint64_t v10 = v8;
  if (result)
  {
    CFTypeRef result = 0;
    CFRelease(v9);
  }
  if (a4)
  {
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    CFDictionaryRef v9 = +[NSString stringWithFormat:@"SecItemCopyMatching: %d", v10];
    v17 = v9;
    id v11 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    +[NSError errorWithDomain:NSOSStatusErrorDomain code:(int)v10 userInfo:v11];
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

    goto LABEL_9;
  }
  id v12 = 0;
LABEL_9:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_serializedReason, 0);
  objc_storeStrong((id *)&self->_serializedPrerecord, 0);

  objc_storeStrong((id *)&self->_altDSID, 0);
}

- (void)setSerializedReason:(id)a3
{
}

- (NSData)serializedReason
{
  return self->_serializedReason;
}

- (unint64_t)triggerRequestTime
{
  return self->_triggerRequestTime;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (unint64_t)uploadRetries
{
  return self->_uploadRetries;
}

- (BOOL)uploadCompleted
{
  return self->_uploadCompleted;
}

- (unint64_t)lastEscrowAttemptTime
{
  return self->_lastEscrowAttemptTime;
}

- (unint64_t)lastCloudServicesTriggerTime
{
  return self->_lastCloudServicesTriggerTime;
}

- (void)setSerializedPrerecord:(id)a3
{
}

- (NSData)serializedPrerecord
{
  return self->_serializedPrerecord;
}

- (BOOL)certCached
{
  return self->_certCached;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 8))
  {
    -[SecEscrowPendingRecord setUuid:](self, "setUuid:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 76) & 0x10) != 0)
  {
    self->_certCached = *((unsigned char *)v4 + 72);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 6))
  {
    -[SecEscrowPendingRecord setSerializedPrerecord:](self, "setSerializedPrerecord:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 76);
  if (v5)
  {
    self->_lastCloudServicesTriggerTime = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 76);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_lastEscrowAttemptTime = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 76);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  self->_uploadCompleted = *((unsigned char *)v4 + 73);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)v4 + 76) & 8) != 0)
  {
LABEL_11:
    self->_uploadRetries = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((void *)v4 + 5))
  {
    -[SecEscrowPendingRecord setAltDSID:](self, "setAltDSID:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
    self->_triggerRequestTime = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 7))
  {
    -[SecEscrowPendingRecord setSerializedReason:](self, "setSerializedReason:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuid hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v4 = 2654435761 * self->_certCached;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (unint64_t)[(NSData *)self->_serializedPrerecord hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v6 = 2654435761u * self->_lastCloudServicesTriggerTime;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_6:
      unint64_t v7 = 2654435761u * self->_lastEscrowAttemptTime;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v8 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
  }
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_uploadCompleted;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_uploadRetries;
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v9 = 0;
LABEL_13:
  NSUInteger v10 = [(NSString *)self->_altDSID hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    unint64_t v11 = 2654435761u * self->_triggerRequestTime;
  }
  else {
    unint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ (unint64_t)[(NSData *)self->_serializedReason hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:")) {
      goto LABEL_48;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 76);
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 0x10) == 0) {
      goto LABEL_48;
    }
    if (self->_certCached)
    {
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)v4 + 72))
    {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 0x10) != 0)
  {
    goto LABEL_48;
  }
  serializedPrerecord = self->_serializedPrerecord;
  if ((unint64_t)serializedPrerecord | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](serializedPrerecord, "isEqual:")) {
      goto LABEL_48;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 76);
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_lastCloudServicesTriggerTime != *((void *)v4 + 1)) {
      goto LABEL_48;
    }
  }
  else if (v7)
  {
    goto LABEL_48;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_lastEscrowAttemptTime != *((void *)v4 + 2)) {
      goto LABEL_48;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0) {
      goto LABEL_48;
    }
    if (self->_uploadCompleted)
    {
      if (!*((unsigned char *)v4 + 73)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)v4 + 73))
    {
      goto LABEL_48;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_uploadRetries != *((void *)v4 + 4)) {
      goto LABEL_48;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_48;
  }
  altDSID = self->_altDSID;
  if ((unint64_t)altDSID | *((void *)v4 + 5))
  {
    if (-[NSString isEqual:](altDSID, "isEqual:"))
    {
      char has = (char)self->_has;
      char v7 = *((unsigned char *)v4 + 76);
      goto LABEL_41;
    }
LABEL_48:
    unsigned __int8 v11 = 0;
    goto LABEL_49;
  }
LABEL_41:
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_triggerRequestTime != *((void *)v4 + 3)) {
      goto LABEL_48;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_48;
  }
  serializedReason = self->_serializedReason;
  if ((unint64_t)serializedReason | *((void *)v4 + 7)) {
    unsigned __int8 v11 = -[NSData isEqual:](serializedReason, "isEqual:");
  }
  else {
    unsigned __int8 v11 = 1;
  }
LABEL_49:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_uuid copyWithZone:a3];
  char v7 = (void *)v5[8];
  v5[8] = v6;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((unsigned char *)v5 + 72) = self->_certCached;
    *((unsigned char *)v5 + 76) |= 0x10u;
  }
  id v8 = [(NSData *)self->_serializedPrerecord copyWithZone:a3];
  unint64_t v9 = (void *)v5[6];
  v5[6] = v8;

  char has = (char)self->_has;
  if (has)
  {
    v5[1] = self->_lastCloudServicesTriggerTime;
    *((unsigned char *)v5 + 76) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v5[2] = self->_lastEscrowAttemptTime;
  *((unsigned char *)v5 + 76) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((unsigned char *)v5 + 73) = self->_uploadCompleted;
  *((unsigned char *)v5 + 76) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    v5[4] = self->_uploadRetries;
    *((unsigned char *)v5 + 76) |= 8u;
  }
LABEL_8:
  id v11 = [(NSString *)self->_altDSID copyWithZone:a3];
  id v12 = (void *)v5[5];
  v5[5] = v11;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[3] = self->_triggerRequestTime;
    *((unsigned char *)v5 + 76) |= 4u;
  }
  id v13 = [(NSData *)self->_serializedReason copyWithZone:a3];
  uint64_t v14 = (void *)v5[7];
  v5[7] = v13;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uuid)
  {
    [v4 setUuid:];
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((unsigned char *)v4 + 72) = self->_certCached;
    *((unsigned char *)v4 + 76) |= 0x10u;
  }
  if (self->_serializedPrerecord)
  {
    [v6 setSerializedPrerecord:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_lastCloudServicesTriggerTime;
    *((unsigned char *)v4 + 76) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 2) = self->_lastEscrowAttemptTime;
  *((unsigned char *)v4 + 76) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  *((unsigned char *)v4 + 73) = self->_uploadCompleted;
  *((unsigned char *)v4 + 76) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((void *)v4 + 4) = self->_uploadRetries;
    *((unsigned char *)v4 + 76) |= 8u;
  }
LABEL_12:
  if (self->_altDSID)
  {
    [v6 setAltDSID:];
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_triggerRequestTime;
    *((unsigned char *)v4 + 76) |= 4u;
  }
  if (self->_serializedReason)
  {
    [v6 setSerializedReason:];
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_serializedPrerecord)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_12:
  if (self->_altDSID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_serializedReason)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      BOOL v10 = v6++ >= 9;
      if (v10)
      {
        unint64_t v7 = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    switch((v7 >> 3))
    {
      case 1u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 64;
        goto LABEL_66;
      case 2u:
        char v16 = 0;
        unsigned int v17 = 0;
        uint64_t v18 = 0;
        *(unsigned char *)&self->_has |= 0x10u;
        while (2)
        {
          unint64_t v19 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v19 == -1 || v19 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v20 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v19);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
            v18 |= (unint64_t)(v20 & 0x7F) << v16;
            if (v20 < 0)
            {
              v16 += 7;
              BOOL v10 = v17++ >= 9;
              if (v10)
              {
                uint64_t v18 = 0;
                goto LABEL_70;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v18 = 0;
        }
LABEL_70:
        BOOL v44 = v18 != 0;
        uint64_t v45 = 72;
        goto LABEL_83;
      case 3u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 48;
        goto LABEL_66;
      case 4u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)&self->_has |= 1u;
        while (2)
        {
          unint64_t v24 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v24 == -1 || v24 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v25 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v24);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v24 + 1;
            v23 |= (unint64_t)(v25 & 0x7F) << v21;
            if (v25 < 0)
            {
              v21 += 7;
              BOOL v10 = v22++ >= 9;
              if (v10)
              {
                uint64_t v23 = 0;
                goto LABEL_74;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v23 = 0;
        }
LABEL_74:
        uint64_t v46 = 8;
        goto LABEL_92;
      case 5u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)&self->_has |= 2u;
        while (2)
        {
          unint64_t v28 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v28 == -1 || v28 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v28);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v28 + 1;
            v23 |= (unint64_t)(v29 & 0x7F) << v26;
            if (v29 < 0)
            {
              v26 += 7;
              BOOL v10 = v27++ >= 9;
              if (v10)
              {
                uint64_t v23 = 0;
                goto LABEL_78;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v23 = 0;
        }
LABEL_78:
        uint64_t v46 = 16;
        goto LABEL_92;
      case 6u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v32 = 0;
        *(unsigned char *)&self->_has |= 0x20u;
        while (2)
        {
          unint64_t v33 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v33 == -1 || v33 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v33);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v33 + 1;
            v32 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              BOOL v10 = v31++ >= 9;
              if (v10)
              {
                uint64_t v32 = 0;
                goto LABEL_82;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v32 = 0;
        }
LABEL_82:
        BOOL v44 = v32 != 0;
        uint64_t v45 = 73;
LABEL_83:
        self->PBCodable_opaque[v45] = v44;
        continue;
      case 7u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)&self->_has |= 8u;
        while (2)
        {
          unint64_t v37 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v37 == -1 || v37 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v37);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v37 + 1;
            v23 |= (unint64_t)(v38 & 0x7F) << v35;
            if (v38 < 0)
            {
              v35 += 7;
              BOOL v10 = v36++ >= 9;
              if (v10)
              {
                uint64_t v23 = 0;
                goto LABEL_87;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v23 = 0;
        }
LABEL_87:
        uint64_t v46 = 32;
        goto LABEL_92;
      case 8u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 40;
        goto LABEL_66;
      case 9u:
        char v39 = 0;
        unsigned int v40 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)&self->_has |= 4u;
        break;
      case 0xAu:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 56;
LABEL_66:
        v43 = *(void **)&self->PBCodable_opaque[v14];
        *(void *)&self->PBCodable_opaque[v14] = v13;

        continue;
      default:
        int v15 = PBReaderSkipValueWithTag();
        if (!v15) {
          return v15;
        }
        continue;
    }
    while (1)
    {
      unint64_t v41 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v41 == -1 || v41 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v42 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v41);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v41 + 1;
      v23 |= (unint64_t)(v42 & 0x7F) << v39;
      if ((v42 & 0x80) == 0) {
        goto LABEL_89;
      }
      v39 += 7;
      BOOL v10 = v40++ >= 9;
      if (v10)
      {
        uint64_t v23 = 0;
        goto LABEL_91;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_89:
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v23 = 0;
    }
LABEL_91:
    uint64_t v46 = 24;
LABEL_92:
    *(void *)&self->PBCodable_opaque[v46] = v23;
  }
  LOBYTE(v15) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v15;
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    unsigned int v6 = +[NSNumber numberWithBool:self->_certCached];
    [v4 setObject:v6 forKey:@"certCached"];
  }
  serializedPrerecord = self->_serializedPrerecord;
  if (serializedPrerecord) {
    [v4 setObject:serializedPrerecord forKey:@"serializedPrerecord"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v14 = +[NSNumber numberWithUnsignedLongLong:self->_lastCloudServicesTriggerTime];
    [v4 setObject:v14 forKey:@"lastCloudServicesTriggerTime"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  int v15 = +[NSNumber numberWithUnsignedLongLong:self->_lastEscrowAttemptTime];
  [v4 setObject:v15 forKey:@"lastEscrowAttemptTime"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  char v16 = +[NSNumber numberWithBool:self->_uploadCompleted];
  [v4 setObject:v16 forKey:@"uploadCompleted"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    char v9 = +[NSNumber numberWithUnsignedLongLong:self->_uploadRetries];
    [v4 setObject:v9 forKey:@"uploadRetries"];
  }
LABEL_12:
  altDSID = self->_altDSID;
  if (altDSID) {
    [v4 setObject:altDSID forKey:@"altDSID"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int v11 = +[NSNumber numberWithUnsignedLongLong:self->_triggerRequestTime];
    [v4 setObject:v11 forKey:@"triggerRequestTime"];
  }
  serializedReason = self->_serializedReason;
  if (serializedReason) {
    [v4 setObject:serializedReason forKey:@"serializedReason"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SecEscrowPendingRecord;
  NSUInteger v3 = [(SecEscrowPendingRecord *)&v7 description];
  id v4 = [(SecEscrowPendingRecord *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasSerializedReason
{
  return self->_serializedReason != 0;
}

- (BOOL)hasTriggerRequestTime
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasTriggerRequestTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setTriggerRequestTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_triggerRequestTime = a3;
}

- (BOOL)hasAltDSID
{
  return self->_altDSID != 0;
}

- (BOOL)hasUploadRetries
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasUploadRetries:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setUploadRetries:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uploadRetries = a3;
}

- (BOOL)hasUploadCompleted
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasUploadCompleted:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setUploadCompleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_uploadCompleted = a3;
}

- (BOOL)hasLastEscrowAttemptTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasLastEscrowAttemptTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setLastEscrowAttemptTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lastEscrowAttemptTime = a3;
}

- (BOOL)hasLastCloudServicesTriggerTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasLastCloudServicesTriggerTime:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setLastCloudServicesTriggerTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_lastCloudServicesTriggerTime = a3;
}

- (BOOL)hasSerializedPrerecord
{
  return self->_serializedPrerecord != 0;
}

- (BOOL)hasCertCached
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasCertCached:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setCertCached:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_certCached = a3;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

@end