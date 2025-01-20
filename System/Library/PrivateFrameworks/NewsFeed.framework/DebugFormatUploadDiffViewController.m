@interface DebugFormatUploadDiffViewController
- (_TtC8NewsFeed35DebugFormatUploadDiffViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed35DebugFormatUploadDiffViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)doDismiss;
- (void)doToggleSidebar;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatUploadDiffViewController

- (_TtC8NewsFeed35DebugFormatUploadDiffViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C022F414();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C022C914();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1C022DBE0();
}

- (void)doDismiss
{
}

- (void)doToggleSidebar
{
  v2 = self;
  sub_1C022DFE0();
}

- (_TtC8NewsFeed35DebugFormatUploadDiffViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed35DebugFormatUploadDiffViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadDiffViewController_statusView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadDiffViewController_remoteDiffView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadDiffViewController_remoteDiffGutterView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadDiffViewController_localDiffView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadDiffViewController_localDiffGutterView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadDiffViewController_changeSetLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadDiffViewController____lazy_storage___chaneSetBarButtonItem);
}

@end