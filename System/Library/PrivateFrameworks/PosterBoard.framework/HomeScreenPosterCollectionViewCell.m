@interface HomeScreenPosterCollectionViewCell
- (_TtC11PosterBoard34HomeScreenPosterCollectionViewCell)initWithCoder:(id)a3;
- (_TtC11PosterBoard34HomeScreenPosterCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)posterPairDidUpdateHomePosterAppearance:(id)a3;
- (void)prepareForReuse;
@end

@implementation HomeScreenPosterCollectionViewCell

- (void)posterPairDidUpdateHomePosterAppearance:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D3321EE8(1);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1D3321370();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HomeScreenPosterCollectionViewCell();
  v2 = (char *)v3.receiver;
  [(PosterPairCollectionViewCell *)&v3 prepareForReuse];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_homePosterSnapshotView], sel_setImage_, 0, v3.receiver, v3.super_class);
}

- (_TtC11PosterBoard34HomeScreenPosterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard34HomeScreenPosterCollectionViewCell *)sub_1D332274C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard34HomeScreenPosterCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC11PosterBoard34HomeScreenPosterCollectionViewCell *)sub_1D33228F8(a3);
}

- (void).cxx_destruct
{
  sub_1D32CE208((uint64_t)self + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_homeScreenIconContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell____lazy_storage___lockPosterPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_lockPosterBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_gradientPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_solidColorPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell____lazy_storage___homePosterPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_homePosterSnapshotView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_homePosterBlurView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_homeScreenConfiguration);
}

@end