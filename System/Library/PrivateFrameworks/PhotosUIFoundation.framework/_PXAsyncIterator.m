@interface _PXAsyncIterator
- (BOOL)hasStopped;
- (_PXAsyncIterator)init;
- (_PXAsyncIterator)initWithCount:(unint64_t)a3 handler:(id)a4;
- (id)completion;
- (id)handler;
- (unint64_t)count;
- (unint64_t)index;
- (void)_executeNextRun;
- (void)next;
- (void)setCompletion:(id)a3;
- (void)setHasStopped:(BOOL)a3;
- (void)stop;
@end

@implementation _PXAsyncIterator

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong(&self->_handler, 0);
}

- (void)setHasStopped:(BOOL)a3
{
  self->_hasStopped = a3;
}

- (BOOL)hasStopped
{
  return self->_hasStopped;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (id)handler
{
  return self->_handler;
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)stop
{
  [(_PXAsyncIterator *)self setHasStopped:1];
  self->_index = 0;
  v3 = [(_PXAsyncIterator *)self completion];
  if (v3)
  {
    v4 = v3;
    v3[2]();
    [(_PXAsyncIterator *)self setCompletion:0];
    v3 = v4;
  }
}

- (void)next
{
  if (![(_PXAsyncIterator *)self hasStopped])
  {
    ++self->_index;
    [(_PXAsyncIterator *)self _executeNextRun];
  }
}

- (void)_executeNextRun
{
  if (self->_index >= self->_count)
  {
    [(_PXAsyncIterator *)self stop];
  }
  else
  {
    v3 = [(_PXAsyncIterator *)self handler];
    v3[2](v3, self);
  }
}

- (_PXAsyncIterator)initWithCount:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXAsyncIterator;
  v7 = [(_PXAsyncIterator *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_count = a3;
    v9 = _Block_copy(v6);
    id handler = v8->_handler;
    v8->_id handler = v9;
  }
  return v8;
}

- (_PXAsyncIterator)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAsyncIterator.m", 33, @"%s is not available as initializer", "-[_PXAsyncIterator init]");

  abort();
}

@end