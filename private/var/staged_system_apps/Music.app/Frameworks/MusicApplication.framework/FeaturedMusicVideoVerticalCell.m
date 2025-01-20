@interface FeaturedMusicVideoVerticalCell
+ (unint64_t)visualContentInsets;
- (CGRect)bounds;
- (CGRect)frame;
- (NSDate)releaseDate;
- (NSString)accessibilityDateReleasedText;
- (NSString)artistName;
- (NSString)title;
- (_TtC16MusicApplication30FeaturedMusicVideoVerticalCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication30FeaturedMusicVideoVerticalCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setArtistName:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setReleaseDate:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FeaturedMusicVideoVerticalCell

- (_TtC16MusicApplication30FeaturedMusicVideoVerticalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication30FeaturedMusicVideoVerticalCell *)sub_1947A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication30FeaturedMusicVideoVerticalCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_196880();
}

- (NSString)title
{
  return (NSString *)sub_42EA8();
}

- (void)setTitle:(id)a3
{
}

- (NSString)artistName
{
  return (NSString *)sub_42EA8();
}

- (void)setArtistName:(id)a3
{
}

- (NSDate)releaseDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_DD8B70);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC16MusicApplication30FeaturedMusicVideoVerticalCell_releaseDate;
  swift_beginAccess();
  sub_346A0((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = sub_AB0D80();
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    Class isa = sub_AB0CC0().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSDate *)isa;
}

- (void)setReleaseDate:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_DD8B70);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  v10 = &v15[-v9];
  if (a3)
  {
    sub_AB0D40();
    uint64_t v11 = sub_AB0D80();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = sub_AB0D80();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  v13 = (char *)self + OBJC_IVAR____TtC16MusicApplication30FeaturedMusicVideoVerticalCell_releaseDate;
  swift_beginAccess();
  sub_346A0((uint64_t)v13, (uint64_t)v8);
  swift_beginAccess();
  v14 = self;
  sub_34B84((uint64_t)v10, (uint64_t)v13);
  swift_endAccess();
  sub_195374((uint64_t)v8);
  sub_1A538((uint64_t)v10, (uint64_t *)&unk_DD8B70);
  sub_1A538((uint64_t)v8, (uint64_t *)&unk_DD8B70);
}

- (CGRect)frame
{
  sub_1958A0(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (CGRect)bounds
{
  sub_1958A0(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_195B40();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_195DD4((uint64_t)a3);
}

- (NSString)accessibilityDateReleasedText
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC16MusicApplication30FeaturedMusicVideoVerticalCell_releaseDate, (uint64_t *)&unk_DD8B70);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30FeaturedMusicVideoVerticalCell_badgeView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

+ (unint64_t)visualContentInsets
{
  sub_1963B0();
  unint64_t v1 = v0;
  if (qword_DBD950 != -1) {
    swift_once();
  }
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_5;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_AB8300();
  if (!v2) {
    goto LABEL_12;
  }
LABEL_5:
  unint64_t result = v2 - 1;
  if (__OFSUB__(v2, 1))
  {
    __break(1u);
    goto LABEL_15;
  }
  if ((v1 & 0xC000000000000001) != 0)
  {
LABEL_15:
    sub_AB8090();
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8)))
  {
    swift_retain();
LABEL_10:
    swift_bridgeObjectRelease();
    swift_beginAccess();
    swift_release();
LABEL_13:
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    return swift_release();
  }
  __break(1u);
  return result;
}

@end