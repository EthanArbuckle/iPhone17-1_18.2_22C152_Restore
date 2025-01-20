@interface StandinGraphView
- (_TtC8PaperKit16StandinGraphView)initWithCoder:(id)a3;
- (_TtC8PaperKit16StandinGraphView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation StandinGraphView

- (_TtC8PaperKit16StandinGraphView)initWithFrame:(CGRect)a3
{
  return (_TtC8PaperKit16StandinGraphView *)StandinGraphView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  StandinGraphView.layoutSubviews()();
}

- (_TtC8PaperKit16StandinGraphView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit16StandinGraphView_label) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit16StandinGraphView_expressions) = (Class)MEMORY[0x263F8EE78];
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8PaperKit16StandinGraphView_range);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit16StandinGraphView_isSelected) = 0;
  id v5 = a3;

  result = (_TtC8PaperKit16StandinGraphView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end