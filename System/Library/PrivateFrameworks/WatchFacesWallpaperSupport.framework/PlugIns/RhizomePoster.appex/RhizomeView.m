@interface RhizomeView
- (_TtC13RhizomePoster11RhizomeView)initWithCoder:(id)a3;
- (_TtC13RhizomePoster11RhizomeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RhizomeView

- (_TtC13RhizomePoster11RhizomeView)initWithCoder:(id)a3
{
  return [(RhizomeView *)self initWithCoder:a3];
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000099CC();
}

- (_TtC13RhizomePoster11RhizomeView)initWithFrame:(CGRect)a3
{
  result = (_TtC13RhizomePoster11RhizomeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_floatingContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersFloatingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextFlowersFloatingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextFlowersView));
  sub_10000EE30((uint64_t)self + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_fadeInTimingFunction));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_scaleTimingFunction);
}

@end