@interface SEMFTSRecord
+ (id)encodedExternalIdString:(id)a3;
+ (id)genSQLCreateStatements;
+ (id)recordFromDatabaseValueRow:(id)a3;
+ (id)tableName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFTSRecord:(id)a3;
- (NSString)description;
- (NSString)fieldValue;
- (NSString)originAppId;
- (NSUUID)externalId;
- (SEMFTSRecord)init;
- (SEMFTSRecord)initWithDatabaseValueRow:(id)a3;
- (SEMFTSRecord)initWithFieldType:(unsigned __int16)a3 fieldValue:(id)a4 originAppId:(id)a5 externalId:(id)a6;
- (unint64_t)hash;
- (unsigned)fieldType;
@end

@implementation SEMFTSRecord

+ (id)recordFromDatabaseValueRow:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  v7 = objc_msgSend_initWithDatabaseValueRow_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

+ (id)tableName
{
  return @"item_fts";
}

+ (id)genSQLCreateStatements
{
  v14[1] = *MEMORY[0x263EF8340];
  v2 = NSString;
  id v3 = objc_opt_class();
  v7 = objc_msgSend_tableName(v3, v4, v5, v6);
  objc_msgSend_stringWithFormat_(v2, v8, @"CREATE VIRTUAL TABLE IF NOT EXISTS \"%@\" USING fts5(\"%@\", \"%@\", \"%@\", \"%@\");",
    v9,
    v7,
    0x2709E0BD0,
    0x2709E0BF0,
    0x2709E0C10,
  v10 = 0x2709E0C30);
  v14[0] = v10;
  v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v11, (uint64_t)v14, 1);

  return v12;
}

+ (id)encodedExternalIdString:(id)a3
{
  return (id)objc_msgSend_sem_base64EncodedStringNoPadding(a3, a2, (uint64_t)a3, v3);
}

- (SEMFTSRecord)initWithFieldType:(unsigned __int16)a3 fieldValue:(id)a4 originAppId:(id)a5 externalId:(id)a6
{
  uint64_t v8 = a3;
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v63.receiver = self;
  v63.super_class = (Class)SEMFTSRecord;
  v13 = [(SEMFTSRecord *)&v63 init];
  v16 = v13;
  if (!v13) {
    goto LABEL_6;
  }
  v13->_uint64_t fieldType = v8;
  if ((objc_msgSend_isValidFieldType_(MEMORY[0x263F50070], v14, v8, v15) & 1) == 0)
  {
    v36 = (void *)qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    v37 = (void *)MEMORY[0x263F50070];
    uint64_t fieldType = v16->_fieldType;
    v39 = v36;
    v42 = objc_msgSend_descriptionForTypeIdentifier_(v37, v40, fieldType, v41);
    *(_DWORD *)buf = 136315394;
    v65 = "-[SEMFTSRecord initWithFieldType:fieldValue:originAppId:externalId:]";
    __int16 v66 = 2112;
    v67 = v42;
    v43 = "%s Cannot create record with invalid fieldType: %@";
LABEL_13:
    v54 = v39;
    uint32_t v55 = 22;
LABEL_14:
    _os_log_error_impl(&dword_25C7CA000, v54, OS_LOG_TYPE_ERROR, v43, buf, v55);

    goto LABEL_16;
  }
  uint64_t v20 = objc_msgSend_copy(v10, v17, v18, v19);
  fieldValue = v16->_fieldValue;
  v16->_fieldValue = (NSString *)v20;

  if (!objc_msgSend_length(v16->_fieldValue, v22, v23, v24))
  {
    v44 = (void *)qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    v45 = (void *)MEMORY[0x263F50070];
    uint64_t v46 = v16->_fieldType;
    v39 = v44;
    v42 = objc_msgSend_descriptionForTypeIdentifier_(v45, v47, v46, v48);
    *(_DWORD *)buf = 136315394;
    v65 = "-[SEMFTSRecord initWithFieldType:fieldValue:originAppId:externalId:]";
    __int16 v66 = 2112;
    v67 = v42;
    v43 = "%s Cannot create record with nil / empty fieldValue. fieldType: %@";
    goto LABEL_13;
  }
  uint64_t v28 = objc_msgSend_copy(v11, v25, v26, v27);
  originAppId = v16->_originAppId;
  v16->_originAppId = (NSString *)v28;

  if (!v16->_originAppId)
  {
    v49 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      v50 = (void *)MEMORY[0x263F50070];
      uint64_t v51 = v16->_fieldType;
      v39 = v49;
      v42 = objc_msgSend_descriptionForTypeIdentifier_(v50, v52, v51, v53);
      *(_DWORD *)buf = 136315394;
      v65 = "-[SEMFTSRecord initWithFieldType:fieldValue:originAppId:externalId:]";
      __int16 v66 = 2112;
      v67 = v42;
      v43 = "%s Cannot create record with nil originAppId. fieldType: %@";
      goto LABEL_13;
    }
LABEL_16:
    v35 = 0;
    goto LABEL_17;
  }
  uint64_t v33 = objc_msgSend_copy(v12, v30, v31, v32);
  externalId = v16->_externalId;
  v16->_externalId = (NSUUID *)v33;

  if (!v16->_externalId)
  {
    v56 = (void *)qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    v58 = (void *)MEMORY[0x263F50070];
    uint64_t v59 = v16->_fieldType;
    v39 = v56;
    v42 = objc_msgSend_descriptionForTypeIdentifier_(v58, v60, v59, v61);
    v62 = v16->_originAppId;
    *(_DWORD *)buf = 136315650;
    v65 = "-[SEMFTSRecord initWithFieldType:fieldValue:originAppId:externalId:]";
    __int16 v66 = 2112;
    v67 = v42;
    __int16 v68 = 2112;
    v69 = v62;
    v43 = "%s Cannot create record with nil externalId. fieldType: %@, originApp: %@";
    v54 = v39;
    uint32_t v55 = 32;
    goto LABEL_14;
  }
LABEL_6:
  v35 = v16;
LABEL_17:

  return v35;
}

- (SEMFTSRecord)initWithDatabaseValueRow:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SEMFTSRecord;
  v7 = [(SEMFTSRecord *)&v29 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_stringValueAtColumnIndex_(v4, v5, 0, v6);
    originAppId = v7->_originAppId;
    v7->_originAppId = (NSString *)v8;

    id v10 = objc_alloc(MEMORY[0x263F08C38]);
    v13 = objc_msgSend_stringValueAtColumnIndex_(v4, v11, 1, v12);
    uint64_t v16 = objc_msgSend_sem_initWithBase64EncodedString_(v10, v14, (uint64_t)v13, v15);
    externalId = v7->_externalId;
    v7->_externalId = (NSUUID *)v16;

    uint64_t v20 = objc_msgSend_numberValueAtColumnIndex_(v4, v18, 2, v19);
    v7->_uint64_t fieldType = objc_msgSend_unsignedShortValue(v20, v21, v22, v23);

    uint64_t v26 = objc_msgSend_stringValueAtColumnIndex_(v4, v24, 3, v25);
    fieldValue = v7->_fieldValue;
    v7->_fieldValue = (NSString *)v26;
  }
  return v7;
}

- (SEMFTSRecord)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"You must use supported initializer", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSString)description
{
  v17.receiver = self;
  v17.super_class = (Class)SEMFTSRecord;
  uint64_t v3 = [(SEMFTSRecord *)&v17 description];
  uint64_t v6 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v4, self->_fieldType, v5);
  fieldValue = self->_fieldValue;
  originAppId = self->_originAppId;
  uint64_t v12 = objc_msgSend_UUIDString(self->_externalId, v9, v10, v11);
  uint64_t v15 = objc_msgSend_stringByAppendingFormat_(v3, v13, @" fieldType: %@ fieldValue: %@ originAppId: %@ externalId: %@", v14, v6, fieldValue, originAppId, v12);

  return (NSString *)v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SEMFTSRecord *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToFTSRecord = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToFTSRecord = objc_msgSend_isEqualToFTSRecord_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    char isEqualToFTSRecord = 0;
  }

  return isEqualToFTSRecord;
}

- (BOOL)isEqualToFTSRecord:(id)a3
{
  id v5 = a3;
  uint64_t v9 = v5;
  if (!v5 || (uint64_t fieldType = self->_fieldType, fieldType != objc_msgSend_fieldType(v5, v6, v7, v8)))
  {
    char isEqual = 0;
    goto LABEL_16;
  }
  fieldValue = self->_fieldValue;
  uint64_t v15 = fieldValue;
  if (!fieldValue)
  {
    uint64_t fieldType = objc_msgSend_fieldValue(v9, v11, v12, v13);
    if (!fieldType)
    {
      int v18 = 0;
      goto LABEL_11;
    }
    uint64_t v15 = self->_fieldValue;
  }
  uint64_t v3 = objc_msgSend_fieldValue(v9, v11, v12, v13);
  if (!objc_msgSend_isEqual_(v15, v16, (uint64_t)v3, v17))
  {
    char isEqual = 0;
    goto LABEL_13;
  }
  int v18 = 1;
LABEL_11:
  originAppId = self->_originAppId;
  v21 = objc_msgSend_originAppId(v9, v11, v12, v13);
  if (objc_msgSend_isEqual_(originAppId, v22, (uint64_t)v21, v23))
  {
    externalId = self->_externalId;
    uint64_t v28 = objc_msgSend_externalId(v9, v24, v25, v26);
    char isEqual = objc_msgSend_isEqual_(externalId, v29, (uint64_t)v28, v30);

    if ((v18 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  char isEqual = 0;
  if (v18) {
LABEL_13:
  }

LABEL_14:
  if (!fieldValue) {

  }
LABEL_16:
  return isEqual;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_numberWithUnsignedShort_(NSNumber, a2, self->_fieldType, v2);
  uint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_hash(self->_fieldValue, v9, v10, v11);
  uint64_t v16 = v12 ^ objc_msgSend_hash(self->_originAppId, v13, v14, v15);
  unint64_t v20 = v16 ^ objc_msgSend_hash(self->_externalId, v17, v18, v19) ^ v8;

  return v20;
}

- (unsigned)fieldType
{
  return self->_fieldType;
}

- (NSString)fieldValue
{
  return self->_fieldValue;
}

- (NSString)originAppId
{
  return self->_originAppId;
}

- (NSUUID)externalId
{
  return self->_externalId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalId, 0);
  objc_storeStrong((id *)&self->_originAppId, 0);
  objc_storeStrong((id *)&self->_fieldValue, 0);
}

@end