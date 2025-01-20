@interface EpisodeContainerView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI20EpisodeContainerView)initWithCoder:(id)a3;
- (_TtC8VideosUI20EpisodeContainerView)initWithFrame:(CGRect)a3;
@end

@implementation EpisodeContainerView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  sub_1E31F78B8(a4, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (_TtC8VideosUI20EpisodeContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI20EpisodeContainerView *)sub_1E31F7B48();
}

- (_TtC8VideosUI20EpisodeContainerView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI20EpisodeContainerView *)sub_1E31F7C10(a3);
}

- (void).cxx_destruct
{
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI20EpisodeContainerView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20EpisodeContainerView_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20EpisodeContainerView_headerView));
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI20EpisodeContainerView_decorationView);
}

@end