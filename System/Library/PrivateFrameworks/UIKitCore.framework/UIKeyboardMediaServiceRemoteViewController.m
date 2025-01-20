@interface UIKeyboardMediaServiceRemoteViewController
+ (BOOL)__shouldHostRemoteTextEffectsWindow;
+ (id)exportedInterface;
+ (id)requestCardViewControllerWithConnectionHandler:(id)a3;
+ (id)requestInlineViewControllerWithConnectionHandler:(id)a3;
+ (id)serviceViewControllerInterface;
- (BOOL)__shouldRemoteViewControllerFenceGeometryChange:(id *)a3 forAncestor:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isShownInline;
- (UIKeyboardMediaServiceRemoteViewControllerDelegate)delegate;
- (void)_setShownInline:(BOOL)a3;
- (void)dismissCard;
- (void)draggedStickerToPoint:(CGPoint)a3;
- (void)pasteImageAtFileHandle:(id)a3;
- (void)presentCard;
- (void)remoteHandlesRecentsStickerDonationWithCompletionHandler:(id)a3;
- (void)requestInsertionPointCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHostBundleID:(id)a3;
- (void)stageSticker:(id)a3;
- (void)stageStickerWithFileHandle:(id)a3 url:(id)a4 accessibilityLabel:(id)a5;
- (void)stageStickerWithIdentifier:(id)a3 representations:(id)a4 name:(id)a5 externalURI:(id)a6 accessibilityLabel:(id)a7;
- (void)stickerPickerCardDidLoad;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation UIKeyboardMediaServiceRemoteViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)requestInlineViewControllerWithConnectionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_os_feature_enabled_impl()) {
    v5 = @"InlineRecentStickersViewController";
  }
  else {
    v5 = @"InlineRecentsViewController";
  }
  v6 = _UIKBMediaLog_0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_INFO, "Requesting inline remote VC %@", buf, 0xCu);
  }

  uint64_t v7 = UIKeyboardMediaServiceBundleIdentifier;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__UIKeyboardMediaServiceRemoteViewController_requestInlineViewControllerWithConnectionHandler___block_invoke;
  v11[3] = &unk_1E52ED0D0;
  v12 = v5;
  id v13 = v4;
  id v8 = v4;
  v9 = [a1 requestViewController:v5 fromServiceWithBundleIdentifier:v7 connectionHandler:v11];

  return v9;
}

void __95__UIKeyboardMediaServiceRemoteViewController_requestInlineViewControllerWithConnectionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _UIKBMediaLog_0();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(void **)(a1 + 32);
      int v11 = 138412546;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_error_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Unable to request %@: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_INFO, "Got back readyController %@", (uint8_t *)&v11, 0xCu);
  }

  int v10 = _UIUpdateCycleEnabled();
  if (v5 && v10) {
    [v5 _setShownInline:1];
  }
  [v5 _setViewClipsToBounds:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)requestCardViewControllerWithConnectionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_os_feature_enabled_impl()) {
    id v5 = @"StickersAppCardViewController";
  }
  else {
    id v5 = @"AppCardViewController";
  }
  id v6 = _UIKBMediaLog_0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v5;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_INFO, "Requesting remote card VC %@", buf, 0xCu);
  }

  uint64_t v7 = UIKeyboardMediaServiceBundleIdentifier;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__UIKeyboardMediaServiceRemoteViewController_requestCardViewControllerWithConnectionHandler___block_invoke;
  v11[3] = &unk_1E52ED0D0;
  id v12 = v5;
  id v13 = v4;
  id v8 = v4;
  v9 = [a1 requestViewController:v5 fromServiceWithBundleIdentifier:v7 connectionHandler:v11];

  return v9;
}

void __93__UIKeyboardMediaServiceRemoteViewController_requestCardViewControllerWithConnectionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _UIKBMediaLog_0();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(void **)(a1 + 32);
      int v10 = 138412546;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_error_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Unable to request %@: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_INFO, "Got back readyController %@", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setHostBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v5 setHostBundleID:v4];
}

+ (BOOL)__shouldHostRemoteTextEffectsWindow
{
  return 0;
}

+ (id)serviceViewControllerInterface
{
  if (qword_1EB260BE8 != -1) {
    dispatch_once(&qword_1EB260BE8, &__block_literal_global_259);
  }
  v2 = (void *)_MergedGlobals_1075;
  return v2;
}

void __76__UIKeyboardMediaServiceRemoteViewController_serviceViewControllerInterface__block_invoke()
{
  int v0 = _os_feature_enabled_impl();
  v1 = &protocolRef__UIStickerPickerServiceProtocol;
  if (!v0) {
    v1 = &protocolRef_UIKeyboardMediaServiceProtocol;
  }
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:*v1];
  v3 = (void *)_MergedGlobals_1075;
  _MergedGlobals_1075 = v2;
}

+ (id)exportedInterface
{
  if (qword_1EB260BF8 != -1) {
    dispatch_once(&qword_1EB260BF8, &__block_literal_global_83_0);
  }
  uint64_t v2 = (void *)qword_1EB260BF0;
  return v2;
}

void __63__UIKeyboardMediaServiceRemoteViewController_exportedInterface__block_invoke()
{
  if (_os_feature_enabled_impl())
  {
    uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED54C8D8];
    v1 = (void *)qword_1EB260BF0;
    qword_1EB260BF0 = v0;

    uint64_t v2 = (void *)qword_1EB260BF0;
    v3 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v4 = objc_opt_class();
    id v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
    [v2 setClasses:v5 forSelector:sel_stageStickerWithIdentifier_representations_name_externalURI_accessibilityLabel_ argumentIndex:1 ofReply:0];

    id v6 = (void *)qword_1EB260BF0;
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    [v6 setClasses:v16 forSelector:sel_stageSticker_ argumentIndex:0 ofReply:0];
    uint64_t v14 = (void *)v16;
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED54C7B8];
    uint64_t v14 = (void *)qword_1EB260BF0;
    qword_1EB260BF0 = v15;
  }
}

- (BOOL)__shouldRemoteViewControllerFenceGeometryChange:(id *)a3 forAncestor:(id)a4
{
  id v6 = a4;
  if (_UIUpdateCycleEnabled() && self->_shownInline && (a3->var0 & 4) != 0) {
    int v7 = objc_msgSend(v6, "__isKindOfUIScrollView") ^ 1;
  }
  else {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardMediaServiceRemoteViewController *)self delegate];
  [v5 viewServiceDidTerminateWithError:v4];
}

- (void)presentCard
{
  id v2 = [(UIKeyboardMediaServiceRemoteViewController *)self delegate];
  [v2 presentCard];
}

- (void)dismissCard
{
  id v2 = [(UIKeyboardMediaServiceRemoteViewController *)self delegate];
  [v2 dismissCard];
}

- (void)pasteImageAtFileHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardMediaServiceRemoteViewController *)self delegate];
  [v5 pasteImageAtFileHandle:v4];
}

- (void)stageStickerWithFileHandle:(id)a3 url:(id)a4 accessibilityLabel:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(UIKeyboardMediaServiceRemoteViewController *)self delegate];
  [v11 stageStickerWithFileHandle:v10 url:v9 accessibilityLabel:v8];
}

- (void)requestInsertionPointCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardMediaServiceRemoteViewController *)self delegate];
  [v5 requestInsertionPointCompletion:v4];
}

- (void)draggedStickerToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(UIKeyboardMediaServiceRemoteViewController *)self delegate];
  objc_msgSend(v5, "draggedStickerToPoint:", x, y);
}

- (void)stageStickerWithIdentifier:(id)a3 representations:(id)a4 name:(id)a5 externalURI:(id)a6 accessibilityLabel:(id)a7
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  v17 = _UIKBMediaLog_0();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    id v20 = v12;
    _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_INFO, "Staging sticker identifier %@", (uint8_t *)&v19, 0xCu);
  }

  v18 = [(UIKeyboardMediaServiceRemoteViewController *)self delegate];
  [v18 stageStickerWithIdentifier:v12 representations:v16 name:v15 externalURI:v14 accessibilityLabel:v13];
}

- (void)stageSticker:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _UIKBMediaLog_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 identifier];
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_INFO, "Staging sticker identifier %@", (uint8_t *)&v8, 0xCu);
  }
  int v7 = [(UIKeyboardMediaServiceRemoteViewController *)self delegate];
  [v7 stageSticker:v4];
}

- (void)remoteHandlesRecentsStickerDonationWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    int v7 = v4;
    id v5 = [(UIKeyboardMediaServiceRemoteViewController *)self delegate];

    if (v5)
    {
      id v6 = [(UIKeyboardMediaServiceRemoteViewController *)self delegate];
      [v6 remoteHandlesRecentsStickerDonationWithCompletionHandler:v7];
    }
    else
    {
      v7[2](v7, 1);
    }
    id v4 = v7;
  }
}

- (void)stickerPickerCardDidLoad
{
  id v2 = [(UIKeyboardMediaServiceRemoteViewController *)self delegate];
  [v2 stickerPickerCardDidLoad];
}

- (BOOL)_isShownInline
{
  return self->_shownInline;
}

- (void)_setShownInline:(BOOL)a3
{
  self->_shownInline = a3;
}

- (UIKeyboardMediaServiceRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardMediaServiceRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end