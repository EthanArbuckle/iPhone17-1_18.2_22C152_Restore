@interface IssueCoverViewButton
- (BOOL)isHighlighted;
- (CGRect)frame;
- (_TtC8NewsFeed20IssueCoverViewButton)initWithCoder:(id)a3;
- (_TtC8NewsFeed20IssueCoverViewButton)initWithFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation IssueCoverViewButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(IssueCoverViewButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v4 = v9.receiver;
  [(IssueCoverViewButton *)&v9 setHighlighted:v3];
  v5 = self;
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v8[4] = sub_1C0AF5314;
  v8[5] = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1BFC9FC68;
  v8[3] = &block_descriptor_11_1;
  v7 = _Block_copy(v8);
  swift_release();
  objc_msgSend(v5, sel_animateWithDuration_animations_, v7, 0.2);
  _Block_release(v7);
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  [(IssueCoverViewButton *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v7 = (char *)v9.receiver;
  -[IssueCoverViewButton setFrame:](&v9, sel_setFrame_, x, y, width, height);
  v8 = *(void **)&v7[OBJC_IVAR____TtC8NewsFeed20IssueCoverViewButton_coverView];
  objc_msgSend(v7, sel_bounds, v9.receiver, v9.super_class);
  objc_msgSend(v8, sel_setFrame_);
}

- (_TtC8NewsFeed20IssueCoverViewButton)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed20IssueCoverViewButton_onTap;
  sub_1BFD22278();
  id v7 = objc_allocWithZone(v6);
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v7, sel_init);

  CGRect result = (_TtC8NewsFeed20IssueCoverViewButton *)sub_1C152040C();
  __break(1u);
  return result;
}

- (_TtC8NewsFeed20IssueCoverViewButton)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC8NewsFeed20IssueCoverViewButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20IssueCoverViewButton_onTap));
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed20IssueCoverViewButton_coverView);
}

@end