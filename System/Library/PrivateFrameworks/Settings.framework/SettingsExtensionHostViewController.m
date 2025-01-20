@interface SettingsExtensionHostViewController
- (_TtC8Settings35SettingsExtensionHostViewController)init;
- (void)hostViewController:(id)a3 didBeginHosting:(id)a4;
- (void)hostViewController:(id)a3 didEndHosting:(id)a4 error:(id)a5;
- (void)hostViewControllerDidActivate:(id)a3;
@end

@implementation SettingsExtensionHostViewController

- (_TtC8Settings35SettingsExtensionHostViewController)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Settings35SettingsExtensionHostViewController_extensionProxies) = (Class)MEMORY[0x1E4FBC868];
  id v3 = objc_allocWithZone(MEMORY[0x1E4F258A8]);
  v4 = self;
  v5 = (objc_class *)objc_msgSend(v3, sel_init);
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC8Settings35SettingsExtensionHostViewController_viewController) = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for SettingsExtensionHostViewController();
  v6 = [(SettingsExtensionHostViewController *)&v8 init];
  objc_msgSend(*(id *)((char *)&v6->super.isa + OBJC_IVAR____TtC8Settings35SettingsExtensionHostViewController_viewController), sel_setDelegate_, v6);
  return v6;
}

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E4D685F0(v4);
}

- (void)hostViewController:(id)a3 didEndHosting:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_1E4D68D84(v8, v9, a5);
}

- (void)hostViewController:(id)a3 didBeginHosting:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1E4D6DFA0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Settings35SettingsExtensionHostViewController_viewController));
  swift_bridgeObjectRelease();
}

@end