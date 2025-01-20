@interface WFShowWidgetConfigurationEvent
+ (Class)codableEventClass;
- (BOOL)isInteractive;
- (NSString)appBundleIdentifier;
- (NSString)intentType;
- (NSString)key;
- (NSString)sizeClass;
- (WFShowWidgetConfigurationEvent)initWithAppBundleIdentifier:(id)a3 intentType:(id)a4 sizeClass:(id)a5;
- (WFShowWidgetConfigurationEvent)initWithAppBundleIdentifier:(id)a3 intentType:(id)a4 sizeClass:(id)a5 interactive:(BOOL)a6;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setIntentType:(id)a3;
- (void)setIsInteractive:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSizeClass:(id)a3;
@end

@implementation WFShowWidgetConfigurationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeClass, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setIsInteractive:(BOOL)a3
{
  self->_isInteractive = a3;
}

- (BOOL)isInteractive
{
  return self->_isInteractive;
}

- (void)setSizeClass:(id)a3
{
}

- (NSString)sizeClass
{
  return self->_sizeClass;
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

- (WFShowWidgetConfigurationEvent)initWithAppBundleIdentifier:(id)a3 intentType:(id)a4 sizeClass:(id)a5
{
  return [(WFShowWidgetConfigurationEvent *)self initWithAppBundleIdentifier:a3 intentType:a4 sizeClass:a5 interactive:0];
}

- (WFShowWidgetConfigurationEvent)initWithAppBundleIdentifier:(id)a3 intentType:(id)a4 sizeClass:(id)a5 interactive:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WFShowWidgetConfigurationEvent;
  v13 = [(WFShowWidgetConfigurationEvent *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    appBundleIdentifier = v13->_appBundleIdentifier;
    v13->_appBundleIdentifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    intentType = v13->_intentType;
    v13->_intentType = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    sizeClass = v13->_sizeClass;
    v13->_sizeClass = (NSString *)v18;

    v13->_isInteractive = a6;
    v20 = v13;
  }

  return v13;
}

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

@end