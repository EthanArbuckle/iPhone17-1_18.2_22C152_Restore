@interface UISceneOpenExternalURLOptions
- (BOOL)universalLinksOnly;
- (UIEventAttribution)eventAttribution;
- (void)setEventAttribution:(UIEventAttribution *)eventAttribution;
- (void)setUniversalLinksOnly:(BOOL)universalLinksOnly;
@end

@implementation UISceneOpenExternalURLOptions

- (BOOL)universalLinksOnly
{
  return self->_universalLinksOnly;
}

- (void)setUniversalLinksOnly:(BOOL)universalLinksOnly
{
  self->_universalLinksOnly = universalLinksOnly;
}

- (UIEventAttribution)eventAttribution
{
  return self->_eventAttribution;
}

- (void)setEventAttribution:(UIEventAttribution *)eventAttribution
{
}

- (void).cxx_destruct
{
}

@end