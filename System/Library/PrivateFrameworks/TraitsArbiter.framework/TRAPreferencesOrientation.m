@interface TRAPreferencesOrientation
- (BOOL)canDetermineActiveOrientation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOrientationPreferences:(id)a3;
- (TRAPreferencesOrientation)init;
- (TRAPreferencesOrientation)initWithOrientationPreferences:(id)a3;
- (TRAPreferencesOrientation)initWithSupportedMask:(unint64_t)a3 determinesActiveOrientation:(BOOL)a4;
- (TRAPreferencesOrientation)initWithSupportedMask:(unint64_t)a3 preferred:(int64_t)a4 determinesActiveOrientation:(BOOL)a5;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)preferredOrientation;
- (unint64_t)supportedOrientations;
- (void)setCanDetermineActiveOrientation:(BOOL)a3;
- (void)setPreferredOrientation:(int64_t)a3;
- (void)setSupportedOrientations:(unint64_t)a3;
@end

@implementation TRAPreferencesOrientation

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[TRAMutablePreferencesOrientation allocWithZone:a3];
  return [(TRAPreferencesOrientation *)v4 initWithOrientationPreferences:self];
}

- (BOOL)isEqualToOrientationPreferences:(id)a3
{
  v5 = (TRAPreferencesOrientation *)a3;
  if (!v5) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRAPreferences.m", 195, @"Invalid parameter not satisfying: %@", @"preferences == nil || [preferences isKindOfClass:[TRAPreferencesOrientation class]]" object file lineNumber description];
  }
  if (self == v5)
  {
    BOOL v9 = 1;
    goto LABEL_10;
  }
  unint64_t supportedOrientations = self->_supportedOrientations;
  if (supportedOrientations == [(TRAPreferencesOrientation *)v5 supportedOrientations]
    && (int64_t preferredOrientation = self->_preferredOrientation,
        preferredOrientation == [(TRAPreferencesOrientation *)v5 preferredOrientation]))
  {
    BOOL canDetermineActiveOrientation = self->_canDetermineActiveOrientation;
    BOOL v9 = canDetermineActiveOrientation == [(TRAPreferencesOrientation *)v5 canDetermineActiveOrientation];
  }
  else
  {
LABEL_8:
    BOOL v9 = 0;
  }
LABEL_10:

  return v9;
}

- (TRAPreferencesOrientation)initWithOrientationPreferences:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 supportedOrientations];
  }
  else {
    uint64_t v6 = 30;
  }
  v7 = -[TRAPreferencesOrientation initWithSupportedMask:preferred:determinesActiveOrientation:](self, "initWithSupportedMask:preferred:determinesActiveOrientation:", v6, [v5 preferredOrientation], objc_msgSend(v5, "canDetermineActiveOrientation"));

  return v7;
}

- (BOOL)canDetermineActiveOrientation
{
  return self->_canDetermineActiveOrientation;
}

- (unint64_t)supportedOrientations
{
  return self->_supportedOrientations;
}

- (int64_t)preferredOrientation
{
  return self->_preferredOrientation;
}

- (TRAPreferencesOrientation)initWithSupportedMask:(unint64_t)a3 preferred:(int64_t)a4 determinesActiveOrientation:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)TRAPreferencesOrientation;
  result = [(TRAPreferencesOrientation *)&v9 init];
  if (result)
  {
    result->_unint64_t supportedOrientations = a3;
    result->_int64_t preferredOrientation = a4;
    result->_BOOL canDetermineActiveOrientation = a5;
  }
  return result;
}

- (TRAPreferencesOrientation)init
{
  return [(TRAPreferencesOrientation *)self initWithOrientationPreferences:0];
}

- (TRAPreferencesOrientation)initWithSupportedMask:(unint64_t)a3 determinesActiveOrientation:(BOOL)a4
{
  return [(TRAPreferencesOrientation *)self initWithSupportedMask:a3 preferred:0 determinesActiveOrientation:a4];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRAPreferencesOrientation *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TRAPreferencesOrientation *)self isEqualToOrientationPreferences:v4];
  }

  return v5;
}

- (id)succinctDescription
{
  v2 = [(TRAPreferencesOrientation *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = TRAStringForBSInterfaceOrientationMask(self->_supportedOrientations);
  [v3 appendString:v4 withName:@"supports"];

  int64_t preferredOrientation = self->_preferredOrientation;
  if (preferredOrientation)
  {
    uint64_t v6 = TRAStringForBSInterfaceOrientation(preferredOrientation);
    [v3 appendString:v6 withName:@"preferred"];
  }
  id v7 = (id)[v3 appendBool:self->_canDetermineActiveOrientation withName:@"determines active"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(TRAPreferencesOrientation *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (void)setCanDetermineActiveOrientation:(BOOL)a3
{
  self->_BOOL canDetermineActiveOrientation = a3;
}

- (void)setSupportedOrientations:(unint64_t)a3
{
  self->_unint64_t supportedOrientations = a3;
}

- (void)setPreferredOrientation:(int64_t)a3
{
  self->_int64_t preferredOrientation = a3;
}

@end