@interface SBSApplicationMultiwindowService
- (void)requestShelfPresentationForSceneWithIdentifier:(id)a3;
- (void)triggerShowAllWindowsForApplicationBundleIdentifier:(id)a3;
@end

@implementation SBSApplicationMultiwindowService

- (void)triggerShowAllWindowsForApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSAbstractApplicationService *)self client];
  [v5 triggerShowAllWindowsForApplicationBundleIdentifier:v4];
}

- (void)requestShelfPresentationForSceneWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSAbstractApplicationService *)self client];
  [v5 requestShelfPresentationForSceneWithIdentifier:v4];
}

@end