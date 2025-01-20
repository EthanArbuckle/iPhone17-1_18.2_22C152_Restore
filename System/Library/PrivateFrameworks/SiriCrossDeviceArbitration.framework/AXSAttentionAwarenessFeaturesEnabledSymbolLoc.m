@interface AXSAttentionAwarenessFeaturesEnabledSymbolLoc
@end

@implementation AXSAttentionAwarenessFeaturesEnabledSymbolLoc

void *__get_AXSAttentionAwarenessFeaturesEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (void *)libAccessibilityLibraryCore_frameworkLibrary;
  uint64_t v11 = libAccessibilityLibraryCore_frameworkLibrary;
  if (!libAccessibilityLibraryCore_frameworkLibrary)
  {
    v5[1] = (void *)MEMORY[0x263EF8330];
    v5[2] = (void *)3221225472;
    v5[3] = __libAccessibilityLibraryCore_block_invoke;
    v5[4] = &unk_2654B7960;
    v6 = &v8;
    v7 = v5;
    long long v12 = xmmword_2654B7940;
    uint64_t v13 = 0;
    v9[3] = _sl_dlopen();
    libAccessibilityLibraryCore_frameworkLibrary = *(void *)(v6[1] + 24);
    v2 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  v3 = v5[0];
  if (!v2)
  {
    v3 = (void *)abort_report_np();
    __break(1u);
    goto LABEL_7;
  }
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  result = dlsym(v2, "_AXSAttentionAwarenessFeaturesEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_AXSAttentionAwarenessFeaturesEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end