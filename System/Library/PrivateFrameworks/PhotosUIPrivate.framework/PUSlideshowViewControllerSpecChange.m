@interface PUSlideshowViewControllerSpecChange
- (BOOL)changed;
- (BOOL)chromeVisibilityChanged;
- (BOOL)shouldObserveAirplayRouteChanged;
- (BOOL)shouldShowAirplayButtonChanged;
- (BOOL)shouldShowChromeBarsChanged;
- (BOOL)shouldShowPlaceholderChanged;
- (void)_setShouldObserveAirplayRouteChanged:(BOOL)a3;
- (void)_setShouldShowAirplayButtonChanged:(BOOL)a3;
- (void)_setShouldShowChromeBarsChanged:(BOOL)a3;
- (void)_setShouldShowPlaceholderChanged:(BOOL)a3;
@end

@implementation PUSlideshowViewControllerSpecChange

- (void)_setShouldShowAirplayButtonChanged:(BOOL)a3
{
  self->_shouldShowChromeBarsChanged = a3;
}

- (BOOL)shouldShowAirplayButtonChanged
{
  return self->_shouldShowChromeBarsChanged;
}

- (void)_setShouldObserveAirplayRouteChanged:(BOOL)a3
{
  self->_shouldShowPlaceholderChanged = a3;
}

- (BOOL)shouldObserveAirplayRouteChanged
{
  return self->_shouldShowPlaceholderChanged;
}

- (void)_setShouldShowChromeBarsChanged:(BOOL)a3
{
  self->_chromeVisibilityChanged = a3;
}

- (BOOL)shouldShowChromeBarsChanged
{
  return self->_chromeVisibilityChanged;
}

- (void)_setShouldShowPlaceholderChanged:(BOOL)a3
{
  *(&self->super._prefersCompactLayoutForSplitScreenChanged + 2) = a3;
}

- (BOOL)shouldShowPlaceholderChanged
{
  return *(&self->super._prefersCompactLayoutForSplitScreenChanged + 2);
}

- (BOOL)chromeVisibilityChanged
{
  return *(&self->super._prefersCompactLayoutForSplitScreenChanged + 1);
}

- (BOOL)changed
{
  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowViewControllerSpecChange;
  return [(PUViewControllerSpecChange *)&v4 changed]
      || [(PUSlideshowViewControllerSpecChange *)self shouldShowPlaceholderChanged]
      || [(PUSlideshowViewControllerSpecChange *)self shouldShowChromeBarsChanged]
      || [(PUSlideshowViewControllerSpecChange *)self shouldObserveAirplayRouteChanged]|| [(PUSlideshowViewControllerSpecChange *)self shouldShowAirplayButtonChanged];
}

@end