@interface DebugFormatUploadMainViewController
- (_TtC8NewsFeed35DebugFormatUploadMainViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed35DebugFormatUploadMainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8NewsFeed35DebugFormatUploadMainViewController)initWithStyle:(int64_t)a3;
- (id)primaryViewControllerForCollapsingSplitViewController:(id)a3;
- (id)primaryViewControllerForExpandingSplitViewController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DebugFormatUploadMainViewController

- (_TtC8NewsFeed35DebugFormatUploadMainViewController)initWithCoder:(id)a3
{
  result = (_TtC8NewsFeed35DebugFormatUploadMainViewController *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(DebugFormatUploadMainViewController *)&v3 viewDidLoad];
  swift_retain();
  sub_1C151896C();
  swift_release();
  sub_1C151897C();

  swift_release();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  [(DebugFormatUploadMainViewController *)&v5 viewDidDisappear:v3];
  objc_msgSend(*(id *)(*(void *)&v4[OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadMainViewController_editor]+ OBJC_IVAR____TtC8NewsFeed17DebugFormatEditor_uploaderOperationQueue), sel_cancelAllOperations, v5.receiver, v5.super_class);
}

- (_TtC8NewsFeed35DebugFormatUploadMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed35DebugFormatUploadMainViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8NewsFeed35DebugFormatUploadMainViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC8NewsFeed35DebugFormatUploadMainViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadMainViewController_uploadNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadMainViewController_uploadDiffNavigationController));
  swift_release();
}

- (id)primaryViewControllerForCollapsingSplitViewController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadMainViewController_uploadDiffNavigationController));
}

- (id)primaryViewControllerForExpandingSplitViewController:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  v6 = sub_1C0225E88();

  return v6;
}

@end