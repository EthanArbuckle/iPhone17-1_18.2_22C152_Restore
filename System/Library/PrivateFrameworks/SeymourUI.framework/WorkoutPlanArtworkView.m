@interface WorkoutPlanArtworkView
- (_TtC9SeymourUI22WorkoutPlanArtworkView)initWithCoder:(id)a3;
- (_TtC9SeymourUI22WorkoutPlanArtworkView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WorkoutPlanArtworkView

- (_TtC9SeymourUI22WorkoutPlanArtworkView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A20A2D0();
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  WorkoutPlanArtworkView.draw(_:)(v9);
}

- (void)layoutSubviews
{
  v2 = self;
  WorkoutPlanArtworkView.layoutSubviews()();
}

- (_TtC9SeymourUI22WorkoutPlanArtworkView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI22WorkoutPlanArtworkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23A20A3C4(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanArtworkView____lazy_storage___placeholderImage));
  sub_239E3FB50(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanArtworkView_artwork), *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanArtworkView_artwork), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC9SeymourUI22WorkoutPlanArtworkView_artwork), *(void **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC9SeymourUI22WorkoutPlanArtworkView_artwork));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanArtworkView_bottomLineColor));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanArtworkView_dimmedGradientLayer);
}

@end