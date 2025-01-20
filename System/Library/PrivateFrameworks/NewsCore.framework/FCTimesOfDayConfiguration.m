@interface FCTimesOfDayConfiguration
+ (id)defaultConfiguration;
- (FCTimeOfDayConfiguration)afternoonTimeOfDayConfiguration;
- (FCTimeOfDayConfiguration)eveningTimeOfDayConfiguration;
- (FCTimeOfDayConfiguration)morningTimeOfDayConfiguration;
- (FCTimeOfDayConfiguration)nightTimeOfDayConfiguration;
- (FCTimesOfDayConfiguration)initWithDictionary:(id)a3;
@end

@implementation FCTimesOfDayConfiguration

- (FCTimeOfDayConfiguration)morningTimeOfDayConfiguration
{
  return self->_morningTimeOfDayConfiguration;
}

- (FCTimeOfDayConfiguration)afternoonTimeOfDayConfiguration
{
  return self->_afternoonTimeOfDayConfiguration;
}

- (FCTimesOfDayConfiguration)initWithDictionary:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)FCTimesOfDayConfiguration;
  v5 = [(FCTimesOfDayConfiguration *)&v24 init];
  if (v5)
  {
    uint64_t v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"morning", 0);
    uint64_t v7 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"afternoon", 0);
    uint64_t v8 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"evening", 0);
    uint64_t v9 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"night", 0);
    v10 = (void *)v6;
    v11 = [[FCTimeOfDayConfiguration alloc] initWithDictionary:v6];
    v12 = (void *)v7;
    v13 = [[FCTimeOfDayConfiguration alloc] initWithDictionary:v7];
    v14 = (void *)v8;
    v15 = [[FCTimeOfDayConfiguration alloc] initWithDictionary:v8];
    v23 = (void *)v9;
    v16 = [[FCTimeOfDayConfiguration alloc] initWithDictionary:v9];
    v17 = v16;
    if (v11 && v13 && v15 && v16)
    {
      objc_storeStrong((id *)&v5->_morningTimeOfDayConfiguration, v11);
      objc_storeStrong((id *)&v5->_afternoonTimeOfDayConfiguration, v13);
      objc_storeStrong((id *)&v5->_eveningTimeOfDayConfiguration, v15);
      objc_storeStrong((id *)&v5->_nightTimeOfDayConfiguration, v17);
      v18 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v26 = v11;
        __int16 v27 = 2114;
        v28 = v13;
        __int16 v29 = 2114;
        v30 = v15;
        __int16 v31 = 2114;
        v32 = v17;
        _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEFAULT, "Parsed a times of day configuration with morning: %{public}@, afternoon: %{public}@, evening: %{public}@ and night: %{public}@", buf, 0x2Au);
      }
      goto LABEL_21;
    }
    if (v11)
    {
      if (v13)
      {
        v19 = FCDefaultLog;
        BOOL v20 = os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT);
        if (v15)
        {
          if (v20)
          {
            *(_DWORD *)buf = 138543362;
            v26 = v17;
            v21 = "Invalid night time of day configuration in %{public}@";
LABEL_19:
            _os_log_impl(&dword_1A460D000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
          }
        }
        else if (v20)
        {
          *(_DWORD *)buf = 138543362;
          v26 = 0;
          v21 = "Invalid evening time of day configuration in %{public}@";
          goto LABEL_19;
        }
      }
      else
      {
        v19 = FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v26 = 0;
          v21 = "Invalid afternoon time of day configuration in %{public}@";
          goto LABEL_19;
        }
      }
    }
    else
    {
      v19 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v26 = 0;
        v21 = "Invalid morning time of day configuration in %{public}@";
        goto LABEL_19;
      }
    }

    v5 = 0;
LABEL_21:
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nightTimeOfDayConfiguration, 0);
  objc_storeStrong((id *)&self->_eveningTimeOfDayConfiguration, 0);
  objc_storeStrong((id *)&self->_afternoonTimeOfDayConfiguration, 0);
  objc_storeStrong((id *)&self->_morningTimeOfDayConfiguration, 0);
}

+ (id)defaultConfiguration
{
  v2 = [[FCTimesOfDayConfiguration alloc] initWithDictionary:&unk_1EF8D9858];
  return v2;
}

- (FCTimeOfDayConfiguration)eveningTimeOfDayConfiguration
{
  return self->_eveningTimeOfDayConfiguration;
}

- (FCTimeOfDayConfiguration)nightTimeOfDayConfiguration
{
  return self->_nightTimeOfDayConfiguration;
}

@end