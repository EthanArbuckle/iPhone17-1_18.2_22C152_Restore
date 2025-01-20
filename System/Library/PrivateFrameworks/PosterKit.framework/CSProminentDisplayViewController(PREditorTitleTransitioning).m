@interface CSProminentDisplayViewController(PREditorTitleTransitioning)
- (PREditorTitleViewControllerCSTransitionWrapper)pr_beginInteractiveTransitionToBaseFont:()PREditorTitleTransitioning vibrancyConfiguration:cachingVibrancyTransitionProvider:;
@end

@implementation CSProminentDisplayViewController(PREditorTitleTransitioning)

- (PREditorTitleViewControllerCSTransitionWrapper)pr_beginInteractiveTransitionToBaseFont:()PREditorTitleTransitioning vibrancyConfiguration:cachingVibrancyTransitionProvider:
{
  v1 = objc_msgSend(a1, "beginInteractiveTransitionToBaseFont:vibrancyConfiguration:cachingVibrancyTransitionProvider:");
  v2 = [[PREditorTitleViewControllerCSTransitionWrapper alloc] initWithCSTransitioning:v1];

  return v2;
}

@end