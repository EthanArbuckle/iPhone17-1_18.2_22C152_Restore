@interface WBSSetStartPageWallpaperImage
@end

@implementation WBSSetStartPageWallpaperImage

void ___WBSSetStartPageWallpaperImage_block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  double v9 = 0.0;
  uint64_t v10 = 0;
  v3 = objc_msgSend(*(id *)(a1 + 32), "analyzeImageAndThresholdIfNecessary:thumbnail:precomputedLuminance:getAppearance:luminance:", objc_msgSend(*(id *)(a1 + 40), "CGImage"), 0, &v10, &v9, 0.0);
  v4 = *(void **)(a1 + 32);
  uint64_t v11 = *MEMORY[0x1E4F2FCA0];
  v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v7 = [v4 normalizeImage:v3 properties:v6];
  v8 = [v4 assignImage:v7 oldImage:v3];

  [*(id *)(a1 + 32) _commitImage:v8 appearanceName:v10 luminance:&stru_1F031A860 forIdentifier:0 isGeneratedImage:0 withinProfile:0 completionHandler:v9];
}

@end