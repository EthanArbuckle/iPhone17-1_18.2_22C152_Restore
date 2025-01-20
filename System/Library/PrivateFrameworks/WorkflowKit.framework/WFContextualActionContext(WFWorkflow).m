@interface WFContextualActionContext(WFWorkflow)
+ (id)contextForEditingWorkflow:()WFWorkflow inSurface:;
@end

@implementation WFContextualActionContext(WFWorkflow)

+ (id)contextForEditingWorkflow:()WFWorkflow inSurface:
{
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"WFContextualActionContext+WFWorkflow.m", 17, @"Invalid parameter not satisfying: %@", @"workflow" object file lineNumber description];
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FB4648]) initWithSurface:a4];
  v9 = [v7 actions];
  v10 = [v9 valueForKey:@"identifier"];
  [v8 setHistoricalActionIdentifiers:v10];

  return v8;
}

@end