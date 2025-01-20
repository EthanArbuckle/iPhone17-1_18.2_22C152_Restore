@interface SCSharingReminderArchiver
+ (id)sharedInstance;
- (BOOL)sharingReminderDirectoryExists;
- (NSFileManager)fileManager;
- (SCSharingReminderArchiver)init;
- (id)fileURLForKey:(id)a3;
- (id)getObjectOfClass:(Class)a3 atKey:(id)a4;
- (id)sharingReminderDirectoryURL;
- (void)createSharingReminderDirectory;
- (void)getObjectOfClass:(Class)a3 atKey:(id)a4 completion:(id)a5;
- (void)setFileManager:(id)a3;
- (void)setObject:(id)a3 atKey:(id)a4 withCompletion:(id)a5;
- (void)sharingReminderDirectoryExists;
- (void)sharingReminderDirectoryURL;
@end

@implementation SCSharingReminderArchiver

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SCSharingReminderArchiver_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance___utility;
  return v2;
}

uint64_t __43__SCSharingReminderArchiver_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance___utility = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (SCSharingReminderArchiver)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCSharingReminderArchiver;
  v2 = [(SCSharingReminderArchiver *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08850] defaultManager];
    [(SCSharingReminderArchiver *)v2 setFileManager:v3];

    v2->_lock._os_unfair_lock_opaque = 0;
    if (![(SCSharingReminderArchiver *)v2 sharingReminderDirectoryExists]) {
      [(SCSharingReminderArchiver *)v2 createSharingReminderDirectory];
    }
  }
  return v2;
}

- (void)getObjectOfClass:(Class)a3 atKey:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void, id))a5;
  if (v8 && ![v8 isEqualToString:&stru_270900CD0])
  {
    v11 = [(SCSharingReminderArchiver *)self fileURLForKey:v8];
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v19 = 0;
    v13 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v11 options:0 error:&v19];
    id v14 = v19;
    os_unfair_lock_unlock(p_lock);
    if (v14)
    {
      v15 = SCLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[SCSharingReminderArchiver getObjectOfClass:atKey:completion:]();
      }

      v9[2](v9, 0, v14);
    }
    else
    {
      id v18 = 0;
      v16 = [MEMORY[0x263F08928] unarchivedObjectOfClass:a3 fromData:v13 error:&v18];
      id v14 = v18;
      if (v14)
      {
        v17 = SCLogger();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[SCSharingReminderArchiver getObjectOfClass:atKey:completion:]();
        }

        v16 = 0;
      }
      ((void (**)(id, void *, id))v9)[2](v9, v16, v14);
    }
  }
  else
  {
    v10 = SCLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SCSharingReminderArchiver getObjectOfClass:atKey:completion:]();
    }

    v11 = +[SCDaemonError errorWithCode:4];
    v9[2](v9, 0, v11);
  }
}

- (id)getObjectOfClass:(Class)a3 atKey:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6 && ![v6 isEqualToString:&stru_270900CD0])
  {
    id v8 = [(SCSharingReminderArchiver *)self fileURLForKey:v7];
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v16 = 0;
    v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v8 options:0 error:&v16];
    id v12 = v16;
    os_unfair_lock_unlock(p_lock);
    if (v12)
    {
      v9 = SCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SCSharingReminderArchiver getObjectOfClass:atKey:completion:]();
      }
    }
    else
    {
      id v15 = 0;
      v9 = [MEMORY[0x263F08928] unarchivedObjectOfClass:a3 fromData:v11 error:&v15];
      id v12 = v15;
      if (!v12)
      {
LABEL_14:

        goto LABEL_15;
      }
      v13 = SCLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SCSharingReminderArchiver getObjectOfClass:atKey:completion:]();
      }
    }
    v9 = 0;
    goto LABEL_14;
  }
  id v8 = SCLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[SCSharingReminderArchiver getObjectOfClass:atKey:completion:]();
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (void)setObject:(id)a3 atKey:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, id))a5;
  if (v8 && v9 && ![v9 isEqualToString:&stru_270900CD0])
  {
    id v24 = 0;
    id v12 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v24];
    id v13 = v24;
    if (v13)
    {
      id v14 = SCLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SCSharingReminderArchiver setObject:atKey:withCompletion:]();
      }

      v10[2](v10, 0, v13);
    }
    else
    {
      id v15 = [(SCSharingReminderArchiver *)self fileURLForKey:v9];
      lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      id v16 = [(SCSharingReminderArchiver *)self fileManager];
      v17 = [v15 path];
      int v18 = [v16 fileExistsAtPath:v17];

      if (v18)
      {
        uint64_t v19 = objc_msgSend(v12, "writeToURL:atomically:", v15, 1, lock);
      }
      else
      {
        v20 = [(SCSharingReminderArchiver *)self fileManager];
        v21 = [v15 path];
        uint64_t v19 = [v20 createFileAtPath:v21 contents:v12 attributes:0];
      }
      os_unfair_lock_unlock(locka);
      v10[2](v10, v19, 0);
    }
  }
  else
  {
    v11 = SCLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SCSharingReminderArchiver setObject:atKey:withCompletion:]();
    }

    v10[2](v10, 0, 0);
  }
}

- (BOOL)sharingReminderDirectoryExists
{
  char v9 = 0;
  v3 = [(SCSharingReminderArchiver *)self sharingReminderDirectoryURL];
  v4 = [v3 path];

  objc_super v5 = [(SCSharingReminderArchiver *)self fileManager];
  int v6 = [v5 fileExistsAtPath:v4 isDirectory:&v9];

  if (v6 && !v9)
  {
    v7 = SCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCSharingReminderArchiver sharingReminderDirectoryExists]();
    }
  }
  return v6;
}

- (void)createSharingReminderDirectory
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_25B654000, v0, v1, "\"Error creating directory: %@\"", v2, v3, v4, v5, v6);
}

- (id)fileURLForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SCSharingReminderArchiver *)self sharingReminderDirectoryURL];
  uint8_t v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:0];

  return v6;
}

- (id)sharingReminderDirectoryURL
{
  uint64_t v2 = [(SCSharingReminderArchiver *)self fileManager];
  id v8 = 0;
  uint64_t v3 = [v2 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:0 error:&v8];
  id v4 = v8;

  if (v4)
  {
    uint64_t v5 = SCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCSharingReminderArchiver sharingReminderDirectoryURL]();
    }

    uint8_t v6 = 0;
  }
  else
  {
    uint8_t v6 = [v3 URLByAppendingPathComponent:@"com.apple.safetycheckd" isDirectory:1];
  }

  return v6;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)getObjectOfClass:atKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_25B654000, v0, v1, "\"Archiver couldn't decode malformed key: %@\"", v2, v3, v4, v5, v6);
}

- (void)getObjectOfClass:atKey:completion:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_25B654000, v0, v1, "\"Error: %@ while creating decoder for data: %@\"");
}

- (void)getObjectOfClass:atKey:completion:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_25B654000, v0, v1, "\"Error reading data at URL: %@\"", v2, v3, v4, v5, v6);
}

- (void)setObject:atKey:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_25B654000, v0, v1, "\"Archiver couldn't encode malformed args [object: %@ key: %@]\"");
}

- (void)setObject:atKey:withCompletion:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_25B654000, v0, v1, "\"Archiver couldn't encode object: %@ error: %@\"");
}

- (void)sharingReminderDirectoryExists
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_25B654000, v0, v1, "\"Expected to find directory but found folder instead at path: %@\"", v2, v3, v4, v5, v6);
}

- (void)sharingReminderDirectoryURL
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_25B654000, v0, v1, "\"Error getting top level directory: %@\"", v2, v3, v4, v5, v6);
}

@end