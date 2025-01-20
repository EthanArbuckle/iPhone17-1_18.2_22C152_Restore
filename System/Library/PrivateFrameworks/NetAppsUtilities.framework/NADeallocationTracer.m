@interface NADeallocationTracer
- (NADeallocationTracer)initWithDelegate:(id)a3;
- (NADeallocationTracerDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation NADeallocationTracer

- (NADeallocationTracer)initWithDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NADeallocationTracer;
  result = [(NADeallocationTracer *)&v5 init];
  if (result) {
    result->_delegate = (NADeallocationTracerDelegate *)a3;
  }
  return result;
}

- (void)dealloc
{
  v3 = [(NADeallocationTracer *)self delegate];
  [v3 tracerIsDeallocating];

  v4.receiver = self;
  v4.super_class = (Class)NADeallocationTracer;
  [(NADeallocationTracer *)&v4 dealloc];
}

- (NADeallocationTracerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (NADeallocationTracerDelegate *)a3;
}

@end