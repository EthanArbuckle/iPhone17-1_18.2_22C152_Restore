@interface UIImage(WorkflowEditor)
+ (id)wf_workflowEditorImageNamed:()WorkflowEditor;
@end

@implementation UIImage(WorkflowEditor)

+ (id)wf_workflowEditorImageNamed:()WorkflowEditor
{
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [a1 imageNamed:v5 inBundle:v6 compatibleWithTraitCollection:0];

  return v7;
}

@end