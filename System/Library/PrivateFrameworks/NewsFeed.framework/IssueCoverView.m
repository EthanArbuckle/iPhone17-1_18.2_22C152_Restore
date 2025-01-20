@interface IssueCoverView
- (_TtC8NewsFeed14IssueCoverView)initWithCoder:(id)a3;
- (_TtC8NewsFeed14IssueCoverView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation IssueCoverView

- (_TtC8NewsFeed14IssueCoverView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed14IssueCoverView *)IssueCoverView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed14IssueCoverView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s8NewsFeed14IssueCoverViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  v2 = self;
  IssueCoverView.layoutSubviews()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed14IssueCoverView____lazy_storage___staticContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed14IssueCoverView____lazy_storage___dynamicContentView));

  swift_bridgeObjectRelease();
}

@end