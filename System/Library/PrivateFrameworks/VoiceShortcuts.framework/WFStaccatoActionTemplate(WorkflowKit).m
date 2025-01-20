@interface WFStaccatoActionTemplate(WorkflowKit)
- (id)initWithIdentifier:()WorkflowKit sectionIdentifier:linkAction:;
@end

@implementation WFStaccatoActionTemplate(WorkflowKit)

- (id)initWithIdentifier:()WorkflowKit sectionIdentifier:linkAction:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_19:
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"WFStaccatoActionTemplate_WorkflowKit.m", 30, @"Invalid parameter not satisfying: %@", @"sectionIdentifier" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_20;
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, a1, @"WFStaccatoActionTemplate_WorkflowKit.m", 29, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

  if (!v10) {
    goto LABEL_19;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_20:
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, a1, @"WFStaccatoActionTemplate_WorkflowKit.m", 31, @"Invalid parameter not satisfying: %@", @"linkAction" object file lineNumber description];

LABEL_4:
  v33.receiver = a1;
  v33.super_class = (Class)&off_1F22916D0;
  id v12 = objc_msgSendSuper2(&v33, sel_init);
  if (v12)
  {
    id v13 = v11;
    v14 = v13;
    if (v11)
    {
      if ([v13 conformsToProtocol:&unk_1F229C748]) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
    id v16 = v15;

    if (objc_opt_respondsToSelector())
    {
      id v17 = [v16 hiddenParameterKeysForStaccato];
    }
    else
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    v18 = v17;
    v19 = [v14 parameters];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __89__WFStaccatoActionTemplate_WorkflowKit__initWithIdentifier_sectionIdentifier_linkAction___block_invoke;
    v30[3] = &unk_1E6541EA0;
    id v20 = v18;
    id v31 = v20;
    id v21 = v14;
    id v32 = v21;
    v22 = objc_msgSend(v19, "if_compactMap:", v30);

    if (objc_opt_respondsToSelector()) {
      [v16 staccatoNameOverride];
    }
    else {
    v23 = [v21 localizedName];
    }
    v24 = [v21 identifier];
    v25 = [v21 localizedDescriptionSummary];
    id v12 = (id)[v12 initWithIdentifier:v9 sectionIdentifier:v10 actionIdentifier:v24 localizedTitle:v23 localizedDescription:v25 parameters:v22];
  }
  return v12;
}

@end