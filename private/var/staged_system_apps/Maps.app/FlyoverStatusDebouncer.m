@interface FlyoverStatusDebouncer
- (StatusDebouncerDelegate)delegate;
- (double)minimumDurationForOutput:(unint64_t)a3;
- (unint64_t)input;
- (unint64_t)output;
- (void)setDelegate:(id)a3;
- (void)setInput:(unint64_t)a3;
- (void)setOutput:(unint64_t)a3;
- (void)timerFired:(id)a3;
- (void)updateOutput;
@end

@implementation FlyoverStatusDebouncer

- (void)setInput:(unint64_t)a3
{
  if (self->_input != a3)
  {
    self->_input = a3;
    if (!self->_timer) {
      [(FlyoverStatusDebouncer *)self updateOutput];
    }
  }
}

- (void)setOutput:(unint64_t)a3
{
  if (self->_output != a3)
  {
    self->_output = a3;
    -[FlyoverStatusDebouncer minimumDurationForOutput:](self, "minimumDurationForOutput:");
    if (v4 > 0.0)
    {
      +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "timerFired:", 0, 0);
      v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      timer = self->_timer;
      self->_timer = v5;
    }
    v7 = [(FlyoverStatusDebouncer *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(FlyoverStatusDebouncer *)self delegate];
      [v9 statusDebouncerOutputDidChange:self];
    }
  }
}

- (void)updateOutput
{
  unint64_t v3 = [(FlyoverStatusDebouncer *)self input];

  [(FlyoverStatusDebouncer *)self setOutput:v3];
}

- (void)timerFired:(id)a3
{
  timer = self->_timer;
  self->_timer = 0;

  [(FlyoverStatusDebouncer *)self updateOutput];
}

- (double)minimumDurationForOutput:(unint64_t)a3
{
  double result = 0.0;
  if (a3 - 2 < 3) {
    return 2.0;
  }
  return result;
}

- (StatusDebouncerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (StatusDebouncerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)input
{
  return self->_input;
}

- (unint64_t)output
{
  return self->_output;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end