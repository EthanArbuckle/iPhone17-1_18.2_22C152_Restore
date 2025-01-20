@interface MastheadTitleLabel
- (NSString)accessibilityLabel;
- (_TtC7NewsUI218MastheadTitleLabel)initWithCoder:(id)a3;
- (_TtC7NewsUI218MastheadTitleLabel)initWithFrame:(CGRect)a3;
@end

@implementation MastheadTitleLabel

- (_TtC7NewsUI218MastheadTitleLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7NewsUI218MastheadTitleLabel_model) = (Class)0xF000000000000007;
  v9 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC7NewsUI218MastheadTitleLabel_cachedAccessibilityLabel);
  void *v9 = 0;
  v9[1] = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[MastheadTitleLabel initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7NewsUI218MastheadTitleLabel)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7NewsUI218MastheadTitleLabel_model) = (Class)0xF000000000000007;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC7NewsUI218MastheadTitleLabel_cachedAccessibilityLabel);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC7NewsUI218MastheadTitleLabel *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEA67AF8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC7NewsUI218MastheadTitleLabel_model));
  swift_bridgeObjectRelease();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1DEF9DE7C();
  uint64_t v4 = v3;

  if (v4)
  {
    id v5 = (void *)sub_1DFDFDCE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  return (NSString *)v5;
}

@end