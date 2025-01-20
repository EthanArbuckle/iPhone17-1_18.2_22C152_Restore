@interface MRScreenMirroringUIControllingObserver
- (MRScreenMirroringObserver)internalObserver;
- (MRScreenMirroringQuickControlsUIControllable)uiController;
- (MRScreenMirroringUIControllingObserver)init;
- (void)_mirrorStateChanged:(BOOL)a3 screenType:(unsigned int)a4;
- (void)dealloc;
- (void)setUiController:(id)a3;
@end

@implementation MRScreenMirroringUIControllingObserver

- (MRScreenMirroringUIControllingObserver)init
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)MRScreenMirroringUIControllingObserver;
  v2 = [(MRScreenMirroringUIControllingObserver *)&v9 init];
  if (v2)
  {
    objc_initWeak(location, v2);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__MRScreenMirroringUIControllingObserver_init__block_invoke;
    v7[3] = &unk_1E57D1080;
    objc_copyWeak(&v8, location);
    uint64_t v3 = +[MRScreenMirroringObserver observerWithStateChangeCallback:v7];
    internalObserver = v2->_internalObserver;
    v2->_internalObserver = (MRScreenMirroringObserver *)v3;

    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
  v5 = _MRLogForCategory(0xBuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(location[0]) = 134217984;
    *(id *)((char *)location + 4) = v2;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringUIControllingObserver] <%p> Initialized.", (uint8_t *)location, 0xCu);
  }

  return v2;
}

void __46__MRScreenMirroringUIControllingObserver_init__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained internalObserver];
    v6 = [v5 queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__MRScreenMirroringUIControllingObserver_init__block_invoke_2;
    v7[3] = &unk_1E57D1058;
    id v8 = v4;
    char v9 = a2;
    MRMediaRemoteGetExternalScreenType(v6, v7);
  }
}

uint64_t __46__MRScreenMirroringUIControllingObserver_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _mirrorStateChanged:*(unsigned __int8 *)(a1 + 40) screenType:a2];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _MRLogForCategory(0xBuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringUIControllingObserver] <%p> Deallocating.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MRScreenMirroringUIControllingObserver;
  [(MRScreenMirroringObserver *)&v4 dealloc];
}

- (void)_mirrorStateChanged:(BOOL)a3 screenType:(unsigned int)a4
{
  BOOL v5 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _MRLogForCategory(0xBuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109376;
    v12[1] = v5;
    __int16 v13 = 1024;
    unsigned int v14 = a4;
    _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringUIControllingObserver] Mirroring enabled: %{BOOL}u for screen type: %u", (uint8_t *)v12, 0xEu);
  }

  id v8 = [(MRScreenMirroringUIControllingObserver *)self uiController];

  if (a4 == 1 && v5)
  {
    if (!v8)
    {
      char v9 = +[MRUIControllerProvider screenMirroringControllerWithDelegate:0];
      [(MRScreenMirroringUIControllingObserver *)self setUiController:v9];

      v10 = [(MRScreenMirroringUIControllingObserver *)self uiController];
      [v10 acquireScreenMirroringQuickControlsAssertion];
    }
  }
  else if (v8)
  {
    v11 = [(MRScreenMirroringUIControllingObserver *)self uiController];
    [v11 releaseScreenMirroringQuickControlsAssertion];

    [(MRScreenMirroringUIControllingObserver *)self setUiController:0];
  }
}

- (MRScreenMirroringQuickControlsUIControllable)uiController
{
  return self->_uiController;
}

- (void)setUiController:(id)a3
{
}

- (MRScreenMirroringObserver)internalObserver
{
  return self->_internalObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalObserver, 0);

  objc_storeStrong((id *)&self->_uiController, 0);
}

@end