@interface NSObject(WFTransformable)
- (void)wf_transformValueForCodableAttribute:()WFTransformable completionHandler:;
@end

@implementation NSObject(WFTransformable)

- (void)wf_transformValueForCodableAttribute:()WFTransformable completionHandler:
{
  id v7 = a3;
  id v8 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6556918;
  uint64_t v27 = a2;
  aBlock[4] = a1;
  id v9 = v7;
  id v26 = v9;
  v10 = _Block_copy(aBlock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_opt_class();
    v12 = WFEnforceClass(a1, v11);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_3;
    v23[3] = &unk_1E6556968;
    id v24 = v10;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_5;
    v21[3] = &unk_1E6557340;
    id v22 = v8;
    objc_msgSend(v12, "wf_mapAsynchronously:completionHandler:", v23, v21);

    v13 = v24;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_9;
      v15[3] = &unk_1E65568F0;
      id v16 = v8;
      (*((void (**)(void *, void *, void *))v10 + 2))(v10, a1, v15);
      v12 = v16;
      goto LABEL_7;
    }
    uint64_t v14 = objc_opt_class();
    v12 = WFEnforceClass(a1, v14);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_6;
    v19[3] = &unk_1E6558018;
    id v20 = v10;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_8;
    v17[3] = &unk_1E65586C8;
    id v18 = v8;
    objc_msgSend(v12, "if_mapAsynchronously:completionHandler:", v19, v17);

    v13 = v20;
  }

LABEL_7:
}

@end