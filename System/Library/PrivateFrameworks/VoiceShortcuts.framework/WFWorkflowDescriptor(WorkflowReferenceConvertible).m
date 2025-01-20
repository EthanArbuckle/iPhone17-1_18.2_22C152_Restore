@interface WFWorkflowDescriptor(WorkflowReferenceConvertible)
+ (void)getObjectsFromReferences:()WorkflowReferenceConvertible databaseProvider:completion:;
@end

@implementation WFWorkflowDescriptor(WorkflowReferenceConvertible)

+ (void)getObjectsFromReferences:()WorkflowReferenceConvertible databaseProvider:completion:
{
  v6 = a5;
  objc_msgSend(a3, "if_map:", &__block_literal_global_686);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, 0);
}

@end