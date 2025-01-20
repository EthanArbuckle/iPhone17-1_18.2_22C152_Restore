@interface CRSetupLockscreenAlert
- (BOOL)dismissOnUnlock;
- (id)lockscreenMessage;
@end

@implementation CRSetupLockscreenAlert

- (id)lockscreenMessage
{
  return (id)CRLocalizedStringForKey();
}

- (BOOL)dismissOnUnlock
{
  return 1;
}

@end