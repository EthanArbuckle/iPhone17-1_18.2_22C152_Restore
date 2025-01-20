@interface FCGroupFont
- (FCGroupFont)init;
- (FCGroupFont)initWithName:(id)a3 urlString:(id)a4;
- (NSString)name;
- (NSString)urlString;
@end

@implementation FCGroupFont

- (FCGroupFont)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCGroupFont init]";
    __int16 v9 = 2080;
    v10 = "FCForYouConfig.m";
    __int16 v11 = 1024;
    int v12 = 389;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCGroupFont init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCGroupFont)initWithName:(id)a3 urlString:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "name");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCGroupFont initWithName:urlString:]";
    __int16 v17 = 2080;
    v18 = "FCForYouConfig.m";
    __int16 v19 = 1024;
    int v20 = 394;
    __int16 v21 = 2114;
    v22 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "urlString");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCGroupFont initWithName:urlString:]";
    __int16 v17 = 2080;
    v18 = "FCForYouConfig.m";
    __int16 v19 = 1024;
    int v20 = 395;
    __int16 v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)FCGroupFont;
  __int16 v9 = [(FCGroupFont *)&v14 init];
  v10 = v9;
  if (v9)
  {
    if (v7 && v8)
    {
      objc_storeStrong((id *)&v9->_name, a3);
      objc_storeStrong((id *)&v10->_urlString, a4);
    }
    else
    {

      v10 = 0;
    }
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end