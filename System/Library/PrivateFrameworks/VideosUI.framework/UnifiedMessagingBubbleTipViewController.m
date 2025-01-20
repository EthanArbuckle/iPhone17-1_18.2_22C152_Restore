@interface UnifiedMessagingBubbleTipViewController
- (_TtC8VideosUI39UnifiedMessagingBubbleTipViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI39UnifiedMessagingBubbleTipViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)vui_loadView;
@end

@implementation UnifiedMessagingBubbleTipViewController

- (void)vui_loadView
{
  v2 = self;
  sub_1E3434FF8();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1E3435260(a3);
}

- (_TtC8VideosUI39UnifiedMessagingBubbleTipViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8VideosUI39UnifiedMessagingBubbleTipViewController *)sub_1E3435790(v5, v7, a4);
}

- (_TtC8VideosUI39UnifiedMessagingBubbleTipViewController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI39UnifiedMessagingBubbleTipViewController *)sub_1E3435898(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI39UnifiedMessagingBubbleTipViewController____lazy_storage___containerView));
}

@end