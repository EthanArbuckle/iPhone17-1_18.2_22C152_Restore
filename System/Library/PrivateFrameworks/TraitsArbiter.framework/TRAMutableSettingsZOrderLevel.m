@interface TRAMutableSettingsZOrderLevel
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setZOrderLevel:(double)a3;
@end

@implementation TRAMutableSettingsZOrderLevel

- (void)setZOrderLevel:(double)a3
{
  self->super._zOrderLevel = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TRASettingsZOrderLevel allocWithZone:a3];
  return [(TRASettingsZOrderLevel *)v4 initWithZOrderLevelSettings:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithZOrderLevelSettings:self];
}

@end