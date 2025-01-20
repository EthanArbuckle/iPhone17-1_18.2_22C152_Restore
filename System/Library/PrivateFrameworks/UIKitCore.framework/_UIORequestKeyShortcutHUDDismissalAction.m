@interface _UIORequestKeyShortcutHUDDismissalAction
+ (id)dismissalAction;
- (BOOL)isPermitted;
- (void)performActionFromConnection:(id)a3;
@end

@implementation _UIORequestKeyShortcutHUDDismissalAction

+ (id)dismissalAction
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInfo:0 responder:0];
  return v2;
}

- (BOOL)isPermitted
{
  return +[UIKeyShortcutHUDService _isOOPFeatureEnabled];
}

- (void)performActionFromConnection:(id)a3
{
  id v3 = a3;
  id v4 = +[_UIKeyShortcutHUDServer sharedHUDServer];
  [v4 dismissHUDForConnection:v3];
}

@end