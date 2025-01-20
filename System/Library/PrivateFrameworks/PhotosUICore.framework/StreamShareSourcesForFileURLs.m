@interface StreamShareSourcesForFileURLs
@end

@implementation StreamShareSourcesForFileURLs

void ___StreamShareSourcesForFileURLs_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (!v6)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = objc_msgSend(NSString, "stringWithUTF8String:", "PLStreamShareSource * _Nullable _StreamShareSourceForURL(NSURL *__strong, NSError *__autoreleasing *)");
    [v22 handleFailureInFunction:v23, @"PXPostFilesToSharedAlbumAction.m", 115, @"Invalid parameter not satisfying: %@", @"url" file lineNumber description];
  }
  id v26 = 0;
  v7 = [MEMORY[0x1E4F8CDF8] typeForURL:v6 error:&v26];
  id v8 = v26;
  v9 = v8;
  if (!v7)
  {
    id v12 = v8;
LABEL_7:
    id v13 = v12;
    id v14 = 0;
    goto LABEL_24;
  }
  id v10 = v7;
  if (PFIsLivePhotoBundleType())
  {
    uint64_t v11 = 3;
    goto LABEL_12;
  }
  if ([v10 conformsToType:*MEMORY[0x1E4F44448]])
  {
    uint64_t v11 = 1;
    goto LABEL_12;
  }
  if (([v10 conformsToType:*MEMORY[0x1E4F44400]] & 1) == 0)
  {

    objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Unknown media type for URL: %@", v6);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  uint64_t v11 = 2;
LABEL_12:

  id v15 = v6;
  if (!v6)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    v25 = objc_msgSend(NSString, "stringWithUTF8String:", "PLStreamShareSource * _Nullable _StreamShareSourceWithMediaType(NSURL *__strong, PLStreamShareMediaType, NSError *__autoreleasing *)");
    [v24 handleFailureInFunction:v25, @"PXPostFilesToSharedAlbumAction.m", 79, @"Invalid parameter not satisfying: %@", @"fileURL" file lineNumber description];
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F8AC20]);
  [v16 setMediaType:v11];
  if ((unint64_t)(v11 - 1) >= 2)
  {
    if (v11 == 3)
    {
      id v14 = (id)[objc_alloc(MEMORY[0x1E4F8CE20]) initWithBundleAtURL:v15];
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to create PFVideoComplement for URL: %@", v15);
        id v17 = objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }
      [v16 setVideoComplement:v14];
      [v16 setMediaURL:v15];
    }
  }
  else
  {
    [v16 setMediaURL:v15];
  }
  id v14 = v16;
  id v17 = 0;
LABEL_20:

  id v18 = v17;
  v19 = v18;
  if (v14)
  {
    id v20 = v14;
    id v13 = 0;
  }
  else
  {
    id v13 = v18;
  }

LABEL_24:
  id v21 = v13;
  if (v14)
  {
    [*(id *)(a1 + 32) addObject:v14];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v13);
    *a4 = 1;
  }
}

@end