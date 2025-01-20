@interface WFAppIconLoader
+ (void)loadIconWithBundleIdentifier:(id)a3 desiredSize:(CGSize)a4 completionHandler:(id)a5;
@end

@implementation WFAppIconLoader

+ (void)loadIconWithBundleIdentifier:(id)a3 desiredSize:(CGSize)a4 completionHandler:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://itunes.apple.com/"];
  v11 = [MEMORY[0x1E4F29088] componentsWithURL:v10 resolvingAgainstBaseURL:0];
  [v11 setPath:@"/lookup"];
  v12 = [MEMORY[0x1E4F290C8] queryItemWithName:@"bundleId" value:v8];
  v27[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  [v11 setQueryItems:v13];

  v14 = objc_msgSend(MEMORY[0x1E4F290E0], "wf_sharedSession");
  v15 = [v11 URL];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __78__WFAppIconLoader_loadIconWithBundleIdentifier_desiredSize_completionHandler___block_invoke;
  v22 = &unk_1E6077528;
  id v23 = v8;
  id v24 = v9;
  CGFloat v25 = width;
  CGFloat v26 = height;
  id v16 = v9;
  id v17 = v8;
  v18 = [v14 dataTaskWithURL:v15 completionHandler:&v19];
  objc_msgSend(v18, "resume", v19, v20, v21, v22);
}

void __78__WFAppIconLoader_loadIconWithBundleIdentifier_desiredSize_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v7 length])
  {
    v38 = v9;
    v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v38];
    v32 = v38;

    v11 = [v10 objectForKeyedSubscript:@"results"];
    v12 = [v11 firstObject];

    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v31 = [v12 objectForKeyedSubscript:@"artworkUrl60"];
      v30 = [v12 objectForKeyedSubscript:@"artworkUrl100"];
      uint64_t v13 = [v12 objectForKeyedSubscript:@"artworkUrl512"];
      v29 = (void *)v13;
      double v14 = *(double *)(a1 + 48);
      v15 = v30;
      if (v14 > 100.0) {
        v15 = (void *)v13;
      }
      if (v14 <= 60.0) {
        v15 = v31;
      }
      id v28 = v15;
      id v16 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
      v44[0] = v16;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
      v18 = [v16 lastPathComponent];
      uint64_t v19 = +[WFFileType typeFromFilename:v18];
      int v20 = [v19 conformsToUTType:*MEMORY[0x1E4F44410]];

      if (v20)
      {
        v21 = [v16 URLByDeletingPathExtension];
        v22 = [v21 URLByAppendingPathExtension:@"png"];

        v43[0] = v22;
        v43[1] = v16;
        uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];

        id v17 = (void *)v23;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v40 = __Block_byref_object_copy__2786;
      v41 = __Block_byref_object_dispose__2787;
      id v42 = 0;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __78__WFAppIconLoader_loadIconWithBundleIdentifier_desiredSize_completionHandler___block_invoke_77;
      v37[3] = &unk_1E60774D8;
      v37[4] = buf;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __78__WFAppIconLoader_loadIconWithBundleIdentifier_desiredSize_completionHandler___block_invoke_3;
      v33[3] = &unk_1E6077500;
      v36 = buf;
      id v34 = *(id *)(a1 + 32);
      id v35 = *(id *)(a1 + 40);
      objc_msgSend(v17, "if_enumerateAsynchronouslyInSequence:completionHandler:", v37, v33);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v24 = getWFInterchangeLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "+[WFAppIconLoader loadIconWithBundleIdentifier:desiredSize:completionHandler:]_block_invoke";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v25;
        *(_WORD *)&buf[22] = 2114;
        v40 = v32;
        _os_log_impl(&dword_1B3C5C000, v24, OS_LOG_TYPE_ERROR, "%s Failed to fetch icon for %{public}@, %{public}@", buf, 0x20u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }

    id v9 = v32;
  }
  else
  {
    CGFloat v26 = getWFInterchangeLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "+[WFAppIconLoader loadIconWithBundleIdentifier:desiredSize:completionHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2114;
      v40 = v9;
      _os_log_impl(&dword_1B3C5C000, v26, OS_LOG_TYPE_ERROR, "%s Failed to fetch icon for %{public}@, %{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __78__WFAppIconLoader_loadIconWithBundleIdentifier_desiredSize_completionHandler___block_invoke_77(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E4F290E0];
  id v10 = a2;
  v11 = objc_msgSend(v9, "wf_sharedSession");
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__WFAppIconLoader_loadIconWithBundleIdentifier_desiredSize_completionHandler___block_invoke_2;
  v15[3] = &unk_1E60774B0;
  uint64_t v12 = *(void *)(a1 + 32);
  id v16 = v8;
  uint64_t v17 = v12;
  uint64_t v18 = a5;
  id v13 = v8;
  double v14 = [v11 dataTaskWithURL:v10 completionHandler:v15];

  [v14 resume];
}

void __78__WFAppIconLoader_loadIconWithBundleIdentifier_desiredSize_completionHandler___block_invoke_3(void *a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (v5)
  {
    v6 = +[WFImage imageWithData:v5 scale:0 allowAnimated:1.0];
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    id v7 = getWFInterchangeLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      int v9 = 136315650;
      id v10 = "+[WFAppIconLoader loadIconWithBundleIdentifier:desiredSize:completionHandler:]_block_invoke_3";
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl(&dword_1B3C5C000, v7, OS_LOG_TYPE_ERROR, "%s Failed to fetch icon for %{public}@, %{public}@", (uint8_t *)&v9, 0x20u);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
}

void __78__WFAppIconLoader_loadIconWithBundleIdentifier_desiredSize_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v8 = a4;
  int v9 = (void *)MEMORY[0x1E4F28D60];
  id v10 = a3;
  __int16 v11 = objc_msgSend(v9, "indexSetWithIndexesInRange:", 200, 100);
  uint64_t v12 = [v10 statusCode];

  LOBYTE(v10) = [v11 containsIndex:v12];
  if (v10)
  {
    **(unsigned char **)(a1 + 48) = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end