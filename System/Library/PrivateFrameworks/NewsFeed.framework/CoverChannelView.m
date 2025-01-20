@interface CoverChannelView
- (_TtC8NewsFeed16CoverChannelView)initWithCoder:(id)a3;
- (_TtC8NewsFeed16CoverChannelView)initWithFrame:(CGRect)a3;
@end

@implementation CoverChannelView

- (_TtC8NewsFeed16CoverChannelView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed16CoverChannelView *)CoverChannelView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed16CoverChannelView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s8NewsFeed16CoverChannelViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed16CoverChannelView_moreActionsButton));

  swift_release();
}

@end