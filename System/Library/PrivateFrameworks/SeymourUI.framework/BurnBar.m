@interface BurnBar
- (_TtC9SeymourUI7BurnBar)initWithCoder:(id)a3;
- (_TtC9SeymourUI7BurnBar)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BurnBar

- (_TtC9SeymourUI7BurnBar)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI7BurnBar *)sub_239E420F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI7BurnBar)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239E4448C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_239E42B1C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI7BurnBar__circleCenterX;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A11CD0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end