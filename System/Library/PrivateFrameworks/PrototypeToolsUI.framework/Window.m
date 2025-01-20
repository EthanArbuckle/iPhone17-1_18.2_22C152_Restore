@interface Window
+ (BOOL)_isSecure;
- (_TtC10prototyped6Window)initWithCoder:(id)a3;
- (_TtC10prototyped6Window)initWithContentRect:(CGRect)a3;
- (_TtC10prototyped6Window)initWithFrame:(CGRect)a3;
- (_TtC10prototyped6Window)initWithWindowScene:(id)a3;
@end

@implementation Window

+ (BOOL)_isSecure
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  swift_release();
  return 1;
}

- (_TtC10prototyped6Window)initWithWindowScene:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for Window();
  v5 = [(Window *)&v7 initWithWindowScene:a3];
  swift_release();
  return v5;
}

- (_TtC10prototyped6Window)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for Window();
  v8 = -[Window initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
  swift_release();
  return v8;
}

- (_TtC10prototyped6Window)initWithCoder:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for Window();
  v5 = [(Window *)&v7 initWithCoder:a3];
  swift_release();
  return v5;
}

- (_TtC10prototyped6Window)initWithContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for Window();
  v8 = -[Window initWithContentRect:](&v10, "initWithContentRect:", x, y, width, height);
  swift_release();
  return v8;
}

@end