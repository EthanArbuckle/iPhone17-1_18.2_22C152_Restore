@interface WFStaccatoActionTemplateParameter(WorkflowKit)
- (id)initWithLinkAction:()WorkflowKit parameter:;
@end

@implementation WFStaccatoActionTemplateParameter(WorkflowKit)

- (id)initWithLinkAction:()WorkflowKit parameter:
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"WFStaccatoActionTemplate_WorkflowKit.m", 83, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, a1, @"WFStaccatoActionTemplate_WorkflowKit.m", 84, @"Invalid parameter not satisfying: %@", @"parameter" object file lineNumber description];

LABEL_3:
  v21.receiver = a1;
  v21.super_class = (Class)&off_1F2291A70;
  id v10 = objc_msgSendSuper2(&v21, sel_init);
  if (v10)
  {
    v11 = [v9 key];
    v12 = [v7 parameterStateForKey:v11];

    if (v12) {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4FB4990]) initWithAction:v7 state:v12 parameter:v9];
    }
    else {
      v13 = 0;
    }
    v14 = [v9 key];
    v15 = [v7 identifier];
    v16 = [v9 localizedLabel];
    v17 = [v9 localizedDescription];
    id v10 = (id)[v10 initWithKey:v14 actionIdentifier:v15 localizedLabel:v16 localizedDescription:v17 defaultValue:v13];
  }
  return v10;
}

@end