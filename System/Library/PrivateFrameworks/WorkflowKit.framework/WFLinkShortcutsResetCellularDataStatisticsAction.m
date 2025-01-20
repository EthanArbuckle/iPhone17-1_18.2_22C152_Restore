@interface WFLinkShortcutsResetCellularDataStatisticsAction
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
@end

@implementation WFLinkShortcutsResetCellularDataStatisticsAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v5 = NSString;
  id v6 = a5;
  v7 = WFLocalizedString(@"Allow “%1$@” to reset the cellular data statistics?");
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);

  return v8;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F5A868];
  id v5 = a3;
  id v6 = [v4 cellularDataStatisticsLocation];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

@end