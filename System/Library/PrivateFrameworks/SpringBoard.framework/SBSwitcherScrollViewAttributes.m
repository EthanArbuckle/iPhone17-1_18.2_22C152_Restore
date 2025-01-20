@interface SBSwitcherScrollViewAttributes
- (BOOL)interpolatesDuringSwipeToKill;
- (BOOL)scrollViewPagingEnabled;
- (CGPoint)pagingOrigin;
- (CGSize)contentSize;
- (CGSize)interpageSpacingForPaging;
- (double)decelerationRate;
- (id)_copyWithClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setDecelerationRate:(double)a3;
- (void)setInterpageSpacingForPaging:(CGSize)a3;
- (void)setInterpolatesDuringSwipeToKill:(BOOL)a3;
- (void)setPagingOrigin:(CGPoint)a3;
- (void)setScrollViewPagingEnabled:(BOOL)a3;
@end

@implementation SBSwitcherScrollViewAttributes

- (void)setScrollViewPagingEnabled:(BOOL)a3
{
  self->_scrollViewPagingEnabled = a3;
}

- (void)setPagingOrigin:(CGPoint)a3
{
  self->_pagingOrigin = a3;
}

- (void)setInterpolatesDuringSwipeToKill:(BOOL)a3
{
  self->_interpolatesDuringSwipeToKill = a3;
}

- (void)setInterpageSpacingForPaging:(CGSize)a3
{
  self->_interpageSpacingForPaging = a3;
}

- (void)setDecelerationRate:(double)a3
{
  self->_decelerationRate = a3;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (BOOL)scrollViewPagingEnabled
{
  return self->_scrollViewPagingEnabled;
}

- (double)decelerationRate
{
  return self->_decelerationRate;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBSwitcherScrollViewAttributes *)self _copyWithClass:v4];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBSwitcherScrollViewAttributes *)self _copyWithClass:v4];
}

- (id)_copyWithClass:(Class)a3
{
  id v4 = objc_alloc_init(a3);
  objc_msgSend(v4, "setContentSize:", self->_contentSize.width, self->_contentSize.height);
  [v4 setDecelerationRate:self->_decelerationRate];
  [v4 setScrollViewPagingEnabled:self->_scrollViewPagingEnabled];
  objc_msgSend(v4, "setInterpageSpacingForPaging:", self->_interpageSpacingForPaging.width, self->_interpageSpacingForPaging.height);
  objc_msgSend(v4, "setPagingOrigin:", self->_pagingOrigin.x, self->_pagingOrigin.y);
  [v4 setInterpolatesDuringSwipeToKill:self->_interpolatesDuringSwipeToKill];
  return v4;
}

- (CGSize)interpageSpacingForPaging
{
  double width = self->_interpageSpacingForPaging.width;
  double height = self->_interpageSpacingForPaging.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)pagingOrigin
{
  double x = self->_pagingOrigin.x;
  double y = self->_pagingOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)interpolatesDuringSwipeToKill
{
  return self->_interpolatesDuringSwipeToKill;
}

@end