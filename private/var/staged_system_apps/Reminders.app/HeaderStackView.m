@interface HeaderStackView
- (_TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView)initWithArrangedSubviews:(id)a3;
- (_TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView)initWithCoder:(id)a3;
- (_TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView)initWithFrame:(CGRect)a3;
- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews;
- (void)layoutSubviews;
@end

@implementation HeaderStackView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(HeaderStackView *)&v3 layoutSubviews];
  [v2 bounds];
  CGRectGetHeight(v4);
  PassthroughSubject.send(_:)();
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  return 0;
}

- (_TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView_viewHeightSubject;
  sub_10003B754(&qword_100787768);
  swift_allocObject();
  v10 = self;
  *(void *)&self->NUIContainerStackView_opaque[v9] = PassthroughSubject.init()();

  v12.receiver = v10;
  v12.super_class = ObjectType;
  return -[HeaderStackView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView)initWithArrangedSubviews:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1000368FC(0, (unint64_t *)&qword_100788600);
    uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = OBJC_IVAR____TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView_viewHeightSubject;
  sub_10003B754(&qword_100787768);
  swift_allocObject();
  v8 = self;
  *(void *)&self->NUIContainerStackView_opaque[v7] = PassthroughSubject.init()();

  if (v6)
  {
    sub_1000368FC(0, (unint64_t *)&qword_100788600);
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  v12.receiver = v8;
  v12.super_class = ObjectType;
  v10 = [(HeaderStackView *)&v12 initWithArrangedSubviews:v9.super.isa];

  return v10;
}

- (_TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = OBJC_IVAR____TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView_viewHeightSubject;
  sub_10003B754(&qword_100787768);
  swift_allocObject();
  id v7 = a3;
  v8 = self;
  *(void *)&self->NUIContainerStackView_opaque[v6] = PassthroughSubject.init()();

  v11.receiver = v8;
  v11.super_class = ObjectType;
  NSArray v9 = [(HeaderStackView *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
}

@end