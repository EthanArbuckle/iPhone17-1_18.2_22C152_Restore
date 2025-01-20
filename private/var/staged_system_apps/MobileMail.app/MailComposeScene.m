@interface MailComposeScene
+ (OS_os_log)log;
- (BOOL)isComposeWindowActive;
- (ComposeNavigationController)composeNavigationController;
- (id)composeAccountIsDefault:(BOOL *)a3;
- (id)composeViewDelegate;
- (id)getAutosaveId;
- (id)stateRestorationActivityForMailScene;
- (void)mailSceneDidConnectWithOptions:(id)a3;
- (void)mailSceneDidDisconnect;
- (void)mailSceneDidEnterBackground;
- (void)mailSceneWillResignActive;
- (void)resumeCompositionOfDraft:(id)a3 legacyDraft:(id)a4;
- (void)setComposeNavigationController:(id)a3;
- (void)showComposeWithContext:(id)a3 animated:(BOOL)a4 initialTitle:(id)a5 presentationSource:(id)a6 completionBlock:(id)a7;
@end

@implementation MailComposeScene

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010572C;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699648 != -1) {
    dispatch_once(&qword_100699648, block);
  }
  v2 = (void *)qword_100699640;

  return (OS_os_log *)v2;
}

- (void)mailSceneDidConnectWithOptions:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MailComposeScene;
  [(MailScene *)&v25 mailSceneDidConnectWithOptions:v4];
  +[CATransaction setFrameStallSkipRequest:1];
  v5 = sub_100105B0C(self, v4);
  v6 = [MFMailComposeControllerViewDelegateHandler alloc];
  v7 = +[UIApplication sharedApplication];
  v8 = +[UIApplication sharedApplication];
  v9 = [v8 daemonInterface];
  v10 = [(MFMailComposeControllerViewDelegateHandler *)v6 initWithUICoordinator:v7 daemonInterface:v9];
  sub_100105EA8((uint64_t)self, v10);

  v11 = [[ComposeNavigationController alloc] initWithComposition:v5];
  [(MailComposeScene *)self setComposeNavigationController:v11];

  delegateHandler = self->_delegateHandler;
  v13 = [(MailComposeScene *)self composeNavigationController];
  [v13 setMailComposeDelegate:delegateHandler];

  v14 = [(MailComposeScene *)self composeNavigationController];
  v15 = [v14 autosaveIdentifier];

  v16 = [(MailComposeScene *)self composeNavigationController];
  v17 = [v16 originalMessageObjectID];

  v18 = [[MFActiveDraft alloc] initWithIdentifier:v15 andOriginalMessageIdentifier:v17];
  v19 = [(MailComposeScene *)self session];
  [v19 mf_setActiveDraft:v18];

  +[MailComposeViewAnnotationBridge registerMailViewAnnotationDelegate:self];
  v20 = v15;
  if (!v15)
  {
    v19 = +[NSUUID UUID];
    v20 = [v19 UUIDString];
  }
  v21 = MSMailComposeWindowTargetContentIdentifierWithIdentifier();
  v22 = +[NSPredicate predicateWithFormat:@"self == %@", v21];

  if (!v15)
  {
  }
  v23 = [(MailComposeScene *)self activationConditions];
  [v23 setCanActivateForTargetContentIdentifierPredicate:v22];

  v24 = [(MailComposeScene *)self activationConditions];
  [v24 setPrefersToActivateForTargetContentIdentifierPredicate:v22];

  sub_100105EC0(self, v5);
}

- (void)mailSceneWillResignActive
{
  v7.receiver = self;
  v7.super_class = (Class)MailComposeScene;
  [(MailScene *)&v7 mailSceneWillResignActive];
  v3 = [(MailComposeScene *)self composeNavigationController];
  if (![v3 resolution])
  {

    goto LABEL_5;
  }
  id v4 = [(MailComposeScene *)self composeNavigationController];
  id v5 = [v4 resolution];

  if (v5 == (id)2)
  {
LABEL_5:
    v6 = [(MailComposeScene *)self composeNavigationController];
    [v6 willBeginDocking];
  }
}

- (void)mailSceneDidEnterBackground
{
  v9.receiver = self;
  v9.super_class = (Class)MailComposeScene;
  [(MailScene *)&v9 mailSceneDidEnterBackground];
  v3 = [(MailComposeScene *)self composeNavigationController];
  if ([v3 resolution])
  {
    id v4 = [(MailComposeScene *)self composeNavigationController];
    id v5 = [v4 resolution];

    if (v5 != (id)2) {
      return;
    }
  }
  else
  {
  }
  v6 = [(MailComposeScene *)self composeNavigationController];
  [v6 didCompleteDocking];

  if (self) {
    delegateHandler = self->_delegateHandler;
  }
  else {
    delegateHandler = 0;
  }
  v8 = [(MFMailComposeControllerViewDelegateHandler *)delegateHandler delegate];
  [v8 composeFinishedWithResult:1];
}

- (id)stateRestorationActivityForMailScene
{
  v2 = [(MailComposeScene *)self composeNavigationController];
  v3 = [v2 userActivityForRestoration];

  return v3;
}

- (void)mailSceneDidDisconnect
{
  v8.receiver = self;
  v8.super_class = (Class)MailComposeScene;
  [(MailScene *)&v8 mailSceneDidDisconnect];
  v3 = [(MailComposeScene *)self composeNavigationController];
  id v4 = [v3 resolution];

  if (!v4)
  {
    id v5 = [(MailComposeScene *)self composeNavigationController];
    [v5 _setCompositionContext:0];

    v6 = +[UIApplication sharedApplication];
    objc_super v7 = [v6 dockPersistence];
    [v7 recoverAbandonedDrafts];
  }
  +[MailComposeViewAnnotationBridge unregisterMailViewAnnotationDelegate:self];
}

- (BOOL)isComposeWindowActive
{
  return 1;
}

- (void)resumeCompositionOfDraft:(id)a3 legacyDraft:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)_MFMailCompositionContext) initDraftRestoreOfMessage:v9 legacyMessage:v6];
  objc_super v8 = [(MailComposeScene *)self composeNavigationController];
  [v8 _setCompositionContext:v7];
}

- (void)showComposeWithContext:(id)a3 animated:(BOOL)a4 initialTitle:(id)a5 presentationSource:(id)a6 completionBlock:(id)a7
{
  id v14 = a3;
  id v10 = a5;
  v11 = (void (**)(void))a7;
  v12 = [(MailComposeScene *)self composeNavigationController];
  [v12 _setCompositionContext:v14];

  v13 = [(MailComposeScene *)self composeNavigationController];
  [v13 setInitialTitle:v10];

  v11[2](v11);
}

- (id)composeAccountIsDefault:(BOOL *)a3
{
  *a3 = 1;
  return +[MailAccount defaultMailAccountForDelivery];
}

- (id)composeViewDelegate
{
  if (self) {
    self = (MailComposeScene *)self->_delegateHandler;
  }
  return self;
}

- (id)getAutosaveId
{
  v2 = [(MailComposeScene *)self session];
  v3 = [v2 mf_activeDraft];
  id v4 = [v3 identifier];

  return v4;
}

- (ComposeNavigationController)composeNavigationController
{
  return self->_composeNavigationController;
}

- (void)setComposeNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteComposeService, 0);
  objc_storeStrong((id *)&self->_restorationActivity, 0);
  objc_storeStrong((id *)&self->_delegateHandler, 0);

  objc_storeStrong((id *)&self->_composeNavigationController, 0);
}

@end