@interface PHBlockTableViewCell
+ (NSString)reuseIdentifier;
- (PHBlockTableViewCell)initWithCoder:(id)a3;
- (PHBlockTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)updateCellOfFlow:(int64_t)a3 isBlocked:(BOOL)a4 style:(int64_t)a5;
@end

@implementation PHBlockTableViewCell

+ (NSString)reuseIdentifier
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_release();

  return (NSString *)v2;
}

- (PHBlockTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v5 = (PHBlockTableViewCell *)sub_1000667C8();
  swift_release();
  return v5;
}

- (PHBlockTableViewCell)initWithCoder:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  v5 = (PHBlockTableViewCell *)sub_100066980();
  swift_release();
  return v5;
}

- (void)updateCellOfFlow:(int64_t)a3 isBlocked:(BOOL)a4 style:(int64_t)a5
{
  BOOL v6 = a4;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v9 = self;
  sub_100065D24(a3, v6, a5);
  swift_release();
}

- (void).cxx_destruct
{
  sub_100055760((uint64_t)self + OBJC_IVAR___PHBlockTableViewCell____lazy_storage___cellContentConfiguration);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PHBlockTableViewCell____lazy_storage___unblockImageView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___PHBlockTableViewCell____lazy_storage___blockImageView);
}

@end