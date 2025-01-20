@interface SBOverrideScrollViewContentOffsetSwitcherModifier
- (CGPoint)scrollViewContentOffset;
- (SBOverrideScrollViewContentOffsetSwitcherModifier)initWithScrollViewContentOffset:(CGPoint)a3;
@end

@implementation SBOverrideScrollViewContentOffsetSwitcherModifier

- (SBOverrideScrollViewContentOffsetSwitcherModifier)initWithScrollViewContentOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)SBOverrideScrollViewContentOffsetSwitcherModifier;
  result = [(SBSwitcherModifier *)&v6 init];
  if (result)
  {
    result->_scrollViewContentOffset.CGFloat x = x;
    result->_scrollViewContentOffset.CGFloat y = y;
  }
  return result;
}

- (CGPoint)scrollViewContentOffset
{
  double x = self->_scrollViewContentOffset.x;
  double y = self->_scrollViewContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end