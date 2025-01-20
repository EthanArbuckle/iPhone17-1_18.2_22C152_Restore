@interface _SBIdleTimerGlobalNumericSettingMonitor
- (BOOL)_updateCache;
- (NSNumber)numericValue;
- (_SBIdleTimerGlobalNumericSettingMonitor)initWithLabel:(id)a3 delegate:(id)a4 updatingForNotification:(id)a5 fetchingWith:(id)a6;
- (id)formattedValue;
- (void)_settingChanged:(id)a3;
- (void)dealloc;
@end

@implementation _SBIdleTimerGlobalNumericSettingMonitor

- (NSNumber)numericValue
{
  settingCache = self->_settingCache;
  if (!settingCache)
  {
    [(_SBIdleTimerGlobalNumericSettingMonitor *)self _updateCache];
    settingCache = self->_settingCache;
  }
  return settingCache;
}

- (_SBIdleTimerGlobalNumericSettingMonitor)initWithLabel:(id)a3 delegate:(id)a4 updatingForNotification:(id)a5 fetchingWith:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_SBIdleTimerGlobalNumericSettingMonitor;
  v12 = [(_SBIdleTimerGlobalSettingMonitor *)&v17 initWithLabel:a3 delegate:a4];
  if (v12)
  {
    uint64_t v13 = [v11 copy];
    id fetchSettingFromSource = v12->_fetchSettingFromSource;
    v12->_id fetchSettingFromSource = (id)v13;

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v12 selector:sel__settingChanged_ name:v10 object:0];
  }
  return v12;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_SBIdleTimerGlobalNumericSettingMonitor;
  [(_SBIdleTimerGlobalNumericSettingMonitor *)&v4 dealloc];
}

- (BOOL)_updateCache
{
  v3 = (*((void (**)(void))self->_fetchSettingFromSource + 2))();
  p_settingCache = (id *)&self->_settingCache;
  id v5 = *p_settingCache;
  if (!v3)
  {
    if (v5)
    {
      id *p_settingCache = 0;

      goto LABEL_6;
    }
LABEL_7:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  if ([v5 isEqualToNumber:v3]) {
    goto LABEL_7;
  }
  objc_storeStrong(p_settingCache, v3);
LABEL_6:
  BOOL v6 = 1;
LABEL_8:

  return v6;
}

- (void)_settingChanged:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

- (id)formattedValue
{
  v2 = [(_SBIdleTimerGlobalNumericSettingMonitor *)self numericValue];
  id v3 = [v2 description];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchSettingFromSource, 0);
  objc_storeStrong((id *)&self->_settingCache, 0);
}

@end