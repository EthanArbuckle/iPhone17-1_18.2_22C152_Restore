@interface LiveActivitySceneDelegate
- (UIWindow)window;
- (_TtC7Journal25LiveActivitySceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation LiveActivitySceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC7Journal25LiveActivitySceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Journal25LiveActivitySceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Journal25LiveActivitySceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100238440(v8);
}

- (_TtC7Journal25LiveActivitySceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Journal25LiveActivitySceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7Journal25LiveActivitySceneDelegate_systemApertureElementProvider) = 0;
  uint64_t v2 = OBJC_IVAR____TtC7Journal25LiveActivitySceneDelegate_logger;
  uint64_t v3 = qword_1007F7DF0;
  id v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = sub_100026A54(v5, (uint64_t)qword_10083EDD0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))((char *)v4 + v2, v6, v5);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for LiveActivitySceneDelegate();
  return [(LiveActivitySceneDelegate *)&v8 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Journal25LiveActivitySceneDelegate_systemApertureElementProvider));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC7Journal25LiveActivitySceneDelegate_logger;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end