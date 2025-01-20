@interface _MNTracePlayerTimelineStreamSearchObject
- (_MNTracePlayerTimelineStreamSearchObject)initWithPosition:(double)a3;
- (double)position;
@end

@implementation _MNTracePlayerTimelineStreamSearchObject

- (_MNTracePlayerTimelineStreamSearchObject)initWithPosition:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_MNTracePlayerTimelineStreamSearchObject;
  result = [(_MNTracePlayerTimelineStreamSearchObject *)&v5 init];
  if (result) {
    result->_position = a3;
  }
  return result;
}

- (double)position
{
  return self->_position;
}

@end