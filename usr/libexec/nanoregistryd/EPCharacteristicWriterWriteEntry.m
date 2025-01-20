@interface EPCharacteristicWriterWriteEntry
- (BOOL)written;
- (EPCharacteristicWriter)writer;
- (NSData)data;
- (OS_dispatch_source)timer;
- (double)timeout;
- (id)begin;
- (id)completion;
- (void)dealloc;
- (void)setBegin:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setData:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTimer:(id)a3;
- (void)setWriter:(id)a3;
- (void)setWritten:(BOOL)a3;
@end

@implementation EPCharacteristicWriterWriteEntry

- (void)dealloc
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)EPCharacteristicWriterWriteEntry;
  [(EPCharacteristicWriterWriteEntry *)&v5 dealloc];
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (id)begin
{
  return self->_begin;
}

- (void)setBegin:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (BOOL)written
{
  return self->_written;
}

- (void)setWritten:(BOOL)a3
{
  self->_written = a3;
}

- (EPCharacteristicWriter)writer
{
  return self->_writer;
}

- (void)setWriter:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_begin, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end