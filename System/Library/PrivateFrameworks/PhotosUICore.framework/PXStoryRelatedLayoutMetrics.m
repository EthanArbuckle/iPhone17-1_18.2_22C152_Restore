@interface PXStoryRelatedLayoutMetrics
- (BOOL)isEqual:(id)a3;
- (CGPoint)scrollOffset;
- (UIEdgeInsets)margins;
- (double)interitemSpacing;
- (double)offscreenFraction;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)layoutMode;
- (unint64_t)hash;
- (unint64_t)userInterfaceDirection;
- (void)setInteritemSpacing:(double)a3;
- (void)setLayoutMode:(int64_t)a3;
- (void)setMargins:(UIEdgeInsets)a3;
- (void)setOffscreenFraction:(double)a3;
- (void)setScrollOffset:(CGPoint)a3;
- (void)setUserInterfaceDirection:(unint64_t)a3;
@end

@implementation PXStoryRelatedLayoutMetrics

- (void)setUserInterfaceDirection:(unint64_t)a3
{
  self->_userInterfaceDirection = a3;
}

- (unint64_t)userInterfaceDirection
{
  return self->_userInterfaceDirection;
}

- (void)setOffscreenFraction:(double)a3
{
  self->_offscreenFraction = a3;
}

- (double)offscreenFraction
{
  return self->_offscreenFraction;
}

- (void)setScrollOffset:(CGPoint)a3
{
  self->_scrollOffset = a3;
}

- (CGPoint)scrollOffset
{
  double x = self->_scrollOffset.x;
  double y = self->_scrollOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLayoutMode:(int64_t)a3
{
  self->_layoutMode = a3;
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (UIEdgeInsets)margins
{
  double top = self->_margins.top;
  double left = self->_margins.left;
  double bottom = self->_margins.bottom;
  double right = self->_margins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryRelatedLayoutMetrics;
  id result = [(PXLayoutMetrics *)&v6 copyWithZone:a3];
  if (result)
  {
    long long v5 = *(_OWORD *)&self->_margins.bottom;
    *(_OWORD *)((char *)result + 72) = *(_OWORD *)&self->_margins.top;
    *(_OWORD *)((char *)result + 88) = v5;
    *((void *)result + 3) = *(void *)&self->_interitemSpacing;
    *((void *)result + 4) = self->_layoutMode;
    *(CGPoint *)((char *)result + 56) = self->_scrollOffset;
    *((void *)result + 5) = *(void *)&self->_offscreenFraction;
    *((void *)result + 6) = self->_userInterfaceDirection;
  }
  return result;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryRelatedLayoutMetrics;
  unint64_t v3 = [(PXLayoutMetrics *)&v6 hash];
  [(PXStoryRelatedLayoutMetrics *)self scrollOffset];
  return v3 ^ (2 * (uint64_t)v4);
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PXStoryRelatedLayoutMetrics *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v5 = v4;
      v8.receiver = self;
      v8.super_class = (Class)PXStoryRelatedLayoutMetrics;
      if ([(PXLayoutMetrics *)&v8 isEqual:v5])
      {
        [(PXStoryRelatedLayoutMetrics *)self margins];
        [(PXStoryRelatedLayoutMetrics *)v5 margins];
        PXEdgeInsetsEqualToEdgeInsets();
      }
      BOOL v6 = 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

@end