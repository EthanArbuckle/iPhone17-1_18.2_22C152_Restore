@interface SKDiskImageResizeLimitsParams
- (BOOL)shallow;
- (BOOL)stdinPassPhrase;
- (SKDiskImageResizeLimitsParams)init;
- (void)setShallow:(BOOL)a3;
- (void)setStdinPassPhrase:(BOOL)a3;
@end

@implementation SKDiskImageResizeLimitsParams

- (SKDiskImageResizeLimitsParams)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKDiskImageResizeLimitsParams;
  result = [(SKDiskImageResizeLimitsParams *)&v3 init];
  if (result) {
    *(_WORD *)&result->_stdinPassPhrase = 0;
  }
  return result;
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