@interface UIImage(WorkflowUI)
+ (id)wf_workflowUIImageNamed:()WorkflowUI;
- (id)wf_insetImageWithInsets:()WorkflowUI;
@end

@implementation UIImage(WorkflowUI)

- (id)wf_insetImageWithInsets:()WorkflowUI
{
  [a1 size];
  double v11 = v10;
  [a1 size];
  v18.width = a5 + a3 + v11;
  v18.height = a4 + a2 + v12;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  UIGraphicsPushContext(CurrentContext);
  objc_msgSend(a1, "drawAtPoint:", a3, a2);
  UIGraphicsPopContext();
  v14 = UIGraphicsGetImageFromCurrentImageContext();
  v15 = objc_msgSend(v14, "imageWithRenderingMode:", objc_msgSend(a1, "renderingMode"));

  UIGraphicsEndImageContext();
  return v15;
}

+ (id)wf_workflowUIImageNamed:()WorkflowUI
{
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [a1 imageNamed:v5 inBundle:v6 compatibleWithTraitCollection:0];

  return v7;
}

@end