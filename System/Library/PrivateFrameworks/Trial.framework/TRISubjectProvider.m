@interface TRISubjectProvider
+ (BOOL)supportsSecureCoding;
+ (id)defaultProviderWithPaths:(id)a3;
- (BOOL)loadUsingGuardedData:(id)a3;
- (BOOL)save;
- (TRISubjectProvider)initWithCoder:(id)a3;
- (TRISubjectProvider)initWithPath:(id)a3;
- (id)anchorDate;
- (id)nextRotationDate;
- (id)nextRotationDateAfter:(id)a3;
- (id)subject;
- (id)subjectWithProjectId:(int)a3;
- (unint64_t)numberOfWeeksPerRotation;
- (void)decodeWithCoder:(id)a3 guardedData:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3 guardedData:(id)a4;
- (void)rotateSubject;
- (void)setNextRotationDate:(id)a3;
@end

@implementation TRISubjectProvider

void __29__TRISubjectProvider_subject__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v4 = (void *)v3[1];
  if (!v4)
  {
    [*(id *)(a1 + 32) loadUsingGuardedData:v3];
    v4 = (void *)v3[1];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v5 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      v10 = "com.apple.triald.wake";
      _os_log_impl(&dword_19D909000, v5, OS_LOG_TYPE_DEFAULT, "Unable to deserialize subject. Posting %s", (uint8_t *)&v9, 0xCu);
    }

    uint32_t v6 = notify_post("com.apple.triald.wake");
    if (v6)
    {
      uint32_t v7 = v6;
      v8 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315394;
        v10 = "com.apple.triald.wake";
        __int16 v11 = 2048;
        uint64_t v12 = v7;
        _os_log_error_impl(&dword_19D909000, v8, OS_LOG_TYPE_ERROR, "failed to post %s: %lu", (uint8_t *)&v9, 0x16u);
      }
    }
  }
}

- (BOOL)loadUsingGuardedData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v5 isReadableFileAtPath:self->_path])
  {
    path = self->_path;
    id v22 = 0;
    uint32_t v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:path options:2 error:&v22];
    id v8 = v22;
    id v9 = v8;
    if (v7)
    {

      id v21 = 0;
      v10 = [objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v7 error:&v21];
      id v9 = v21;
      if (v10
        && ([(TRISubjectProvider *)self decodeWithCoder:v10 guardedData:v4], !v9))
      {
        if (![*((id *)v4 + 1) hasDeviceId]
          || ([*((id *)v4 + 1) deviceId],
              v14 = objc_claimAutoreleasedReturnValue(),
              unint64_t v15 = [v14 length],
              v14,
              v15 > 7))
        {
          id v9 = 0;
          BOOL v12 = 1;
          goto LABEL_12;
        }
        v16 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v19 = [*((id *)v4 + 1) deviceId];
          uint64_t v20 = [v19 length];
          *(_DWORD *)buf = 134217984;
          uint64_t v24 = v20;
          _os_log_error_impl(&dword_19D909000, v16, OS_LOG_TYPE_ERROR, "rejecting deserialized subject due to unreasonably short deviceId of length %tu", buf, 0xCu);
        }
        v17 = (void *)*((void *)v4 + 1);
        *((void *)v4 + 1) = 0;

        __int16 v11 = *((void *)v4 + 2);
        *((void *)v4 + 2) = 0;
      }
      else
      {
        __int16 v11 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v24 = (uint64_t)v9;
          _os_log_error_impl(&dword_19D909000, v11, OS_LOG_TYPE_ERROR, "failed to decode subject from data -- %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v10 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v18 = self->_path;
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = (uint64_t)v18;
        __int16 v25 = 2112;
        id v26 = v9;
        _os_log_error_impl(&dword_19D909000, v10, OS_LOG_TYPE_ERROR, "failed to read subject data from file %@ -- %@", buf, 0x16u);
      }
    }
    BOOL v12 = 0;
LABEL_12:

    goto LABEL_13;
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (void)decodeWithCoder:(id)a3 guardedData:(id)a4
{
  v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"subjectData"];
  id v8 = (void *)v5[1];
  v5[1] = v7;

  uint64_t v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"rotationDate"];

  id v10 = (id)v5[2];
  v5[2] = v9;
}

- (id)subject
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  id v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__TRISubjectProvider_subject__block_invoke;
  v5[3] = &unk_1E596B678;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)defaultProviderWithPaths:(id)a3
{
  id v3 = a3;
  id v4 = [TRISubjectProvider alloc];
  v5 = [v3 subjectDataFile];

  uint64_t v6 = [(TRISubjectProvider *)v4 initWithPath:v5];
  return v6;
}

- (TRISubjectProvider)initWithPath:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TRISubjectProvider;
  uint64_t v6 = [(TRISubjectProvider *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F93B70]);
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = [v8 initWithGuardedData:v9];
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v10;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRISubjectProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TRISubjectProvider;
  id v5 = [(TRISubjectProvider *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    [(TRISubjectProvider *)v5 decodeWithCoder:v4 guardedData:v6];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v6];
    lock = v5->_lock;
    v5->_lock = (_PASLock *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__TRISubjectProvider_encodeWithCoder___block_invoke;
  v7[3] = &unk_1E596B628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __38__TRISubjectProvider_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) encodeWithCoder:*(void *)(a1 + 40) guardedData:a2];
}

- (void)encodeWithCoder:(id)a3 guardedData:(id)a4
{
  uint64_t v5 = *((void *)a4 + 1);
  id v6 = a4;
  id v8 = a3;
  [v8 encodeObject:v5 forKey:@"subjectData"];
  uint64_t v7 = v6[2];

  [v8 encodeObject:v7 forKey:@"rotationDate"];
}

- (void)setNextRotationDate:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__TRISubjectProvider_setNextRotationDate___block_invoke;
  v7[3] = &unk_1E596B650;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __42__TRISubjectProvider_setNextRotationDate___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (BOOL)save
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__TRISubjectProvider_save__block_invoke;
  v5[3] = &unk_1E596B678;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __26__TRISubjectProvider_save__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  char v3 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v4 = a2;
  uint64_t v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [*(id *)(a1 + 32) encodeWithCoder:v5 guardedData:v4];

  uint64_t v6 = [v5 encodedData];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v20 = 0;
    char v9 = [v7 triCreateDirectoryForPath:v8 isDirectory:0 error:&v20];
    id v10 = v20;

    if (v9) {
      BOOL v11 = v10 == 0;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11)
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
      id v19 = 0;
      char v17 = [v6 writeToFile:v16 options:1 error:&v19];
      id v10 = v19;
      if (v17)
      {
LABEL_14:

        goto LABEL_15;
      }
      BOOL v12 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = v18;
        __int16 v23 = 2112;
        id v24 = v10;
        v14 = "failed to write subject data to file %@ -- %@";
        goto LABEL_17;
      }
    }
    else
    {
      BOOL v12 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = v13;
        __int16 v23 = 2112;
        id v24 = v10;
        v14 = "failed to create directory for file %@ -- %@";
LABEL_17:
        _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);
      }
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_14;
  }
  unint64_t v15 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = 0;
    _os_log_error_impl(&dword_19D909000, v15, OS_LOG_TYPE_ERROR, "failed to encode subject -- %@", buf, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
LABEL_15:
}

- (unint64_t)numberOfWeeksPerRotation
{
  return 4;
}

- (id)subjectWithProjectId:(int)a3
{
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [(TRISubjectProvider *)self subject];

  if (v6)
  {
    uint64_t v7 = [(TRISubjectProvider *)self subject];
    [v7 copyTo:v5];

    uint64_t v8 = [v5 deviceId];
    char v9 = [v8 triHashWithIntegerSalt:a3];
    id v10 = [v9 UUIDString];
    [v5 setDeviceId:v10];
  }
  else
  {
    lock = self->_lock;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__TRISubjectProvider_subjectWithProjectId___block_invoke;
    v13[3] = &unk_1E596B6A0;
    int v15 = a3;
    id v14 = v5;
    [(_PASLock *)lock runWithLockAcquired:v13];
  }
  return v5;
}

void __43__TRISubjectProvider_subjectWithProjectId___block_invoke(uint64_t a1, void *a2)
{
  BOOL v12 = a2;
  if (!v12[3])
  {
    uint64_t v3 = objc_opt_new();
    id v4 = v12[3];
    v12[3] = (id)v3;
  }
  uint64_t v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  uint64_t v6 = [v12[3] objectForKeyedSubscript:v5];
  if (!v6)
  {
    uint64_t v7 = NSString;
    uint64_t v8 = (*(_DWORD *)(a1 + 40) % 10000);
    char v9 = [MEMORY[0x1E4F29128] UUID];
    id v10 = [v9 UUIDString];
    BOOL v11 = [v10 substringFromIndex:24];
    uint64_t v6 = [v7 stringWithFormat:@"00000000-0000-0000-%04X-%@", v8, v11];

    [v12[3] setObject:v6 forKeyedSubscript:v5];
  }
  [*(id *)(a1 + 32) setDeviceId:v6];
}

- (id)nextRotationDate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__12;
  id v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__TRISubjectProvider_nextRotationDate__block_invoke;
  v5[3] = &unk_1E596B678;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__TRISubjectProvider_nextRotationDate__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)v4[2];
  if (!v3)
  {
    [*(id *)(a1 + 32) loadUsingGuardedData:v4];
    id v3 = (void *)v4[2];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
}

- (id)anchorDate
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:536457600.0];
  return v2;
}

- (id)nextRotationDateAfter:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  uint64_t v6 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C328]];
  uint64_t v7 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v6 setTimeZone:v7];

  uint64_t v8 = [(TRISubjectProvider *)self anchorDate];
  char v9 = [v6 components:16 fromDate:v8 toDate:v5 options:0];
  uint64_t v10 = [v9 day] / 7;
  int64_t v11 = v10 / (int64_t)[(TRISubjectProvider *)self numberOfWeeksPerRotation];
  BOOL v12 = objc_opt_new();
  objc_msgSend(v12, "setDay:", -[TRISubjectProvider numberOfWeeksPerRotation](self, "numberOfWeeksPerRotation") * (7 * v11 + 7));
  uint64_t v13 = [v6 dateByAddingComponents:v12 toDate:v8 options:0];
  if (!v13)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRISubjectProvider.m", 247, @"Invalid parameter not satisfying: %@", @"epochRelativeDate" object file lineNumber description];
  }
  id v14 = [v6 startOfDayForDate:v13];

  return v14;
}

- (void)rotateSubject
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__TRISubjectProvider_rotateSubject__block_invoke;
  v3[3] = &unk_1E596B650;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

void __35__TRISubjectProvider_rotateSubject__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  id v5 = (void *)*((void *)v3 + 1);
  *((void *)v3 + 1) = v4;

  uint64_t v6 = objc_opt_new();
  uint64_t v7 = [v6 UUIDString];
  [*((id *)v3 + 1) setDeviceId:v7];

  uint64_t v8 = [*(id *)(a1 + 32) nextRotationDateAfter:0];
  id v9 = (id)*((void *)v3 + 2);
  *((void *)v3 + 2) = v8;
}

@end