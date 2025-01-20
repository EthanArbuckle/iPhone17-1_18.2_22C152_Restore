@interface SessionRingsView
- (UIVisualEffectView)ringsPlatter;
- (_TtC9SeymourUI16SessionRingsView)initWithCoder:(id)a3;
- (_TtC9SeymourUI16SessionRingsView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)displayHighlightWithDuration:(double)a3;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
@end

@implementation SessionRingsView

- (UIVisualEffectView)ringsPlatter
{
  return (UIVisualEffectView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_ringsPlatter));
}

- (void)didMoveToSuperview
{
  v2 = self;
  sub_239E9BEE8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_239E9CCD0();
}

- (_TtC9SeymourUI16SessionRingsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239EA0EB4();
}

- (_TtC9SeymourUI16SessionRingsView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI16SessionRingsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_metricsContainer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_ringClosureLabelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_ringClosureLabelPlatter));
  swift_unknownObjectRelease();
  sub_239EA0A14((uint64_t)self + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_stringBuilder);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_ringsContainerTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_ringsContainerRightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_ringsContainerWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_ringsContainerHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_celebrationLoadingQueue));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_contentLayoutGuide);
}

- (void)displayHighlightWithDuration:(double)a3
{
  v7 = self;
  sub_239E9E994(a3, v4, v5, v6);
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SessionRingsView();
  id v2 = v3.receiver;
  [(SessionRingsView *)&v3 safeAreaInsetsDidChange];
  sub_239E9F788();
  sub_239E9D1EC();
}

@end