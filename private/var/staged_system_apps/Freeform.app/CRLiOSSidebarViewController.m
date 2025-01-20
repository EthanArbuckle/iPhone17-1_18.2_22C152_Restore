@interface CRLiOSSidebarViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (NSUndoManager)undoManager;
- (UIWindow)keyboardObserversWindow;
- (_TtC8Freeform27CRLiOSSidebarViewController)initWithCoder:(id)a3;
- (_TtC8Freeform27CRLiOSSidebarViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC8Freeform27CRLiOSSidebarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)keyboardWillHideOrUndock:(id)a3;
- (void)keyboardWillShowOrDock:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CRLiOSSidebarViewController

- (_TtC8Freeform27CRLiOSSidebarViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100573850();
}

- (void)dealloc
{
  v2 = self;
  sub_10056B65C();
}

- (void).cxx_destruct
{
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform27CRLiOSSidebarViewController_delegate);
  swift_release();
  swift_unknownObjectRelease();
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform27CRLiOSSidebarViewController_selectedItem, (uint64_t *)&unk_101676310);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10056B858();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  sub_100573D5C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLiOSSidebarViewController();
  id v4 = v5.receiver;
  [(CRLiOSSidebarViewController *)&v5 viewDidAppear:v3];
  [self addKeyboardObserver:v4];
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    v7 = self;
  }
  sub_10056DD98((uint64_t)a3, (uint64_t)v15, &v16);

  sub_100522F00((uint64_t)v15, &qword_101672BF0);
  uint64_t v8 = v17;
  if (v17)
  {
    v9 = sub_10050F848(&v16, v17);
    uint64_t v10 = *(void *)(v8 - 8);
    __chkstk_darwin(v9, v9);
    v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v12);
    v13 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
    _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)&v16);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (_TtC8Freeform27CRLiOSSidebarViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC8Freeform27CRLiOSSidebarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8Freeform27CRLiOSSidebarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Freeform27CRLiOSSidebarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_1005740C8();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = self;
  sub_100574430();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (NSUndoManager)undoManager
{
  v2 = self;
  id v3 = sub_10056E3EC();

  return (NSUndoManager *)v3;
}

- (UIWindow)keyboardObserversWindow
{
  v2 = self;
  result = (UIWindow *)[(CRLiOSSidebarViewController *)v2 view];
  if (result)
  {
    id v4 = result;
    id v5 = [(UIWindow *)result window];

    return (UIWindow *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)keyboardWillShowOrDock:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = self;
  sub_10056E608();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)keyboardWillHideOrUndock:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = self;
  id v10 = [(CRLiOSSidebarViewController *)v9 collectionView];
  if (v10)
  {
    id v11 = v10;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    [v10 setContentInset:UIEdgeInsetsZero.top, left, bottom, right];

    id v15 = [(CRLiOSSidebarViewController *)v9 collectionView];
    if (v15)
    {
      long long v16 = v15;
      [v15 setScrollIndicatorInsets:UIEdgeInsetsZero.top, left, bottom, right];

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

@end