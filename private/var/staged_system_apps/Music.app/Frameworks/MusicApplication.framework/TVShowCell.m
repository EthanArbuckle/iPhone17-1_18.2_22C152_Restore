@interface TVShowCell
+ (UIEdgeInsets)visualContentInsets;
- (NSString)subtitle;
- (NSString)title;
- (_TtC16MusicApplication10TVShowCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication10TVShowCell)initWithFrame:(CGRect)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVShowCell

- (_TtC16MusicApplication10TVShowCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication10TVShowCell *)TVShowCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication10TVShowCell)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication10TVShowCell_title);
  void *v4 = 0;
  v4[1] = 0xE000000000000000;
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication10TVShowCell_subtitle);
  void *v5 = 0;
  v5[1] = 0xE000000000000000;
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication10TVShowCell_textComponents);
  id v7 = a3;
  uint64_t *v6 = _s16MusicApplication10TVShowCellC14textComponents33_8C9A864756C05C79127AAB0A92CC6C03LLAC04TextF0AELLVvpfi_0();
  v6[1] = v8;
  v6[2] = v9;

  result = (_TtC16MusicApplication10TVShowCell *)sub_AB8280();
  __break(1u);
  return result;
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

+ (UIEdgeInsets)visualContentInsets
{
  if (qword_DBDBD8 != -1) {
    swift_once();
  }
  double v3 = *((double *)&xmmword_E4A560 + 1);
  double v2 = *(double *)&xmmword_E4A560;
  double v4 = *(double *)&qword_E4A570;
  double v5 = unk_E4A578;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

@end