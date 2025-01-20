@interface PHDialerContactResultButtonView
- (BOOL)showsLargeContentViewer;
- (NSString)largeContentTitle;
- (PHDialerContactResultButtonView)initWithCoder:(id)a3;
- (PHDialerContactResultButtonView)initWithFrame:(CGRect)a3;
- (PHDialerContactResultButtonView)initWithType:(int64_t)a3;
- (UILabel)primaryLabel;
- (void)configureWithPrimaryTitle:(id)a3 secondaryTitle:(id)a4;
- (void)configureWithPrimaryTitle:(id)a3 secondaryTitle:(id)a4 searchString:(id)a5 isNumberPriority:(BOOL)a6;
- (void)handleContentSizeCategoryDidChange:(id)a3;
- (void)setLargeContentTitle:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setShowsLargeContentViewer:(BOOL)a3;
- (void)shouldPrioritizeName;
- (void)shouldPrioritizeNumber;
@end

@implementation PHDialerContactResultButtonView

- (UILabel)primaryLabel
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  id v4 = sub_10005BAE4();
  swift_release();

  return (UILabel *)v4;
}

- (void)setPrimaryLabel:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = (objc_class *)a3;
  v6 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = *(Class *)((char *)&v6->super.super.super.isa
                + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel);
  *(Class *)((char *)&v6->super.super.super.isa
           + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel) = v5;
  swift_release();

  swift_release();
}

- (PHDialerContactResultButtonView)initWithType:(int64_t)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = (PHDialerContactResultButtonView *)sub_10005C288(a3);
  swift_release();
  return v4;
}

- (PHDialerContactResultButtonView)initWithCoder:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  v5 = (PHDialerContactResultButtonView *)sub_10005E630();
  swift_release();
  return v5;
}

- (void)shouldPrioritizeName
{
}

- (void)shouldPrioritizeNumber
{
}

- (void)configureWithPrimaryTitle:(id)a3 secondaryTitle:(id)a4
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v10 = sub_10005BAE4();
  [v10 setAttributedText:v7];

  id v11 = sub_10005BDEC();
  [v11 setAttributedText:v8];
  swift_release();

  swift_release();
}

- (void)configureWithPrimaryTitle:(id)a3 secondaryTitle:(id)a4 searchString:(id)a5 isNumberPriority:(BOOL)a6
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a5)
  {
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a5 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  sub_10005D4EC(a3, (uint64_t)a4, v11, (uint64_t)a5, a6);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)handleContentSizeCategoryDidChange:(id)a3
{
  uint64_t v5 = sub_100017E2C(&qword_1000BB878);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Notification();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for Notification();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  id v10 = self;
  sub_10005D810((uint64_t)v7);

  sub_100017EC0((uint64_t)v7, &qword_1000BB878);
  swift_release();
}

- (BOOL)showsLargeContentViewer
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

  swift_release();
  swift_release();
  return 1;
}

- (void)setShowsLargeContentViewer:(BOOL)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }

  swift_release();

  swift_release();
}

- (NSString)largeContentTitle
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_10005DF94();
  uint64_t v5 = v4;

  if (v5)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
    NSString v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setLargeContentTitle:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }

  swift_release();

  swift_release();
}

- (PHDialerContactResultButtonView)initWithFrame:(CGRect)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (PHDialerContactResultButtonView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel));
  sub_10005E5A8(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___secondaryLabel));
  v3 = (char *)self + OBJC_IVAR___PHDialerContactResultButtonView_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView);
}

@end