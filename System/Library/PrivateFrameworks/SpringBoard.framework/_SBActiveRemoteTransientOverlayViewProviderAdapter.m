@interface _SBActiveRemoteTransientOverlayViewProviderAdapter
- (BOOL)isPresentingOnBehalfOfApplication:(id)a3;
- (BOOL)isPresentingOnBehalfOfSceneIdentityTokenString:(id)a3;
- (BOOL)isPresentingOnBehalfOfScenePersistentIdentifier:(id)a3;
- (BOOL)isPresentingTransientOverlay:(id)a3;
- (SBDeviceApplicationRemoteTransientOverlayViewProvider)sceneBackedProvider;
- (SBDeviceApplicationRemoteTransientOverlayViewProvider)viewServiceProvider;
- (SBWindowScene)windowScene;
- (void)dismissRemoteTransientOverlayViewController:(id)a3;
- (void)presentRemoteTransientOverlayViewController:(id)a3 presentationRequest:(id)a4;
- (void)setSceneBackedProvider:(id)a3;
- (void)setViewServiceProvider:(id)a3;
@end

@implementation _SBActiveRemoteTransientOverlayViewProviderAdapter

- (void)setViewServiceProvider:(id)a3
{
}

- (void)setSceneBackedProvider:(id)a3
{
}

- (void)presentRemoteTransientOverlayViewController:(id)a3 presentationRequest:(id)a4
{
  id v6 = a4;
  id v10 = a3;
  int v7 = [v6 isSceneBacked];
  uint64_t v8 = 8;
  if (v7) {
    uint64_t v8 = 16;
  }
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.isa + v8));
  [WeakRetained presentRemoteTransientOverlayViewController:v10 presentationRequest:v6];

  [v10 updateDisplayLayoutElementWithBuilder:&__block_literal_global_347];
}

- (void)dismissRemoteTransientOverlayViewController:(id)a3
{
  p_sceneBackedProvider = &self->_sceneBackedProvider;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sceneBackedProvider);
  id v6 = objc_loadWeakRetained((id *)&self->_viewServiceProvider);
  BOOL v7 = [WeakRetained isPresentingTransientOverlay:v5] == 0;
  uint64_t v8 = WeakRetained;
  if (v7) {
    uint64_t v8 = v6;
  }
  [v8 dismissRemoteTransientOverlayViewController:v5];
}

- (BOOL)isPresentingTransientOverlay:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewServiceProvider);
  if ([WeakRetained isPresentingTransientOverlay:v4])
  {
    char v6 = 1;
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)&self->_sceneBackedProvider);
    char v6 = [v7 isPresentingTransientOverlay:v4];
  }
  return v6;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewServiceProvider);
  v3 = [WeakRetained windowScene];

  return (SBWindowScene *)v3;
}

- (BOOL)isPresentingOnBehalfOfApplication:(id)a3
{
  p_viewServiceProvider = &self->_viewServiceProvider;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewServiceProvider);
  char v6 = [WeakRetained isPresentingOnBehalfOfApplication:v4];

  return v6;
}

- (BOOL)isPresentingOnBehalfOfSceneIdentityTokenString:(id)a3
{
  p_viewServiceProvider = &self->_viewServiceProvider;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewServiceProvider);
  char v6 = [WeakRetained isPresentingOnBehalfOfSceneIdentityTokenString:v4];

  return v6;
}

- (BOOL)isPresentingOnBehalfOfScenePersistentIdentifier:(id)a3
{
  p_viewServiceProvider = &self->_viewServiceProvider;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewServiceProvider);
  char v6 = [WeakRetained isPresentingOnBehalfOfScenePersistentIdentifier:v4];

  return v6;
}

- (SBDeviceApplicationRemoteTransientOverlayViewProvider)viewServiceProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewServiceProvider);
  return (SBDeviceApplicationRemoteTransientOverlayViewProvider *)WeakRetained;
}

- (SBDeviceApplicationRemoteTransientOverlayViewProvider)sceneBackedProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneBackedProvider);
  return (SBDeviceApplicationRemoteTransientOverlayViewProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneBackedProvider);
  objc_destroyWeak((id *)&self->_viewServiceProvider);
}

@end