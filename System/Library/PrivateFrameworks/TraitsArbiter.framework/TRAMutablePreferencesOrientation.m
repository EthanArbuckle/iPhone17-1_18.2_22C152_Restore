@interface TRAMutablePreferencesOrientation
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setCanDetermineActiveOrientation:(BOOL)a3;
- (void)setPreferredOrientation:(int64_t)a3;
- (void)setSupportedOrientations:(unint64_t)a3;
@end

@implementation TRAMutablePreferencesOrientation

- (void)setSupportedOrientations:(unint64_t)a3
{
  self->super._supportedOrientations = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TRAPreferencesOrientation allocWithZone:a3];
  return [(TRAPreferencesOrientation *)v4 initWithOrientationPreferences:self];
}

- (void)setCanDetermineActiveOrientation:(BOOL)a3
{
  self->super._canDetermineActiveOrientation = a3;
}

- (void)setPreferredOrientation:(int64_t)a3
{
  self->super._preferredOrientation = a3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithOrientationPreferences:self];
}

@end