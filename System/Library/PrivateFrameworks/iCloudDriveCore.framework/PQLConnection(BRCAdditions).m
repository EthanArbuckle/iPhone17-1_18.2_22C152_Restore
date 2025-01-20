@interface PQLConnection(BRCAdditions)
- (uint64_t)br_isTableExists:()BRCAdditions;
- (uint64_t)dataWithSQL:()BRCAdditions;
- (uint64_t)itemIDWithSQL:()BRCAdditions;
- (uint64_t)numberWithSQL:()BRCAdditions;
- (uint64_t)registerFunction:()BRCAdditions nArgs:handler:error:;
- (uint64_t)stringWithSQL:()BRCAdditions;
@end

@implementation PQLConnection(BRCAdditions)

- (uint64_t)numberWithSQL:()BRCAdditions
{
  id v10 = a3;
  uint64_t v11 = [a1 fetchObjectOfClass:objc_opt_class() sql:v10 args:&a9];

  return v11;
}

- (uint64_t)stringWithSQL:()BRCAdditions
{
  id v10 = a3;
  uint64_t v11 = [a1 fetchObjectOfClass:objc_opt_class() sql:v10 args:&a9];

  return v11;
}

- (uint64_t)dataWithSQL:()BRCAdditions
{
  id v10 = a3;
  uint64_t v11 = [a1 fetchObjectOfClass:objc_opt_class() sql:v10 args:&a9];

  return v11;
}

- (uint64_t)itemIDWithSQL:()BRCAdditions
{
  id v10 = a3;
  uint64_t v11 = [a1 fetchObjectOfClass:objc_opt_class() sql:v10 args:&a9];

  return v11;
}

- (uint64_t)registerFunction:()BRCAdditions nArgs:handler:error:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend(a1, "registerFunction:nArgs:handler:");
  if ((v8 & 1) == 0)
  {
    v9 = [a1 lastError];
    if (v9)
    {
      id v10 = brc_bread_crumbs();
      uint64_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      {
        v13 = "(passed to caller)";
        int v14 = 136315906;
        v15 = "-[PQLConnection(BRCAdditions) registerFunction:nArgs:handler:error:]";
        __int16 v16 = 2080;
        if (!a6) {
          v13 = "(ignored by caller)";
        }
        v17 = v13;
        __int16 v18 = 2112;
        v19 = v9;
        __int16 v20 = 2112;
        v21 = v10;
        _os_log_error_impl(&dword_23FA42000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v14, 0x2Au);
      }
    }
    if (a6) {
      *a6 = v9;
    }
  }
  return v8;
}

- (uint64_t)br_isTableExists:()BRCAdditions
{
  v3 = (void *)[a1 numberWithSQL:@"SELECT 1 FROM sqlite_master where type = 'table' AND name = %@", a3];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

@end