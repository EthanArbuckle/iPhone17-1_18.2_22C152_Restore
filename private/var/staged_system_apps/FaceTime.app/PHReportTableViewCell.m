@interface PHReportTableViewCell
+ (NSString)reuseIdentifier;
- (PHReportTableViewCell)initWithCoder:(id)a3;
- (PHReportTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation PHReportTableViewCell

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

- (PHReportTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v6 = (char *)self + OBJC_IVAR___PHReportTableViewCell____lazy_storage___cellContentConfiguration;
  uint64_t v7 = type metadata accessor for UIListContentConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  NSString v8 = String._bridgeToObjectiveC()();
  v12.receiver = self;
  v12.super_class = ObjectType;
  v9 = [(PHReportTableViewCell *)&v12 initWithStyle:0 reuseIdentifier:v8];

  v10 = v9;
  sub_100054B80();
  [(PHReportTableViewCell *)v10 setSelectionStyle:0];
  swift_release();

  return v10;
}

- (PHReportTableViewCell)initWithCoder:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = (char *)self + OBJC_IVAR___PHReportTableViewCell____lazy_storage___cellContentConfiguration;
  uint64_t v6 = type metadata accessor for UIListContentConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  result = (PHReportTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end