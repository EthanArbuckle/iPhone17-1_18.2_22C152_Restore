@interface InternalErrorView
- (_TtC8NewsFeed17InternalErrorView)initWithCoder:(id)a3;
- (_TtC8NewsFeed17InternalErrorView)initWithFrame:(CGRect)a3;
@end

@implementation InternalErrorView

- (_TtC8NewsFeed17InternalErrorView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed17InternalErrorView *)InternalErrorView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed17InternalErrorView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s8NewsFeed17InternalErrorViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed17InternalErrorView_onErrorButtonTap));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed17InternalErrorView_attachmentLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed17InternalErrorView_debugButton);
}

@end