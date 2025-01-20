@interface NCMutableNotificationAction
- (BOOL)isSiriAction;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setActionRunner:(id)a3;
- (void)setActivationMode:(unint64_t)a3;
- (void)setBehavior:(unint64_t)a3;
- (void)setBehaviorParameters:(id)a3;
- (void)setDestructiveAction:(BOOL)a3;
- (void)setIconImageBundlePath:(id)a3;
- (void)setIconImageName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsSiriActionCandidate:(BOOL)a3;
- (void)setLaunchBundleID:(id)a3;
- (void)setLaunchURL:(id)a3;
- (void)setRequiresAuthentication:(BOOL)a3;
- (void)setShouldDismissNotification:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation NCMutableNotificationAction

- (void)setIdentifier:(id)a3
{
  self->super._identifier = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setTitle:(id)a3
{
  self->super._title = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setIconImageName:(id)a3
{
  self->super._iconImageName = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setIconImageBundlePath:(id)a3
{
  self->super._iconImageBundlePath = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setActivationMode:(unint64_t)a3
{
  self->super._activationMode = a3;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  self->super._requiresAuthentication = a3;
}

- (void)setLaunchURL:(id)a3
{
  self->super._launchURL = (NSURL *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setLaunchBundleID:(id)a3
{
  self->super._launchBundleID = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setBehavior:(unint64_t)a3
{
  self->super._behavior = a3;
}

- (void)setBehaviorParameters:(id)a3
{
  self->super._behaviorParameters = (NSDictionary *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setActionRunner:(id)a3
{
}

- (void)setDestructiveAction:(BOOL)a3
{
  self->super._destructiveAction = a3;
}

- (void)setShouldDismissNotification:(BOOL)a3
{
  self->super._shouldDismissNotification = a3;
}

- (void)setIsSiriActionCandidate:(BOOL)a3
{
  self->super._isSiriActionCandidate = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [NCNotificationAction alloc];

  return [(NCNotificationAction *)v4 initWithNotificationAction:self];
}

- (BOOL)isSiriAction
{
  return 0;
}

@end