@interface STKMutableCallSetupSessionData
- (void)setIsHighPriority:(BOOL)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation STKMutableCallSetupSessionData

- (void)setPhoneNumber:(id)a3
{
}

- (void)setIsHighPriority:(BOOL)a3
{
  self->super._isHighPriority = a3;
}

@end