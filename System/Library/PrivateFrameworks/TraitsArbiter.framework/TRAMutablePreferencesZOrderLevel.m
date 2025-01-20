@interface TRAMutablePreferencesZOrderLevel
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setPreferredZOrderLevel:(double)a3;
@end

@implementation TRAMutablePreferencesZOrderLevel

- (void)setPreferredZOrderLevel:(double)a3
{
  self->super._preferredZOrderLevel = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TRAPreferencesZOrderLevel allocWithZone:a3];
  return [(TRAPreferencesZOrderLevel *)v4 initWithZOrderLevelPreferences:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithZOrderLevelPreferences:self];
}

@end