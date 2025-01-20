@interface UISceneScheduleNonOpenInPlaceURLResolution
@end

@implementation UISceneScheduleNonOpenInPlaceURLResolution

void ___UISceneScheduleNonOpenInPlaceURLResolution_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) scene];

  if (!v2)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v8;
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Scene session does not have a scene: session: %@", buf, 0xCu);
      }
    }
    else
    {
      v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &audit_stringFileProvider_block_invoke___s_category) + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v6;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Scene session does not have a scene: session: %@", buf, 0xCu);
      }
    }
  }
  v3 = *(void **)(a1 + 40);
  v4 = [*(id *)(a1 + 32) scene];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___UISceneScheduleNonOpenInPlaceURLResolution_block_invoke_76;
  v9[3] = &unk_1E530BC80;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 32);
  _UIApplicationResolveURLUsingModalProgressControllerForNonOpenInPlaceBookmarkableString(v3, v4, v9);
}

void ___UISceneScheduleNonOpenInPlaceURLResolution_block_invoke_76(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = [[UIOpenURLContext alloc] initWithURL:v3 options:*(void *)(a1 + 32)];

  v4 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
  v5 = [*(id *)(a1 + 40) scene];
  _UISceneSendOpenURLActionCallbackForScene(v4, v5);
}

@end