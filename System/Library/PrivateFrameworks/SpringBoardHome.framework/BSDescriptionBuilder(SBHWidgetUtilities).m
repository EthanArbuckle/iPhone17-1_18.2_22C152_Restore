@interface BSDescriptionBuilder(SBHWidgetUtilities)
- (void)sbh_appendDescriptionsForViewControllers:()SBHWidgetUtilities;
@end

@implementation BSDescriptionBuilder(SBHWidgetUtilities)

- (void)sbh_appendDescriptionsForViewControllers:()SBHWidgetUtilities
{
  id v4 = a3;
  v5 = SBHWidgetViewControllerDescriptionsForSysdiagnose(v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__BSDescriptionBuilder_SBHWidgetUtilities__sbh_appendDescriptionsForViewControllers___block_invoke;
  v9[3] = &unk_1E6AB0028;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(v4, "bs_map:", v9);

  [a1 appendArraySection:v7 withName:@"widgetViewControllers" skipIfEmpty:0];
  return a1;
}

@end