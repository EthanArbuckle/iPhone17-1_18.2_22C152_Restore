@interface LNDeferredLocalizedString
@end

@implementation LNDeferredLocalizedString

void __82__LNDeferredLocalizedString_Workflow__wf_getLocalizedStringWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v7 = [a2 print];
  v6 = [v7 firstObject];
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v6, v5);
}

@end