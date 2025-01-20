@interface SBSceneDisconnectionManager
+ (id)sharedManager;
- (BOOL)isExecuting;
- (BOOL)shouldDisconnectScene:(id)a3 inSwitcher:(id)a4;
- (SBSceneDisconnectionManager)init;
- (id)liveScenesForApplication:(id)a3;
- (id)sceneManager;
- (unint64_t)numberOfRecentScenesExcludedFromDisconnection;
- (unint64_t)positionOf:(id)a3 inSwitcher:(id)a4;
- (void)_beginSceneCleanupWithBackgroundedSceneEntities:(id)a3;
- (void)disconnectScenes:(id)a3 completion:(id)a4;
- (void)setIsExecuting:(BOOL)a3;
- (void)setNumberOfRecentScenesExcludedFromDisconnection:(unint64_t)a3;
@end

@implementation SBSceneDisconnectionManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_293);
  }
  v2 = (void *)sharedManager__sharedManager;
  return v2;
}

void __44__SBSceneDisconnectionManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(SBSceneDisconnectionManager);
  v1 = (void *)sharedManager__sharedManager;
  sharedManager__sharedManager = (uint64_t)v0;
}

- (SBSceneDisconnectionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBSceneDisconnectionManager;
  v2 = [(SBSceneDisconnectionManager *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v4 = [v3 physicalMemory];

    v2->_numberOfRecentScenesExcludedFromDisconnection = vcvtps_u32_f32((float)(uint64_t)((double)v4 / 1000000000.0) * 2.5);
  }
  return v2;
}

- (void)_beginSceneCleanupWithBackgroundedSceneEntities:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_isExecuting)
  {
    self->_isExecuting = 1;
    v5 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v7 = +[SBMainSwitcherControllerCoordinator sharedInstanceIfExists];
      v8 = v7;
      if (v7)
      {
        v9 = [v7 recentAppLayouts];
        unint64_t v10 = [v9 count];
        unint64_t numberOfRecentScenesExcludedFromDisconnection = self->_numberOfRecentScenesExcludedFromDisconnection;

        if (v10 <= numberOfRecentScenesExcludedFromDisconnection)
        {
          self->_isExecuting = 0;
        }
        else
        {
          v28 = objc_msgSend(v4, "bs_map:", &__block_literal_global_4_2);
          v12 = +[SBApplicationController sharedInstanceIfExists];
          if (v12)
          {
            id v25 = v12;
            id v26 = v4;
            v13 = [v12 runningApplications];
            v14 = objc_msgSend(v13, "bs_filter:", &__block_literal_global_8_3);

            id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v15 = v14;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v36;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v36 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  v20 = [(SBSceneDisconnectionManager *)self liveScenesForApplication:*(void *)(*((void *)&v35 + 1) + 8 * i)];
                  if ((unint64_t)[v20 count] >= 2)
                  {
                    v31[0] = MEMORY[0x1E4F143A8];
                    v31[1] = 3221225472;
                    v31[2] = __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_3;
                    v31[3] = &unk_1E6B08C40;
                    id v32 = v28;
                    v33 = self;
                    v21 = v8;
                    id v34 = v8;
                    v22 = objc_msgSend(v20, "bs_filter:", v31);
                    if ([v22 count]) {
                      [v27 unionSet:v22];
                    }

                    v8 = v21;
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
              }
              while (v17);
            }

            id v4 = v26;
            if ([v27 count])
            {
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_4;
              block[3] = &unk_1E6AF5290;
              block[4] = self;
              id v30 = v27;
              dispatch_async(MEMORY[0x1E4F14428], block);
            }
            else
            {
              v24 = SBLogWorkspace();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_INFO, "No scenes eligible for disconnection.", buf, 2u);
              }

              self->_isExecuting = 0;
            }

            v12 = v25;
          }
          else
          {
            self->_isExecuting = 0;
          }
        }
      }
      else
      {
        self->_isExecuting = 0;
        v23 = SBLogWorkspace();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_INFO, "Stopping scene disconnection – no main switcher instance found.", buf, 2u);
        }
      }
    }
    else
    {
      self->_isExecuting = 0;
    }
  }
}

uint64_t __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sceneHandle];
}

uint64_t __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 info];
  uint64_t v3 = [v2 supportsMultiwindow];

  return v3;
}

uint64_t __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 40) shouldDisconnectScene:v3 inSwitcher:*(void *)(a1 + 48)];
  }

  return v4;
}

uint64_t __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_5;
  v4[3] = &unk_1E6AF8948;
  v4[4] = v2;
  return [v2 disconnectScenes:v1 completion:v4];
}

void __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = SBLogWorkspace();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_5_cold_1((uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Completed scene disconnections.", v7, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
}

- (BOOL)shouldDisconnectScene:(id)a3 inSwitcher:(id)a4
{
  id v6 = a4;
  v7 = [a3 sceneIfExists];
  BOOL v11 = [v7 isValid]
     && ([v7 settings],
         v8 = objc_claimAutoreleasedReturnValue(),
         char v9 = [v8 isForeground],
         v8,
         (v9 & 1) == 0)
     && (unint64_t v10 = [(SBSceneDisconnectionManager *)self positionOf:v7 inSwitcher:v6],
         v10 != 0x7FFFFFFFFFFFFFFFLL)
     && v10 >= self->_numberOfRecentScenesExcludedFromDisconnection;

  return v11;
}

- (void)disconnectScenes:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = SBApplicationSceneEntityDestructionMakeIntent(1, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__SBSceneDisconnectionManager_disconnectScenes_completion___block_invoke;
  v9[3] = &unk_1E6B02370;
  id v10 = v5;
  id v8 = v5;
  SBWorkspaceDestroyApplicationSceneHandlesWithIntent(v6, v7, v9);
}

uint64_t __59__SBSceneDisconnectionManager_disconnectScenes_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  a3;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  return MEMORY[0x1F4181820]();
}

- (id)sceneManager
{
  return +[SBSceneManagerCoordinator mainDisplaySceneManager];
}

- (id)liveScenesForApplication:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSceneDisconnectionManager *)self sceneManager];
  id v6 = [v5 externalApplicationSceneHandles];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__SBSceneDisconnectionManager_liveScenesForApplication___block_invoke;
  v10[3] = &unk_1E6B08C68;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "bs_filter:", v10);

  return v8;
}

uint64_t __56__SBSceneDisconnectionManager_liveScenesForApplication___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 application];
  if ([v4 isSameExecutableAsApplication:*(void *)(a1 + 32)])
  {
    id v5 = [v3 scene];
    uint64_t v6 = [v5 isValid];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)positionOf:(id)a3 inSwitcher:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 recentAppLayouts];
  unint64_t v9 = [v8 count];

  unint64_t numberOfRecentScenesExcludedFromDisconnection = self->_numberOfRecentScenesExcludedFromDisconnection;
  if (v9 >= numberOfRecentScenesExcludedFromDisconnection) {
    unint64_t v11 = self->_numberOfRecentScenesExcludedFromDisconnection;
  }
  else {
    unint64_t v11 = v9;
  }
  if (v11)
  {
    unint64_t v12 = 0;
    while (1)
    {
      v13 = [v7 recentAppLayouts];
      v14 = [v13 objectAtIndexedSubscript:v12];

      id v15 = [v6 identifier];
      char v16 = [v14 containsItemWithUniqueIdentifier:v15];

      if (v16) {
        break;
      }
      if (v11 == ++v12)
      {
        unint64_t numberOfRecentScenesExcludedFromDisconnection = self->_numberOfRecentScenesExcludedFromDisconnection;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    unint64_t v12 = numberOfRecentScenesExcludedFromDisconnection + 1;
  }

  return v12;
}

- (unint64_t)numberOfRecentScenesExcludedFromDisconnection
{
  return self->_numberOfRecentScenesExcludedFromDisconnection;
}

- (void)setNumberOfRecentScenesExcludedFromDisconnection:(unint64_t)a3
{
  self->_unint64_t numberOfRecentScenesExcludedFromDisconnection = a3;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)setIsExecuting:(BOOL)a3
{
  self->_isExecuting = a3;
}

void __79__SBSceneDisconnectionManager__beginSceneCleanupWithBackgroundedSceneEntities___block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Error while disconnecting scenes: %@", (uint8_t *)&v2, 0xCu);
}

@end