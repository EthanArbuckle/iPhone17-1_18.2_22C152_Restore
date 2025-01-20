@interface NTKBundleIDToComplicationTypesMappingGizmo
@end

@implementation NTKBundleIDToComplicationTypesMappingGizmo

void ___NTKBundleIDToComplicationTypesMappingGizmo_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v9 = (id)[&unk_1F16E8B38 mutableCopy];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2A51E7B3-1B80-4981-9F09-F725BC3A8065"];
  int v4 = [v2 supportsCapability:v3];

  if (v4)
  {
    v5 = &unk_1F16EAC90;
    v6 = @"com.apple.Mind";
  }
  else
  {
    v5 = &unk_1F16EACA8;
    v6 = @"com.apple.DeepBreathing";
  }
  [v9 setObject:v5 forKeyedSubscript:v6];
  uint64_t v7 = [v9 copy];
  v8 = (void *)_NTKBundleIDToComplicationTypesMappingGizmo_bundleIDToComplicationTypesMapping;
  _NTKBundleIDToComplicationTypesMappingGizmo_bundleIDToComplicationTypesMapping = v7;
}

@end