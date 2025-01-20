@interface NSObject
@end

@implementation NSObject

void __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a1[6], a1[4], @"NSObject+WFCodableAttributeTransformable.m", 21, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  if ([v5 conformsToProtocol:&unk_1F2373FB8])
  {
    uint64_t v7 = a1[5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_2;
    v9[3] = &unk_1E65568F0;
    id v10 = v6;
    objc_msgSend(v5, "wf_transformUsingCodableAttribute:completionHandler:", v7, v9);
  }
  else
  {
    (*((void (**)(id, id))v6 + 2))(v6, v5);
  }
}

void __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 conformsToProtocol:&unk_1F2373FB8])
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_4;
    v8[3] = &unk_1E6556940;
    id v10 = v6;
    id v9 = v5;
    (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v9, v8);
  }
  else
  {
    (*((void (**)(id, id, void))v6 + 2))(v6, v5, 0);
  }
}

uint64_t __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 conformsToProtocol:&unk_1F2373FB8])
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_7;
    v9[3] = &unk_1E6556940;
    id v11 = v7;
    id v10 = v6;
    (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v10, v9);
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

uint64_t __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (!a2) {
    a2 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, a2, 0);
}

uint64_t __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (!a2) {
    a2 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, a2, 0);
}

uint64_t __84__NSObject_WFTransformable__wf_transformValueForCodableAttribute_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end