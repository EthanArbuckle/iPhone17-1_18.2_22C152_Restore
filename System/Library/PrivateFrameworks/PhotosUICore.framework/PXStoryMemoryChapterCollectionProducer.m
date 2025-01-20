@interface PXStoryMemoryChapterCollectionProducer
+ (id)chapterCollectionForGenerativeMemory:(id)a3 assets:(id)a4 keyAsset:(id)a5 error:(id *)a6;
+ (id)chapterCollectionForPhotosGraphChapters:(id)a3 assets:(id)a4 keyAsset:(id)a5 error:(id *)a6;
+ (id)photosGraphChaptersForChapterCollection:(id)a3 originalPhotosGraphChapters:(id)a4 error:(id *)a5;
- (PHMemory)memory;
- (PXStoryMemoryChapterCollectionProducer)initWithMemory:(id)a3 storyQueue:(id)a4;
- (PXStoryMemoryChapterCollectionProducer)initWithStoryQueue:(id)a3;
- (id)workQueue_uneditedChapterCollectionWithAssets:(id)a3 keyAsset:(id)a4;
- (void)workQueue_saveEditTransaction:(id)a3 completionHandler:(id)a4;
@end

@implementation PXStoryMemoryChapterCollectionProducer

+ (id)chapterCollectionForGenerativeMemory:(id)a3 assets:(id)a4 keyAsset:(id)a5 error:(id *)a6
{
  id v9 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  Result_pSo0pM0_pSAySo7NSErrorCSgGSgtFZ_0 = (void *)_sSo38PXStoryMemoryChapterCollectionProducerC12PhotosUICoreE07chapterD0013forGenerativeB06assets8keyAsset5errorSo0acD0_pSgSo8PHMemoryC_So09PXDisplayM11FetchResult_pSo0pM0_pSAySo7NSErrorCSgGSgtFZ_0((uint64_t)v9, a4, (uint64_t)a5, a6);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return Result_pSo0pM0_pSAySo7NSErrorCSgGSgtFZ_0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memory, 0);
  objc_storeStrong((id *)&self->_workQueue_originalPhotosGraphChapters, 0);
}

- (PHMemory)memory
{
  return self->_memory;
}

- (void)workQueue_saveEditTransaction:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, void, id))a4;
  id v9 = [v7 originalChapterCollection];
  if ([v9 conformsToProtocol:&unk_1F0355ED8])
  {
    id v10 = v9;
    v11 = [v7 edits];
    v52[0] = 0;
    char v12 = [v10 canApplyEdits:v11 error:v52];
    id v13 = v52[0];
    v14 = v13;
    if (v12)
    {
      id v44 = v13;
      uint64_t v15 = [v10 copyByApplyingEdits:v11];
      v16 = (void *)v15;
      if (!self->_workQueue_originalPhotosGraphChapters)
      {
        SEL v40 = a2;
        v42 = (void *)v15;
        v17 = [(PXStoryMemoryChapterCollectionProducer *)self memory];
        v18 = [v17 photosGraphProperties];
        uint64_t v19 = [v18 objectForKeyedSubscript:@"chapterTitles"];

        v20 = (NSArray *)v19;
        if (v19)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v34 = [MEMORY[0x1E4F28B00] currentHandler];
            v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            v36 = v39 = v20;
            v37 = [(NSArray *)v39 px_descriptionForAssertionMessage];
            [v34 handleFailureInMethod:v40, self, @"PXStoryMemoryChapterCollectionProducer.m", 155, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.memory.photosGraphProperties[PHMemoryPhotosGraphPropertiesChapterTitlesKey]", v36, v37 object file lineNumber description];

            v20 = v39;
          }
        }
        workQueue_originalPhotosGraphChapters = self->_workQueue_originalPhotosGraphChapters;
        self->_workQueue_originalPhotosGraphChapters = v20;

        v16 = v42;
      }
      v22 = objc_opt_class();
      v23 = self->_workQueue_originalPhotosGraphChapters;
      id v51 = 0;
      v24 = [v22 photosGraphChaptersForChapterCollection:v16 originalPhotosGraphChapters:v23 error:&v51];
      id v25 = v51;
      v26 = v25;
      if (v24)
      {
        id v43 = v25;
        v27 = [(PXStoryMemoryChapterCollectionProducer *)self memory];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __90__PXStoryMemoryChapterCollectionProducer_workQueue_saveEditTransaction_completionHandler___block_invoke;
        v49[3] = &unk_1E5DAEAC8;
        id v50 = v24;
        id v48 = 0;
        v28 = objc_msgSend(v27, "px_photosGraphDataByMutatingPropertiesUsingBlock:error:", v49, &v48);
        id v29 = v48;
        v14 = v44;
        v41 = v29;
        if (v28)
        {
          [v27 photoLibrary];
          v38 = v24;
          v30 = v11;
          id v31 = v10;
          v33 = v32 = v16;
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __90__PXStoryMemoryChapterCollectionProducer_workQueue_saveEditTransaction_completionHandler___block_invoke_2;
          v45[3] = &unk_1E5DD32A8;
          id v46 = v27;
          id v47 = v28;
          [v33 performChanges:v45 completionHandler:v8];

          v16 = v32;
          id v10 = v31;
          v11 = v30;
          v24 = v38;
        }
        else
        {
          v8[2](v8, 0, v29);
        }

        v26 = v43;
      }
      else
      {
        v8[2](v8, 0, v25);
        v14 = v44;
      }
    }
    else
    {
      v8[2](v8, 0, v13);
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXStoryChapterErrorDomain" code:3 userInfo:0];
    v8[2](v8, 0, v10);
  }
}

uint64_t __90__PXStoryMemoryChapterCollectionProducer_workQueue_saveEditTransaction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"chapterTitles"];
}

void __90__PXStoryMemoryChapterCollectionProducer_workQueue_saveEditTransaction_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F39170] changeRequestForMemory:*(void *)(a1 + 32)];
  [v2 setPhotosGraphData:*(void *)(a1 + 40)];
}

- (id)workQueue_uneditedChapterCollectionWithAssets:(id)a3 keyAsset:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [(PXStoryMemoryChapterCollectionProducer *)self memory];
  id v9 = [v8 photosGraphProperties];

  id v10 = [(PXStoryMemoryChapterCollectionProducer *)self memory];
  int v11 = [v10 isGenerative];

  char v12 = objc_opt_class();
  if (v11)
  {
    id v13 = [(PXStoryMemoryChapterCollectionProducer *)self memory];
    uint64_t v23 = 0;
    v14 = (id *)&v23;
    uint64_t v15 = [v12 chapterCollectionForGenerativeMemory:v13 assets:v7 keyAsset:v6 error:&v23];
  }
  else
  {
    id v13 = [v9 objectForKeyedSubscript:@"chapterTitles"];
    uint64_t v22 = 0;
    v14 = (id *)&v22;
    uint64_t v15 = [v12 chapterCollectionForPhotosGraphChapters:v13 assets:v7 keyAsset:v6 error:&v22];
  }
  v16 = (void *)v15;

  id v17 = *v14;
  if (!v16)
  {
    v18 = PLStoryGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138543618;
      id v25 = v20;
      __int16 v26 = 2112;
      id v27 = v17;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_ERROR, "%{public}@ malformed photosGraph chapters: %@", buf, 0x16u);
    }
  }

  return v16;
}

- (PXStoryMemoryChapterCollectionProducer)initWithMemory:(id)a3 storyQueue:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXStoryMemoryChapterCollectionProducer;
  v8 = [(PXStoryTransientChapterCollectionProducer *)&v11 initWithStoryQueue:a4];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_memory, a3);
  }

  return v9;
}

- (PXStoryMemoryChapterCollectionProducer)initWithStoryQueue:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMemoryChapterCollectionProducer.m", 37, @"%s is not available as initializer", "-[PXStoryMemoryChapterCollectionProducer initWithStoryQueue:]");

  abort();
}

+ (id)photosGraphChaptersForChapterCollection:(id)a3 originalPhotosGraphChapters:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __116__PXStoryMemoryChapterCollectionProducer_photosGraphChaptersForChapterCollection_originalPhotosGraphChapters_error___block_invoke;
    v19[3] = &unk_1E5DAEAA0;
    id v20 = v10;
    SEL v22 = a2;
    id v23 = a1;
    id v12 = v11;
    id v21 = v12;
    [v9 enumerateChaptersUsingBlock:v19];

    id v13 = 0;
    v14 = v20;
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28228];
    v14 = (void *)[[NSString alloc] initWithFormat:@"can't serialize %@ into dictionary", v9];
    v25[0] = v14;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v13 = [v15 errorWithDomain:@"PXStoryChapterErrorDomain" code:4 userInfo:v16];

    id v12 = 0;
  }

  if (a5) {
    *a5 = v13;
  }
  id v17 = (void *)[v12 copy];

  return v17;
}

void __116__PXStoryMemoryChapterCollectionProducer_photosGraphChaptersForChapterCollection_originalPhotosGraphChapters_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  id v23 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
      id v11 = [v10 objectForKeyedSubscript:@"startDate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [v23 startDate];
        char v13 = [v11 isEqualToDate:v12];

        if (v13) {
          break;
        }
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v14 = (id)[v10 mutableCopy];

    if (v14) {
      goto LABEL_13;
    }
  }
  else
  {
LABEL_10:
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
LABEL_13:
  uint64_t v15 = [v22 localizedTitle];
  [v14 setObject:v15 forKeyedSubscript:@"title"];

  v16 = [v22 localizedSubtitle];
  uint64_t v17 = [v16 length];

  if (v17) {
    PXAssertGetLog();
  }
  v18 = [v23 startDate];
  [v14 setObject:v18 forKeyedSubscript:@"startDate"];

  uint64_t v19 = [v23 endDate];
  [v14 setObject:v19 forKeyedSubscript:@"endDate"];

  id v20 = *(void **)(a1 + 40);
  id v21 = (void *)[v14 copy];
  [v20 addObject:v21];
}

+ (id)chapterCollectionForPhotosGraphChapters:(id)a3 assets:(id)a4 keyAsset:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = v11;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v19 = (objc_class *)objc_opt_class();
      id v20 = NSStringFromClass(v19);
      id v21 = objc_msgSend(v14, "px_descriptionForAssertionMessage");
      [v18 handleFailureInMethod:a2, a1, @"PXStoryMemoryChapterCollectionProducer.m", 52, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"photosGraphChapters", v20, v21 object file lineNumber description];
    }
  }

  uint64_t v15 = [PXStoryTimeBasedChapterCollection alloc];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __104__PXStoryMemoryChapterCollectionProducer_chapterCollectionForPhotosGraphChapters_assets_keyAsset_error___block_invoke;
  v22[3] = &unk_1E5DAEA78;
  id v23 = v14;
  SEL v24 = a2;
  id v25 = a1;
  v16 = [(PXStoryTimeBasedChapterCollection *)v15 initWithAssets:v12 keyAsset:v13 configuration:v22];

  if (a6) {
    *a6 = 0;
  }

  return v16;
}

void __104__PXStoryMemoryChapterCollectionProducer_chapterCollectionForPhotosGraphChapters_assets_keyAsset_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setUsesAssetLocalCreationDates:1];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v55 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v60;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v60 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v59 + 1) + 8 * v7);
        if (v8)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_8;
          }
          id v14 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v45 = *(void *)(v55 + 48);
          uint64_t v53 = *(void *)(v55 + 40);
          long long v27 = (objc_class *)objc_opt_class();
          uint64_t v17 = NSStringFromClass(v27);
          uint64_t v28 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
          [v14 handleFailureInMethod:v53, v45, @"PXStoryMemoryChapterCollectionProducer.m", 56, @"%@ should be an instance inheriting from %@, but it is %@", @"graphChapter", v17, v28 object file lineNumber description];
        }
        else
        {
          id v14 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v15 = *(void *)(v55 + 40);
          uint64_t v49 = *(void *)(v55 + 48);
          v16 = (objc_class *)objc_opt_class();
          uint64_t v17 = NSStringFromClass(v16);
          [v14 handleFailureInMethod:v15, v49, @"PXStoryMemoryChapterCollectionProducer.m", 56, @"%@ should be an instance inheriting from %@, but it is nil", @"graphChapter", v17 object file lineNumber description];
        }

LABEL_8:
        uint64_t v9 = [v8 objectForKeyedSubscript:@"title"];
        if (v9)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_10;
          }
          v18 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v46 = *(void *)(v55 + 48);
          uint64_t v54 = *(void *)(v55 + 40);
          uint64_t v29 = (objc_class *)objc_opt_class();
          id v20 = NSStringFromClass(v29);
          v39 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
          [v18 handleFailureInMethod:v54, v46, @"PXStoryMemoryChapterCollectionProducer.m", 57, @"%@ should be an instance inheriting from %@, but it is %@", @"graphChapter[PHMemoryPhotosGraphPropertiesChapterTitlesTitleKey]", v20, v39 object file lineNumber description];
        }
        else
        {
          v18 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v42 = *(void *)(v55 + 48);
          uint64_t v50 = *(void *)(v55 + 40);
          uint64_t v19 = (objc_class *)objc_opt_class();
          id v20 = NSStringFromClass(v19);
          [v18 handleFailureInMethod:v50, v42, @"PXStoryMemoryChapterCollectionProducer.m", 57, @"%@ should be an instance inheriting from %@, but it is nil", @"graphChapter[PHMemoryPhotosGraphPropertiesChapterTitlesTitleKey]", v20 object file lineNumber description];
        }

LABEL_10:
        id v10 = [v8 objectForKeyedSubscript:@"startDate"];
        if (v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_12;
          }
          uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v47 = *(void *)(v55 + 40);
          id v51 = (void *)v30;
          uint64_t v40 = *(void *)(v55 + 48);
          id v31 = (objc_class *)objc_opt_class();
          id v23 = NSStringFromClass(v31);
          v35 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
          [v51 handleFailureInMethod:v47, v40, @"PXStoryMemoryChapterCollectionProducer.m", 58, @"%@ should be an instance inheriting from %@, but it is %@", @"graphChapter[PHMemoryPhotosGraphPropertiesChapterTitlesStartDateKey]", v23, v35 object file lineNumber description];
        }
        else
        {
          uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v43 = *(void *)(v55 + 40);
          id v51 = (void *)v21;
          uint64_t v37 = *(void *)(v55 + 48);
          id v22 = (objc_class *)objc_opt_class();
          id v23 = NSStringFromClass(v22);
          [v51 handleFailureInMethod:v43, v37, @"PXStoryMemoryChapterCollectionProducer.m", 58, @"%@ should be an instance inheriting from %@, but it is nil", @"graphChapter[PHMemoryPhotosGraphPropertiesChapterTitlesStartDateKey]", v23 object file lineNumber description];
        }

LABEL_12:
        id v11 = [v8 objectForKeyedSubscript:@"endDate"];
        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_14;
          }
          uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v48 = *(void *)(v55 + 40);
          v52 = (void *)v32;
          uint64_t v41 = *(void *)(v55 + 48);
          v33 = (objc_class *)objc_opt_class();
          uint64_t v26 = NSStringFromClass(v33);
          v36 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
          [v52 handleFailureInMethod:v48, v41, @"PXStoryMemoryChapterCollectionProducer.m", 59, @"%@ should be an instance inheriting from %@, but it is %@", @"graphChapter[PHMemoryPhotosGraphPropertiesChapterTitlesEndDateKey]", v26, v36 object file lineNumber description];
        }
        else
        {
          uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v44 = *(void *)(v55 + 40);
          v52 = (void *)v24;
          uint64_t v38 = *(void *)(v55 + 48);
          id v25 = (objc_class *)objc_opt_class();
          uint64_t v26 = NSStringFromClass(v25);
          [v52 handleFailureInMethod:v44, v38, @"PXStoryMemoryChapterCollectionProducer.m", 59, @"%@ should be an instance inheriting from %@, but it is nil", @"graphChapter[PHMemoryPhotosGraphPropertiesChapterTitlesEndDateKey]", v26 object file lineNumber description];
        }

LABEL_14:
        id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v10 endDate:v11];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __104__PXStoryMemoryChapterCollectionProducer_chapterCollectionForPhotosGraphChapters_assets_keyAsset_error___block_invoke_2;
        v57[3] = &unk_1E5DB67F8;
        id v58 = v9;
        id v13 = v9;
        [v3 addChapterWithDateInterval:v12 configuration:v57];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v34 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
      uint64_t v5 = v34;
    }
    while (v34);
  }
}

uint64_t __104__PXStoryMemoryChapterCollectionProducer_chapterCollectionForPhotosGraphChapters_assets_keyAsset_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setLocalizedTitle:*(void *)(a1 + 32)];
}

@end