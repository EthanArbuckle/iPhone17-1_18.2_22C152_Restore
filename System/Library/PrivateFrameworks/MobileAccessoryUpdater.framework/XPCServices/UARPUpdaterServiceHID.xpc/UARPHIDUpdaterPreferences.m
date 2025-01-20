@interface UARPHIDUpdaterPreferences
+ (id)sharedPrefs;
- (UARPHIDUpdaterPreferences)init;
- (unsigned)powerLogStagingWindowSecondsOverride;
@end

@implementation UARPHIDUpdaterPreferences

+ (id)sharedPrefs
{
  if (qword_10002F948 != -1) {
    dispatch_once(&qword_10002F948, &stru_100028880);
  }
  v2 = (void *)qword_10002F940;
  return v2;
}

- (UARPHIDUpdaterPreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)UARPHIDUpdaterPreferences;
  v2 = [(UARPHIDUpdaterPreferences *)&v6 init];
  if (v2)
  {
    v3 = (NSUserDefaults *)objc_alloc_init((Class)NSUserDefaults);
    defaults = v2->_defaults;
    v2->_defaults = v3;
  }
  return v2;
}

- (unsigned)powerLogStagingWindowSecondsOverride
{
  return [(NSUserDefaults *)self->_defaults integerForKey:@"powerLoggingStagingWindowSecondsOverride"];
}

- (void).cxx_destruct
{
}

@end