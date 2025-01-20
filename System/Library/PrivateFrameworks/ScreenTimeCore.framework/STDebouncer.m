@interface STDebouncer
- (STDebouncer)initWithMinCoalescenceInterval:(double)a3 maxCoalescenceInterval:(double)a4;
- (STDebouncerDelegate)delegate;
- (double)maxCoalescenceInterval;
- (double)minCoalescenceInterval;
- (id)value;
- (void)_delegate;
- (void)_idle;
- (void)_timeout;
- (void)bounce:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaxCoalescenceInterval:(double)a3;
- (void)setMinCoalescenceInterval:(double)a3;
- (void)setValue:(id)a3;
@end

@implementation STDebouncer

- (STDebouncer)initWithMinCoalescenceInterval:(double)a3 maxCoalescenceInterval:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)STDebouncer;
  result = [(STDebouncer *)&v7 init];
  if (result)
  {
    result->_minCoalescenceInterval = a3;
    result->_maxCoalescenceInterval = a4;
  }
  return result;
}

- (void)bounce:(id)a3
{
  v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = a3;
  if ([v5 isMainThread])
  {
    [(STDebouncer *)self setValue:v6];

    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__idle object:0];
    [(STDebouncer *)self minCoalescenceInterval];
    -[STDebouncer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__idle, 0);
    [(STDebouncer *)self maxCoalescenceInterval];
    -[STDebouncer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__timeout, 0);
  }
  else
  {
    [(STDebouncer *)self performSelectorOnMainThread:a2 withObject:v6 waitUntilDone:0];
  }
}

- (void)_idle
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__timeout object:0];
  [(STDebouncer *)self _delegate];
}

- (void)_timeout
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__idle object:0];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__timeout object:0];
  [(STDebouncer *)self _delegate];
}

- (void)_delegate
{
  id v4 = [(STDebouncer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v3 = [(STDebouncer *)self value];
    [v4 debouncer:self didDebounce:v3];
  }
}

- (STDebouncerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (STDebouncerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)minCoalescenceInterval
{
  return self->_minCoalescenceInterval;
}

- (void)setMinCoalescenceInterval:(double)a3
{
  self->_minCoalescenceInterval = a3;
}

- (double)maxCoalescenceInterval
{
  return self->_maxCoalescenceInterval;
}

- (void)setMaxCoalescenceInterval:(double)a3
{
  self->_maxCoalescenceInterval = a3;
}

- (id)value
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end