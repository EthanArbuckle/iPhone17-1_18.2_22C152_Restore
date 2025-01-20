@interface SSActiveInterfaceOrientationObserver
- (SSActiveInterfaceOrientationObserverDelegate)delegate;
- (id)_sbUIUserAgent;
- (void)_observeActiveInterfaceOrientationChangeToOrientation:(int64_t)a3 withDuration:(double)a4;
- (void)_registerForActiveInterfaceOrientationChanges;
- (void)_unregisterForActiveInterfaceOrientationChanges;
- (void)beginObserving;
- (void)setDelegate:(id)a3;
@end

@implementation SSActiveInterfaceOrientationObserver

- (void)_observeActiveInterfaceOrientationChangeToOrientation:(int64_t)a3 withDuration:(double)a4
{
  id v7 = [(SSActiveInterfaceOrientationObserver *)self delegate];
  [v7 activeInterfaceOrientationObserver:self observedChangeToInterfaceOrientation:a3 withDuration:a4];
}

- (SSActiveInterfaceOrientationObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSActiveInterfaceOrientationObserverDelegate *)WeakRetained;
}

- (void)beginObserving
{
  [(SSActiveInterfaceOrientationObserver *)self _registerForActiveInterfaceOrientationChanges];
  v3 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v4 = [v3 activeInterfaceOrientation];

  [(SSActiveInterfaceOrientationObserver *)self _observeActiveInterfaceOrientationChangeToOrientation:v4 withDuration:0.0];
}

- (id)_sbUIUserAgent
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (void (*)(void))getSBUIGetUserAgentSymbolLoc_ptr;
  v10 = getSBUIGetUserAgentSymbolLoc_ptr;
  if (!getSBUIGetUserAgentSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getSBUIGetUserAgentSymbolLoc_block_invoke;
    v6[3] = &unk_2644ED6B8;
    v6[4] = &v7;
    __getSBUIGetUserAgentSymbolLoc_block_invoke((uint64_t)v6);
    v2 = (void (*)(void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)-[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:]();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  v3 = v2();
  return v3;
}

- (void)_registerForActiveInterfaceOrientationChanges
{
  v3 = [(SSActiveInterfaceOrientationObserver *)self _sbUIUserAgent];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SSActiveInterfaceOrientationObserver *)self _sbUIUserAgent];
    [v5 addActiveInterfaceOrientationObserver:self];
  }
}

- (void)_unregisterForActiveInterfaceOrientationChanges
{
  v3 = [(SSActiveInterfaceOrientationObserver *)self _sbUIUserAgent];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SSActiveInterfaceOrientationObserver *)self _sbUIUserAgent];
    [v5 removeActiveInterfaceOrientationObserver:self];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end