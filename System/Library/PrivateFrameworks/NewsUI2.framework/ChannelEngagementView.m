@interface ChannelEngagementView
- (_TtC7NewsUI221ChannelEngagementView)initWithCoder:(id)a3;
- (_TtC7NewsUI221ChannelEngagementView)initWithFrame:(CGRect)a3;
@end

@implementation ChannelEngagementView

- (_TtC7NewsUI221ChannelEngagementView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC7NewsUI221ChannelEngagementView_token;
  id v10 = objc_allocWithZone(MEMORY[0x1E4FBA8A8]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_init);

  v13.receiver = v11;
  v13.super_class = ObjectType;
  return -[ChannelEngagementView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7NewsUI221ChannelEngagementView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7NewsUI221ChannelEngagementView_token;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FBA8A8]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC7NewsUI221ChannelEngagementView *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end