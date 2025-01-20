@interface WFStingWorkflow
@end

@implementation WFStingWorkflow

id __102__WFStingWorkflow_WorkflowReferenceConvertible__getObjectsFromReferences_databaseProvider_completion___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4FB49B8];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 identifier];
  v6 = [v3 name];
  uint64_t v7 = [v3 color];
  uint64_t v8 = [v3 glyphCharacter];
  v9 = [v3 associatedAppBundleIdentifier];

  v10 = (void *)[v4 initWithIdentifier:v5 name:v6 color:v7 glyphCharacter:v8 associatedAppBundleIdentifier:v9];
  return v10;
}

@end