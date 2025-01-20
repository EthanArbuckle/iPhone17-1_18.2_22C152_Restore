@interface ULDefaultsSingleton
+ (id)shared;
- (NSDictionary)defaultsDictionary;
- (NSUserDefaults)defaults;
- (ULDefaultsSingleton)init;
- (id)settingsString;
- (void)_defaultsSync;
- (void)resetTemporaryKey:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDefaultsDictionary:(id)a3;
- (void)updateTemporaryKey:(id)a3 withObject:(id)a4;
@end

@implementation ULDefaultsSingleton

- (NSDictionary)defaultsDictionary
{
  return self->_defaultsDictionary;
}

+ (id)shared
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__ULDefaultsSingleton_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_ul_once_token_0 != -1) {
    dispatch_once(&shared_ul_once_token_0, block);
  }
  v2 = (void *)shared_ul_once_object_0;
  return v2;
}

void __29__ULDefaultsSingleton_shared__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)shared_ul_once_object_0;
  shared_ul_once_object_0 = (uint64_t)v1;
}

- (ULDefaultsSingleton)init
{
  v5.receiver = self;
  v5.super_class = (Class)ULDefaultsSingleton;
  v2 = [(ULDefaultsSingleton *)&v5 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.milod"];
    [(ULDefaultsSingleton *)v2 setDefaults:v3];

    [(ULDefaultsSingleton *)v2 refresh];
  }
  return v2;
}

- (id)settingsString
{
  v3 = objc_opt_new();
  v4 = [(ULDefaultsSingleton *)self defaultsDictionary];
  objc_super v5 = [v4 allKeys];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__ULDefaultsSingleton_settingsString__block_invoke;
  v9[3] = &unk_2653F9758;
  id v10 = v3;
  v11 = self;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v9];

  v7 = [NSString stringWithFormat:@"ULSettingsOverrides:%@", v6];

  return v7;
}

void __37__ULDefaultsSingleton_settingsString__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 hasPrefix:@"UL"])
  {
    v3 = NSString;
    v4 = *(void **)(a1 + 32);
    objc_super v5 = [*(id *)(a1 + 40) defaultsDictionary];
    id v6 = [v5 objectForKeyedSubscript:v8];
    v7 = [v3 stringWithFormat:@"   %@:%@", v8, v6];
    [v4 addObject:v7];
  }
}

- (void)updateTemporaryKey:(id)a3 withObject:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  id v8 = a3;
  v9 = [(ULDefaultsSingleton *)self defaultsDictionary];
  id v12 = [v6 dictionaryWithDictionary:v9];

  id v10 = [@"UL" stringByAppendingString:v8];

  [v12 setObject:v7 forKey:v10];
  v11 = (void *)[v12 copy];
  [(ULDefaultsSingleton *)self setDefaultsDictionary:v11];
}

- (void)resetTemporaryKey:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = [(ULDefaultsSingleton *)self defaultsDictionary];
  id v9 = [v4 dictionaryWithDictionary:v6];

  id v7 = [@"UL" stringByAppendingString:v5];

  [v9 removeObjectForKey:v7];
  id v8 = (void *)[v9 copy];
  [(ULDefaultsSingleton *)self setDefaultsDictionary:v8];
}

- (void)_defaultsSync
{
  id v5 = [(ULDefaultsSingleton *)self defaults];
  v3 = [v5 dictionaryRepresentation];
  v4 = (void *)[v3 copy];
  [(ULDefaultsSingleton *)self setDefaultsDictionary:v4];
}

- (void)setDefaultsDictionary:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_defaultsDictionary, 0);
}

@end