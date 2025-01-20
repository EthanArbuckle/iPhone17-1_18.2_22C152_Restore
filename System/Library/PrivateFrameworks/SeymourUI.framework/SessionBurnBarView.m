@interface SessionBurnBarView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI18SessionBurnBarView)initWithCoder:(id)a3;
- (_TtC9SeymourUI18SessionBurnBarView)initWithFrame:(CGRect)a3;
@end

@implementation SessionBurnBarView

- (CGSize)intrinsicContentSize
{
  v2 = (double *)MEMORY[0x263F83C20];
  uint64_t v3 = qword_268A0C7A8;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  double v5 = *v2;
  double v6 = *(double *)&qword_268A0F650;
  if (qword_268A0C7B0 != -1) {
    swift_once();
  }
  double v7 = *(double *)&qword_268A0F658;

  double v8 = v6 + v7;
  double v9 = v5;
  result.height = v8;
  result.width = v9;
  return result;
}

- (_TtC9SeymourUI18SessionBurnBarView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI18SessionBurnBarView_burnBar;
  type metadata accessor for BurnBar();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  id v8 = objc_msgSend(v6, sel_init);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v8;

  CGSize result = (_TtC9SeymourUI18SessionBurnBarView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI18SessionBurnBarView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9SeymourUI18SessionBurnBarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18SessionBurnBarView_burnBar);
}

@end