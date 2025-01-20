@interface PLPTPUtilities
+ (BOOL)shouldExpungeAsset:(id)a3;
+ (BOOL)shouldExpungeAsset:(id)a3 withFileManager:(id)a4;
+ (id)pathForSidecar:(id)a3 onAsset:(id)a4;
+ (void)enumerateAvailableSidecarFilesOnAsset:(id)a3 usingBlock:(id)a4;
+ (void)enumerateAvailableSidecarFilesOnAsset:(id)a3 withFileManager:(id)a4 usingBlock:(id)a5;
@end

@implementation PLPTPUtilities

+ (BOOL)shouldExpungeAsset:(id)a3 withFileManager:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 ptpAdditionalAttributes];
  unint64_t v8 = [v7 ptpTrashedState];

  v9 = PLPTPGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = [v5 objectID];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Asset %@ trashed state: 0x%llx", buf, 0x16u);
  }
  v11 = PLPTPGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = @"NO";
    if (v8) {
      v12 = @"YES";
    }
    v13 = v12;
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v13;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "isOriginalTrashed: %@", buf, 0xCu);
  }
  v14 = [v5 pathForFullsizeRenderImageFile];
  int v15 = [v6 fileExistsAtPath:v14 isDirectory:0];
  v16 = PLPTPGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if (v15) {
      v17 = @"YES";
    }
    else {
      v17 = @"NO";
    }
    v18 = v17;
    if ((v8 & 4) != 0) {
      v19 = @"YES";
    }
    else {
      v19 = @"NO";
    }
    v20 = v19;
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v20;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "hasAdjustedImage: %@, isAdjustedImageTrashed: %@", buf, 0x16u);
  }
  v21 = [v5 pathForFullsizeRenderVideoFile];
  int v22 = [v6 fileExistsAtPath:v21 isDirectory:0];
  v23 = PLPTPGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = @"NO";
    if (v22) {
      v24 = @"YES";
    }
    v25 = v24;
    v26 = @"NO";
    if ((v8 & 8) != 0) {
      v26 = @"YES";
    }
    v27 = v26;
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v25;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v27;
    _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "hasAdjustedVideo: %@, isAdjustedVideoTrashed: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v40 = 1;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __53__PLPTPUtilities_shouldExpungeAsset_withFileManager___block_invoke;
  v36[3] = &unk_1E58725D0;
  v36[4] = buf;
  +[PLPTPUtilities enumerateAvailableSidecarFilesOnAsset:v5 withFileManager:v6 usingBlock:v36];
  v28 = PLPTPGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
      v29 = @"YES";
    }
    else {
      v29 = @"NO";
    }
    v30 = v29;
    *(_DWORD *)v37 = 138412290;
    v38 = v30;
    _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "areAllAvailableSidecarsTrashed: %@", v37, 0xCu);
  }
  BOOL v31 = 0;
  if ((v8 & 1 & (v15 ^ 1 | (v8 >> 2) & 1)) == 1 && v22 ^ 1 | (v8 >> 3) & 1) {
    BOOL v31 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  }
  v32 = PLPTPGetLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    v33 = @"NO";
    if (v31) {
      v33 = @"YES";
    }
    v34 = v33;
    *(_DWORD *)v37 = 138412290;
    v38 = v34;
    _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEBUG, "shouldExpunge: %@", v37, 0xCu);
  }
  _Block_object_dispose(buf, 8);

  return v31;
}

void __53__PLPTPUtilities_shouldExpungeAsset_withFileManager___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  v7 = PLPTPGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v8 = [v6 objectID];
    int v9 = 138412546;
    v10 = v8;
    __int16 v11 = 2048;
    uint64_t v12 = [v6 ptpTrashedState];
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Sidecar %@ trashed state: 0x%llx", (uint8_t *)&v9, 0x16u);
  }
  if ([v6 resourceType] != 5 && objc_msgSend(v6, "ptpTrashedState") != 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

+ (BOOL)shouldExpungeAsset:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28CB8];
  id v5 = a3;
  id v6 = [v4 defaultManager];
  LOBYTE(a1) = [a1 shouldExpungeAsset:v5 withFileManager:v6];

  return (char)a1;
}

+ (void)enumerateAvailableSidecarFilesOnAsset:(id)a3 withFileManager:(id)a4 usingBlock:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (char *)a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  __int16 v11 = [v8 ptpSidecarFiles];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    v18 = v10 + 16;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v17 = objc_msgSend(a1, "pathForSidecar:onAsset:", v16, v8, v18);
        if (v17)
        {
          if ([v9 fileExistsAtPath:v17 isDirectory:0])
          {
            char v19 = 0;
            (*((void (**)(char *, uint64_t, void *, char *))v10 + 2))(v10, v16, v17, &v19);
            if (v19)
            {

              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

+ (void)enumerateAvailableSidecarFilesOnAsset:(id)a3 usingBlock:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28CB8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 defaultManager];
  [a1 enumerateAvailableSidecarFilesOnAsset:v8 withFileManager:v9 usingBlock:v7];
}

+ (id)pathForSidecar:(id)a3 onAsset:(id)a4
{
  id v5 = a3;
  id v6 = [a4 pathForOriginalFile];
  id v7 = [v6 stringByDeletingLastPathComponent];
  id v8 = [v5 filename];

  id v9 = [v8 lastPathComponent];

  v10 = 0;
  if (v6 && v7 && v9)
  {
    v10 = [v7 stringByAppendingPathComponent:v9];
  }

  return v10;
}

@end