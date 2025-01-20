@interface _ICQUIHelperFunctions
+ (double)highestScreenScale;
+ (id)appIconWithSize:(CGSize)a3 forBundleID:(id)a4;
+ (id)appIconWithSize:(CGSize)a3 forBundleID:(id)a4 drawBorder:(BOOL)a5;
+ (id)scaledImageURL:(id)a3;
+ (int64_t)purchaseTypeForQueryParams:(id)a3;
+ (void)addHeadersForRequest:(id)a3 completion:(id)a4;
@end

@implementation _ICQUIHelperFunctions

+ (id)scaledImageURL:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 scale];
  int v6 = (int)v5;

  if (v6 < 3)
  {
    if (v6 == 2) {
      [v3 URL2x];
    }
    else {
    uint64_t v7 = [v3 URL1x];
    }
  }
  else
  {
    uint64_t v7 = [v3 URL3x];
  }
  v8 = (void *)v7;

  return v8;
}

+ (int64_t)purchaseTypeForQueryParams:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 1;
  }
  id v3 = objc_msgSend(@"icq.icloud.com?", "stringByAppendingString:");
  v4 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithString:v3];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v5 = [v4 queryItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v19 = v4;
    v20 = v3;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "name", v19, v20);
        if ([v11 isEqualToString:@"framework"])
        {
          v12 = [v10 value];
          char v13 = [v12 isEqualToString:@"dynamicUI"];

          if (v13)
          {
            v4 = v19;
            id v3 = v20;
            int64_t v17 = 2;
            goto LABEL_21;
          }
        }
        else
        {
        }
        v14 = [v10 name];
        if ([v14 isEqualToString:@"deviceOffers"])
        {
          v15 = [v10 value];
          char v16 = [v15 isEqualToString:@"true"];

          if (v16)
          {
            int64_t v17 = 0;
            goto LABEL_20;
          }
        }
        else
        {
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
    int64_t v17 = 1;
LABEL_20:
    v4 = v19;
    id v3 = v20;
  }
  else
  {
    int64_t v17 = 1;
  }
LABEL_21:

  return v17;
}

+ (void)addHeadersForRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  int64_t v17 = &v16;
  uint64_t v18 = 0x2050000000;
  uint64_t v7 = (void *)getINDaemonConnectionClass_softClass_0;
  uint64_t v19 = getINDaemonConnectionClass_softClass_0;
  if (!getINDaemonConnectionClass_softClass_0)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __getINDaemonConnectionClass_block_invoke_0;
    v15[3] = &unk_264921E58;
    v15[4] = &v16;
    __getINDaemonConnectionClass_block_invoke_0((uint64_t)v15);
    uint64_t v7 = (void *)v17[3];
  }
  uint64_t v8 = v7;
  _Block_object_dispose(&v16, 8);
  id v9 = objc_alloc_init(v8);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57___ICQUIHelperFunctions_addHeadersForRequest_completion___block_invoke;
  v12[3] = &unk_264922058;
  id v13 = v5;
  id v14 = v6;
  id v10 = v6;
  id v11 = v5;
  [v9 commonHeadersForRequest:v11 withCompletion:v12];
}

+ (id)appIconWithSize:(CGSize)a3 forBundleID:(id)a4 drawBorder:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.height;
  double width = a3.width;
  id v8 = a4;
  uint64_t v23 = 0;
  id v9 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v8 allowPlaceholder:0 error:&v23];
  if (v9)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithBundleIdentifier:v8];
    id v11 = objc_alloc(MEMORY[0x263F4B558]);
    v12 = [MEMORY[0x263F82B60] mainScreen];
    [v12 scale];
    id v14 = objc_msgSend(v11, "initWithSize:scale:", width, height, v13);

    [v14 setDrawBorder:v5];
    id v15 = (id)[v10 prepareImageForDescriptor:v14];
    uint64_t v16 = [v10 imageForDescriptor:v14];
    int64_t v17 = v16;
    if (v16)
    {
      uint64_t v18 = (void *)MEMORY[0x263F827E8];
      uint64_t v19 = [v16 CGImage];
      v20 = [MEMORY[0x263F82B60] mainScreen];
      [v20 scale];
      long long v21 = objc_msgSend(v18, "imageWithCGImage:scale:orientation:", v19, 0);
    }
    else
    {
      long long v21 = 0;
    }
  }
  else
  {
    long long v21 = 0;
  }

  return v21;
}

+ (id)appIconWithSize:(CGSize)a3 forBundleID:(id)a4
{
  return (id)objc_msgSend(a1, "appIconWithSize:forBundleID:drawBorder:", a4, 1, a3.width, a3.height);
}

+ (double)highestScreenScale
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 scale];
  double v4 = v3;

  return v4;
}

@end