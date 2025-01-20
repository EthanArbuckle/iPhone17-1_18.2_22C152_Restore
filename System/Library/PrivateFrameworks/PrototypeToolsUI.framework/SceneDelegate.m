@interface SceneDelegate
- (_TtC10prototyped13SceneDelegate)init;
- (void)didDrag:(id)a3;
- (void)didPinch:(id)a3;
- (void)didSelectDone;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  _s10prototyped13SceneDelegateC5scene_13willConnectTo7optionsySo7UISceneC_So0I7SessionCSo0I17ConnectionOptionsCtF_0(v9);
  swift_release();
}

- (void)sceneDidDisconnect:(id)a3
{
}

- (void)didSelectDone
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_10000A374();
  swift_release();
}

- (void)didDrag:(id)a3
{
}

- (void)didPinch:(id)a3
{
}

- (_TtC10prototyped13SceneDelegate)init
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v2 = (_TtC10prototyped13SceneDelegate *)SceneDelegate.init()();
  swift_release();
  return v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___rootModuleController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___panGesture));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___pinchGesture));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___settingsViewController));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10prototyped13SceneDelegate_window);
}

@end