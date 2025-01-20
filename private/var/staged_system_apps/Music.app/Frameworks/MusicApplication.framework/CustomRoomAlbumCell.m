@interface CustomRoomAlbumCell
+ (UIEdgeInsets)visualContentInsets;
- (NSString)descriptionText;
- (NSString)headlineText;
- (NSString)subtitle;
- (NSString)title;
- (_TtC16MusicApplication19CustomRoomAlbumCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication19CustomRoomAlbumCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setDescriptionText:(id)a3;
- (void)setHeadlineText:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CustomRoomAlbumCell

- (_TtC16MusicApplication19CustomRoomAlbumCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication19CustomRoomAlbumCell *)sub_519960(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication19CustomRoomAlbumCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_51C758();
}

- (NSString)headlineText
{
  return (NSString *)sub_42EA8();
}

- (void)setHeadlineText:(id)a3
{
  uint64_t v5 = sub_AB6510();
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_headlineText);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_headlineText);
  uint64_t v8 = *(void *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_headlineText];
  uint64_t *v6 = v5;
  v6[1] = v9;
  id v10 = a3;
  v11 = self;
  sub_519FB4(v7, v8);

  swift_bridgeObjectRelease();
}

- (NSString)title
{
  return (NSString *)sub_42EA8();
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_42EA8();
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)descriptionText
{
  return (NSString *)sub_42EA8();
}

- (void)setDescriptionText:(id)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CustomRoomAlbumCell();
  id v4 = a3;
  id v5 = v7.receiver;
  [(VerticalLockupCollectionViewCell *)&v7 traitCollectionDidChange:v4];
  id v6 = [v5 traitCollection];
  if ([v6 horizontalSizeClass]) {
    sub_51B490();
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_51AE94();
}

+ (UIEdgeInsets)visualContentInsets
{
  sub_51C37C();
  uint64_t v3 = v2;
  swift_beginAccess();
  double v4 = *(double *)(v3 + 104);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = v4;
  result.right = v7;
  result.bottom = v8;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_badgeView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_headlineTextDrawingView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

@end