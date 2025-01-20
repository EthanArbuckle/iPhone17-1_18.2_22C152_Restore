@interface WFControlFlowAction
- (BOOL)displaysParameterSummary;
- (BOOL)hasChildren;
- (BOOL)inputPassthrough;
- (BOOL)inputTypePassthrough;
- (BOOL)isCollapsed;
- (BOOL)isDeletable;
- (BOOL)snappingPassthrough;
- (WFControlFlowAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (WFControlFlowAttributionTracker)controlFlowTracker;
- (id)createAccompanyingActionWithMode:(int64_t)a3;
- (id)groupedCloseAction;
- (id)groupedIntermediaryActions;
- (id)groupedOpenAction;
- (id)iconName;
- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4;
- (id)outputContentClasses;
- (id)serializedParameters;
- (int64_t)mode;
- (void)generateGroupingIdentifierIfNecessary;
- (void)setCollapsed:(BOOL)a3;
- (void)setControlFlowTracker:(id)a3;
@end

@implementation WFControlFlowAction

- (WFControlFlowAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)[a5 mutableCopy];
  v11 = objc_msgSend(v10, "wf_popObjectForKey:", @"WFControlFlowMode");
  uint64_t v12 = objc_opt_class();
  v13 = WFEnforceClass(v11, v12);
  uint64_t v14 = [v13 integerValue];

  if (v14)
  {
    v15 = [v9 definitionByRemovingKey:@"Parameters"];

    id v9 = [v15 definitionByRemovingKey:@"RequiredResources"];
  }
  v20.receiver = self;
  v20.super_class = (Class)WFControlFlowAction;
  v16 = [(WFAction *)&v20 initWithIdentifier:v8 definition:v9 serializedParameters:v10];
  v17 = v16;
  if (v16)
  {
    v16->_mode = v14;
    v18 = v16;
  }

  return v17;
}

- (void).cxx_destruct
{
}

- (void)setControlFlowTracker:(id)a3
{
}

- (WFControlFlowAttributionTracker)controlFlowTracker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlFlowTracker);
  return (WFControlFlowAttributionTracker *)WeakRetained;
}

- (int64_t)mode
{
  return self->_mode;
}

- (id)groupedIntermediaryActions
{
  v3 = [(WFAction *)self workflow];
  v4 = [v3 actionsGroupedWithAction:self];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__WFControlFlowAction_groupedIntermediaryActions__block_invoke;
  v7[3] = &unk_1E6552E28;
  v7[4] = self;
  v5 = objc_msgSend(v4, "if_objectsPassingTest:", v7);

  return v5;
}

BOOL __49__WFControlFlowAction_groupedIntermediaryActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  v4 = WFEnforceClass(v2, v3);

  BOOL v5 = [v4 mode] == 1;
  return v5;
}

- (id)groupedCloseAction
{
  uint64_t v3 = [(WFAction *)self workflow];
  v4 = [v3 actionsGroupedWithAction:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__WFControlFlowAction_groupedCloseAction__block_invoke;
  v7[3] = &unk_1E6552E28;
  v7[4] = self;
  BOOL v5 = objc_msgSend(v4, "if_firstObjectPassingTest:", v7);

  return v5;
}

BOOL __41__WFControlFlowAction_groupedCloseAction__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  v4 = WFEnforceClass(v2, v3);

  BOOL v5 = [v4 mode] == 2;
  return v5;
}

- (id)groupedOpenAction
{
  uint64_t v3 = [(WFAction *)self workflow];
  v4 = [v3 actionsGroupedWithAction:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__WFControlFlowAction_groupedOpenAction__block_invoke;
  v7[3] = &unk_1E6552E28;
  v7[4] = self;
  BOOL v5 = objc_msgSend(v4, "if_firstObjectPassingTest:", v7);

  return v5;
}

BOOL __40__WFControlFlowAction_groupedOpenAction__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  v4 = WFEnforceClass(v2, v3);

  BOOL v5 = [v4 mode] == 0;
  return v5;
}

- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int64_t v9 = [(WFControlFlowAction *)self mode];
  switch(v9)
  {
    case 2:
      if ([v8 containsObject:self])
      {
LABEL_17:
        v4 = (void *)MEMORY[0x1E4F1CBF0];
        break;
      }
      id v10 = objc_alloc(MEMORY[0x1E4F1CA70]);
      v29.receiver = self;
      v29.super_class = (Class)WFControlFlowAction;
      v11 = [(WFAction *)&v29 inheritedOutputContentClassesInWorkflow:v7 context:v8];
      uint64_t v12 = (void *)[v10 initWithArray:v11];

      [v8 addObject:self];
      [(WFControlFlowAction *)self groupedIntermediaryActions];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            v19 = objc_msgSend(v7, "actions", (void)v25);
            uint64_t v20 = [v19 indexOfObject:v18];
            unint64_t v21 = v20 - 1;
            if (v20 < 1 || v21 >= [v19 count])
            {
              v4 = [v12 array];

              goto LABEL_20;
            }
            v22 = [v19 objectAtIndex:v21];
            v23 = [v22 inheritedOutputContentClassesInWorkflow:v7 context:v8];
            [v12 addObjectsFromArray:v23];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      v4 = [v12 array];
LABEL_20:

LABEL_21:
      break;
    case 1:
      if ([v8 containsObject:self]) {
        goto LABEL_17;
      }
      [v8 addObject:self];
      uint64_t v12 = [(WFControlFlowAction *)self groupedOpenAction];
      v4 = [v12 inheritedOutputContentClassesInWorkflow:v7 context:v8];
      goto LABEL_21;
    case 0:
      v30.receiver = self;
      v30.super_class = (Class)WFControlFlowAction;
      v4 = [(WFAction *)&v30 inheritedOutputContentClassesInWorkflow:v7 context:v8];
      break;
  }

  return v4;
}

- (id)outputContentClasses
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(WFControlFlowAction *)self mode] == 2)
  {
    v6[0] = objc_opt_class();
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WFControlFlowAction;
    uint64_t v3 = [(WFAction *)&v5 outputContentClasses];
  }
  return v3;
}

- (BOOL)hasChildren
{
  if (![(WFControlFlowAction *)self mode]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)WFControlFlowAction;
  return [(WFAction *)&v4 hasChildren];
}

- (BOOL)isDeletable
{
  if ([(WFControlFlowAction *)self mode]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WFControlFlowAction;
  return [(WFAction *)&v4 isDeletable];
}

- (BOOL)inputTypePassthrough
{
  if ([(WFControlFlowAction *)self mode] == 2 || ![(WFControlFlowAction *)self mode]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)WFControlFlowAction;
  return [(WFAction *)&v4 inputTypePassthrough];
}

- (BOOL)snappingPassthrough
{
  if ([(WFControlFlowAction *)self mode] == 2) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WFControlFlowAction;
  return [(WFAction *)&v4 snappingPassthrough];
}

- (BOOL)inputPassthrough
{
  return [(WFControlFlowAction *)self mode] == 0;
}

- (id)iconName
{
  if ([(WFControlFlowAction *)self mode])
  {
    uint64_t v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WFControlFlowAction;
    uint64_t v3 = [(WFAction *)&v5 iconName];
  }
  return v3;
}

- (BOOL)displaysParameterSummary
{
  return [(WFControlFlowAction *)self mode] == 0;
}

- (id)createAccompanyingActionWithMode:(int64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  [(WFControlFlowAction *)self generateGroupingIdentifierIfNecessary];
  v11 = @"WFControlFlowMode";
  objc_super v5 = [NSNumber numberWithInteger:a3];
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v10.receiver = self;
  v10.super_class = (Class)WFControlFlowAction;
  id v7 = [(WFAction *)&v10 copyWithSerializedParameters:v6];

  id v8 = [(WFAction *)self groupingIdentifier];
  [v7 setGroupingIdentifier:v8];

  return v7;
}

- (id)serializedParameters
{
  [(WFControlFlowAction *)self generateGroupingIdentifierIfNecessary];
  v7.receiver = self;
  v7.super_class = (Class)WFControlFlowAction;
  uint64_t v3 = [(WFAction *)&v7 serializedParameters];
  objc_super v4 = (void *)[v3 mutableCopy];

  objc_super v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFControlFlowAction mode](self, "mode"));
  [v4 setObject:v5 forKey:@"WFControlFlowMode"];

  return v4;
}

- (void)generateGroupingIdentifierIfNecessary
{
  uint64_t v3 = [(WFAction *)self groupingIdentifier];

  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F29128] UUID];
    objc_super v4 = [v5 UUIDString];
    [(WFAction *)self setGroupingIdentifier:v4];
  }
}

- (void)setCollapsed:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WFControlFlowAction *)self mode] != 2)
  {
    id v5 = [(WFAction *)self workflow];
    id v15 = [v5 workflowID];

    if ([v15 length])
    {
      id v6 = [(WFAction *)self generateUUIDIfNecessaryWithUUIDProvider:0];
      objc_super v7 = [(WFAction *)self UUID];
      id v8 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
      int64_t v9 = [NSString stringWithFormat:@"WFCollapsedActions-%@", v15];
      uint64_t v10 = [v8 stringArrayForKey:v9];
      v11 = (void *)v10;
      uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
      if (v10) {
        uint64_t v12 = (void *)v10;
      }
      id v13 = v12;

      if (v3) {
        [v13 arrayByAddingObject:v7];
      }
      else {
      uint64_t v14 = objc_msgSend(v13, "if_arrayByRemovingObject:", v7);
      }

      if ([v14 count]) {
        [v8 setObject:v14 forKey:v9];
      }
      else {
        [v8 removeObjectForKey:v9];
      }
    }
  }
}

- (BOOL)isCollapsed
{
  if ([(WFControlFlowAction *)self mode] == 2) {
    return 0;
  }
  objc_super v4 = [(WFAction *)self workflow];
  id v5 = [v4 workflowID];

  id v6 = [(WFAction *)self UUID];
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    objc_super v7 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
    id v8 = [NSString stringWithFormat:@"WFCollapsedActions-%@", v5];
    int64_t v9 = [v7 stringArrayForKey:v8];

    char v3 = [v9 containsObject:v6];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

@end