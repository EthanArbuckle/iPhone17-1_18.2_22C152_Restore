@interface CuratorActivityCell
+ (UIEdgeInsets)visualContentInsets;
- (NSString)title;
- (_TtC16MusicApplication19CuratorActivityCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication19CuratorActivityCell)initWithFrame:(CGRect)a3;
- (void)setTitle:(id)a3;
@end

@implementation CuratorActivityCell

- (_TtC16MusicApplication19CuratorActivityCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication19CuratorActivityCell *)CuratorActivityCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication19CuratorActivityCell)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication19CuratorActivityCell_title);
  void *v4 = 0;
  v4[1] = 0xE000000000000000;
  uint64_t v5 = OBJC_IVAR____TtC16MusicApplication19CuratorActivityCell_textComponents;
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)variable initialization expression of CuratorActivityCell.textComponents();

  result = (_TtC16MusicApplication19CuratorActivityCell *)sub_AB8280();
  __break(1u);
  return result;
}

- (NSString)title
{
  swift_beginAccess();
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
  CuratorActivityCell.title.setter(v5, v7);
}

+ (UIEdgeInsets)visualContentInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end