@interface UIViewController(SBHWidgetUtilitiesInternal)
- (uint64_t)sbh_isCustomIconImageViewController;
- (uint64_t)sbh_isMultiplexingViewController;
- (uint64_t)sbh_isWidgetHostViewController;
- (uint64_t)sbh_isWidgetStackViewController;
- (uint64_t)sbh_underlyingAvocadoHostViewControllers;
@end

@implementation UIViewController(SBHWidgetUtilitiesInternal)

- (uint64_t)sbh_isMultiplexingViewController
{
  return 0;
}

- (uint64_t)sbh_isWidgetHostViewController
{
  return 0;
}

- (uint64_t)sbh_isWidgetStackViewController
{
  return 0;
}

- (uint64_t)sbh_isCustomIconImageViewController
{
  return 0;
}

- (uint64_t)sbh_underlyingAvocadoHostViewControllers
{
  return [MEMORY[0x1E4F1CAD0] set];
}

@end