@interface WFTakeScreenshotContextualAction
- (WFTakeScreenshotContextualAction)init;
- (WFTakeScreenshotContextualAction)initWithIgnoreContextualAssistanceLayersOption:(BOOL)a3;
@end

@implementation WFTakeScreenshotContextualAction

- (WFTakeScreenshotContextualAction)initWithIgnoreContextualAssistanceLayersOption:(BOOL)a3
{
  BOOL v3 = a3;
  v15[1] = *MEMORY[0x1E4F143B8];
  v5 = WFLocalizedString(@"Take Screenshot");
  v6 = [WFContextualActionParameter alloc];
  v7 = [NSNumber numberWithBool:v3];
  v8 = [(WFContextualActionParameter *)v6 initWithType:@"WFNumberContentItem" displayString:0 wfParameterKey:@"WFTakeScreenshotIgnoreContextualAssistanceLayers" wfSerializedRepresentation:v7];
  v15[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

  LOBYTE(v14) = 0;
  v10 = [(WFContextualAction *)self initWithIdentifier:@"is.workflow.actions.takescreenshot" wfActionIdentifier:@"is.workflow.actions.takescreenshot" type:0 correspondingSystemActionType:0 associatedAppBundleIdentifier:@"com.apple.Preferences" resultFileOperation:1 alternate:v14 filteringBehavior:0 parameters:v9 displayFormatString:v5 title:v5 subtitleFormatString:0 icon:0];
  v11 = v10;
  if (v10) {
    v12 = v10;
  }

  return v11;
}

- (WFTakeScreenshotContextualAction)init
{
  return [(WFTakeScreenshotContextualAction *)self initWithIgnoreContextualAssistanceLayersOption:0];
}

@end