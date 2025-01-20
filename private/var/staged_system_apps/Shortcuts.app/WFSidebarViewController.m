@interface WFSidebarViewController
- (WFSidebarViewController)initWithCoder:(id)a3;
- (WFSidebarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)addFolder;
- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)endEditing;
- (void)keyboardWillChange:(id)a3;
- (void)presentFolderEditorWithSender:(id)a3;
- (void)startEditing;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFSidebarViewController

- (WFSidebarViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10009ECE8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10009F000();
}

- (void)dealloc
{
  v2 = self;
  sub_10009F618();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR___WFSidebarViewController_style;
  type metadata accessor for SidebarStyle();
  sub_10001C094();
  (*(void (**)(char *))(v4 + 8))(v3);

  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectWeakDestroy();
  sub_100026E90(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR___WFSidebarViewController____lazy_storage___toolbarViewController));
  sub_1000A1390(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR___WFSidebarViewController____lazy_storage___barButtons), *(void **)&self->database[OBJC_IVAR___WFSidebarViewController____lazy_storage___barButtons], *(void **)&self->sections[OBJC_IVAR___WFSidebarViewController____lazy_storage___barButtons]);

  swift_release();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10009F7AC(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10009F92C(a3);
}

- (void)didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10009FA50((uint64_t)a3);
}

- (void)keyboardWillChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10009FB10(v4);
}

- (void)startEditing
{
  v2 = self;
  sub_1000A016C(1);
}

- (void)endEditing
{
  v2 = self;
  sub_1000A016C(0);
}

- (void)addFolder
{
  v2 = self;
  sub_1000A0634();
}

- (void)presentFolderEditorWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000A06F0();
}

- (WFSidebarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_1000A07B8();
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  sub_100029C7C(0, (unint64_t *)&qword_1000F53D8);
  sub_1000A1460();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  v9 = self;
  sub_1000A0920();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end