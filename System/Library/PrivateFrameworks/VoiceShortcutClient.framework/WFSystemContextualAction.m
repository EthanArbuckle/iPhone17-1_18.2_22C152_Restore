@interface WFSystemContextualAction
- (WFSystemContextualAction)initWithType:(unint64_t)a3 identifier:(id)a4 displayString:(id)a5 inputTypes:(id)a6;
@end

@implementation WFSystemContextualAction

- (WFSystemContextualAction)initWithType:(unint64_t)a3 identifier:(id)a4 displayString:(id)a5 inputTypes:(id)a6
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v10;
  if (a3 - 1 > 8)
  {
    v17 = 0;
  }
  else
  {
    v14 = off_1E60791F0[a3 - 1];
    v25[0] = @"com.apple.shortcuts.systemContextualAction";
    v25[1] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    v16 = (void *)[v15 mutableCopy];

    if (v13) {
      [v16 addObject:v13];
    }
    v17 = [v16 componentsJoinedByString:@"."];
  }
  if (v12)
  {
    v18 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
    v19 = +[WFContextualActionFilteringBehavior filteringWithMatchingTypes:v18 predicate:0];
  }
  else
  {
    v19 = +[WFContextualActionFilteringBehavior matchAllFiles];
  }
  BOOL v21 = a3 > 9 || (a3 & 0x3FF) == 2;
  LOBYTE(v24) = v21;
  v22 = [(WFContextualAction *)self initWithIdentifier:v17 wfActionIdentifier:0 type:0 correspondingSystemActionType:a3 associatedAppBundleIdentifier:0 resultFileOperation:1 alternate:v24 filteringBehavior:v19 parameters:0 displayFormatString:v11 title:v11 subtitleFormatString:0 icon:0];

  return v22;
}

@end