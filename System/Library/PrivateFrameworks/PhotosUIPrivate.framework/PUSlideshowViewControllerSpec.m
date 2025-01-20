@interface PUSlideshowViewControllerSpec
- (BOOL)isAirplayRouteAvailable;
- (BOOL)isAirplayScreenAvailable;
- (BOOL)isChromeVisible;
- (BOOL)shouldObserveAirplayRoute;
- (BOOL)shouldPauseWhenAppResignsActive;
- (BOOL)shouldRegisterToAirplay;
- (BOOL)shouldShowAirplayButton;
- (BOOL)shouldShowChromeBars;
- (BOOL)shouldShowPlaceholder;
- (BOOL)shouldUseChromeBars;
- (BOOL)shouldUseTapGesture;
- (PUSlideshowViewControllerSpec)init;
- (PUSlideshowViewControllerSpec)initWithMode:(unint64_t)a3;
- (PUSlideshowViewControllerSpecChange)currentChange;
- (id)newSpecChange;
- (unint64_t)mode;
- (void)_setShouldObserveAirplayRoute:(BOOL)a3;
- (void)_setShouldShowAirplayButton:(BOOL)a3;
- (void)_setShouldShowChromeBars:(BOOL)a3;
- (void)_setShouldShowPlaceholder:(BOOL)a3;
- (void)setAirplayRouteAvailable:(BOOL)a3;
- (void)setAirplayScreenAvailable:(BOOL)a3;
- (void)setChromeVisible:(BOOL)a3;
- (void)updateIfNeeded;
@end

@implementation PUSlideshowViewControllerSpec

- (BOOL)shouldShowAirplayButton
{
  return self->_shouldShowAirplayButton;
}

- (BOOL)shouldObserveAirplayRoute
{
  return self->_shouldObserveAirplayRoute;
}

- (BOOL)shouldShowPlaceholder
{
  return self->_shouldShowPlaceholder;
}

- (BOOL)shouldShowChromeBars
{
  return self->_shouldShowChromeBars;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setAirplayRouteAvailable:(BOOL)a3
{
  self->_isAirplayRouteAvailable = a3;
}

- (BOOL)isAirplayRouteAvailable
{
  return self->_isAirplayRouteAvailable;
}

- (void)setAirplayScreenAvailable:(BOOL)a3
{
  self->_isAirplayScreenAvailable = a3;
}

- (BOOL)isAirplayScreenAvailable
{
  return self->_isAirplayScreenAvailable;
}

- (void)setChromeVisible:(BOOL)a3
{
  self->_isChromeVisible = a3;
}

- (BOOL)isChromeVisible
{
  return self->_isChromeVisible;
}

- (void)_setShouldShowAirplayButton:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldShowAirplayButton != v3)
  {
    self->_shouldShowAirplayButton = v3;
    id v5 = [(PUSlideshowViewControllerSpec *)self currentChange];
    [v5 _setShouldShowAirplayButtonChanged:1];
  }
}

- (void)_setShouldObserveAirplayRoute:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldObserveAirplayRoute != v3)
  {
    self->_shouldObserveAirplayRoute = v3;
    id v5 = [(PUSlideshowViewControllerSpec *)self currentChange];
    [v5 _setShouldObserveAirplayRouteChanged:1];
  }
}

- (void)_setShouldShowChromeBars:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldShowChromeBars != v3)
  {
    self->_shouldShowChromeBars = v3;
    id v5 = [(PUSlideshowViewControllerSpec *)self currentChange];
    [v5 _setShouldShowChromeBarsChanged:1];
  }
}

- (void)_setShouldShowPlaceholder:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldShowPlaceholder != v3)
  {
    self->_shouldShowPlaceholder = v3;
    id v5 = [(PUSlideshowViewControllerSpec *)self currentChange];
    [v5 _setShouldShowPlaceholderChanged:1];
  }
}

- (BOOL)shouldPauseWhenAppResignsActive
{
  return self->_mode == 0;
}

- (BOOL)shouldRegisterToAirplay
{
  return self->_mode == 0;
}

- (BOOL)shouldUseTapGesture
{
  return self->_mode == 0;
}

- (BOOL)shouldUseChromeBars
{
  return self->_mode == 0;
}

- (void)updateIfNeeded
{
  v10.receiver = self;
  v10.super_class = (Class)PUSlideshowViewControllerSpec;
  [(PUViewControllerSpec *)&v10 updateIfNeeded];
  BOOL v3 = [(PUSlideshowViewControllerSpec *)self isChromeVisible];
  BOOL v4 = [(PUSlideshowViewControllerSpec *)self isAirplayScreenAvailable];
  BOOL v5 = [(PUSlideshowViewControllerSpec *)self isAirplayRouteAvailable];
  unsigned int v6 = v3 || v4;
  if (self->_mode) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v4;
  }
  if (self->_mode) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v6;
  }
  BOOL v9 = [(PUSlideshowViewControllerSpec *)self shouldRegisterToAirplay];
  [(PUSlideshowViewControllerSpec *)self _setShouldShowPlaceholder:v7];
  [(PUSlideshowViewControllerSpec *)self _setShouldShowChromeBars:v8];
  [(PUSlideshowViewControllerSpec *)self _setShouldObserveAirplayRoute:v8 & v9];
  [(PUSlideshowViewControllerSpec *)self _setShouldShowAirplayButton:v8 & v5];
}

- (PUSlideshowViewControllerSpec)initWithMode:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUSlideshowViewControllerSpec;
  result = [(PUViewControllerSpec *)&v5 init];
  if (result) {
    result->_mode = a3;
  }
  return result;
}

- (PUSlideshowViewControllerSpec)init
{
  return [(PUSlideshowViewControllerSpec *)self initWithMode:0];
}

- (PUSlideshowViewControllerSpecChange)currentChange
{
  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowViewControllerSpec;
  v2 = [(PUViewControllerSpec *)&v4 currentChange];
  return (PUSlideshowViewControllerSpecChange *)v2;
}

- (id)newSpecChange
{
  return objc_alloc_init(PUSlideshowViewControllerSpecChange);
}

@end