@interface NCMutableNotificationAlertOptions
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setActiveModeUUID:(id)a3;
- (void)setIntelligentBehavior:(unint64_t)a3;
- (void)setReason:(unint64_t)a3;
- (void)setSuppression:(unint64_t)a3;
@end

@implementation NCMutableNotificationAlertOptions

- (void)setSuppression:(unint64_t)a3
{
  self->super._suppression = a3;
}

- (void)setIntelligentBehavior:(unint64_t)a3
{
  self->super._intelligentBehavior = a3;
}

- (void)setReason:(unint64_t)a3
{
  self->super._reason = a3;
}

- (void)setActiveModeUUID:(id)a3
{
  self->super._activeModeUUID = (NSUUID *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [NCNotificationAlertOptions alloc];

  return [(NCNotificationAlertOptions *)v4 initWithNotificationAlertOptions:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [NCMutableNotificationAlertOptions alloc];

  return [(NCNotificationAlertOptions *)v4 initWithNotificationAlertOptions:self];
}

@end