@interface PXStoryPersistableRecipeSongResourceProducer
- (PXStoryPersistableRecipeSongResourceProducer)init;
- (PXStoryPersistableRecipeSongResourceProducer)initWithPersistableRecipe:(id)a3 configuration:(id)a4;
- (id)requestSongResourceWithOptions:(unint64_t)a3 resultHandler:(id)a4;
- (unint64_t)logContext;
- (void)_handleAppleMusicPlaybackStatus:(int64_t)a3 error:(id)a4 parentProgress:(id)a5 options:(unint64_t)a6 resultHandler:(id)a7;
- (void)_handlePersistedAudioAsset:(id)a3 isFinal:(BOOL)a4 error:(id)a5 options:(unint64_t)a6 resultHandler:(id)a7;
- (void)setLogContext:(unint64_t)a3;
@end

@implementation PXStoryPersistableRecipeSongResourceProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_persistableRecipe, 0);
}

- (void)setLogContext:(unint64_t)a3
{
  self->logContext = a3;
}

- (unint64_t)logContext
{
  return self->logContext;
}

- (void)_handlePersistedAudioAsset:(id)a3 isFinal:(BOOL)a4 error:(id)a5 options:(unint64_t)a6 resultHandler:(id)a7
{
  char v8 = a6;
  BOOL v10 = a4;
  id v22 = a3;
  id v11 = a5;
  v17 = (void (**)(id, void *))a7;
  if (!v22)
  {
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(15, v11, @"Converting persisted song asset to playable audio asset failed.", v12, v13, v14, v15, v16, v21);
    v18 = (PXStoryProducerResult *)objc_claimAutoreleasedReturnValue();
    v19 = [[PXStoryProducerResult alloc] initWithObject:0];
    v20 = [(PXStoryProducerResult *)v19 error:v18];
    v17[2](v17, v20);

LABEL_7:
    goto LABEL_8;
  }
  if (!v10)
  {
    if ((v8 & 6) != 0) {
      goto LABEL_9;
    }
    v18 = [[PXStoryProducerResult alloc] initWithObject:v22];
    v19 = [(PXStoryProducerResult *)v18 flags:1];
    v17[2](v17, v19);
    goto LABEL_7;
  }
  v18 = [[PXStoryProducerResult alloc] initWithObject:v22];
  v17[2](v17, v18);
LABEL_8:

LABEL_9:
}

- (void)_handleAppleMusicPlaybackStatus:(int64_t)a3 error:(id)a4 parentProgress:(id)a5 options:(unint64_t)a6 resultHandler:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, PXStoryProducerResult *))a7;
  uint64_t v15 = self->_persistableRecipe;
  uint64_t v16 = [(PFStoryRecipe *)v15 currentStyleSongAsset];
  v17 = v16;
  if (a3 == 1)
  {
LABEL_4:
    if (v17) {
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  id v18 = [(PXStoryProducerResult *)v16 catalog];
  int64_t v33 = a3;
  v19 = self;
  id v20 = v13;
  uint64_t v21 = v14;
  unint64_t v22 = a6;
  id v23 = v12;
  id v24 = (id)*MEMORY[0x1E4F8D298];
  if (v18 == v24)
  {

    a6 = v22;
    uint64_t v14 = v21;
    id v13 = v20;
    self = v19;
    a3 = v33;
  }
  else
  {
    v25 = v24;
    int v26 = [v18 isEqualToString:v24];

    id v12 = v23;
    a6 = v22;
    uint64_t v14 = v21;
    id v13 = v20;
    self = v19;
    a3 = v33;
    if (!v26) {
      goto LABEL_4;
    }
  }
  v27 = PLStoryGetLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v27, OS_LOG_TYPE_ERROR, "Found an Apple Music song persisted for the current style. However, Apple Music playback is disabled for the current user, so ignoring the persisted song.", buf, 2u);
  }

LABEL_10:
  v28 = PLStoryGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v28, OS_LOG_TYPE_INFO, "No playable persisted current song found. Falling back to seed songs", buf, 2u);
  }

  if (a3 == 1 && ![(PXStoryConfiguration *)self->_configuration shouldForceUsingFlexMusic])
  {
    v17 = [(PFStoryRecipe *)v15 seedSongAssetForCatalog:*MEMORY[0x1E4F8D298]];
    if (!v17)
    {
      v30 = PLStoryGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_INFO, "Apple Music is playable, but the persisted recipe does not contain an Apple Music seed song. Ignoring any flex music seed songs to allow curation to provide an Apple Music song if possible.", buf, 2u);
      }

      goto LABEL_23;
    }
  }
  else
  {
    -[PFStoryRecipe seedSongAssetForCatalog:](v15, "seedSongAssetForCatalog:", *MEMORY[0x1E4F8D2A0], v33);
    v17 = (PXStoryProducerResult *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
LABEL_23:
      v31 = PLStoryGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = [(PFStoryRecipe *)self->_persistableRecipe diagnosticDescription];
        *(_DWORD *)buf = 138543362;
        v38 = v32;
        _os_log_impl(&dword_1A9AE7000, v31, OS_LOG_TYPE_INFO, "No playable current style or seed song was found in persistable recipe: %{public}@", buf, 0xCu);
      }
      objc_msgSend(v13, "setCompletedUnitCount:", objc_msgSend(v13, "totalUnitCount"));
      v17 = [[PXStoryProducerResult alloc] initWithObject:0];
      v14[2](v14, v17);
      goto LABEL_26;
    }
  }
LABEL_17:
  objc_initWeak((id *)buf, self);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __123__PXStoryPersistableRecipeSongResourceProducer__handleAppleMusicPlaybackStatus_error_parentProgress_options_resultHandler___block_invoke;
  v34[3] = &unk_1E5DB65A0;
  objc_copyWeak(v36, (id *)buf);
  v36[1] = (id)a6;
  v35 = v14;
  v29 = +[PFStoryRecipe_PXStoryExtension requestAudioAssetFromRecipeAsset:v17 recipe:v15 resultHandler:v34];
  if (v29) {
    objc_msgSend(v13, "addChild:withPendingUnitCount:", v29, objc_msgSend(v13, "totalUnitCount"));
  }

  objc_destroyWeak(v36);
  objc_destroyWeak((id *)buf);
LABEL_26:
}

void __123__PXStoryPersistableRecipeSongResourceProducer__handleAppleMusicPlaybackStatus_error_parentProgress_options_resultHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v7 = (id *)(a1 + 40);
  id v8 = a4;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained _handlePersistedAudioAsset:v9 isFinal:a3 error:v8 options:*(void *)(a1 + 48) resultHandler:*(void *)(a1 + 32)];
}

- (id)requestSongResourceWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, PXStoryProducerResult *))a4;
  v7 = self->_persistableRecipe;
  id v8 = v7;
  if (!v7) {
    goto LABEL_8;
  }
  id v9 = [(PFStoryRecipe *)v7 seedSongIdentifiersByCatalog];
  if (![v9 count])
  {
    BOOL v10 = [(PFStoryRecipe *)v8 currentStyleSongAsset];

    if (v10) {
      goto LABEL_5;
    }
LABEL_8:
    v19 = PLStoryGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = [(PFStoryRecipe *)v8 diagnosticDescription];
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v20;
      _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_INFO, "Persistable recipe contains no song information: %{public}@", (uint8_t *)location, 0xCu);
    }
    uint64_t v21 = [[PXStoryProducerResult alloc] initWithObject:0];
    v6[2](v6, v21);

    goto LABEL_13;
  }

LABEL_5:
  id v11 = [(PFStoryRecipe *)self->_persistableRecipe currentStyle];
  id v12 = [v11 songAssetIdentifier];
  id v13 = (id)*MEMORY[0x1E4F8D290];
  if (v12 == v13)
  {
  }
  else
  {
    uint64_t v14 = v13;
    char v15 = [v12 isEqualToString:v13];

    if ((v15 & 1) == 0)
    {
      objc_initWeak(location, self);
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28F90]) initWithParent:0 userInfo:0];
      [v16 setTotalUnitCount:100];
      v17 = [(PXStoryConfiguration *)self->_configuration appleMusicStatusProvider];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __93__PXStoryPersistableRecipeSongResourceProducer_requestSongResourceWithOptions_resultHandler___block_invoke;
      v26[3] = &unk_1E5DCDDD0;
      objc_copyWeak(v29, location);
      id v18 = v16;
      id v27 = v18;
      v29[1] = (id)a3;
      v28 = v6;
      [v17 requestStatusForCapability:1 handler:v26];

      objc_destroyWeak(v29);
      objc_destroyWeak(location);
      goto LABEL_14;
    }
  }
  unint64_t v22 = [PXStoryProducerResult alloc];
  id v23 = objc_alloc_init(PXStoryNullSongResource);
  id v24 = [(PXStoryProducerResult *)v22 initWithObject:v23];
  v6[2](v6, v24);

LABEL_13:
  id v18 = 0;
LABEL_14:

  return v18;
}

void __93__PXStoryPersistableRecipeSongResourceProducer_requestSongResourceWithOptions_resultHandler___block_invoke(void *a1, uint64_t a2, void *a3)
{
  v5 = (id *)(a1 + 6);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleAppleMusicPlaybackStatus:a2 error:v6 parentProgress:a1[4] options:a1[7] resultHandler:a1[5]];
}

- (PXStoryPersistableRecipeSongResourceProducer)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPersistableRecipeSongResourceProducer.m", 39, @"%s is not available as initializer", "-[PXStoryPersistableRecipeSongResourceProducer init]");

  abort();
}

- (PXStoryPersistableRecipeSongResourceProducer)initWithPersistableRecipe:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryPersistableRecipeSongResourceProducer;
  id v9 = [(PXStoryPersistableRecipeSongResourceProducer *)&v12 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistableRecipe, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
  }

  return v10;
}

@end