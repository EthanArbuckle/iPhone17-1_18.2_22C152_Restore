@interface UnifiedMessagingBannerViewController
- (_TtC8VideosUI36UnifiedMessagingBannerViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI36UnifiedMessagingBannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)vui_loadView;
@end

@implementation UnifiedMessagingBannerViewController

- (void)vui_loadView
{
  v2 = self;
  sub_1E325A338();
}

- (_TtC8VideosUI36UnifiedMessagingBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1E387C928();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8VideosUI36UnifiedMessagingBannerViewController *)sub_1E325A658(v5, v7, a4);
}

- (_TtC8VideosUI36UnifiedMessagingBannerViewController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI36UnifiedMessagingBannerViewController *)sub_1E325A760(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI36UnifiedMessagingBannerViewController____lazy_storage___containerView));
}

@end