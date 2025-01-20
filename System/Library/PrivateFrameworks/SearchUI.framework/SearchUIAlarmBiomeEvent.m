@interface SearchUIAlarmBiomeEvent
+ (BOOL)supportsEvent:(id)a3 contextualAction:(id)a4;
- (NSString)observedAlarmIdentifier;
- (SearchUIAlarmBiomeEvent)initWithEvent:(id)a3 contextualAction:(id)a4;
- (void)getEnabledStatusWithCompletion:(id)a3;
- (void)setObservedAlarmIdentifier:(id)a3;
@end

@implementation SearchUIAlarmBiomeEvent

+ (BOOL)supportsEvent:(id)a3 contextualAction:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (SearchUIAlarmBiomeEvent)initWithEvent:(id)a3 contextualAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SearchUIAlarmBiomeEvent;
  v8 = [(BMEventBase *)&v11 init];
  if (v8)
  {
    v9 = [v7 alarmIdentifier];
    [(SearchUIAlarmBiomeEvent *)v8 setObservedAlarmIdentifier:v9];

    [(SearchUIBiomeEvent *)v8 setBiomeEvent:v6];
  }

  return v8;
}

- (void)getEnabledStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIAlarmBiomeEvent *)self observedAlarmIdentifier];
  +[SearchUIMobileTimerUtilities getEnablementStatusForAlarmWithIdentifier:v5 completion:v4];
}

- (NSString)observedAlarmIdentifier
{
  return self->_observedAlarmIdentifier;
}

- (void)setObservedAlarmIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end