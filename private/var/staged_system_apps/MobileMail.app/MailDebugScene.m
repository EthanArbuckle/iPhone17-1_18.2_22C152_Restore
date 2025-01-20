@interface MailDebugScene
- (MFMailDebugMenuController)debugMenu;
- (void)debugMenuWantsDismissal:(id)a3;
- (void)mailSceneDidConnectWithOptions:(id)a3;
- (void)setDebugMenu:(id)a3;
@end

@implementation MailDebugScene

- (void)mailSceneDidConnectWithOptions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MailDebugScene;
  [(MailScene *)&v10 mailSceneDidConnectWithOptions:v4];
  v5 = [[MFMailDebugMenuController alloc] initWithScene:self];
  [(MailDebugScene *)self setDebugMenu:v5];

  v6 = [(MailDebugScene *)self debugMenu];
  [v6 setPresenter:self];

  [(MailDebugScene *)self setTitle:@"Debugging"];
  v7 = +[NSPredicate predicateWithFormat:@"self == %@", @"com.apple.mail.private.debugmenu"];
  v8 = [(MailDebugScene *)self activationConditions];
  [v8 setCanActivateForTargetContentIdentifierPredicate:v7];

  v9 = [(MailDebugScene *)self activationConditions];
  [v9 setPrefersToActivateForTargetContentIdentifierPredicate:v7];
}

- (void)debugMenuWantsDismissal:(id)a3
{
}

- (MFMailDebugMenuController)debugMenu
{
  return self->_debugMenu;
}

- (void)setDebugMenu:(id)a3
{
}

- (void).cxx_destruct
{
}

@end