@interface SBXXGetIconPNGData
@end

@implementation SBXXGetIconPNGData

void ___SBXXGetIconPNGData_block_invoke(uint64_t a1)
{
  id v13 = +[SBIconController sharedInstance];
  v2 = [v13 iconManager];
  v3 = [v13 model];
  v4 = [v3 leafIconForIdentifier:*(void *)(a1 + 32)];
  v5 = [v2 iconImageCache];
  v6 = [MEMORY[0x1E4FA6298] lightAppearance];
  uint64_t v7 = [v5 imageForIcon:v4 imageAppearance:v6 options:0];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v10 = [v5 genericImage];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

@end