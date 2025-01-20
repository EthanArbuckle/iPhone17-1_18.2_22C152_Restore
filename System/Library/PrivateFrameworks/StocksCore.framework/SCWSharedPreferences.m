@interface SCWSharedPreferences
+ (id)sharedPreferences;
+ (void)clearSharedPreferences;
- (SCWSharedPreferences)init;
- (id)objectForKey:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)synchronize;
@end

@implementation SCWSharedPreferences

- (id)objectForKey:(id)a3
{
  return [(NSUserDefaults *)self->_sharedDefaults objectForKey:a3];
}

+ (id)sharedPreferences
{
  v2 = (void *)__sharedPreferences;
  if (!__sharedPreferences)
  {
    v3 = objc_alloc_init(SCWSharedPreferences);
    v4 = (void *)__sharedPreferences;
    __sharedPreferences = (uint64_t)v3;

    v2 = (void *)__sharedPreferences;
  }

  return v2;
}

- (SCWSharedPreferences)init
{
  v8.receiver = self;
  v8.super_class = (Class)SCWSharedPreferences;
  v2 = [(SCWSharedPreferences *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    v4 = [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.stocks"];

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CB18]) _initWithSuiteName:@"group.com.apple.stocks" container:v4];
    sharedDefaults = v2->_sharedDefaults;
    v2->_sharedDefaults = (NSUserDefaults *)v5;
  }
  return v2;
}

+ (void)clearSharedPreferences
{
  v2 = (void *)__sharedPreferences;
  __sharedPreferences = 0;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)synchronize
{
}

- (void)removeObjectForKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end