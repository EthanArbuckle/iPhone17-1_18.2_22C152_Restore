@interface SKDiskImageResizeParams
- (BOOL)shallow;
- (BOOL)stdinPassPhrase;
- (SKDiskImageResizeParams)initWithSize:(unint64_t)a3;
- (unint64_t)size;
- (void)setShallow:(BOOL)a3;
- (void)setSize:(unint64_t)a3;
- (void)setStdinPassPhrase:(BOOL)a3;
@end

@implementation SKDiskImageResizeParams

- (SKDiskImageResizeParams)initWithSize:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKDiskImageResizeParams;
  result = [(SKDiskImageResizeParams *)&v5 init];
  if (result)
  {
    result->_size = (a3 + 4095) & 0xFFFFFFFFFFFFF000;
    *(_WORD *)&result->_stdinPassPhrase = 0;
  }
  return result;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (BOOL)stdinPassPhrase
{
  return self->_stdinPassPhrase;
}

- (void)setStdinPassPhrase:(BOOL)a3
{
  self->_stdinPassPhrase = a3;
}

- (BOOL)shallow
{
  return self->_shallow;
}

- (void)setShallow:(BOOL)a3
{
  self->_shallow = a3;
}

@end