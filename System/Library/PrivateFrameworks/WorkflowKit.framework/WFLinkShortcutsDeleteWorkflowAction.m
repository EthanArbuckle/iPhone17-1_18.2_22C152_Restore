@interface WFLinkShortcutsDeleteWorkflowAction
- (id)inputDictionary;
- (id)localizedCategoryWithContext:(id)a3;
@end

@implementation WFLinkShortcutsDeleteWorkflowAction

- (id)inputDictionary
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)WFLinkShortcutsDeleteWorkflowAction;
  v3 = [(WFLinkAction *)&v14 inputDictionary];
  v4 = (void *)[v3 mutableCopy];

  v5 = [v4 objectForKey:@"Types"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  if (![v7 count])
  {
    v8 = getWFActionsLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFLinkShortcutsDeleteWorkflowAction inputDictionary]";
      __int16 v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Unable to construct input type for %@", buf, 0x16u);
    }

    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }
  v9 = (void *)[v7 mutableCopy];
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v9 insertObject:v11 atIndex:0];

  v12 = (void *)[v9 copy];
  [v4 setObject:v12 forKey:@"Types"];

  return v4;
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"ShortcutsSubcategoryShortcuts", @"Shortcuts");
  v5 = [v3 localize:v4];

  return v5;
}

@end