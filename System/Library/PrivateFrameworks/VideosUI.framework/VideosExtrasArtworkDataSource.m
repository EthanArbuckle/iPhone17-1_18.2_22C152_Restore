@interface VideosExtrasArtworkDataSource
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)wantsBackgroundImageDecompression;
- (VideosExtrasArtworkDataSource)init;
- (id)cacheKeyForCatalog:(id)a3 size:(CGSize)a4;
- (id)requestForCatalog:(id)a3 size:(CGSize)a4;
- (id)supportedSizesForCatalog:(id)a3;
@end

@implementation VideosExtrasArtworkDataSource

- (VideosExtrasArtworkDataSource)init
{
  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasArtworkDataSource;
  v2 = [(MPAbstractNetworkArtworkDataSource *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(MPAbstractNetworkArtworkDataSource *)v2 URLSessionConfiguration];
    v5 = [v4 URLCache];
    [v5 setMemoryCapacity:524288000];

    v6 = [(MPAbstractNetworkArtworkDataSource *)v3 URLSessionConfiguration];
    v7 = [v6 URLCache];
    [v7 setDiskCapacity:524288000];
  }
  return v3;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  v3 = [a3 token];
  v4 = [v3 srcset];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [v3 url];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (id)supportedSizesForCatalog:(id)a3
{
  v43[1] = *MEMORY[0x1E4F143B8];
  v3 = [a3 token];
  v4 = [MEMORY[0x1E4F1CA48] array];
  [v3 width];
  double v6 = v5;
  [v3 height];
  double v8 = v7;
  if (v6 != *MEMORY[0x1E4F1DB30] || v7 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v10 = (void *)MEMORY[0x1E4F29238];
    [v3 width];
    double v12 = v11;
    [v3 height];
    v14 = objc_msgSend(v10, "valueWithCGSize:", v12, v13);
    [v4 addObject:v14];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v35 = v3;
    v15 = [v3 srcset];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (!v16) {
      goto LABEL_20;
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    uint64_t v19 = *MEMORY[0x1E4F6EF80];
    uint64_t v20 = *MEMORY[0x1E4F6EF88];
    while (1)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if ([v22 isEqualToString:v19])
        {
          v23 = (void *)MEMORY[0x1E4F29238];
          double v24 = v6;
          double v25 = v8;
        }
        else
        {
          if ([v22 isEqualToString:v20])
          {
            v26 = (void *)MEMORY[0x1E4F29238];
            CGAffineTransformMakeScale(&v37, 2.0, 2.0);
            double d = v37.d;
            double v28 = v8 * v37.c;
            double a = v37.a;
            double b = v37.b;
          }
          else
          {
            if (![v22 isEqualToString:@"3x"]) {
              continue;
            }
            v26 = (void *)MEMORY[0x1E4F29238];
            CGAffineTransformMakeScale(&v36, 3.0, 3.0);
            double d = v36.d;
            double v28 = v8 * v36.c;
            double a = v36.a;
            double b = v36.b;
          }
          double v24 = v28 + a * v6;
          double v25 = v8 * d + b * v6;
          v23 = v26;
        }
        v31 = objc_msgSend(v23, "valueWithCGSize:", v24, v25);
        [v4 addObject:v31];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (!v17)
      {
LABEL_20:

        id v32 = v4;
        v3 = v35;
        goto LABEL_22;
      }
    }
  }
  v33 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:");
  v43[0] = v33;
  id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];

LABEL_22:
  return v32;
}

- (id)requestForCatalog:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  double v7 = [v6 token];
  double v8 = [v7 srcset];
  if (![v8 count])
  {

    goto LABEL_9;
  }
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

  if (width == v9 && height == v10)
  {
LABEL_9:
    uint64_t v16 = [v7 url];
    if (v16) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  [v6 destinationScale];
  if (fabs(v12 + -1.0) < 0.00000011920929)
  {
    double v13 = [v7 srcset];
    v14 = v13;
    v15 = (__CFString **)MEMORY[0x1E4F6EF80];
LABEL_13:
    uint64_t v17 = *v15;
    goto LABEL_14;
  }
  if (fabs(v12 + -2.0) < 0.00000011920929)
  {
    double v13 = [v7 srcset];
    v14 = v13;
    v15 = (__CFString **)MEMORY[0x1E4F6EF88];
    goto LABEL_13;
  }
  if (fabs(v12 + -3.0) < 0.00000011920929)
  {
    double v13 = [v7 srcset];
    v14 = v13;
    uint64_t v17 = @"3x";
LABEL_14:
    uint64_t v16 = [v13 objectForKeyedSubscript:v17];

    if (v16) {
      goto LABEL_21;
    }
  }
LABEL_18:
  uint64_t v16 = [v7 url];
  if (!v16)
  {
    uint64_t v18 = [v7 srcset];
    uint64_t v16 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F6EF78]];

    if (!v16)
    {
      uint64_t v19 = [v7 srcset];
      uint64_t v16 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F6EF90]];
    }
  }
LABEL_21:
  uint64_t v20 = [MEMORY[0x1E4F290D0] requestWithURL:v16 cachePolicy:0 timeoutInterval:60.0];

  return v20;
}

- (BOOL)wantsBackgroundImageDecompression
{
  return 0;
}

- (id)cacheKeyForCatalog:(id)a3 size:(CGSize)a4
{
  v4 = objc_msgSend(a3, "token", a4.width, a4.height);
  double v5 = [v4 cachePath];

  return v5;
}

@end