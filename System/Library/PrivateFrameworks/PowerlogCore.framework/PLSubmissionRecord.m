@interface PLSubmissionRecord
+ (BOOL)supportsSecureCoding;
+ (id)getCKSubmissionDirPathForTag:(id)a3;
+ (id)getDASubmissionDirPathForTag:(id)a3;
- (BOOL)inSubmission;
- (NSDate)configDateApplied;
- (NSDate)configDateReceived;
- (NSDictionary)tagConfig;
- (NSString)ckFileDirPath;
- (NSString)daFileDirPath;
- (NSString)filePath;
- (NSString)tagUUID;
- (NSUUID)configUUID;
- (PLSubmissionRecord)initWithCKFilePath:(id)a3 tagUUID:(id)a4 tagConfig:(id)a5 configUUID:(id)a6 configDateReceived:(id)a7 configDateApplied:(id)a8;
- (PLSubmissionRecord)initWithCoder:(id)a3;
- (void)cleanup;
- (void)emitAttemptEvent;
- (void)emitSuccessEvent;
- (void)encodeWithCoder:(id)a3;
- (void)removeFileAtPath:(id)a3;
- (void)setCkFileDirPath:(id)a3;
- (void)setDaFileDirPath:(id)a3;
- (void)setFilePath:(id)a3;
- (void)setInSubmission:(BOOL)a3;
- (void)setTagConfig:(id)a3;
- (void)setTagUUID:(id)a3;
@end

@implementation PLSubmissionRecord

+ (id)getDASubmissionDirPathForTag:(id)a3
{
  return (id)[@"/tmp/powerlog/" stringByAppendingPathComponent:a3];
}

+ (id)getCKSubmissionDirPathForTag:(id)a3
{
  v3 = [NSString stringWithFormat:@"Powerlog_%@", a3];
  v4 = [@"/tmp/powerlog/cloud/" stringByAppendingPathComponent:v3];

  return v4;
}

- (PLSubmissionRecord)initWithCKFilePath:(id)a3 tagUUID:(id)a4 tagConfig:(id)a5 configUUID:(id)a6 configDateReceived:(id)a7 configDateApplied:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v29.receiver = self;
  v29.super_class = (Class)PLSubmissionRecord;
  v20 = [(PLSubmissionRecord *)&v29 init];
  v21 = v20;
  if (v20)
  {
    [(PLSubmissionRecord *)v20 setFilePath:v14];
    [(PLSubmissionRecord *)v21 setTagUUID:v15];
    [(PLSubmissionRecord *)v21 setTagConfig:v16];
    [(PLSubmissionRecord *)v21 setInSubmission:0];
    id v28 = v16;
    +[PLSubmissionRecord getDASubmissionDirPathForTag:v15];
    id v22 = v19;
    id v23 = v14;
    v25 = id v24 = v17;
    [(PLSubmissionRecord *)v21 setDaFileDirPath:v25];

    v26 = +[PLSubmissionRecord getCKSubmissionDirPathForTag:v15];
    [(PLSubmissionRecord *)v21 setCkFileDirPath:v26];

    id v17 = v24;
    id v14 = v23;
    id v19 = v22;
    objc_storeStrong((id *)&v21->_configUUID, a6);
    objc_storeStrong((id *)&v21->_configDateApplied, a8);
    id v16 = v28;
    objc_storeStrong((id *)&v21->_configDateReceived, a7);
  }

  return v21;
}

- (void)emitAttemptEvent
{
  id v17 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:@"attempt" forKeyedSubscript:@"iCloudSubmissionState"];
  v4 = [(PLSubmissionRecord *)self tagConfig];
  v5 = [v4 objectForKeyedSubscript:@"Reason"];
  [v3 setObject:v5 forKeyedSubscript:@"TaskingReason"];

  v6 = [(PLSubmissionRecord *)self configUUID];

  if (v6)
  {
    v7 = [(PLSubmissionRecord *)self configUUID];
    v8 = [v7 UUIDString];
    [v3 setObject:v8 forKeyedSubscript:@"DPTaskingUUID"];

    v9 = NSNumber;
    v10 = [(PLSubmissionRecord *)self configDateApplied];
    v11 = [(PLSubmissionRecord *)self configDateReceived];
    [v10 timeIntervalSinceDate:v11];
    v12 = objc_msgSend(v9, "numberWithDouble:");
    [v3 setObject:v12 forKeyedSubscript:@"TaskingDelayFromDPBlobReceivedTime"];
  }
  v13 = [(PLSubmissionRecord *)self configDateApplied];

  if (v13)
  {
    id v14 = NSNumber;
    id v15 = [(PLSubmissionRecord *)self configDateApplied];
    [v17 timeIntervalSinceDate:v15];
    id v16 = objc_msgSend(v14, "numberWithDouble:");
    [v3 setObject:v16 forKeyedSubscript:@"TaskingDurationStartToiCloudAttempt"];
  }
  _submitTaskingCAEventPayload(v3, @"Attempting log upload");
}

- (void)emitSuccessEvent
{
  id v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:@"success" forKeyedSubscript:@"iCloudSubmissionState"];
  v4 = [(PLSubmissionRecord *)self tagConfig];
  v5 = [v4 objectForKeyedSubscript:@"Reason"];
  [v3 setObject:v5 forKeyedSubscript:@"TaskingReason"];

  v6 = [(PLSubmissionRecord *)self configUUID];

  if (v6)
  {
    v7 = [(PLSubmissionRecord *)self configUUID];
    v8 = [v7 UUIDString];
    [v3 setObject:v8 forKeyedSubscript:@"DPTaskingUUID"];
  }
  v9 = [(PLSubmissionRecord *)self configDateApplied];

  if (v9)
  {
    v10 = NSNumber;
    v11 = [(PLSubmissionRecord *)self configDateApplied];
    [v13 timeIntervalSinceDate:v11];
    v12 = objc_msgSend(v10, "numberWithDouble:");
    [v3 setObject:v12 forKeyedSubscript:@"TaskingDurationStartToiCloudSuccess"];
  }
  _submitTaskingCAEventPayload(v3, @"Successful log upload");
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  v4 = [(PLSubmissionRecord *)self filePath];
  [v13 encodeObject:v4 forKey:@"filePath"];

  v5 = [(PLSubmissionRecord *)self tagUUID];
  [v13 encodeObject:v5 forKey:@"tagUUID"];

  v6 = [(PLSubmissionRecord *)self tagConfig];
  [v13 encodeObject:v6 forKey:@"tagConfig"];

  v7 = [(PLSubmissionRecord *)self configUUID];

  if (v7)
  {
    v8 = [(PLSubmissionRecord *)self configUUID];
    [v13 encodeObject:v8 forKey:@"configUUID"];
  }
  v9 = [(PLSubmissionRecord *)self configDateApplied];

  if (v9)
  {
    v10 = [(PLSubmissionRecord *)self configDateApplied];
    [v13 encodeObject:v10 forKey:@"configDateApplied"];
  }
  v11 = [(PLSubmissionRecord *)self configDateReceived];

  if (v11)
  {
    v12 = [(PLSubmissionRecord *)self configDateReceived];
    [v13 encodeObject:v12 forKey:@"configDateReceived"];
  }
}

- (PLSubmissionRecord)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filePath"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tagUUID"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:3];
  v9 = objc_msgSend(v7, "setWithArray:", v8, v16, v17);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"tagConfig"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configUUID"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configDateReceived"];
  id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configDateApplied"];

  id v14 = [(PLSubmissionRecord *)self initWithCKFilePath:v5 tagUUID:v6 tagConfig:v10 configUUID:v11 configDateReceived:v12 configDateApplied:v13];
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)cleanup
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (+[PLDefaults BOOLForKey:@"PLSubmissionCleanup" ifNotSet:1])
  {
    v3 = PLLogSubmission();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      v12 = self;
      _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up files for submission record %@", (uint8_t *)&v11, 0xCu);
    }

    id v4 = [(PLSubmissionRecord *)self filePath];
    [(PLSubmissionRecord *)self removeFileAtPath:v4];

    v5 = [(PLSubmissionRecord *)self daFileDirPath];
    [(PLSubmissionRecord *)self removeFileAtPath:v5];

    v6 = [(PLSubmissionRecord *)self ckFileDirPath];
    [(PLSubmissionRecord *)self removeFileAtPath:v6];

    v7 = NSTemporaryDirectory();
    v8 = [v7 stringByAppendingPathComponent:@"PLSubmissionConfig"];
    v9 = [(PLSubmissionRecord *)self tagUUID];
    v10 = [v8 stringByAppendingPathComponent:v9];
    [(PLSubmissionRecord *)self removeFileAtPath:v10];
  }
}

- (void)removeFileAtPath:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v11 = 0;
    int v7 = [v6 removeItemAtPath:v3 error:&v11];
    id v8 = v11;

    v9 = PLLogSubmission();
    v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v3;
        _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEFAULT, "Removed item at %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[PLSubmissionRecord removeFileAtPath:]();
    }
  }
}

- (NSString)tagUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTagUUID:(id)a3
{
}

- (NSUUID)configUUID
{
  return self->_configUUID;
}

- (NSDate)configDateApplied
{
  return self->_configDateApplied;
}

- (NSDate)configDateReceived
{
  return self->_configDateReceived;
}

- (NSString)filePath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFilePath:(id)a3
{
}

- (NSString)ckFileDirPath
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCkFileDirPath:(id)a3
{
}

- (NSString)daFileDirPath
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDaFileDirPath:(id)a3
{
}

- (NSDictionary)tagConfig
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTagConfig:(id)a3
{
}

- (BOOL)inSubmission
{
  return self->_inSubmission;
}

- (void)setInSubmission:(BOOL)a3
{
  self->_inSubmission = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagConfig, 0);
  objc_storeStrong((id *)&self->_daFileDirPath, 0);
  objc_storeStrong((id *)&self->_ckFileDirPath, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_configDateReceived, 0);
  objc_storeStrong((id *)&self->_configDateApplied, 0);
  objc_storeStrong((id *)&self->_configUUID, 0);
  objc_storeStrong((id *)&self->_tagUUID, 0);
}

- (void)removeFileAtPath:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Failed to remove item at %@, error: %@");
}

@end