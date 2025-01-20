@interface SearchUITLKImageConverter
+ (id)imageForSFImage:(id)a3;
+ (id)imagesForSFImages:(id)a3;
+ (unint64_t)tlkCornerRoundingStyleForSFCornerRoundingStyle:(int)a3;
+ (void)applySeachUIImage:(id)a3 toTLKImage:(id)a4;
@end

@implementation SearchUITLKImageConverter

+ (id)imagesForSFImages:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(a1, "imageForSFImage:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  return v12;
}

+ (id)imageForSFImage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[SearchUIImageCache cachedTlkImageForSFImage:v4];
    if (!v5)
    {
      id v6 = +[SearchUIImage imageWithSFImage:v4];
      id v5 = [[SearchUITLKImage alloc] initWithSearchUIImage:v6];
      [a1 applySeachUIImage:v6 toTLKImage:v5];
      +[SearchUIImageCache cacheTLKImage:v5 forSFImage:v4];
    }
    uint64_t v7 = [v4 badgingImage];
    uint64_t v8 = +[SearchUIImage imageWithSFImage:v7 variantForAppIcon:1];

    uint64_t v9 = [a1 imageForSFImage:v8];
    [(TLKImage *)v5 setBadgeImage:v9];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (void)applySeachUIImage:(id)a3 toTLKImage:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  [v6 size];
  objc_msgSend(v8, "setSize:");
  objc_msgSend(v8, "setIsTemplate:", objc_msgSend(v6, "isTemplate"));
  objc_msgSend(v8, "setCornerRoundingStyle:", objc_msgSend(a1, "tlkCornerRoundingStyleForSFCornerRoundingStyle:", objc_msgSend(v6, "cornerRoundingStyle")));
  uint64_t v7 = [v6 supportsFastPathShadow];

  [v8 setSupportsFastPathShadow:v7];
}

+ (unint64_t)tlkCornerRoundingStyleForSFCornerRoundingStyle:(int)a3
{
  uint64_t v3 = (a3 - 2);
  if (v3 < 3) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

@end