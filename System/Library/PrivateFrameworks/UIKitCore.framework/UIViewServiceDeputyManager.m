@interface UIViewServiceDeputyManager
@end

@implementation UIViewServiceDeputyManager

void __52___UIViewServiceDeputyManager__objc_initiateDealloc__block_invoke(uint64_t a1)
{
}

uint64_t __35___UIViewServiceDeputyManager_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _invalidateUnconditionallyThen:a2];
}

uint64_t __62___UIViewServiceDeputyManager__invalidateUnconditionallyThen___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "count") + 1);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = *(void **)(*(void *)(a1 + 40) + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "invalidate"));
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62___UIViewServiceDeputyManager__invalidateUnconditionallyThen___block_invoke_2;
  v9[3] = &unk_1E530DB88;
  long long v10 = *(_OWORD *)(a1 + 32);
  return +[_UIAsyncInvocationObserver whenInvocationsCompleteForObservers:v2 do:v9];
}

void __62___UIViewServiceDeputyManager__invalidateUnconditionallyThen___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(NSObject **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62___UIViewServiceDeputyManager__invalidateUnconditionallyThen___block_invoke_3;
  v3[3] = &unk_1E530DB88;
  v3[4] = *(void *)(a1 + 32);
  v3[5] = v1;
  dispatch_async(v2, v3);
}

uint64_t __62___UIViewServiceDeputyManager__invalidateUnconditionallyThen___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 40) + 40) removeAllObjects];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

uint64_t __94___UIViewServiceDeputyManager___requestConnectionToDeputyOfClass_fromHostObject_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:NSStringFromClass(*(Class *)(a1 + 40))];
  if (v2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __94___UIViewServiceDeputyManager___requestConnectionToDeputyOfClass_fromHostObject_replyHandler___block_invoke_2;
    v9[3] = &unk_1E530DFC0;
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    long long v10 = *(_OWORD *)(a1 + 32);
    return (*(uint64_t (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v9);
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 64));
    v7 = NSStringFromClass(*(Class *)(a1 + 40));
    NSLog(&cfstr_ReceivedReques_0.isa, v5, v6, v7);
    v8 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v8();
  }
}

void __94___UIViewServiceDeputyManager___requestConnectionToDeputyOfClass_fromHostObject_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  uint64_t v2 = *(void *)(a1 + 48);
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v5[1] = 3221225472;
  v5[2] = __94___UIViewServiceDeputyManager___requestConnectionToDeputyOfClass_fromHostObject_replyHandler___block_invoke_3;
  v5[3] = &unk_1E530DF98;
  v5[4] = a2;
  uint64_t v7 = v2;
  long long v6 = v3;
  dispatch_async(v4, v5);
}

uint64_t __94___UIViewServiceDeputyManager___requestConnectionToDeputyOfClass_fromHostObject_replyHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "checkDeputyForRotation:");
    [*(id *)(*(void *)(a1 + 40) + 40) addObject:*(void *)(a1 + 32)];
  }
  uint64_t v2 = *(void *)(a1 + 56);
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "XPCInterface"), "exportedInterface")) {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __73___UIViewServiceDeputyManager_registerDeputyClass_withConnectionHandler___block_invoke(uint64_t a1, NSString *aClassName)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSClassFromString(aClassName) XPCInterface];
  return [v2 addObject:v3];
}

uint64_t __53___UIViewServiceDeputyManager_unregisterDeputyClass___block_invoke(uint64_t a1, NSString *aClassName)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSClassFromString(aClassName) XPCInterface];
  return [v2 addObject:v3];
}

uint64_t __92___UIViewServiceDeputyManager_viewControllerOperator_didCreateServiceViewControllerOfClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) unregisterDeputyClass:*(void *)(a1 + 40)];
  long long v6 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92___UIViewServiceDeputyManager_viewControllerOperator_didCreateServiceViewControllerOfClass___block_invoke_2;
  v8[3] = &unk_1E530E060;
  v8[4] = *(void *)(a1 + 32);
  v8[5] = a3;
  return [v6 establishViewControllerDeputyWithProxy:a2 completionHandler:v8];
}

void __92___UIViewServiceDeputyManager_viewControllerOperator_didCreateServiceViewControllerOfClass___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = __Block_byref_object_copy__229;
  v6[4] = __Block_byref_object_dispose__229;
  v6[5] = a2;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_opt_class();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92___UIViewServiceDeputyManager_viewControllerOperator_didCreateServiceViewControllerOfClass___block_invoke_80;
  v5[3] = &unk_1E530E038;
  v5[4] = *(void *)(a1 + 32);
  void v5[5] = v6;
  [v3 registerDeputyClass:v4 withConnectionHandler:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_object_dispose(v6, 8);
}

uint64_t __92___UIViewServiceDeputyManager_viewControllerOperator_didCreateServiceViewControllerOfClass___block_invoke_80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) unregisterDeputyClass:objc_opt_class()];
  id v5 = +[_UIViewControllerControlMessageDeputy proxyWithTarget:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  long long v6 = *(uint64_t (**)(uint64_t, id))(a3 + 16);
  return v6(a3, v5);
}

@end