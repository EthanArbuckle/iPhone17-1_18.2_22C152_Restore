@interface _UIEditMenuOverlayUIClientPresentation
- (_UIEditMenuOverlayUIClientPresentation)initWithDelegate:(id)a3 sourceView:(id)a4;
- (_UIHostedMenuManager)menuManager;
- (_UIOEditMenuPresentationConfiguration)presentationConfiguration;
- (_UIOverlayService)overlayService;
- (id)displayedMenu;
- (void)_configureOverlayServiceIfNeeded;
- (void)didTransitionFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)displayMenu:(id)a3 configuration:(id)a4;
- (void)handleLifecycleEvent:(int64_t)a3;
- (void)hideMenuWithReason:(int64_t)a3;
- (void)overlayServiceDidInvalidate:(id)a3;
- (void)performMenuLeafAction:(id)a3 completionHandler:(id)a4;
- (void)preparedMenuWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)replaceVisibleMenuWithMenu:(id)a3 reason:(int64_t)a4;
- (void)setDisplayedMenu:(id)a3;
- (void)sourceViewDidUpdateFromTraitCollection:(id)a3;
@end

@implementation _UIEditMenuOverlayUIClientPresentation

- (_UIEditMenuOverlayUIClientPresentation)initWithDelegate:(id)a3 sourceView:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIEditMenuOverlayUIClientPresentation;
  v4 = [(_UIEditMenuPresentation *)&v8 initWithDelegate:a3 sourceView:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    menuManager = v4->_menuManager;
    v4->_menuManager = (_UIHostedMenuManager *)v5;
  }
  return v4;
}

- (void)setDisplayedMenu:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"_UIEditMenuOverlayUIPresentation.m" lineNumber:51 description:@"setDisplayedMenu: is not available"];
}

- (id)displayedMenu
{
  return [(_UIHostedMenuManager *)self->_menuManager displayedMenu];
}

- (void)displayMenu:(id)a3 configuration:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(_UIEditMenuPresentation *)self setActiveConfiguration:v7];
  objc_super v8 = [(_UIEditMenuPresentation *)self sourceView];
  v9 = +[_UIEditMenuSceneComponent sceneComponentForView:v8];

  if (v9)
  {
    [(_UIEditMenuOverlayUIClientPresentation *)self _configureOverlayServiceIfNeeded];
    v10 = [(_UIEditMenuPresentation *)self delegate];
    [v10 _editMenuPresentation:self targetRectForConfiguration:v7];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    CGFloat v18 = v17;

    v19 = [(_UIEditMenuPresentation *)self sourceView];
    double v20 = -[UIView _constrainRectWithinSceneBounds:additionalInsets:](v19, v12, v14, v16, v18, 10.0);
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    +[_UIOEditMenuPresentationConfiguration configurationWithMenu:preferredArrowDirection:sourceRect:enforcesMenuControllerLifecycle:initialUserInterfaceStyle:](_UIOEditMenuPresentationConfiguration, "configurationWithMenu:preferredArrowDirection:sourceRect:enforcesMenuControllerLifecycle:initialUserInterfaceStyle:", v6, [v7 preferredArrowDirection], -[_UIEditMenuPresentation enforcesMenuControllerLifecycle](self, "enforcesMenuControllerLifecycle"), -[_UIEditMenuPresentation resolvedUserInterfaceStyle](self, "resolvedUserInterfaceStyle"), v20, v22, v24, v26);
    v27 = (_UIOEditMenuPresentationConfiguration *)objc_claimAutoreleasedReturnValue();
    presentationConfiguration = self->_presentationConfiguration;
    self->_presentationConfiguration = v27;

    [v9 setActivePresentation:self];
    v29 = [(_UIEditMenuOverlayUIClientPresentation *)self menuManager];
    [v29 setRootMenu:v6];

    v30 = [_UIORequestEditMenuPresentationAction alloc];
    v31 = self->_presentationConfiguration;
    v32 = [(_UIEditMenuPresentation *)self sourceView];
    v33 = [(_UIORequestEditMenuPresentationAction *)v30 initWithConfiguration:v31 view:v32];

    v34 = [(_UIEditMenuOverlayUIClientPresentation *)self overlayService];
    [v34 sendOverlayAction:v33];

LABEL_7:
    goto LABEL_8;
  }
  if (os_variant_has_internal_diagnostics())
  {
    v33 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      goto LABEL_7;
    }
    v36 = [(_UIEditMenuPresentation *)self activeConfiguration];
    v37 = [(_UIEditMenuPresentation *)self sourceView];
    int v38 = 138412546;
    v39 = v36;
    __int16 v40 = 2112;
    v41 = v37;
    _os_log_fault_impl(&dword_1853B0000, v33, OS_LOG_TYPE_FAULT, "The edit menu (configuration: %@) can only be presented when the view is in a window scene: %@", (uint8_t *)&v38, 0x16u);
    goto LABEL_6;
  }
  v35 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &displayMenu_configuration____s_category) + 8);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    v33 = v35;
    v36 = [(_UIEditMenuPresentation *)self activeConfiguration];
    v37 = [(_UIEditMenuPresentation *)self sourceView];
    int v38 = 138412546;
    v39 = v36;
    __int16 v40 = 2112;
    v41 = v37;
    _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_ERROR, "The edit menu (configuration: %@) can only be presented when the view is in a window scene: %@", (uint8_t *)&v38, 0x16u);
LABEL_6:

    goto LABEL_7;
  }
LABEL_8:
}

- (void)sourceViewDidUpdateFromTraitCollection:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_UIEditMenuPresentation *)self resolvedUserInterfaceStyle];
  uint64_t v6 = [v4 userInterfaceStyle];

  if (v5 != v6)
  {
    id v7 = [_UIORequestEditMenuTraitUpdateAction alloc];
    objc_super v8 = [(_UIEditMenuOverlayUIClientPresentation *)self presentationConfiguration];
    v9 = [v8 identifier];
    double v11 = [(_UIORequestEditMenuTraitUpdateAction *)v7 initWithConfigurationIdentifier:v9 userInterfaceStyle:v5];

    v10 = [(_UIEditMenuOverlayUIClientPresentation *)self overlayService];
    [v10 sendOverlayAction:v11];
  }
}

- (void)replaceVisibleMenuWithMenu:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  id v7 = [_UIORequestEditMenuUpdateAction alloc];
  objc_super v8 = [(_UIEditMenuOverlayUIClientPresentation *)self presentationConfiguration];
  v9 = [v8 identifier];
  double v12 = [(_UIORequestEditMenuUpdateAction *)v7 initWithConfigurationIdentifier:v9 updatedMenu:v6 reason:a4];

  v10 = [(_UIEditMenuOverlayUIClientPresentation *)self overlayService];
  [v10 sendOverlayAction:v12];

  double v11 = [(_UIEditMenuOverlayUIClientPresentation *)self menuManager];
  [v11 setDisplayedMenu:v6];
}

- (void)hideMenuWithReason:(int64_t)a3
{
  int64_t v5 = [(_UIEditMenuOverlayUIClientPresentation *)self presentationConfiguration];
  id v10 = [v5 identifier];

  id v6 = [[_UIORequestEditMenuDismissalAction alloc] initWithConfigurationIdentifier:v10 reason:a3];
  id v7 = [(_UIEditMenuOverlayUIClientPresentation *)self overlayService];
  [v7 sendOverlayAction:v6];

  objc_super v8 = [(_UIEditMenuPresentation *)self sourceView];
  v9 = +[_UIEditMenuSceneComponent sceneComponentForView:v8];
  [v9 removeActivePresentation:self];
}

- (void)handleLifecycleEvent:(int64_t)a3
{
  if ((unint64_t)a3 <= 3) {
    -[_UIEditMenuPresentation transitionWithEvent:](self, "transitionWithEvent:");
  }
}

- (void)performMenuLeafAction:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(_UIEditMenuOverlayUIClientPresentation *)self menuManager];
  v9 = [v7 identifier];
  id v10 = [v8 menuLeafForIdentifier:v9];

  double v11 = [v7 pasteAuthenticationMessage];

  +[UIPasteboard _attemptAuthenticationWithMessage:v11];
  if (v10)
  {
    double v12 = [(_UIEditMenuPresentation *)self delegate];
    [v12 _editMenuPresentation:self didSelectMenuLeaf:v10 completion:v6];
  }
  else if (os_variant_has_internal_diagnostics())
  {
    double v14 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "Could not find matching menu leaf in the menu...", buf, 2u);
    }
  }
  else
  {
    double v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &performMenuLeafAction_completionHandler____s_category)
                       + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v15 = 0;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Could not find matching menu leaf in the menu...", v15, 2u);
    }
  }
}

- (void)preparedMenuWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [(_UIEditMenuOverlayUIClientPresentation *)self menuManager];
  id v10 = [v9 menuForIdentifier:v8];

  if (!v10)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"_UIEditMenuOverlayUIPresentation.m" lineNumber:158 description:@"Could not find matching menu for the given request"];
  }
  double v11 = [(_UIEditMenuPresentation *)self delegate];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87___UIEditMenuOverlayUIClientPresentation_preparedMenuWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E52F37B8;
  v14[4] = self;
  id v15 = v7;
  id v12 = v7;
  [v11 _editMenuPresentation:self preparedMenuForDisplay:v10 completion:v14];
}

- (void)didTransitionFrom:(unint64_t)a3 to:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_UIEditMenuOverlayUIClientPresentation;
  -[_UIEditMenuPresentation didTransitionFrom:to:](&v10, sel_didTransitionFrom_to_, a3);
  if (a4 == 4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63___UIEditMenuOverlayUIClientPresentation_didTransitionFrom_to___block_invoke_2;
    v8[3] = &unk_1E52D9F70;
    v8[4] = self;
    [(_UIEditMenuPresentation *)self animateScaleDismissalWithAnimations:v8 completion:0];
    id v6 = [(_UIEditMenuPresentation *)self sourceView];
    id v7 = +[_UIEditMenuSceneComponent sceneComponentForView:v6];
    [v7 removeActivePresentation:self];
  }
  else if (a4 == 2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63___UIEditMenuOverlayUIClientPresentation_didTransitionFrom_to___block_invoke;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    [(_UIEditMenuPresentation *)self animateScalePresentWithDelay:v9 animations:0 completion:0.0];
  }
}

- (void)_configureOverlayServiceIfNeeded
{
  if (!self->_overlayService)
  {
    v3 = (_UIOverlayService *)objc_opt_new();
    overlayService = self->_overlayService;
    self->_overlayService = v3;

    [(_UIOverlayService *)self->_overlayService setDelegate:self];
    int64_t v5 = self->_overlayService;
    [(_UIOverlayService *)v5 prewarmConnection];
  }
}

- (void)overlayServiceDidInvalidate:(id)a3
{
}

- (_UIOEditMenuPresentationConfiguration)presentationConfiguration
{
  return self->_presentationConfiguration;
}

- (_UIOverlayService)overlayService
{
  return self->_overlayService;
}

- (_UIHostedMenuManager)menuManager
{
  return self->_menuManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuManager, 0);
  objc_storeStrong((id *)&self->_overlayService, 0);
  objc_storeStrong((id *)&self->_presentationConfiguration, 0);
}

@end