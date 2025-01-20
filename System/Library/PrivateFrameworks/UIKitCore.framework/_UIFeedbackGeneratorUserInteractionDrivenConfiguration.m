@interface _UIFeedbackGeneratorUserInteractionDrivenConfiguration
- (_UIFeedbackDiscretePlayable)interactionCancelledFeedback;
- (_UIFeedbackDiscretePlayable)interactionEndedFeedback;
- (_UIFeedbackDiscretePlayable)interactionStartedFeedback;
- (id)feedbackKeyPaths;
- (void)setInteractionCancelledFeedback:(id)a3;
- (void)setInteractionEndedFeedback:(id)a3;
- (void)setInteractionStartedFeedback:(id)a3;
@end

@implementation _UIFeedbackGeneratorUserInteractionDrivenConfiguration

- (void)setInteractionEndedFeedback:(id)a3
{
  v4 = (_UIFeedbackDiscretePlayable *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  interactionEndedFeedback = self->_interactionEndedFeedback;
  self->_interactionEndedFeedback = v4;
}

- (void)setInteractionStartedFeedback:(id)a3
{
  v4 = (_UIFeedbackDiscretePlayable *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  interactionStartedFeedback = self->_interactionStartedFeedback;
  self->_interactionStartedFeedback = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionCancelledFeedback, 0);
  objc_storeStrong((id *)&self->_interactionEndedFeedback, 0);
  objc_storeStrong((id *)&self->_interactionStartedFeedback, 0);
}

- (id)feedbackKeyPaths
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_UIFeedbackGeneratorUserInteractionDrivenConfiguration;
  v2 = [(_UIFeedbackGeneratorConfiguration *)&v9 feedbackKeyPaths];
  v3 = NSStringFromSelector(sel_interactionStartedFeedback);
  v10[0] = v3;
  v4 = NSStringFromSelector(sel_interactionEndedFeedback);
  v10[1] = v4;
  v5 = NSStringFromSelector(sel_interactionCancelledFeedback);
  v10[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  v7 = [v2 arrayByAddingObjectsFromArray:v6];

  return v7;
}

- (_UIFeedbackDiscretePlayable)interactionStartedFeedback
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  interactionStartedFeedback = self->_interactionStartedFeedback;
  return interactionStartedFeedback;
}

- (_UIFeedbackDiscretePlayable)interactionEndedFeedback
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  interactionEndedFeedback = self->_interactionEndedFeedback;
  return interactionEndedFeedback;
}

- (void)setInteractionCancelledFeedback:(id)a3
{
  v4 = (_UIFeedbackDiscretePlayable *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  interactionCancelledFeedback = self->_interactionCancelledFeedback;
  self->_interactionCancelledFeedback = v4;
}

- (_UIFeedbackDiscretePlayable)interactionCancelledFeedback
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  interactionCancelledFeedback = self->_interactionCancelledFeedback;
  return interactionCancelledFeedback;
}

@end