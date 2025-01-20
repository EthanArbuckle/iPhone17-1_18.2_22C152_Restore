@interface SBSDisplayModeSettings
+ (BOOL)supportsSecureCoding;
+ (id)fromDefaultsRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (SBSDisplayModeSettings)initWithCoder:(id)a3;
- (SBSDisplayModeSettings)initWithScale:(unint64_t)a3 overscanCompensation:(int64_t)a4;
- (SBSDisplayModeSettings)initWithSettings:(id)a3;
- (id)defaultsRepresentation;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)overscanCompensation;
- (unint64_t)scale;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBSDisplayModeSettings

- (SBSDisplayModeSettings)initWithSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 scale];
  uint64_t v6 = [v4 overscanCompensation];

  return [(SBSDisplayModeSettings *)self initWithScale:v5 overscanCompensation:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBSDisplayModeSettings *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_scale == v4->_scale
      && self->_overscanCompensation == v4->_overscanCompensation;
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = SBSDisplayScaleDescription(self->_scale);
  [v3 appendString:v4 withName:@"scale"];

  BOOL v5 = SBSDisplayOverscanCompensationDescription(self->_overscanCompensation);
  [v3 appendString:v5 withName:@"overscan"];

  uint64_t v6 = [v3 build];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[SBSMutableDisplayModeSettings allocWithZone:a3];
  return [(SBSDisplayModeSettings *)v4 initWithSettings:self];
}

- (SBSDisplayModeSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"scale"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"overscanCompensation"];

  return [(SBSDisplayModeSettings *)self initWithScale:v5 overscanCompensation:v6];
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t scale = self->_scale;
  id v5 = a3;
  [v5 encodeInteger:scale forKey:@"scale"];
  [v5 encodeInteger:self->_overscanCompensation forKey:@"overscanCompensation"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fromDefaultsRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"scale"];
  unint64_t v6 = [v5 integerValue];

  v7 = [v4 objectForKey:@"overscanCompensation"];

  unint64_t v8 = [v7 integerValue];
  v9 = 0;
  if (v6 <= 2 && v8 <= 2) {
    v9 = (void *)[objc_alloc((Class)a1) initWithScale:v6 overscanCompensation:v8];
  }
  return v9;
}

- (id)defaultsRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"scale";
  v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_scale];
  v7[1] = @"overscanCompensation";
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_overscanCompensation];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (SBSDisplayModeSettings)initWithScale:(unint64_t)a3 overscanCompensation:(int64_t)a4
{
  if (a3 >= 3)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBSDisplayModeSettings.m", 205, @"Invalid parameter not satisfying: %@", @"SBValidateDisplayScale(scale)" object file lineNumber description];
  }
  if ((unint64_t)a4 >= 3)
  {
    unint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBSDisplayModeSettings.m", 206, @"Invalid parameter not satisfying: %@", @"SBValidateOverscanCompensation(overscanCompensation)" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBSDisplayModeSettings;
  result = [(SBSDisplayModeSettings *)&v11 init];
  if (result)
  {
    result->_unint64_t scale = a3;
    result->_overscanCompensation = a4;
  }
  return result;
}

- (unint64_t)scale
{
  return self->_scale;
}

- (int64_t)overscanCompensation
{
  return self->_overscanCompensation;
}

@end