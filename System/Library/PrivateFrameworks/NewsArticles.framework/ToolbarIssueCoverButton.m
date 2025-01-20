@interface ToolbarIssueCoverButton
- (BOOL)isHighlighted;
- (_TtC12NewsArticles23ToolbarIssueCoverButton)init;
- (_TtC12NewsArticles23ToolbarIssueCoverButton)initWithCoder:(id)a3;
- (_TtC12NewsArticles23ToolbarIssueCoverButton)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation ToolbarIssueCoverButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ToolbarIssueCoverButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v4 = v9.receiver;
  [(ToolbarIssueCoverButton *)&v9 setHighlighted:v3];
  v5 = self;
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v8[4] = sub_1BF57C018;
  v8[5] = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1BF4D0840;
  v8[3] = &block_descriptor_9;
  v7 = _Block_copy(v8);
  swift_release();
  objc_msgSend(v5, sel_animateWithDuration_animations_, v7, 0.3);
  _Block_release(v7);
}

- (_TtC12NewsArticles23ToolbarIssueCoverButton)init
{
  return (_TtC12NewsArticles23ToolbarIssueCoverButton *)sub_1BF57BB50();
}

- (_TtC12NewsArticles23ToolbarIssueCoverButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF57BEC4();
}

- (_TtC12NewsArticles23ToolbarIssueCoverButton)initWithFrame:(CGRect)a3
{
  result = (_TtC12NewsArticles23ToolbarIssueCoverButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles23ToolbarIssueCoverButton_coverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles23ToolbarIssueCoverButton_callToActionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles23ToolbarIssueCoverButton_coverDateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles23ToolbarIssueCoverButton_highlightView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles23ToolbarIssueCoverButton_highlightColor);
}

@end