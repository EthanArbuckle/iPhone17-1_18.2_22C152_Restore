@interface PXCMMEngineDrivenLayoutConfiguration
- (double)bannerHeight;
- (double)headerHeight;
- (double)statusFooterHeight;
- (int64_t)layoutType;
- (void)setBannerHeight:(double)a3;
- (void)setHeaderHeight:(double)a3;
- (void)setLayoutType:(int64_t)a3;
- (void)setStatusFooterHeight:(double)a3;
@end

@implementation PXCMMEngineDrivenLayoutConfiguration

- (void)setStatusFooterHeight:(double)a3
{
  self->_statusFooterHeight = a3;
}

- (double)statusFooterHeight
{
  return self->_statusFooterHeight;
}

- (void)setBannerHeight:(double)a3
{
  self->_bannerHeight = a3;
}

- (double)bannerHeight
{
  return self->_bannerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

@end