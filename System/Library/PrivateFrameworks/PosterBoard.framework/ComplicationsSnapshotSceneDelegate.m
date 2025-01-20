@interface ComplicationsSnapshotSceneDelegate
- (UIWindow)window;
- (_TtC11PosterBoard34ComplicationsSnapshotSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation ComplicationsSnapshotSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC11PosterBoard34ComplicationsSnapshotSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC11PosterBoard34ComplicationsSnapshotSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11PosterBoard34ComplicationsSnapshotSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1D331E914(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D331EAEC();
}

- (_TtC11PosterBoard34ComplicationsSnapshotSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11PosterBoard34ComplicationsSnapshotSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ComplicationsSnapshotSceneDelegate();
  return [(ComplicationsSnapshotSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34ComplicationsSnapshotSceneDelegate_window));
}

@end