@interface _SBUABestAppSuggestion
- (BOOL)isCallContinuitySuggestion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHandoff;
- (BOOL)isLocallyGeneratedSuggestion;
- (BOOL)isLocationBasedSuggestion;
- (BOOL)isNotificationSuggestion;
- (BOOL)isOpenURLSuggestion;
- (id)activityType;
- (id)bundleIdentifier;
- (id)initWithAppSuggestion:(id *)a1;
- (id)lastUpdateTime;
- (id)originatingDeviceIdentifier;
- (id)originatingDeviceName;
- (id)originatingDeviceType;
- (id)uniqueIdentifier;
- (uint64_t)appSuggestion;
- (unint64_t)hash;
@end

@implementation _SBUABestAppSuggestion

- (uint64_t)appSuggestion
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (id)initWithAppSuggestion:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_SBUABestAppSuggestion;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (id)uniqueIdentifier
{
  return (id)[(UABestAppSuggestion *)self->_appSuggestion uniqueIdentifier];
}

- (id)bundleIdentifier
{
  return (id)[(UABestAppSuggestion *)self->_appSuggestion bundleIdentifier];
}

- (id)activityType
{
  return (id)[(UABestAppSuggestion *)self->_appSuggestion activityType];
}

- (id)lastUpdateTime
{
  return (id)[(UABestAppSuggestion *)self->_appSuggestion lastUpdateTime];
}

- (id)originatingDeviceIdentifier
{
  return (id)[(UABestAppSuggestion *)self->_appSuggestion originatingDeviceIdentifier];
}

- (id)originatingDeviceName
{
  return (id)[(UABestAppSuggestion *)self->_appSuggestion originatingDeviceName];
}

- (id)originatingDeviceType
{
  return (id)[(UABestAppSuggestion *)self->_appSuggestion originatingDeviceType];
}

- (BOOL)isNotificationSuggestion
{
  v2 = [(UABestAppSuggestion *)self->_appSuggestion options];
  v3 = [v2 objectForKey:*MEMORY[0x1E4FB36E8]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isOpenURLSuggestion
{
  return [(UABestAppSuggestion *)self->_appSuggestion type] == 10;
}

- (BOOL)isCallContinuitySuggestion
{
  if ([(UABestAppSuggestion *)self->_appSuggestion type] == 12) {
    return 1;
  }
  char v4 = [(UABestAppSuggestion *)self->_appSuggestion activityType];
  char v5 = TUIsCallHandoffActivityType();

  return v5;
}

- (BOOL)isLocallyGeneratedSuggestion
{
  return [(UABestAppSuggestion *)self->_appSuggestion type] == 5
      || [(UABestAppSuggestion *)self->_appSuggestion type] == 10;
}

- (BOOL)isLocationBasedSuggestion
{
  return [(UABestAppSuggestion *)self->_appSuggestion type] == 5;
}

- (BOOL)isHandoff
{
  return [(UABestAppSuggestion *)self->_appSuggestion type] != 5
      && [(UABestAppSuggestion *)self->_appSuggestion type] != 10;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (_SBUABestAppSuggestion *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = [(_SBUABestAppSuggestion *)v4 uniqueIdentifier];
      v6 = [(_SBUABestAppSuggestion *)self uniqueIdentifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(_SBUABestAppSuggestion *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void).cxx_destruct
{
}

@end