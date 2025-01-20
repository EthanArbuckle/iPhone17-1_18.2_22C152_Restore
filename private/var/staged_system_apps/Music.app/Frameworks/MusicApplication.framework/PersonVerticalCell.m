@interface PersonVerticalCell
+ (double)visualContentInsets;
- (NSString)subtitle;
- (NSString)title;
- (_TtC16MusicApplication18PersonVerticalCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication18PersonVerticalCell)initWithFrame:(CGRect)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PersonVerticalCell

- (_TtC16MusicApplication18PersonVerticalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication18PersonVerticalCell *)sub_2264E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication18PersonVerticalCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_228504();
}

- (NSString)title
{
  return (NSString *)sub_42EA8();
}

- (void)setTitle:(id)a3
{
  uint64_t v5 = sub_AB6510();
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication18PersonVerticalCell_title);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication18PersonVerticalCell_title);
  uint64_t v8 = *(void *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication18PersonVerticalCell_title];
  uint64_t *v6 = v5;
  v6[1] = v9;
  id v10 = a3;
  v11 = self;
  sub_22725C(v7, v8);

  swift_bridgeObjectRelease();
}

- (NSString)subtitle
{
  return (NSString *)sub_42EA8();
}

- (void)setSubtitle:(id)a3
{
  uint64_t v5 = sub_AB6510();
  uint64_t v7 = v6;
  id v9 = a3;
  uint64_t v8 = self;
  sub_227408(v5, v7);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_22757C(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication18PersonVerticalCell_badgeView));
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

+ (double)visualContentInsets
{
  if (qword_DBDA28 != -1) {
    swift_once();
  }
  v4[2] = xmmword_DD0D08;
  v4[3] = *(_OWORD *)&qword_DD0D18;
  v4[4] = xmmword_DD0D28;
  v4[0] = xmmword_DD0CE8;
  v4[1] = xmmword_DD0CF8;
  type metadata accessor for TextStackView.Component();
  swift_initStackObject();
  TextStackView.Component.init(identifier:labelProperties:)(0x656C746974, 0xE500000000000000, v4);
  sub_135510((uint64_t)v4);
  uint64_t v0 = qword_DBDA30;
  swift_retain();
  if (v0 != -1) {
    swift_once();
  }
  v3[2] = xmmword_DD0D58;
  v3[3] = *(_OWORD *)&qword_DD0D68;
  v3[4] = xmmword_DD0D78;
  v3[0] = xmmword_DD0D38;
  v3[1] = xmmword_DD0D48;
  swift_initStackObject();
  TextStackView.Component.init(identifier:labelProperties:)(0x656C746974627573, 0xE800000000000000, v3);
  sub_135510((uint64_t)v3);
  if (qword_DBDBF0 != -1) {
    swift_once();
  }
  double v1 = *(double *)&xmmword_E4A5D0;
  swift_beginAccess();
  swift_release();
  swift_release_n();
  return v1;
}

@end