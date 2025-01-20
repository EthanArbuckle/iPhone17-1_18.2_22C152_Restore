@interface FeaturedPlaylistCell
+ (UIEdgeInsets)visualContentInsets;
- (NSString)descriptionText;
- (NSString)name;
- (_TtC16MusicApplication20FeaturedPlaylistCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication20FeaturedPlaylistCell)initWithFrame:(CGRect)a3;
- (void)setDescriptionText:(id)a3;
- (void)setName:(id)a3;
@end

@implementation FeaturedPlaylistCell

- (_TtC16MusicApplication20FeaturedPlaylistCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication20FeaturedPlaylistCell *)sub_10C1BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication20FeaturedPlaylistCell)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication20FeaturedPlaylistCell_name);
  void *v4 = 0;
  v4[1] = 0xE000000000000000;
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication20FeaturedPlaylistCell_descriptionText);
  void *v5 = 0;
  v5[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication20FeaturedPlaylistCell_badgeView) = 0;
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication20FeaturedPlaylistCell_textComponents);
  id v7 = a3;
  uint64_t *v6 = sub_10CEC0();
  v6[1] = v8;
  v6[2] = v9;

  result = (_TtC16MusicApplication20FeaturedPlaylistCell *)sub_AB8280();
  __break(1u);
  return result;
}

- (NSString)name
{
  return (NSString *)sub_42EA8();
}

- (void)setName:(id)a3
{
}

- (NSString)descriptionText
{
  return (NSString *)sub_42EA8();
}

- (void)setDescriptionText:(id)a3
{
}

+ (UIEdgeInsets)visualContentInsets
{
  sub_10CEC0();
  uint64_t v3 = v2;
  if (qword_DBDBF0 != -1) {
    swift_once();
  }
  unsigned long long v4 = xmmword_E4A5D0;
  uint64_t v5 = qword_E4A5E8;
  swift_beginAccess();
  double v6 = *(double *)(v3 + 104);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  *(void *)&double v8 = v4 >> 64;
  *(void *)&double v7 = v4;
  double v9 = v6;
  double v10 = *(double *)&v5;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedPlaylistCell_badgeView));
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

@end