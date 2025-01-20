@interface NTKMutableComplicationControllerDisplayProperties
- (void)setDefaultTapAnimationEnabled:(BOOL)a3;
- (void)setFaceDataMode:(int64_t)a3;
- (void)setLaunchLocation:(id)a3;
- (void)setShowPreview:(BOOL)a3;
- (void)setShowsInLowLuminance:(BOOL)a3;
- (void)setShowsWhenLocked:(BOOL)a3;
- (void)setSupportsTinting:(BOOL)a3;
- (void)setSupportsWatchGestureInteraction:(BOOL)a3;
- (void)setTapEnabled:(BOOL)a3;
- (void)setVisibility:(unint64_t)a3;
- (void)setWidgetConfigurationIdentifier:(id)a3;
- (void)setWidgetHostPriorityTransientSnapshot:(BOOL)a3;
- (void)setWidgetRequiresSnapshot:(BOOL)a3;
- (void)setWidgetShowsSnapshot:(BOOL)a3;
@end

@implementation NTKMutableComplicationControllerDisplayProperties

- (void)setFaceDataMode:(int64_t)a3
{
  self->super._faceDataMode = a3;
}

- (void)setLaunchLocation:(id)a3
{
  v4 = (NSString *)[a3 copy];
  launchLocation = self->super._launchLocation;
  self->super._launchLocation = v4;
}

- (void)setTapEnabled:(BOOL)a3
{
  self->super._tapEnabled = a3;
}

- (void)setDefaultTapAnimationEnabled:(BOOL)a3
{
  self->super._defaultTapAnimationEnabled = a3;
}

- (void)setSupportsWatchGestureInteraction:(BOOL)a3
{
  self->super._supportsWatchGestureInteraction = a3;
}

- (void)setVisibility:(unint64_t)a3
{
  self->super._visibility = a3;
}

- (void)setSupportsTinting:(BOOL)a3
{
  self->super._supportsTinting = a3;
}

- (void)setShowsWhenLocked:(BOOL)a3
{
  self->super._showsWhenLocked = a3;
}

- (void)setShowsInLowLuminance:(BOOL)a3
{
  self->super._showsInLowLuminance = a3;
}

- (void)setWidgetConfigurationIdentifier:(id)a3
{
  v4 = (NSString *)[a3 copy];
  widgetConfigurationIdentifier = self->super._widgetConfigurationIdentifier;
  self->super._widgetConfigurationIdentifier = v4;
}

- (void)setWidgetShowsSnapshot:(BOOL)a3
{
  self->super._widgetShowsSnapshot = a3;
}

- (void)setWidgetRequiresSnapshot:(BOOL)a3
{
  self->super._widgetRequiresSnapshot = a3;
}

- (void)setWidgetHostPriorityTransientSnapshot:(BOOL)a3
{
  self->super._widgetHostPriorityTransientSnapshot = a3;
}

- (void)setShowPreview:(BOOL)a3
{
  self->super._showPreview = a3;
}

@end