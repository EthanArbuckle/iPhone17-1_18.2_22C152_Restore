@interface _UISelectionFeedbackGeneratorConfiguration
+ (id)defaultConfiguration;
+ (id)lightConfiguration;
+ (id)pageControlConfiguration;
+ (id)pickerConfiguration;
+ (id)strongConfiguration;
- (BOOL)isEqual:(id)a3;
- (NSString)hidFeedbackPatternName;
- (_UIFeedbackDiscretePlayable)feedback;
- (double)fastAudioVolume;
- (double)fastHapticVolume;
- (double)maxSpeed;
- (double)minimumInterval;
- (double)slowAudioVolume;
- (double)slowHapticVolume;
- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)feedbackKeyPaths;
- (id)hidFeedbackPatternNameKeyPaths;
- (int64_t)requiredPeripheralSupportLevel;
- (void)setFastAudioVolume:(double)a3;
- (void)setFastHapticVolume:(double)a3;
- (void)setFeedback:(id)a3;
- (void)setHidFeedbackPatternName:(id)a3;
- (void)setMaxSpeed:(double)a3;
- (void)setMinimumInterval:(double)a3;
- (void)setSlowAudioVolume:(double)a3;
- (void)setSlowHapticVolume:(double)a3;
@end

@implementation _UISelectionFeedbackGeneratorConfiguration

+ (id)pageControlConfiguration
{
  return (id)[a1 _configurationWithKey:@"pageControl" requiredSupportLevel:2 preparationBlock:&__block_literal_global_53];
}

- (int64_t)requiredPeripheralSupportLevel
{
  return 1;
}

- (void)setMinimumInterval:(double)a3
{
  self->_minimumInterval = a3;
}

- (void)setFeedback:(id)a3
{
  v4 = (_UIFeedbackDiscretePlayable *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  feedback = self->_feedback;
  self->_feedback = v4;
}

- (void)setHidFeedbackPatternName:(id)a3
{
}

+ (id)defaultConfiguration
{
  return (id)[a1 _configurationWithKey:@"default" requiredSupportLevel:2 preparationBlock:&__block_literal_global_185];
}

+ (id)strongConfiguration
{
  return (id)[a1 _configurationWithKey:@"strong" requiredSupportLevel:2 preparationBlock:&__block_literal_global_42];
}

+ (id)lightConfiguration
{
  return (id)[a1 _configurationWithKey:@"light" requiredSupportLevel:2 preparationBlock:&__block_literal_global_37_0];
}

+ (id)pickerConfiguration
{
  return (id)[a1 _configurationWithKey:@"picker" requiredSupportLevel:0 preparationBlock:&__block_literal_global_47];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UISelectionFeedbackGeneratorConfiguration;
  id result = [(_UIFeedbackGeneratorConfiguration *)&v5 copyWithZone:a3];
  *((void *)result + 15) = *(void *)&self->_minimumInterval;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UISelectionFeedbackGeneratorConfiguration;
  if ([(_UIFeedbackGeneratorConfiguration *)&v7 isEqual:v4]) {
    BOOL v5 = self->_minimumInterval == v4[15];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)feedbackKeyPaths
{
  v6.receiver = self;
  v6.super_class = (Class)_UISelectionFeedbackGeneratorConfiguration;
  v2 = [(_UIFeedbackGeneratorUserInteractionDrivenConfiguration *)&v6 feedbackKeyPaths];
  v3 = NSStringFromSelector(sel_feedback);
  v4 = [v2 arrayByAddingObject:v3];

  return v4;
}

- (id)hidFeedbackPatternNameKeyPaths
{
  v6.receiver = self;
  v6.super_class = (Class)_UISelectionFeedbackGeneratorConfiguration;
  v2 = [(_UIFeedbackGeneratorConfiguration *)&v6 hidFeedbackPatternNameKeyPaths];
  v3 = NSStringFromSelector(sel_hidFeedbackPatternName);
  v4 = [v2 arrayByAddingObject:v3];

  return v4;
}

- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5
{
  id v8 = a3;
  v9 = [(_UISelectionFeedbackGeneratorConfiguration *)self hidFeedbackPatternName];
  if (v9)
  {
    uint64_t v10 = +[_UIFeedbackBackBoardHIDPattern feedbackPatternWithName:v9 deviceType:a4 senderID:a5];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_UISelectionFeedbackGeneratorConfiguration;
    uint64_t v10 = [(_UIFeedbackGeneratorConfiguration *)&v13 _alternateFeedback:v8 forDevice:a4 senderID:a5];
  }
  v11 = (void *)v10;

  return v11;
}

- (_UIFeedbackDiscretePlayable)feedback
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  feedback = self->_feedback;
  return feedback;
}

- (double)minimumInterval
{
  return self->_minimumInterval;
}

- (NSString)hidFeedbackPatternName
{
  return self->_hidFeedbackPatternName;
}

- (double)maxSpeed
{
  return self->_maxSpeed;
}

- (void)setMaxSpeed:(double)a3
{
  self->_maxSpeed = a3;
}

- (double)slowAudioVolume
{
  return self->_slowAudioVolume;
}

- (void)setSlowAudioVolume:(double)a3
{
  self->_slowAudioVolume = a3;
}

- (double)fastAudioVolume
{
  return self->_fastAudioVolume;
}

- (void)setFastAudioVolume:(double)a3
{
  self->_fastAudioVolume = a3;
}

- (double)slowHapticVolume
{
  return self->_slowHapticVolume;
}

- (void)setSlowHapticVolume:(double)a3
{
  self->_slowHapticVolume = a3;
}

- (double)fastHapticVolume
{
  return self->_fastHapticVolume;
}

- (void)setFastHapticVolume:(double)a3
{
  self->_fastHapticVolume = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidFeedbackPatternName, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
}

@end