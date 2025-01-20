@interface PCCJob
- (NSDate)lastTouch;
- (NSDictionary)metadata;
- (NSDictionary)options;
- (NSString)event;
- (NSString)jid;
- (NSString)nextFilepath;
- (NSString)target;
- (NSString)type;
- (PCCJob)initWithID:(id)a3 forTarget:(id)a4 options:(id)a5;
- (PCCJob)initWithID:(id)a3 forTarget:(id)a4 options:(id)a5 forFile:(id)a6;
- (id)description;
- (id)result;
- (void)packageLog:(id)a3 forRouting:(id)a4 info:(id)a5 options:(id)a6;
- (void)registerResult:(BOOL)a3 error:(id)a4;
@end

@implementation PCCJob

- (NSString)nextFilepath
{
  return (NSString *)[(OSALog *)self->_package filepath];
}

- (id)result
{
  return self->_errObj;
}

- (PCCJob)initWithID:(id)a3 forTarget:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PCCJob;
  v12 = [(PCCJob *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_jid, a3);
    objc_storeStrong((id *)&v13->_target, a4);
    objc_storeStrong((id *)&v13->_options, a5);
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    lastTouch = v13->_lastTouch;
    v13->_lastTouch = (NSDate *)v14;

    type = v13->_type;
    v13->_type = (NSString *)@"xfer-file";

    v17 = [v11 objectForKeyedSubscript:@"event"];
    if (v17)
    {
      uint64_t v18 = [v11 objectForKeyedSubscript:@"event"];
      event = v13->_event;
      v13->_event = (NSString *)v18;
    }
    else
    {
      event = [v11 objectForKeyedSubscript:@"jobEvent"];
      if (event)
      {
        uint64_t v20 = [v11 objectForKeyedSubscript:@"jobEvent"];
        v21 = v13->_event;
        v13->_event = (NSString *)v20;
      }
      else
      {
        v21 = v13->_event;
        v13->_event = (NSString *)@"<unknown>";
      }
    }
  }

  return v13;
}

- (id)description
{
  v2 = NSString;
  jid = self->_jid;
  v4 = [(OSALog *)self->_package filepath];
  v5 = [v2 stringWithFormat:@"single %@ %@", jid, v4];

  return v5;
}

- (PCCJob)initWithID:(id)a3 forTarget:(id)a4 options:(id)a5 forFile:(id)a6
{
  v38[3] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  v12 = [(PCCJob *)self initWithID:a3 forTarget:a4 options:v10];
  if (v12)
  {
    v13 = [v10 objectForKeyedSubscript:@"<preserve>"];
    [v13 BOOLValue];

    int v14 = OSAIsRSDDisplay();
    BOOL v15 = [(NSString *)v12->_jid isEqualToString:@"<unsolicited>"];
    v16 = [MEMORY[0x1E4F83948] sharedInstance];
    v17 = [v16 pathSubmission];
    if ([v11 hasPrefix:v17])
    {
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F83948] sharedInstance];
      v19 = [v11 stringByDeletingLastPathComponent];
      int v20 = [v18 isWhitelisted:v19 forDomain:@"transfer_paths"];

      if (!v20)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "path non-accessible, abandoning job", v32, 2u);
        }
        v29 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v33 = *MEMORY[0x1E4F28568];
        v34 = @"Path non-accessible";
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        uint64_t v30 = [v29 errorWithDomain:@"ProxyJobErrorDomain" code:3 userInfo:v24];
        errObj = v12->_errObj;
        v12->_errObj = (NSError *)v30;
        goto LABEL_12;
      }
    }
    v37[0] = @"<preserve>";
    v21 = [NSNumber numberWithBool:v14 ^ 1u];
    v38[0] = v21;
    v37[1] = @"<exempt>";
    v22 = [NSNumber numberWithBool:!v15];
    v38[1] = v22;
    v37[2] = @"<cleanup>";
    objc_super v23 = [NSNumber numberWithBool:0];
    v38[2] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];

    [(PCCJob *)v12 packageLog:v11 forRouting:@"<sync>" info:&unk_1F36136D0 options:v24];
    if (v12->_package)
    {
LABEL_13:

      goto LABEL_14;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "specific file not available, abandoning job", v32, 2u);
    }
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v36 = @"File unavailable";
    errObj = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    uint64_t v27 = [v25 errorWithDomain:@"ProxyJobErrorDomain" code:2 userInfo:errObj];
    v28 = v12->_errObj;
    v12->_errObj = (NSError *)v27;

LABEL_12:
    goto LABEL_13;
  }
LABEL_14:

  return v12;
}

- (void)packageLog:(id)a3 forRouting:(id)a4 info:(id)a5 options:(id)a6
{
  v42[8] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = (objc_class *)MEMORY[0x1E4F83930];
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v11 alloc];
  v16 = [MEMORY[0x1E4F83948] sharedInstance];
  v17 = (OSALog *)[v15 initWithPath:v14 forRouting:v13 usingConfig:v16 options:v12 error:0];

  package = self->_package;
  self->_package = v17;

  v19 = self->_package;
  if (v19)
  {
    [(OSALog *)v19 closeFileStream];
    int v20 = [(OSALog *)self->_package filepath];
    v21 = [MEMORY[0x1E4F83948] sharedInstance];
    v22 = [v21 pathSubmission];
    int v23 = [v20 hasPrefix:v22];

    if (v23)
    {
      v24 = [(OSALog *)self->_package filepath];
      v25 = [MEMORY[0x1E4F83948] sharedInstance];
      v26 = [v25 pathSubmission];
      uint64_t v27 = [v24 stringByReplacingOccurrencesOfString:v26 withString:&stru_1F360EEC0];
      v28 = [v27 stringByDeletingLastPathComponent];
    }
    else
    {
      v28 = &stru_1F360EEC0;
    }
    v29 = [MEMORY[0x1E4F83948] sharedInstance];
    uint64_t v30 = [v29 crashReporterKey];

    v41[0] = @"name";
    v31 = [(OSALog *)self->_package filepath];
    v32 = [v31 lastPathComponent];
    v42[0] = v32;
    v42[1] = v30;
    v41[1] = @"proxied_dev";
    v41[2] = @"subdir";
    v42[2] = v28;
    v42[3] = v10;
    v41[3] = @"status";
    v41[4] = @"device_class";
    uint64_t v33 = [NSNumber numberWithInt:MGGetSInt32Answer()];
    event = self->_event;
    jid = self->_jid;
    v42[4] = v33;
    v42[5] = jid;
    v41[5] = @"jobId";
    v41[6] = @"jobEvent";
    v42[6] = event;
    v41[7] = @"jobType";
    v36 = [(PCCJob *)self type];
    v42[7] = v36;
    v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:8];
    metadata = self->_metadata;
    self->_metadata = v37;

    v39 = [MEMORY[0x1E4F1C9C8] date];
    lastTouch = self->_lastTouch;
    self->_lastTouch = v39;
  }
}

- (void)registerResult:(BOOL)a3 error:(id)a4
{
  BOOL v5 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (v5)
  {
    [(OSALog *)self->_package retire:"transferred"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "finished transferring log successfully", (uint8_t *)&v9, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "file send failure, abandoning job: %@", (uint8_t *)&v9, 0xCu);
    }
    objc_storeStrong((id *)&self->_errObj, a4);
  }
  package = self->_package;
  self->_package = 0;
}

- (NSString)jid
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)target
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (NSDate)lastTouch
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)event
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTouch, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_jid, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_errObj, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

@end