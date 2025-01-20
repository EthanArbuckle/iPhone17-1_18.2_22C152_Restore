@interface _PBFPosterSceneSnapshotViewController
- (BOOL)scenePresenterIsValid;
- (PBFDisplayContext)displayContext;
- (PBFPosterPreview)preview;
- (PBFPosterSnapshotDefinition)definition;
- (PFPosterExtensionInstance)extensionInstance;
- (_PBFPosterSceneSnapshotViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6 preview:(id)a7 definition:(id)a8;
- (_PBFPosterSceneSnapshotViewControllerDelegate)delegate;
- (int64_t)state;
- (void)_configureInitialSceneSettings:(id)a3;
- (void)_failWithFatalError:(id)a3;
- (void)_myUpdateSettings:(id)a3;
- (void)_sceneContentReadinessDidChange;
- (void)_teardown;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setDisplayContext:(id)a3;
- (void)setScenePresenterIsValid:(BOOL)a3;
- (void)setState:(int64_t)a3;
@end

@implementation _PBFPosterSceneSnapshotViewController

- (_PBFPosterSceneSnapshotViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6 preview:(id)a7 definition:(id)a8
{
  v14 = (PFPosterExtensionInstance *)a3;
  id v15 = a7;
  v16 = (PBFPosterSnapshotDefinition *)a8;
  objc_storeStrong((id *)&self->_preview, a7);
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  definition = self->_definition;
  self->_definition = v16;
  v21 = v16;

  extensionInstance = self->_extensionInstance;
  self->_extensionInstance = v14;
  v23 = v14;

  v26.receiver = self;
  v26.super_class = (Class)_PBFPosterSceneSnapshotViewController;
  v24 = [(PRSceneViewController *)&v26 initWithProvider:v23 contents:v19 configurableOptions:v18 configuredProperties:v17 additionalInfo:0];

  if (v24)
  {
    [(PRSceneViewController *)v24 setSceneUserInteractionEnabled:0];
    [(PRRenderingSceneViewController *)v24 setShowDebugGear:0];
  }

  return v24;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)_PBFPosterSceneSnapshotViewController;
  [(PRSceneViewController *)&v3 invalidate];
  [(_PBFPosterSceneSnapshotViewController *)self setState:2];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = [obj isEqual:WeakRetained];

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (self->_state == 2)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained((id *)&self->_delegate);
        [v8 sceneSnapshotViewController:self stateChangedTo:2];
      }
    }
  }
}

- (void)setState:(int64_t)a3
{
  int64_t state = self->_state;
  if (state != a3 && state != 2)
  {
    id v7 = [(_PBFPosterSceneSnapshotViewController *)self delegate];
    [v7 sceneSnapshotViewController:self stateWillChangeFrom:state to:a3];
    self->_int64_t state = a3;
    [v7 sceneSnapshotViewController:self stateChangedTo:a3];
  }
}

- (void)setDisplayContext:(id)a3
{
  id v7 = a3;
  if (([v7 isEqualToDisplayContext:self->_displayContext] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayContext, a3);
    objc_msgSend(v7, "pbf_referenceBounds");
    -[PRSceneViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", objc_msgSend(v7, "pbf_interfaceOrientation"), 0, 0, v5, v6);
  }
}

- (void)setScenePresenterIsValid:(BOOL)a3
{
  if (self->_scenePresenterIsValid != a3)
  {
    self->_scenePresenterIsValid = a3;
    [(PRSceneViewController *)self _update];
  }
}

- (void)_failWithFatalError:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PBFPosterSceneSnapshotViewController;
  [(PRSceneViewController *)&v4 _failWithFatalError:a3];
  [(_PBFPosterSceneSnapshotViewController *)self invalidate];
}

- (void)_configureInitialSceneSettings:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PBFPosterSceneSnapshotViewController;
  id v4 = a3;
  [(PRSceneViewController *)&v5 _configureInitialSceneSettings:v4];
  -[_PBFPosterSceneSnapshotViewController _myUpdateSettings:](self, "_myUpdateSettings:", v4, v5.receiver, v5.super_class);
}

- (void)_myUpdateSettings:(id)a3
{
  id v27 = a3;
  if ([(PRPosterSnapshotDefinition *)self->_definition isUnlocked]) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  objc_super v5 = [(PBFPosterPreview *)self->_preview previewUniqueIdentifier];
  double v6 = [(PRSceneViewController *)self configuredProperties];
  id v7 = [v6 complicationLayout];
  id v8 = [v7 inlineComplication];
  BOOL v9 = v8 != 0;

  BOOL v10 = [(PRPosterSnapshotDefinition *)self->_definition includesHeaderElements];
  v11 = [v6 complicationLayout];
  v12 = [v11 complications];
  BOOL v13 = [v12 count] != 0;

  v14 = [v6 complicationLayout];
  id v15 = [v14 sidebarComplications];
  BOOL v16 = [v15 count] != 0;

  id v17 = [v6 titleStyleConfiguration];
  [v17 prefersVerticalTitleLayout];

  id v18 = [(_PBFPosterSceneSnapshotViewController *)self traitCollection];
  uint64_t v19 = [v18 userInterfaceStyle];

  objc_msgSend(v27, "pui_setSnapshot:", 0);
  objc_msgSend(v27, "pui_setContent:", 1);
  objc_msgSend(v27, "pui_setMode:", 1);
  objc_msgSend(v27, "pr_setUnlockProgress:", v4);
  objc_msgSend(v27, "pui_setPreviewIdentifier:", v5);
  v20 = [v6 titleStyleConfiguration];
  objc_msgSend(v27, "pr_setPosterTitleStyleConfiguration:", v20);

  v21 = [v6 ambientConfiguration];
  objc_msgSend(v27, "pr_setPosterAmbientConfiguration:", v21);

  objc_msgSend(v27, "pui_setInlineComplicationConfigured:", v9);
  objc_msgSend(v27, "pui_setComplicationRowConfigured:", v13);
  objc_msgSend(v27, "pui_setComplicationSidebarConfigured:", v16);
  objc_msgSend(v27, "pui_setShowsComplications:", 0);
  objc_msgSend(v27, "pui_setShowsHeaderElements:", v10);
  objc_msgSend(v27, "pui_setUserInterfaceStyle:", v19);
  v22 = [(_PBFPosterSceneSnapshotViewController *)self displayContext];
  uint64_t v23 = objc_msgSend(v22, "pbf_interfaceOrientation");
  uint64_t v24 = objc_msgSend(v27, "pr_setDepthEffectDisallowed:", PRIsDepthEffectDisallowed());
  if (MEMORY[0x1D94336E0](v24))
  {
    objc_msgSend(v27, "pui_setDeviceOrientation:", v23);
    uint64_t v25 = 1;
  }
  else
  {
    if (PFCurrentDeviceClass() == 1) {
      uint64_t v26 = v23;
    }
    else {
      uint64_t v26 = 1;
    }
    objc_msgSend(v27, "pui_setDeviceOrientation:", v26);
    uint64_t v25 = objc_msgSend(v22, "pbf_interfaceOrientation");
  }
  [v27 setInterfaceOrientation:v25];
}

- (void)_sceneContentReadinessDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_PBFPosterSceneSnapshotViewController;
  [(PRSceneViewController *)&v3 _sceneContentReadinessDidChange];
  [(_PBFPosterSceneSnapshotViewController *)self setState:[(PRSceneViewController *)self isSceneContentReady]];
}

- (void)_teardown
{
  v3.receiver = self;
  v3.super_class = (Class)_PBFPosterSceneSnapshotViewController;
  [(PRSceneViewController *)&v3 _teardown];
  [(_PBFPosterSceneSnapshotViewController *)self setState:2];
}

- (BOOL)scenePresenterIsValid
{
  return self->_scenePresenterIsValid;
}

- (int64_t)state
{
  return self->_state;
}

- (_PBFPosterSceneSnapshotViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_PBFPosterSceneSnapshotViewControllerDelegate *)WeakRetained;
}

- (PFPosterExtensionInstance)extensionInstance
{
  return self->_extensionInstance;
}

- (PBFPosterPreview)preview
{
  return self->_preview;
}

- (PBFPosterSnapshotDefinition)definition
{
  return self->_definition;
}

- (PBFDisplayContext)displayContext
{
  return self->_displayContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayContext, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_extensionInstance, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end