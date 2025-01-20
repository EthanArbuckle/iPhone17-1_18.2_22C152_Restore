@interface WFContentItemRegistry(WorkflowKit)
+ (id)allContentItemClassesInWorkflowKit;
@end

@implementation WFContentItemRegistry(WorkflowKit)

+ (id)allContentItemClassesInWorkflowKit
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  return v0;
}

@end