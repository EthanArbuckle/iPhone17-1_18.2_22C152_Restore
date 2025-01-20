@interface CHUISWidgetHostViewController(SBHWidgetUtilitiesInternal)
- (uint64_t)sbh_isWidgetHostViewController;
- (uint64_t)sbh_underlyingAvocadoHostViewControllers;
@end

@implementation CHUISWidgetHostViewController(SBHWidgetUtilitiesInternal)

- (uint64_t)sbh_isWidgetHostViewController
{
  return 1;
}

- (uint64_t)sbh_underlyingAvocadoHostViewControllers
{
  return [MEMORY[0x1E4F1CAD0] setWithObject:a1];
}

@end