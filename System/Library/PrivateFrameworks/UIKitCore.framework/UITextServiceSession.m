@interface UITextServiceSession
@end

@implementation UITextServiceSession

void __56___UITextServiceSession_showServiceForType_withContext___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v1 = (void *)_MergedGlobals_1276;
  _MergedGlobals_1276 = (uint64_t)v0;
}

uint64_t __56___UITextServiceSession_showServiceForType_withContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endSession];
}

uint64_t __56___UITextServiceSession_showServiceForType_withContext___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endSession];
}

void __56___UITextServiceSession_showServiceForType_withContext___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained dismissCompletionHandler];

  if (v3) {
    v3[2]();
  }
  [*(id *)(a1 + 32) _endSession];
}

uint64_t __56___UITextServiceSession_showServiceForType_withContext___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endSession];
}

void __56___UITextServiceSession_showServiceForType_withContext___block_invoke_6(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = [v4 string];

  [WeakRetained replaceRange:v5 withText:v6];
}

void __56___UITextServiceSession_showServiceForType_withContext___block_invoke_7(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = [v4 string];

  [WeakRetained replaceSelectedText:v5 withText:v6];
}

void __56___UITextServiceSession_showServiceForType_withContext___block_invoke_8(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = [v4 string];

  [WeakRetained replaceText:v5 withText:v6];
}

void __56___UITextServiceSession_showServiceForType_withContext___block_invoke_9(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = [v4 string];

  [WeakRetained replaceText:v5 withText:v6];
}

uint64_t __56___UITextServiceSession_showServiceForType_withContext___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endSession];
}

@end