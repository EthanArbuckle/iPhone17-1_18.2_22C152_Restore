@interface InlineComplicationSnapshotSceneDelegate
- (UIWindow)window;
- (_TtC11PosterBoard39InlineComplicationSnapshotSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation InlineComplicationSnapshotSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC11PosterBoard39InlineComplicationSnapshotSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC11PosterBoard39InlineComplicationSnapshotSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11PosterBoard39InlineComplicationSnapshotSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1D32EABA8(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D32EAD7C();
}

- (_TtC11PosterBoard39InlineComplicationSnapshotSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11PosterBoard39InlineComplicationSnapshotSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InlineComplicationSnapshotSceneDelegate();
  return [(InlineComplicationSnapshotSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard39InlineComplicationSnapshotSceneDelegate_window));
}

@end