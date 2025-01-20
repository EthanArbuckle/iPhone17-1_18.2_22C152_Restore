@interface _UIEditMenuPresentationServer
+ (id)sharedPresentationServer;
- (CGRect)_editMenuPresentation:(id)a3 targetRectForConfiguration:(id)a4;
- (NSMutableDictionary)configurations;
- (NSMutableDictionary)connections;
- (NSMutableDictionary)presentations;
- (_UIEditMenuPresentationServer)init;
- (id)_editMenuPresentation:(id)a3 preferredLayoutRectsForConfiguration:(id)a4;
- (id)_editMenuPresentation:(id)a3 titleViewForMenu:(id)a4 configuration:(id)a5;
- (void)_editMenuPresentation:(id)a3 didSelectMenuLeaf:(id)a4 completion:(id)a5;
- (void)_editMenuPresentation:(id)a3 preparedMenuForDisplay:(id)a4 completion:(id)a5;
- (void)_editMenuPresentation:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)_editMenuPresentation:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)_sendLifecycleEvent:(int64_t)a3 forMenuWithIdentifier:(id)a4;
- (void)dismissEditMenuForIdentifier:(id)a3 hideReason:(int64_t)a4;
- (void)presentEditMenuWithConfiguration:(id)a3 originContext:(id)a4 inDisplayDelegate:(id)a5 forConnection:(id)a6;
- (void)replaceEditMenuForIdentifier:(id)a3 updatedMenu:(id)a4 reason:(int64_t)a5;
- (void)setConfigurations:(id)a3;
- (void)setConnections:(id)a3;
- (void)setPresentations:(id)a3;
- (void)updateUserInterfaceStyleForMenuWithIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4;
@end

@implementation _UIEditMenuPresentationServer

+ (id)sharedPresentationServer
{
  if (_MergedGlobals_1222 != -1) {
    dispatch_once(&_MergedGlobals_1222, &__block_literal_global_485);
  }
  v2 = (void *)qword_1EB262EC8;
  return v2;
}

- (_UIEditMenuPresentationServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)_UIEditMenuPresentationServer;
  v2 = [(_UIEditMenuPresentationServer *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    configurations = v2->_configurations;
    v2->_configurations = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    presentations = v2->_presentations;
    v2->_presentations = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    connections = v2->_connections;
    v2->_connections = (NSMutableDictionary *)v7;

    +[UIEditMenuInteraction _registerPlatformMetrics]();
  }
  return v2;
}

- (void)presentEditMenuWithConfiguration:(id)a3 originContext:(id)a4 inDisplayDelegate:(id)a5 forConnection:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v21 = [v13 identifier];
  v14 = [(_UIEditMenuPresentationServer *)self configurations];
  [v14 setObject:v13 forKey:v21];

  v15 = [(_UIEditMenuPresentationServer *)self connections];
  [v15 setObject:v10 forKey:v21];

  v16 = [_UIEditMenuOverlayUIServerPresentation alloc];
  v17 = [v11 rootViewController];
  v18 = [v17 view];
  v19 = [(_UIEditMenuPresentation *)v16 initWithDelegate:self sourceView:v18];

  -[_UIEditMenuPresentation setEnforcesMenuControllerLifecycle:](v19, "setEnforcesMenuControllerLifecycle:", [v13 enforcesMenuControllerLifecycle]);
  [(_UIEditMenuOverlayUIServerPresentation *)v19 displayMenuForConfiguration:v13 originContext:v12 inDisplayDelegate:v11];

  v20 = [(_UIEditMenuPresentationServer *)self presentations];
  [v20 setObject:v19 forKey:v21];
}

- (void)dismissEditMenuForIdentifier:(id)a3 hideReason:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(_UIEditMenuPresentationServer *)self presentations];
  id v8 = [v7 objectForKeyedSubscript:v6];

  [v8 hideMenuWithReason:a4];
}

- (void)replaceEditMenuForIdentifier:(id)a3 updatedMenu:(id)a4 reason:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(_UIEditMenuPresentationServer *)self presentations];
  id v11 = [v10 objectForKeyedSubscript:v9];

  [v11 replaceVisibleMenuWithMenu:v8 reason:a5];
}

- (void)updateUserInterfaceStyleForMenuWithIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(_UIEditMenuPresentationServer *)self presentations];
  id v8 = [v7 objectForKeyedSubscript:v6];

  [v8 setUserInterfaceStyle:a4];
}

- (void)_sendLifecycleEvent:(int64_t)a3 forMenuWithIdentifier:(id)a4
{
  id v6 = a4;
  id v9 = [[_UIOEditMenuLifecycleEventUpdateAction alloc] initWithMenuIdentifier:v6 event:a3];
  uint64_t v7 = [(_UIEditMenuPresentationServer *)self connections];
  id v8 = [v7 objectForKeyedSubscript:v6];

  [v8 sendAction:v9];
}

- (void)_editMenuPresentation:(id)a3 didSelectMenuLeaf:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 presentationConfiguration];
  id v11 = [v10 identifier];

  id v12 = [(_UIEditMenuPresentationServer *)self connections];
  id v13 = [v12 objectForKeyedSubscript:v11];

  id v14 = v8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84___UIEditMenuPresentationServer__editMenuPresentation_didSelectMenuLeaf_completion___block_invoke;
  aBlock[3] = &unk_1E53057D8;
  id v15 = v9;
  id v25 = v15;
  id v16 = v13;
  id v24 = v16;
  v17 = _Block_copy(aBlock);
  if ([v14 _acceptBoolMenuVisit:0 commandVisit:&__block_literal_global_113_7 actionVisit:&__block_literal_global_117_3])
  {
    v18 = +[UIPasteboard generalPasteboard];
    uint64_t v19 = [v16 pid];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __84___UIEditMenuPresentationServer__editMenuPresentation_didSelectMenuLeaf_completion___block_invoke_4;
    v20[3] = &unk_1E5305800;
    id v22 = v17;
    id v21 = v14;
    [v18 _requestSecurePasteAuthenticationMessageWithContext:0x51A2F5DDCA075EA1 forClientVersionedPID:v19 completionBlock:v20];
  }
  else
  {
    (*((void (**)(void *, id, void))v17 + 2))(v17, v14, 0);
  }
}

- (void)_editMenuPresentation:(id)a3 preparedMenuForDisplay:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 presentationConfiguration];
  id v11 = [v10 identifier];

  id v12 = [(_UIEditMenuPresentationServer *)self connections];
  id v13 = [v12 objectForKeyedSubscript:v11];

  id v14 = [_UIOMenuPreparationAction alloc];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89___UIEditMenuPresentationServer__editMenuPresentation_preparedMenuForDisplay_completion___block_invoke;
  v17[3] = &unk_1E5305828;
  id v18 = v8;
  id v15 = v8;
  id v16 = [(_UIOMenuPreparationAction *)v14 initWithMenu:v9 responseHandler:v17];

  [v13 sendAction:v16];
}

- (id)_editMenuPresentation:(id)a3 titleViewForMenu:(id)a4 configuration:(id)a5
{
  return 0;
}

- (CGRect)_editMenuPresentation:(id)a3 targetRectForConfiguration:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 presentationConfiguration];
  if (!v7)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"_UIEditMenuPresentationServer.m" lineNumber:163 description:@"Cannot present a menu without a presentation configuration"];
  }
  id v8 = [v6 originContext];
  id v9 = [v6 sourceView];

  [v8 translatedReferencePointForDestinationView:v9];
  double v11 = v10;
  double v13 = v12;

  [v7 sourceRect];
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)_editMenuPresentation:(id)a3 preferredLayoutRectsForConfiguration:(id)a4
{
  return 0;
}

- (void)_editMenuPresentation:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a5;
  id v8 = [a3 presentationConfiguration];
  id v9 = [v8 identifier];

  [(_UIEditMenuPresentationServer *)self _sendLifecycleEvent:0 forMenuWithIdentifier:v9];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96___UIEditMenuPresentationServer__editMenuPresentation_willPresentMenuForConfiguration_animator___block_invoke;
  v11[3] = &unk_1E52D9F98;
  v11[4] = self;
  id v12 = v9;
  id v10 = v9;
  [v7 addCompletion:v11];
}

- (void)_editMenuPresentation:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a5;
  id v8 = [a3 presentationConfiguration];
  id v9 = [v8 identifier];

  [(_UIEditMenuPresentationServer *)self _sendLifecycleEvent:2 forMenuWithIdentifier:v9];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96___UIEditMenuPresentationServer__editMenuPresentation_willDismissMenuForConfiguration_animator___block_invoke;
  v11[3] = &unk_1E52D9F98;
  v11[4] = self;
  id v12 = v9;
  id v10 = v9;
  [v7 addCompletion:v11];
}

- (NSMutableDictionary)configurations
{
  return self->_configurations;
}

- (void)setConfigurations:(id)a3
{
}

- (NSMutableDictionary)presentations
{
  return self->_presentations;
}

- (void)setPresentations:(id)a3
{
}

- (NSMutableDictionary)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_presentations, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
}

@end