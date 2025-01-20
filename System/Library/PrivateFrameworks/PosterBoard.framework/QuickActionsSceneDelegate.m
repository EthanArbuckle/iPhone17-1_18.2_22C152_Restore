@interface QuickActionsSceneDelegate
- (UIWindow)window;
- (_TtC11PosterBoard25QuickActionsSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation QuickActionsSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC11PosterBoard25QuickActionsSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11PosterBoard25QuickActionsSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11PosterBoard25QuickActionsSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1D32FACE8(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11PosterBoard25QuickActionsSceneDelegate_window);
  if (v3)
  {
    id v5 = a3;
    id v9 = self;
    id v6 = objc_msgSend(v3, sel_rootViewController);
    if (v6)
    {
      v7 = v6;
      id v8 = (void *)swift_dynamicCastObjCProtocolConditional();
      if (v8) {
        objc_msgSend(v8, sel_invalidate);
      }
    }
    else
    {
    }
  }
}

- (_TtC11PosterBoard25QuickActionsSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11PosterBoard25QuickActionsSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for QuickActionsSceneDelegate();
  return [(QuickActionsSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end