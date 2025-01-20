@interface UIFocusUpdateRequest
@end

@implementation UIFocusUpdateRequest

void __78___UIFocusUpdateRequest_requestByRedirectingRequestToNextContainerEnvironment__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  id v6 = [*(id *)(a1 + 32) environment];

  v7 = v9;
  if (v6 != v9)
  {
    int v8 = _UIFocusEnvironmentPrefersFocusContainment(v9);
    v7 = v9;
    if (v8)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      v7 = v9;
      *a3 = 1;
    }
  }
}

@end