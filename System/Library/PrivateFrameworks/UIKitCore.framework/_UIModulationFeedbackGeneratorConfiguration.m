@interface _UIModulationFeedbackGeneratorConfiguration
- (_UIFeedbackContinuousPlayable)feedback;
- (id)copyWithZone:(_NSZone *)a3;
- (id)feedbackKeyPaths;
- (id)feedbackUpdateBlock;
- (int64_t)requiredSupportLevel;
- (void)setFeedback:(id)a3;
- (void)setFeedbackUpdateBlock:(id)a3;
@end

@implementation _UIModulationFeedbackGeneratorConfiguration

- (int64_t)requiredSupportLevel
{
  return 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIModulationFeedbackGeneratorConfiguration;
  v4 = [(_UIFeedbackGeneratorConfiguration *)&v8 copyWithZone:a3];
  uint64_t v5 = [self->_feedbackUpdateBlock copy];
  v6 = (void *)v4[12];
  v4[12] = v5;

  return v4;
}

- (id)feedbackKeyPaths
{
  v6.receiver = self;
  v6.super_class = (Class)_UIModulationFeedbackGeneratorConfiguration;
  v2 = [(_UIFeedbackGeneratorConfiguration *)&v6 feedbackKeyPaths];
  v3 = NSStringFromSelector(sel_feedback);
  v4 = [v2 arrayByAddingObject:v3];

  return v4;
}

- (void)setFeedback:(id)a3
{
  v4 = (_UIFeedbackContinuousPlayable *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  feedback = self->_feedback;
  self->_feedback = v4;
}

- (_UIFeedbackContinuousPlayable)feedback
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  feedback = self->_feedback;
  return feedback;
}

- (void)setFeedbackUpdateBlock:(id)a3
{
  id v4 = a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  uint64_t v5 = _Block_copy(v4);

  id feedbackUpdateBlock = self->_feedbackUpdateBlock;
  self->_id feedbackUpdateBlock = v5;
}

- (id)feedbackUpdateBlock
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  v3 = _Block_copy(self->_feedbackUpdateBlock);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_feedbackUpdateBlock, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
}

@end