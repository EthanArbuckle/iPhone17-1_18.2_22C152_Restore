@interface ML3DatabaseFunctionBlock
- (BOOL)registerWithConnection:(id)a3;
- (id)block;
- (void)setBlock:(id)a3;
@end

@implementation ML3DatabaseFunctionBlock

- (BOOL)registerWithConnection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (self->_block)
  {
    v6 = (sqlite3 *)[v4 _sqliteHandle];
    id v7 = [(ML3DatabaseFunction *)self name];
    LODWORD(v6) = sqlite3_create_function_v2(v6, (const char *)[v7 UTF8String], -[ML3DatabaseFunction argumentCount](self, "argumentCount"), 2049, self, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_ML3DatabaseFunctionRunBlock, 0, 0, 0);

    if (!v6)
    {
      BOOL v12 = 1;
      goto LABEL_8;
    }
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      id v10 = v9;
      v11 = [v5 sqliteError];
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error registering function: %{public}@", buf, 0x16u);
    }
  }
  BOOL v12 = 0;
LABEL_8:

  return v12;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)block
{
  return self->_block;
}

@end