@interface VUIJSUserDefaults
- (VUIAppUserDefaultsStoring)userDefaultsStorage;
- (VUIJSUserDefaults)initWithAppContext:(id)a3 userDefaultsStorage:(id)a4;
- (id)getData:(id)a3;
- (void)removeData:(id)a3;
- (void)setData:(id)a3 :(id)a4;
- (void)setUserDefaultsStorage:(id)a3;
@end

@implementation VUIJSUserDefaults

- (void)setData:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(VUIJSUserDefaults *)self userDefaultsStorage];
  if ([v7 isNull])
  {
    [v8 removeDataForKey:v6];
  }
  else
  {
    if ([v7 isString])
    {
      v9 = [v7 toString];
    }
    else
    {
      v9 = 0;
    }
    if ([v7 isBoolean] && !v9)
    {
      v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v7, "toBool"));
    }
    if ([v7 isNumber] && !v9)
    {
      v9 = [v7 toNumber];
    }
    if ([v7 isArray] && !v9)
    {
      v9 = [v7 toArray];
    }
    if (v9)
    {
      [v8 setData:v9 forKey:v6];
    }
    else
    {
      v10 = VUIDefaultLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[VUIJSUserDefaults setData::]((uint64_t)v6, v10);
      }
    }
  }
}

- (id)getData:(id)a3
{
  id v4 = a3;
  v5 = [(VUIJSObject *)self appContext];
  id v6 = (void *)MEMORY[0x1E4F30938];
  id v7 = [v5 jsContext];
  v8 = [v6 valueWithNullInContext:v7];

  v9 = [(VUIJSUserDefaults *)self userDefaultsStorage];
  v10 = [v9 dataForKey:v4];

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E4F30938];
    v12 = [v5 jsContext];
    uint64_t v13 = [v11 valueWithObject:v10 inContext:v12];

    v8 = (void *)v13;
  }

  return v8;
}

- (VUIAppUserDefaultsStoring)userDefaultsStorage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userDefaultsStorage);
  return (VUIAppUserDefaultsStoring *)WeakRetained;
}

- (VUIJSUserDefaults)initWithAppContext:(id)a3 userDefaultsStorage:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)VUIJSUserDefaults;
  id v7 = [(VUIJSObject *)&v10 initWithAppContext:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_userDefaultsStorage, v6);
  }

  return v8;
}

- (void)removeData:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIJSUserDefaults *)self userDefaultsStorage];
  [v5 removeDataForKey:v4];
}

- (void)setUserDefaultsStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setData:(uint64_t)a1 :(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "VUIJSUserDefaults - Failed to set unrecognized value for key '%@'", (uint8_t *)&v2, 0xCu);
}

@end