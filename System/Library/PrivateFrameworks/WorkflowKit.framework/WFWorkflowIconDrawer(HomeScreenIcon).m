@interface WFWorkflowIconDrawer(HomeScreenIcon)
- (void)initWithHomeScreenIcon:()HomeScreenIcon;
@end

@implementation WFWorkflowIconDrawer(HomeScreenIcon)

- (void)initWithHomeScreenIcon:()HomeScreenIcon
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"WFWorkflowIconDrawer+HomeScreenIcon.m", 17, @"Invalid parameter not satisfying: %@", @"icon" object file lineNumber description];
  }
  v6 = [v5 workflowIcon];
  v7 = (void *)[a1 initWithIcon:v6];

  if (v7)
  {
    v8 = [v5 customImageData];
    if (v8)
    {
      [v7 setCustomImageData:v8];
      [v7 setUseCustomImage:1];
    }
    id v9 = v7;
  }
  return v7;
}

@end