@interface PCSAnalytics
+ (id)databasePath;
+ (id)logger;
- (id)dateOfLastSuccessForEvent:(id)a3;
- (void)logRecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5;
- (void)logSuccessForEvent:(id)a3;
- (void)logUnrecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5;
- (void)noteEvent:(id)a3;
@end

@implementation PCSAnalytics

+ (id)databasePath
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  if ([v2 count])
  {
    v3 = NSString;
    v4 = [v2 objectAtIndexedSubscript:0];
    v5 = [v3 stringWithFormat:@"%@/com.apple.ProtectedCloudStorage", v4];

    v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v12 = 0;
    char v7 = [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v12];
    id v8 = v12;

    if (v7)
    {
      v9 = [NSString stringWithFormat:@"PCSAnalytics.db"];
      v10 = [v5 stringByAppendingPathComponent:v9];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v8;
        _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to create ApplicationSupport directory: %@", buf, 0xCu);
      }
      v10 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to get ApplicationSupport directory", buf, 2u);
    }
    v10 = 0;
  }

  return v10;
}

+ (id)logger
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___PCSAnalytics;
  v2 = objc_msgSendSuper2(&v4, sel_logger);
  return v2;
}

- (void)logSuccessForEvent:(id)a3
{
  objc_super v4 = NSString;
  id v5 = a3;
  v6 = [v4 stringWithFormat:@"%@", v5];
  [(SFAnalytics *)self logSuccessForEventNamed:v6];

  id v8 = [MEMORY[0x1E4F1C9C8] date];
  char v7 = [NSString stringWithFormat:@"last_success_%@", v5];

  [(SFAnalytics *)self setDateProperty:v8 forKey:v7];
}

- (void)logRecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    v19[0] = MEMORY[0x1E4F1CC38];
    v18[0] = @"recoverableError";
    v18[1] = @"errorDomain";
    id v10 = a3;
    v11 = [v10 domain];
    v19[1] = v11;
    v18[2] = @"errorCode";
    id v12 = NSNumber;
    uint64_t v13 = [v10 code];

    id v14 = [v12 numberWithInteger:v13];
    v19[2] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

    if (v9)
    {
      v16 = (void *)[v9 mutableCopy];
      [v16 setValuesForKeysWithDictionary:v15];

      uint64_t v15 = v16;
    }
    v17.receiver = self;
    v17.super_class = (Class)PCSAnalytics;
    [(SFAnalytics *)&v17 logSoftFailureForEventNamed:v8 withAttributes:v15];
  }
}

- (void)logUnrecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5
{
  void v18[3] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    v18[0] = MEMORY[0x1E4F1CC28];
    v17[0] = @"recoverableError";
    v17[1] = @"errorDomain";
    id v10 = a3;
    v11 = [v10 domain];
    v18[1] = v11;
    v17[2] = @"errorCode";
    id v12 = NSNumber;
    uint64_t v13 = [v10 code];

    id v14 = [v12 numberWithInteger:v13];
    v18[2] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

    if (v9)
    {
      v16 = (void *)[v9 mutableCopy];
      [v16 setValuesForKeysWithDictionary:v15];

      uint64_t v15 = v16;
    }
    [(SFAnalytics *)self logHardFailureForEventNamed:v8 withAttributes:v15];
  }
}

- (void)noteEvent:(id)a3
{
  id v4 = [NSString stringWithFormat:@"%@", a3];
  [(SFAnalytics *)self noteEventNamed:v4];
}

- (id)dateOfLastSuccessForEvent:(id)a3
{
  id v4 = [NSString stringWithFormat:@"last_success_%@", a3];
  id v5 = [(SFAnalytics *)self datePropertyForKey:v4];

  return v5;
}

@end