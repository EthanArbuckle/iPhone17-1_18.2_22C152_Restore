@interface SBSUserNotificationSystemApertureContentDefinition
- (BOOL)preventsAutomaticDismissal;
- (NSNumber)alertTextAlignment;
- (NSString)alertHeader;
- (NSString)alertHeaderColorName;
- (NSString)alertMessage;
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSString)keyColorName;
- (SBSUserNotificationAssetDefinition)leadingAssetDefinition;
- (SBSUserNotificationColorDefinition)alertHeaderColor;
- (SBSUserNotificationColorDefinition)keyColor;
- (SBSUserNotificationImageDefinition)leadingImageDefinition;
- (id)_initWithDictionary:(id)a3;
- (id)build;
- (void)setAlertHeader:(id)a3;
- (void)setAlertHeaderColor:(id)a3;
- (void)setAlertHeaderColorName:(id)a3;
- (void)setAlertMessage:(id)a3;
- (void)setAlertTextAlignment:(id)a3;
- (void)setAlternateButtonTitle:(id)a3;
- (void)setDefaultButtonTitle:(id)a3;
- (void)setKeyColor:(id)a3;
- (void)setKeyColorName:(id)a3;
- (void)setLeadingAssetDefinition:(id)a3;
- (void)setPreventsAutomaticDismissal:(BOOL)a3;
@end

@implementation SBSUserNotificationSystemApertureContentDefinition

- (id)_initWithDictionary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"SBSCFUserNotificationSystemApertureContentDefinition.m", 31, @"Invalid parameter not satisfying: %@", @"dictionary" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [(SBSUserNotificationSystemApertureContentDefinition *)self init];
    if (v6)
    {
      uint64_t v7 = [v5 bs_safeStringForKey:@"SBSCFUNSAAlertHeader"];
      alertHeader = v6->_alertHeader;
      v6->_alertHeader = (NSString *)v7;

      uint64_t v9 = [v5 bs_safeStringForKey:@"SBSCFUNSAAlertMessage"];
      alertMessage = v6->_alertMessage;
      v6->_alertMessage = (NSString *)v9;

      v11 = [v5 bs_safeDictionaryForKey:@"SBSCFUNSAAlertHeaderColor"];
      if (v11)
      {
        v12 = [[SBSUserNotificationColorDefinition alloc] _initWithDictionary:v11];
        alertHeaderColor = v6->_alertHeaderColor;
        v6->_alertHeaderColor = v12;
      }
      v14 = [v5 bs_safeDictionaryForKey:@"SBSCFUNSAKeyColor"];
      if (v14)
      {
        v15 = [[SBSUserNotificationColorDefinition alloc] _initWithDictionary:v14];
        keyColor = v6->_keyColor;
        v6->_keyColor = v15;
      }
      uint64_t v17 = [v5 bs_safeNumberForKey:@"SBSCFUNSAAlertTextAlignment"];
      alertTextAlignment = v6->_alertTextAlignment;
      v6->_alertTextAlignment = (NSNumber *)v17;

      uint64_t v19 = [v5 bs_safeStringForKey:@"SBSCFUNSADefaultButtonTitle"];
      defaultButtonTitle = v6->_defaultButtonTitle;
      v6->_defaultButtonTitle = (NSString *)v19;

      uint64_t v21 = [v5 bs_safeStringForKey:@"SBSCFUNSAAlternateButtonTitle"];
      alternateButtonTitle = v6->_alternateButtonTitle;
      v6->_alternateButtonTitle = (NSString *)v21;

      v23 = [v5 bs_safeNumberForKey:@"SBSCFUNSAPreventsAutomaticDismissalKey"];
      v6->_preventsAutomaticDismissal = [v23 BOOLValue];

      v24 = [v5 bs_safeDictionaryForKey:@"SBSCFUNSALeadingAssetDefinition"];
      if (v24)
      {
        uint64_t v25 = +[SBSUserNotificationAssetDefinition _definitionFromSerializedDefinition:v24];
        leadingAssetDefinition = v6->_leadingAssetDefinition;
        v6->_leadingAssetDefinition = (SBSUserNotificationAssetDefinition *)v25;
      }
    }
    self = v6;
    v27 = self;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)build
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  alertHeader = self->_alertHeader;
  if (alertHeader) {
    [v3 setObject:alertHeader forKey:@"SBSCFUNSAAlertHeader"];
  }
  alertMessage = self->_alertMessage;
  if (alertMessage) {
    [v4 setObject:alertMessage forKey:@"SBSCFUNSAAlertMessage"];
  }
  alertHeaderColor = self->_alertHeaderColor;
  if (alertHeaderColor)
  {
    v8 = [(SBSUserNotificationColorDefinition *)alertHeaderColor build];
    [v4 setObject:v8 forKey:@"SBSCFUNSAAlertHeaderColor"];
  }
  keyColor = self->_keyColor;
  if (keyColor)
  {
    v10 = [(SBSUserNotificationColorDefinition *)keyColor build];
    [v4 setObject:v10 forKey:@"SBSCFUNSAKeyColor"];
  }
  alertTextAlignment = self->_alertTextAlignment;
  if (alertTextAlignment) {
    [v4 setObject:alertTextAlignment forKey:@"SBSCFUNSAAlertTextAlignment"];
  }
  defaultButtonTitle = self->_defaultButtonTitle;
  if (defaultButtonTitle) {
    [v4 setObject:defaultButtonTitle forKey:@"SBSCFUNSADefaultButtonTitle"];
  }
  alternateButtonTitle = self->_alternateButtonTitle;
  if (alternateButtonTitle) {
    [v4 setObject:alternateButtonTitle forKey:@"SBSCFUNSAAlternateButtonTitle"];
  }
  leadingAssetDefinition = self->_leadingAssetDefinition;
  if (leadingAssetDefinition)
  {
    v15 = [(SBSUserNotificationAssetDefinition *)leadingAssetDefinition build];
    [v4 setObject:v15 forKey:@"SBSCFUNSALeadingAssetDefinition"];
  }
  if (self->_preventsAutomaticDismissal) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"SBSCFUNSAPreventsAutomaticDismissalKey"];
  }
  v16 = (void *)[v4 copy];

  return v16;
}

- (NSString)alertHeader
{
  return self->_alertHeader;
}

- (void)setAlertHeader:(id)a3
{
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (void)setAlertMessage:(id)a3
{
}

- (SBSUserNotificationColorDefinition)alertHeaderColor
{
  return self->_alertHeaderColor;
}

- (void)setAlertHeaderColor:(id)a3
{
}

- (SBSUserNotificationColorDefinition)keyColor
{
  return self->_keyColor;
}

- (void)setKeyColor:(id)a3
{
}

- (NSNumber)alertTextAlignment
{
  return self->_alertTextAlignment;
}

- (void)setAlertTextAlignment:(id)a3
{
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
}

- (SBSUserNotificationAssetDefinition)leadingAssetDefinition
{
  return self->_leadingAssetDefinition;
}

- (void)setLeadingAssetDefinition:(id)a3
{
}

- (BOOL)preventsAutomaticDismissal
{
  return self->_preventsAutomaticDismissal;
}

- (void)setPreventsAutomaticDismissal:(BOOL)a3
{
  self->_preventsAutomaticDismissal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingAssetDefinition, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_alertTextAlignment, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_alertHeaderColor, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertHeader, 0);
}

- (SBSUserNotificationImageDefinition)leadingImageDefinition
{
  v3 = [(SBSUserNotificationSystemApertureContentDefinition *)self leadingAssetDefinition];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(SBSUserNotificationSystemApertureContentDefinition *)self leadingAssetDefinition];
  }
  else
  {
    id v5 = 0;
  }
  return (SBSUserNotificationImageDefinition *)v5;
}

- (void)setAlertHeaderColorName:(id)a3
{
  id v4 = +[SBSUserNotificationColorDefinition definitionWithColorName:a3];
  [(SBSUserNotificationSystemApertureContentDefinition *)self setAlertHeaderColor:v4];
}

- (NSString)alertHeaderColorName
{
  v2 = [(SBSUserNotificationSystemApertureContentDefinition *)self alertHeaderColor];
  v3 = [v2 colorName];

  return (NSString *)v3;
}

- (void)setKeyColorName:(id)a3
{
  id v4 = +[SBSUserNotificationColorDefinition definitionWithColorName:a3];
  [(SBSUserNotificationSystemApertureContentDefinition *)self setKeyColor:v4];
}

- (NSString)keyColorName
{
  v2 = [(SBSUserNotificationSystemApertureContentDefinition *)self keyColor];
  v3 = [v2 colorName];

  return (NSString *)v3;
}

@end