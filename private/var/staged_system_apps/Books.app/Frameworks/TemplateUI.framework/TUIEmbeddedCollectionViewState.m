@interface TUIEmbeddedCollectionViewState
- (CGPoint)contentOffset;
- (TUIViewState)embeddedState;
- (void)setContentOffset:(CGPoint)a3;
- (void)setEmbeddedState:(id)a3;
@end

@implementation TUIEmbeddedCollectionViewState

- (CGPoint)contentOffset
{
  double x = self->_contentOffset.x;
  double y = self->_contentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
}

- (TUIViewState)embeddedState
{
  return self->_embeddedState;
}

- (void)setEmbeddedState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end