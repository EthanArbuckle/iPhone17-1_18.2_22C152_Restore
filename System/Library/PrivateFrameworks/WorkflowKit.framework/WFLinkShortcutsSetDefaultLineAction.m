@interface WFLinkShortcutsSetDefaultLineAction
- (id)smartPromptSubtitleWithPreviousContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
@end

@implementation WFLinkShortcutsSetDefaultLineAction

- (id)smartPromptSubtitleWithPreviousContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  return WFLocalizedString(@"Changing the default line for Voice or Data may lead to unexpected cellular plan charges.");
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v5 = NSString;
  id v6 = a5;
  v7 = WFLocalizedString(@"Allow “%1$@” to change the default cellular line?");
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);

  return v8;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F5A868];
  id v5 = a3;
  id v6 = [v4 defaultLineLocation];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

@end