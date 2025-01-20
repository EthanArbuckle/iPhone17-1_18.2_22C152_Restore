@interface UIImage(STImageAdditions)
+ (id)blankIcon;
+ (id)blankSpaceImageWithSize:()STImageAdditions;
+ (id)iconWithAppBundleID:()STImageAdditions;
+ (uint64_t)iconWithAppURL:()STImageAdditions;
- (id)iconFromPrecomposedImage:()STImageAdditions platform:;
@end

@implementation UIImage(STImageAdditions)

- (id)iconFromPrecomposedImage:()STImageAdditions platform:
{
  v23[1] = *MEMORY[0x263EF8340];
  switch(a4)
  {
    case 0:
    case 2:
      uint64_t v4 = [a1 _applicationIconImageForFormat:0 precomposed:a3];
      goto LABEL_4;
    case 1:
    case 3:
      uint64_t v4 = objc_msgSend(a1, "imageByPreparingThumbnailOfSize:", 29.0, 29.0);
LABEL_4:
      v5 = (void *)v4;
      break;
    case 4:
      id v6 = a1;
      uint64_t v7 = [v6 CGImage];
      if (v7)
      {
        uint64_t v8 = v7;
        v9 = [v6 traitCollection];
        [v9 displayScale];
        double v11 = v10;

        v12 = (void *)[objc_alloc(MEMORY[0x263F4B528]) initWithCGImage:v8 scale:v11];
        id v13 = objc_alloc(MEMORY[0x263F4B540]);
        v23[0] = v12;
        v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
        v15 = (void *)[v13 initWithImages:v14];

        v16 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", 29.0, 29.0, v11);
        [v16 setShape:2];
        v22 = v16;
        v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
        [v15 prepareImagesForImageDescriptors:v17];

        uint64_t v18 = [v15 CGImageForDescriptor:v16];
        v19 = [MEMORY[0x263F1C6B0] imageWithCGImage:v18];
      }
      else
      {
        v19 = 0;
      }
      if (v19) {
        v20 = v19;
      }
      else {
        v20 = v6;
      }
      v5 = objc_msgSend(v20, "imageByPreparingThumbnailOfSize:", 29.0, 29.0);

      break;
    default:
      v5 = 0;
      break;
  }

  return v5;
}

+ (id)iconWithAppBundleID:()STImageAdditions
{
  uint64_t v4 = (void *)MEMORY[0x263F1C920];
  id v5 = a3;
  id v6 = [v4 mainScreen];
  [v6 scale];
  uint64_t v7 = objc_msgSend(a1, "_applicationIconImageForBundleIdentifier:format:scale:", v5, 0);

  return v7;
}

+ (uint64_t)iconWithAppURL:()STImageAdditions
{
  return 0;
}

+ (id)blankIcon
{
  v6[1] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F4B540] genericApplicationIcon];
  v1 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", 29.0, 29.0, 2.0);
  v6[0] = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v0 prepareImagesForImageDescriptors:v2];

  uint64_t v3 = [v0 CGImageForDescriptor:v1];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v3 scale:0 orientation:2.0];

  return v4;
}

+ (id)blankSpaceImageWithSize:()STImageAdditions
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:", a1, a2);
  uint64_t v3 = [v2 imageWithActions:&__block_literal_global_2];

  return v3;
}

@end