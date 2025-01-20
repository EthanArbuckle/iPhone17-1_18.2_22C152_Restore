@interface PXVideoOverlayButtonConfiguration
- (BOOL)allowBackdropStatisticsSupression;
- (NSString)localizedTitle;
- (PXVideoOverlayButtonConfiguration)init;
- (int64_t)style;
- (void)setAllowBackdropStatisticsSupression:(BOOL)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation PXVideoOverlayButtonConfiguration

- (void).cxx_destruct
{
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setAllowBackdropStatisticsSupression:(BOOL)a3
{
  self->_allowBackdropStatisticsSupression = a3;
}

- (BOOL)allowBackdropStatisticsSupression
{
  return self->_allowBackdropStatisticsSupression;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (PXVideoOverlayButtonConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXVideoOverlayButtonConfiguration;
  v2 = [(PXVideoOverlayButtonConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    localizedTitle = v2->_localizedTitle;
    v2->_style = 0;
    v2->_localizedTitle = 0;
    v2->_allowBackdropStatisticsSupression = 1;
  }
  return v3;
}

@end