@interface SBSMutableDisplayModeSettings
- (id)copyWithZone:(_NSZone *)a3;
- (void)setOverscanCompensation:(int64_t)a3;
- (void)setScale:(unint64_t)a3;
@end

@implementation SBSMutableDisplayModeSettings

- (void)setScale:(unint64_t)a3
{
  if (a3 >= 3)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBSDisplayModeSettings.m", 223, @"Invalid parameter not satisfying: %@", @"scale == SBSDisplayScaleStandard || scale == SBSDisplayScaleLargerText || scale == SBSDisplayScaleMoreSpace" object file lineNumber description];
  }
  self->super._scale = a3;
}

- (void)setOverscanCompensation:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBSDisplayModeSettings.m", 229, @"Invalid parameter not satisfying: %@", @"overscanCompensation == SBSDisplayOverscanCompensationNone || overscanCompensation == SBSDisplayOverscanCompensationInsetBounds || overscanCompensation == SBSDisplayOverscanCompensationScaleContent" object file lineNumber description];
  }
  self->super._overscanCompensation = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SBSDisplayModeSettings alloc];
  return [(SBSDisplayModeSettings *)v4 initWithSettings:self];
}

@end