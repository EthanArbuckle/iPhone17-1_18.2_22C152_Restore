@interface VOSCommandManager
- (BOOL)_validateUserProfileDiscrepancies:(id)a3;
- (BOOL)activeProfileIsUserProfile;
- (BOOL)commandHasAnyBindings:(id)a3 withResolver:(id)a4;
- (BOOL)commandHasModifiedBindingsWhenZoomEnabled:(id)a3 withResolver:(id)a4;
- (BOOL)loadShortcuts;
- (NSString)debugDescription;
- (VOSCommandManager)initWithSystemProfile;
- (VOSCommandProfile)activeProfile;
- (id)addGesture:(id)a3 toCommand:(id)a4 withResolver:(id)a5;
- (id)addKeyChord:(id)a3 toCommand:(id)a4 withResolver:(id)a5;
- (id)allCommandsWithResolver:(id)a3;
- (id)allShortcutBindingsWithResolver:(id)a3;
- (id)allSiriShortcutCommandsWithResolver:(id)a3;
- (id)availableSiriShortcuts:(id)a3;
- (id)commandForKeyChord:(id)a3 withResolver:(id)a4;
- (id)commandForTouchGesture:(id)a3 withResolver:(id)a4;
- (id)gestureBindingsForCommand:(id)a3 withResolver:(id)a4;
- (id)initPreferringUserProfile;
- (id)initPreferringUserProfileWithoutShortcuts;
- (id)removeGesture:(id)a3 fromCommand:(id)a4 withResolver:(id)a5;
- (id)removeKeyChord:(id)a3 fromCommand:(id)a4 withResolver:(id)a5;
- (id)shortcutBindingsForCommand:(id)a3 withResolver:(id)a4;
- (id)systemProfile;
- (id)userPresentableAllShortcutBindingsWithResolver:(id)a3;
- (id)validateCanAddGesture:(id)a3 toCommand:(id)a4 withResolver:(id)a5;
- (id)validateCanAddKeyChord:(id)a3 toCommand:(id)a4 withResolver:(id)a5;
- (id)validateCanRemoveGesture:(id)a3 fromCommand:(id)a4 withResolver:(id)a5;
- (id)validateCanRemoveKeyChord:(id)a3 fromCommand:(id)a4 withResolver:(id)a5;
- (unint64_t)availabilityForCommand:(id)a3 withResolver:(id)a4;
- (unint64_t)availabilityForGesture:(id)a3 withResolver:(id)a4;
- (unint64_t)availabilityForShortcut:(id)a3 withResolver:(id)a4;
- (void)_commonInit;
- (void)_commonUserProfileInit;
- (void)_loadSystemProfile;
- (void)batchUpdateActiveProfile:(id)a3 saveIfSuccessful:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)reloadPreferringUserProfile;
- (void)reloadWithSystemProfile;
- (void)restoreDefaultProfile;
- (void)saveAsUserProfile;
- (void)setActiveProfileIsUserProfile:(BOOL)a3;
- (void)setLoadShortcuts:(BOOL)a3;
@end

@implementation VOSCommandManager

- (VOSCommandManager)initWithSystemProfile
{
  v14.receiver = self;
  v14.super_class = (Class)VOSCommandManager;
  v2 = [(VOSCommandManager *)&v14 init];
  v3 = v2;
  if (v2)
  {
    [(VOSCommandManager *)v2 setLoadShortcuts:1];
    [(VOSCommandManager *)v3 _commonInit];
    objc_initWeak(&location, v3);
    v4 = [MEMORY[0x263F22958] sharedManager];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __42__VOSCommandManager_initWithSystemProfile__block_invoke;
    v11 = &unk_2643FD700;
    objc_copyWeak(&v12, &location);
    uint64_t v5 = [v4 registerShortcutsDidChangeBlock:&v8];
    siriShortCutToken = v3->_siriShortCutToken;
    v3->_siriShortCutToken = (NSString *)v5;

    [(VOSCommandManager *)v3 reloadWithSystemProfile];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __42__VOSCommandManager_initWithSystemProfile__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadWithSystemProfile];
}

- (id)initPreferringUserProfileWithoutShortcuts
{
  v5.receiver = self;
  v5.super_class = (Class)VOSCommandManager;
  v2 = [(VOSCommandManager *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(VOSCommandManager *)v2 setLoadShortcuts:0];
    [(VOSCommandManager *)v3 _commonInit];
    [(VOSCommandManager *)v3 _commonUserProfileInit];
  }
  return v3;
}

- (id)initPreferringUserProfile
{
  v5.receiver = self;
  v5.super_class = (Class)VOSCommandManager;
  v2 = [(VOSCommandManager *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(VOSCommandManager *)v2 setLoadShortcuts:1];
    [(VOSCommandManager *)v3 _commonInit];
    [(VOSCommandManager *)v3 _commonUserProfileInit];
  }
  return v3;
}

- (void)_commonUserProfileInit
{
  if ([(VOSCommandManager *)self activeProfileIsUserProfile])
  {
    if ([(VOSCommandManager *)self _validateUserProfileDiscrepancies:self->_activeProfile])
    {
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
}

uint64_t __43__VOSCommandManager__commonUserProfileInit__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveAsUserProfile];
}

- (void)_commonInit
{
  v3 = (OS_dispatch_queue *)dispatch_queue_create("VOSCommandManager", 0);
  queue = self->_queue;
  self->_queue = v3;

  if ([(VOSCommandManager *)self loadShortcuts])
  {
    objc_initWeak(&location, self);
    objc_super v5 = [MEMORY[0x263F22958] sharedManager];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __32__VOSCommandManager__commonInit__block_invoke;
    v8[3] = &unk_2643FD700;
    objc_copyWeak(&v9, &location);
    v6 = [v5 registerShortcutsDidChangeBlock:v8];
    siriShortCutToken = self->_siriShortCutToken;
    self->_siriShortCutToken = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __32__VOSCommandManager__commonInit__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadPreferringUserProfile];
}

- (NSString)debugDescription
{
  if ([(VOSCommandManager *)self loadShortcuts])
  {
    v3 = [MEMORY[0x263F22958] sharedManager];
    v4 = [v3 shortcuts];
  }
  else
  {
    v4 = 0;
  }
  objc_super v5 = NSString;
  v6 = [(VOSCommandProfile *)self->_activeProfile debugDescription];
  v7 = [v5 stringWithFormat:@"VOSCommadManager:<%p>.\nProfile: %@\nDiscovered Shortcuts: %@", self, v6, v4];

  return (NSString *)v7;
}

- (void)reloadWithSystemProfile
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__VOSCommandManager_reloadWithSystemProfile__block_invoke;
  block[3] = &unk_2643FD728;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __44__VOSCommandManager_reloadWithSystemProfile__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadSystemProfile];
}

- (void)reloadPreferringUserProfile
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C3F9000, a2, OS_LOG_TYPE_ERROR, "Could not load user command profile: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t __48__VOSCommandManager_reloadPreferringUserProfile__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(id **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    objc_storeStrong(v4 + 2, *(id *)(a1 + 40));
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setDelegate:");
  }
  else
  {
    [v4 _loadSystemProfile];
  }
  v6 = *(void **)(a1 + 32);

  return [v6 setActiveProfileIsUserProfile:v5 != 0];
}

- (void)dealloc
{
  if ([(VOSCommandManager *)self loadShortcuts])
  {
    uint64_t v3 = [MEMORY[0x263F22958] sharedManager];
    [v3 unregisterShortcutsDidChangeBlock:self->_siriShortCutToken];
  }
  v4.receiver = self;
  v4.super_class = (Class)VOSCommandManager;
  [(VOSCommandManager *)&v4 dealloc];
}

- (BOOL)_validateUserProfileDiscrepancies:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[VOSCommandResolver resolverForCurrentHost];
  v6 = [(VOSCommandManager *)self systemProfile];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = +[VOSGesture allGestures];
  uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (!v7)
  {
    char v10 = 0;
    goto LABEL_27;
  }
  uint64_t v9 = v7;
  char v10 = 0;
  uint64_t v11 = *(void *)v28;
  *(void *)&long long v8 = 138412546;
  long long v25 = v8;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v28 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * v12);
      if (objc_msgSend(v6, "availabilityForGesture:withResolver:", v13, v5, v25) != 1)
      {
        if ([v6 availabilityForGesture:v13 withResolver:v5]) {
          goto LABEL_20;
        }
        objc_super v14 = [v4 commandForTouchGesture:v13 withResolver:v5];
        uint64_t v20 = [v6 commandForTouchGesture:v13 withResolver:v5];
        v15 = (void *)v20;
        if (v14) {
          BOOL v21 = 1;
        }
        else {
          BOOL v21 = v20 == 0;
        }
        if (!v21)
        {
          id v22 = (id)[v4 addGesture:v13 toCommand:v20 withResolver:v5];
          v17 = VOTLogCommon();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          *(_DWORD *)buf = v25;
          uint64_t v32 = v13;
          __int16 v33 = 2112;
          v34 = v15;
          v18 = v17;
          v19 = "Found new VO default command that didn't make it into the default set: %@ > %@";
LABEL_23:
          _os_log_error_impl(&dword_21C3F9000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0x16u);
LABEL_17:

          char v10 = 1;
        }
LABEL_18:

        goto LABEL_19;
      }
      objc_super v14 = [v4 commandForTouchGesture:v13 withResolver:v5];
      if (!v14)
      {
        v15 = [v6 commandForTouchGesture:v13 withResolver:v5];
        if (v15)
        {
          id v16 = (id)[v4 addGesture:v13 toCommand:v15 withResolver:v5];
          v17 = VOTLogCommon();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          *(_DWORD *)buf = v25;
          uint64_t v32 = v13;
          __int16 v33 = 2112;
          v34 = v15;
          v18 = v17;
          v19 = "Found VO hardwired gesture that was missing command: %@ > %@";
          goto LABEL_23;
        }
        goto LABEL_18;
      }
LABEL_19:

LABEL_20:
      ++v12;
    }
    while (v9 != v12);
    uint64_t v23 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    uint64_t v9 = v23;
  }
  while (v23);
LABEL_27:

  return v10 & 1;
}

- (void)restoreDefaultProfile
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__VOSCommandManager_restoreDefaultProfile__block_invoke;
  block[3] = &unk_2643FD728;
  block[4] = self;
  dispatch_sync(queue, block);
  uint64_t v3 = [MEMORY[0x263F22938] sharedInstance];
  [v3 setVoiceOverCustomCommandProfile:0];
}

uint64_t __42__VOSCommandManager_restoreDefaultProfile__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadSystemProfile];
}

- (void)saveAsUserProfile
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21C3F9000, a2, OS_LOG_TYPE_ERROR, "Failed to archive VOSCommandProfile. error: %@", (uint8_t *)&v3, 0xCu);
}

void __38__VOSCommandManager_saveAsUserProfile__block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 16);
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)batchUpdateActiveProfile:(id)a3 saveIfSuccessful:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  char v10 = (void (**)(id, void *))a5;
  long long v8 = (*((void (**)(id, VOSCommandManager *))a3 + 2))(a3, self);
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v5;
  }
  if (!v9) {
    [(VOSCommandManager *)self saveAsUserProfile];
  }
  if (v10) {
    v10[2](v10, v8);
  }
}

- (id)availableSiriShortcuts:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F22958], "sharedManager", a3);
  uint64_t v4 = [v3 shortcuts];

  return v4;
}

- (id)addGesture:(id)a3 toCommand:(id)a4 withResolver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__VOSCommandManager_addGesture_toCommand_withResolver___block_invoke;
  block[3] = &unk_2643FD7A0;
  id v20 = v10;
  BOOL v21 = &v22;
  block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, block);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v15;
}

uint64_t __55__VOSCommandManager_addGesture_toCommand_withResolver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[8] + 8) + 40) = [*(id *)(a1[4] + 16) addGesture:a1[5] toCommand:a1[6] withResolver:a1[7]];

  return MEMORY[0x270F9A758]();
}

- (id)removeGesture:(id)a3 fromCommand:(id)a4 withResolver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__VOSCommandManager_removeGesture_fromCommand_withResolver___block_invoke;
  block[3] = &unk_2643FD7A0;
  id v20 = v10;
  BOOL v21 = &v22;
  block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, block);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v15;
}

uint64_t __60__VOSCommandManager_removeGesture_fromCommand_withResolver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[8] + 8) + 40) = [*(id *)(a1[4] + 16) removeGesture:a1[5] fromCommand:a1[6] withResolver:a1[7]];

  return MEMORY[0x270F9A758]();
}

- (id)addKeyChord:(id)a3 toCommand:(id)a4 withResolver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__VOSCommandManager_addKeyChord_toCommand_withResolver___block_invoke;
  block[3] = &unk_2643FD7A0;
  id v20 = v10;
  BOOL v21 = &v22;
  block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, block);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v15;
}

uint64_t __56__VOSCommandManager_addKeyChord_toCommand_withResolver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[8] + 8) + 40) = [*(id *)(a1[4] + 16) addKeyChord:a1[5] toCommand:a1[6] withResolver:a1[7]];

  return MEMORY[0x270F9A758]();
}

- (id)removeKeyChord:(id)a3 fromCommand:(id)a4 withResolver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__VOSCommandManager_removeKeyChord_fromCommand_withResolver___block_invoke;
  block[3] = &unk_2643FD7A0;
  id v20 = v10;
  BOOL v21 = &v22;
  block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, block);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v15;
}

uint64_t __61__VOSCommandManager_removeKeyChord_fromCommand_withResolver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[8] + 8) + 40) = [*(id *)(a1[4] + 16) removeKeyChord:a1[5] fromCommand:a1[6] withResolver:a1[7]];

  return MEMORY[0x270F9A758]();
}

- (id)validateCanAddGesture:(id)a3 toCommand:(id)a4 withResolver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__VOSCommandManager_validateCanAddGesture_toCommand_withResolver___block_invoke;
  block[3] = &unk_2643FD7A0;
  id v20 = v10;
  BOOL v21 = &v22;
  block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, block);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v15;
}

uint64_t __66__VOSCommandManager_validateCanAddGesture_toCommand_withResolver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[8] + 8) + 40) = [*(id *)(a1[4] + 16) validateCanAddGesture:a1[5] toCommand:a1[6] withResolver:a1[7]];

  return MEMORY[0x270F9A758]();
}

- (id)validateCanRemoveGesture:(id)a3 fromCommand:(id)a4 withResolver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__VOSCommandManager_validateCanRemoveGesture_fromCommand_withResolver___block_invoke;
  block[3] = &unk_2643FD7A0;
  id v20 = v10;
  BOOL v21 = &v22;
  block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, block);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v15;
}

uint64_t __71__VOSCommandManager_validateCanRemoveGesture_fromCommand_withResolver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[8] + 8) + 40) = [*(id *)(a1[4] + 16) validateCanRemoveGesture:a1[5] fromCommand:a1[6] withResolver:a1[7]];

  return MEMORY[0x270F9A758]();
}

- (id)validateCanAddKeyChord:(id)a3 toCommand:(id)a4 withResolver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__VOSCommandManager_validateCanAddKeyChord_toCommand_withResolver___block_invoke;
  block[3] = &unk_2643FD7A0;
  id v20 = v10;
  BOOL v21 = &v22;
  block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, block);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v15;
}

uint64_t __67__VOSCommandManager_validateCanAddKeyChord_toCommand_withResolver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[8] + 8) + 40) = [*(id *)(a1[4] + 16) validateCanAddKeyChord:a1[5] toCommand:a1[6] withResolver:a1[7]];

  return MEMORY[0x270F9A758]();
}

- (id)validateCanRemoveKeyChord:(id)a3 fromCommand:(id)a4 withResolver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__VOSCommandManager_validateCanRemoveKeyChord_fromCommand_withResolver___block_invoke;
  block[3] = &unk_2643FD7A0;
  id v20 = v10;
  BOOL v21 = &v22;
  block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, block);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v15;
}

uint64_t __72__VOSCommandManager_validateCanRemoveKeyChord_fromCommand_withResolver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[8] + 8) + 40) = [*(id *)(a1[4] + 16) validateCanRemoveKeyChord:a1[5] fromCommand:a1[6] withResolver:a1[7]];

  return MEMORY[0x270F9A758]();
}

- (id)commandForTouchGesture:(id)a3 withResolver:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy_;
  long long v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  queue = self->_queue;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  id v20 = __57__VOSCommandManager_commandForTouchGesture_withResolver___block_invoke;
  BOOL v21 = &unk_2643FD7C8;
  long long v25 = &v26;
  uint64_t v22 = self;
  id v9 = v6;
  id v23 = v9;
  id v10 = v7;
  id v24 = v10;
  dispatch_sync(queue, &v18);
  uint64_t v11 = (void *)v27[5];
  id v12 = +[VOSCommand ToggleQuickNote];
  if ([v11 isEqual:v12])
  {
    char IsPad = AXDeviceIsPad();

    if (IsPad) {
      goto LABEL_5;
    }
    id v12 = (void *)v27[5];
    v27[5] = 0;
  }

LABEL_5:
  id v14 = VOTLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = v27[5];
    *(_DWORD *)buf = 138412802;
    uint64_t v33 = v17;
    __int16 v34 = 2112;
    id v35 = v9;
    __int16 v36 = 2112;
    id v37 = v10;
    _os_log_debug_impl(&dword_21C3F9000, v14, OS_LOG_TYPE_DEBUG, "Resolved command: '%@' for gesture: '%@' resolver: %@", buf, 0x20u);
  }

  id v15 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v15;
}

uint64_t __57__VOSCommandManager_commandForTouchGesture_withResolver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[7] + 8) + 40) = [*(id *)(a1[4] + 16) commandForTouchGesture:a1[5] withResolver:a1[6]];

  return MEMORY[0x270F9A758]();
}

- (id)commandForKeyChord:(id)a3 withResolver:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  id v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __53__VOSCommandManager_commandForKeyChord_withResolver___block_invoke;
  v15[3] = &unk_2643FD7C8;
  uint64_t v18 = &v19;
  v15[4] = self;
  id v9 = v6;
  id v16 = v9;
  id v10 = v7;
  id v17 = v10;
  dispatch_sync(queue, v15);
  uint64_t v11 = VOTLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = v20[5];
    *(_DWORD *)buf = 138412802;
    uint64_t v26 = v14;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_debug_impl(&dword_21C3F9000, v11, OS_LOG_TYPE_DEBUG, "Resolved command: '%@' for keyChord: '%@' resolver: %@", buf, 0x20u);
  }

  id v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

uint64_t __53__VOSCommandManager_commandForKeyChord_withResolver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[7] + 8) + 40) = [*(id *)(a1[4] + 16) commandForKeyChord:a1[5] withResolver:a1[6]];

  return MEMORY[0x270F9A758]();
}

- (id)allCommandsWithResolver:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__VOSCommandManager_allCommandsWithResolver___block_invoke;
  block[3] = &unk_2643FD7F0;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __45__VOSCommandManager_allCommandsWithResolver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) allCommandsWithResolver:a1[5]];

  return MEMORY[0x270F9A758]();
}

- (id)allSiriShortcutCommandsWithResolver:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__VOSCommandManager_allSiriShortcutCommandsWithResolver___block_invoke;
  block[3] = &unk_2643FD7F0;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __57__VOSCommandManager_allSiriShortcutCommandsWithResolver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) allSiriShortcutCommandsWithResolver:a1[5]];

  return MEMORY[0x270F9A758]();
}

- (id)allShortcutBindingsWithResolver:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__VOSCommandManager_allShortcutBindingsWithResolver___block_invoke;
  block[3] = &unk_2643FD7F0;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __53__VOSCommandManager_allShortcutBindingsWithResolver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) allShortcutBindingsWithResolver:a1[5]];

  return MEMORY[0x270F9A758]();
}

- (id)userPresentableAllShortcutBindingsWithResolver:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__VOSCommandManager_userPresentableAllShortcutBindingsWithResolver___block_invoke;
  block[3] = &unk_2643FD7F0;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __68__VOSCommandManager_userPresentableAllShortcutBindingsWithResolver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) userPresentableAllShortcutBindingsWithResolver:a1[5]];

  return MEMORY[0x270F9A758]();
}

- (id)gestureBindingsForCommand:(id)a3 withResolver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__VOSCommandManager_gestureBindingsForCommand_withResolver___block_invoke;
  v13[3] = &unk_2643FD7C8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __60__VOSCommandManager_gestureBindingsForCommand_withResolver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[7] + 8) + 40) = [*(id *)(a1[4] + 16) gestureBindingsForCommand:a1[5] withResolver:a1[6]];

  return MEMORY[0x270F9A758]();
}

- (id)shortcutBindingsForCommand:(id)a3 withResolver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__VOSCommandManager_shortcutBindingsForCommand_withResolver___block_invoke;
  v13[3] = &unk_2643FD7C8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __61__VOSCommandManager_shortcutBindingsForCommand_withResolver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[7] + 8) + 40) = [*(id *)(a1[4] + 16) shortcutBindingsForCommand:a1[5] withResolver:a1[6]];

  return MEMORY[0x270F9A758]();
}

- (BOOL)commandHasAnyBindings:(id)a3 withResolver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__VOSCommandManager_commandHasAnyBindings_withResolver___block_invoke;
  v12[3] = &unk_2643FD7C8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v12);
  LOBYTE(queue) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)queue;
}

uint64_t __56__VOSCommandManager_commandHasAnyBindings_withResolver___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) commandHasAnyBindings:a1[5] withResolver:a1[6]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

- (unint64_t)availabilityForGesture:(id)a3 withResolver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__VOSCommandManager_availabilityForGesture_withResolver___block_invoke;
  v13[3] = &unk_2643FD7C8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  unint64_t v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __57__VOSCommandManager_availabilityForGesture_withResolver___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) availabilityForGesture:a1[5] withResolver:a1[6]];
  *(void *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

- (unint64_t)availabilityForShortcut:(id)a3 withResolver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__VOSCommandManager_availabilityForShortcut_withResolver___block_invoke;
  v13[3] = &unk_2643FD7C8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  unint64_t v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __58__VOSCommandManager_availabilityForShortcut_withResolver___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) availabilityForShortcut:a1[5] withResolver:a1[6]];
  *(void *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

- (unint64_t)availabilityForCommand:(id)a3 withResolver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__VOSCommandManager_availabilityForCommand_withResolver___block_invoke;
  v13[3] = &unk_2643FD7C8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  unint64_t v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __57__VOSCommandManager_availabilityForCommand_withResolver___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) availabilityForCommand:a1[5] withResolver:a1[6]];
  *(void *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

- (BOOL)commandHasModifiedBindingsWhenZoomEnabled:(id)a3 withResolver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__VOSCommandManager_commandHasModifiedBindingsWhenZoomEnabled_withResolver___block_invoke;
  v12[3] = &unk_2643FD7C8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v12);
  LOBYTE(queue) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)queue;
}

uint64_t __76__VOSCommandManager_commandHasModifiedBindingsWhenZoomEnabled_withResolver___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) commandHasModifiedBindingsWhenZoomEnabled:a1[5] withResolver:a1[6]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

- (id)systemProfile
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 pathForResource:@"DefaultCommandProfile" ofType:@"plist"];
  id v4 = [NSDictionary dictionaryWithContentsOfFile:v3];
  unint64_t v5 = +[VOSCommandResolver currentHost];
  if (v5 > 5)
  {
    id v6 = 0;
    id v7 = 0;
  }
  else
  {
    id v6 = [v2 pathForResource:off_2643FD810[v5] ofType:@"plist"];
    id v7 = [NSDictionary dictionaryWithContentsOfFile:v6];
  }
  id v8 = [[VOSCommandProfile alloc] initWithProfileProperties:v4 overlayProperties:v7];

  return v8;
}

- (void)_loadSystemProfile
{
  uint64_t v3 = [(VOSCommandManager *)self systemProfile];
  activeProfile = self->_activeProfile;
  self->_activeProfile = v3;

  unint64_t v5 = self->_activeProfile;

  [(VOSCommandProfile *)v5 setDelegate:self];
}

- (BOOL)activeProfileIsUserProfile
{
  return self->_activeProfileIsUserProfile;
}

- (void)setActiveProfileIsUserProfile:(BOOL)a3
{
  self->_activeProfileIsUserProfile = a3;
}

- (BOOL)loadShortcuts
{
  return self->_loadShortcuts;
}

- (void)setLoadShortcuts:(BOOL)a3
{
  self->_loadShortcuts = a3;
}

- (VOSCommandProfile)activeProfile
{
  return self->_activeProfile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriShortCutToken, 0);
  objc_storeStrong((id *)&self->_activeProfile, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end