@interface WFWorkflowParameterStateDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (unint64_t)storageBehaviorForPropertyWithKey:(id)a3;
- (BOOL)isSelf;
- (NSString)cachedDisplayName;
- (NSString)workflowIdentifier;
- (NSString)workflowName;
- (WFWorkflowParameterStateDescriptor)initWithWorkflowName:(id)a3 workflowIdentifier:(id)a4 isSelf:(BOOL)a5;
- (WFWorkflowParameterStateDescriptor)initWithWorkflowReference:(id)a3 isSelf:(BOOL)a4;
- (id)displayNameWithDatabase:(id)a3 containingWorkflow:(id)a4;
- (id)matchingWorkflowInDatabase:(id)a3 containingWorkflow:(id)a4;
@end

@implementation WFWorkflowParameterStateDescriptor

+ (unint64_t)storageBehaviorForPropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"cachedDisplayName"])
  {
    id v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFWorkflowParameterStateDescriptor;
    id v5 = objc_msgSendSuper2(&v7, sel_storageBehaviorForPropertyWithKey_, v4);
  }

  return (unint64_t)v5;
}

+ (id)JSONKeyPathsByPropertyKey
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "mtl_identityPropertyMapWithModel:", a1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDisplayName, 0);
  objc_storeStrong((id *)&self->_workflowIdentifier, 0);
  objc_storeStrong((id *)&self->_workflowName, 0);
}

- (NSString)cachedDisplayName
{
  return self->_cachedDisplayName;
}

- (BOOL)isSelf
{
  return self->_isSelf;
}

- (NSString)workflowIdentifier
{
  return self->_workflowIdentifier;
}

- (NSString)workflowName
{
  return self->_workflowName;
}

- (id)matchingWorkflowInDatabase:(id)a3 containingWorkflow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(WFWorkflowParameterStateDescriptor *)self isSelf];
  if (v7 && v8)
  {
    id v9 = v7;
  }
  else
  {
    v10 = [(WFWorkflowParameterStateDescriptor *)self workflowIdentifier];
    if (!v10
      || ([v6 referenceForWorkflowID:v10], (id v9 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v11 = [(WFWorkflowParameterStateDescriptor *)self workflowName];
      id v9 = [v6 uniqueVisibleReferenceForWorkflowName:v11];
    }
  }

  return v9;
}

- (id)displayNameWithDatabase:(id)a3 containingWorkflow:(id)a4
{
  cachedDisplayName = self->_cachedDisplayName;
  if (!cachedDisplayName)
  {
    id v6 = [(WFWorkflowParameterStateDescriptor *)self matchingWorkflowInDatabase:a3 containingWorkflow:a4];
    id v7 = v6;
    if (v6) {
      [v6 name];
    }
    else {
    BOOL v8 = [(WFWorkflowParameterStateDescriptor *)self workflowName];
    }
    id v9 = (NSString *)[v8 copy];
    v10 = self->_cachedDisplayName;
    self->_cachedDisplayName = v9;

    cachedDisplayName = self->_cachedDisplayName;
  }
  return cachedDisplayName;
}

- (WFWorkflowParameterStateDescriptor)initWithWorkflowReference:(id)a3 isSelf:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFWorkflowParameterState.m", 54, @"Invalid parameter not satisfying: %@", @"workflowReference" object file lineNumber description];
  }
  BOOL v8 = [v7 name];
  id v9 = [v7 identifier];
  v10 = [(WFWorkflowParameterStateDescriptor *)self initWithWorkflowName:v8 workflowIdentifier:v9 isSelf:v4];

  if (v10)
  {
    v11 = [(WFWorkflowParameterStateDescriptor *)v10 workflowName];
    uint64_t v12 = [v11 copy];
    cachedDisplayName = v10->_cachedDisplayName;
    v10->_cachedDisplayName = (NSString *)v12;

    v14 = v10;
  }

  return v10;
}

- (WFWorkflowParameterStateDescriptor)initWithWorkflowName:(id)a3 workflowIdentifier:(id)a4 isSelf:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFWorkflowParameterState.m", 41, @"Invalid parameter not satisfying: %@", @"workflowName" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)WFWorkflowParameterStateDescriptor;
  v11 = [(MTLModel *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    workflowName = v11->_workflowName;
    v11->_workflowName = (NSString *)v12;

    uint64_t v14 = [v10 copy];
    workflowIdentifier = v11->_workflowIdentifier;
    v11->_workflowIdentifier = (NSString *)v14;

    v11->_isSelf = a5;
    v16 = v11;
  }

  return v11;
}

@end