@interface UISelectionFeedbackGenerator
+ (Class)_configurationClass;
- (double)lastSelectionChangeTime;
- (id)_stats_key;
- (void)_deactivated;
- (void)selectionChanged;
- (void)selectionChangedAtLocation:(CGPoint)a3;
- (void)setLastSelectionChangeTime:(double)a3;
- (void)userInteractionCancelled;
- (void)userInteractionCancelledAtLocation:(CGPoint)a3;
- (void)userInteractionEnded;
- (void)userInteractionEndedAtLocation:(CGPoint)a3;
- (void)userInteractionStarted;
- (void)userInteractionStartedAtLocation:(CGPoint)a3;
@end

@implementation UISelectionFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (void)userInteractionStartedAtLocation:(CGPoint)a3
{
}

- (void)userInteractionStarted
{
}

- (void)userInteractionEndedAtLocation:(CGPoint)a3
{
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2, a3.x, a3.y);
  [(UIFeedbackGenerator *)self deactivate];
}

- (void)userInteractionEnded
{
}

- (void)userInteractionCancelledAtLocation:(CGPoint)a3
{
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2, a3.x, a3.y);
  [(UIFeedbackGenerator *)self deactivate];
}

- (void)userInteractionCancelled
{
}

- (void)_deactivated
{
  v3.receiver = self;
  v3.super_class = (Class)UISelectionFeedbackGenerator;
  [(UIFeedbackGenerator *)&v3 _deactivated];
  self->_lastSelectionChangeTime = 0.0;
}

- (void)selectionChanged
{
}

- (void)selectionChangedAtLocation:(CGPoint)a3
{
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  CFTimeInterval v4 = CACurrentMediaTime();
  double lastSelectionChangeTime = self->_lastSelectionChangeTime;
  double v6 = 1.0 / (v4 - lastSelectionChangeTime);
  if (v4 - lastSelectionChangeTime <= 0.0) {
    double v6 = 0.0;
  }
  if (lastSelectionChangeTime > 0.0) {
    double v7 = v6;
  }
  else {
    double v7 = 0.0;
  }
  self->_double lastSelectionChangeTime = v4;
  v8 = [(UISelectionFeedbackGenerator *)self _selectionConfiguration];
  id v37 = [v8 feedback];

  v9 = [(UISelectionFeedbackGenerator *)self _selectionConfiguration];
  [v9 maxSpeed];
  double v11 = v10;

  if (v11 > 0.0)
  {
    v12 = [(UISelectionFeedbackGenerator *)self _selectionConfiguration];
    [v12 maxSpeed];
    double v14 = v7 / v13;

    double v15 = fmin(fmax(v14, 0.0), 1.0);
    v16 = [(UISelectionFeedbackGenerator *)self _selectionConfiguration];
    [v16 slowAudioVolume];
    double v18 = v17;
    v19 = [(UISelectionFeedbackGenerator *)self _selectionConfiguration];
    [v19 fastAudioVolume];
    double v21 = v20;
    v22 = [(UISelectionFeedbackGenerator *)self _selectionConfiguration];
    [v22 slowAudioVolume];
    *(float *)&double v18 = v18 + v15 * (v21 - v23);
    v24 = [v37 audioParameters];
    LODWORD(v25) = LODWORD(v18);
    [v24 setVolume:v25];

    v26 = [(UISelectionFeedbackGenerator *)self _selectionConfiguration];
    [v26 slowHapticVolume];
    double v28 = v27;
    v29 = [(UISelectionFeedbackGenerator *)self _selectionConfiguration];
    [v29 fastHapticVolume];
    double v31 = v30;
    v32 = [(UISelectionFeedbackGenerator *)self _selectionConfiguration];
    [v32 slowHapticVolume];
    *(float *)&double v28 = v28 + v15 * (v31 - v33);
    v34 = [v37 hapticParameters];
    LODWORD(v35) = LODWORD(v28);
    [v34 setVolume:v35];
  }
  v36 = [(UISelectionFeedbackGenerator *)self _selectionConfiguration];
  [v36 minimumInterval];
  -[UIFeedbackGenerator _playFeedback:withMinimumIntervalPassed:since:prefersRegularPace:atLocation:](self, "_playFeedback:withMinimumIntervalPassed:since:prefersRegularPace:atLocation:", v37, &_playFeedbackWithSpeed_atLocation____lastTime, 1);
}

- (id)_stats_key
{
  return @"selection";
}

- (double)lastSelectionChangeTime
{
  return self->_lastSelectionChangeTime;
}

- (void)setLastSelectionChangeTime:(double)a3
{
  self->_double lastSelectionChangeTime = a3;
}

@end