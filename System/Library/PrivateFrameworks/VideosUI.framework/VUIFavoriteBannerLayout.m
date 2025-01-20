@interface VUIFavoriteBannerLayout
- (BOOL)isPreModeBanner;
- (TVImageLayout)imageLayout;
- (UIColor)backgroundColor;
- (UIColor)highlightedBackgroundColor;
- (UIEdgeInsets)margin;
- (VUITextLayout)subtitleLayout;
- (VUITextLayout)titleLayout;
- (_VUICornerRadii)borderRadii;
- (double)bannerMinHeight;
- (double)maxTextWidth;
- (double)subtitleBaseLine;
- (unint64_t)bannerStyle;
- (unint64_t)bannerStyleForSizeClass:(int64_t)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBannerMinHeight:(double)a3;
- (void)setBannerStyle:(unint64_t)a3;
- (void)setBorderRadii:(_VUICornerRadii)a3;
- (void)setHighlightedBackgroundColor:(id)a3;
- (void)setIsPreModeBanner:(BOOL)a3;
- (void)setMargin:(UIEdgeInsets)a3;
- (void)setMaxTextWidth:(double)a3;
- (void)setSubtitleBaseLine:(double)a3;
@end

@implementation VUIFavoriteBannerLayout

- (unint64_t)bannerStyleForSizeClass:(int64_t)a3
{
  if (self->_isPreModeBanner) {
    return (unint64_t)a3 > 1;
  }
  if ((unint64_t)a3 < 2) {
    return 0;
  }
  if (a3 != 2) {
    return 2;
  }
  v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v5 = [v4 userInterfaceIdiom] != 1;

  return 2 * v5;
}

- (BOOL)isPreModeBanner
{
  return self->_isPreModeBanner;
}

- (void)setIsPreModeBanner:(BOOL)a3
{
  self->_isPreModeBanner = a3;
}

- (_VUICornerRadii)borderRadii
{
  double topLeft = self->_borderRadii.topLeft;
  double topRight = self->_borderRadii.topRight;
  double bottomLeft = self->_borderRadii.bottomLeft;
  double bottomRight = self->_borderRadii.bottomRight;
  result.double bottomRight = bottomRight;
  result.double bottomLeft = bottomLeft;
  result.double topRight = topRight;
  result.double topLeft = topLeft;
  return result;
}

- (void)setBorderRadii:(_VUICornerRadii)a3
{
  self->_borderRadii = a3;
}

- (UIEdgeInsets)margin
{
  double top = self->_margin.top;
  double left = self->_margin.left;
  double bottom = self->_margin.bottom;
  double right = self->_margin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMargin:(UIEdgeInsets)a3
{
  self->_margin = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (void)setHighlightedBackgroundColor:(id)a3
{
}

- (double)bannerMinHeight
{
  return self->_bannerMinHeight;
}

- (void)setBannerMinHeight:(double)a3
{
  self->_bannerMinHeight = a3;
}

- (double)maxTextWidth
{
  return self->_maxTextWidth;
}

- (void)setMaxTextWidth:(double)a3
{
  self->_maxTextWidth = a3;
}

- (double)subtitleBaseLine
{
  return self->_subtitleBaseLine;
}

- (void)setSubtitleBaseLine:(double)a3
{
  self->_subtitleBaseLine = a3;
}

- (VUITextLayout)titleLayout
{
  return self->_titleLayout;
}

- (VUITextLayout)subtitleLayout
{
  return self->_subtitleLayout;
}

- (TVImageLayout)imageLayout
{
  return self->_imageLayout;
}

- (unint64_t)bannerStyle
{
  return self->_bannerStyle;
}

- (void)setBannerStyle:(unint64_t)a3
{
  self->_bannerStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLayout, 0);
  objc_storeStrong((id *)&self->_subtitleLayout, 0);
  objc_storeStrong((id *)&self->_titleLayout, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end