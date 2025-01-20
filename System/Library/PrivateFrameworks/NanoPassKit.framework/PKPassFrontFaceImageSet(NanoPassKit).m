@interface PKPassFrontFaceImageSet(NanoPassKit)
+ (BOOL)_containsAssetForImageName:()NanoPassKit fromBundle:;
+ (id)_assetNamesForAssetOption:()NanoPassKit;
+ (id)_bundleForPass:()NanoPassKit;
+ (uint64_t)isDrawnUsingAssetOptions:()NanoPassKit forPass:;
+ (uint64_t)isDrawnUsingAssetOptions:()NanoPassKit fromBundle:;
- (void)memoryMapImageData;
@end

@implementation PKPassFrontFaceImageSet(NanoPassKit)

- (void)memoryMapImageData
{
  v2 = (void *)MEMORY[0x223C37110]();
  v3 = [a1 faceImage];
  v4 = [v3 npkImageByMemoryMappingDataWithTemporaryFilePrefix:@"npkFrontFaceImage-faceImage"];
  [a1 setFaceImage:v4];

  v5 = [a1 faceShadowImage];
  v6 = [v5 npkImageByMemoryMappingDataWithTemporaryFilePrefix:@"npkFrontFaceImage-faceShadowImage"];
  [a1 setFaceShadowImage:v6];
}

+ (uint64_t)isDrawnUsingAssetOptions:()NanoPassKit forPass:
{
  v6 = [a1 _bundleForPass:a4];
  uint64_t v7 = [a1 isDrawnUsingAssetOptions:a3 fromBundle:v6];

  return v7;
}

+ (uint64_t)isDrawnUsingAssetOptions:()NanoPassKit fromBundle:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [a1 _assetNamesForAssetOption:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!objc_msgSend(a1, "_containsAssetForImageName:fromBundle:", *(void *)(*((void *)&v14 + 1) + 8 * v11), v6, (void)v14))
        {
          uint64_t v12 = 0;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 1;
LABEL_11:

  return v12;
}

+ (id)_bundleForPass:()NanoPassKit
{
  if (a3)
  {
    v3 = NPKURLForPass(a3);
    v4 = [MEMORY[0x263F086E0] bundleWithURL:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)_containsAssetForImageName:()NanoPassKit fromBundle:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 URLForResource:v5 withExtension:@"pdf"];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263F5BED8] URLForImageNamed:v5 inBundle:v6 scale:0];
  }
  uint64_t v10 = v9;

  return v10 != 0;
}

+ (id)_assetNamesForAssetOption:()NanoPassKit
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = v4;
  if (a3)
  {
    [v4 addObject:*MEMORY[0x263F5C5D8]];
    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:*MEMORY[0x263F5C5E8]];
  if ((a3 & 4) != 0) {
LABEL_4:
  }
    [v5 addObject:*MEMORY[0x263F5C5D0]];
LABEL_5:
  id v6 = (void *)[v5 copy];

  return v6;
}

@end