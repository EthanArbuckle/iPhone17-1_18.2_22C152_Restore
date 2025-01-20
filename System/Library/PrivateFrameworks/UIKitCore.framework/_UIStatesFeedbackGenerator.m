@interface _UIStatesFeedbackGenerator
+ (Class)_configurationClass;
- (BOOL)_approachActivated;
- (NSString)currentState;
- (_UIFeedbackContinuousPlayable)playingContinuousFeedback;
- (_UIStatesFeedbackGenerator)initWithConfiguration:(id)a3 view:(id)a4;
- (_UIStatesFeedbackGenerator)initWithStyle:(int64_t)a3;
- (_UIStatesFeedbackGenerator)initWithStyle:(int64_t)a3 view:(id)a4;
- (id)_configurationFromState:(id)a3 toState:(id)a4;
- (id)_stats_key;
- (void)_setApproachActivated:(BOOL)a3;
- (void)_stopPlayingContinuousFeedback;
- (void)setCurrentState:(id)a3;
- (void)setPlayingContinuousFeedback:(id)a3;
- (void)transitionToState:(id)a3 ended:(BOOL)a4;
- (void)transitionToState:(id)a3 ended:(BOOL)a4 atLocation:(CGPoint)a5;
- (void)transitionToState:(id)a3 updated:(double)a4;
- (void)transitionToState:(id)a3 updated:(double)a4 atLocation:(CGPoint)a5;
@end

@implementation _UIStatesFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (_UIStatesFeedbackGenerator)initWithConfiguration:(id)a3 view:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIStatesFeedbackGenerator;
  v4 = [(UIFeedbackGenerator *)&v9 initWithConfiguration:a3 view:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(_UIStatesFeedbackGenerator *)v4 _statesConfiguration];
    v7 = [v6 initialState];
    [(_UIStatesFeedbackGenerator *)v5 setCurrentState:v7];
  }
  return v5;
}

- (void)setCurrentState:(id)a3
{
}

- (_UIStatesFeedbackGenerator)initWithStyle:(int64_t)a3 view:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    if (a3 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = off_1E52D6030;
  }
  else
  {
    v7 = off_1E52D6028;
  }
  v8 = [(__objc2_class *)*v7 defaultConfiguration];
LABEL_7:
  v11.receiver = self;
  v11.super_class = (Class)_UIStatesFeedbackGenerator;
  objc_super v9 = [(UIFeedbackGenerator *)&v11 initWithConfiguration:v8 view:v6];

  return v9;
}

- (_UIStatesFeedbackGenerator)initWithStyle:(int64_t)a3
{
  return [(_UIStatesFeedbackGenerator *)self initWithStyle:a3 view:0];
}

- (id)_configurationFromState:(id)a3 toState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_UIStatesFeedbackGenerator *)self _statesConfiguration];
  objc_super v9 = [v8 stateChangeConfigurations];

  v10 = +[_UIStatesFeedbackGeneratorConfiguration keyFromState:v6 toState:v7];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];
  if (v11) {
    goto LABEL_2;
  }
  v13 = +[_UIStatesFeedbackGeneratorConfiguration keyFromState:0 toState:v7];

  uint64_t v14 = [v9 objectForKeyedSubscript:v13];
  if (!v14)
  {
    v10 = +[_UIStatesFeedbackGeneratorConfiguration keyFromState:v6 toState:0];

    uint64_t v11 = [v9 objectForKeyedSubscript:v10];
LABEL_2:
    v12 = (void *)v11;
    goto LABEL_5;
  }
  v12 = (void *)v14;
  v10 = v13;
LABEL_5:

  return v12;
}

- (void)transitionToState:(id)a3 updated:(double)a4 atLocation:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v35 = a3;
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  if ([(UIFeedbackGenerator *)self _isEnabled])
  {
    v10 = [(_UIStatesFeedbackGenerator *)self currentState];
    uint64_t v11 = [(_UIStatesFeedbackGenerator *)self _configurationFromState:v10 toState:v35];

    v12 = [v11 approachFeedback];
    if (v12)
    {
      if (self->_approachActivated) {
        goto LABEL_4;
      }
      [v11 approachStart];
      if (v34 >= a4)
      {
        self->_approachActivated = 1;
        goto LABEL_18;
      }
      if (self->_approachActivated)
      {
LABEL_4:
        [v11 approachStart];
        if (v13 <= a4)
        {
          [v11 approachEnd];
          if (v14 >= a4)
          {
            playingContinuousFeedback = self->_playingContinuousFeedback;
            if (!playingContinuousFeedback)
            {
              v16 = (_UIFeedbackContinuousPlayable *)[v12 copy];
              v17 = self->_playingContinuousFeedback;
              self->_playingContinuousFeedback = v16;
            }
            [v11 approachEnd];
            double v19 = v18;
            [v11 approachStart];
            double v21 = v19 - v20;
            [v11 approachStart];
            double v23 = (a4 - v22) / v21;
            [v11 approachCurvature];
            if (v23 != 0.0) {
              double v23 = pow(v24, (v23 + -1.0) * 10.0);
            }
            [v11 approachVolumeMax];
            double v26 = v25;
            v27 = [v12 hapticParameters];
            [v27 volume];
            double v29 = v23 * v28;

            if (v26 >= v29) {
              double v30 = v29;
            }
            else {
              double v30 = v26;
            }
            float v31 = v30;
            v32 = [(_UIFeedbackContinuousPlayable *)self->_playingContinuousFeedback hapticParameters];
            *(float *)&double v33 = v31;
            [v32 setVolume:v33];

            if (!playingContinuousFeedback) {
              -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", self->_playingContinuousFeedback, x, y);
            }
            goto LABEL_18;
          }
        }
      }
    }
    [(_UIStatesFeedbackGenerator *)self _stopPlayingContinuousFeedback];
LABEL_18:
  }
}

- (void)transitionToState:(id)a3 ended:(BOOL)a4 atLocation:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  BOOL v7 = a4;
  id v13 = a3;
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  if ([(UIFeedbackGenerator *)self _isEnabled])
  {
    [(_UIStatesFeedbackGenerator *)self _stopPlayingContinuousFeedback];
    if (v7)
    {
      v10 = [(_UIStatesFeedbackGenerator *)self currentState];
      uint64_t v11 = [(_UIStatesFeedbackGenerator *)self _configurationFromState:v10 toState:v13];

      v12 = [v11 thresholdFeedback];
      -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v12, x, y);

      [(_UIStatesFeedbackGenerator *)self setCurrentState:v13];
    }
  }
}

- (void)transitionToState:(id)a3 updated:(double)a4
{
}

- (void)transitionToState:(id)a3 ended:(BOOL)a4
{
}

- (void)_stopPlayingContinuousFeedback
{
  playingContinuousFeedback = self->_playingContinuousFeedback;
  if (playingContinuousFeedback)
  {
    [(_UIFeedbackContinuousPlayable *)playingContinuousFeedback stop];
    [(_UIStatesFeedbackGenerator *)self setPlayingContinuousFeedback:0];
    self->_approachActivated = 0;
  }
}

- (id)_stats_key
{
  return @"states";
}

- (NSString)currentState
{
  return self->_currentState;
}

- (BOOL)_approachActivated
{
  return self->_approachActivated;
}

- (void)_setApproachActivated:(BOOL)a3
{
  self->_approachActivated = a3;
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
  objc_storeStrong((id *)&self->_playingContinuousFeedback, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

@end