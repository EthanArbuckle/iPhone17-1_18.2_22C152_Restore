@interface CAContext(CAContext_ServiceSecurity)
- (void)_notifyIfChangedFromSecure:()CAContext_ServiceSecurity;
@end

@implementation CAContext(CAContext_ServiceSecurity)

- (void)_notifyIfChangedFromSecure:()CAContext_ServiceSecurity
{
  v5 = objc_getAssociatedObject(a1, &_notifyIfChangedFromSecure___UIServiceContextIsInsecureKey);
  BOOL v6 = v5 != 0;

  if (((v6 ^ a3) & 1) == 0)
  {
    if (a3)
    {
      objc_setAssociatedObject(a1, &_notifyIfChangedFromSecure___UIServiceContextIsInsecureKey, 0, 0);
      v7 = @"UISServiceContextDidBecomeSecureNotification";
    }
    else
    {
      objc_setAssociatedObject(a1, &_notifyIfChangedFromSecure___UIServiceContextIsInsecureKey, MEMORY[0x1E4F1CC38], (void *)1);
      v7 = @"UISServiceContextDidBecomeInsecureNotification";
    }
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:v7 object:a1];
  }
}

@end