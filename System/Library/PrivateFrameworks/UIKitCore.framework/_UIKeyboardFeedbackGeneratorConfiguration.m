@interface _UIKeyboardFeedbackGeneratorConfiguration
+ (id)defaultConfiguration;
- (BOOL)defaultEnabled;
- (BOOL)scalingForSpeedEnabled;
- (NSDictionary)feedbacks;
- (double)fastTypingTime;
- (double)fastTypingVolumeMultiplier;
- (double)slowTypingTime;
- (id)feedbackKeyPaths;
- (void)setFastTypingTime:(double)a3;
- (void)setFastTypingVolumeMultiplier:(double)a3;
- (void)setFeedbacks:(id)a3;
- (void)setScalingForSpeedEnabled:(BOOL)a3;
- (void)setSlowTypingTime:(double)a3;
@end

@implementation _UIKeyboardFeedbackGeneratorConfiguration

- (void)setSlowTypingTime:(double)a3
{
  self->_slowTypingTime = a3;
}

- (void)setScalingForSpeedEnabled:(BOOL)a3
{
  self->_scalingForSpeedEnabled = a3;
}

- (void)setFeedbacks:(id)a3
{
  v4 = (NSDictionary *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  feedbacks = self->_feedbacks;
  self->_feedbacks = v4;
}

- (void)setFastTypingVolumeMultiplier:(double)a3
{
  self->_fastTypingVolumeMultiplier = a3;
}

- (void)setFastTypingTime:(double)a3
{
  self->_fastTypingTime = a3;
}

- (BOOL)defaultEnabled
{
  v2 = +[_UIFeedbackPreferences sharedPreferences];
  BOOL v3 = [v2 enabledFeedbackTypesForCategory:0x1ED11B020] & 1;

  return v3;
}

+ (id)defaultConfiguration
{
  return (id)[a1 _configurationWithKey:@"default" preparationBlock:&__block_literal_global_190];
}

- (id)feedbackKeyPaths
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyboardFeedbackGeneratorConfiguration;
  v2 = [(_UIFeedbackGeneratorConfiguration *)&v6 feedbackKeyPaths];
  BOOL v3 = NSStringFromSelector(sel_feedbacks);
  v4 = [v2 arrayByAddingObject:v3];

  return v4;
}

- (NSDictionary)feedbacks
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  feedbacks = self->_feedbacks;
  return feedbacks;
}

- (double)slowTypingTime
{
  return self->_slowTypingTime;
}

- (double)fastTypingTime
{
  return self->_fastTypingTime;
}

- (double)fastTypingVolumeMultiplier
{
  return self->_fastTypingVolumeMultiplier;
}

- (BOOL)scalingForSpeedEnabled
{
  return self->_scalingForSpeedEnabled;
}

- (void).cxx_destruct
{
}

@end