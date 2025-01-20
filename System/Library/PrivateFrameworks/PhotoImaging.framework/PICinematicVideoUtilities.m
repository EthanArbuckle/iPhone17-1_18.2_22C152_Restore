@interface PICinematicVideoUtilities
+ (BOOL)assetIsCinematicVideo:(id)a3;
+ (BOOL)currentSystemCanRenderAsset:(id)a3;
+ (id)cinematicMetadataFromAsset:(id)a3;
+ (unint64_t)currentSystemRenderingVersion;
+ (unint64_t)renderingVersionFromAsset:(id)a3 error:(id *)a4;
@end

@implementation PICinematicVideoUtilities

+ (unint64_t)renderingVersionFromAsset:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PICinematicVideoUtilities.m", 71, @"Invalid parameter not satisfying: %@", @"asset != nil" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, a1, @"PICinematicVideoUtilities.m", 72, @"Invalid parameter not satisfying: %@", @"error != NULL" object file lineNumber description];

LABEL_3:
  v8 = [a1 cinematicMetadataFromAsset:v7];
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E4F92218];
    v11 = [v8 value];
    v12 = [v10 deserializeMetadataWithType:2 fromGlobalMetadata:v11 error:a4];

    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v13 = [v12 renderingVersion];
      }
      else
      {
        [MEMORY[0x1E4F7A438] unsupportedError:@"Unexpected global rendering metadata class" object:v12];
        unint64_t v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      unint64_t v13 = 0;
    }
  }
  else
  {
    [MEMORY[0x1E4F7A438] missingError:@"Can't find global cinematic metadata in asset" object:v7];
    unint64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)cinematicMetadataFromAsset:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = objc_msgSend(a3, "metadata", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    uint64_t v7 = *MEMORY[0x1E4F92298];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 key];
        char v11 = [v10 isEqual:v7];

        if (v11)
        {
          id v12 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

+ (unint64_t)currentSystemRenderingVersion
{
  return [MEMORY[0x1E4F92230] latestVersion];
}

+ (BOOL)currentSystemCanRenderAsset:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  uint64_t v3 = [a1 renderingVersionFromAsset:a3 error:&v8];
  id v4 = v8;
  if (v3)
  {
    char v5 = [MEMORY[0x1E4F92230] isRenderVersionSupported:v3];
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_19093);
    }
    uint64_t v6 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "currentSystemCanRenderAsset: error retrieving rendering version from asset: %@", buf, 0xCu);
    }
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)assetIsCinematicVideo:(id)a3
{
  uint64_t v3 = [a1 cinematicMetadataFromAsset:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

@end