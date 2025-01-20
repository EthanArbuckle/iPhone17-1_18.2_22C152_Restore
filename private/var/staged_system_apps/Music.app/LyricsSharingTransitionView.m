@interface LyricsSharingTransitionView
- (_TtC5Music27LyricsSharingTransitionView)initWithCoder:(id)a3;
- (_TtC5Music27LyricsSharingTransitionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LyricsSharingTransitionView

- (_TtC5Music27LyricsSharingTransitionView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Music27LyricsSharingTransitionView_finalLabelTopConstraint) = 0;
  id v4 = a3;

  result = (_TtC5Music27LyricsSharingTransitionView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10054E7F4();
}

- (_TtC5Music27LyricsSharingTransitionView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Music27LyricsSharingTransitionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music27LyricsSharingTransitionView_initialView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music27LyricsSharingTransitionView_finalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music27LyricsSharingTransitionView_highlightView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music27LyricsSharingTransitionView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music27LyricsSharingTransitionView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music27LyricsSharingTransitionView_containerView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music27LyricsSharingTransitionView_finalLabelTopConstraint);
}

@end