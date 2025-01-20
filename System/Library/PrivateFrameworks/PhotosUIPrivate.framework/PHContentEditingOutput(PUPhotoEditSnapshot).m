@interface PHContentEditingOutput(PUPhotoEditSnapshot)
- (void)initWithPhotoEditSnapshot:()PUPhotoEditSnapshot appropriateForURL:;
@end

@implementation PHContentEditingOutput(PUPhotoEditSnapshot)

- (void)initWithPhotoEditSnapshot:()PUPhotoEditSnapshot appropriateForURL:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)[a1 initWithAdjustmentBaseVersion:0 mediaType:1 appropriateForURL:a4];
  if (v7)
  {
    v8 = [v6 adjustmentData];
    objc_msgSend(v7, "setBaseVersion:", objc_msgSend(v8, "baseVersion"));

    v9 = [v6 adjustmentData];
    [v7 setAdjustmentData:v9];

    v10 = [v6 baseImageData];
    [v7 setPenultimateRenderedJPEGData:v10];

    v11 = (void *)MEMORY[0x1E4F442D8];
    v12 = [v6 imageUTI];
    v13 = [v11 typeWithIdentifier:v12];

    id v23 = 0;
    v14 = [v7 renderedContentURLForType:v13 error:&v23];
    id v15 = v23;
    if (v14)
    {
      v16 = [v6 imageData];
      id v22 = v15;
      char v17 = [v16 writeToURL:v14 options:1073741825 error:&v22];
      id v18 = v22;

      if (v17)
      {
LABEL_10:

        goto LABEL_11;
      }
      v19 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v18;
        _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Failed to write snapshot image data to rendered content URL with error: %@", buf, 0xCu);
      }
    }
    else
    {
      v19 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = [v13 identifier];
        *(_DWORD *)buf = 138543618;
        id v25 = v20;
        __int16 v26 = 2112;
        id v27 = v15;
        _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Failed to retrieve rendered content URL for identifier: %{public}@, error: %@", buf, 0x16u);
      }
      id v18 = v15;
    }

    goto LABEL_10;
  }
LABEL_11:

  return v7;
}

@end