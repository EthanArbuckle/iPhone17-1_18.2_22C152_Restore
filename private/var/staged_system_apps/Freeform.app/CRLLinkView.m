@interface CRLLinkView
- (CGRect)frame;
- (_TtC8Freeform11CRLLinkView)initWithCoder:(id)a3;
- (_TtC8Freeform11CRLLinkView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
@end

@implementation CRLLinkView

- (_TtC8Freeform11CRLLinkView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform11CRLLinkView_viewScale) = (Class)0x3FF0000000000000;
  id v5 = a3;

  result = (_TtC8Freeform11CRLLinkView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLLinkView();
  id v2 = v3.receiver;
  [(CRLLinkView *)&v3 layoutSubviews];
  sub_1009EDA0C();
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLLinkView();
  [(CRLLinkView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_1009ED7A8(x, y, width, height);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for CRLLinkView();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[CRLLinkView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  v10 = v9;
  sub_10050BF48(0, (unint64_t *)&qword_1016725F0);
  id v11 = v7;
  id v7 = v10;
  LOBYTE(v10) = static NSObject.== infix(_:_:)();

  if (v10)
  {
LABEL_5:

    id v7 = 0;
  }

  return v7;
}

- (_TtC8Freeform11CRLLinkView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC8Freeform11CRLLinkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform11CRLLinkView_wrappedLinkView);
}

@end