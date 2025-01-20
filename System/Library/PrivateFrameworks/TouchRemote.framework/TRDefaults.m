@interface TRDefaults
+ (BOOL)forceProxyAuth;
+ (double)getDoubleForKey:(id)a3 defaultValue:(double)a4;
+ (id)sharedDefaults;
+ (id)sharedInstance;
+ (int64_t)anisetteFetchTimeout;
+ (int64_t)getBoolForKey:(id)a3 defaultValue:(BOOL)a4;
+ (int64_t)getIntegerForKey:(id)a3 defaultValue:(int64_t)a4;
+ (void)setBoolForKey:(id)a3 newValue:(BOOL)a4;
- (NSUserDefaults)defaults;
- (TRDefaults)init;
- (void)setDefaults:(id)a3;
@end

@implementation TRDefaults

- (TRDefaults)init
{
  v6.receiver = self;
  v6.super_class = (Class)TRDefaults;
  v2 = [(TRDefaults *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.TouchRemote"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __28__TRDefaults_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_alloc_init(TRDefaults);
  return MEMORY[0x270F9A758]();
}

+ (id)sharedDefaults
{
  v2 = +[TRDefaults sharedInstance];
  uint64_t v3 = [v2 defaults];

  return v3;
}

+ (BOOL)forceProxyAuth
{
  return [a1 getBoolForKey:@"forceProxyAuth" defaultValue:0] != 0;
}

+ (int64_t)anisetteFetchTimeout
{
  return [a1 getIntegerForKey:@"anisetteFetchTimeout" defaultValue:0];
}

+ (int64_t)getIntegerForKey:(id)a3 defaultValue:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 sharedDefaults];
  v8 = [v7 objectForKey:v6];

  if (v8) {
    a4 = [v7 integerForKey:v6];
  }

  return a4;
}

+ (double)getDoubleForKey:(id)a3 defaultValue:(double)a4
{
  id v6 = a3;
  v7 = [a1 sharedDefaults];
  v8 = [v7 objectForKey:v6];

  if (v8)
  {
    [v7 doubleForKey:v6];
    a4 = v9;
  }

  return a4;
}

+ (int64_t)getBoolForKey:(id)a3 defaultValue:(BOOL)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  v7 = [a1 sharedDefaults];
  v8 = [v7 objectForKey:v6];

  if (v8) {
    unsigned int v4 = [v7 BOOLForKey:v6];
  }

  return v4;
}

+ (void)setBoolForKey:(id)a3 newValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [a1 sharedDefaults];
  [v7 setBool:v4 forKey:v6];
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
}

@end