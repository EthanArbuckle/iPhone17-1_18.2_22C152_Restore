@interface PFLCLayout
- (BOOL)usesMask;
- (CGRect)visibleRect;
- (PFLCLayout)initWithCropScore:(double)a3 layoutScore:(double)a4 foregroundCoverage:(double)a5 visibleRect:(CGRect)a6 usesMask:(BOOL)a7;
- (double)cropScore;
- (double)foregroundCoverage;
- (double)layoutScore;
- (void)setCropScore:(double)a3;
- (void)setForegroundCoverage:(double)a3;
- (void)setLayoutScore:(double)a3;
- (void)setUsesMask:(BOOL)a3;
- (void)setVisibleRect:(CGRect)a3;
@end

@implementation PFLCLayout

- (PFLCLayout)initWithCropScore:(double)a3 layoutScore:(double)a4 foregroundCoverage:(double)a5 visibleRect:(CGRect)a6 usesMask:(BOOL)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)PFLCLayout;
  result = [(PFLCLayout *)&v16 init];
  if (result)
  {
    result->_cropScore = a3;
    result->_layoutScore = a4;
    result->_foregroundCoverage = a5;
    result->_visibleRect.origin.CGFloat x = x;
    result->_visibleRect.origin.CGFloat y = y;
    result->_visibleRect.size.CGFloat width = width;
    result->_visibleRect.size.CGFloat height = height;
    result->_usesMask = a7;
  }
  return result;
}

- (double)cropScore
{
  return self->_cropScore;
}

- (void)setCropScore:(double)a3
{
  self->_cropScore = a3;
}

- (double)layoutScore
{
  return self->_layoutScore;
}

- (void)setLayoutScore:(double)a3
{
  self->_layoutScore = a3;
}

- (double)foregroundCoverage
{
  return self->_foregroundCoverage;
}

- (void)setForegroundCoverage:(double)a3
{
  self->_foregroundCoverage = a3;
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
}

- (BOOL)usesMask
{
  return self->_usesMask;
}

- (void)setUsesMask:(BOOL)a3
{
  self->_usesMask = a3;
}

@end