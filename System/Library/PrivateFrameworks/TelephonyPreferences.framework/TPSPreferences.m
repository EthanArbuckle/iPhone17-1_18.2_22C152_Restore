@interface TPSPreferences
+ (TPSPreferences)sharedInstance;
- (BOOL)BOOLForKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)showSubscriptionList;
- (NSString)domain;
- (TPSPreferences)init;
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
- (void)setUnsignedInteger:(unint64_t)a3 forKey:(id)a4;
@end

@implementation TPSPreferences

+ (TPSPreferences)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_sPreferences;
  return (TPSPreferences *)v2;
}

uint64_t __32__TPSPreferences_sharedInstance__block_invoke()
{
  sharedInstance_sPreferences = objc_alloc_init(TPSPreferences);
  return MEMORY[0x1F41817F8]();
}

- (TPSPreferences)init
{
  v7.receiver = self;
  v7.super_class = (Class)TPSPreferences;
  v2 = [(TPSPreferences *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v4 = [v3 bundleIdentifier];
    domain = v2->_domain;
    v2->_domain = (NSString *)v4;
  }
  return v2;
}

- (BOOL)showSubscriptionList
{
  v3 = NSStringFromSelector(sel_showSubscriptionList);
  LOBYTE(self) = [(TPSPreferences *)self BOOLForKey:v3 defaultValue:0];

  return (char)self;
}

- (id)preferencesValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [(TPSPreferences *)self domain];
  v6 = [(TPSPreferences *)self preferencesValueForKey:v4 domain:v5];

  return v6;
}

- (id)preferencesValueForKey:(id)a3 domain:(id)a4
{
  id v4 = (void *)CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  return v4;
}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TPSPreferences *)self domain];
  [(TPSPreferences *)self setPreferencesValue:v7 forKey:v6 domain:v8];
}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4 domain:(id)a5
{
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  applicationID = (__CFString *)a5;
  CFPreferencesSetValue((CFStringRef)a4, a3, applicationID, v8, v7);
  CFPreferencesSynchronize(applicationID, v8, v7);
}

- (BOOL)BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  v5 = [(TPSPreferences *)self numberForKey:a3 defaultValue:0];
  id v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(TPSPreferences *)self setNumber:v8 forKey:v7];
}

- (id)numberForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  id v7 = [(TPSPreferences *)self preferencesValueForKey:a3];
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  return v8;
}

- (int64_t)integerForKey:(id)a3 defaultValue:(int64_t)a4
{
  v5 = [(TPSPreferences *)self numberForKey:a3 defaultValue:0];
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
  [(TPSPreferences *)self setNumber:v8 forKey:v7];
}

- (unint64_t)unsignedIntegerForKey:(id)a3 defaultValue:(unint64_t)a4
{
  v5 = [(TPSPreferences *)self numberForKey:a3 defaultValue:0];
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
  [(TPSPreferences *)self setNumber:v8 forKey:v7];
}

- (id)stringForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  id v7 = [(TPSPreferences *)self preferencesValueForKey:a3];
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  return v8;
}

- (NSString)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
}

@end