@interface WLAccessibility
- (BOOL)invertColorsEnabled;
- (id)preferredContentSizeCategoryName;
- (void)reset;
@end

@implementation WLAccessibility

- (void)reset
{
  _AXSInvertColorsSetEnabled();
  _AXSSetPreferredContentSizeCategoryName();
}

- (BOOL)invertColorsEnabled
{
  return _AXSInvertColorsEnabled() != 0;
}

- (id)preferredContentSizeCategoryName
{
  v2 = (void *)_AXSCopyPreferredContentSizeCategoryName();
  return v2;
}

@end