@interface AlbumCell
+ (UIEdgeInsets)visualContentInsets;
- (BOOL)accessibilityIsExplicit;
- (NSString)accessibilityRankString;
- (NSString)artistName;
- (NSString)title;
- (_TtC16MusicApplication9AlbumCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication9AlbumCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setArtistName:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AlbumCell

- (_TtC16MusicApplication9AlbumCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication9AlbumCell *)AlbumCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication9AlbumCell)initWithCoder:(id)a3
{
  id v3 = a3;
  _s16MusicApplication9AlbumCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (NSString)title
{
  return (NSString *)sub_1575BC();
}

- (void)setTitle:(id)a3
{
}

- (NSString)artistName
{
  return (NSString *)sub_1575BC();
}

- (void)setArtistName:(id)a3
{
}

+ (UIEdgeInsets)visualContentInsets
{
  _s16MusicApplication9AlbumCellC20detailTextComponents33_697C9E9A5E5CEA31E6831E8C6D513A7BLLAC06DetailfG0AELLVvpfi_0();
  uint64_t v3 = v2;
  if (qword_DBD9B8 != -1) {
    swift_once();
  }
  unsigned long long v4 = xmmword_DCC8E0;
  swift_beginAccess();
  double v5 = *(double *)(v3 + 104);
  uint64_t v6 = qword_DCC8F8;
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  *(void *)&double v8 = v4 >> 64;
  *(void *)&double v7 = v4;
  double v9 = v5;
  double v10 = *(double *)&v6;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(VerticalLockupCollectionViewCell *)&v3 layoutSubviews];
  sub_1D52C8();
}

- (NSString)accessibilityRankString
{
  id v2 = self;
  sub_1D5734();
  swift_beginAccess();
  swift_bridgeObjectRetain();

  swift_release();
  NSString v3 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication9AlbumCell_badgeView);
  return v2 && sub_4C10E0(0, *(void *)(v2 + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet));
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  v9.is_nil = (char)v6;
  double v7 = v6;
  v9.value.super.isa = (Class)a3;
  AlbumCell.traitCollectionDidChange(_:)(v9);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication9AlbumCell_badgeView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

@end