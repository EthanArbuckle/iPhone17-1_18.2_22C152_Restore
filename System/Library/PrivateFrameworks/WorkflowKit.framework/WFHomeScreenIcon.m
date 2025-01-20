@interface WFHomeScreenIcon
- (NSData)customImageData;
- (WFHomeScreenIcon)initWithWorkflowIcon:(id)a3 customImageData:(id)a4;
- (WFWorkflowIcon)workflowIcon;
@end

@implementation WFHomeScreenIcon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customImageData, 0);
  objc_storeStrong((id *)&self->_workflowIcon, 0);
}

- (NSData)customImageData
{
  return self->_customImageData;
}

- (WFWorkflowIcon)workflowIcon
{
  return self->_workflowIcon;
}

- (WFHomeScreenIcon)initWithWorkflowIcon:(id)a3 customImageData:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFHomeScreenIcon.m", 16, @"Invalid parameter not satisfying: %@", @"workflowIcon" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFHomeScreenIcon;
  v10 = [(WFHomeScreenIcon *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_workflowIcon, a3);
    objc_storeStrong((id *)&v11->_customImageData, a4);
    v12 = v11;
  }

  return v11;
}

@end