@interface MTLDebugBufferMarker
- (NSString)label;
- (_NSRange)range;
- (void)dealloc;
- (void)setLabel:(id)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation MTLDebugBufferMarker

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugBufferMarker;
  [(MTLDebugBufferMarker *)&v3 dealloc];
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

@end