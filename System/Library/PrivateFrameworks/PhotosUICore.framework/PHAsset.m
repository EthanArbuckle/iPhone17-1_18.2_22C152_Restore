@interface PHAsset
@end

@implementation PHAsset

void __36__PHAsset_PhotosUICore___ocrStrings__block_invoke()
{
  _ocrStrings_observationClass = (uint64_t)NSClassFromString(&cfstr_Vndocumentobse.isa);
  if (!_ocrStrings_observationClass && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v0 = 0;
    _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "VNDocumentObservation not available in current process", v0, 2u);
  }
}

void __47__PHAsset_PhotosUICore__px_curationDebugValues__block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)px_curationDebugValues_dateFormatter;
  px_curationDebugValues_dateFormatter = (uint64_t)v0;

  [(id)px_curationDebugValues_dateFormatter setDateFormat:@"yyyy.MM.dd HH:mm:ss.SS"];
  id v2 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [(id)px_curationDebugValues_dateFormatter setTimeZone:v2];
}

void __52__PHAsset_PhotosUICore__px_debugStringForValueList___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F28B18];
  id v4 = a2;
  id v10 = (id)[[v3 alloc] initWithString:@"––––––––––––––––––––––––––––\n" attributes:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) appendAttributedString:v10];
  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  v6 = NSString;
  v7 = [v4 uppercaseString];

  v8 = [v6 stringWithFormat:@"%@\n", v7];
  v9 = (void *)[v5 initWithString:v8 attributes:*(void *)(a1 + 48)];

  [*(id *)(a1 + 40) appendAttributedString:v9];
}

void __52__PHAsset_PhotosUICore__px_debugStringForValueList___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F28B18];
  id v4 = a2;
  id v5 = [v3 alloc];
  if (v4) {
    v6 = v4;
  }
  else {
    v6 = @"??";
  }
  id v8 = (id)[v5 initWithString:v6 attributes:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) appendAttributedString:v8];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" : " attributes:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) appendAttributedString:v7];
}

void __77__PHAsset_PhotosUICore__px_generateResourceFilesForAssets_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) checkResourceIsReachableAndReturnError:0]) {
    [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
  }
  id v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

uint64_t __77__PHAsset_PhotosUICore__px_generateResourceFilesForAssets_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __68__PHAsset_PhotosUICore__px_orderedAssetsFromAssets_sortDescriptors___block_invoke(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

void __62__PHAsset_PhotosUICoreAccessibility___faceNamesStringForAsset__block_invoke(uint64_t a1, void *a2)
{
}

void __49__PHAsset_PXSharingAdditions__px_isSupportedApp___block_invoke()
{
  id v0 = (void *)px_isSupportedApp__supportedOriginators;
  px_isSupportedApp__supportedOriginators = (uint64_t)&unk_1F02D54A0;
}

@end