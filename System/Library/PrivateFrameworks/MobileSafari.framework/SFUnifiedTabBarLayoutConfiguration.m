@interface SFUnifiedTabBarLayoutConfiguration
- (BOOL)flipped;
- (BOOL)isStandalone;
- (BOOL)shouldSlideInNewTrailingTab;
- (CGPoint)midpointForCenteredContent;
- (CGRect)visibleRectOverride;
- (SFUnifiedTabBarLayoutConfiguration)initWithScrollView:(id)a3;
- (SFUnifiedTabBarMetrics)barMetrics;
- (UIScrollView)scrollView;
- (void)setBarMetrics:(id)a3;
- (void)setFlipped:(BOOL)a3;
- (void)setMidpointForCenteredContent:(CGPoint)a3;
- (void)setShouldSlideInNewTrailingTab:(BOOL)a3;
- (void)setStandalone:(BOOL)a3;
- (void)setVisibleRectOverride:(CGRect)a3;
@end

@implementation SFUnifiedTabBarLayoutConfiguration

- (SFUnifiedTabBarLayoutConfiguration)initWithScrollView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFUnifiedTabBarLayoutConfiguration;
  v6 = [(SFUnifiedTabBarLayoutConfiguration *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scrollView, a3);
    CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v7->_visibleRectOverride.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v7->_visibleRectOverride.size = v8;
    v9 = v7;
  }

  return v7;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (SFUnifiedTabBarMetrics)barMetrics
{
  return self->_barMetrics;
}

- (void)setBarMetrics:(id)a3
{
}

- (CGPoint)midpointForCenteredContent
{
  double x = self->_midpointForCenteredContent.x;
  double y = self->_midpointForCenteredContent.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMidpointForCenteredContent:(CGPoint)a3
{
  self->_midpointForCenteredContent = a3;
}

- (BOOL)isStandalone
{
  return self->_standalone;
}

- (void)setStandalone:(BOOL)a3
{
  self->_standalone = a3;
}

- (BOOL)flipped
{
  return self->_flipped;
}

- (void)setFlipped:(BOOL)a3
{
  self->_flipped = a3;
}

- (BOOL)shouldSlideInNewTrailingTab
{
  return self->_shouldSlideInNewTrailingTab;
}

- (void)setShouldSlideInNewTrailingTab:(BOOL)a3
{
  self->_shouldSlideInNewTrailingTab = a3;
}

- (CGRect)visibleRectOverride
{
  double x = self->_visibleRectOverride.origin.x;
  double y = self->_visibleRectOverride.origin.y;
  double width = self->_visibleRectOverride.size.width;
  double height = self->_visibleRectOverride.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVisibleRectOverride:(CGRect)a3
{
  self->_visibleRectOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barMetrics, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end