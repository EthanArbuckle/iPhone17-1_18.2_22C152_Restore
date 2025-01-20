@interface PXSystemAVAudioSessionController
+ (OS_dispatch_queue)audioSessionQueue;
+ (OS_os_log)log;
+ (PXSystemAVAudioSessionController)applicationAVAudioSessionController;
- (NSString)name;
- (PXAVAudioSession)audioSession;
- (PXSystemAVAudioSessionController)init;
- (PXSystemAVAudioSessionController)initWithName:(id)a3 audioSession:(id)a4;
- (id)description;
- (int64_t)currentCategory;
- (unint64_t)signpostID;
- (void)_audioSessionQueue_applyCategory:(int64_t)a3 completion:(id)a4;
- (void)_audioSessionQueue_applyExistingCategoryToAudioSessionIfNeeded;
- (void)_audioSessionQueue_setAudioSession:(id)a3;
- (void)applyCategory:(int64_t)a3 completion:(id)a4;
- (void)resourceReclamationEventDidOccur:(id)a3;
- (void)setCurrentCategory:(int64_t)a3;
@end

@implementation PXSystemAVAudioSessionController

void __61__PXSystemAVAudioSessionController_applyCategory_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_audioSessionQueue_applyCategory:completion:", *(void *)(a1 + 48), *(void *)(a1 + 32));
}

+ (PXSystemAVAudioSessionController)applicationAVAudioSessionController
{
  if (applicationAVAudioSessionController_onceToken != -1) {
    dispatch_once(&applicationAVAudioSessionController_onceToken, &__block_literal_global);
  }
  v2 = (void *)applicationAVAudioSessionController_controller;
  return (PXSystemAVAudioSessionController *)v2;
}

void __53__PXSystemAVAudioSessionController_audioSessionQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, -15);

  dispatch_queue_t v1 = dispatch_queue_create("PXSystemAVAudioSessionController", attr);
  v2 = (void *)audioSessionQueue_queue;
  audioSessionQueue_queue = (uint64_t)v1;
}

void __71__PXSystemAVAudioSessionController_applicationAVAudioSessionController__block_invoke()
{
  v0 = [PXSystemAVAudioSessionController alloc];
  id v3 = [MEMORY[0x263EF93E0] sharedInstance];
  uint64_t v1 = [(PXSystemAVAudioSessionController *)v0 initWithName:@"Application Audio Session" audioSession:v3];
  v2 = (void *)applicationAVAudioSessionController_controller;
  applicationAVAudioSessionController_controller = v1;
}

- (PXSystemAVAudioSessionController)initWithName:(id)a3 audioSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXSystemAVAudioSessionController;
  v8 = [(PXSystemAVAudioSessionController *)&v15 init];
  if (v8)
  {
    v9 = [(id)objc_opt_class() log];
    v8->_signpostID = os_signpost_id_generate(v9);

    v8->_category = [v7 photosAudioSessionCategory];
    v8->_categoryLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_audioSession, a4);
    uint64_t v10 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v10;

    v12 = objc_alloc_init(PXSystemAVResourceReclamationController);
    reclamationController = v8->_reclamationController;
    v8->_reclamationController = v12;

    [(PXConcreteAVResourceReclamationController *)v8->_reclamationController registerObserver:v8];
  }

  return v8;
}

- (void)_audioSessionQueue_applyCategory:(int64_t)a3 completion:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, uint64_t, void *))a4;
  id v7 = [(id)objc_opt_class() audioSessionQueue];
  dispatch_assert_queue_V2(v7);

  v8 = [(PXSystemAVAudioSessionController *)self audioSession];
  uint64_t v9 = [v8 photosAudioSessionCategory];
  uint64_t v10 = [(id)objc_opt_class() log];
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9 == a3)
  {
    if (v11)
    {
      unint64_t v12 = [(PXSystemAVAudioSessionController *)self currentCategory];
      if (v12 > 2) {
        v13 = @"??";
      }
      else {
        v13 = off_265454F18[v12];
      }
      v16 = v13;
      *(_DWORD *)buf = 138412802;
      v41 = self;
      __int16 v42 = 2112;
      v43 = (PXSystemAVAudioSessionController *)v16;
      __int16 v44 = 2112;
      v45 = v8;
      _os_log_impl(&dword_259972000, v10, OS_LOG_TYPE_INFO, "%@ declining to apply existing category %@ to session %@.", buf, 0x20u);
    }
    v17 = 0;
    id v18 = 0;
    goto LABEL_32;
  }
  if (v11)
  {
    unint64_t v14 = [(PXSystemAVAudioSessionController *)self currentCategory];
    if (v14 > 2) {
      objc_super v15 = @"??";
    }
    else {
      objc_super v15 = off_265454F18[v14];
    }
    v19 = v15;
    *(_DWORD *)buf = 138412802;
    v41 = self;
    __int16 v42 = 2112;
    v43 = (PXSystemAVAudioSessionController *)v19;
    __int16 v44 = 2112;
    v45 = v8;
    _os_log_impl(&dword_259972000, v10, OS_LOG_TYPE_INFO, "%@ applying category %@ to session %@.", buf, 0x20u);
  }
  v20 = [(id)objc_opt_class() log];
  unint64_t v21 = [(PXSystemAVAudioSessionController *)self signpostID];
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v22 = v21;
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259972000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v22, "SetAudioSessionCategory", "", buf, 2u);
    }
  }

  id v37 = 0;
  uint64_t v23 = [v8 setPhotosAudioSessionCategory:a3 error:&v37];
  id v18 = v37;
  v24 = [(id)objc_opt_class() log];
  unint64_t v25 = [(PXSystemAVAudioSessionController *)self signpostID];
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v26 = v25;
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259972000, v24, OS_SIGNPOST_INTERVAL_END, v26, "SetAudioSessionCategory", "", buf, 2u);
    }
  }

  if (v23)
  {
    v27 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)a3 > 2) {
        v28 = @"??";
      }
      else {
        v28 = off_265454F18[a3];
      }
      v34 = v28;
      *(_DWORD *)buf = 138412546;
      v41 = (PXSystemAVAudioSessionController *)v34;
      __int16 v42 = 2112;
      v43 = self;
      _os_log_impl(&dword_259972000, v27, OS_LOG_TYPE_INFO, "Successfully configured audio session category %@ for session controller %@", buf, 0x16u);
    }
    [(PXSystemAVAudioSessionController *)self setCurrentCategory:a3];
    v17 = 0;
    if (v6) {
LABEL_31:
    }
      v6[2](v6, v23, v17);
  }
  else
  {
    v38 = @"PXAVAudioSessionControllerErrorCategory";
    v29 = [NSNumber numberWithInteger:a3];
    v39 = v29;
    v30 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];

    if (v18)
    {
      v31 = (void *)[v30 mutableCopy];
      [v31 setObject:v18 forKeyedSubscript:*MEMORY[0x263F08608]];
      uint64_t v32 = [v31 copy];

      v30 = (void *)v32;
    }
    v17 = [MEMORY[0x263F087E8] errorWithDomain:@"PXAVAudioSessionControllerError" code:2 userInfo:v30];
    v33 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      if ((unint64_t)a3 > 2) {
        v35 = @"??";
      }
      else {
        v35 = off_265454F18[a3];
      }
      v36 = v35;
      *(_DWORD *)buf = 138412802;
      v41 = (PXSystemAVAudioSessionController *)v36;
      __int16 v42 = 2112;
      v43 = self;
      __int16 v44 = 2112;
      v45 = v17;
      _os_log_error_impl(&dword_259972000, v33, OS_LOG_TYPE_ERROR, "Failed to configure audio session category %@ for session controller %@. Error: %@", buf, 0x20u);
    }
    if (v6) {
      goto LABEL_31;
    }
  }
LABEL_32:
}

+ (OS_os_log)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)log_log;
  return (OS_os_log *)v2;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)setCurrentCategory:(int64_t)a3
{
  p_categoryLock = &self->_categoryLock;
  os_unfair_lock_lock(&self->_categoryLock);
  self->_category = a3;
  os_unfair_lock_unlock(p_categoryLock);
}

- (int64_t)currentCategory
{
  p_categoryLock = &self->_categoryLock;
  os_unfair_lock_lock(&self->_categoryLock);
  int64_t category = self->_category;
  os_unfair_lock_unlock(p_categoryLock);
  return category;
}

- (PXAVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)applyCategory:(int64_t)a3 completion:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3)
  {
    objc_initWeak(&location, self);
    id v7 = [(id)objc_opt_class() audioSessionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__PXSystemAVAudioSessionController_applyCategory_completion___block_invoke;
    block[3] = &unk_265454FE8;
    objc_copyWeak(v14, &location);
    v14[1] = (id)a3;
    id v13 = v6;
    dispatch_async(v7, block);

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = (void *)MEMORY[0x263F087E8];
    v16 = @"PXAVAudioSessionControllerErrorCategory";
    uint64_t v9 = [NSNumber numberWithInteger:0];
    v17[0] = v9;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    BOOL v11 = [v8 errorWithDomain:@"PXAVAudioSessionControllerError" code:1 userInfo:v10];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v11);
  }
}

+ (OS_dispatch_queue)audioSessionQueue
{
  if (audioSessionQueue_onceToken != -1) {
    dispatch_once(&audioSessionQueue_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)audioSessionQueue_queue;
  return (OS_dispatch_queue *)v2;
}

uint64_t __39__PXSystemAVAudioSessionController_log__block_invoke()
{
  log_log = (uint64_t)os_log_create("PhotosMediaFoundation", "PXSystemAVAudioSessionController");
  return MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_reclamationController, 0);
}

- (void)_audioSessionQueue_setAudioSession:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)_audioSessionQueue_applyExistingCategoryToAudioSessionIfNeeded
{
  id v3 = [(id)objc_opt_class() audioSessionQueue];
  dispatch_assert_queue_V2(v3);

  int64_t v4 = [(PXSystemAVAudioSessionController *)self currentCategory];
  if (v4)
  {
    [(PXSystemAVAudioSessionController *)self _audioSessionQueue_applyCategory:v4 completion:0];
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  int64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(PXSystemAVAudioSessionController *)self name];
  id v7 = (void *)[v3 initWithFormat:@"<%@ %p: %@>", v5, self, v6];

  return v7;
}

- (void)resourceReclamationEventDidOccur:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(id)objc_opt_class() audioSessionQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__PXSystemAVAudioSessionController_resourceReclamationEventDidOccur___block_invoke;
  v6[3] = &unk_265455010;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __69__PXSystemAVAudioSessionController_resourceReclamationEventDidOccur___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_audioSessionQueue_applyExistingCategoryToAudioSessionIfNeeded");
}

- (PXSystemAVAudioSessionController)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSystemAVAudioSessionController.m", 75, @"%s is not available as initializer", "-[PXSystemAVAudioSessionController init]");

  abort();
}

@end