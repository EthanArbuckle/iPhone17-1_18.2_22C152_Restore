@interface MRMutableApplicationActivity
+ (BOOL)supportsSecureCoding;
- (void)setPrimaryApplicationDisplayID:(id)a3;
- (void)setSecondaryApplicationDisplayID:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation MRMutableApplicationActivity

- (void)setPrimaryApplicationDisplayID:(id)a3
{
  if (self->super._primaryApplicationDisplayID != a3)
  {
    v4 = (NSString *)[a3 copy];
    primaryApplicationDisplayID = self->super._primaryApplicationDisplayID;
    self->super._primaryApplicationDisplayID = v4;
    MEMORY[0x1F41817F8](v4, primaryApplicationDisplayID);
  }
}

- (void)setSecondaryApplicationDisplayID:(id)a3
{
  if (self->super._secondaryApplicationDisplayID != a3)
  {
    v4 = (NSString *)[a3 copy];
    secondaryApplicationDisplayID = self->super._secondaryApplicationDisplayID;
    self->super._secondaryApplicationDisplayID = v4;
    MEMORY[0x1F41817F8](v4, secondaryApplicationDisplayID);
  }
}

- (void)setStatus:(int)a3
{
  self->super._status = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end