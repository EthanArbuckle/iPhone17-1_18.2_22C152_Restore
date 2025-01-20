@interface FCUserEventHistorySession
+ (id)dateFromSessionID:(id)a3;
- (FCUserEventHistorySession)initWithSessionID:(id)a3 path:(id)a4;
- (NSData)data;
- (NSDate)date;
- (NSNumber)sizeNumber;
- (NSString)fileName;
- (NSString)identifier;
- (NSString)path;
- (id)compressedData;
- (id)description;
- (int64_t)size;
- (void)setDate:(id)a3;
- (void)setFileName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPath:(id)a3;
- (void)setSizeNumber:(id)a3;
@end

@implementation FCUserEventHistorySession

+ (id)dateFromSessionID:(id)a3
{
  id v3 = a3;
  v4 = [v3 componentsSeparatedByString:@"-"];
  if ([v4 count] == 6)
  {
    v5 = (void *)MEMORY[0x1E4F1C9C8];
    v6 = [v4 firstObject];
    [v6 doubleValue];
    v7 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__FCUserEventHistorySession_dateFromSessionID___block_invoke;
    v9[3] = &unk_1E5B4C840;
    id v10 = v3;
    v7 = __47__FCUserEventHistorySession_dateFromSessionID___block_invoke((uint64_t)v9);
  }
  return v7;
}

uint64_t __47__FCUserEventHistorySession_dateFromSessionID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    id v3 = (void *)[[NSString alloc] initWithFormat:@"Attempted to create a session with an invalid ID %@", *(void *)(a1 + 32)];
    *(_DWORD *)buf = 136315906;
    v5 = "+[FCUserEventHistorySession dateFromSessionID:]_block_invoke";
    __int16 v6 = 2080;
    v7 = "FCUserEventHistorySession.m";
    __int16 v8 = 1024;
    int v9 = 29;
    __int16 v10 = 2114;
    v11 = v3;
    _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: InvalidUserEventHistorySessionID) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return 0;
}

- (FCUserEventHistorySession)initWithSessionID:(id)a3 path:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCUserEventHistorySession;
  __int16 v8 = [(FCUserEventHistorySession *)&v12 init];
  if (v8)
  {
    uint64_t v9 = +[FCUserEventHistorySession dateFromSessionID:v6];
    if (v9)
    {
      __int16 v10 = (void *)v9;
      [(FCUserEventHistorySession *)v8 setFileName:v6];
      [(FCUserEventHistorySession *)v8 setIdentifier:v6];
      [(FCUserEventHistorySession *)v8 setDate:v10];
      [(FCUserEventHistorySession *)v8 setPath:v7];
    }
    else
    {
      __int16 v10 = v8;
      __int16 v8 = 0;
    }
  }
  return v8;
}

- (int64_t)size
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(FCUserEventHistorySession *)self sizeNumber];

  if (v3)
  {
    v4 = [(FCUserEventHistorySession *)self sizeNumber];
    int64_t v5 = [v4 integerValue];

    return v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    __int16 v8 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v9 = [(FCUserEventHistorySession *)self path];
    __int16 v10 = [v8 fileURLWithPath:v9];
    id v17 = 0;
    int64_t v11 = objc_msgSend(v7, "fc_sizeOfItemAtURL:error:", v10, &v17);
    id v12 = v17;

    if (v12)
    {
      v13 = (void *)FCUserEventsLog;
      if (os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_ERROR))
      {
        v15 = v13;
        v16 = [(FCUserEventHistorySession *)self path];
        *(_DWORD *)buf = 138543362;
        v19 = v16;
        _os_log_error_impl(&dword_1A460D000, v15, OS_LOG_TYPE_ERROR, "Error getting size of sessions at %{public}@", buf, 0xCu);
      }
      int64_t v11 = -1;
    }
    else
    {
      v14 = [NSNumber numberWithInteger:v11];
      [(FCUserEventHistorySession *)self setSizeNumber:v14];
    }
    return v11;
  }
}

- (NSData)data
{
  id v3 = [(FCUserEventHistorySession *)self compressedData];
  id v10 = 0;
  v4 = [v3 decompressedDataUsingAlgorithm:0 error:&v10];
  id v5 = v10;

  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __33__FCUserEventHistorySession_data__block_invoke;
    v9[3] = &unk_1E5B4C840;
    void v9[4] = self;
    __33__FCUserEventHistorySession_data__block_invoke((uint64_t)v9);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v4;
  }
  id v7 = v6;

  return (NSData *)v7;
}

uint64_t __33__FCUserEventHistorySession_data__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCUserEventsLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    id v5 = v2;
    id v6 = [v4 identifier];
    int v7 = 138543362;
    __int16 v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Error decompressing compressed data for session %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (id)compressedData
{
  id v3 = (void *)MEMORY[0x1E4F1C9B8];
  v4 = [(FCUserEventHistorySession *)self path];
  id v11 = 0;
  id v5 = [v3 dataWithContentsOfFile:v4 options:0 error:&v11];
  id v6 = v11;

  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__FCUserEventHistorySession_compressedData__block_invoke;
    v10[3] = &unk_1E5B4C840;
    v10[4] = self;
    __43__FCUserEventHistorySession_compressedData__block_invoke((uint64_t)v10);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v5;
  }
  __int16 v8 = v7;

  return v8;
}

uint64_t __43__FCUserEventHistorySession_compressedData__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCUserEventsLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    id v5 = v2;
    id v6 = [v4 identifier];
    int v7 = 138543362;
    __int16 v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Error compressing data for session %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (id)description
{
  id v3 = NSString;
  v4 = [(FCUserEventHistorySession *)self identifier];
  id v5 = [(FCUserEventHistorySession *)self date];
  id v6 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", -[FCUserEventHistorySession size](self, "size"), 0);
  int v7 = [v3 stringWithFormat:@"Session %@, on %@, size %@", v4, v5, v6];

  return v7;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSNumber)sizeNumber
{
  return self->_sizeNumber;
}

- (void)setSizeNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeNumber, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end