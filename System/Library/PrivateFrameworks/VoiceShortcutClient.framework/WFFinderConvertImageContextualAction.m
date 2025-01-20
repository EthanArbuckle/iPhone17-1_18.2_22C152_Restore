@interface WFFinderConvertImageContextualAction
- (WFFinderConvertImageContextualAction)init;
- (id)copyWithFormat:(unint64_t)a3 resizeSize:(unint64_t)a4 preserveMetadata:(BOOL)a5;
@end

@implementation WFFinderConvertImageContextualAction

- (id)copyWithFormat:(unint64_t)a3 resizeSize:(unint64_t)a4 preserveMetadata:(BOOL)a5
{
  BOOL v5 = a5;
  v23[3] = *MEMORY[0x1E4F143B8];
  v9 = [WFContextualActionParameter alloc];
  v10 = @"JPEG";
  if (a3 == 1) {
    v10 = @"PNG";
  }
  if (a3 == 2) {
    v10 = @"HEIF";
  }
  v11 = v10;
  v12 = [(WFContextualActionParameter *)v9 initWithType:@"WFNumberContentItem" displayString:0 wfParameterKey:@"WFFileFormat" wfSerializedRepresentation:v11];

  v13 = [WFContextualActionParameter alloc];
  if (a4 > 2) {
    v14 = @"Small";
  }
  else {
    v14 = off_1E6079CB0[a4];
  }
  v15 = v14;
  v16 = [(WFContextualActionParameter *)v13 initWithType:@"WFNumberContentItem" displayString:0 wfParameterKey:@"WFSize" wfSerializedRepresentation:v15];

  v17 = [WFContextualActionParameter alloc];
  v18 = [NSNumber numberWithBool:v5];
  v19 = [(WFContextualActionParameter *)v17 initWithType:@"WFNumberContentItem" displayString:0 wfParameterKey:@"WFPreserveMetadata" wfSerializedRepresentation:v18];

  v23[0] = v12;
  v23[1] = v16;
  v23[2] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  id v21 = [(WFContextualAction *)self copyWithParameters:v20];

  return v21;
}

- (WFFinderConvertImageContextualAction)init
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v3 = WFLocalizedString(@"Convert Image");
  v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F44400]];
  BOOL v5 = +[WFContextualActionFilteringBehavior filteringWithMatchingTypes:v4 predicate:0];

  v6 = [[WFContextualActionParameter alloc] initWithType:@"WFNumberContentItem" displayString:0 wfParameterKey:@"WFSize" askEachTime:1];
  v13[0] = v6;
  v7 = [[WFContextualActionParameter alloc] initWithType:@"WFNumberContentItem" displayString:0 wfParameterKey:@"WFFileFormat" askEachTime:1];
  v13[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v9 = +[WFContextualActionIcon iconWithSystemName:@"photo.on.rectangle.angled"];
  LOBYTE(v12) = 0;
  v10 = [(WFContextualAction *)self initWithIdentifier:@"is.workflow.actions.image.convert.finder", @"is.workflow.actions.image.convert.finder", 0, 9, @"com.apple.mobileslideshow", 1, v12, v5, v8, v3, v3, 0, v9, v13[0] wfActionIdentifier type correspondingSystemActionType associatedAppBundleIdentifier resultFileOperation alternate filteringBehavior parameters displayFormatString title subtitleFormatString icon];

  return v10;
}

@end