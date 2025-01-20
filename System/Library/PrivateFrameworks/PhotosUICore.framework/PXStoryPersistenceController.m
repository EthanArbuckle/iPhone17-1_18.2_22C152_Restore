@interface PXStoryPersistenceController
- (BOOL)isActive;
- (BOOL)persisted;
- (NSError)error;
- (NSProgress)writerProgress;
- (PFStoryRecipe)persistableRecipe;
- (PXStoryConfiguration)configuration;
- (PXStoryErrorReporter)errorReporter;
- (PXStoryModel)model;
- (PXStoryPersistableRecipeManager)persistableRecipeManager;
- (PXStoryPersistableRecipeWriter)writer;
- (PXStoryPersistenceController)initWithModel:(id)a3;
- (PXStoryPersistenceController)initWithObservableModel:(id)a3;
- (PXStoryRecipeAssetEdits)recipeAssetEdits;
- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4;
- (void)_ensureWriter;
- (void)_handleWriteSuccess:(BOOL)a3 createdAssetCollection:(id)a4 error:(id)a5 forPersistableRecipe:(id)a6 recipeAssetEdits:(id)a7;
- (void)_invalidatePersistableRecipe;
- (void)_invalidatePersistableRecipeManager;
- (void)_invalidateRecipeAssetEdits;
- (void)_invalidateWrite;
- (void)_updatePersistableRecipe;
- (void)_updatePersistableRecipeManager;
- (void)_updateRecipeAssetEdits;
- (void)_updateWrite;
- (void)configureUpdater:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setConfiguration:(id)a3;
- (void)setError:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setPersistableRecipe:(id)a3;
- (void)setPersistableRecipeManager:(id)a3;
- (void)setPersisted:(BOOL)a3;
- (void)setRecipeAssetEdits:(id)a3;
- (void)setWriterProgress:(id)a3;
@end

@implementation PXStoryPersistenceController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_writerProgress, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_recipeAssetEdits, 0);
  objc_storeStrong((id *)&self->_persistableRecipe, 0);
  objc_storeStrong((id *)&self->_persistableRecipeManager, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_model);
}

- (NSError)error
{
  return self->_error;
}

- (void)setPersisted:(BOOL)a3
{
  self->_persisted = a3;
}

- (BOOL)persisted
{
  return self->_persisted;
}

- (NSProgress)writerProgress
{
  return self->_writerProgress;
}

- (PXStoryPersistableRecipeWriter)writer
{
  return self->_writer;
}

- (PXStoryRecipeAssetEdits)recipeAssetEdits
{
  return self->_recipeAssetEdits;
}

- (PFStoryRecipe)persistableRecipe
{
  return self->_persistableRecipe;
}

- (PXStoryPersistableRecipeManager)persistableRecipeManager
{
  return self->_persistableRecipeManager;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (PXStoryConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PXStoryModel)model
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  return (PXStoryModel *)WeakRetained;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  v5 = [(PXStoryPersistenceController *)self error];
  [v4 setObject:v5 forKeyedSubscript:@"Persistence"];

  v6 = (void *)[v4 copy];
  return v6;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([(PXStoryPersistenceController *)self persisted])
  {
    v6 = @"✅ Changes saved successfully\n";
LABEL_5:
    [v5 appendString:v6];
    goto LABEL_6;
  }
  v7 = [(PXStoryPersistenceController *)self writerProgress];

  if (v7)
  {
    v6 = @"Writing…\n";
    goto LABEL_5;
  }
  v17 = [(PXStoryPersistenceController *)self error];

  if (v17)
  {
    v18 = [(PXStoryPersistenceController *)self error];
    [v5 appendFormat:@"❌ Changes failed to be saved: %@\n", v18];
  }
  else
  {
    if (![(PXStoryPersistenceController *)self isActive])
    {
      v6 = @"⚠️ Inactive";
      goto LABEL_5;
    }
    v19 = [(PXStoryPersistenceController *)self persistableRecipeManager];
    char v20 = [v19 isReadyToProducePersistableRecipe];

    if (v20)
    {
      v21 = [(PXStoryPersistenceController *)self persistableRecipeManager];
      int v22 = [v21 isProducingPersistableRecipe];

      if (v22)
      {
        v6 = @"🔳 Producing persistable recipe…\n";
        goto LABEL_5;
      }
      v24 = [(PXStoryPersistenceController *)self persistableRecipeManager];
      v25 = [v24 error];

      if (!v25)
      {
        v26 = [(PXStoryPersistenceController *)self persistableRecipe];

        if (v26) {
          v6 = @"❌ Unexpected state\n";
        }
        else {
          v6 = @"🔳 No changes to save\n";
        }
        goto LABEL_5;
      }
      v18 = [(PXStoryPersistenceController *)self persistableRecipeManager];
      v23 = [v18 error];
      [v5 appendFormat:@"❌ Persistabled recipe failed to be produced: %@\n", v23];
    }
    else
    {
      [v5 appendString:@"⚠️ Waiting…\n"];
      v18 = [(PXStoryPersistenceController *)self persistableRecipeManager];
      v23 = [v18 diagnosticDescription];
      [v5 appendFormat:@"%@\n", v23];
    }
  }
LABEL_6:
  v8 = [(PXStoryPersistenceController *)self writer];

  if (v8)
  {
    v9 = [(PXStoryPersistenceController *)self writer];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v5 appendFormat:@"Writer: %@\n", v11];
  }
  v12 = [(PXStoryPersistenceController *)self persistableRecipeManager];

  if (v12)
  {
    v13 = [(PXStoryPersistenceController *)self persistableRecipeManager];
    v14 = [v13 diagnosticDescription];
    [v5 appendFormat:@"Manager: %@\n", v14];
  }
  v15 = (void *)[v5 copy];

  return v15;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)PersistableRecipeManagerObservationContext == a5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__PXStoryPersistenceController_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E5DB4620;
    v12[4] = self;
    v12[5] = a4;
    v9 = v12;
    goto LABEL_7;
  }
  if ((void *)StoryModelObservationContext == a5)
  {
    if ((a4 & 0x2000000000) == 0) {
      goto LABEL_8;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__PXStoryPersistenceController_observable_didChange_context___block_invoke_2;
    v11[3] = &unk_1E5DB45F8;
    v11[4] = self;
    v9 = v11;
LABEL_7:
    [(PXStoryController *)self performChanges:v9];
    goto LABEL_8;
  }
  v10.receiver = self;
  v10.super_class = (Class)PXStoryPersistenceController;
  [(PXStoryController *)&v10 observable:v8 didChange:a4 context:a5];
LABEL_8:
}

void __61__PXStoryPersistenceController_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 4) != 0)
  {
    [*(id *)(a1 + 32) _invalidatePersistableRecipe];
    uint64_t v3 = *(void *)(a1 + 40);
  }
  if ((v3 & 8) != 0) {
    [*(id *)(a1 + 32) _invalidateRecipeAssetEdits];
  }
}

void __61__PXStoryPersistenceController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) model];
  v2 = [v3 configuration];
  [*(id *)(a1 + 32) setConfiguration:v2];
}

- (void)_handleWriteSuccess:(BOOL)a3 createdAssetCollection:(id)a4 error:(id)a5 forPersistableRecipe:(id)a6 recipeAssetEdits:(id)a7
{
  BOOL v10 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v10)
  {
    id v16 = 0;
  }
  else
  {
    v17 = PLStoryGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v13;
      _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_ERROR, "Recipe failed to be written: %@", buf, 0xCu);
    }

    v18 = [(PXStoryPersistenceController *)self model];
    [v18 reportPersistenceFailureWithError:v13];

    id v16 = v13;
  }
  [(PXStoryPersistenceController *)self setPersisted:v10];
  [(PXStoryPersistenceController *)self setError:v16];
  [(PXStoryPersistenceController *)self setWriterProgress:0];
  if (v12)
  {
    id v19 = [(PXStoryPersistenceController *)self persistableRecipe];
    if (v19 == v14)
    {
    }
    else
    {
      char v20 = v19;
      char v21 = [v14 isEqual:v19];

      if ((v21 & 1) == 0) {
        PXAssertGetLog();
      }
    }
    id v22 = [(PXStoryPersistenceController *)self recipeAssetEdits];
    if (v22 == v15)
    {
    }
    else
    {
      v23 = v22;
      char v24 = [v15 isEqual:v22];

      if ((v24 & 1) == 0) {
        PXAssertGetLog();
      }
    }
    v25 = [(PXStoryPersistenceController *)self model];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __119__PXStoryPersistenceController__handleWriteSuccess_createdAssetCollection_error_forPersistableRecipe_recipeAssetEdits___block_invoke;
    v37[3] = &unk_1E5DCEE38;
    id v38 = v12;
    [v25 performChanges:v37];
  }
  if (v15 && v10)
  {
    v26 = [(PXStoryPersistenceController *)self model];
    v27 = [v26 recipeManager];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __119__PXStoryPersistenceController__handleWriteSuccess_createdAssetCollection_error_forPersistableRecipe_recipeAssetEdits___block_invoke_2;
    v35[3] = &unk_1E5DC1548;
    id v36 = v15;
    [v27 performChanges:v35];
  }
  id v28 = [(PXStoryPersistenceController *)self persistableRecipe];
  if (v28 == v14)
  {
  }
  else
  {
    char v29 = [v14 isEqual:v28];

    if ((v29 & 1) == 0)
    {

LABEL_25:
      v33 = PLStoryGetLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v33, OS_LOG_TYPE_DEBUG, "Recipe was updated while writing, writing again…", buf, 2u);
      }

      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __119__PXStoryPersistenceController__handleWriteSuccess_createdAssetCollection_error_forPersistableRecipe_recipeAssetEdits___block_invoke_26;
      v34[3] = &unk_1E5DB45F8;
      v34[4] = self;
      [(PXStoryController *)self performChanges:v34];
      goto LABEL_29;
    }
  }
  id v30 = [(PXStoryPersistenceController *)self recipeAssetEdits];
  if (v30 == v15)
  {

    goto LABEL_29;
  }
  v31 = v30;
  char v32 = [v15 isEqual:v30];

  if ((v32 & 1) == 0) {
    goto LABEL_25;
  }
LABEL_29:
}

uint64_t __119__PXStoryPersistenceController__handleWriteSuccess_createdAssetCollection_error_forPersistableRecipe_recipeAssetEdits___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reconfigureWithAssetCollection:*(void *)(a1 + 32)];
}

uint64_t __119__PXStoryPersistenceController__handleWriteSuccess_createdAssetCollection_error_forPersistableRecipe_recipeAssetEdits___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 didPersistRecipeAssetEdits:*(void *)(a1 + 32)];
}

uint64_t __119__PXStoryPersistenceController__handleWriteSuccess_createdAssetCollection_error_forPersistableRecipe_recipeAssetEdits___block_invoke_26(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWrite];
}

- (void)_updateWrite
{
  id v3 = [(PXStoryPersistenceController *)self writerProgress];

  if (!v3)
  {
    uint64_t v4 = [(PXStoryPersistenceController *)self persistableRecipe];
    id v5 = [(PXStoryPersistenceController *)self recipeAssetEdits];
    v6 = [(PXStoryPersistenceController *)self model];
    v7 = [v6 undoManager];

    [(PXStoryPersistenceController *)self setPersisted:0];
    if (v4)
    {
      id v8 = PLStoryGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "Writing recipe…", (uint8_t *)buf, 2u);
      }

      [(PXStoryPersistenceController *)self _ensureWriter];
      objc_initWeak(buf, self);
      v9 = [(PXStoryPersistenceController *)self log];
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);
      v11 = v9;
      id v12 = v11;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_WORD *)id v13 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "StoryRecipeWrite", "", v13, 2u);
      }

      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      [(PXStoryController *)self storyQueue];
      objc_claimAutoreleasedReturnValue();
      PXSyncCallbackBegin();
    }
    [(PXStoryPersistenceController *)self setWriterProgress:0];
  }
}

void __44__PXStoryPersistenceController__updateWrite__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = *(id *)(a1 + 32);
  os_signpost_id_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 72);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_END, v11, "StoryRecipeWrite", "", buf, 2u);
  }

  id v12 = PLStoryGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v14 = v13 - *(double *)(a1 + 80);
    *(_DWORD *)buf = 134218498;
    double v16 = v14;
    __int16 v17 = 1024;
    int v18 = a2;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEBUG, "Recipe written in %0.3fs with success: %i error: %@", buf, 0x1Cu);
  }

  PXIsSyncCallback();
}

void __44__PXStoryPersistenceController__updateWrite__block_invoke_22(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _handleWriteSuccess:*(unsigned __int8 *)(a1 + 72) createdAssetCollection:*(void *)(a1 + 32) error:*(void *)(a1 + 40) forPersistableRecipe:*(void *)(a1 + 48) recipeAssetEdits:*(void *)(a1 + 56)];
}

- (void)_invalidateWrite
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateWrite];
}

- (void)_updateRecipeAssetEdits
{
  id v4 = [(PXStoryPersistenceController *)self persistableRecipeManager];
  id v3 = [v4 recipeAssetEdits];
  [(PXStoryPersistenceController *)self setRecipeAssetEdits:v3];
}

- (void)_invalidateRecipeAssetEdits
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateRecipeAssetEdits];
}

- (void)_updatePersistableRecipe
{
  id v4 = [(PXStoryPersistenceController *)self persistableRecipeManager];
  id v3 = [v4 persistableRecipe];
  [(PXStoryPersistenceController *)self setPersistableRecipe:v3];
}

- (void)_invalidatePersistableRecipe
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePersistableRecipe];
}

- (void)_updatePersistableRecipeManager
{
  id v8 = [(PXStoryPersistenceController *)self model];
  id v3 = [(PXStoryPersistenceController *)self persistableRecipeManager];
  if (!v3)
  {
    id v4 = [v8 configuration];
    char v5 = [v4 isAppleMusicPreview];

    if (v5) {
      goto LABEL_5;
    }
    v6 = [PXStoryPersistableRecipeManager alloc];
    id v3 = [v8 styleManager];
    id v7 = [(PXStoryPersistableRecipeManager *)v6 initWithModel:v8 styleManager:v3];
    [(PXStoryPersistenceController *)self setPersistableRecipeManager:v7];
  }
LABEL_5:
}

- (void)_invalidatePersistableRecipeManager
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePersistableRecipeManager];
}

- (void)setError:(id)a3
{
  id v8 = (NSError *)a3;
  char v5 = self->_error;
  v6 = v8;
  if (v5 != v8)
  {
    char v7 = [(NSError *)v8 isEqual:v5];

    if (v7) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_error, a3);
    v6 = [(PXStoryPersistenceController *)self errorReporter];
    [v6 setError:self->_error forComponent:@"Persistence"];
  }

LABEL_5:
}

- (void)setWriterProgress:(id)a3
{
  char v5 = (NSProgress *)a3;
  p_writerProgress = &self->_writerProgress;
  if (*p_writerProgress != v5)
  {
    char v7 = v5;
    [(NSProgress *)*p_writerProgress cancel];
    objc_storeStrong((id *)p_writerProgress, a3);
    char v5 = v7;
  }
}

- (void)_ensureWriter
{
  if (!self->_writer)
  {
    id v5 = [(PXStoryPersistenceController *)self configuration];
    id v3 = +[PXStoryPersistableRecipeWriterFactory defaultPersistableRecipeWriterForConfiguration:v5];
    writer = self->_writer;
    self->_writer = v3;
  }
}

- (void)setRecipeAssetEdits:(id)a3
{
  id v8 = (PXStoryRecipeAssetEdits *)a3;
  id v5 = self->_recipeAssetEdits;
  if (v5 == v8)
  {
  }
  else
  {
    v6 = v5;
    BOOL v7 = [(PXStoryRecipeAssetEdits *)v5 isEqual:v8];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_recipeAssetEdits, a3);
      [(PXStoryPersistenceController *)self _invalidateWrite];
    }
  }
}

- (void)setPersistableRecipe:(id)a3
{
  id v5 = (PFStoryRecipe *)a3;
  v6 = v5;
  if (self->_persistableRecipe != v5)
  {
    id v8 = v5;
    char v7 = -[PFStoryRecipe isEqualToRecipe:](v5, "isEqualToRecipe:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_persistableRecipe, a3);
      [(PXStoryPersistenceController *)self _invalidateWrite];
      v6 = v8;
    }
  }
}

- (void)setPersistableRecipeManager:(id)a3
{
  id v5 = (PXStoryPersistableRecipeManager *)a3;
  persistableRecipeManager = self->_persistableRecipeManager;
  if (persistableRecipeManager != v5)
  {
    char v7 = v5;
    [(PXStoryPersistableRecipeManager *)persistableRecipeManager unregisterChangeObserver:self context:PersistableRecipeManagerObservationContext];
    objc_storeStrong((id *)&self->_persistableRecipeManager, a3);
    [(PXStoryPersistableRecipeManager *)self->_persistableRecipeManager registerChangeObserver:self context:PersistableRecipeManagerObservationContext];
    [(PXStoryPersistenceController *)self _invalidatePersistableRecipe];
    [(PXStoryPersistenceController *)self _invalidateRecipeAssetEdits];
    id v5 = v7;
  }
}

- (void)setConfiguration:(id)a3
{
  id v8 = (PXStoryConfiguration *)a3;
  id v5 = self->_configuration;
  writer = (PXStoryPersistableRecipeWriter *)v8;
  if (v5 != v8)
  {
    char v7 = [(PXStoryConfiguration *)v5 isEqual:v8];

    if (v7) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_configuration, a3);
    writer = self->_writer;
    self->_writer = 0;
  }

LABEL_5:
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    [(PXStoryPersistenceController *)self _invalidatePersistableRecipeManager];
  }
}

- (void)configureUpdater:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryPersistenceController;
  id v3 = a3;
  [(PXStoryController *)&v4 configureUpdater:v3];
  objc_msgSend(v3, "addUpdateSelector:", sel__updatePersistableRecipeManager, v4.receiver, v4.super_class);
  [v3 addUpdateSelector:sel__updatePersistableRecipe];
  [v3 addUpdateSelector:sel__updateRecipeAssetEdits];
  [v3 addUpdateSelector:sel__updateWrite];
}

- (PXStoryPersistenceController)initWithModel:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryPersistenceController;
  id v5 = [(PXStoryController *)&v19 initWithObservableModel:v4];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_model, v4);
    [v4 registerChangeObserver:v6 context:StoryModelObservationContext];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_model);
    uint64_t v8 = [WeakRetained configuration];
    configuration = v6->_configuration;
    v6->_configuration = (PXStoryConfiguration *)v8;

    uint64_t v10 = [(PXStoryConfiguration *)v6->_configuration errorReporter];
    errorReporter = v6->_errorReporter;
    v6->_errorReporter = (PXStoryErrorReporter *)v10;

    id v12 = objc_loadWeakRetained((id *)&v6->_model);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __46__PXStoryPersistenceController_initWithModel___block_invoke;
    v17[3] = &unk_1E5DCEE38;
    double v13 = v6;
    int v18 = v13;
    [v12 performChanges:v17];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__PXStoryPersistenceController_initWithModel___block_invoke_2;
    v15[3] = &unk_1E5DD0FA8;
    double v16 = v13;
    [(PXStoryController *)v16 performChanges:v15];
  }
  return v6;
}

uint64_t __46__PXStoryPersistenceController_initWithModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDiagnosticHUDContentProvider:*(void *)(a1 + 32) forType:13];
}

uint64_t __46__PXStoryPersistenceController_initWithModel___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidatePersistableRecipeManager];
}

- (PXStoryPersistenceController)initWithObservableModel:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPersistenceController.m", 46, @"%s is not available as initializer", "-[PXStoryPersistenceController initWithObservableModel:]");

  abort();
}

@end