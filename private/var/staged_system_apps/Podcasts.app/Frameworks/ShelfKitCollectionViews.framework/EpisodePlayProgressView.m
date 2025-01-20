@interface EpisodePlayProgressView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC23ShelfKitCollectionViews23EpisodePlayProgressView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews23EpisodePlayProgressView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation EpisodePlayProgressView

- (_TtC23ShelfKitCollectionViews23EpisodePlayProgressView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews23EpisodePlayProgressView *)sub_1DD43C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews23EpisodePlayProgressView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DEB14();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v4 = (double *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodePlayProgressView_barHeight);
  swift_beginAccess();
  double v5 = *v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  EpisodePlayProgressView.layoutSubviews()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodePlayProgressView_backgroundShapeLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodePlayProgressView_foregroundShapeLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodePlayProgressView_borderShapeLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodePlayProgressView_progressColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodePlayProgressView_trackColor));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews23EpisodePlayProgressView_borderColor);
}

@end