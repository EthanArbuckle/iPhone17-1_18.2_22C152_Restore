@interface _UIPlaybackControlsStateManager
- (UIScene)_scene;
- (_UIPlaybackControlsStateManager)initWithScene:(id)a3;
- (id)_beginFullscreenPlaybackSession;
- (id)_beginPresentingPlaybackControls;
- (void)_setScene:(id)a3;
- (void)_updateState;
@end

@implementation _UIPlaybackControlsStateManager

- (_UIPlaybackControlsStateManager)initWithScene:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIPlaybackControlsStateManager;
  v5 = [(_UIPlaybackControlsStateManager *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    uint64_t v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:261];
    fullscreenPlaybackAssertions = v6->_fullscreenPlaybackAssertions;
    v6->_fullscreenPlaybackAssertions = (NSHashTable *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] hashTableWithOptions:261];
    controlsPresentedAssertions = v6->_controlsPresentedAssertions;
    v6->_controlsPresentedAssertions = (NSHashTable *)v9;
  }
  return v6;
}

- (id)_beginFullscreenPlaybackSession
{
  if (pthread_main_np() != 1)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"_UIPlaybackControlsState.m" lineNumber:53 description:@"Call must be made on main thread"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  if (WeakRetained)
  {
    objc_initWeak(&location, self);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __66___UIPlaybackControlsStateManager__beginFullscreenPlaybackSession__block_invoke;
    v15 = &unk_1E52E04F8;
    objc_copyWeak(&v16, &location);
    v5 = _Block_copy(&v12);
    id v6 = objc_alloc(MEMORY[0x1E4F4F838]);
    uint64_t v7 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
    uint64_t v9 = objc_msgSend(v6, "initWithIdentifier:forReason:queue:invalidationBlock:", @"_UIPlaybackControlsState", @"FullscreenPlayback", v7, v5, v12, v13, v14, v15);

    if (self)
    {
      [(NSHashTable *)self->_fullscreenPlaybackAssertions addObject:v9];
      -[_UIPlaybackControlsStateManager _updateState]((id *)&self->super.isa);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)_beginPresentingPlaybackControls
{
  if (pthread_main_np() != 1)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"_UIPlaybackControlsState.m" lineNumber:73 description:@"Call must be made on main thread"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  if (WeakRetained)
  {
    objc_initWeak(&location, self);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __67___UIPlaybackControlsStateManager__beginPresentingPlaybackControls__block_invoke;
    v15 = &unk_1E52E04F8;
    objc_copyWeak(&v16, &location);
    v5 = _Block_copy(&v12);
    id v6 = objc_alloc(MEMORY[0x1E4F4F838]);
    uint64_t v7 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
    uint64_t v9 = objc_msgSend(v6, "initWithIdentifier:forReason:queue:invalidationBlock:", @"_UIPlaybackControlsState", @"ControlsPresented", v7, v5, v12, v13, v14, v15);

    if (self)
    {
      [(NSHashTable *)self->_controlsPresentedAssertions addObject:v9];
      -[_UIPlaybackControlsStateManager _updateState]((id *)&self->super.isa);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (void)_updateState
{
  uint64_t v2 = [a1[2] count] != 0;
  if ((([a1[3] count] != 0) & v2) != 0) {
    uint64_t v2 = 2;
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 1);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47___UIPlaybackControlsStateManager__updateState__block_invoke;
  v4[3] = &__block_descriptor_40_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  v4[4] = v2;
  [WeakRetained _updateUIClientSettingsWithBlock:v4];
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void)_setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlsPresentedAssertions, 0);
  objc_storeStrong((id *)&self->_fullscreenPlaybackAssertions, 0);
  objc_destroyWeak((id *)&self->_scene);
}

@end