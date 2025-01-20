@interface DebugFormatTestCasePreviewController
- (_TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController)initWithCoder:(id)a3;
- (_TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatTestCasePreviewController

- (_TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController_scrollView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1BE0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C14B7A3C();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1C14B7B9C();
}

- (_TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController_debugView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController_scrollView);
}

@end