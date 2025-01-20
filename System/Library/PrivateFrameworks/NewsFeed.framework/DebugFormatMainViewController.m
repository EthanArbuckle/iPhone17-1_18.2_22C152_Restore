@interface DebugFormatMainViewController
- (_TtC8NewsFeed29DebugFormatMainViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed29DebugFormatMainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8NewsFeed29DebugFormatMainViewController)initWithStyle:(int64_t)a3;
- (id)primaryViewControllerForCollapsingSplitViewController:(id)a3;
- (id)primaryViewControllerForExpandingSplitViewController:(id)a3;
- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4;
- (void)dealloc;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatMainViewController

- (void)dealloc
{
  v2 = self;
  sub_1C0CFF988();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_socketServer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_inventoryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_inventoryContainerController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_editorViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_editorContainerController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_layoutViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_bindingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_compilerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_testViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_containerSegmentedViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_logViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_debuggerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_consoleViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_fileViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_sourceViewController));
  memcpy(v3, (char *)self + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_packages, sizeof(v3));
  sub_1C09C51F8((uint64_t)v3);
}

- (_TtC8NewsFeed29DebugFormatMainViewController)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_packages;
  uint64_t v5 = qword_1EA194C50;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  memcpy(__dst, &byte_1EA2B5418, sizeof(__dst));
  memmove((char *)self + v4, &byte_1EA2B5418, 0x150uLL);
  sub_1C09C3F4C((uint64_t)__dst);

  result = (_TtC8NewsFeed29DebugFormatMainViewController *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C0D0012C();
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(DebugFormatMainViewController *)&v3 viewWillLayoutSubviews];
  objc_msgSend(*(id *)(*(void *)&v2[OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_socketServer]+ OBJC_IVAR____TtC8NewsFeed23DebugFormatSocketServer_reloadOperationQueue), sel_setSuspended_, 0, v3.receiver, v3.super_class);
}

- (_TtC8NewsFeed29DebugFormatMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed29DebugFormatMainViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8NewsFeed29DebugFormatMainViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC8NewsFeed29DebugFormatMainViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)primaryViewControllerForCollapsingSplitViewController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_consoleViewController));
}

- (id)primaryViewControllerForExpandingSplitViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1C0D02E88();

  return v6;
}

- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_consoleViewController));
}

@end