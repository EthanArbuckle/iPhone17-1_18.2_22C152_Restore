@interface VKWKLineInfo
- (BOOL)shouldWrap;
- (NSArray)children;
- (unint64_t)layoutDirection;
- (void)setChildren:(id)a3;
- (void)setLayoutDirection:(unint64_t)a3;
- (void)setShouldWrap:(BOOL)a3;
@end

@implementation VKWKLineInfo

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (BOOL)shouldWrap
{
  return self->_shouldWrap;
}

- (void)setShouldWrap:(BOOL)a3
{
  self->_shouldWrap = a3;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_layoutDirection = a3;
}

- (void).cxx_destruct
{
}

@end