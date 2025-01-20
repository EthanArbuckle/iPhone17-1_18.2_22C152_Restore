@interface WFShowFocusConfigurationEvent
+ (Class)codableEventClass;
- (NSString)appBundleIdentifier;
- (NSString)intentType;
- (NSString)key;
- (NSString)systemFilterType;
- (WFShowFocusConfigurationEvent)initWithAppBundleIdentifier:(id)a3 intentType:(id)a4;
- (WFShowFocusConfigurationEvent)initWithSystemFilterType:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setIntentType:(id)a3;
- (void)setKey:(id)a3;
- (void)setSystemFilterType:(id)a3;
@end

@implementation WFShowFocusConfigurationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemFilterType, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setSystemFilterType:(id)a3
{
}

- (NSString)systemFilterType
{
  return self->_systemFilterType;
}

- (void)setIntentType:(id)a3
{
}

- (NSString)intentType
{
  return self->_intentType;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (WFShowFocusConfigurationEvent)initWithSystemFilterType:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFShowFocusConfigurationEvent;
  v5 = [(WFShowFocusConfigurationEvent *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    systemFilterType = v5->_systemFilterType;
    v5->_systemFilterType = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFShowFocusConfigurationEvent)initWithAppBundleIdentifier:(id)a3 intentType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFShowFocusConfigurationEvent;
  v8 = [(WFShowFocusConfigurationEvent *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    appBundleIdentifier = v8->_appBundleIdentifier;
    v8->_appBundleIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    intentType = v8->_intentType;
    v8->_intentType = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

@end