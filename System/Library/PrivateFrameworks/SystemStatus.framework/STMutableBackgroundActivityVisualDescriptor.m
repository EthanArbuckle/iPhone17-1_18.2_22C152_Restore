@interface STMutableBackgroundActivityVisualDescriptor
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBackgroundColorRepresentation:(id)a3;
- (void)setCrossfadableActivities:(id)a3;
- (void)setFontSizeAdjustment:(double)a3;
- (void)setImageName:(id)a3;
- (void)setPackageName:(id)a3;
- (void)setPreferredContinuousAnimationName:(id)a3;
- (void)setPreferredVisualEffectName:(id)a3;
- (void)setPrefersToKeepContentVisible:(BOOL)a3;
- (void)setPrefersToSuppressPulse:(BOOL)a3;
- (void)setSystemImageName:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setVerticalOffsetInPixels:(double)a3;
@end

@implementation STMutableBackgroundActivityVisualDescriptor

- (void)setSystemImageName:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSString *)[v6 copy];
    systemImageName = self->super._systemImageName;
    self->super._systemImageName = v4;
  }
}

- (void)setImageName:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSString *)[v6 copy];
    imageName = self->super._imageName;
    self->super._imageName = v4;
  }
}

- (void)setPackageName:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSString *)[v6 copy];
    packageName = self->super._packageName;
    self->super._packageName = v4;
  }
}

- (void)setTextLabel:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSString *)[v6 copy];
    textLabel = self->super._textLabel;
    self->super._textLabel = v4;
  }
}

- (void)setBackgroundColorRepresentation:(id)a3
{
  p_backgroundColorRepresentation = &self->super._backgroundColorRepresentation;
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_backgroundColorRepresentation, a3);
  }
}

- (void)setVerticalOffsetInPixels:(double)a3
{
  if (self->super._verticalOffsetInPixels != a3) {
    self->super._verticalOffsetInPixels = a3;
  }
}

- (void)setFontSizeAdjustment:(double)a3
{
  if (self->super._fontSizeAdjustment != a3) {
    self->super._fontSizeAdjustment = a3;
  }
}

- (void)setPrefersToKeepContentVisible:(BOOL)a3
{
  if (self->super._prefersToKeepContentVisible != a3) {
    self->super._prefersToKeepContentVisible = a3;
  }
}

- (void)setPreferredVisualEffectName:(id)a3
{
  v4 = (__CFString *)a3;
  if (!v4) {
    v4 = @"none";
  }
  v7 = v4;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v5 = (NSString *)[(__CFString *)v7 copy];
    preferredVisualEffectName = self->super._preferredVisualEffectName;
    self->super._preferredVisualEffectName = v5;
  }
}

- (void)setPreferredContinuousAnimationName:(id)a3
{
  v4 = (__CFString *)a3;
  if (!v4) {
    v4 = @"pulseBackground";
  }
  v7 = v4;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v5 = (NSString *)[(__CFString *)v7 copy];
    preferredContinuousAnimationName = self->super._preferredContinuousAnimationName;
    self->super._preferredContinuousAnimationName = v5;
  }
}

- (void)setCrossfadableActivities:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSSet *)[v6 copy];
    crossfadableActivities = self->super._crossfadableActivities;
    self->super._crossfadableActivities = v4;
  }
}

- (void)setPrefersToSuppressPulse:(BOOL)a3
{
  v4 = STBackgroundActivityContinuousAnimationNone;
  if (!a3)
  {
    id v5 = [(STBackgroundActivityVisualDescriptor *)self preferredContinuousAnimationName];
    int v6 = [v5 isEqual:@"none"];

    if (!v6) {
      return;
    }
    v4 = STBackgroundActivityContinuousAnimationPulseBackground;
  }
  v7 = *v4;

  [(STMutableBackgroundActivityVisualDescriptor *)self setPreferredContinuousAnimationName:v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  _copyValuesFromDescriptorToDescriptor(self, v4);
  return v4;
}

@end