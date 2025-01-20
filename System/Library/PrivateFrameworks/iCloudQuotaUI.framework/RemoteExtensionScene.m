@interface RemoteExtensionScene
- (UIViewController)viewController;
- (_TtC13iCloudQuotaUI20RemoteExtensionScene)init;
- (void)setViewController:(id)a3;
@end

@implementation RemoteExtensionScene

- (UIViewController)viewController
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC13iCloudQuotaUI20RemoteExtensionScene_viewController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setViewController:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC13iCloudQuotaUI20RemoteExtensionScene_viewController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC13iCloudQuotaUI20RemoteExtensionScene)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13iCloudQuotaUI20RemoteExtensionScene_viewController) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RemoteExtensionScene();
  return [(RemoteExtensionScene *)&v3 init];
}

- (void).cxx_destruct
{
}

@end