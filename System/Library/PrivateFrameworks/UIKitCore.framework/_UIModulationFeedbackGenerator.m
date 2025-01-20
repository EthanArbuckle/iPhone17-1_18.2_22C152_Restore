@interface _UIModulationFeedbackGenerator
+ (Class)_configurationClass;
- (_UIFeedbackContinuousPlayable)playingContinuousFeedback;
- (id)_stats_key;
- (void)activateWithCompletionBlock:(id)a3;
- (void)activateWithInitialValue:(double)a3 completionBlock:(id)a4;
- (void)deactivate;
- (void)setPlayingContinuousFeedback:(id)a3;
- (void)valueUpdated:(double)a3;
@end

@implementation _UIModulationFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (void)valueUpdated:(double)a3
{
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  v5 = [(_UIModulationFeedbackGenerator *)self playingContinuousFeedback];

  if (v5)
  {
    id v8 = [(_UIModulationFeedbackGenerator *)self _modulationConfiguration];
    v6 = [v8 feedbackUpdateBlock];
    v7 = [(_UIModulationFeedbackGenerator *)self playingContinuousFeedback];
    ((void (**)(void, void *, double))v6)[2](v6, v7, a3);
  }
  else
  {
    self->_currentValue = a3;
  }
}

- (void)activateWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62___UIModulationFeedbackGenerator_activateWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E52E45A0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)_UIModulationFeedbackGenerator;
  id v5 = v4;
  [(UIFeedbackGenerator *)&v6 activateWithCompletionBlock:v7];
}

- (void)activateWithInitialValue:(double)a3 completionBlock:(id)a4
{
  self->_currentValue = a3;
  [(_UIModulationFeedbackGenerator *)self activateWithCompletionBlock:a4];
}

- (void)deactivate
{
  v5.receiver = self;
  v5.super_class = (Class)_UIModulationFeedbackGenerator;
  [(UIFeedbackGenerator *)&v5 deactivate];
  if (![(UIFeedbackGenerator *)self isActive])
  {
    v3 = [(_UIModulationFeedbackGenerator *)self playingContinuousFeedback];

    if (v3)
    {
      id v4 = [(_UIModulationFeedbackGenerator *)self playingContinuousFeedback];
      [v4 stop];

      [(_UIModulationFeedbackGenerator *)self setPlayingContinuousFeedback:0];
    }
  }
}

- (id)_stats_key
{
  return @"modulation";
}

- (_UIFeedbackContinuousPlayable)playingContinuousFeedback
{
  return self->_playingContinuousFeedback;
}

- (void)setPlayingContinuousFeedback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end