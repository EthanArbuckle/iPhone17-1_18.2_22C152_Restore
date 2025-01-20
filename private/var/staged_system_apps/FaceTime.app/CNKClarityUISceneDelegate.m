@interface CNKClarityUISceneDelegate
- (CNKClarityUISceneDelegate)init;
- (UIWindow)window;
- (void)setWindow:(id)a3;
@end

@implementation CNKClarityUISceneDelegate

- (UIWindow)window
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4 = (id *)((char *)&v3->super.super.isa + OBJC_IVAR___CNKClarityUISceneDelegate_window);
  swift_beginAccess();
  id v5 = *v4;
  swift_release();

  swift_release();

  return (UIWindow *)v5;
}

- (void)setWindow:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v7 = (void **)((char *)&v6->super.super.isa + OBJC_IVAR___CNKClarityUISceneDelegate_window);
  swift_beginAccess();
  v8 = *v7;
  *v7 = v5;
  swift_release();

  swift_release();
}

- (CNKClarityUISceneDelegate)init
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CNKClarityUISceneDelegate_window) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClarityUISceneDelegate();
  v3 = [(CNKClarityUISceneDelegate *)&v5 init];
  swift_release();
  return v3;
}

- (void).cxx_destruct
{
}

@end