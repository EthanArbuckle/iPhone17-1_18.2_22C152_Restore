@interface PILocalLightMapPrepareHDR
+ (id)customAttributes;
- (id)outputImage;
@end

@implementation PILocalLightMapPrepareHDR

+ (id)customAttributes
{
  v21[3] = *MEMORY[0x1E4F143B8];
  v20[0] = *MEMORY[0x1E4F1E0B8];
  uint64_t v2 = *MEMORY[0x1E4F1E1B8];
  v19[0] = *MEMORY[0x1E4F1E188];
  v19[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v21[0] = v3;
  v20[1] = @"inputLightMapWidth";
  uint64_t v5 = *MEMORY[0x1E4F1E098];
  v15[0] = *MEMORY[0x1E4F1E0D8];
  uint64_t v4 = v15[0];
  v15[1] = v5;
  v18[0] = &unk_1F000A618;
  v18[1] = &unk_1F000A618;
  uint64_t v7 = *MEMORY[0x1E4F1E118];
  uint64_t v8 = *MEMORY[0x1E4F1E090];
  uint64_t v16 = *MEMORY[0x1E4F1E0F0];
  uint64_t v6 = v16;
  uint64_t v17 = v8;
  v18[2] = v7;
  v18[3] = @"NSNumber";
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v15 count:4];
  v21[1] = v9;
  v20[2] = @"inputLightMapHeight";
  v13[0] = v4;
  v13[1] = v5;
  v14[0] = &unk_1F000A618;
  v14[1] = &unk_1F000A618;
  v13[2] = v6;
  v13[3] = v8;
  v14[2] = v7;
  v14[3] = @"NSNumber";
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  v21[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputGuideImage, 0);
  objc_storeStrong((id *)&self->inputLightMapHeight, 0);
  objc_storeStrong((id *)&self->inputLightMapWidth, 0);
  objc_storeStrong((id *)&self->inputLightMap, 0);
}

- (id)outputImage
{
  inputLightMap = self->inputLightMap;
  if (inputLightMap)
  {
    uint64_t v4 = _lightMapImageFromData(inputLightMap, self->inputLightMapWidth, self->inputLightMapHeight);
    uint64_t v5 = v4;
    inputGuideImage = self->inputGuideImage;
    if (inputGuideImage)
    {
      uint64_t v7 = _scaledLightMapImage(v4, inputGuideImage);

      uint64_t v5 = (void *)v7;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

@end