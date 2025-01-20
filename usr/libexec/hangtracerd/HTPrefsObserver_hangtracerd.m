@interface HTPrefsObserver_hangtracerd
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation HTPrefsObserver_hangtracerd

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a5;
  if (off_1000635A0 == a6)
  {
    id v9 = a3;
    v10 = NSStringFromSelector("memoryLoggingIntervalSec");
    unsigned int v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      v12 = [v8 objectForKeyedSubscript:NSKeyValueChangeOldKey];
      unsigned int v13 = [v12 unsignedIntValue];

      v14 = [v8 objectForKeyedSubscript:NSKeyValueChangeNewKey];
      unsigned int v15 = [v14 unsignedIntValue];

      if (v13 != v15)
      {
        sub_10000BA2C();
        v16 = sub_100027DEC();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = +[HTPrefs sharedPrefs];
          v18[0] = 67109376;
          v18[1] = v13;
          __int16 v19 = 1024;
          unsigned int v20 = [v17 memoryLoggingIntervalSec];
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "memoryLoggingInterval changed %u -> %u", (uint8_t *)v18, 0xEu);
        }
      }
    }
  }
}

@end