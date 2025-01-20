@interface _UIImpactFeedbackGeneratorConfiguration
+ (id)defaultConfiguration;
+ (id)lightConfiguration;
+ (id)refreshConfiguration;
+ (id)rigidConfiguration;
+ (id)softConfiguration;
+ (id)strongConfiguration;
- (BOOL)isEqual:(id)a3;
- (NSString)hidFeedbackPatternName;
- (_UIFeedbackDiscretePlayable)feedback;
- (double)minimumInterval;
- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)feedbackKeyPaths;
- (id)feedbackUpdateBlock;
- (id)hidFeedbackPatternNameKeyPaths;
- (int64_t)requiredSupportLevel;
- (void)setFeedback:(id)a3;
- (void)setFeedbackUpdateBlock:(id)a3;
- (void)setHidFeedbackPatternName:(id)a3;
- (void)setMinimumInterval:(double)a3;
@end

@implementation _UIImpactFeedbackGeneratorConfiguration

+ (id)lightConfiguration
{
  return (id)[a1 _configurationWithKey:@"light" preparationBlock:&__block_literal_global_56_1];
}

- (int64_t)requiredSupportLevel
{
  return 2;
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

+ (id)refreshConfiguration
{
  v2 = [a1 _configurationWithKey:@"refresh" requiredSupportLevel:2 preparationBlock:&__block_literal_global_76_0];
  [v2 setRequiredPeripheralSupportLevel:1];
  return v2;
}

+ (id)softConfiguration
{
  return (id)[a1 _configurationWithKey:@"soft" preparationBlock:&__block_literal_global_66];
}

+ (id)rigidConfiguration
{
  return (id)[a1 _configurationWithKey:@"rigid" preparationBlock:&__block_literal_global_71_1];
}

+ (id)strongConfiguration
{
  return (id)[a1 _configurationWithKey:@"heavy" preparationBlock:&__block_literal_global_61];
}

+ (id)defaultConfiguration
{
  return (id)[a1 _configurationWithKey:@"medium" preparationBlock:&__block_literal_global_183];
}

- (id)feedbackKeyPaths
{
  v6.receiver = self;
  v6.super_class = (Class)_UIImpactFeedbackGeneratorConfiguration;
  v2 = [(_UIFeedbackGeneratorConfiguration *)&v6 feedbackKeyPaths];
  v3 = NSStringFromSelector(sel_feedback);
  v4 = [v2 arrayByAddingObject:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidFeedbackPatternName, 0);
  objc_storeStrong(&self->_feedbackUpdateBlock, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIImpactFeedbackGeneratorConfiguration;
  v4 = [(_UIFeedbackGeneratorConfiguration *)&v8 copyWithZone:a3];
  uint64_t v5 = [self->_feedbackUpdateBlock copy];
  objc_super v6 = (void *)v4[12];
  v4[12] = v5;

  v4[13] = *(void *)&self->_minimumInterval;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImpactFeedbackGeneratorConfiguration;
  if ([(_UIFeedbackGeneratorConfiguration *)&v7 isEqual:v4]) {
    BOOL v5 = self->_minimumInterval == v4[13];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)hidFeedbackPatternNameKeyPaths
{
  v6.receiver = self;
  v6.super_class = (Class)_UIImpactFeedbackGeneratorConfiguration;
  v2 = [(_UIFeedbackGeneratorConfiguration *)&v6 hidFeedbackPatternNameKeyPaths];
  v3 = NSStringFromSelector(sel_hidFeedbackPatternName);
  v4 = [v2 arrayByAddingObject:v3];

  return v4;
}

- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5
{
  id v8 = a3;
  v9 = [(_UIImpactFeedbackGeneratorConfiguration *)self hidFeedbackPatternName];
  if (v9)
  {
    uint64_t v10 = +[_UIFeedbackBackBoardHIDPattern feedbackPatternWithName:v9 deviceType:a4 senderID:a5];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_UIImpactFeedbackGeneratorConfiguration;
    uint64_t v10 = [(_UIFeedbackGeneratorConfiguration *)&v13 _alternateFeedback:v8 forDevice:a4 senderID:a5];
  }
  v11 = (void *)v10;

  return v11;
}

- (void)setFeedbackUpdateBlock:(id)a3
{
  id v4 = a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  BOOL v5 = _Block_copy(v4);

  id feedbackUpdateBlock = self->_feedbackUpdateBlock;
  self->_id feedbackUpdateBlock = v5;
}

- (id)feedbackUpdateBlock
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  v3 = _Block_copy(self->_feedbackUpdateBlock);
  return v3;
}

- (NSString)hidFeedbackPatternName
{
  return self->_hidFeedbackPatternName;
}

- (void)setHidFeedbackPatternName:(id)a3
{
}

@end