@interface DebugFormatGridView
- (_TtC8NewsFeed19DebugFormatGridView)initWithCoder:(id)a3;
- (_TtC8NewsFeed19DebugFormatGridView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DebugFormatGridView

- (_TtC8NewsFeed19DebugFormatGridView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed19DebugFormatGridView *)sub_1C0D0D1D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed19DebugFormatGridView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed19DebugFormatGridView_scale) = (Class)0x3FF0000000000000;
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed19DebugFormatGridView_contentSize);
  void *v5 = 0;
  v5[1] = 0;
  v6 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8NewsFeed19DebugFormatGridView_contentBounds);
  _OWORD *v6 = 0u;
  v6[1] = 0u;
  uint64_t v7 = OBJC_IVAR____TtC8NewsFeed19DebugFormatGridView_gridLayer;
  id v8 = objc_allocWithZone(MEMORY[0x1E4F39C88]);
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)objc_msgSend(v8, sel_init);

  result = (_TtC8NewsFeed19DebugFormatGridView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C0D0D540();
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  v5 = (char *)v9.receiver;
  [(DebugFormatGridView *)&v9 traitCollectionDidChange:v4];
  v6 = *(void **)&v5[OBJC_IVAR____TtC8NewsFeed19DebugFormatGridView_gridLayer];
  id v7 = objc_msgSend(self, sel_systemGrayColor, v9.receiver, v9.super_class);
  id v8 = objc_msgSend(v7, sel_CGColor);

  objc_msgSend(v6, sel_setStrokeColor_, v8);
}

- (void).cxx_destruct
{
}

@end