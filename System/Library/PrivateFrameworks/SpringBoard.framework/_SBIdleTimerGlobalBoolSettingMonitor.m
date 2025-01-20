@interface _SBIdleTimerGlobalBoolSettingMonitor
- (BOOL)BOOLValue;
- (_SBIdleTimerGlobalBoolSettingMonitor)initWithLabel:(id)a3 delegate:(id)a4 updatingForNotification:(id)a5 fetchingWith:(id)a6;
- (id)formattedValue;
@end

@implementation _SBIdleTimerGlobalBoolSettingMonitor

- (BOOL)BOOLValue
{
  v2 = [(_SBIdleTimerGlobalNumericSettingMonitor *)self numericValue];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (_SBIdleTimerGlobalBoolSettingMonitor)initWithLabel:(id)a3 delegate:(id)a4 updatingForNotification:(id)a5 fetchingWith:(id)a6
{
  id v10 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100___SBIdleTimerGlobalBoolSettingMonitor_initWithLabel_delegate_updatingForNotification_fetchingWith___block_invoke;
  v15[3] = &unk_1E6B0BD60;
  id v16 = v10;
  v14.receiver = self;
  v14.super_class = (Class)_SBIdleTimerGlobalBoolSettingMonitor;
  id v11 = v10;
  v12 = [(_SBIdleTimerGlobalNumericSettingMonitor *)&v14 initWithLabel:a3 delegate:a4 updatingForNotification:a5 fetchingWith:v15];

  return v12;
}

- (id)formattedValue
{
  v2 = objc_msgSend(NSNumber, "numberWithBool:", -[_SBIdleTimerGlobalBoolSettingMonitor BOOLValue](self, "BOOLValue"));
  char v3 = [v2 description];

  return v3;
}

@end