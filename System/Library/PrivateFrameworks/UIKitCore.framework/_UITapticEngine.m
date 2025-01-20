@interface _UITapticEngine
- (BOOL)feedbackActivated;
- (_UIStatesFeedbackGenerator)feedbackGenerator;
- (_UITapticEngine)init;
- (id)_stateForFeedback:(int64_t)a3;
- (void)actuateFeedback:(int64_t)a3;
- (void)endUsingFeedback:(int64_t)a3;
- (void)prepareUsingFeedback:(int64_t)a3;
- (void)setFeedbackActivated:(BOOL)a3;
- (void)setFeedbackGenerator:(id)a3;
@end

@implementation _UITapticEngine

- (_UITapticEngine)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UITapticEngine;
  v2 = [(_UITapticEngine *)&v5 init];
  v3 = [[_UIStatesFeedbackGenerator alloc] initWithStyle:0];
  [(_UITapticEngine *)v2 setFeedbackGenerator:v3];

  return v2;
}

- (void)prepareUsingFeedback:(int64_t)a3
{
  if (pthread_main_np() == 1)
  {
    if (!self->_feedbackActivated)
    {
      [(UIFeedbackGenerator *)self->_feedbackGenerator activateWithCompletionBlock:0];
      self->_feedbackActivated = 1;
    }
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40___UITapticEngine_prepareUsingFeedback___block_invoke;
    v5[3] = &unk_1E52D9CD0;
    v5[4] = self;
    v5[5] = a3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

- (void)endUsingFeedback:(int64_t)a3
{
  if (pthread_main_np() == 1)
  {
    if (self->_feedbackActivated)
    {
      [(UIFeedbackGenerator *)self->_feedbackGenerator deactivate];
      self->_feedbackActivated = 0;
    }
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __36___UITapticEngine_endUsingFeedback___block_invoke;
    v5[3] = &unk_1E52D9CD0;
    v5[4] = self;
    v5[5] = a3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

- (void)actuateFeedback:(int64_t)a3
{
  if (pthread_main_np() == 1)
  {
    objc_super v5 = [(_UITapticEngine *)self _stateForFeedback:a3];
    feedbackGenerator = self->_feedbackGenerator;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __35___UITapticEngine_actuateFeedback___block_invoke_2;
    v8[3] = &unk_1E52DA660;
    v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    [(UIFeedbackGenerator *)feedbackGenerator activateWithCompletionBlock:v8];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35___UITapticEngine_actuateFeedback___block_invoke;
    block[3] = &unk_1E52D9CD0;
    block[4] = self;
    block[5] = a3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (id)_stateForFeedback:(int64_t)a3
{
  v4 = 0;
  objc_super v5 = _UIStatesFeedbackGeneratorForcePresentationStatePreview;
  if (a3 <= 1)
  {
    if (!a3) {
      goto LABEL_12;
    }
    if (a3 != 1)
    {
LABEL_5:
      return v4;
    }
    goto LABEL_10;
  }
  if (a3 != 2)
  {
    if (a3 == 1001) {
      goto LABEL_12;
    }
    if (a3 != 1002) {
      goto LABEL_5;
    }
LABEL_10:
    objc_super v5 = _UIStatesFeedbackGeneratorForcePresentationStateCommit;
    goto LABEL_12;
  }
  objc_super v5 = _UIStatesFeedbackGeneratorForcePresentationStateCancel;
LABEL_12:
  v4 = *v5;
  return v4;
}

- (_UIStatesFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (BOOL)feedbackActivated
{
  return self->_feedbackActivated;
}

- (void)setFeedbackActivated:(BOOL)a3
{
  self->_feedbackActivated = a3;
}

- (void).cxx_destruct
{
}

@end