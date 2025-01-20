@interface CoverIssueView
- (NSString)accessibilityValue;
- (_TtC8NewsFeed14CoverIssueView)initWithCoder:(id)a3;
- (_TtC8NewsFeed14CoverIssueView)initWithFrame:(CGRect)a3;
- (void)setAccessibilityValue:(id)a3;
@end

@implementation CoverIssueView

- (_TtC8NewsFeed14CoverIssueView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed14CoverIssueView *)CoverIssueView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed14CoverIssueView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s8NewsFeed14CoverIssueViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (NSString)accessibilityValue
{
  v2 = self;
  CoverIssueView.accessibilityValue.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityValue:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1C151E62C();
    v6 = self;
    a3 = (id)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(CoverIssueView *)&v8 setAccessibilityValue:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed14CoverIssueView_secondaryIssueCoverView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed14CoverIssueView_downloadProgressBar));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed14CoverIssueView_selectionImageView));
  sub_1BFC3E5C0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed14CoverIssueView_onEditSelection));
  swift_release();
  sub_1C019B9B4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed14CoverIssueView_downloadButtonDataProvider);
  sub_1C03F5550((uint64_t)self + OBJC_IVAR____TtC8NewsFeed14CoverIssueView_downloadStateDisposable);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed14CoverIssueView_downloadProgressDisposable;
  sub_1C03F5550((uint64_t)v3);
}

@end