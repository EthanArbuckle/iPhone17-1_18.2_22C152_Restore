@interface MovieHorizontalCell
+ (UIEdgeInsets)visualContentInsets;
- (NSDate)releaseDate;
- (NSString)title;
- (_TtC16MusicApplication19MovieHorizontalCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication19MovieHorizontalCell)initWithFrame:(CGRect)a3;
- (void)setReleaseDate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MovieHorizontalCell

- (_TtC16MusicApplication19MovieHorizontalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication19MovieHorizontalCell *)sub_33074(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication19MovieHorizontalCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_34A20();
}

- (NSString)title
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v5 = sub_AB6510();
  uint64_t v7 = v6;
  id v9 = a3;
  v8 = self;
  sub_335F8(v5, v7);
}

- (NSDate)releaseDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_DD8B70);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication19MovieHorizontalCell_releaseDate];
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
  v13 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication19MovieHorizontalCell_releaseDate];
  swift_beginAccess();
  sub_346A0((uint64_t)v13, (uint64_t)v8);
  swift_beginAccess();
  v14 = self;
  sub_34B84((uint64_t)v10, (uint64_t)v13);
  swift_endAccess();
  sub_339C0((uint64_t)v8);
  sub_1A538((uint64_t)v10, (uint64_t *)&unk_DD8B70);
  sub_1A538((uint64_t)v8, (uint64_t *)&unk_DD8B70);
}

+ (UIEdgeInsets)visualContentInsets
{
  double v2 = 10.0;
  double v3 = 0.0;
  double v4 = 10.0;
  double v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC16MusicApplication19MovieHorizontalCell_releaseDate, (uint64_t *)&unk_DD8B70);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

@end