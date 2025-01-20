@interface EventStreamWrapper
- (__FSEventStream)stream;
- (void)setStream:(__FSEventStream *)a3;
@end

@implementation EventStreamWrapper

- (__FSEventStream)stream
{
  return self->_stream;
}

- (void)setStream:(__FSEventStream *)a3
{
  self->_stream = a3;
}

@end