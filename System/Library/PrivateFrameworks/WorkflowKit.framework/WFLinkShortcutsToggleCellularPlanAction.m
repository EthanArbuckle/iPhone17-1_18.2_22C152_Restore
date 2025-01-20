@interface WFLinkShortcutsToggleCellularPlanAction
- (id)smartPromptSubtitleWithPreviousContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
@end

@implementation WFLinkShortcutsToggleCellularPlanAction

- (id)smartPromptSubtitleWithPreviousContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  return WFLocalizedString(@"Toggling the status of a cellular plan may lead to unexpected charges.");
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v5 = NSString;
  id v6 = a5;
  v7 = WFLocalizedString(@"Allow “%1$@” to toggle a cellular plan?");
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);

  return v8;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F5A868];
  id v5 = a3;
  id v6 = [v4 toggleLineLocation];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

@end