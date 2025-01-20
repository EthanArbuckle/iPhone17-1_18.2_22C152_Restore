@interface CarInstrumentClusterChromeConfiguration
- (BOOL)isEqual:(id)a3;
- (CarInstrumentClusterChromeConfiguration)initWithInstrumentClusterSceneSettings:(id)a3;
- (NSString)description;
- (unint64_t)_settingWithValue:(unint64_t)a3 hybridICOverrideKey:(id)a4;
- (unint64_t)showsETA;
- (unint64_t)showsHeadingIndicator;
- (unint64_t)showsSpeedLimit;
- (void)dealloc;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation CarInstrumentClusterChromeConfiguration

- (CarInstrumentClusterChromeConfiguration)initWithInstrumentClusterSceneSettings:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)CarInstrumentClusterChromeConfiguration;
    v5 = [(CarInstrumentClusterChromeConfiguration *)&v15 init];
    if (v5)
    {
      if (![v4 itemType] || objc_msgSend(v4, "itemType") == (id)3 || (int BOOL = GEOConfigGetBOOL()) != 0) {
        LOBYTE(BOOL) = GEOConfigGetBOOL();
      }
      v5->_isHybridInstrumentClusterConfiguration = BOOL;
      v7 = (char *)[v4 showsCompass];
      if ((unint64_t)(v7 - 1) >= 3) {
        unint64_t v8 = 0;
      }
      else {
        unint64_t v8 = (unint64_t)v7;
      }
      v5->_showsHeadingIndicator = v8;
      v9 = (char *)[v4 showsSpeedLimit];
      if ((unint64_t)(v9 - 1) >= 3) {
        unint64_t v10 = 0;
      }
      else {
        unint64_t v10 = (unint64_t)v9;
      }
      v5->_showsSpeedLimit = v10;
      v11 = (char *)[v4 showsETA];
      if ((unint64_t)(v11 - 1) >= 3) {
        unint64_t v12 = 0;
      }
      else {
        unint64_t v12 = (unint64_t)v11;
      }
      v5->_showsETA = v12;
      if (v5->_isHybridInstrumentClusterConfiguration)
      {
        _GEOConfigAddDelegateListenerForKey();
        _GEOConfigAddDelegateListenerForKey();

        _GEOConfigAddDelegateListenerForKey();
      }
    }
    self = v5;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  if (self->_isHybridInstrumentClusterConfiguration) {
    GEOConfigRemoveDelegateListenerForAllKeys();
  }
  v3.receiver = self;
  v3.super_class = (Class)CarInstrumentClusterChromeConfiguration;
  [(CarInstrumentClusterChromeConfiguration *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CarInstrumentClusterChromeConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = self->_showsHeadingIndicator == v5->_showsHeadingIndicator
        && self->_showsSpeedLimit == v5->_showsSpeedLimit
        && self->_showsETA == v5->_showsETA;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (NSString)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v5 = (void *)v4;
  unint64_t v6 = self->_showsHeadingIndicator - 1;
  if (v6 > 2) {
    CFStringRef v7 = @"Unspecified";
  }
  else {
    CFStringRef v7 = *(&off_10131C5D0 + v6);
  }
  unint64_t v8 = self->_showsSpeedLimit - 1;
  if (v8 > 2) {
    CFStringRef v9 = @"Unspecified";
  }
  else {
    CFStringRef v9 = *(&off_10131C5D0 + v8);
  }
  unint64_t v10 = self->_showsETA - 1;
  if (v10 > 2) {
    CFStringRef v11 = @"Unspecified";
  }
  else {
    CFStringRef v11 = *(&off_10131C5D0 + v10);
  }
  unint64_t v12 = +[NSString stringWithFormat:@"<%@: %p, showsHeadingIndicator: %@, showsSpeedLimit: %@, showsETA: %@>", v4, self, v7, v9, v11];

  return (NSString *)v12;
}

- (unint64_t)showsHeadingIndicator
{
  return -[CarInstrumentClusterChromeConfiguration _settingWithValue:hybridICOverrideKey:](self, "_settingWithValue:hybridICOverrideKey:", self->_showsHeadingIndicator, MapsConfig_CarPlayHybridInstrumentClusterShowHeadingIndicatorOverride, off_1015F10B8);
}

- (unint64_t)showsSpeedLimit
{
  return -[CarInstrumentClusterChromeConfiguration _settingWithValue:hybridICOverrideKey:](self, "_settingWithValue:hybridICOverrideKey:", self->_showsSpeedLimit, MapsConfig_CarPlayHybridInstrumentClusterShowSpeedLimitOverride, off_1015F10C8);
}

- (unint64_t)showsETA
{
  return -[CarInstrumentClusterChromeConfiguration _settingWithValue:hybridICOverrideKey:](self, "_settingWithValue:hybridICOverrideKey:", self->_showsETA, MapsConfig_CarPlayHybridInstrumentClusterShowETATrayOverride, off_1015F10D8);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"CarInstrumentClusterChromeConfigurationDidUpdateNotification" object:self];
}

- (unint64_t)_settingWithValue:(unint64_t)a3 hybridICOverrideKey:(id)a4
{
  if (self->_isHybridInstrumentClusterConfiguration && _GEOConfigHasValue())
  {
    unint64_t UInteger = GEOConfigGetUInteger();
    if (UInteger - 1 >= 3) {
      return 0;
    }
    else {
      return UInteger;
    }
  }
  return a3;
}

@end