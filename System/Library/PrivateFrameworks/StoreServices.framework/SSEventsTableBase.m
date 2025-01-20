@interface SSEventsTableBase
+ (id)databasePath;
- (BOOL)_setupDatabase;
- (SSEventsTableBase)init;
- (void)performTransactionWithBlock:(id)a3;
@end

@implementation SSEventsTableBase

- (SSEventsTableBase)init
{
  v14.receiver = self;
  v14.super_class = (Class)SSEventsTableBase;
  v2 = [(SSEventsTableBase *)&v14 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1A6267F60]();
    v4 = [(id)objc_opt_class() databasePath];
    v5 = [SSSQLiteDatabase alloc];
    v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];
    uint64_t v7 = [(SSSQLiteDatabase *)v5 initWithDatabaseURL:v6 readOnly:0 protectionType:*MEMORY[0x1E4F28358]];
    database = v2->_database;
    v2->_database = (SSSQLiteDatabase *)v7;

    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2050000000;
    v13[3] = v2;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __25__SSEventsTableBase_init__block_invoke;
    v10[3] = &unk_1E5BA9F10;
    v12 = v13;
    v11 = v2;
    [(SSSQLiteDatabase *)v2->_database setSetupBlock:v10];

    _Block_object_dispose(v13, 8);
  }
  return v2;
}

void __25__SSEventsTableBase_init__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) _setupDatabase] & 1) == 0)
  {
    v1 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v1)
    {
      v1 = +[SSLogConfig sharedConfig];
    }
    int v2 = [v1 shouldLog];
    if ([v1 shouldLogToDisk]) {
      int v3 = v2 | 2;
    }
    else {
      int v3 = v2;
    }
    v4 = [v1 OSLogObject];
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      v3 &= 2u;
    }
    if (v3)
    {
      LODWORD(v14) = 138412290;
      *(void *)((char *)&v14 + 4) = objc_opt_class();
      id v5 = *(id *)((char *)&v14 + 4);
      LODWORD(v13) = 12;
      v6 = (void *)_os_log_send_and_compose_impl();

      if (!v6)
      {
LABEL_13:

        return;
      }
      v4 = objc_msgSend(NSString, "stringWithCString:encoding:", v6, 4, &v14, v13, v14);
      free(v6);
      SSFileLog(v1, @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v4);
    }

    goto LABEL_13;
  }
}

- (void)performTransactionWithBlock:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SSEventsTableBase_performTransactionWithBlock___block_invoke;
  v7[3] = &unk_1E5BA9F38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:v7];
}

uint64_t __49__SSEventsTableBase_performTransactionWithBlock___block_invoke(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1A6267F60]();
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  return v3;
}

+ (id)databasePath
{
  return 0;
}

- (BOOL)_setupDatabase
{
  return 0;
}

- (void).cxx_destruct
{
}

@end