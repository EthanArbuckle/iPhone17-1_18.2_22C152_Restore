@interface CRLMathResultView
- (_TtC8Freeform17CRLMathResultView)initWithCoder:(id)a3;
- (_TtC8Freeform17CRLMathResultView)initWithFrame:(CGRect)a3;
- (_TtC8Freeform17CRLMathResultView)initWithFrame:(CGRect)a3 delegate:(id)a4;
- (_TtP8Freeform25CRLMathResultViewDelegate_)delegate;
- (void)didAddSubview:(id)a3;
- (void)willRemoveSubview:(id)a3;
@end

@implementation CRLMathResultView

- (_TtP8Freeform25CRLMathResultViewDelegate_)delegate
{
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP8Freeform25CRLMathResultViewDelegate_ *)v2;
}

- (_TtC8Freeform17CRLMathResultView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Freeform17CRLMathResultView_delegate) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CRLMathResultView();
  swift_unknownObjectRetain();
  return -[CRLiOSUnhittableView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC8Freeform17CRLMathResultView)initWithCoder:(id)a3
{
  result = (_TtC8Freeform17CRLMathResultView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)willRemoveSubview:(id)a3
{
}

- (void)didAddSubview:(id)a3
{
}

- (_TtC8Freeform17CRLMathResultView)initWithFrame:(CGRect)a3
{
  result = (_TtC8Freeform17CRLMathResultView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end