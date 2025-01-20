@interface PeopleBadgeView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView)init;
- (_TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView)initWithCoder:(id)a3;
- (_TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView)initWithFrame:(CGRect)a3;
- (void)clearArtworkCatalogs;
- (void)layoutSubviews;
@end

@implementation PeopleBadgeView

- (_TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView)init
{
  return (_TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView *)sub_3DFD7C();
}

- (_TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView_socialPersons) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView_artworkCachingReference) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView_visibleArtworkComponents) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView_reusableArtworkComponents) = (Class)_swiftEmptyArrayStorage;
  id v4 = a3;

  result = (_TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView *)sub_AB8280();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  sub_3DFAD4();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_3E0380();
}

- (void)clearArtworkCatalogs
{
  v2 = self;
  sub_3E067C();
}

- (_TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC16MusicApplicationP33_AA0DFD7D953F5F9BB2DAA84AD1DB9C2715PeopleBadgeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end