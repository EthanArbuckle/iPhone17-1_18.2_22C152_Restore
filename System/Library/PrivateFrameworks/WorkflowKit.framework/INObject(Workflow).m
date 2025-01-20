@interface INObject(Workflow)
- (void)wf_transformUsingCodableAttribute:()Workflow completionHandler:;
@end

@implementation INObject(Workflow)

- (void)wf_transformUsingCodableAttribute:()Workflow completionHandler:
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"INObject+Workflow.m", 19, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v9 = [a1 displayImage];
  if (v9)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__INObject_Workflow__wf_transformUsingCodableAttribute_completionHandler___block_invoke;
    v11[3] = &unk_1E6554E38;
    v11[4] = a1;
    id v12 = v8;
    objc_msgSend(v9, "wf_transformUsingCodableAttribute:completionHandler:", 0, v11);
  }
  else
  {
    (*((void (**)(id, void *))v8 + 2))(v8, a1);
  }
}

@end