@interface FCFaultableRecord
+ (FCFaultableRecord)faultableRecordWithRecord:(uint64_t)a1;
+ (id)readValueFromKeyValuePair:(id)a3;
+ (int)keyValuePairType;
- (FCFaultableRecord)init;
- (id)record;
- (id)recordBase;
- (void)writeToKeyValuePair:(id)a3;
- (void)writeValueToDataWriter:(id)a3;
@end

@implementation FCFaultableRecord

+ (id)readValueFromKeyValuePair:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [a3 recordData];
  id v4 = v3;
  self;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "recordData != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "+[FCFaultableRecord faultableRecordWithRecordData:]";
    __int16 v11 = 2080;
    v12 = "FCFaultableRecord.m";
    __int16 v13 = 1024;
    int v14 = 47;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = objc_alloc_init(FCFaultableRecord);
  v6 = v5;
  if (v5) {
    objc_storeStrong((id *)&v5->_recordData, v3);
  }

  return v6;
}

- (FCFaultableRecord)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCFaultableRecord;
  result = [(FCFaultableRecord *)&v3 init];
  if (result) {
    result->_recordLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (id)record
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    id v3 = *(id *)(a1 + 16);
    id v4 = *(id *)(a1 + 32);
    os_unfair_lock_unlock(v2);
    if (v3) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v4 == 0;
    }
    if (v5) {
      goto LABEL_20;
    }
    v6 = -[FCFaultableRecord recordBase](a1);
    int v7 = [v6 recordType];

    switch(v7)
    {
      case 0:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          __int16 v15 = (void *)[[NSString alloc] initWithFormat:@"unknown type in faultable record"];
          int v16 = 136315906;
          uint64_t v17 = "-[FCFaultableRecord record]";
          __int16 v18 = 2080;
          v19 = "FCFaultableRecord.m";
          __int16 v20 = 1024;
          int v21 = 129;
          __int16 v22 = 2114;
          v23 = v15;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v16, 0x26u);
        }
        goto LABEL_9;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
        v8 = (objc_class *)objc_opt_class();
        break;
      default:
LABEL_9:
        v8 = 0;
        break;
    }
    uint64_t v9 = [[v8 alloc] initWithData:v4];
    v10 = (void *)v9;
    if (v8)
    {
      if (!v9)
      {
        __int16 v11 = FCRecordSourceLog;
        if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v16) = 0;
          v12 = "failed to decode record from faultable record";
LABEL_25:
          _os_log_fault_impl(&dword_1A460D000, v11, OS_LOG_TYPE_FAULT, v12, (uint8_t *)&v16, 2u);
        }
      }
    }
    else
    {
      __int16 v11 = FCRecordSourceLog;
      if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v16) = 0;
        v12 = "failed to find record class for faultable record";
        goto LABEL_25;
      }
    }
    os_unfair_lock_lock_with_options();
    __int16 v13 = *(void **)(a1 + 16);
    if (v13)
    {
      id v3 = v13;
    }
    else
    {
      id v3 = v10;
      v10 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v3;
    }

    os_unfair_lock_unlock(v2);
LABEL_20:

    goto LABEL_21;
  }
  id v3 = 0;
LABEL_21:
  return v3;
}

- (id)recordBase
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    id v4 = *(void **)(a1 + 24);
    id v3 = (id *)(a1 + 24);
    id v5 = v4;
    id v6 = v3[1];
    id v7 = *(v3 - 1);
    os_unfair_lock_unlock(v2);
    if (!v5)
    {
      if (v7) {
        [v7 base];
      }
      else {
        NTPBReadBaseFromRecordData();
      }
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock_with_options();
      if (*v3)
      {
        id v8 = *v3;

        os_unfair_lock_unlock(v2);
        id v5 = v8;
      }
      else
      {
        objc_storeStrong(v3, v5);
        os_unfair_lock_unlock(v2);
        if (!v5)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            __int16 v13 = (void *)[[NSString alloc] initWithFormat:@"faultable record failed to load base"];
            int v14 = 136315906;
            __int16 v15 = "-[FCFaultableRecord recordBase]";
            __int16 v16 = 2080;
            uint64_t v17 = "FCFaultableRecord.m";
            __int16 v18 = 1024;
            int v19 = 103;
            __int16 v20 = 2114;
            int v21 = v13;
            _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingRecordBase) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);
          }
          id v5 = 0;
          goto LABEL_12;
        }
      }
    }
    uint64_t v9 = [v5 identifier];

    if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      v12 = (void *)[[NSString alloc] initWithFormat:@"faultable record loaded base without an identifier"];
      int v14 = 136315906;
      __int16 v15 = "-[FCFaultableRecord recordBase]";
      __int16 v16 = 2080;
      uint64_t v17 = "FCFaultableRecord.m";
      __int16 v18 = 1024;
      int v19 = 104;
      __int16 v20 = 2114;
      int v21 = v12;
      _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: CorruptRecordBase) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);
    }
LABEL_12:
    id v10 = v5;

    goto LABEL_13;
  }
  id v10 = 0;
LABEL_13:
  return v10;
}

+ (int)keyValuePairType
{
  return 5;
}

+ (FCFaultableRecord)faultableRecordWithRecord:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  self;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "record != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v9 = "+[FCFaultableRecord faultableRecordWithRecord:]";
    __int16 v10 = 2080;
    __int16 v11 = "FCFaultableRecord.m";
    __int16 v12 = 1024;
    int v13 = 38;
    __int16 v14 = 2114;
    __int16 v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v4 = objc_alloc_init(FCFaultableRecord);
  id v5 = v4;
  if (v4) {
    objc_storeStrong((id *)&v4->_record, a2);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordData, 0);
  objc_storeStrong((id *)&self->_recordBase, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

- (void)writeToKeyValuePair:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v3 = (void *)[[NSString alloc] initWithFormat:@"-writeValueToDataWriter should have been used instead"];
    int v4 = 136315906;
    id v5 = "-[FCFaultableRecord writeToKeyValuePair:]";
    __int16 v6 = 2080;
    id v7 = "FCFaultableRecord.m";
    __int16 v8 = 1024;
    int v9 = 266;
    __int16 v10 = 2114;
    __int16 v11 = v3;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v4, 0x26u);
  }
}

- (void)writeValueToDataWriter:(id)a3
{
  p_recordLock = &self->_recordLock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  recordData = self->_recordData;
  id v7 = self->_record;
  __int16 v8 = recordData;
  os_unfair_lock_unlock(p_recordLock);
  if (v8) {
    PBDataWriterWriteDataField();
  }
  else {
    PBDataWriterWriteSubmessage();
  }
}

@end