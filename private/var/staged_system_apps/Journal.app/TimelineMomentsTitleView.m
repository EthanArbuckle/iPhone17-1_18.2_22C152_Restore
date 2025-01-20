@interface TimelineMomentsTitleView
- (_TtC7Journal24TimelineMomentsTitleView)initWithCoder:(id)a3;
- (_TtC7Journal24TimelineMomentsTitleView)initWithFrame:(CGRect)a3;
@end

@implementation TimelineMomentsTitleView

- (_TtC7Journal24TimelineMomentsTitleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal24TimelineMomentsTitleView_journalEntry) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[TimelineMomentsTitleView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  sub_100271A2C();

  return v9;
}

- (_TtC7Journal24TimelineMomentsTitleView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal24TimelineMomentsTitleView_journalEntry) = 0;
  id v4 = a3;

  result = (_TtC7Journal24TimelineMomentsTitleView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end