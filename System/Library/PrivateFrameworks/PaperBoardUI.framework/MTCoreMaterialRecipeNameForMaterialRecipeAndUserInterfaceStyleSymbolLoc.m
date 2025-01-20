@interface MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc
@end

@implementation MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc

void *__get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MaterialKitLibraryCore_frameworkLibrary_0)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __MaterialKitLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E62B38D8;
    uint64_t v6 = 0;
    MaterialKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  v2 = (void *)MaterialKitLibraryCore_frameworkLibrary_0;
  if (!MaterialKitLibraryCore_frameworkLibrary_0) {
    __get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  result = dlsym(v2, "_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                                 + 24);
  return result;
}

void *__get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MaterialKitLibraryCore_frameworkLibrary_1)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __MaterialKitLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E62B3AD8;
    uint64_t v6 = 0;
    MaterialKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  v2 = (void *)MaterialKitLibraryCore_frameworkLibrary_1;
  if (!MaterialKitLibraryCore_frameworkLibrary_1) {
    __get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke_cold_1_0(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  result = dlsym(v2, "_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x1E4F28B00] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *MaterialKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBUIWallpaperEffectCompositor.m", 25, @"%s", *a1);

  __break(1u);
}

void __get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke_cold_1_0(void *a1)
{
  v2 = [MEMORY[0x1E4F28B00] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *MaterialKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBUIWallpaperView.m", 44, @"%s", *a1);

  __break(1u);
}

@end