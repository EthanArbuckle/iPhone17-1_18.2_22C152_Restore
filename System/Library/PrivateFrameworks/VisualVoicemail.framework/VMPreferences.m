@interface VMPreferences
+ (id)sharedInstance;
- (BOOL)BOOLForKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)transcriptionEnabled;
- (NSString)domain;
- (VMPreferences)init;
- (id)numberForKey:(id)a3 defaultValue:(id)a4;
- (id)preferencesValueForKey:(id)a3;
- (id)preferencesValueForKey:(id)a3 domain:(id)a4;
- (id)stringForKey:(id)a3 defaultValue:(id)a4;
- (int64_t)integerForKey:(id)a3 defaultValue:(int64_t)a4;
- (unint64_t)unsignedIntegerForKey:(id)a3 defaultValue:(unint64_t)a4;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setPreferencesValue:(id)a3 forKey:(id)a4;
- (void)setPreferencesValue:(id)a3 forKey:(id)a4 domain:(id)a5;
- (void)setTranscriptionEnabled:(BOOL)a3;
- (void)setUnsignedInteger:(unint64_t)a3 forKey:(id)a4;
@end

@implementation VMPreferences

- (BOOL)transcriptionEnabled
{
  v3 = NSStringFromSelector(sel_transcriptionEnabled);
  LOBYTE(self) = [(VMPreferences *)self BOOLForKey:v3 defaultValue:1];

  return (char)self;
}

- (BOOL)BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  v5 = [(VMPreferences *)self numberForKey:a3 defaultValue:0];
  v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (id)numberForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  v7 = [(VMPreferences *)self preferencesValueForKey:a3];
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  return v8;
}

- (id)preferencesValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [(VMPreferences *)self domain];
  id v6 = [(VMPreferences *)self preferencesValueForKey:v4 domain:v5];

  return v6;
}

- (id)preferencesValueForKey:(id)a3 domain:(id)a4
{
  id v4 = (void *)CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  return v4;
}

- (NSString)domain
{
  return self->_domain;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_sPreferences;
  return v2;
}

- (void)setTranscriptionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  NSStringFromSelector(sel_transcriptionEnabled);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(VMPreferences *)self setBool:v3 forKey:v5];
}

uint64_t __31__VMPreferences_sharedInstance__block_invoke()
{
  sharedInstance_sPreferences = objc_alloc_init(VMPreferences);
  return MEMORY[0x270F9A758]();
}

- (VMPreferences)init
{
  v9.receiver = self;
  v9.super_class = (Class)VMPreferences;
  v2 = [(VMPreferences *)&v9 init];
  if (v2)
  {
    BOOL v3 = NSString;
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 bundleIdentifier];
    uint64_t v6 = [v3 stringWithFormat:@"%@.preferences", v5];
    domain = v2->_domain;
    v2->_domain = (NSString *)v6;
  }
  return v2;
}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VMPreferences *)self domain];
  [(VMPreferences *)self setPreferencesValue:v7 forKey:v6 domain:v8];
}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4 domain:(id)a5
{
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263EFFE68];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE70];
  applicationID = (__CFString *)a5;
  CFPreferencesSetValue((CFStringRef)a4, a3, applicationID, v8, v7);
  CFPreferencesSynchronize(applicationID, v8, v7);
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(VMPreferences *)self setNumber:v8 forKey:v7];
}

- (int64_t)integerForKey:(id)a3 defaultValue:(int64_t)a4
{
  id v5 = [(VMPreferences *)self numberForKey:a3 defaultValue:0];
  id v6 = v5;
  if (v5) {
    a4 = [v5 integerValue];
  }

  return a4;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [(VMPreferences *)self setNumber:v8 forKey:v7];
}

- (unint64_t)unsignedIntegerForKey:(id)a3 defaultValue:(unint64_t)a4
{
  id v5 = [(VMPreferences *)self numberForKey:a3 defaultValue:0];
  id v6 = v5;
  if (v5) {
    a4 = [v5 unsignedIntegerValue];
  }

  return a4;
}

- (void)setUnsignedInteger:(unint64_t)a3 forKey:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithUnsignedInteger:a3];
  [(VMPreferences *)self setNumber:v8 forKey:v7];
}

- (id)stringForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  id v7 = [(VMPreferences *)self preferencesValueForKey:a3];
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  return v8;
}

- (void).cxx_destruct
{
}

@end