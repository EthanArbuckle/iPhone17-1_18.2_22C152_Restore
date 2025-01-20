@interface _UIDragFeedbackGenerator
+ (Class)_configurationClass;
- (_UIFeedbackContinuousPlayable)_playingContinuousFeedback;
- (id)_stats_key;
- (int64_t)_state;
- (void)_setPlayingContinuousFeedback:(id)a3;
- (void)_setState:(int64_t)a3;
- (void)_startPlayingContinuousFeedback;
- (void)_startPlayingContinuousFeedbackNow;
- (void)_stopPlayingContinuousFeedback;
- (void)dropTargetUpdated;
- (void)dropTargetUpdatedAtLocation:(CGPoint)a3;
- (void)positionUpdated;
- (void)positionUpdatedAtLocation:(CGPoint)a3;
- (void)userInteractionCancelled;
- (void)userInteractionCancelledAtLocation:(CGPoint)a3;
- (void)userInteractionEnded;
- (void)userInteractionEndedAtLocation:(CGPoint)a3;
- (void)userInteractionStarted;
- (void)userInteractionStartedAtLocation:(CGPoint)a3;
@end

@implementation _UIDragFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (void)userInteractionStartedAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (self->_state == 2)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_UIDragFeedbackGenerator.m", 50, @"%@ is already being interacted with", self object file lineNumber description];
  }
  [(UIFeedbackGenerator *)self activateWithCompletionBlock:0];
  self->_state = 2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61___UIDragFeedbackGenerator_userInteractionStartedAtLocation___block_invoke;
  v8[3] = &unk_1E52DA6D8;
  v8[4] = self;
  *(CGFloat *)&v8[5] = x;
  *(CGFloat *)&v8[6] = y;
  [(UIFeedbackGenerator *)self activateWithCompletionBlock:v8];
}

- (void)userInteractionStarted
{
}

- (void)userInteractionEndedAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  if (self->_state != 2)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIDragFeedbackGenerator.m", 74, @"%@ should be being interacted with when ending it", self object file lineNumber description];
  }
  [(_UIDragFeedbackGenerator *)self _stopPlayingContinuousFeedback];
  if (self->_state == 2)
  {
    v7 = [(_UIDragFeedbackGenerator *)self _dragConfiguration];
    v8 = [v7 interactionEndedFeedback];
    -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v8, x, y);
  }
  self->_state = 0;
  [(UIFeedbackGenerator *)self deactivate];
}

- (void)userInteractionEnded
{
}

- (void)userInteractionCancelledAtLocation:(CGPoint)a3
{
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2, a3.x, a3.y);
  unint64_t state = self->_state;
  BOOL v6 = state > 4;
  uint64_t v7 = (1 << state) & 0x16;
  if (v6 || v7 == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIDragFeedbackGenerator.m", 95, @"%@ should be being interacted with when cancelling it", self object file lineNumber description];
  }
  [(_UIDragFeedbackGenerator *)self _stopPlayingContinuousFeedback];
  self->_unint64_t state = 0;
  [(UIFeedbackGenerator *)self deactivate];
}

- (void)userInteractionCancelled
{
}

- (void)positionUpdatedAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  if (self->_state)
  {
    id v7 = [(_UIDragFeedbackGenerator *)self _dragConfiguration];
    BOOL v6 = [v7 interactionUpdatedFeedback];
    -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v6, x, y);
  }
}

- (void)dropTargetUpdatedAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  if (self->_state)
  {
    id v7 = [(_UIDragFeedbackGenerator *)self _dragConfiguration];
    BOOL v6 = [v7 targetUpdatedFeedback];
    -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v6, x, y);
  }
}

- (void)positionUpdated
{
}

- (void)dropTargetUpdated
{
}

- (void)_startPlayingContinuousFeedback
{
  v3 = [(_UIDragFeedbackGenerator *)self _dragConfiguration];
  [v3 progressingFeedbackDelay];
  double v5 = v4;

  if (v5 == 0.0)
  {
    [(_UIDragFeedbackGenerator *)self _startPlayingContinuousFeedbackNow];
  }
  else
  {
    [(_UIDragFeedbackGenerator *)self performSelector:sel__startPlayingContinuousFeedbackNow withObject:0 afterDelay:v5];
  }
}

- (void)_startPlayingContinuousFeedbackNow
{
  if (self->_state == 2)
  {
    v3 = [(_UIDragFeedbackGenerator *)self _dragConfiguration];
    id v4 = [v3 interactionProgressingFeedback];

    if (v4)
    {
      [(_UIDragFeedbackGenerator *)self _setPlayingContinuousFeedback:v4];
      -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v4, 1.79769313e308, 1.79769313e308);
    }
  }
}

- (void)_stopPlayingContinuousFeedback
{
  playingContinuousFeedback = self->_playingContinuousFeedback;
  if (playingContinuousFeedback)
  {
    [(_UIFeedbackContinuousPlayable *)playingContinuousFeedback stop];
    [(_UIDragFeedbackGenerator *)self _setPlayingContinuousFeedback:0];
  }
}

- (id)_stats_key
{
  return @"drag";
}

- (int64_t)_state
{
  return self->_state;
}

- (void)_setState:(int64_t)a3
{
  self->_unint64_t state = a3;
}

- (_UIFeedbackContinuousPlayable)_playingContinuousFeedback
{
  return self->_playingContinuousFeedback;
}

- (void)_setPlayingContinuousFeedback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end