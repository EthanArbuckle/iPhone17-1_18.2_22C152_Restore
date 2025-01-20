@interface PUTilingScrollInfo
+ (PUTilingScrollInfo)scrollInfoWithScrollDirections:(int64_t)a3;
+ (PUTilingScrollInfo)scrollInfoWithScrollDirections:(int64_t)a3 enabledPagingWithInterpageSpacing:(CGSize)a4;
+ (PUTilingScrollInfo)scrollInfoWithScrollDirections:(int64_t)a3 enabledPagingWithInterpageSpacing:(CGSize)a4 pagingSpringPullAdjustment:(double)a5 pagingFrictionAdjustment:(double)a6;
- (BOOL)shouldEnablePaging;
- (CGSize)interpageSpacing;
- (double)pagingFrictionAdjustment;
- (double)pagingSpringPullAdjustment;
- (int64_t)scrollDirections;
- (void)_setInterpageSpacing:(CGSize)a3;
- (void)_setPagingFrictionAdjustment:(double)a3;
- (void)_setPagingSpringPullAdjustment:(double)a3;
- (void)_setScrollDirections:(int64_t)a3;
- (void)_setShouldEnablePaging:(BOOL)a3;
@end

@implementation PUTilingScrollInfo

- (void)_setPagingFrictionAdjustment:(double)a3
{
  self->_pagingFrictionAdjustment = a3;
}

- (double)pagingFrictionAdjustment
{
  return self->_pagingFrictionAdjustment;
}

- (void)_setPagingSpringPullAdjustment:(double)a3
{
  self->_pagingSpringPullAdjustment = a3;
}

- (double)pagingSpringPullAdjustment
{
  return self->_pagingSpringPullAdjustment;
}

- (void)_setInterpageSpacing:(CGSize)a3
{
  self->_interpageSpacing = a3;
}

- (CGSize)interpageSpacing
{
  double width = self->_interpageSpacing.width;
  double height = self->_interpageSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setShouldEnablePaging:(BOOL)a3
{
  self->_shouldEnablePaging = a3;
}

- (BOOL)shouldEnablePaging
{
  return self->_shouldEnablePaging;
}

- (void)_setScrollDirections:(int64_t)a3
{
  self->_scrollDirections = a3;
}

- (int64_t)scrollDirections
{
  return self->_scrollDirections;
}

+ (PUTilingScrollInfo)scrollInfoWithScrollDirections:(int64_t)a3 enabledPagingWithInterpageSpacing:(CGSize)a4 pagingSpringPullAdjustment:(double)a5 pagingFrictionAdjustment:(double)a6
{
  double height = a4.height;
  double width = a4.width;
  v11 = objc_alloc_init(PUTilingScrollInfo);
  [(PUTilingScrollInfo *)v11 _setScrollDirections:a3];
  [(PUTilingScrollInfo *)v11 _setShouldEnablePaging:1];
  -[PUTilingScrollInfo _setInterpageSpacing:](v11, "_setInterpageSpacing:", width, height);
  [(PUTilingScrollInfo *)v11 _setPagingSpringPullAdjustment:a5];
  [(PUTilingScrollInfo *)v11 _setPagingFrictionAdjustment:a6];
  return v11;
}

+ (PUTilingScrollInfo)scrollInfoWithScrollDirections:(int64_t)a3 enabledPagingWithInterpageSpacing:(CGSize)a4
{
  return (PUTilingScrollInfo *)objc_msgSend(a1, "scrollInfoWithScrollDirections:enabledPagingWithInterpageSpacing:pagingSpringPullAdjustment:pagingFrictionAdjustment:", a3, a4.width, a4.height, 0.0, 0.0);
}

+ (PUTilingScrollInfo)scrollInfoWithScrollDirections:(int64_t)a3
{
  v4 = objc_alloc_init(PUTilingScrollInfo);
  [(PUTilingScrollInfo *)v4 _setScrollDirections:a3];
  return v4;
}

@end