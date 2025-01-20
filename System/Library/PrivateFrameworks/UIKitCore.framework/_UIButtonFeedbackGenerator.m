@interface _UIButtonFeedbackGenerator
+ (Class)_configurationClass;
- (_UIButtonFeedbackGenerator)initWithStyle:(int64_t)a3;
- (_UIButtonFeedbackGenerator)initWithStyle:(int64_t)a3 coordinateSpace:(id)a4;
- (_UIButtonFeedbackGenerator)initWithStyle:(int64_t)a3 view:(id)a4;
- (id)_stats_key;
- (void)userInteractionCancelled;
- (void)userInteractionCancelledAtLocation:(CGPoint)a3;
- (void)userInteractionEnded;
- (void)userInteractionEndedAtLocation:(CGPoint)a3;
- (void)userInteractionStarted;
- (void)userInteractionStartedAtLocation:(CGPoint)a3;
@end

@implementation _UIButtonFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (_UIButtonFeedbackGenerator)initWithStyle:(int64_t)a3
{
  return [(_UIButtonFeedbackGenerator *)self initWithStyle:a3 view:0];
}

- (_UIButtonFeedbackGenerator)initWithStyle:(int64_t)a3 coordinateSpace:(id)a4
{
  v6 = _viewFromCoordinateSpace(a4);
  v7 = [(_UIButtonFeedbackGenerator *)self initWithStyle:a3 view:v6];

  return v7;
}

- (_UIButtonFeedbackGenerator)initWithStyle:(int64_t)a3 view:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_configurationClass"), "prominentConfiguration");
  }
  else
  {
    if (a3)
    {
      v8 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_configurationClass"), "defaultConfiguration");
  }
  v8 = (void *)v7;
LABEL_7:
  v11.receiver = self;
  v11.super_class = (Class)_UIButtonFeedbackGenerator;
  v9 = [(UIFeedbackGenerator *)&v11 initWithConfiguration:v8 view:v6];

  return v9;
}

- (void)userInteractionStartedAtLocation:(CGPoint)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63___UIButtonFeedbackGenerator_userInteractionStartedAtLocation___block_invoke;
  v3[3] = &unk_1E52DA6D8;
  v3[4] = self;
  CGPoint v4 = a3;
  [(UIFeedbackGenerator *)self activateWithCompletionBlock:v3];
}

- (void)userInteractionStarted
{
}

- (void)userInteractionEndedAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  id v6 = [(_UIButtonFeedbackGenerator *)self _buttonConfiguration];
  uint64_t v7 = [v6 interactionEndedFeedback];
  -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v7, x, y);

  [(UIFeedbackGenerator *)self deactivate];
}

- (void)userInteractionEnded
{
}

- (void)userInteractionCancelledAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  id v6 = [(_UIButtonFeedbackGenerator *)self _buttonConfiguration];
  uint64_t v7 = [v6 interactionCancelledFeedback];
  -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v7, x, y);

  [(UIFeedbackGenerator *)self deactivate];
}

- (void)userInteractionCancelled
{
}

- (id)_stats_key
{
  return @"button";
}

@end