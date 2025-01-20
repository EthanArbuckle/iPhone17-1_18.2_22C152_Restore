@interface SFRenderingCommand
- (CGSize)contextSize;
- (id)commandBlock;
- (void)setCommandBlock:(id)a3;
- (void)setContextSize:(CGSize)a3;
@end

@implementation SFRenderingCommand

- (id)commandBlock
{
  return self->_commandBlock;
}

- (void)setCommandBlock:(id)a3
{
}

- (CGSize)contextSize
{
  double width = self->_contextSize.width;
  double height = self->_contextSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContextSize:(CGSize)a3
{
  self->_contextSize = a3;
}

- (void).cxx_destruct
{
}

@end