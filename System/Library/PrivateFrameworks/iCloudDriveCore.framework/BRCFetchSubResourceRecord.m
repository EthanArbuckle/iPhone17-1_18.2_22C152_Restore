@interface BRCFetchSubResourceRecord
- (BOOL)isWaitingOnShareIDFetch;
- (BRCFetchSubResourceRecord)initWithChangedRecord:(id)a3 recordIDNeedingFetch:(id)a4 xattrSignatureNeedingFetch:(id)a5 recordIDBlockingSave:(id)a6;
- (BRCFetchSubResourceRecord)initWithRecordIDNeedingFetch:(id)a3 recordType:(int64_t)a4;
- (CKRecord)record;
- (CKRecordID)recordID;
- (CKRecordID)recordIDBlockingSave;
- (CKRecordID)recordIDNeedingFetch;
- (NSData)xattrSignature;
- (id)description;
- (int64_t)recordType;
- (int64_t)resolveRecordType;
- (void)resolveRecordType;
- (void)setRecordIDBlockingSave:(id)a3;
- (void)setRecordIDNeedingFetch:(id)a3;
- (void)setXattrSignature:(id)a3;
@end

@implementation BRCFetchSubResourceRecord

- (BRCFetchSubResourceRecord)initWithChangedRecord:(id)a3 recordIDNeedingFetch:(id)a4 xattrSignatureNeedingFetch:(id)a5 recordIDBlockingSave:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BRCFetchSubResourceRecord;
  v15 = [(BRCFetchSubResourceRecord *)&v19 init];
  if (v15)
  {
    uint64_t v16 = [v11 recordID];
    recordID = v15->_recordID;
    v15->_recordID = (CKRecordID *)v16;

    objc_storeStrong((id *)&v15->_record, a3);
    v15->_recordType = [(BRCFetchSubResourceRecord *)v15 resolveRecordType];
    objc_storeStrong((id *)&v15->_recordIDNeedingFetch, a4);
    objc_storeStrong((id *)&v15->_xattrSignature, a5);
    objc_storeStrong((id *)&v15->_recordIDBlockingSave, a6);
  }

  return v15;
}

- (BRCFetchSubResourceRecord)initWithRecordIDNeedingFetch:(id)a3 recordType:(int64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCFetchSubResourceRecord;
  v8 = [(BRCFetchSubResourceRecord *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recordIDNeedingFetch, a3);
    objc_storeStrong((id *)&v9->_recordID, a3);
    if (!a4) {
      a4 = [(BRCFetchSubResourceRecord *)v9 resolveRecordType];
    }
    v9->_recordType = a4;
    v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCFetchSubResourceRecord initWithRecordIDNeedingFetch:recordType:](&v9->_recordID);
    }
  }
  return v9;
}

- (int64_t)resolveRecordType
{
  v3 = [(CKRecordID *)self->_recordID recordName];
  if ([v3 hasPrefix:@"documentContent/"])
  {
    int64_t v4 = 2;
  }
  else if (([v3 hasPrefix:@"documentStructure/"] & 1) != 0 {
         || ([v3 hasPrefix:@"directory/"] & 1) != 0)
  }
  {
    int64_t v4 = 1;
  }
  else
  {
    v5 = [(CKRecord *)self->_record recordType];
    char v6 = [v5 isEqualToString:*MEMORY[0x263EFD510]];

    if ((v6 & 1) == 0)
    {
      id v7 = brc_bread_crumbs();
      v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BRCFetchSubResourceRecord resolveRecordType]();
      }
    }
    int64_t v4 = 3;
  }

  return v4;
}

- (BOOL)isWaitingOnShareIDFetch
{
  recordIDNeedingFetch = self->_recordIDNeedingFetch;
  if (recordIDNeedingFetch) {
    LOBYTE(recordIDNeedingFetch) = [(CKRecordID *)recordIDNeedingFetch isEqual:self->_recordID] ^ 1;
  }
  return (char)recordIDNeedingFetch;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = "Y";
  if (!self->_record) {
    v5 = "N";
  }
  return (id)[v3 stringWithFormat:@"<%@ id:%@ hr:%s xattr:%@ rtf:%@ bs:%@ type:%ld>", v4, self->_recordID, v5, self->_xattrSignature, self->_recordIDNeedingFetch, self->_recordIDBlockingSave, self->_recordType];
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (CKRecord)record
{
  return self->_record;
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (NSData)xattrSignature
{
  return self->_xattrSignature;
}

- (void)setXattrSignature:(id)a3
{
}

- (CKRecordID)recordIDNeedingFetch
{
  return self->_recordIDNeedingFetch;
}

- (void)setRecordIDNeedingFetch:(id)a3
{
}

- (CKRecordID)recordIDBlockingSave
{
  return self->_recordIDBlockingSave;
}

- (void)setRecordIDBlockingSave:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDBlockingSave, 0);
  objc_storeStrong((id *)&self->_recordIDNeedingFetch, 0);
  objc_storeStrong((id *)&self->_xattrSignature, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

- (void)initWithRecordIDNeedingFetch:(void *)a1 recordType:.cold.1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] initWithRecordIDNeedingFetch: %@%@", (void)v3, DWORD2(v3));
}

- (void)resolveRecordType
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Unsuported record type %@%@");
}

@end