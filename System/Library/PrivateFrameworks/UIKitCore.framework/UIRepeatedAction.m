@interface UIRepeatedAction
+ (UIRepeatedAction)actionWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5;
+ (id)_invocationForTarget:(id)a3 selector:(SEL)a4 object:(id)a5;
- (BOOL)_shouldInvokeRepeatedActionForPhase:(unint64_t)a3;
- (BOOL)disableRepeat;
- (BOOL)invoke;
- (BOOL)skipInitialFire;
- (NSInvocation)invocation;
- (NSTimer)timer;
- (UIRepeatedAction)initWithInvocation:(id)a3;
- (UIRepeatedAction)initWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5;
- (UIRepeatedActionDelegate)delegate;
- (double)invocationDelay;
- (double)preInvocationDelay;
- (double)repeatedDelay;
- (id)invocationArgument;
- (void)_adjustInvocationForPhase:(unint64_t)a3;
- (void)_invocationTimerFire;
- (void)_preInvocationTimerFire;
- (void)_repeatedTimerFire;
- (void)_resetInternalState;
- (void)dealloc;
- (void)invalidate;
- (void)reset;
- (void)schedule;
- (void)scheduleWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setDisableRepeat:(BOOL)a3;
- (void)setInvocation:(id)a3;
- (void)setInvocationArgument:(id)a3;
- (void)setInvocationDelay:(double)a3;
- (void)setPreInvocationDelay:(double)a3;
- (void)setRepeatedDelay:(double)a3;
- (void)setSkipInitialFire:(BOOL)a3;
- (void)setTimer:(id)a3;
@end

@implementation UIRepeatedAction

+ (id)_invocationForTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v7 = a3;
  id v15 = a5;
  v8 = [v7 methodSignatureForSelector:a4];
  v9 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  unint64_t v10 = [v8 numberOfArguments];
  if (v10 <= 1)
  {
    v11 = NSStringFromSelector(a4);
    NSLog(&cfstr_SMethodRequire.isa, "+[UIRepeatedAction _invocationForTarget:selector:object:]", v11);

LABEL_4:
    v12 = 0;
    goto LABEL_8;
  }
  unint64_t v13 = v10;
  v12 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v9];
  [v12 setTarget:v7];
  [v12 setSelector:a4];
  if (v13 != 2) {
    [v12 setArgument:&v15 atIndex:2];
  }
  [v12 retainArguments];
LABEL_8:

  return v12;
}

+ (UIRepeatedAction)actionWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  unint64_t v10 = (void *)[objc_alloc((Class)a1) initWithTarget:v9 selector:a4 object:v8];

  return (UIRepeatedAction *)v10;
}

- (UIRepeatedAction)initWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  unint64_t v10 = [(id)objc_opt_class() _invocationForTarget:v9 selector:a4 object:v8];

  if (v10)
  {
    self = [(UIRepeatedAction *)self initWithInvocation:v10];
    [(UIRepeatedAction *)self setInvocationArgument:v8];
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (UIRepeatedAction)initWithInvocation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIRepeatedAction;
  v6 = [(UIRepeatedAction *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_invocation, a3);
    *(_OWORD *)&v7->_preInvocationDelay = xmmword_186B9DA90;
    v7->_repeatedDelay = 0.1;
  }

  return v7;
}

- (void)scheduleWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(UIRepeatedAction *)self _resetInternalState];
  unint64_t v10 = [(id)objc_opt_class() _invocationForTarget:v9 selector:a4 object:v8];

  [(UIRepeatedAction *)self setInvocation:v10];
  [(UIRepeatedAction *)self setInvocationArgument:v8];

  [(UIRepeatedAction *)self schedule];
}

- (BOOL)invoke
{
  v3 = [(UIRepeatedAction *)self invocation];
  if (!self->_didCompletePreInvocationDelay)
  {
    [(UIRepeatedAction *)self preInvocationDelay];
    if (v4 <= 0.0) {
      goto LABEL_5;
    }
  }
  id v5 = [v3 target];
  int v6 = objc_msgSend(v5, "__isKindOfUIResponder");

  if (!v6) {
    goto LABEL_5;
  }
  id v7 = [v3 target];
  uint64_t v8 = [v3 selector];
  id v9 = [(UIRepeatedAction *)self invocationArgument];
  LODWORD(v8) = [v7 canPerformAction:v8 withSender:v9];

  if (!v8)
  {
    BOOL v10 = 0;
  }
  else
  {
LABEL_5:
    [v3 invoke];
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_adjustInvocationForPhase:(unint64_t)a3
{
  uint64_t v5 = [(UIRepeatedAction *)self invocationArgument];
  if (!v5) {
    return;
  }
  id v11 = (id)v5;
  int v6 = [(UIRepeatedAction *)self invocation];
  id v7 = [v6 methodSignature];
  if ((unint64_t)[v7 numberOfArguments] > 1)
  {
    uint64_t v8 = [(UIRepeatedAction *)self delegate];

    if (!v8) {
      return;
    }
    id v9 = [(UIRepeatedAction *)self delegate];
    id v11 = [v9 repeatedAction:self willInvokeWithObject:self->_invocationArgument forPhase:a3];

    BOOL v10 = v11;
    if (self->_invocationArgument == v11) {
      goto LABEL_8;
    }
    -[UIRepeatedAction setInvocationArgument:](self, "setInvocationArgument:");
    int v6 = [(UIRepeatedAction *)self invocation];
    [v6 setArgument:&self->_invocationArgument atIndex:2];
  }
  else
  {
  }
  BOOL v10 = v11;
LABEL_8:
}

- (BOOL)_shouldInvokeRepeatedActionForPhase:(unint64_t)a3
{
  uint64_t v5 = [(UIRepeatedAction *)self delegate];
  int v6 = v5;
  if (v5) {
    char v7 = [v5 shouldInvokeRepeatedAction:self forPhase:a3];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)_preInvocationTimerFire
{
  if ([(UIRepeatedAction *)self _shouldInvokeRepeatedActionForPhase:1])
  {
    [(UIRepeatedAction *)self _adjustInvocationForPhase:1];
    BOOL v3 = [(UIRepeatedAction *)self invoke];
    self->_didCompletePreInvocationDelay = 1;
    if (!v3) {
      return;
    }
  }
  else
  {
    self->_didCompletePreInvocationDelay = 1;
  }
  [(UIRepeatedAction *)self schedule];
}

- (void)_invocationTimerFire
{
  if ([(UIRepeatedAction *)self _shouldInvokeRepeatedActionForPhase:2])
  {
    [(UIRepeatedAction *)self _adjustInvocationForPhase:2];
    BOOL v3 = [(UIRepeatedAction *)self invoke];
    self->_didCompleteInvocationDelay = 1;
    if (!v3) {
      return;
    }
  }
  else
  {
    self->_didCompleteInvocationDelay = 1;
  }
  [(UIRepeatedAction *)self schedule];
}

- (void)_repeatedTimerFire
{
  if (![(UIRepeatedAction *)self _shouldInvokeRepeatedActionForPhase:3]
    || ([(UIRepeatedAction *)self _adjustInvocationForPhase:3],
        [(UIRepeatedAction *)self invoke]))
  {
    [(UIRepeatedAction *)self schedule];
  }
}

- (void)schedule
{
  BOOL v3 = [(UIRepeatedAction *)self timer];
  [v3 invalidate];

  [(UIRepeatedAction *)self setTimer:0];
  if (self->_skipInitialFire && !self->_didCompletePreInvocationDelay) {
    self->_didCompletePreInvocationDelay = 1;
  }
  if (self->_didCompleteInvocationDelay)
  {
    if ([(UIRepeatedAction *)self disableRepeat])
    {
      [(UIRepeatedAction *)self setTimer:0];
      return;
    }
    double v4 = (void *)MEMORY[0x1E4F1CB00];
    [(UIRepeatedAction *)self repeatedDelay];
    uint64_t v5 = sel__repeatedTimerFire;
    goto LABEL_13;
  }
  if (self->_didCompletePreInvocationDelay)
  {
    if ([(UIRepeatedAction *)self disableRepeat]) {
      return;
    }
    [(UIRepeatedAction *)self invocationDelay];
    if (v7 == 0.0)
    {
      [(UIRepeatedAction *)self _invocationTimerFire];
      return;
    }
    double v4 = (void *)MEMORY[0x1E4F1CB00];
    [(UIRepeatedAction *)self invocationDelay];
    uint64_t v5 = sel__invocationTimerFire;
LABEL_13:
    objc_msgSend(v4, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, v5, 0, 0);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(UIRepeatedAction *)self setTimer:v8];

    return;
  }
  [(UIRepeatedAction *)self preInvocationDelay];
  if (v6 != 0.0)
  {
    double v4 = (void *)MEMORY[0x1E4F1CB00];
    [(UIRepeatedAction *)self preInvocationDelay];
    uint64_t v5 = sel__preInvocationTimerFire;
    goto LABEL_13;
  }
  [(UIRepeatedAction *)self _preInvocationTimerFire];
}

- (void)invalidate
{
  BOOL v3 = [(UIRepeatedAction *)self timer];
  [v3 invalidate];

  [(UIRepeatedAction *)self setTimer:0];
  [(UIRepeatedAction *)self setInvocation:0];
  [(UIRepeatedAction *)self setInvocationArgument:0];
}

- (void)_resetInternalState
{
  *(_WORD *)&self->_didCompletePreInvocationDelay = 0;
}

- (void)reset
{
  *(_OWORD *)&self->_preInvocationDelay = xmmword_186B9DA90;
  self->_repeatedDelay = 0.1;
  *(_WORD *)&self->_disableRepeat = 0;
}

- (void)setPreInvocationDelay:(double)a3
{
  self->_preInvocationDelay = a3;
  double v4 = [(UIRepeatedAction *)self timer];
  int v5 = [v4 isValid];

  if (v5)
  {
    [(UIRepeatedAction *)self schedule];
  }
}

- (void)setInvocationDelay:(double)a3
{
  self->_invocationDelay = a3;
  double v4 = [(UIRepeatedAction *)self timer];
  int v5 = [v4 isValid];

  if (v5)
  {
    [(UIRepeatedAction *)self schedule];
  }
}

- (void)setRepeatedDelay:(double)a3
{
  self->_repeatedDelay = a3;
}

- (void)dealloc
{
  [(UIRepeatedAction *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UIRepeatedAction;
  [(UIRepeatedAction *)&v3 dealloc];
}

- (double)preInvocationDelay
{
  return self->_preInvocationDelay;
}

- (double)invocationDelay
{
  return self->_invocationDelay;
}

- (double)repeatedDelay
{
  return self->_repeatedDelay;
}

- (BOOL)disableRepeat
{
  return self->_disableRepeat;
}

- (void)setDisableRepeat:(BOOL)a3
{
  self->_disableRepeat = a3;
}

- (BOOL)skipInitialFire
{
  return self->_skipInitialFire;
}

- (void)setSkipInitialFire:(BOOL)a3
{
  self->_skipInitialFire = a3;
}

- (NSInvocation)invocation
{
  return self->_invocation;
}

- (void)setInvocation:(id)a3
{
}

- (id)invocationArgument
{
  return self->_invocationArgument;
}

- (void)setInvocationArgument:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (UIRepeatedActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIRepeatedActionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_invocationArgument, 0);
  objc_storeStrong((id *)&self->_invocation, 0);
}

@end