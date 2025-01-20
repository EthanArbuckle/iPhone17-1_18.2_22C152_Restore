@interface RootSplitViewController
- (BOOL)controllerExistsForIdentifier:(id)a3;
- (BOOL)hasRemoteBarItems;
- (BOOL)isTabbarMode;
- (UINavigationController)currentNavigationController;
- (UIViewController)currentViewController;
- (_TtC8VideosUI23RootSplitViewController)init;
- (_TtC8VideosUI23RootSplitViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI23RootSplitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8VideosUI23RootSplitViewController)initWithStyle:(int64_t)a3;
- (id)controllerForIdentifier:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)preferredDisplayMode;
- (void)_splitViewController:(id)a3 didChangeFromDisplayMode:(int64_t)a4 toDisplayMode:(int64_t)a5;
- (void)dealloc;
- (void)didEnterBackground:(id)a3;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4;
- (void)removeAllChildViewControllers;
- (void)setPreferredDisplayMode:(int64_t)a3;
- (void)setSelectedIndexForIdentifier:(id)a3 withDeeplinkURL:(id)a4;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)updateWithBarItems:(id)a3 setSelectedIdentifierFromDefaults:(BOOL)a4 appContext:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willEnterForeground:(id)a3;
@end

@implementation RootSplitViewController

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_1E35EC958(v4);

  return v6;
}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  id v5 = a3;
  int64_t v6 = self;
  sub_1E35EF338();
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_1E35EF534();
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1E35EF694();
}

- (UINavigationController)currentNavigationController
{
  v2 = self;
  v3 = (void *)sub_1E36D9628();

  return (UINavigationController *)v3;
}

- (UIViewController)currentViewController
{
  v2 = self;
  v3 = (void *)sub_1E36D96CC();

  return (UIViewController *)v3;
}

- (int64_t)preferredDisplayMode
{
  v2 = self;
  id v3 = sub_1E36D9F68();

  return (int64_t)v3;
}

- (void)setPreferredDisplayMode:(int64_t)a3
{
  id v4 = self;
  sub_1E36D9FF0(a3);
}

- (_TtC8VideosUI23RootSplitViewController)init
{
  sub_1E36DA418();
  return result;
}

- (_TtC8VideosUI23RootSplitViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E36DAAE4();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E36DACEC(v4);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E36DAFC8(v4);
}

- (void)willEnterForeground:(id)a3
{
}

- (void)didEnterBackground:(id)a3
{
}

- (void)dealloc
{
  v2 = self;
  sub_1E36DB3E0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23RootSplitViewController_rootControllerConfig));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23RootSplitViewController_manager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23RootSplitViewController____lazy_storage___sideBarController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23RootSplitViewController____lazy_storage___splitTabBarController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23RootSplitViewController_libraryManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23RootSplitViewController_secondaryColumnHostingController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23RootSplitViewController_presentedTipViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI23RootSplitViewController_accountMessageViewController);
}

- (_TtC8VideosUI23RootSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E36DB54C();
}

- (_TtC8VideosUI23RootSplitViewController)initWithStyle:(int64_t)a3
{
}

- (void)updateWithBarItems:(id)a3 setSelectedIdentifierFromDefaults:(BOOL)a4 appContext:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF8E580);
  sub_1E387CC98();
  id v7 = a5;
  id v8 = self;
  sub_1E36DD444();

  swift_bridgeObjectRelease();
}

- (void)setSelectedIndexForIdentifier:(id)a3 withDeeplinkURL:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF8F0E0);
  MEMORY[0x1F4188790](v7 - 8);
  OUTLINED_FUNCTION_31();
  uint64_t v10 = v9 - v8;
  if (!a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v11 = sub_1E38760D8();
    uint64_t v12 = 1;
    goto LABEL_6;
  }
  sub_1E387C928();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  sub_1E3876088();
  uint64_t v11 = sub_1E38760D8();
  uint64_t v12 = 0;
LABEL_6:
  __swift_storeEnumTagSinglePayload(v10, v12, 1, v11);
  v13 = self;
  OUTLINED_FUNCTION_55_0();
  sub_1E36DD944();

  swift_bridgeObjectRelease();
  sub_1E2BEA314(v10, &qword_1EBF8F0E0);
}

- (BOOL)controllerExistsForIdentifier:(id)a3
{
  sub_1E387C928();
  char v4 = self;
  OUTLINED_FUNCTION_247();
  BOOL v5 = sub_1E36DDADC();

  swift_bridgeObjectRelease();
  return v5;
}

- (id)controllerForIdentifier:(id)a3
{
  sub_1E387C928();
  char v4 = self;
  OUTLINED_FUNCTION_247();
  sub_1E36DDB9C();
}

- (BOOL)isTabbarMode
{
  v2 = self;
  BOOL v3 = sub_1E36DDCE4();

  return v3;
}

- (void)removeAllChildViewControllers
{
  v2 = self;
  sub_1E36DDD94();
}

- (BOOL)hasRemoteBarItems
{
  v2 = self;
  char v3 = sub_1E36DDE3C();

  return v3 & 1;
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1E36DE250((uint64_t)v7, a4);
}

- (void)_splitViewController:(id)a3 didChangeFromDisplayMode:(int64_t)a4 toDisplayMode:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = self;
  sub_1E36DE618((uint64_t)v9, a4, a5);
}

@end