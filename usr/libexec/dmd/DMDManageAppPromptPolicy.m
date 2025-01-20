@interface DMDManageAppPromptPolicy
+ (double)promptWindowInterval;
+ (id)timestampsKey;
+ (int64_t)promptsAllowedBeforeAutomaticDenial;
- (BOOL)isPromptAllowedRightNow;
- (DMDManageAppPromptPolicy)init;
- (NSArray)promptTimestamps;
- (NSDate)overrideDate;
- (double)promptResetTimeInterval;
- (id)_now;
- (id)_timestampDataForWritingToFile;
- (id)_timestampDictionaryForWritingToFile;
- (int64_t)promptsAllowed;
- (void)_removePromptTimestampsOutsideIntervalEnding:(id)a3;
- (void)readTimestampsFromFile;
- (void)recordNewPrompt;
- (void)setOverrideDate:(id)a3;
- (void)setPromptTimestamps:(id)a3;
- (void)writeTimestampsToFile;
@end

@implementation DMDManageAppPromptPolicy

+ (id)timestampsKey
{
  return @"PromptTimestamps";
}

+ (int64_t)promptsAllowedBeforeAutomaticDenial
{
  if (!+[DMDFeatureFlags isAppleInternal]) {
    return 3;
  }
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"DMDMaxManagementDenialsBeforeAutomaticRefusal"];

  if (v3) {
    int64_t v4 = (int64_t)[v2 integerForKey:@"DMDMaxManagementDenialsBeforeAutomaticRefusal"];
  }
  else {
    int64_t v4 = 3;
  }

  return v4;
}

+ (double)promptWindowInterval
{
  if (!+[DMDFeatureFlags isAppleInternal]) {
    return 86400.0;
  }
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"DMDManagementPromptWindowMinutes"];

  if (v3) {
    double v4 = (double)(uint64_t)[v2 integerForKey:@"DMDManagementPromptWindowMinutes"] * 60.0;
  }
  else {
    double v4 = 86400.0;
  }

  return v4;
}

- (DMDManageAppPromptPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)DMDManageAppPromptPolicy;
  v2 = [(DMDManageAppPromptPolicy *)&v8 init];
  v3 = v2;
  if (v2)
  {
    promptTimestamps = v2->_promptTimestamps;
    v2->_promptTimestamps = (NSArray *)&__NSArray0__struct;

    v3->_promptsAllowed = +[DMDManageAppPromptPolicy promptsAllowedBeforeAutomaticDenial];
    +[DMDManageAppPromptPolicy promptWindowInterval];
    v3->_promptResetTimeInterval = v5;
    overrideDate = v3->_overrideDate;
    v3->_overrideDate = 0;
  }
  return v3;
}

- (BOOL)isPromptAllowedRightNow
{
  v2 = self;
  v3 = [(DMDManageAppPromptPolicy *)self _now];
  [(DMDManageAppPromptPolicy *)v2 _removePromptTimestampsOutsideIntervalEnding:v3];
  double v4 = [(DMDManageAppPromptPolicy *)v2 promptTimestamps];
  id v5 = [v4 count];
  LOBYTE(v2) = v5 < (id)[(DMDManageAppPromptPolicy *)v2 promptsAllowed];

  return (char)v2;
}

- (void)recordNewPrompt
{
  id v5 = [(DMDManageAppPromptPolicy *)self _now];
  v3 = [(DMDManageAppPromptPolicy *)self promptTimestamps];
  double v4 = [v3 arrayByAddingObject:v5];
  [(DMDManageAppPromptPolicy *)self setPromptTimestamps:v4];

  [(DMDManageAppPromptPolicy *)self _removePromptTimestampsOutsideIntervalEnding:v5];
}

- (id)_now
{
  v2 = [(DMDManageAppPromptPolicy *)self overrideDate];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[NSDate date];
  }
  id v5 = v4;

  return v5;
}

- (void)_removePromptTimestampsOutsideIntervalEnding:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(DMDManageAppPromptPolicy *)self promptTimestamps];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        [v4 timeIntervalSinceDate:v11];
        if (v12 >= 0.0)
        {
          double v13 = v12;
          [(DMDManageAppPromptPolicy *)self promptResetTimeInterval];
          if (v13 <= v14) {
            [v5 addObject:v11];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v15 = [v5 copy];
  [(DMDManageAppPromptPolicy *)self setPromptTimestamps:v15];
}

- (void)readTimestampsFromFile
{
  v3 = +[DMDPaths managementPromptPolicyPath];
  id v4 = +[NSDictionary dictionaryWithContentsOfFile:v3];

  if (!v4
    || ([(id)objc_opt_class() timestampsKey],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:v5],
        id v7 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        (v6 = v7) == 0))
  {
    v6 = &__NSArray0__struct;
  }
  id v8 = v6;
  [(DMDManageAppPromptPolicy *)self setPromptTimestamps:v6];
}

- (void)writeTimestampsToFile
{
  v2 = [(DMDManageAppPromptPolicy *)self _timestampDataForWritingToFile];
  if (v2)
  {
    v3 = +[DMDPaths managementPromptPolicyPath];
    id v7 = 0;
    unsigned __int8 v4 = [v2 writeToFile:v3 options:1 error:&v7];
    id v5 = v7;

    if ((v4 & 1) == 0)
    {
      v6 = DMFAppLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000855B4((uint64_t)v5, v6);
      }
    }
  }
}

- (id)_timestampDataForWritingToFile
{
  v2 = [(DMDManageAppPromptPolicy *)self _timestampDictionaryForWritingToFile];
  id v7 = 0;
  v3 = +[NSPropertyListSerialization dataWithPropertyList:v2 format:200 options:0 error:&v7];
  id v4 = v7;
  if (!v3)
  {
    id v5 = DMFAppLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10008562C((uint64_t)v4, v5);
    }
  }

  return v3;
}

- (id)_timestampDictionaryForWritingToFile
{
  v3 = objc_opt_new();
  id v4 = [(DMDManageAppPromptPolicy *)self promptTimestamps];
  id v5 = [(id)objc_opt_class() timestampsKey];
  [v3 setObject:v4 forKeyedSubscript:v5];

  id v6 = [v3 copy];

  return v6;
}

- (NSArray)promptTimestamps
{
  return self->_promptTimestamps;
}

- (void)setPromptTimestamps:(id)a3
{
}

- (int64_t)promptsAllowed
{
  return self->_promptsAllowed;
}

- (double)promptResetTimeInterval
{
  return self->_promptResetTimeInterval;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);

  objc_storeStrong((id *)&self->_promptTimestamps, 0);
}

@end