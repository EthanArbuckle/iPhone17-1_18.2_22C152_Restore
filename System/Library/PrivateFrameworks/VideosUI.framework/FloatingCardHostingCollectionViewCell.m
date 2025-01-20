@interface FloatingCardHostingCollectionViewCell
- (BOOL)_disableRasterizeInAnimations;
- (_TtC8VideosUI37FloatingCardHostingCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8VideosUI37FloatingCardHostingCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)vui_prepareForReuse;
@end

@implementation FloatingCardHostingCollectionViewCell

- (BOOL)_disableRasterizeInAnimations
{
  v2 = self;
  char v3 = sub_1E318AA08();

  return v3 & 1;
}

- (_TtC8VideosUI37FloatingCardHostingCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI37FloatingCardHostingCollectionViewCell *)sub_1E318AB40();
}

- (_TtC8VideosUI37FloatingCardHostingCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E318ABDC();
}

- (void)vui_prepareForReuse
{
  v2 = self;
  sub_1E318AC84();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectWeakDestroy();
}

@end