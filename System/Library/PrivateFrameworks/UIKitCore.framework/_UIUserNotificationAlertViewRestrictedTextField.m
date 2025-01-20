@interface _UIUserNotificationAlertViewRestrictedTextField
+ (id)_supportedMethodSelectorNames;
+ (id)restrictedProxyForTextField:(id)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation _UIUserNotificationAlertViewRestrictedTextField

+ (id)restrictedProxyForTextField:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS____UIUserNotificationAlertViewRestrictedTextField;
  v3 = objc_msgSendSuper2(&v5, sel_proxyWithTarget_, a3);
  return v3;
}

+ (id)_supportedMethodSelectorNames
{
  return &unk_1ED3F1768;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  objc_super v5 = NSStringFromSelector((SEL)[v4 selector]);
  v6 = [(id)objc_opt_class() _supportedMethodSelectorNames];
  char v7 = [v6 containsObject:v5];

  if (v7)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIUserNotificationAlertViewRestrictedTextField;
    [(_UITargetedProxy *)&v11 forwardInvocation:v4];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3A8];
    v10 = [(id)objc_opt_class() _supportedMethodSelectorNames];
    [v8 raise:v9, @"Text fields in UIAlertViews displayed from view services only accept these methods: %@", v10 format];
  }
}

@end