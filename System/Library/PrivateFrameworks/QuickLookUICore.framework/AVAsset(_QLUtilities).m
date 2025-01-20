@interface AVAsset(_QLUtilities)
+ (void)assetIsAutoloopMedia:()_QLUtilities completionHandler:;
- (double)ql_imageSizeOfFirstVideoTrack;
- (uint64_t)ql_canBeRotated;
@end

@implementation AVAsset(_QLUtilities)

+ (void)assetIsAutoloopMedia:()_QLUtilities completionHandler:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v11[0] = @"availableMetadataFormats";
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__AVAsset__QLUtilities__assetIsAutoloopMedia_completionHandler___block_invoke;
    v8[3] = &unk_1E6DD3E58;
    id v9 = v5;
    id v10 = v6;
    [v9 loadValuesAsynchronouslyForKeys:v7 completionHandler:v8];
  }
}

- (uint64_t)ql_canBeRotated
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v1 = objc_msgSend(a1, "tracks", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    uint64_t v5 = *MEMORY[0x1E4F15C18];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v1);
        }
        v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v8 = [v7 mediaType];
        if ([v8 isEqualToString:v5] && (objc_msgSend(v7, "naturalSize"), v9 > 0.0))
        {
          [v7 naturalSize];
          double v11 = v10;

          if (v11 > 0.0)
          {
            uint64_t v12 = 1;
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }
  uint64_t v12 = 0;
LABEL_14:

  return v12;
}

- (double)ql_imageSizeOfFirstVideoTrack
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
  uint64_t v3 = [v2 firstObject];

  if (v3)
  {
    [v3 naturalSize];
    double v5 = v4;
    double v7 = v6;
    memset(v11, 0, sizeof(v11));
    [v3 preferredTransform];
    if (vabdd_f64(1.57079633, fabsf(atan2f(0.0, 0.0))) < 0.0001) {
      double v5 = v7;
    }
  }
  else
  {
    v8 = (NSObject **)MEMORY[0x1E4F945F0];
    double v9 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      double v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v11[0]) = 138412290;
      *(void *)((char *)v11 + 4) = a1;
      _os_log_impl(&dword_1E2805000, v9, OS_LOG_TYPE_ERROR, "Could not determine image size of video because could not obtain track of asset: %@ #Generic", (uint8_t *)v11, 0xCu);
    }
    double v5 = *MEMORY[0x1E4F1DB30];
  }

  return v5;
}

@end