@interface WFMainViewController
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (NSArray)keyCommands;
- (NSUndoManager)undoManager;
- (WFMainViewController)initWithCoder:(id)a3;
- (WFMainViewController)initWithDatabase:(id)a3;
- (WFMainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)runCoordinator:(id)a3 userInterfaceForWorkflow:(id)a4;
- (void)beginSearching;
- (void)composeViewControllerRequestsDismissal:(id)a3 forTutorial:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)createFolderFromKeyboard;
- (void)createWorkflowFromKeyboard;
- (void)didBecomeActive:(id)a3;
- (void)documentMenuDidDuplicateWorkflow:(id)a3;
- (void)highlightAutomationWithTriggerID:(id)a3;
- (void)importShortcutFileWithResult:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)runCoordinator:(id)a3 accessibilityAnnounce:(id)a4;
- (void)runCoordinator:(id)a3 didChangeRunningStateWithProgress:(double)a4 waiting:(BOOL)a5 cancelled:(BOOL)a6 forWorkflow:(id)a7;
- (void)runCoordinator:(id)a3 didFinishRunningWorkflow:(id)a4 withError:(id)a5;
- (void)runCoordinator:(id)a3 showSettingsForWorkflow:(id)a4 inDatabase:(id)a5 presentingViewController:(id)a6;
- (void)runWorkflowFromState:(id)a3 source:(id)a4;
- (void)switchToAutomationsViewController;
- (void)switchToFolderWithSender:(id)a3;
- (void)switchToGalleryViewController;
- (void)switchToLastFolder;
- (void)switchToNextViewController;
- (void)switchToPreviousViewController;
- (void)switchToShortcutsViewController;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)toggleSidebarDisplay;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation WFMainViewController

- (void)didBecomeActive:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_100006220();
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_100006A88();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = a3;
  id v5 = self;
  sub_10000DDCC(a3);
}

- (NSUndoManager)undoManager
{
  v2 = sub_1000124F4();

  return (NSUndoManager *)v2;
}

- (WFMainViewController)initWithDatabase:(id)a3
{
  id v3 = a3;
  return (WFMainViewController *)sub_10000788C();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1000085AC(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10000F47C();
}

- (WFMainViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100031550();
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  sub_10003167C(v7, a4);

  swift_unknownObjectRelease();
}

- (NSArray)keyCommands
{
  v2 = self;
  id v3 = sub_100037554();

  if (v3)
  {
    sub_100029C7C(0, &qword_1000F5258);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)createFolderFromKeyboard
{
  v2 = self;
  sub_100037F18();
}

- (void)switchToShortcutsViewController
{
  v2 = self;
  sub_100037F68();
}

- (void)switchToAutomationsViewController
{
  v2 = self;
  sub_100037FBC();
}

- (void)switchToGalleryViewController
{
  v2 = self;
  sub_100038100();
}

- (void)switchToFolderWithSender:(id)a3
{
  id v5 = a3;
  NSArray v4 = self;
  sub_100038264();
}

- (void)switchToLastFolder
{
  v2 = self;
  sub_10003889C();
}

- (void)switchToNextViewController
{
  v2 = self;
  sub_100038B2C();
}

- (void)switchToPreviousViewController
{
  v2 = self;
  sub_100038FD0();
}

- (void)beginSearching
{
  v2 = self;
  sub_100039348();
}

- (void)createWorkflowFromKeyboard
{
  v2 = self;
  sub_1000393A8();
}

- (void)toggleSidebarDisplay
{
  v2 = self;
  sub_10003946C();
}

- (WFMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_100039520();
}

- (void).cxx_destruct
{
  type metadata accessor for RootNavigationDestination();
  sub_10001C094();
  sub_100016618();
  v3();
  sub_100025E44((uint64_t)self + OBJC_IVAR___WFMainViewController_currentDestination, &qword_1000F5130);

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFMainViewController____lazy_storage___columnSidebar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFMainViewController____lazy_storage___compactSidebar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFMainViewController____lazy_storage___columnGalleryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFMainViewController____lazy_storage___compactGalleryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFMainViewController____lazy_storage___searchStateController));

  NSArray v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFMainViewController_splitView);
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10003A178();
  char v10 = v9;

  return v10 & 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10003A4DC();
}

- (id)runCoordinator:(id)a3 userInterfaceForWorkflow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10003A894();
  char v10 = v9;

  return v10;
}

- (void)runCoordinator:(id)a3 showSettingsForWorkflow:(id)a4 inDatabase:(id)a5 presentingViewController:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_10003ACF0();
}

- (void)runCoordinator:(id)a3 accessibilityAnnounce:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  id v7 = self;
  sub_10003ADA4();

  swift_bridgeObjectRelease();
}

- (void)composeViewControllerRequestsDismissal:(id)a3 forTutorial:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v7 = _Block_copy(a5);
  if (v7)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    id v7 = sub_10003F070;
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = a3;
  id v10 = self;
  sub_10003AFE0(v9, 0, (uint64_t)v7, v8);
  sub_10002354C((uint64_t)v7);
}

- (void)documentMenuDidDuplicateWorkflow:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10003B168();
}

- (void)runCoordinator:(id)a3 didChangeRunningStateWithProgress:(double)a4 waiting:(BOOL)a5 cancelled:(BOOL)a6 forWorkflow:(id)a7
{
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a7;
  id v13 = self;
  sub_10003B258((uint64_t)v13, v9, a6);
}

- (void)runCoordinator:(id)a3 didFinishRunningWorkflow:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = a5;
  sub_10003B590();
}

- (void)runWorkflowFromState:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10003BCA4();
}

- (void)highlightAutomationWithTriggerID:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v4 = self;
  sub_10003C034();

  swift_bridgeObjectRelease();
}

- (void)importShortcutFileWithResult:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = self;
  sub_10003C1FC((uint64_t)v10, a4, (uint64_t)sub_10003EE70, v9);

  swift_release();
}

@end