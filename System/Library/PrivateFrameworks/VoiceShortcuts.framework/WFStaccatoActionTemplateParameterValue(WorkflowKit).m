@interface WFStaccatoActionTemplateParameterValue(WorkflowKit)
- (id)initWithAction:()WorkflowKit state:parameter:;
@end

@implementation WFStaccatoActionTemplateParameterValue(WorkflowKit)

- (id)initWithAction:()WorkflowKit state:parameter:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"WFStaccatoActionTemplate_WorkflowKit.m", 106, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, a1, @"WFStaccatoActionTemplate_WorkflowKit.m", 107, @"Invalid parameter not satisfying: %@", @"parameter" object file lineNumber description];

LABEL_3:
  v29.receiver = a1;
  v29.super_class = (Class)&off_1F2291E18;
  id v13 = objc_msgSendSuper2(&v29, sel_init);
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v10;
      if (v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
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
      id v19 = v15;

      v18 = [v19 value];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v18 = 0;
LABEL_20:
        v22 = [v12 localizedLabelForPossibleState:v10];
        v23 = [v12 localizedSubtitleLabelForPossibleState:v10];
        v24 = [v12 accessoryImageForPossibleState:v10];
        v25 = [v10 serializedRepresentation];
        id v13 = (id)[v13 initWithIdentifier:v18 localizedTitle:v22 localizedSubtitle:v23 image:v24 serializedState:v25];

        goto LABEL_21;
      }
      id v16 = v10;
      if (v16)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v17 = v16;
        }
        else {
          v17 = 0;
        }
      }
      else
      {
        v17 = 0;
      }
      id v20 = v17;

      id v19 = [v20 value];

      v21 = [v19 value];
      v18 = WFSerializedIdentifierFromLinkValue();
    }
    goto LABEL_20;
  }
LABEL_21:

  return v13;
}

@end