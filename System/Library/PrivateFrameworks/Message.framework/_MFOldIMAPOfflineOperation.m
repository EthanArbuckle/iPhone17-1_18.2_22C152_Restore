@interface _MFOldIMAPOfflineOperation
+ (id)_createStringFromData:(id)a3 cursor:(unint64_t *)a4;
+ (id)deserializedCopyFromData:(id)a3 cursor:(unint64_t *)a4;
- (NSString)mailboxName;
- (int64_t)operationType;
- (void)setMailboxName:(id)a3;
- (void)setOperationType:(int64_t)a3;
@end

@implementation _MFOldIMAPOfflineOperation

+ (id)deserializedCopyFromData:(id)a3 cursor:(unint64_t *)a4
{
  id v6 = a3;
  unsigned __int8 v13 = 0;
  unsigned __int8 v12 = -86;
  objc_msgSend(v6, "getBytes:range:", &v13, (*a4)++, 1);
  objc_msgSend(v6, "getBytes:range:", &v12);
  ++*a4;
  if (v13)
  {
    p_super = EDLibraryLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      +[_MFOldIMAPOfflineOperation deserializedCopyFromData:cursor:](&v13, p_super);
    }
    goto LABEL_10;
  }
  uint64_t v8 = v12 & 7;
  if ((unint64_t)(v8 - 1) > 1)
  {
    p_super = EDLibraryLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      +[_MFOldIMAPOfflineOperation deserializedCopyFromData:cursor:](&v12, (uint64_t *)a4, p_super);
    }
    goto LABEL_10;
  }
  v9 = objc_alloc_init(_MFOldIMAPOfflineOperation);
  [(_MFOldIMAPOfflineOperation *)v9 setOperationType:v8];
  if (v9)
  {
    p_super = [a1 _createStringFromData:v6 cursor:a4];
    if (p_super)
    {
      [(_MFOldIMAPOfflineOperation *)v9 setMailboxName:p_super];
LABEL_11:

      goto LABEL_12;
    }
    v11 = EDLibraryLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[_MFOldIMAPOfflineOperation deserializedCopyFromData:cursor:](v11);
    }

    p_super = &v9->super;
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v9;
}

+ (id)_createStringFromData:(id)a3 cursor:(unint64_t *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 bytes];
  unint64_t v7 = *a4;
  id v8 = v5;
  uint64_t v9 = [v8 bytes];
  unint64_t v10 = v6 + v7;
  unint64_t v11 = v9 + [v8 length];
  if (v10 >= v11)
  {
LABEL_5:
    unint64_t v13 = [v8 length];
    v14 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    while (*(unsigned char *)(v10 + v12))
    {
      ++v12;
      if (v10 + v12 >= v11) {
        goto LABEL_5;
      }
    }
    if (v10 + v12 <= v10) {
      v14 = 0;
    }
    else {
      v14 = (void *)[[NSString alloc] initWithUTF8String:v10];
    }
    unint64_t v13 = *a4 + v12 + 1;
  }
  *a4 = v13;

  return v14;
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(int64_t)a3
{
  self->_operationType = a3;
}

- (NSString)mailboxName
{
  return self->_mailboxName;
}

- (void)setMailboxName:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)deserializedCopyFromData:(os_log_t)log cursor:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Couldn't deserialize mailboxName while unarchiving offline cache operation", v1, 2u);
}

+ (void)deserializedCopyFromData:(os_log_t)log cursor:.cold.2(unsigned __int8 *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  uint64_t v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 2048;
  uint64_t v7 = v4;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Unexpected operationType while unarchiving offline cache %u at position %lu", (uint8_t *)v5, 0x12u);
}

+ (void)deserializedCopyFromData:(unsigned __int8 *)a1 cursor:(NSObject *)a2 .cold.3(unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Unexpected type while unarchiving offline cache operation: %d", (uint8_t *)v3, 8u);
}

@end