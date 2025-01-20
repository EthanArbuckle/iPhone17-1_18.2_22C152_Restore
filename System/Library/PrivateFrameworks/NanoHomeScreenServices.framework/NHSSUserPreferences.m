@interface NHSSUserPreferences
+ (NHSSUserPreferences)sharedInstance;
- (BOOL)rotationEnabled;
- (NHSSUserPreferences)init;
- (void)setRotationEnabled:(BOOL)a3;
@end

@implementation NHSSUserPreferences

+ (NHSSUserPreferences)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_instance;
  return (NHSSUserPreferences *)v2;
}

uint64_t __37__NHSSUserPreferences_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (NHSSUserPreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)NHSSUserPreferences;
  v2 = [(NHSSUserPreferences *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.NanoHomeScreen"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;
  }
  return v2;
}

- (void)setRotationEnabled:(BOOL)a3
{
}

- (BOOL)rotationEnabled
{
  uint64_t v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"RotationEnabled"];

  if (!v3) {
    return 1;
  }
  defaults = self->_defaults;
  return [(NSUserDefaults *)defaults BOOLForKey:@"RotationEnabled"];
}

- (void).cxx_destruct
{
}

@end