@interface ICASChecklistUsageData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASChecklistAction)checklistAction;
- (ICASChecklistUsageData)initWithChecklistAction:(id)a3 moveCheckedItemsToBottomSwitchSetting:(id)a4;
- (ICASMoveCheckedItemsToBottomSwitchSetting)moveCheckedItemsToBottomSwitchSetting;
- (id)toDict;
@end

@implementation ICASChecklistUsageData

- (ICASChecklistUsageData)initWithChecklistAction:(id)a3 moveCheckedItemsToBottomSwitchSetting:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASChecklistUsageData;
  v9 = [(ICASChecklistUsageData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_checklistAction, a3);
    objc_storeStrong((id *)&v10->_moveCheckedItemsToBottomSwitchSetting, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"ChecklistUsageData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"checklistAction";
  v3 = [(ICASChecklistUsageData *)self checklistAction];
  if (v3)
  {
    uint64_t v4 = [(ICASChecklistUsageData *)self checklistAction];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"moveCheckedItemsToBottomSwitchSetting";
  v12[0] = v4;
  v6 = [(ICASChecklistUsageData *)self moveCheckedItemsToBottomSwitchSetting];
  if (v6)
  {
    uint64_t v7 = [(ICASChecklistUsageData *)self moveCheckedItemsToBottomSwitchSetting];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (ICASChecklistAction)checklistAction
{
  return self->_checklistAction;
}

- (ICASMoveCheckedItemsToBottomSwitchSetting)moveCheckedItemsToBottomSwitchSetting
{
  return self->_moveCheckedItemsToBottomSwitchSetting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moveCheckedItemsToBottomSwitchSetting, 0);
  objc_storeStrong((id *)&self->_checklistAction, 0);
}

@end