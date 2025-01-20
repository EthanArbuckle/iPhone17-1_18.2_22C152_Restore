@interface _TVStackScrollStop
- (_TVStackScrollStop)init;
- (double)offset;
- (int64_t)edge;
- (int64_t)sectionIndex;
- (void)setEdge:(int64_t)a3;
- (void)setOffset:(double)a3;
- (void)setSectionIndex:(int64_t)a3;
@end

@implementation _TVStackScrollStop

- (_TVStackScrollStop)init
{
  v3.receiver = self;
  v3.super_class = (Class)_TVStackScrollStop;
  result = [(_TVStackScrollStop *)&v3 init];
  if (result) {
    result->_sectionIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (int64_t)edge
{
  return self->_edge;
}

- (void)setEdge:(int64_t)a3
{
  self->_edge = a3;
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

@end