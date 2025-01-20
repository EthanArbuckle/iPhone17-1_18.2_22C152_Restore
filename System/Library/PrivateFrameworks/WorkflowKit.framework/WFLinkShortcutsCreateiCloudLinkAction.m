@interface WFLinkShortcutsCreateiCloudLinkAction
- (id)smartPromptSubtitleWithPreviousContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
@end

@implementation WFLinkShortcutsCreateiCloudLinkAction

- (id)smartPromptSubtitleWithPreviousContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  return WFLocalizedString(@"Anyone with access to this shared link will be able to view the contents of this shortcut.");
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v5 = NSString;
  id v6 = a5;
  v7 = WFLocalizedString(@"Allow “%1$@” to create iCloud link?");
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);

  return v8;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F5A868];
  id v5 = a3;
  id v6 = [v4 publicICloud];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

@end