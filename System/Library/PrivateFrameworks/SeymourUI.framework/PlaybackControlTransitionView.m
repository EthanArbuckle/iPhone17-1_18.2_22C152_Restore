@interface PlaybackControlTransitionView
- (_TtC9SeymourUI29PlaybackControlTransitionView)initWithCoder:(id)a3;
- (_TtC9SeymourUI29PlaybackControlTransitionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PlaybackControlTransitionView

- (_TtC9SeymourUI29PlaybackControlTransitionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A12BB3C();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PlaybackControlTransitionView();
  id v2 = v4.receiver;
  [(PlaybackControlTransitionView *)&v4 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, CGRectGetHeight(v5) * 0.5);
}

- (_TtC9SeymourUI29PlaybackControlTransitionView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI29PlaybackControlTransitionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29PlaybackControlTransitionView_layout));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI29PlaybackControlTransitionView_widthConstraint);
}

@end