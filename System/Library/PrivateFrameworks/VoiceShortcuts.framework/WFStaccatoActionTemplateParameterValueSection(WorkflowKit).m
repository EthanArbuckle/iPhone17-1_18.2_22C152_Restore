@interface WFStaccatoActionTemplateParameterValueSection(WorkflowKit)
- (uint64_t)initWithSection:()WorkflowKit action:parameter:;
@end

@implementation WFStaccatoActionTemplateParameterValueSection(WorkflowKit)

- (uint64_t)initWithSection:()WorkflowKit action:parameter:
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [v10 items];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __95__WFStaccatoActionTemplateParameterValueSection_WorkflowKit__initWithSection_action_parameter___block_invoke;
  v24 = &unk_1E6541EC8;
  id v25 = v8;
  id v26 = v9;
  id v12 = v9;
  id v13 = v8;
  v14 = objc_msgSend(v11, "if_compactMap:", &v21);

  v15 = objc_msgSend(v10, "title", v21, v22, v23, v24);
  v16 = [v10 subtitle];
  v17 = [v10 image];

  v18 = objc_msgSend(v17, "wf_image");
  uint64_t v19 = [a1 initWithTitle:v15 subtitle:v16 image:v18 values:v14];

  return v19;
}

@end