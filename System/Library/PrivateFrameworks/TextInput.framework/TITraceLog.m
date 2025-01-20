@interface TITraceLog
- (NSMutableDictionary)recordEntryCache;
- (NSString)logContents;
- (TITraceLog)initWithLogContents:(id)a3;
- (id)recordStringMatchingTypologyRecord:(id)a3;
- (id)recordStringMatchingUUID:(id)a3;
- (void)enumerateRecordsWithBlock:(id)a3;
- (void)enumerateTextRecordEntriesUsingBlock:(id)a3;
- (void)setRecordEntryCache:(id)a3;
@end

@implementation TITraceLog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logContents, 0);

  objc_storeStrong((id *)&self->_recordEntryCache, 0);
}

- (NSString)logContents
{
  return self->_logContents;
}

- (void)setRecordEntryCache:(id)a3
{
}

- (void)enumerateTextRecordEntriesUsingBlock:(id)a3
{
  v4 = (char *)a3;
  id v5 = objc_alloc(MEMORY[0x1E4F28FE8]);
  v6 = [(TITraceLog *)self logContents];
  v7 = (void *)[v5 initWithString:v6];

  char v20 = 0;
  id v19 = 0;
  [v7 scanString:@"RECORD ID: " intoString:&v19];
  id v8 = v19;
  if (([v7 isAtEnd] & 1) == 0)
  {
    id v9 = 0;
    v17 = v4 + 16;
    do
    {
      v10 = v9;
      id v22 = 0;
      id v11 = v7;
      [v11 scanUpToString:@"\n" intoString:&v22];
      id v12 = v22;
      id v13 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];
      id v21 = v12;
      [v11 scanUpToString:@"RECORD ID: " intoString:&v21];

      id v14 = v21;
      id v15 = (id)[v14 copy];

      id v16 = v15;
      id v9 = v13;

      if (v16 && v9) {
        (*((void (**)(char *, id, id, char *))v4 + 2))(v4, v16, v9, &v20);
      }
      id v18 = v16;
      objc_msgSend(v11, "scanString:intoString:", @"RECORD ID: ", &v18, v17);
      id v8 = v18;
    }
    while (([v11 isAtEnd] & 1) == 0 && !v20);
  }
}

- (NSMutableDictionary)recordEntryCache
{
  p_recordEntryCache = &self->_recordEntryCache;
  recordEntryCache = self->_recordEntryCache;
  if (!recordEntryCache)
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__2893;
    id v11 = __Block_byref_object_dispose__2894;
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __30__TITraceLog_recordEntryCache__block_invoke;
    v6[3] = &unk_1E5558DA0;
    v6[4] = &v7;
    [(TITraceLog *)self enumerateTextRecordEntriesUsingBlock:v6];
    objc_storeStrong((id *)p_recordEntryCache, (id)v8[5]);
    _Block_object_dispose(&v7, 8);

    recordEntryCache = self->_recordEntryCache;
  }

  return recordEntryCache;
}

uint64_t __30__TITraceLog_recordEntryCache__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:a2 forKey:a3];
}

- (void)enumerateRecordsWithBlock:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__TITraceLog_enumerateRecordsWithBlock___block_invoke;
  v6[3] = &unk_1E5558D78;
  id v7 = v4;
  id v8 = v9;
  id v5 = v4;
  [(TITraceLog *)self enumerateTextRecordEntriesUsingBlock:v6];

  _Block_object_dispose(v9, 8);
}

uint64_t __40__TITraceLog_enumerateRecordsWithBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (id)recordStringMatchingTypologyRecord:(id)a3
{
  id v4 = [a3 recordID];
  id v5 = [(TITraceLog *)self recordStringMatchingUUID:v4];

  return v5;
}

- (id)recordStringMatchingUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(TITraceLog *)self recordEntryCache];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (TITraceLog)initWithLogContents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TITraceLog;
  id v5 = [(TITraceLog *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    logContents = v5->_logContents;
    v5->_logContents = (NSString *)v6;
  }
  return v5;
}

@end