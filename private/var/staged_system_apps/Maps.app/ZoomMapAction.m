@interface ZoomMapAction
- (BOOL)isCompatibleWithNavigation;
- (ZoomMapAction)initWithZoomFactor:(double)a3;
- (double)zoomFactor;
- (int)analyticsLaunchActionType;
- (void)setZoomFactor:(double)a3;
@end

@implementation ZoomMapAction

- (ZoomMapAction)initWithZoomFactor:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ZoomMapAction;
  result = [(ZoomMapAction *)&v5 init];
  if (result) {
    result->_zoomFactor = a3;
  }
  return result;
}

- (BOOL)isCompatibleWithNavigation
{
  return 1;
}

- (int)analyticsLaunchActionType
{
  return 33;
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (void)setZoomFactor:(double)a3
{
  self->_zoomFactor = a3;
}

@end