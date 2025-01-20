@interface CSPersistentConfiguration
+ (id)configBaseKey:(const char *)a3 forFeatureMode:(unsigned __int8)a4;
+ (id)sharedConfiguration;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)BOOLThreshold:(const CSSafetyDefault *)a3 forKey:(id)a4;
- (BOOL)algorithmBoolNumber:(unint64_t)a3 inArrayForKey:(id)a4 defaultValue:(BOOL)a5;
- (BOOL)isKeyInServerDefaults:(id)a3;
- (BOOL)isKeyInUserDefaults:(id)a3;
- (CSPersistentConfiguration)init;
- (double)doubleForKey:(id)a3;
- (float)algorithmThresholdNumber:(unint64_t)a3 inArrayForKey:(id)a4 withMinValue:(float)a5 maxValue:(float)a6 defaultValue:(float)a7;
- (float)floatForKey:(id)a3;
- (float)floatThreshold:(const CSSafetyDefault *)a3 forKey:(id)a4;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)isKeyInServerDefaultsWithVersion:(id)a3;
- (id)objectForKey:(id)a3;
- (id)serverConfigurationToUse:(id)a3;
- (int)algorithmIntegerNumber:(unint64_t)a3 inArrayForKey:(id)a4 withMinValue:(int)a5 maxValue:(int)a6 defaultValue:(int)a7;
- (int)intThreshold:(const CSSafetyDefault *)a3 forKey:(id)a4;
- (int64_t)integerForKey:(id)a3;
- (optional<BOOL>)getBooleanDefault:(id)a3;
- (optional<float>)getFloatDefault:(id)a3;
- (optional<int>)getIntegerDefault:(id)a3;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)onConfigurationUpdate:(id)a3;
- (void)runAllConfigurationUpdateCallbacks;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setDouble:(double)a3 forKey:(id)a4;
- (void)setFloat:(float)a3 forKey:(id)a4;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)stopRecurringDownload;
@end

@implementation CSPersistentConfiguration

- (CSPersistentConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSPersistentConfiguration;
  v2 = [(CSPersistentConfiguration *)&v8 init];
  v3 = v2;
  if (v2)
  {
    urlSession = v2->_urlSession;
    v2->_urlSession = 0;

    *(_WORD *)&v3->_configurationDownloadInProgress = 0;
    v3->_recurrentDownloadPeriod = 0;
    uint64_t v5 = objc_opt_new();
    configurationUpdateCallbacks = v3->_configurationUpdateCallbacks;
    v3->_configurationUpdateCallbacks = (NSMutableArray *)v5;
  }
  return v3;
}

+ (id)sharedConfiguration
{
  if (qword_1003DD828 != -1) {
    dispatch_once(&qword_1003DD828, &stru_1003BB1F8);
  }
  v2 = (void *)qword_1003DD830;

  return v2;
}

+ (id)configBaseKey:(const char *)a3 forFeatureMode:(unsigned __int8)a4
{
  if (a4 != 1)
  {
    int v5 = a4;
    if (a4 == 2)
    {
      v6 = @"Marty";
      goto LABEL_9;
    }
    if (qword_1003DB6A0 != -1) {
      dispatch_once(&qword_1003DB6A0, &stru_1003BB240);
    }
    v7 = qword_1003DB6A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6A8, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Missing config prefix for %d", (uint8_t *)v11, 8u);
    }
  }
  v6 = &stru_1003BC4E8;
LABEL_9:
  id v8 = [objc_alloc((Class)NSString) initWithCString:a3 encoding:1];
  v9 = [(__CFString *)v6 stringByAppendingString:v8];

  return v9;
}

- (void)stopRecurringDownload
{
  self->_recurrentDownloadEnabled = 0;
  self->_recurrentDownloadPeriod = 0;
}

- (void)onConfigurationUpdate:(id)a3
{
  configurationUpdateCallbacks = self->_configurationUpdateCallbacks;
  id v4 = objc_retainBlock(a3);
  -[NSMutableArray addObject:](configurationUpdateCallbacks, "addObject:");
}

- (void)runAllConfigurationUpdateCallbacks
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = self->_configurationUpdateCallbacks;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      int v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * (void)v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * (void)v5));
        int v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)isKeyInServerDefaultsWithVersion:(id)a3
{
  id v3 = +[CSPlatformInfo sharedInstance];
  uint64_t v4 = [v3 getSystemVersionDescriptionNoBuild];
  id v5 = [v4 mutableCopy];

  [v5 replaceOccurrencesOfString:@" " withString:&stru_1003BC4E8 options:0 range:[v5 length]];
  long long v6 = +[NSUserDefaults standardUserDefaults];
  long long v7 = [v6 dictionaryForKey:@"CLPersistentConfigurationServerDefaults"];

  long long v8 = [v7 objectForKeyedSubscript:@"ConfigLookup"];
  long long v9 = [v7 objectForKey:@"ConfigLookup"];

  if (v9)
  {
    [v8 allKeys];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(id *)(*((void *)&v21 + 1) + 8 * i);
          v15 = [v8 objectForKeyedSubscript:v14];
          if ([v14 isEqualToString:v5])
          {
            v17 = [v7 objectForKey:v15];
            BOOL v18 = v17 == 0;

            if (v18)
            {
              id v19 = v7;
            }
            else
            {
              id v19 = [v7 objectForKeyedSubscript:v15];
            }
            id v16 = v19;

            goto LABEL_16;
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  id v16 = v7;
LABEL_16:

  return v16;
}

- (BOOL)isKeyInServerDefaults:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 dictionaryForKey:@"CLPersistentConfigurationServerDefaults"];

  long long v6 = [v5 objectForKey:v3];
  LOBYTE(v4) = v6 != 0;

  return (char)v4;
}

- (BOOL)isKeyInUserDefaults:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 objectForKey:v3];
  BOOL v6 = v5 != 0;

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  long long v7 = +[NSUserDefaults standardUserDefaults];
  [v7 setObject:v8 forKey:v6];

  [(CSPersistentConfiguration *)self runAllConfigurationUpdateCallbacks];
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v7 = a4;
  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 setInteger:a3 forKey:v7];

  [(CSPersistentConfiguration *)self runAllConfigurationUpdateCallbacks];
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  id v7 = a4;
  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 setDouble:v7 forKey:a3];

  [(CSPersistentConfiguration *)self runAllConfigurationUpdateCallbacks];
}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  id v8 = a4;
  id v6 = +[NSUserDefaults standardUserDefaults];
  *(float *)&double v7 = a3;
  [v6 setFloat:v8 forKey:v7];

  [(CSPersistentConfiguration *)self runAllConfigurationUpdateCallbacks];
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 setBool:v4 forKey:v7];

  [(CSPersistentConfiguration *)self runAllConfigurationUpdateCallbacks];
}

- (id)serverConfigurationToUse:(id)a3
{
  id v3 = [(CSPersistentConfiguration *)self isKeyInServerDefaultsWithVersion:a3];

  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  if ([(CSPersistentConfiguration *)self isKeyInUserDefaults:v4])
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    uint64_t v6 = [v5 objectForKey:v4];
LABEL_5:
    id v8 = (void *)v6;
    goto LABEL_6;
  }
  id v7 = [(CSPersistentConfiguration *)self serverConfigurationToUse:v4];
  id v5 = v7;
  if (v7)
  {
    uint64_t v6 = [v7 objectForKey:v4];
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_6:

  return v8;
}

- (int64_t)integerForKey:(id)a3
{
  id v4 = a3;
  if ([(CSPersistentConfiguration *)self isKeyInUserDefaults:v4])
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    id v6 = [v5 integerForKey:v4];
  }
  else
  {
    id v7 = [(CSPersistentConfiguration *)self serverConfigurationToUse:v4];
    id v5 = v7;
    if (v7)
    {
      id v8 = [v7 objectForKey:v4];
      id v6 = [v8 integerValue];
    }
    else
    {
      id v6 = 0;
    }
  }

  return (int64_t)v6;
}

- (double)doubleForKey:(id)a3
{
  id v4 = a3;
  if ([(CSPersistentConfiguration *)self isKeyInUserDefaults:v4])
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    [v5 doubleForKey:v4];
    double v7 = v6;
  }
  else
  {
    id v8 = [(CSPersistentConfiguration *)self serverConfigurationToUse:v4];
    id v5 = v8;
    if (v8)
    {
      long long v9 = [v8 objectForKey:v4];
      [v9 doubleValue];
      double v7 = v10;
    }
    else
    {
      double v7 = 0.0;
    }
  }

  return v7;
}

- (float)floatForKey:(id)a3
{
  id v4 = a3;
  if ([(CSPersistentConfiguration *)self isKeyInUserDefaults:v4])
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    [v5 floatForKey:v4];
    float v7 = v6;
  }
  else
  {
    id v8 = [(CSPersistentConfiguration *)self serverConfigurationToUse:v4];
    id v5 = v8;
    if (v8)
    {
      long long v9 = [v8 objectForKey:v4];
      [v9 floatValue];
      float v7 = v10;
    }
    else
    {
      float v7 = 0.0;
    }
  }

  return v7;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  if ([(CSPersistentConfiguration *)self isKeyInUserDefaults:v4])
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v6 = [v5 BOOLForKey:v4];
  }
  else
  {
    float v7 = [(CSPersistentConfiguration *)self serverConfigurationToUse:v4];
    id v5 = v7;
    if (v7)
    {
      id v8 = [v7 objectForKey:v4];
      unsigned __int8 v6 = [v8 BOOLValue];
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }

  return v6;
}

- (id)dictionaryForKey:(id)a3
{
  id v3 = [(CSPersistentConfiguration *)self objectForKey:a3];

  return v3;
}

- (id)arrayForKey:(id)a3
{
  id v3 = [(CSPersistentConfiguration *)self objectForKey:a3];

  return v3;
}

- (float)algorithmThresholdNumber:(unint64_t)a3 inArrayForKey:(id)a4 withMinValue:(float)a5 maxValue:(float)a6 defaultValue:(float)a7
{
  id v12 = a4;
  v13 = [v12 stringByAppendingFormat:@"%lu", a3];
  if ([(CSPersistentConfiguration *)self isKeyInUserDefaults:v13]
    && ([(CSPersistentConfiguration *)self floatForKey:v13], v14 > a5)
    && ([(CSPersistentConfiguration *)self floatForKey:v13], v15 < a6))
  {
    [(CSPersistentConfiguration *)self floatForKey:v13];
    a7 = v16;
  }
  else
  {
    v17 = [(CSPersistentConfiguration *)self arrayForKey:v12];
    if (v17)
    {
      BOOL v18 = [(CSPersistentConfiguration *)self arrayForKey:v12];
      id v19 = [v18 count];

      if ((unint64_t)v19 > a3)
      {
        v20 = [(CSPersistentConfiguration *)self arrayForKey:v12];
        long long v21 = [v20 objectAtIndex:a3];

        if (v21)
        {
          [v21 floatValue];
          if (v22 > a5)
          {
            [v21 floatValue];
            if (v23 < a6)
            {
              [v21 floatValue];
              a7 = v24;
            }
          }
        }
      }
    }
  }

  return a7;
}

- (int)algorithmIntegerNumber:(unint64_t)a3 inArrayForKey:(id)a4 withMinValue:(int)a5 maxValue:(int)a6 defaultValue:(int)a7
{
  id v12 = a4;
  v13 = [v12 stringByAppendingFormat:@"%lu", a3];
  if ([(CSPersistentConfiguration *)self isKeyInUserDefaults:v13]
    && [(CSPersistentConfiguration *)self integerForKey:v13] > a5
    && [(CSPersistentConfiguration *)self integerForKey:v13] < a6)
  {
    a7 = [(CSPersistentConfiguration *)self integerForKey:v13];
  }
  else
  {
    *(float *)&double v14 = (float)a5;
    *(float *)&double v15 = (float)a6;
    *(float *)&double v16 = (float)a7;
    [(CSPersistentConfiguration *)self algorithmThresholdNumber:a3 inArrayForKey:v12 withMinValue:v14 maxValue:v15 defaultValue:v16];
    float v18 = v17;
    if (modff(v17, &v21) >= 0.1)
    {
      if (qword_1003DB7C0 != -1) {
        dispatch_once(&qword_1003DB7C0, &stru_1003BB260);
      }
      id v19 = qword_1003DB7C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB7C8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v23 = v12;
        __int16 v24 = 2048;
        unint64_t v25 = a3;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@ server configuration key has invalid integer at position %lu", buf, 0x16u);
      }
    }
    else
    {
      a7 = llroundf(v18);
    }
  }

  return a7;
}

- (BOOL)algorithmBoolNumber:(unint64_t)a3 inArrayForKey:(id)a4 defaultValue:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  long long v9 = [v8 stringByAppendingFormat:@"%lu", a3];
  if ([(CSPersistentConfiguration *)self isKeyInUserDefaults:v9])
  {
    unsigned __int8 v12 = [(CSPersistentConfiguration *)self BOOLForKey:v9];
  }
  else
  {
    if (v5) {
      *(float *)&double v11 = 1.0;
    }
    else {
      *(float *)&double v11 = 0.0;
    }
    LODWORD(v10) = 2.0;
    [(CSPersistentConfiguration *)self algorithmThresholdNumber:a3 inArrayForKey:v8 withMinValue:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(-1.0)) maxValue:v10 defaultValue:v11];
    unsigned __int8 v12 = v13 != 0.0;
  }

  return v12;
}

- (float)floatThreshold:(const CSSafetyDefault *)a3 forKey:(id)a4
{
  *(float *)&double v4 = a3->var2;
  *(float *)&double v5 = a3->var3;
  *(float *)&double v6 = a3->var1;
  [(CSPersistentConfiguration *)self algorithmThresholdNumber:a3->var0 inArrayForKey:a4 withMinValue:v4 maxValue:v5 defaultValue:v6];
  return result;
}

- (int)intThreshold:(const CSSafetyDefault *)a3 forKey:(id)a4
{
  return [(CSPersistentConfiguration *)self algorithmIntegerNumber:a3->var0 inArrayForKey:a4 withMinValue:(int)a3->var2 maxValue:(int)a3->var3 defaultValue:(int)a3->var1];
}

- (BOOL)BOOLThreshold:(const CSSafetyDefault *)a3 forKey:(id)a4
{
  return [(CSPersistentConfiguration *)self algorithmBoolNumber:a3->var0 inArrayForKey:a4 defaultValue:a3->var1 != 0.0];
}

- (optional<int>)getIntegerDefault:(id)a3
{
  id v4 = a3;
  double v5 = [(CSPersistentConfiguration *)self objectForKey:v4];
  if (v5)
  {
    unsigned int v6 = [(CSPersistentConfiguration *)self integerForKey:v4];
    uint64_t v7 = v6 & 0xFFFFFF00;
    uint64_t v8 = v6;
    long long v9 = &_mh_execute_header;
  }
  else
  {
    if (qword_1003DB7C0 != -1) {
      dispatch_once(&qword_1003DB7C0, &stru_1003BB260);
    }
    double v10 = qword_1003DB7C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7C8, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "default not found for %@", (uint8_t *)&v12, 0xCu);
    }
    long long v9 = 0;
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }

  return (optional<int>)(v8 | (unint64_t)v9 | v7);
}

- (optional<float>)getFloatDefault:(id)a3
{
  id v4 = a3;
  double v5 = [(CSPersistentConfiguration *)self objectForKey:v4];
  if (v5)
  {
    [(CSPersistentConfiguration *)self floatForKey:v4];
    uint64_t v7 = v6 & 0xFFFFFF00;
    uint64_t v8 = v6;
    long long v9 = &_mh_execute_header;
  }
  else
  {
    uint64_t v8 = 0;
    long long v9 = 0;
    uint64_t v7 = 0;
  }

  return (optional<float>)((unint64_t)v9 | v8 | v7);
}

- (optional<BOOL>)getBooleanDefault:(id)a3
{
  id v4 = a3;
  double v5 = [(CSPersistentConfiguration *)self objectForKey:v4];
  if (v5)
  {
    unsigned __int16 v6 = [(CSPersistentConfiguration *)self BOOLForKey:v4];
    __int16 v7 = 1;
  }
  else
  {
    __int16 v7 = 0;
    unsigned __int16 v6 = 0;
  }

  return (optional<BOOL>)(v6 | (v7 << 8));
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v6 = a5;
  urlSession = self->_urlSession;
  if (v6)
  {
    [(NSURLSession *)urlSession invalidateAndCancel];
    if (qword_1003DB7C0 != -1) {
      dispatch_once(&qword_1003DB7C0, &stru_1003BB260);
    }
    uint64_t v8 = qword_1003DB7C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7C8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "completed with error %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    [(NSURLSession *)urlSession finishTasksAndInvalidate];
  }
  long long v9 = self->_urlSession;
  self->_urlSession = 0;

  self->_configurationDownloadInProgress = 0;
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v6 = a5;
  __int16 v7 = +[NSData dataWithContentsOfURL:v6];
  if (v7)
  {
    id v22 = 0;
    uint64_t v8 = +[NSJSONSerialization JSONObjectWithData:v7 options:1 error:&v22];
    id v9 = v22;
    if (v9)
    {
      if (qword_1003DB7C0 != -1) {
        dispatch_once(&qword_1003DB7C0, &stru_1003BB260);
      }
      int v10 = qword_1003DB7C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB7C8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "couldn't decode server configuration: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (qword_1003DB7C0 != -1) {
        dispatch_once(&qword_1003DB7C0, &stru_1003BB260);
      }
      int v12 = qword_1003DB7C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB7C8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "server configuration: %@{public}@", buf, 0xCu);
      }
      id v13 = +[NSUserDefaults standardUserDefaults];
      double v14 = [v13 dictionaryForKey:@"CLPersistentConfigurationServerDefaults"];

      if (qword_1003DB7C0 != -1) {
        dispatch_once(&qword_1003DB7C0, &stru_1003BB260);
      }
      double v15 = qword_1003DB7C8;
      if (os_log_type_enabled((os_log_t)qword_1003DB7C8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Updating local configuration", buf, 2u);
      }
      double v16 = +[NSUserDefaults standardUserDefaults];
      [v16 setObject:v8 forKey:@"CLPersistentConfigurationServerDefaults"];

      [(CSPersistentConfiguration *)self runAllConfigurationUpdateCallbacks];
      if (self->_recurrentDownloadEnabled)
      {
        objc_initWeak((id *)buf, self);
        float v17 = (const char *)[@"com.apple.anomalydetectiond.CSPersistentConfiguration" UTF8String];
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_100323D28;
        handler[3] = &unk_1003BB220;
        objc_copyWeak(&v21, (id *)buf);
        id v20 = v14;
        xpc_activity_register(v17, XPC_ACTIVITY_CHECK_IN, handler);

        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
      }
    }
    [(NSURLSession *)self->_urlSession finishTasksAndInvalidate];
    urlSession = self->_urlSession;
    self->_urlSession = 0;

    self->_configurationDownloadInProgress = 0;
  }
  else
  {
    if (qword_1003DB7C0 != -1) {
      dispatch_once(&qword_1003DB7C0, &stru_1003BB260);
    }
    id v11 = qword_1003DB7C8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7C8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Couldn't get data from downloaded file, check sandbox violations", buf, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationUpdateCallbacks, 0);

  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end