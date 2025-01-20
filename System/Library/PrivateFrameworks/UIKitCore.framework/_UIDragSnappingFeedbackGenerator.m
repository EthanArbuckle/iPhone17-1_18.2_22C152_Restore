@interface _UIDragSnappingFeedbackGenerator
+ (Class)_configurationClass;
- (void)_startLanding;
- (void)_stopLanding;
- (void)draggedObjectLanded;
- (void)draggedObjectLandedAtLocation:(CGPoint)a3;
- (void)draggedObjectLifted;
- (void)draggedObjectLiftedAtLocation:(CGPoint)a3;
- (void)objectSnapped;
- (void)objectSnappedAtLocation:(CGPoint)a3;
- (void)userInteractionEnded;
- (void)userInteractionStarted;
@end

@implementation _UIDragSnappingFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (void)userInteractionStarted
{
  if ([(_UIDragFeedbackGenerator *)self _state] == 1
    || [(_UIDragFeedbackGenerator *)self _state] == 2)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"_UIDragFeedbackGenerator.m", 198, @"%@ is already being interacted with", self object file lineNumber description];
  }
  [(_UIDragSnappingFeedbackGenerator *)self _stopLanding];
  [(UIFeedbackGenerator *)self activateWithCompletionBlock:0];
  [(_UIDragFeedbackGenerator *)self _setState:1];
}

- (void)userInteractionEnded
{
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  if ([(_UIDragFeedbackGenerator *)self _state] != 1
    && [(_UIDragFeedbackGenerator *)self _state] != 2
    && [(_UIDragFeedbackGenerator *)self _state] != 4)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"_UIDragFeedbackGenerator.m", 211, @"%@ should be being interacted with when ending it", self object file lineNumber description];
  }
  if ([(_UIDragFeedbackGenerator *)self _state] != 4) {
    [(_UIDragSnappingFeedbackGenerator *)self _startLanding];
  }
  if ([(_UIDragFeedbackGenerator *)self _state] != 3) {
    [(_UIDragFeedbackGenerator *)self _setState:0];
  }
  [(UIFeedbackGenerator *)self deactivate];
}

- (void)draggedObjectLiftedAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  if ([(_UIDragFeedbackGenerator *)self _state] == 1)
  {
    v6 = [(_UIDragFeedbackGenerator *)self _dragConfiguration];
    v7 = [v6 interactionStartedFeedback];
    -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v7, x, y);

    [(_UIDragFeedbackGenerator *)self _setState:2];
  }
}

- (void)draggedObjectLandedAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  v6 = [(_UIDragFeedbackGenerator *)self _dragConfiguration];
  id v7 = [v6 interactionEndedFeedback];

  if ([(_UIDragFeedbackGenerator *)self _state] == 3)
  {
    -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v7, x, y);
    [(_UIDragSnappingFeedbackGenerator *)self _stopLanding];
  }
  else if ([(_UIDragFeedbackGenerator *)self _state] == 2)
  {
    -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v7, x, y);
    [(_UIDragFeedbackGenerator *)self _setState:4];
  }
}

- (void)objectSnappedAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  if ([(_UIDragFeedbackGenerator *)self _state])
  {
    id v7 = [(_UIDragSnappingFeedbackGenerator *)self _dragSnappingConfiguration];
    v6 = [v7 objectSnappedFeedback];
    -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v6, x, y);
  }
}

- (void)draggedObjectLifted
{
}

- (void)draggedObjectLanded
{
}

- (void)objectSnapped
{
}

- (void)_startLanding
{
  if ([(_UIDragFeedbackGenerator *)self _state] == 2)
  {
    v3 = [(_UIDragFeedbackGenerator *)self _dragConfiguration];
    v4 = [v3 interactionEndedFeedback];

    if (v4)
    {
      [(UIFeedbackGenerator *)self activateWithCompletionBlock:0];
      [(_UIDragSnappingFeedbackGenerator *)self performSelector:sel__stopLanding withObject:0 afterDelay:2.0];
      [(_UIDragFeedbackGenerator *)self _setState:3];
    }
  }
}

- (void)_stopLanding
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__stopLanding object:0];
  if ([(_UIDragFeedbackGenerator *)self _state] == 3)
  {
    [(_UIDragFeedbackGenerator *)self _setState:0];
    [(UIFeedbackGenerator *)self deactivate];
  }
}

@end