@interface UnifiedMessagingViewController
- (BOOL)messageViewController:(id)a3 shouldEnqueueMetricsForDialogResult:(id)a4;
- (_TtC8VideosUI30UnifiedMessagingViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI30UnifiedMessagingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4;
- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5;
@end

@implementation UnifiedMessagingViewController

- (_TtC8VideosUI30UnifiedMessagingViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8VideosUI30UnifiedMessagingViewController *)sub_1E321AB34(v5, v7, a4);
}

- (_TtC8VideosUI30UnifiedMessagingViewController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI30UnifiedMessagingViewController *)sub_1E321AC50(a3);
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI30UnifiedMessagingViewController_messageViewController);
}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1E321AD60();
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1E321AF74((uint64_t)v6, v7);
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_1E321BB28((uint64_t)v8, a4);
}

- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5
{
  uint64_t v8 = sub_1E387C678();
  if (a5)
  {
    uint64_t v9 = sub_1E387C928();
    a5 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v11 = a3;
  v12 = self;
  sub_1E321BD94((uint64_t)v12, v8, v9, (uint64_t)a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)messageViewController:(id)a3 shouldEnqueueMetricsForDialogResult:(id)a4
{
  return 1;
}

@end