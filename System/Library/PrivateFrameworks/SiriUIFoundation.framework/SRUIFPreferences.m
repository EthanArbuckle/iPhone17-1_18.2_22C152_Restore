@interface SRUIFPreferences
- (BOOL)BOOLForKey:(id)a3;
- (SRUIFPreferences)init;
- (SRUIFPreferences)initWithDefaultsAtURL:(id)a3;
- (SRUIFPreferences)initWithDefaultsResource:(id)a3 withExtension:(id)a4 inBundle:(id)a5;
- (SRUIFPreferences)initWithSuiteName:(id)a3;
- (SRUIFPreferencesDelegate)delegate;
- (double)doubleForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (int64_t)integerForKey:(id)a3;
- (void)_mutateValueForKey:(id)a3 block:(id)a4;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDouble:(double)a3 forKey:(id)a4;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)synchronize;
@end

@implementation SRUIFPreferences

- (SRUIFPreferences)initWithSuiteName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRUIFPreferences;
  v5 = [(SRUIFPreferences *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:v4];
    userDefaults = v5->_userDefaults;
    v5->_userDefaults = (NSUserDefaults *)v6;
  }
  return v5;
}

- (SRUIFPreferences)initWithDefaultsAtURL:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SRUIFPreferences;
  v5 = [(SRUIFPreferences *)&v17 init];
  if (v5)
  {
    uint64_t v6 = (NSUserDefaults *)objc_alloc_init(MEMORY[0x263EFFA40]);
    userDefaults = v5->_userDefaults;
    v5->_userDefaults = v6;

    if (v4)
    {
      id v16 = 0;
      v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4 options:0 error:&v16];
      id v9 = v16;
      if (v8)
      {
        id v15 = 0;
        v10 = [MEMORY[0x263F08AC0] propertyListWithData:v8 options:0 format:0 error:&v15];
        id v11 = v15;

        if (v10)
        {
          [(NSUserDefaults *)v5->_userDefaults registerDefaults:v10];
        }
        else
        {
          v13 = *MEMORY[0x263F28348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            v19 = "-[SRUIFPreferences initWithDefaultsAtURL:]";
            __int16 v20 = 2114;
            v21 = v5;
            __int16 v22 = 2114;
            id v23 = v4;
            __int16 v24 = 2114;
            id v25 = v11;
            _os_log_error_impl(&dword_225FBA000, v13, OS_LOG_TYPE_ERROR, "%s %{public}@ unable to parse defaults property list at %{public}@: %{public}@", buf, 0x2Au);
          }
        }
        id v9 = v11;
      }
      else
      {
        v12 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v19 = "-[SRUIFPreferences initWithDefaultsAtURL:]";
          __int16 v20 = 2114;
          v21 = v5;
          __int16 v22 = 2114;
          id v23 = v4;
          __int16 v24 = 2114;
          id v25 = v9;
          _os_log_error_impl(&dword_225FBA000, v12, OS_LOG_TYPE_ERROR, "%s %{public}@ unable to read defaults from %{public}@: %{public}@", buf, 0x2Au);
        }
      }
    }
  }

  return v5;
}

- (SRUIFPreferences)initWithDefaultsResource:(id)a3 withExtension:(id)a4 inBundle:(id)a5
{
  uint64_t v6 = [a5 URLForResource:a3 withExtension:a4];
  v7 = [(SRUIFPreferences *)self initWithDefaultsAtURL:v6];

  return v7;
}

- (SRUIFPreferences)init
{
  return [(SRUIFPreferences *)self initWithDefaultsAtURL:0];
}

- (int64_t)integerForKey:(id)a3
{
  return [(NSUserDefaults *)self->_userDefaults integerForKey:a3];
}

- (double)doubleForKey:(id)a3
{
  [(NSUserDefaults *)self->_userDefaults doubleForKey:a3];
  return result;
}

- (BOOL)BOOLForKey:(id)a3
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:a3];
}

- (id)stringForKey:(id)a3
{
  return [(NSUserDefaults *)self->_userDefaults stringForKey:a3];
}

- (id)objectForKey:(id)a3
{
  return [(NSUserDefaults *)self->_userDefaults objectForKey:a3];
}

- (void)_mutateValueForKey:(id)a3 block:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v8 = [(SRUIFPreferences *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = [(SRUIFPreferences *)self delegate];
      [v10 preferences:self didChangeValueForKey:v11];
    }
  }
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__SRUIFPreferences_setInteger_forKey___block_invoke;
  v8[3] = &unk_264785980;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  id v7 = v6;
  id v9 = v7;
  [(SRUIFPreferences *)self _mutateValueForKey:v7 block:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __38__SRUIFPreferences_setInteger_forKey___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[1] setInteger:*(void *)(a1 + 48) forKey:*(void *)(a1 + 32)];
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__SRUIFPreferences_setDouble_forKey___block_invoke;
  v8[3] = &unk_264785980;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)&a3;
  id v7 = v6;
  id v9 = v7;
  [(SRUIFPreferences *)self _mutateValueForKey:v7 block:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __37__SRUIFPreferences_setDouble_forKey___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[1] setDouble:*(void *)(a1 + 32) forKey:*(double *)(a1 + 48)];
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__SRUIFPreferences_setBool_forKey___block_invoke;
  v8[3] = &unk_2647859A8;
  objc_copyWeak(&v10, &location);
  BOOL v11 = a3;
  id v7 = v6;
  id v9 = v7;
  [(SRUIFPreferences *)self _mutateValueForKey:v7 block:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __35__SRUIFPreferences_setBool_forKey___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[1] setBool:*(unsigned __int8 *)(a1 + 48) forKey:*(void *)(a1 + 32)];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  id v10[2] = __37__SRUIFPreferences_setObject_forKey___block_invoke;
  v10[3] = &unk_2647859D0;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(SRUIFPreferences *)self _mutateValueForKey:v9 block:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __37__SRUIFPreferences_setObject_forKey___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained[1] setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

- (void)synchronize
{
}

- (SRUIFPreferencesDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRUIFPreferencesDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end