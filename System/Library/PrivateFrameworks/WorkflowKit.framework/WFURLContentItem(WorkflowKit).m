@interface WFURLContentItem(WorkflowKit)
+ (id)allURLCoercionsInWorkflowKit;
@end

@implementation WFURLContentItem(WorkflowKit)

+ (id)allURLCoercionsInWorkflowKit
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  return v0;
}

@end