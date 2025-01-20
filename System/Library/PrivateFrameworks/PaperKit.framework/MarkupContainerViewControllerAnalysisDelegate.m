@interface MarkupContainerViewControllerAnalysisDelegate
- (id)presentingViewControllerForContext:(id)a3;
- (void)contextActiveInteractionTypesDidChange:(id)a3;
- (void)contextAvailableResultsDidChange:(id)a3;
- (void)contextDidDismissVisualSearchController:(id)a3;
- (void)contextWillPresentVisualSearchController:(id)a3;
@end

@implementation MarkupContainerViewControllerAnalysisDelegate

- (id)presentingViewControllerForContext:(id)a3
{
  v3 = (void *)MEMORY[0x210550400](self->viewController, a2, a3);
  return v3;
}

- (void)contextWillPresentVisualSearchController:(id)a3
{
}

- (void)contextDidDismissVisualSearchController:(id)a3
{
}

- (void)contextActiveInteractionTypesDidChange:(id)a3
{
}

- (void)contextAvailableResultsDidChange:(id)a3
{
}

@end