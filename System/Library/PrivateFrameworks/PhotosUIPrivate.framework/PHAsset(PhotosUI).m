@interface PHAsset(PhotosUI)
+ (__CFString)pu_typeStringForMediaType:()PhotosUI;
+ (id)pu_typeStringForAssets:()PhotosUI;
+ (uint64_t)_pu_mediaTypeForAssets:()PhotosUI;
+ (uint64_t)pu_commonMediaTypeForPhotoCount:()PhotosUI videoCount:otherCount:;
@end

@implementation PHAsset(PhotosUI)

+ (__CFString)pu_typeStringForMediaType:()PhotosUI
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_1E5F222C8[a3];
  }
}

+ (uint64_t)_pu_mediaTypeForAssets:()PhotosUI
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v14;
    char v8 = 1;
LABEL_3:
    uint64_t v9 = 0;
    uint64_t v10 = v6;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "mediaType", (void)v13);
      uint64_t v6 = v11;
      if ((v8 & 1) == 0)
      {
        uint64_t v6 = v10;
        if (v11 != v10) {
          break;
        }
      }
      char v8 = 0;
      ++v9;
      uint64_t v10 = v6;
      if (v5 == v9)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        char v8 = 0;
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
  }
  uint64_t v6 = 0;
LABEL_12:

  return v6;
}

+ (uint64_t)pu_commonMediaTypeForPhotoCount:()PhotosUI videoCount:otherCount:
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || a4 == 0x7FFFFFFFFFFFFFFFLL || a5 != 0) {
    return 0;
  }
  if (a3 && !a4) {
    return 1;
  }
  if (a4) {
    BOOL v8 = a3 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8) {
    return 2;
  }
  else {
    return 0;
  }
}

+ (id)pu_typeStringForAssets:()PhotosUI
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "pu_typeStringForMediaType:", objc_msgSend(a1, "_pu_mediaTypeForAssets:", v4));
  uint64_t v6 = [v4 count];

  if (v6 != 1)
  {
    uint64_t v7 = [v5 stringByAppendingString:@"S"];

    uint64_t v5 = (void *)v7;
  }

  return v5;
}

@end