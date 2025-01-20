@interface _UIClickFeedbackGenerator
+ (Class)_configurationClass;
- (_UIClickFeedbackGenerator)initWithView:(id)a3;
- (void)pressedDown;
- (void)pressedDownAtLocation:(CGPoint)a3;
- (void)pressedUp;
- (void)pressedUpAtLocation:(CGPoint)a3;
- (void)userInteractionCancelled;
- (void)userInteractionCancelledAtLocation:(CGPoint)a3;
- (void)userInteractionEnded;
- (void)userInteractionEndedAtLocation:(CGPoint)a3;
- (void)userInteractionStarted;
- (void)userInteractionStartedAtLocation:(CGPoint)a3;
@end

@implementation _UIClickFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (_UIClickFeedbackGenerator)initWithView:(id)a3
{
  id v4 = a3;
  v5 = +[_UIClickFeedbackGeneratorConfiguration defaultConfiguration];
  v8.receiver = self;
  v8.super_class = (Class)_UIClickFeedbackGenerator;
  v6 = [(UIFeedbackGenerator *)&v8 initWithConfiguration:v5 view:v4];

  return v6;
}

- (void)pressedDownAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  id v7 = [(_UIClickFeedbackGenerator *)self _clickConfiguration];
  v6 = [v7 clickDownPattern];
  -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v6, x, y);
}

- (void)pressedDown
{
}

- (void)pressedUpAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  id v7 = [(_UIClickFeedbackGenerator *)self _clickConfiguration];
  v6 = [v7 clickUpPattern];
  -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v6, x, y);
}

- (void)pressedUp
{
}

- (void)userInteractionStartedAtLocation:(CGPoint)a3
{
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2, a3.x, a3.y);
  [(UIFeedbackGenerator *)self activateWithCompletionBlock:0];
}

- (void)userInteractionStarted
{
}

- (void)userInteractionEndedAtLocation:(CGPoint)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2, a3.x, a3.y);
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v5 = [(UIFeedbackGenerator *)self isActive];
  if (has_internal_diagnostics)
  {
    if (!v5)
    {
      v6 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        int v8 = 138412290;
        v9 = self;
        _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Attempted to end user interaction on %@ when it was not active.", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  else if (!v5)
  {
    id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &userInteractionEndedAtLocation____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      v9 = self;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Attempted to end user interaction on %@ when it was not active.", (uint8_t *)&v8, 0xCu);
    }
  }
  if ([(UIFeedbackGenerator *)self isActive]) {
    [(UIFeedbackGenerator *)self deactivate];
  }
}

- (void)userInteractionEnded
{
}

- (void)userInteractionCancelledAtLocation:(CGPoint)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2, a3.x, a3.y);
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v5 = [(UIFeedbackGenerator *)self isActive];
  if (has_internal_diagnostics)
  {
    if (!v5)
    {
      v6 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        int v8 = 138412290;
        v9 = self;
        _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Attempted to cancel user interaction on %@ when it was not active.", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  else if (!v5)
  {
    id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &userInteractionCancelledAtLocation____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      v9 = self;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Attempted to cancel user interaction on %@ when it was not active.", (uint8_t *)&v8, 0xCu);
    }
  }
  if ([(UIFeedbackGenerator *)self isActive]) {
    [(UIFeedbackGenerator *)self deactivate];
  }
}

- (void)userInteractionCancelled
{
}

@end