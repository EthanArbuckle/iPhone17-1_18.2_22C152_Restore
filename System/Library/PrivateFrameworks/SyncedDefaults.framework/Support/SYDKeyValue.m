@interface SYDKeyValue
+ (BOOL)keyValueRecordHasAssetWithoutFile:(id)a3;
+ (id)keyFromKeyValueRecord:(id)a3;
+ (id)keyFromUnencryptedKeyValueRecordName:(id)a3;
+ (id)recordFieldKeyForValueModificationDateInStoreType:(int64_t)a3;
+ (id)recordNameForUnencryptedKey:(id)a3;
+ (void)deleteFilesForAssetsInKeyValueRecord:(id)a3;
- (BOOL)isNewKeyValue;
- (BOOL)setServerSystemFieldsRecordIfNewer:(id)a3;
- (CKRecord)serverSystemFieldsRecord;
- (CKRecordID)recordID;
- (NSData)serverSystemFieldsRecordData;
- (NSDate)valueModificationDate;
- (NSString)key;
- (NSString)recordName;
- (NSString)storeIdentifier;
- (SYDKeyValue)initWithKey:(id)a3 storeIdentifier:(id)a4;
- (_TtC13syncdefaultsd8SYDKeyID)keyID;
- (id)description;
- (id)recordRepresentationForStoreType:(int64_t)a3;
- (id)redactedDescription;
- (id)value;
- (void)markForDeletion;
- (void)mergeDataFromRecord:(id)a3;
- (void)setIsNewKeyValue:(BOOL)a3;
- (void)setKeyID:(id)a3;
- (void)setRecordName:(id)a3;
- (void)setServerSystemFieldsRecord:(id)a3;
- (void)setServerSystemFieldsRecordData:(id)a3;
- (void)setValue:(id)a3;
- (void)setValue:(id)a3 withModificationDate:(id)a4;
- (void)setValueModificationDate:(id)a3;
@end

@implementation SYDKeyValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_serverSystemFieldsRecordData, 0);
  objc_storeStrong((id *)&self->_valueModificationDate, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_keyID, 0);
}

- (_TtC13syncdefaultsd8SYDKeyID)keyID
{
  return self->_keyID;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3 withModificationDate:(id)a4
{
  id v6 = a4;
  [(SYDKeyValue *)self setValue:a3];
  [(SYDKeyValue *)self setValueModificationDate:v6];
}

- (void)setValueModificationDate:(id)a3
{
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_value != v4)
  {
    id v10 = v4;
    if (v4
      && (unsigned __int8 v6 = +[NSPropertyListSerialization propertyList:v4 isValidForFormat:200], v5 = v10, (v6 & 1) == 0))
    {
      v9 = (objc_class *)objc_opt_class();
      value = NSStringFromClass(v9);
      +[NSException raise:NSInvalidArgumentException, @"Tried to set invalid value '%@' of class '%@'", v10, value format];
    }
    else
    {
      id v7 = v5;
      value = self->_value;
      self->_value = v7;
    }
  }
  _objc_release_x1();
}

- (void)setServerSystemFieldsRecordData:(id)a3
{
}

- (void)setRecordName:(id)a3
{
}

- (SYDKeyValue)initWithKey:(id)a3 storeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SYDKeyValue;
  v8 = [(SYDKeyValue *)&v16 init];
  if (v8)
  {
    if (![v6 length]) {
      +[NSException raise:NSInternalInconsistencyException, @"Trying to init a keyValue without a key: %@", v6 format];
    }
    if (![v7 length]) {
      +[NSException raise:NSInternalInconsistencyException, @"Trying to init a keyValue without a store identifier: %@", v7 format];
    }
    v9 = [[_TtC13syncdefaultsd8SYDKeyID alloc] initWithKey:v6 storeIdentifier:v7];
    keyID = v8->_keyID;
    v8->_keyID = v9;

    v11 = v8->_keyID;
    if (!v11)
    {
      +[NSException raise:NSInternalInconsistencyException, @"Trying to init a keyValue without a keyID: %@", 0 format];
      v11 = v8->_keyID;
    }
    v12 = [(SYDKeyID *)v11 key];
    id v13 = [v12 length];

    if (!v13)
    {
      v14 = [(SYDKeyID *)v8->_keyID key];
      +[NSException raise:NSInternalInconsistencyException, @"Trying to init a keyValue without a keyID.key: %@", v14 format];
    }
  }

  return v8;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(SYDKeyValue *)self key];
  id v7 = [(SYDKeyValue *)self storeIdentifier];
  v8 = [(SYDKeyValue *)self recordName];
  if (v8) {
    CFStringRef v9 = @" recordName=";
  }
  else {
    CFStringRef v9 = &stru_100051D50;
  }
  uint64_t v10 = [(SYDKeyValue *)self recordName];
  v11 = (void *)v10;
  if (v10) {
    CFStringRef v12 = (const __CFString *)v10;
  }
  else {
    CFStringRef v12 = &stru_100051D50;
  }
  [v3 appendFormat:@"<%@: %p; key=%@ storeIdentifier=%@%@%@>", v5, self, v6, v7, v9, v12];

  return v3;
}

- (id)redactedDescription
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(SYDKeyValue *)self storeIdentifier];
  id v7 = [(SYDKeyValue *)self recordName];
  if (v7) {
    CFStringRef v8 = @" recordName=";
  }
  else {
    CFStringRef v8 = &stru_100051D50;
  }
  uint64_t v9 = [(SYDKeyValue *)self recordName];
  uint64_t v10 = (void *)v9;
  if (v9) {
    CFStringRef v11 = (const __CFString *)v9;
  }
  else {
    CFStringRef v11 = &stru_100051D50;
  }
  [v3 appendFormat:@"<%@: %p; storeIdentifier=%@%@%@>", v5, self, v6, v8, v11];

  return v3;
}

- (NSString)key
{
  v2 = [(SYDKeyValue *)self keyID];
  id v3 = [v2 key];

  return (NSString *)v3;
}

- (NSString)storeIdentifier
{
  v2 = [(SYDKeyValue *)self keyID];
  id v3 = [v2 storeIdentifier];

  return (NSString *)v3;
}

- (void)markForDeletion
{
  [(SYDKeyValue *)self setValue:0];
  id v3 = +[NSDate date];
  [(SYDKeyValue *)self setValueModificationDate:v3];
}

- (CKRecord)serverSystemFieldsRecord
{
  v2 = [(SYDKeyValue *)self serverSystemFieldsRecordData];
  if (v2)
  {
    id v8 = 0;
    id v3 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v2 error:&v8];
    id v4 = v8;
    id v5 = [objc_alloc((Class)CKRecord) initWithCoder:v3];
    if (v4)
    {
      id v6 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10002F798();
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return (CKRecord *)v5;
}

- (void)setServerSystemFieldsRecord:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v4 encodeSystemFieldsWithCoder:v5];
    id v6 = [v5 encodedData];
    if (v6)
    {
      [(SYDKeyValue *)self setServerSystemFieldsRecordData:v6];
    }
    else
    {
      id v7 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_10002F800(v4);
      }
    }
  }
  else
  {
    [(SYDKeyValue *)self setServerSystemFieldsRecordData:0];
  }
}

- (CKRecordID)recordID
{
  id v3 = [(SYDKeyValue *)self recordName];
  if (!v3) {
    +[NSException raise:NSInternalInconsistencyException, @"Trying to get a record ID for a keyValue that has not been assigned a record name yet: %@", self format];
  }
  id v4 = [(SYDKeyValue *)self storeIdentifier];
  id v5 = sub_100006A2C(v4);

  if (!v5) {
    +[NSException raise:NSInternalInconsistencyException, @"Trying to get a record ID for a keyValue that does not have an associated zoneID: %@", self format];
  }
  id v6 = [objc_alloc((Class)CKRecordID) initWithRecordName:v3 zoneID:v5];

  return (CKRecordID *)v6;
}

- (BOOL)setServerSystemFieldsRecordIfNewer:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v15 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Trying to set server record if newer, but no other record", (uint8_t *)&v24, 2u);
    }
    id v6 = 0;
    goto LABEL_11;
  }
  id v5 = [(SYDKeyValue *)self serverSystemFieldsRecord];
  id v6 = v5;
  if (!v5)
  {
    v14 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10002FA64(v4);
    }
    goto LABEL_19;
  }
  id v7 = [v5 modificationDate];

  if (!v7)
  {
    v14 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10002FB00(v4);
    }
    goto LABEL_19;
  }
  id v8 = [v6 recordID];
  uint64_t v9 = [v4 recordID];
  unsigned __int8 v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    v15 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v20 = [v6 recordID];
      v21 = objc_msgSend(v20, "syd_shortDescription");
      v22 = [v4 recordID];
      v23 = objc_msgSend(v22, "syd_shortDescription");
      int v24 = 138412546;
      v25 = v21;
      __int16 v26 = 2112;
      v27 = v23;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Trying to set server record using record with a different ID. current=%@ other=%@", (uint8_t *)&v24, 0x16u);
    }
LABEL_11:

    goto LABEL_12;
  }
  CFStringRef v11 = [v6 modificationDate];
  CFStringRef v12 = [v4 modificationDate];
  id v13 = [v11 compare:v12];

  if (v13 == (id)-1)
  {
    v14 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10002FB9C(v4);
    }
LABEL_19:

    v18 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_10002F968(v4, v6, v18);
    }

    [(SYDKeyValue *)self setServerSystemFieldsRecord:v4];
    BOOL v17 = 1;
    goto LABEL_22;
  }
LABEL_12:
  objc_super v16 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10002F884(v4, v6, v16);
  }

  BOOL v17 = 0;
LABEL_22:

  return v17;
}

- (void)mergeDataFromRecord:(id)a3
{
  id v4 = a3;
  id v5 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002FF98(self);
  }

  id v6 = [v4 recordType];
  unsigned int v7 = [v6 isEqualToString:@"KVSRecord"];

  if (v7)
  {
    uint64_t v8 = 0;
LABEL_7:
    CFStringRef v11 = [(SYDKeyValue *)self serverSystemFieldsRecord];
    CFStringRef v12 = v11;
    if (v11)
    {
      id v13 = [v11 recordType];
      v14 = [v4 recordType];
      unsigned __int8 v15 = [v13 isEqualToString:v14];

      if ((v15 & 1) == 0)
      {
        BOOL v17 = SYDGetCloudKitLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10002FE5C(v4, v12, v17);
        }
        goto LABEL_69;
      }
    }
    unsigned int v16 = [(SYDKeyValue *)self setServerSystemFieldsRecordIfNewer:v4];
    BOOL v17 = [(id)objc_opt_class() recordFieldKeyForValueModificationDateInStoreType:v8];
    v18 = [v4 objectForKeyedSubscript:v17];
    if (v7)
    {
      v19 = [v4 objectForKeyedSubscript:@"value"];
      CFStringRef v20 = @"assetValue";
    }
    else
    {
      v21 = [v4 encryptedValues];
      v19 = [v21 objectForKeyedSubscript:@"valueData"];

      CFStringRef v20 = @"valueDataAsset";
    }
    v22 = [v4 objectForKeyedSubscript:v20];
    if (v18)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_24:
        if (!v19 && v22)
        {
          __int16 v26 = [v22 fileURL];

          if (!v26)
          {
            v33 = [v22 assetContent];

            if (v33)
            {
              v19 = [v22 assetContent];
              if (v19) {
                goto LABEL_33;
              }
            }
            else
            {
              v34 = SYDGetCloudKitLog();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
                sub_10002FD70(v4);
              }
            }
            goto LABEL_43;
          }
          v27 = [v22 fileURL];
          id v44 = 0;
          v19 = +[NSData dataWithContentsOfURL:v27 options:0 error:&v44];
          id v28 = v44;

          if (v28)
          {
            v29 = SYDGetCloudKitLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              sub_10002FDF4();
            }
          }
        }
        if (v19)
        {
LABEL_33:
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_46;
          }
          v30 = SYDGetCloudKitLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = (objc_class *)objc_opt_class();
            v32 = NSStringFromClass(v31);
            *(_DWORD *)buf = 138412290;
            v46 = v32;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Record's value data was of the wrong class (%@). Expected NSData.", buf, 0xCu);
          }
LABEL_45:

          v19 = 0;
LABEL_46:
          if (!v18) {
            goto LABEL_68;
          }
          v35 = [(SYDKeyValue *)self valueModificationDate];
          v36 = v35;
          if (v35)
          {
            id v37 = [v35 compare:v18];
            if (v37)
            {
              if (v37 == (id)-1)
              {
                v38 = SYDGetCloudKitLog();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
                  sub_10002FD08();
                }
                goto LABEL_57;
              }
LABEL_67:

              goto LABEL_68;
            }
            if (!v16) {
              goto LABEL_67;
            }
            v38 = SYDGetCloudKitLog();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
              sub_10002FD3C();
            }
          }
          else
          {
            v38 = SYDGetCloudKitLog();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
              sub_10002FCD4();
            }
          }
LABEL_57:

          if (v19)
          {
            v39 = SYDGetCloudKitLog();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
              sub_10002FCA0();
            }

            id v43 = 0;
            v40 = +[NSPropertyListSerialization propertyListWithData:v19 options:0 format:0 error:&v43];
            id v41 = v43;
            v36 = v41;
            if (!v40 || v41)
            {
              v42 = SYDGetCloudKitLog();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                sub_10002FC38();
              }
            }
            else
            {
              [(SYDKeyValue *)self setValue:v40];
              [(SYDKeyValue *)self setValueModificationDate:v18];
            }

            goto LABEL_67;
          }
LABEL_68:

LABEL_69:
          goto LABEL_70;
        }
LABEL_43:
        v19 = SYDGetCloudKitLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "No value data in record", buf, 2u);
        }
        goto LABEL_45;
      }
      v23 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        int v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        *(_DWORD *)buf = 138412290;
        v46 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Record's modification date was of the wrong class (%@). Expected NSDate.", buf, 0xCu);
      }
    }
    else
    {
      v18 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "No modification date in record", buf, 2u);
      }
    }

    v18 = 0;
    goto LABEL_24;
  }
  uint64_t v9 = [v4 recordType];
  unsigned __int8 v10 = [v9 isEqualToString:@"EncryptedKeyValue"];

  if (v10)
  {
    uint64_t v8 = 1;
    goto LABEL_7;
  }
  CFStringRef v12 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10002FF14(v4);
  }
LABEL_70:
}

- (id)recordRepresentationForStoreType:(int64_t)a3
{
  id v5 = [(SYDKeyValue *)self serverSystemFieldsRecord];
  id v6 = v5;
  if ((unint64_t)a3 <= 3)
  {
    unsigned int v7 = off_100050C68[a3];
    if (v5) {
      goto LABEL_3;
    }
LABEL_8:
    id v12 = objc_alloc((Class)CKRecord);
    id v13 = [(SYDKeyValue *)self recordID];
    id v6 = [v12 initWithRecordType:v7 recordID:v13];

    goto LABEL_9;
  }
  unsigned int v7 = 0;
  if (!v5) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v8 = [v5 recordType];
  unsigned __int8 v9 = [v8 isEqualToString:v7];

  if (v9)
  {
LABEL_9:
    v14 = [(SYDKeyValue *)self value];
    id v32 = 0;
    unsigned __int8 v15 = +[NSPropertyListSerialization dataWithPropertyList:v14 format:200 options:0 error:&v32];
    unsigned __int8 v10 = v32;

    if (!v15 || v10)
    {
      unsigned int v16 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100030158();
      }
    }
    if ((unint64_t)[v15 length] <= 0x19000)
    {
      unint64_t v20 = 0;
    }
    else
    {
      BOOL v17 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_1000300A0(v6, v15, v17);
      }

      id v18 = objc_alloc((Class)CKAsset);
      v19 = [UTTypePropertyList identifier];
      unint64_t v20 = (unint64_t)[v18 initWithAssetContent:v15 itemTypeHint:v19];
    }
    if (v20) {
      v21 = 0;
    }
    else {
      v21 = v15;
    }
    unint64_t v22 = v21;
    if (!(v20 | v22))
    {
      v29 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        sub_10003001C(v6);
      }

      id v11 = 0;
      goto LABEL_36;
    }
    if ((unint64_t)(a3 - 1) >= 3)
    {
      if (a3) {
        goto LABEL_35;
      }
      [v6 setObject:v22 forKeyedSubscript:@"value"];
      [v6 setObject:v20 forKeyedSubscript:@"assetValue"];
      v30 = [(SYDKeyValue *)self valueModificationDate];

      if (!v30) {
        goto LABEL_35;
      }
      v27 = [(SYDKeyValue *)self valueModificationDate];
      [v6 setObject:v27 forKeyedSubscript:@"localModificationDate"];
    }
    else
    {
      v23 = [v6 encryptedValues];
      [v23 setObject:v22 forKeyedSubscript:@"valueData"];

      [v6 setObject:v20 forKeyedSubscript:@"valueDataAsset"];
      int v24 = [(SYDKeyValue *)self valueModificationDate];

      if (v24)
      {
        v25 = [(SYDKeyValue *)self valueModificationDate];
        [v6 setObject:v25 forKeyedSubscript:@"valueModificationDate"];
      }
      __int16 v26 = [(SYDKeyValue *)self key];

      if (!v26) {
        goto LABEL_35;
      }
      v27 = [(SYDKeyValue *)self key];
      id v28 = [v6 encryptedValues];
      [v28 setObject:v27 forKeyedSubscript:@"key"];
    }
LABEL_35:
    id v11 = v6;
LABEL_36:

    goto LABEL_37;
  }
  unsigned __int8 v10 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    sub_1000301C0((uint64_t)v7, v6, v10);
  }
  id v11 = 0;
LABEL_37:

  return v11;
}

+ (id)keyFromKeyValueRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordType];
  unsigned int v6 = [v5 isEqualToString:@"KVSRecord"];

  if (v6)
  {
    unsigned int v7 = [v4 recordID];
    uint64_t v8 = [v7 recordName];
    unsigned __int8 v9 = [a1 keyFromUnencryptedKeyValueRecordName:v8];

    goto LABEL_5;
  }
  unsigned __int8 v10 = [v4 recordType];
  unsigned int v11 = [v10 isEqualToString:@"EncryptedKeyValue"];

  if (v11)
  {
    unsigned int v7 = [v4 encryptedValues];
    unsigned __int8 v9 = [v7 objectForKeyedSubscript:@"key"];
LABEL_5:

    if (v9) {
      goto LABEL_9;
    }
  }
  id v12 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1000302A0(v4);
  }

  unsigned __int8 v9 = 0;
LABEL_9:

  return v9;
}

+ (id)keyFromUnencryptedKeyValueRecordName:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v3 options:0];

  id v5 = [objc_alloc((Class)NSString) initWithData:v4 encoding:4];
  return v5;
}

+ (id)recordNameForUnencryptedKey:(id)a3
{
  id v3 = [a3 dataUsingEncoding:4];
  id v4 = [v3 base64EncodedStringWithOptions:0];

  return v4;
}

+ (void)deleteFilesForAssetsInKeyValueRecord:(id)a3
{
  id v3 = a3;
  if (qword_10005BAF0 != -1) {
    dispatch_once(&qword_10005BAF0, &stru_100050C48);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = (id)qword_10005BAE8;
  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v24;
    *(void *)&long long v6 = 138412290;
    long long v21 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        unsigned int v11 = objc_msgSend(v3, "objectForKeyedSubscript:", v10, v21);
        id v12 = v11;
        if (v11)
        {
          id v13 = [v11 fileURL];

          if (v13)
          {
            v14 = SYDGetCloudKitLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              unint64_t v20 = [v3 recordID];
              *(_DWORD *)buf = 138412546;
              id v28 = v10;
              __int16 v29 = 2112;
              v30 = v20;
              _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Deleting file for asset (%@) in key value record %@", buf, 0x16u);
            }
            unsigned __int8 v15 = +[NSFileManager defaultManager];
            unsigned int v16 = [v12 fileURL];
            id v22 = 0;
            unsigned __int8 v17 = [v15 removeItemAtURL:v16 error:&v22];
            id v18 = v22;

            if ((v17 & 1) == 0)
            {
              v19 = SYDGetCloudKitLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v21;
                id v28 = v18;
                _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to delete asset file: %@", buf, 0xCu);
              }
            }
          }
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v7);
  }
}

+ (BOOL)keyValueRecordHasAssetWithoutFile:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"assetValue"];
  if (v4
    || ([v3 objectForKeyedSubscript:@"valueDataAsset"],
        (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = [v4 fileURL];
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)recordFieldKeyForValueModificationDateInStoreType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return @"localModificationDate";
  }
  else {
    return @"valueModificationDate";
  }
}

- (void)setKeyID:(id)a3
{
}

- (NSDate)valueModificationDate
{
  return self->_valueModificationDate;
}

- (NSData)serverSystemFieldsRecordData
{
  return self->_serverSystemFieldsRecordData;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (BOOL)isNewKeyValue
{
  return self->_isNewKeyValue;
}

- (void)setIsNewKeyValue:(BOOL)a3
{
  self->_isNewKeyValue = a3;
}

@end