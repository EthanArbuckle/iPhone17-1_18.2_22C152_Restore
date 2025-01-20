@interface SBUIExternalPreferences
+ (id)sharedInstance;
- (BOOL)keyboardPlaysSounds;
- (SBUIExternalPreferences)init;
- (void)setKeyboardPlaysSounds:(BOOL)a3;
@end

@implementation SBUIExternalPreferences

+ (id)sharedInstance
{
  if (sharedInstance___once_0 != -1) {
    dispatch_once(&sharedInstance___once_0, &__block_literal_global_45);
  }
  v2 = (void *)sharedInstance___instance;
  return v2;
}

uint64_t __41__SBUIExternalPreferences_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBUIExternalPreferences);
  uint64_t v1 = sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (SBUIExternalPreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBUIExternalPreferences;
  v2 = [(SBUIExternalPreferences *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.preferences.sounds"];
    soundDefaults = v2->_soundDefaults;
    v2->_soundDefaults = (NSUserDefaults *)v3;
  }
  return v2;
}

- (BOOL)keyboardPlaysSounds
{
  uint64_t v3 = [(NSUserDefaults *)self->_soundDefaults dictionaryRepresentation];
  v4 = [v3 allKeys];
  int v5 = [v4 containsObject:@"keyboard"];

  if (!v5) {
    return 1;
  }
  soundDefaults = self->_soundDefaults;
  return [(NSUserDefaults *)soundDefaults BOOLForKey:@"keyboard"];
}

- (void)setKeyboardPlaysSounds:(BOOL)a3
{
  self->_keyboardPlaysSounds = a3;
}

- (void).cxx_destruct
{
}

@end