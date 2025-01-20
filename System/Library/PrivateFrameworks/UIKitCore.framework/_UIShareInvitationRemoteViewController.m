@interface _UIShareInvitationRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (_UISharingPublicController)publicController;
- (void)_cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6;
- (void)_cloudSharingControllerDidActivateShowActivityController;
- (void)_cloudSharingControllerDidActivateShowSharedFolder;
- (void)_cloudSharingControllerDidChooseTransport:(id)a3;
- (void)_cloudSharingControllerDidModifyPrimarySwitch:(BOOL)a3;
- (void)_cloudSharingControllerDidModifySecondarySwitch:(BOOL)a3;
- (void)_cloudSharingControllerDidUpdateRootFolderURL:(id)a3;
- (void)_dismissAndRepresentForActivity:(id)a3;
- (void)_dismissForActivityRepresentation:(id)a3;
- (void)_dismissViewController;
- (void)_dismissViewControllerWithError:(id)a3;
- (void)_performAuxiliaryActionWithCompletion:(id)a3;
- (void)_performHeaderActionWithCompletion:(id)a3;
- (void)_representFullscreenAfterActivityDismissal:(id)a3;
- (void)_requestContentSize:(CGSize)a3;
- (void)_requestSavedShareWithCompletion:(id)a3;
- (void)_shareDidChange:(id)a3;
- (void)_shareWasMadePrivate;
- (void)_tintColorDidChangeToColor:(id)a3;
- (void)_updateTraitCollectionForPopoverStatus;
- (void)didMoveToParentViewController:(id)a3;
- (void)setPublicController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation _UIShareInvitationRemoteViewController

+ (id)serviceViewControllerInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED701D20];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel__setParticipantDetails_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)exportedInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED6AE598];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  v3 = (void (*)(void))_MergedGlobals_1337;
  v12 = _MergedGlobals_1337;
  if (!_MergedGlobals_1337)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getCKOperationProgressCallbackClassesSymbolLoc_block_invoke;
    v8[3] = &unk_1E52D9900;
    v8[4] = &v9;
    __getCKOperationProgressCallbackClassesSymbolLoc_block_invoke(v8);
    v3 = (void (*)(void))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (v3)
  {
    uint64_t v4 = v3();
    [v2 setClasses:v4 forSelector:sel__dismissViewControllerWithError_ argumentIndex:0 ofReply:0];

    return v2;
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = [NSString stringWithUTF8String:"NSSet *_CKOperationProgressCallbackClasses(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"_UIShareInvitationRemoteViewController.m", 33, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (void)viewDidLoad
{
  v3 = [(UIViewController *)self view];
  uint64_t v4 = objc_alloc_init(_UIShareInvitationRemoteViewControllerTintColorView);
  [v3 addSubview:v4];

  v5.receiver = self;
  v5.super_class = (Class)_UIShareInvitationRemoteViewController;
  [(UIViewController *)&v5 viewDidLoad];
}

- (void)_dismissViewController
{
  id v2 = [(_UIShareInvitationRemoteViewController *)self publicController];
  [v2 _dismissViewControllerWithError:0];
}

- (void)_dismissViewControllerWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIShareInvitationRemoteViewController *)self publicController];
  [v5 _dismissViewControllerWithError:v4];
}

- (void)_shareDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIShareInvitationRemoteViewController *)self publicController];
  [v5 _shareDidChange:v4];
}

- (void)_shareWasMadePrivate
{
  id v2 = [(_UIShareInvitationRemoteViewController *)self publicController];
  [v2 _shareWasMadePrivate];
}

- (void)_tintColorDidChangeToColor:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v5 _setTintColor:v4];
}

- (void)_performAuxiliaryActionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIShareInvitationRemoteViewController *)self publicController];
  [v5 _performAuxiliaryActionWithCompletion:v4];
}

- (void)_cloudSharingControllerDidModifyPrimarySwitch:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIShareInvitationRemoteViewController *)self publicController];
  [v4 _cloudSharingControllerDidModifyPrimarySwitch:v3];
}

- (void)_cloudSharingControllerDidModifySecondarySwitch:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIShareInvitationRemoteViewController *)self publicController];
  [v4 _cloudSharingControllerDidModifySecondarySwitch:v3];
}

- (void)_cloudSharingControllerDidUpdateRootFolderURL:(id)a3
{
  id v5 = [a3 url];
  id v4 = [(_UIShareInvitationRemoteViewController *)self publicController];
  [v4 _cloudSharingControllerDidUpdateRootFolderURL:v5];
}

- (void)_cloudSharingControllerDidActivateShowSharedFolder
{
  id v2 = [(_UIShareInvitationRemoteViewController *)self publicController];
  [v2 _cloudSharingControllerDidActivateShowSharedFolder];
}

- (void)_cloudSharingControllerDidActivateShowActivityController
{
  id v2 = [(_UIShareInvitationRemoteViewController *)self publicController];
  [v2 _cloudSharingControllerDidActivateShowActivityController];
}

- (void)_cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  id v10 = [(_UIShareInvitationRemoteViewController *)self publicController];
  [v10 _cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:a3 y:a4 width:a5 height:a6];
}

- (void)_cloudSharingControllerDidChooseTransport:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIShareInvitationRemoteViewController *)self publicController];
  [v5 _cloudSharingControllerDidChooseTransport:v4];
}

- (void)_performHeaderActionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIShareInvitationRemoteViewController *)self publicController];
  [v5 _performHeaderActionWithCompletion:v4];
}

- (void)_dismissAndRepresentForActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIShareInvitationRemoteViewController *)self publicController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74___UIShareInvitationRemoteViewController__dismissAndRepresentForActivity___block_invoke;
  v7[3] = &unk_1E52DA160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 _dismissForActivityRepresentation:v7];
}

- (void)_dismissForActivityRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIShareInvitationRemoteViewController *)self publicController];
  [v5 _dismissForActivityRepresentation:v4];
}

- (void)_representFullscreenAfterActivityDismissal:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIShareInvitationRemoteViewController *)self publicController];
  [v5 _representFullscreenAfterActivityDismissal:v4];
}

- (void)_requestSavedShareWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIShareInvitationRemoteViewController *)self publicController];
  [v5 _requestSavedShareWithCompletion:v4];
}

- (void)viewWillLayoutSubviews
{
  [(_UIShareInvitationRemoteViewController *)self _updateTraitCollectionForPopoverStatus];
  BOOL v3 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  objc_msgSend(v3, "_setIsInPopoverMode:", -[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"));

  v4.receiver = self;
  v4.super_class = (Class)_UIShareInvitationRemoteViewController;
  [(UIViewController *)&v4 viewWillLayoutSubviews];
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4 = a3;
  [(_UIShareInvitationRemoteViewController *)self _updateTraitCollectionForPopoverStatus];
  id v5 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  objc_msgSend(v5, "_setIsInPopoverMode:", -[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"));

  v6.receiver = self;
  v6.super_class = (Class)_UIShareInvitationRemoteViewController;
  [(_UIRemoteViewController *)&v6 didMoveToParentViewController:v4];
}

- (void)_updateTraitCollectionForPopoverStatus
{
  BOOL v3 = [(UIViewController *)self view];
  id v4 = [v3 window];

  if (v4)
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"));
    id v7 = +[UITraitCollection _traitCollectionWithValue:v5 forTraitNamed:@"_UIShareInvitationPopoverTrait"];

    objc_super v6 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
    [v6 _setOverrideTraitCollection:v7];
  }
}

- (void)_requestContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(_UIShareInvitationRemoteViewController *)self publicController];
  objc_msgSend(v5, "setPreferredContentSize:", width, height);
}

- (_UISharingPublicController)publicController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_publicController);
  return (_UISharingPublicController *)WeakRetained;
}

- (void)setPublicController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end