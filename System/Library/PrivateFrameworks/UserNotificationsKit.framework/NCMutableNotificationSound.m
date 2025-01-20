@interface NCMutableNotificationSound
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAlertConfiguration:(id)a3;
- (void)setControllerAttributes:(id)a3;
- (void)setMaxDuration:(double)a3;
- (void)setRepeats:(BOOL)a3;
- (void)setRingtoneName:(id)a3;
- (void)setSongPath:(id)a3;
- (void)setSoundBehavior:(unint64_t)a3;
- (void)setSoundType:(int64_t)a3;
- (void)setSystemSoundID:(unsigned int)a3;
- (void)setVibrationPattern:(id)a3;
@end

@implementation NCMutableNotificationSound

- (void)setSoundType:(int64_t)a3
{
  self->super._soundType = a3;
}

- (void)setSystemSoundID:(unsigned int)a3
{
  self->super._systemSoundID = a3;
}

- (void)setSoundBehavior:(unint64_t)a3
{
  self->super._soundBehavior = a3;
}

- (void)setRingtoneName:(id)a3
{
  self->super._ringtoneName = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setVibrationPattern:(id)a3
{
  self->super._vibrationPattern = (NSDictionary *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setRepeats:(BOOL)a3
{
  self->super._repeats = a3;
}

- (void)setMaxDuration:(double)a3
{
  self->super._maxDuration = a3;
}

- (void)setControllerAttributes:(id)a3
{
  self->super._controllerAttributes = (NSDictionary *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setAlertConfiguration:(id)a3
{
  self->super._alertConfiguration = (TLAlertConfiguration *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setSongPath:(id)a3
{
  self->super._songPath = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [NCNotificationSound alloc];

  return [(NCNotificationSound *)v4 initWithNotificationSound:self];
}

@end