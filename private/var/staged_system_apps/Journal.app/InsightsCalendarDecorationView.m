@interface InsightsCalendarDecorationView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC7JournalP33_FE1AF9319DABE2D117B2C08623B665DB30InsightsCalendarDecorationView)initWithCoder:(id)a3;
- (_TtC7JournalP33_FE1AF9319DABE2D117B2C08623B665DB30InsightsCalendarDecorationView)initWithFrame:(CGRect)a3;
@end

@implementation InsightsCalendarDecorationView

- (_TtC7JournalP33_FE1AF9319DABE2D117B2C08623B665DB30InsightsCalendarDecorationView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC7JournalP33_FE1AF9319DABE2D117B2C08623B665DB30InsightsCalendarDecorationView_imageView;
  id v5 = objc_allocWithZone((Class)UIImageView);
  v6 = self;
  v7 = (objc_class *)[v5 init];
  *(Class *)((char *)&self->super.super.super.isa + v4) = v7;

  type metadata accessor for InsightsCalendarDecorationView();
  swift_deallocPartialClassInstance();
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[InsightsCalendarDecorationView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC7JournalP33_FE1AF9319DABE2D117B2C08623B665DB30InsightsCalendarDecorationView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC7JournalP33_FE1AF9319DABE2D117B2C08623B665DB30InsightsCalendarDecorationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7JournalP33_FE1AF9319DABE2D117B2C08623B665DB30InsightsCalendarDecorationView_imageView));
}

@end