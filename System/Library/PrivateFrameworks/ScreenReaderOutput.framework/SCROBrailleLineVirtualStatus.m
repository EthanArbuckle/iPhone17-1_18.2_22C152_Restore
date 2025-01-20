@interface SCROBrailleLineVirtualStatus
- (NSData)data;
- (char)cells;
- (int)alignment;
- (int64_t)length;
- (void)dealloc;
- (void)setAlignment:(int)a3;
- (void)setCells:(char *)a3;
- (void)setData:(id)a3;
- (void)setLength:(int64_t)a3;
@end

@implementation SCROBrailleLineVirtualStatus

- (void)dealloc
{
  cells = self->_cells;
  if (cells) {
    free(cells);
  }
  v4.receiver = self;
  v4.super_class = (Class)SCROBrailleLineVirtualStatus;
  [(SCROBrailleLineVirtualStatus *)&v4 dealloc];
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (int)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int)a3
{
  self->_alignment = a3;
}

- (int64_t)length
{
  return self->_length;
}

- (void)setLength:(int64_t)a3
{
  self->_length = a3;
}

- (char)cells
{
  return self->_cells;
}

- (void)setCells:(char *)a3
{
  self->_cells = a3;
}

- (void).cxx_destruct
{
}

@end