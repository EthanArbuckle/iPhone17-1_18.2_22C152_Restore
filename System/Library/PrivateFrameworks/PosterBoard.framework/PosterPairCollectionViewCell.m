@interface PosterPairCollectionViewCell
- (_TtC11PosterBoard28PosterPairCollectionViewCell)initWithCoder:(id)a3;
- (_TtC11PosterBoard28PosterPairCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)posterPairDidUpdateConfiguredProperties:(id)a3;
- (void)posterPairDidUpdateLockPosterAppearance:(id)a3;
- (void)posterPairDidUpdateLockPosterSnapshots:(id)a3;
- (void)prepareForReuse;
@end

@implementation PosterPairCollectionViewCell

- (void)layoutSubviews
{
  v2 = self;
  sub_1D32F1294();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1D32F15B8();
}

- (void)posterPairDidUpdateConfiguredProperties:(id)a3
{
  v4 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.super.super.super.isa) + 0x170);
  id v5 = a3;
  v6 = self;
  v4();
}

- (void)posterPairDidUpdateLockPosterAppearance:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1D32F1A50(2, 1);
}

- (void)posterPairDidUpdateLockPosterSnapshots:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1D32F1A50(1, 1);
}

- (_TtC11PosterBoard28PosterPairCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard28PosterPairCollectionViewCell *)sub_1D32F1FA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard28PosterPairCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC11PosterBoard28PosterPairCollectionViewCell *)sub_1D32F207C(a3);
}

- (void).cxx_destruct
{
  sub_1D32CE208((uint64_t)self + OBJC_IVAR____TtC11PosterBoard28PosterPairCollectionViewCell_snapshotProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard28PosterPairCollectionViewCell_posterPair));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard28PosterPairCollectionViewCell_lockPosterSnapshotView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard28PosterPairCollectionViewCell_keyLineView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard28PosterPairCollectionViewCell_lockPosterSnapshotImage);
}

@end