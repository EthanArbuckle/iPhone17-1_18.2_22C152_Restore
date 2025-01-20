@interface PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe
+ (void)generateKeyFrameFromVideoURL:(id)a3 destinationURL:(id)a4 time:(id *)a5 completion:(id)a6;
+ (void)generateKeyFrameFromVideoURL:(id)a3 time:(id *)a4 completion:(id)a5;
- (PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe)initWithRecipeID:(unsigned int)a3;
- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4;
- (id)codecFourCharCodeName;
- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4;
- (unsigned)recipeID;
- (void)_generateAndStoreForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 clientBundleID:(id)a5 progress:(id *)a6 completion:(id)a7;
- (void)_handleJobFinished:(id)a3 withMutatedMoc:(id)a4 error:(id)a5 storedRecipes:(id)a6 affectedRecipes:(id)a7 sourceMetadata:(id)a8;
- (void)_handleKeyFrameGeneratedWithAsset:(id)a3 destinationURL:(id)a4 completion:(id)a5;
- (void)_runNextJob;
- (void)generateAndStoreForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 clientBundleID:(id)a5 progress:(id *)a6 completion:(id)a7;
- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11;
@end

@implementation PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe

- (void).cxx_destruct
{
}

- (void)_runNextJob
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [(PLLocalVideoKeyFrameJobQueue *)self->_jobQueue popNextJobToRun];
  if (v3)
  {
    v4 = +[PLPhotoLibraryBundleController sharedBundleController];
    v5 = [v4 libraryBundles];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v31;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
        v12 = [v11 pathManager];
        v13 = PLLibraryIDFromPathManager();

        v14 = [v3 libraryID];
        char v15 = [v13 isEqual:v14];

        if (v15) {
          break;
        }

        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      v16 = [v11 libraryServicesManager];
      v17 = [v16 databaseContext];
      v18 = (void *)[v17 newShortLivedLibraryWithName:"-[PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe _runNextJob]"];

      if (!v18) {
        goto LABEL_13;
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __65__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__runNextJob__block_invoke;
      v26[3] = &unk_1E5873A50;
      id v27 = v3;
      id v28 = v18;
      v29 = self;
      id v19 = v18;
      [v19 performBlock:v26];

      v20 = v27;
    }
    else
    {
LABEL_10:

LABEL_13:
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F8C500];
      uint64_t v34 = *MEMORY[0x1E4F28228];
      v23 = NSString;
      id v19 = [v3 libraryID];
      v20 = [v23 stringWithFormat:@"Could not find photo library bundle for libraryID: %@", v19];
      v35 = v20;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      v25 = [v21 errorWithDomain:v22 code:47001 userInfo:v24];
      [(PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe *)self _handleJobFinished:v3 withMutatedMoc:0 error:v25 storedRecipes:0 affectedRecipes:0 sourceMetadata:0];
    }
  }
}

void __65__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__runNextJob__block_invoke(id *a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  v3 = +[PLManagedAsset entityName];
  v4 = [v2 fetchRequestWithEntityName:v3];

  v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [a1[4] assetObjectID];
  uint64_t v7 = [v5 predicateWithFormat:@"self == %@", v6];
  [v4 setPredicate:v7];

  uint64_t v8 = [a1[5] managedObjectContext];
  id v29 = 0;
  uint64_t v9 = [v8 executeFetchRequest:v4 error:&v29];
  id v10 = v29;
  v11 = [v9 firstObject];

  v12 = PLImageManagerGetLog();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = [v11 uuid];
      *(_DWORD *)buf = 138412290;
      long long v31 = v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "[key frame] generating key frame for dequeued job for asset: %@", buf, 0xCu);
    }
    id v15 = a1[6];
    uint64_t v16 = [a1[4] networkAccessAllowed];
    v17 = [a1[4] clientBundleID];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __65__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__runNextJob__block_invoke_217;
    v25[3] = &unk_1E586BA00;
    id v18 = a1[5];
    id v19 = a1[6];
    id v26 = v18;
    id v27 = v19;
    id v28 = a1[4];
    [v15 _generateAndStoreForAsset:v11 networkAccessAllowed:v16 clientBundleID:v17 progress:0 completion:v25];

    v20 = v26;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v21 = [a1[4] assetObjectID];
      *(_DWORD *)buf = 138543618;
      long long v31 = v21;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "[key frame] Could not find asset object ID: %{public}@, error: %@", buf, 0x16u);
    }
    uint64_t v22 = NSString;
    v23 = [a1[4] assetObjectID];
    v24 = [v22 stringWithFormat:@"Could not find asset objectID: %@", v23];
    v20 = (void *)PLErrorCreate();

    [a1[6] _handleJobFinished:a1[4] withMutatedMoc:0 error:v20 storedRecipes:0 affectedRecipes:0 sourceMetadata:0];
  }
}

void __65__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__runNextJob__block_invoke_217(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v16 = a2;
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v9 managedObjectContext];
  if (v13 == v16)
  {
    id v14 = [*(id *)(a1 + 32) managedObjectContext];
  }
  else
  {
    id v14 = v16;
  }
  id v15 = v14;

  [*(id *)(a1 + 40) _handleJobFinished:*(void *)(a1 + 48) withMutatedMoc:v15 error:v12 storedRecipes:v11 affectedRecipes:v10 sourceMetadata:0];
}

- (void)_handleJobFinished:(id)a3 withMutatedMoc:(id)a4 error:(id)a5 storedRecipes:(id)a6 affectedRecipes:(id)a7 sourceMetadata:(id)a8
{
  jobQueue = self->_jobQueue;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  [(PLLocalVideoKeyFrameJobQueue *)jobQueue removeJob:v20];
  [v20 callCompletionHandlersWithMutatedMoc:v19 error:v18 storedRecipes:v17 affectedRecipes:v16 sourceMetadata:v15];

  [(PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe *)self _runNextJob];
}

- (void)_generateAndStoreForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 clientBundleID:(id)a5 progress:(id *)a6 completion:(id)a7
{
  BOOL v9 = a4;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v49 = a5;
  id v48 = a7;
  id v12 = [(PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe *)self chooseIngredientsFrom:v11 version:3];
  id v13 = (_OWORD *)MEMORY[0x1E4F1FA48];
  CMTimeValue v14 = *MEMORY[0x1E4F1FA48];
  CMTimeValue value = *MEMORY[0x1E4F1FA48];
  CMTimeScale v15 = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 8);
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 12);
  CMTimeScale timescale = v15;
  CMTimeEpoch v16 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  CMTimeEpoch epoch = v16;
  id v17 = [v11 mediaAnalysisAttributes];

  if (v17)
  {
    if (v11
      && ([v11 videoKeyFrameTime], CMTimeValue value = buf.value, timescale = buf.timescale, (buf.flags & 1) != 0))
    {
      CMTimeEpoch epoch = buf.epoch;
      CMTimeFlags flags = buf.flags;
    }
    else
    {
      CMTimeValue value = v14;
      CMTimeScale timescale = v15;
    }
  }
  id v18 = (void *)MEMORY[0x1E4F1CB10];
  id v19 = [v11 pathForLocalVideoKeyFrame];
  id v20 = [v18 fileURLWithPath:v19];

  if ([v12 count])
  {
    v21 = 0;
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F8C500];
    uint64_t v68 = *MEMORY[0x1E4F28228];
    v69 = @"failed to find ingredients to generate local video key frame";
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    v21 = [v22 errorWithDomain:v23 code:47001 userInfo:v24];
  }
  v25 = [v12 objectForKeyedSubscript:@"localVideo"];
  id v26 = v25;
  if (v25)
  {
    id v27 = [v25 dataStoreKey];
    id v28 = [v11 assetID];
    id v29 = [v27 fileURLForAssetID:v28];

    if (v29)
    {
      long long v30 = objc_opt_class();
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __136__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__generateAndStoreForAsset_networkAccessAllowed_clientBundleID_progress_completion___block_invoke;
      v60[3] = &unk_1E586D520;
      v60[4] = self;
      id v61 = v11;
      id v62 = v20;
      long long v31 = (void (**)(void, void, void, void, void))v48;
      id v63 = v48;
      buf.CMTimeValue value = value;
      buf.CMTimeScale timescale = timescale;
      buf.CMTimeFlags flags = flags;
      buf.CMTimeEpoch epoch = epoch;
      [v30 generateKeyFrameFromVideoURL:v29 destinationURL:v62 time:&buf completion:v60];

      __int16 v32 = v61;
LABEL_17:

      char v34 = 1;
      goto LABEL_23;
    }
    v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F8C500];
    uint64_t v66 = *MEMORY[0x1E4F28228];
    v67 = @"data store key failed to resolve video url";
    uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    uint64_t v38 = [v35 errorWithDomain:v36 code:47001 userInfo:v37];

    id v29 = 0;
LABEL_21:
    char v34 = 0;
    v21 = (void *)v38;
    goto LABEL_22;
  }
  id v29 = [v12 objectForKeyedSubscript:@"streamingVideo"];
  if (v29)
  {
    if (v9)
    {
      id v33 = PLImageManagerGetLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v49;
        _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEBUG, "[key frame] Making streaming video request to generate local video key frame, clientBundleID: %@", (uint8_t *)&buf, 0xCu);
      }

      v45 = [v29 dataStore];
      buf.CMTimeValue value = value;
      buf.CMTimeScale timescale = timescale;
      buf.CMTimeFlags flags = flags;
      buf.CMTimeEpoch epoch = epoch;
      *(_OWORD *)&duration.CMTimeValue value = *v13;
      duration.CMTimeEpoch epoch = v16;
      CMTimeRangeMake(&v59, &buf, &duration);
      v44 = [v11 managedObjectContext];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __136__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__generateAndStoreForAsset_networkAccessAllowed_clientBundleID_progress_completion___block_invoke_201;
      v50[3] = &unk_1E586B9D8;
      v50[4] = self;
      id v51 = v20;
      CMTimeValue v54 = value;
      CMTimeScale v55 = timescale;
      CMTimeFlags v56 = flags;
      CMTimeEpoch v57 = epoch;
      id v52 = v11;
      long long v31 = (void (**)(void, void, void, void, void))v48;
      id v53 = v48;
      [v45 requestStreamingURLForResource:v29 asset:v52 intent:5 timeRange:&v59 streamingHints:0 inContext:v44 clientBundleID:v49 completion:v50];

      __int16 v32 = v51;
      goto LABEL_17;
    }
    uint64_t v38 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C520] code:6 userInfo:0];

    goto LABEL_21;
  }
  char v34 = 0;
LABEL_22:
  long long v31 = (void (**)(void, void, void, void, void))v48;
LABEL_23:

  if (!v21)
  {
    v41 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F8C520];
    uint64_t v64 = *MEMORY[0x1E4F28228];
    v65 = @"failed to generate local video key frame, unknown error";
    v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    v21 = [v41 errorWithDomain:v42 code:4 userInfo:v43];

    if (v34) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if ((v34 & 1) == 0)
  {
LABEL_25:
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    id v40 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    ((void (**)(void, void, void *, id, id))v31)[2](v31, 0, v21, v39, v40);
  }
LABEL_26:
}

void __136__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__generateAndStoreForAsset_networkAccessAllowed_clientBundleID_progress_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _handleKeyFrameGeneratedWithAsset:*(void *)(a1 + 40) destinationURL:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    (*(void (**)(uint64_t, void, id, id, id))(v5 + 16))(v5, 0, v8, v6, v7);
  }
}

void __136__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__generateAndStoreForAsset_networkAccessAllowed_clientBundleID_progress_completion___block_invoke_201(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a6;
  id v10 = PLImageManagerGetLog();
  id v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)CMTime buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "[key frame] attempting to generate local video key frame from streaming url: %@", buf, 0xCu);
    }

    id v12 = objc_opt_class();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __136__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__generateAndStoreForAsset_networkAccessAllowed_clientBundleID_progress_completion___block_invoke_202;
    v18[3] = &unk_1E586D520;
    uint64_t v13 = *(void *)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 48);
    id v20 = *(id *)(a1 + 40);
    id v21 = *(id *)(a1 + 56);
    *(_OWORD *)CMTime buf = *(_OWORD *)(a1 + 64);
    uint64_t v23 = *(void *)(a1 + 80);
    [v12 generateKeyFrameFromVideoURL:v8 destinationURL:v13 time:buf completion:v18];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      CMTimeValue v14 = [v9 debugDescription];
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "[key frame] streaming request failed with error: %{public}@", buf, 0xCu);
    }
    uint64_t v15 = *(void *)(a1 + 56);
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    (*(void (**)(uint64_t, void, id, id, id))(v15 + 16))(v15, 0, v9, v16, v17);
  }
}

void __136__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__generateAndStoreForAsset_networkAccessAllowed_clientBundleID_progress_completion___block_invoke_202(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _handleKeyFrameGeneratedWithAsset:*(void *)(a1 + 40) destinationURL:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    (*(void (**)(uint64_t, void, id, id, id))(v5 + 16))(v5, 0, v8, v6, v7);
  }
}

- (void)_handleKeyFrameGeneratedWithAsset:(id)a3 destinationURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v12 = +[PLConcurrencyLimiter sharedLimiter];
  uint64_t v13 = [v8 managedObjectContext];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __114__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__handleKeyFrameGeneratedWithAsset_destinationURL_completion___block_invoke;
  v18[3] = &unk_1E5874818;
  id v19 = v8;
  id v20 = v9;
  id v21 = self;
  id v22 = v11;
  id v23 = v10;
  id v14 = v10;
  id v15 = v11;
  id v16 = v9;
  id v17 = v8;
  [v12 asyncPerformOnContext:v13 identifyingBlock:0 block:v18];
}

void __114__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe__handleKeyFrameGeneratedWithAsset_destinationURL_completion___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) persistedResourcesWithRecipeID:65749 andVersion:3];
  v3 = [v2 anyObject];

  int v4 = [v3 isLocallyAvailable];
  uint64_t v5 = [*(id *)(a1 + 40) path];
  uint64_t v6 = [*(id *)(a1 + 32) width];
  uint64_t v7 = [*(id *)(a1 + 32) height];
  uint64_t v8 = *(void *)(a1 + 48);
  __int16 v9 = [*(id *)(a1 + 32) kind];
  id v53 = 0;
  LOWORD(v48) = v9;
  id v10 = +[PLResourceInstaller generateValidatedExternalImageResourceOfType:0 forFilePath:v5 requireFileToBePresent:1 version:3 basedOnFullSizeWidth:v6 andHeight:v7 recipe:v8 assetKind:v48 error:&v53];
  id v11 = v53;

  if (!v10)
  {
    int v18 = PLIsErrorFileNotFound();
    id v14 = PLImageManagerGetLog();
    BOOL v19 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v19)
      {
        id v20 = [*(id *)(a1 + 32) uuid];
        *(_DWORD *)CMTime buf = 138543362;
        v58 = v20;
        id v21 = "[key frame] unable to create external resource for asset: %{public}@ because file not found";
        id v22 = v14;
        uint32_t v23 = 12;
LABEL_12:
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
      }
    }
    else if (v19)
    {
      id v20 = [*(id *)(a1 + 32) uuid];
      *(_DWORD *)CMTime buf = 138543618;
      v58 = v20;
      __int16 v59 = 2112;
      id v60 = v11;
      id v21 = "[key frame] unable to create external resource for asset: %{public}@, error: %@";
      id v22 = v14;
      uint32_t v23 = 22;
      goto LABEL_12;
    }
    id v16 = 0;
    int v17 = 0;
    id v15 = v11;
    goto LABEL_14;
  }
  CMTimeFlags v56 = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
  uint64_t v13 = *(void *)(a1 + 32);
  id v52 = v11;
  id v14 = +[PLResourceDataStoreManager storeExternalResources:v12 forAsset:v13 forLifecycleEvent:2 error:&v52];
  id v15 = v52;

  if ([v14 count])
  {
    id v16 = [v14 anyObject];
    int v17 = 1;
  }
  else
  {
    uint64_t v24 = PLImageManagerGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = [*(id *)(a1 + 32) uuid];
      *(_DWORD *)CMTime buf = 138543618;
      v58 = v25;
      __int16 v59 = 2112;
      id v60 = v15;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "[key frame] failed to store resource for asset: %{public}@, error: %@", buf, 0x16u);
    }
    id v16 = 0;
    int v17 = 0;
  }
LABEL_14:

  id v50 = 0;
  uint64_t v51 = 0;
  BOOL v26 = +[PLCacheDeleteSupport markPurgeableForFileAtURL:*(void *)(a1 + 40) withUrgency:2 outInode:&v51 error:&v50];
  id v27 = v50;
  if (v26)
  {
    if (!v17) {
      goto LABEL_23;
    }
    [v16 setFileID:v51];
  }
  else if ((PLIsErrorFileNotFound() & 1) == 0)
  {
    id v28 = PLImageManagerGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = [*(id *)(a1 + 32) uuid];
      *(_DWORD *)CMTime buf = 138543618;
      v58 = v29;
      __int16 v59 = 2112;
      id v60 = v27;
      _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "[key frame] mark purgeable file failed, may not be purgeable, for asset: %{public}@, error: %@", buf, 0x16u);
    }
  }
  if (((v17 ^ 1 | v4) & 1) == 0)
  {
    long long v30 = *(void **)(a1 + 32);
    long long v31 = [v16 dataStoreKey];
    [v30 recalculateImageRequestHintsForResource:v16 afterLocalAvailabilityChangeFrom:0xFFFFFFFFLL previousDataStoreKey:v31];
  }
LABEL_23:
  __int16 v32 = [*(id *)(a1 + 32) managedObjectContext];
  int v33 = [v32 hasChanges];

  if (!v33)
  {
    id v36 = v15;
LABEL_30:
    if (v17) {
      goto LABEL_37;
    }
    goto LABEL_35;
  }
  char v34 = [*(id *)(a1 + 32) managedObjectContext];
  id v49 = v15;
  int v35 = [v34 save:&v49];
  id v36 = v49;

  if (v35)
  {
    if (v17)
    {
      uint64_t v37 = PLImageManagerGetLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        uint64_t v38 = [*(id *)(a1 + 32) uuid];
        *(_DWORD *)CMTime buf = 138543362;
        v58 = v38;
        _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_INFO, "[key frame] successfully generated key frame for asset: %{public}@", buf, 0xCu);
      }
      [*(id *)(a1 + 56) addObject:*(void *)(a1 + 48)];
      goto LABEL_37;
    }
    goto LABEL_30;
  }
  id v39 = PLImageManagerGetLog();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    id v40 = [*(id *)(a1 + 32) uuid];
    *(_DWORD *)CMTime buf = 138543618;
    v58 = v40;
    __int16 v59 = 2112;
    id v60 = v36;
    _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "[key frame] failed to save key frame resource changes for asset: %{public}@, error: %@", buf, 0x16u);
  }
LABEL_35:
  if (!v36)
  {
    v41 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F8C520];
    uint64_t v54 = *MEMORY[0x1E4F28228];
    CMTimeScale v55 = @"unknown error";
    v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    id v36 = [v41 errorWithDomain:v42 code:1 userInfo:v43];
  }
LABEL_37:
  uint64_t v46 = a1 + 56;
  uint64_t v44 = *(void *)(a1 + 56);
  uint64_t v45 = *(void *)(v46 + 8);
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  (*(void (**)(uint64_t, void, id, uint64_t, id))(v45 + 16))(v45, 0, v36, v44, v47);
}

- (void)generateAndStoreForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 clientBundleID:(id)a5 progress:(id *)a6 completion:(id)a7
{
  BOOL v8 = a4;
  id v11 = a7;
  jobQueue = self->_jobQueue;
  id v13 = a5;
  id v14 = a3;
  id v15 = [v14 objectID];
  id v16 = [v14 assetID];

  int v17 = [v16 libraryID];
  id v21 = 0;
  LODWORD(v8) = [(PLLocalVideoKeyFrameJobQueue *)jobQueue addJobWithAssetObjectID:v15 networkAccessAllowed:v8 clientBundleID:v13 libraryID:v17 error:&v21 completionHandler:v11];

  id v18 = v21;
  if (v8)
  {
    [(PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe *)self _runNextJob];
  }
  else
  {
    BOOL v19 = [MEMORY[0x1E4F1CAD0] set];
    id v20 = [MEMORY[0x1E4F1CAA0] orderedSet];
    (*((void (**)(id, void, id, void *, void *, void))v11 + 2))(v11, 0, v18, v19, v20, 0);
  }
}

- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11
{
}

- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [PLVideoInternalResourceContext alloc];
  BOOL v8 = [v5 managedObjectContext];
  __int16 v9 = [(PLVideoInternalResourceContext *)v7 initWithManagedObjectContext:v8 asset:v5];

  id v10 = [[PLLocalVideoKeyFrameVideoChoosingOptions alloc] initWithStreamingAllowed:[(PLVideoInternalResourceContext *)v9 isWalrusEnabled] ^ 1];
  id v11 = [PLVideoChoosingAndAvailabilitySupport alloc];
  id v12 = -[PLVideoChoosingAndAvailabilitySupport initWithContext:assetInformation:options:size:](v11, "initWithContext:assetInformation:options:size:", v9, v9, v10, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  uint64_t v23 = 0;
  id v13 = [(PLVideoChoosingAndAvailabilitySupport *)v12 chooseResourceWithLoadingMode:&v23 needsAdjustmentData:0 error:0];
  if (v23 == 3)
  {
    id v18 = PLImageManagerGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      BOOL v19 = PLVideoResourceDescription(v13);
      *(_DWORD *)CMTime buf = 138543362;
      v25 = v19;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "[key frame] streaming video selected as ingredient for local video key frame : %{public}@", buf, 0xCu);
    }
    id v16 = [(PLVideoInternalResourceContext *)v9 backingResourceForVideoResource:v13];
    int v17 = @"streamingVideo";
    goto LABEL_9;
  }
  if (v23 == 5)
  {
    id v14 = PLImageManagerGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = PLVideoResourceDescription(v13);
      *(_DWORD *)CMTime buf = 138543362;
      v25 = v15;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "[key frame] local video selected as ingredient for local video key frame : %{public}@", buf, 0xCu);
    }
    id v16 = [(PLVideoInternalResourceContext *)v9 backingResourceForVideoResource:v13];
    int v17 = @"localVideo";
LABEL_9:
    [v6 setObject:v16 forKeyedSubscript:v17];
    goto LABEL_10;
  }
  id v16 = PLImageManagerGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)CMTime buf = 0;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "[key frame] no video result found for local key frame", buf, 2u);
  }
LABEL_10:

  if ([v6 count]) {
    id v20 = v6;
  }
  else {
    id v20 = 0;
  }
  id v21 = v20;

  return v21;
}

- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4
{
  return 0;
}

- (id)codecFourCharCodeName
{
  return 0;
}

- (unsigned)recipeID
{
  return 65749;
}

- (PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe)initWithRecipeID:(unsigned int)a3
{
  if (a3 == 65749)
  {
    v7.receiver = self;
    v7.super_class = (Class)PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe;
    v3 = [(PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe *)&v7 init];
    if (v3)
    {
      int v4 = objc_alloc_init(PLLocalVideoKeyFrameJobQueue);
      jobQueue = v3->_jobQueue;
      v3->_jobQueue = v4;
    }
  }
  else
  {

    return 0;
  }
  return v3;
}

+ (void)generateKeyFrameFromVideoURL:(id)a3 destinationURL:(id)a4 time:(id *)a5 completion:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = PLImageManagerGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    CMTime time = (CMTime)*a5;
    id v14 = (__CFString *)CMTimeCopyDescription(0, &time);
    LODWORD(time.value) = 138543618;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v14;
    LOWORD(time.flags) = 2112;
    *(void *)((char *)&time.flags + 2) = v10;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "[key frame] Image generator copying image at time: %{public}@ to destination: %@", (uint8_t *)&time, 0x16u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __114__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe_generateKeyFrameFromVideoURL_destinationURL_time_completion___block_invoke;
  v17[3] = &unk_1E586B9B0;
  id v18 = v10;
  id v19 = v11;
  CMTime time = (CMTime)*a5;
  id v15 = v11;
  id v16 = v10;
  [a1 generateKeyFrameFromVideoURL:v12 time:&time completion:v17];
}

void __114__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe_generateKeyFrameFromVideoURL_destinationURL_time_completion___block_invoke(uint64_t a1, CGImage *a2, void *a3)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    objc_super v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v8 = [*(id *)(a1 + 32) URLByDeletingLastPathComponent];
    id v25 = 0;
    int v9 = [v7 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v25];
    id v10 = v25;

    if (v9)
    {
      CFURLRef v11 = *(const __CFURL **)(a1 + 32);
      id v12 = [(id)*MEMORY[0x1E4F44410] identifier];
      id v13 = CGImageDestinationCreateWithURL(v11, v12, 1uLL, 0);

      if (v13)
      {
        CGImageDestinationAddImage(v13, a2, 0);
        if (CGImageDestinationFinalize(v13))
        {
          id v14 = PLImageManagerGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)CMTime buf = 0;
            _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "[key frame] wrote image to local video key frame", buf, 2u);
          }

          CFRelease(v13);
          goto LABEL_14;
        }
        id v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v20 = *MEMORY[0x1E4F8C500];
        uint64_t v30 = *MEMORY[0x1E4F28228];
        v31[0] = @"Failed to generate local video key frame, destination finalization failed";
        uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
        uint64_t v22 = [v19 errorWithDomain:v20 code:47001 userInfo:v21];

        CFRelease(v13);
        id v10 = (id)v22;
      }
      else
      {
        id v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = *MEMORY[0x1E4F8C500];
        uint64_t v28 = *MEMORY[0x1E4F28228];
        id v29 = @"Failed to generate local video key frame, failed to create image destination";
        int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        uint64_t v18 = [v15 errorWithDomain:v16 code:47001 userInfo:v17];

        id v10 = (id)v18;
      }
    }
  }
  else
  {
    id v10 = v5;
  }
  uint64_t v23 = PLImageManagerGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = [v10 debugDescription];
    *(_DWORD *)CMTime buf = 138543362;
    id v27 = v24;
    _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "[key frame] failed with error: %{public}@", buf, 0xCu);
  }
LABEL_14:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)generateKeyFrameFromVideoURL:(id)a3 time:(id *)a4 completion:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  BOOL v8 = [MEMORY[0x1E4F16330] assetWithURL:a3];
  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F16368]) initWithAsset:v8];
  [v9 setAppliesPreferredTrackTransform:1];
  long long v20 = *MEMORY[0x1E4F1FA48];
  long long v14 = v20;
  uint64_t v21 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  uint64_t v10 = v21;
  [v9 setRequestedTimeToleranceAfter:&v20];
  long long v18 = v14;
  uint64_t v19 = v10;
  [v9 setRequestedTimeToleranceBefore:&v18];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a4;
  CFURLRef v11 = [MEMORY[0x1E4F29238] valueWithCMTime:&v17];
  v22[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __99__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe_generateKeyFrameFromVideoURL_time_completion___block_invoke;
  v15[3] = &unk_1E586B988;
  id v16 = v7;
  id v13 = v7;
  [v9 generateCGImagesAsynchronouslyForTimes:v12 completionHandler:v15];
}

void __99__PLPrimaryResourceDataStoreLocalVideoKeyFrameRecipe_generateKeyFrameFromVideoURL_time_completion___block_invoke(uint64_t a1, uint64_t a2, CGImage *a3, uint64_t a4, uint64_t a5, void *a6)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  uint64_t v10 = v9;
  if (a5 == 1)
  {
    if (!v9)
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F8C500];
      uint64_t v21 = *MEMORY[0x1E4F28228];
      long long v18 = [NSString stringWithFormat:@"Image generator failed to generate image"];
      uint64_t v22 = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v11 = [v16 errorWithDomain:v17 code:47001 userInfo:v19];

      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!a5)
  {
    if (a3)
    {
      CGImageRetain(a3);
      PFCGImageApplyTemporaryAVAssetImageGeneratorColorSpaceWorkaround();
      goto LABEL_5;
    }
    if (!v9)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F8C500];
      uint64_t v23 = *MEMORY[0x1E4F28228];
      long long v14 = [NSString stringWithFormat:@"Image generator returned success but image is NULL"];
      v24[0] = v14;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      id v11 = [v12 errorWithDomain:v13 code:47001 userInfo:v15];

      goto LABEL_12;
    }
LABEL_11:
    id v11 = v9;
    goto LABEL_12;
  }
LABEL_5:
  id v11 = 0;
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  CGImageRelease(a3);
}

@end