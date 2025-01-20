@interface DebugPersonalizationSubmitView
- (_TtC8NewsFeed30DebugPersonalizationSubmitView)initWithCoder:(id)a3;
- (_TtC8NewsFeed30DebugPersonalizationSubmitView)initWithFrame:(CGRect)a3;
@end

@implementation DebugPersonalizationSubmitView

- (_TtC8NewsFeed30DebugPersonalizationSubmitView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed30DebugPersonalizationSubmitView *)sub_1C019E140(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed30DebugPersonalizationSubmitView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC8NewsFeed30DebugPersonalizationSubmitView_submitButton;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_1C019DD24();
  uint64_t v6 = OBJC_IVAR____TtC8NewsFeed30DebugPersonalizationSubmitView_submitText;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)sub_1C019DFA0();

  result = (_TtC8NewsFeed30DebugPersonalizationSubmitView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugPersonalizationSubmitView_submitButton));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed30DebugPersonalizationSubmitView_submitText);
}

@end