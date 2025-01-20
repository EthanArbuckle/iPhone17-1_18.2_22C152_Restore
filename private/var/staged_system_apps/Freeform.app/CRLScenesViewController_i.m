@interface CRLScenesViewController_i
- (BOOL)canBecomeFirstResponder;
- (NSArray)keyCommands;
- (UIResponder)nextResponder;
- (_TtC8Freeform25CRLScenesViewController_i)initWithCoder:(id)a3;
- (_TtC8Freeform25CRLScenesViewController_i)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)deleteForward:(id)a3;
- (void)dismissScenesPopover;
- (void)dismissScenesPopoverWithAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentScenesPopoverWith:(id)a3 at:(id)a4 passthroughViews:(id)a5;
- (void)viewDidLoad;
@end

@implementation CRLScenesViewController_i

- (_TtC8Freeform25CRLScenesViewController_i)initWithCoder:(id)a3
{
  *(void *)&self->hostingController[OBJC_IVAR____TtC8Freeform25CRLScenesViewController_i_scenesDelegate] = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLScenesViewController_i_isTornDown) = 0;
  id v5 = a3;

  result = (_TtC8Freeform25CRLScenesViewController_i *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dealloc
{
  char v2 = *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLScenesViewController_i_isTornDown);
  v3 = self;
  if ((v2 & 1) == 0)
  {
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLScenesViewController_i.swift", 95, 2, 34, (uint64_t)"teardown not called for CRLScenesViewController_i", 49, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLScenesViewController_i.swift", 95, 2, 34);
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CRLScenesViewController_i();
  [(CRLScenesViewController_i *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLScenesViewController_i_hostingController));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLScenesViewController_i_scenesPopoverState));
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform25CRLScenesViewController_i_scenesDelegate;

  sub_100523398((uint64_t)v3);
}

- (void)viewDidLoad
{
  char v2 = self;
  sub_1005DF974();
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)delete:(id)a3
{
  if (a3)
  {
    objc_super v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_1005DFE50();

  sub_100522F00((uint64_t)v6, &qword_101672BF0);
}

- (void)deleteForward:(id)a3
{
  if (a3)
  {
    objc_super v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_1005DFFB8((uint64_t)v6);

  sub_100522F00((uint64_t)v6, &qword_101672BF0);
}

- (NSArray)keyCommands
{
  if (sub_1005E1AF0())
  {
    sub_10050BF48(0, (unint64_t *)&unk_10167B160);
    v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return (NSArray *)v2.super.isa;
}

- (UIResponder)nextResponder
{
  NSArray v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLScenesViewController_i_icc);
  v3 = self;
  id v4 = [v2 layerHost];
  if (v4)
  {
    id v5 = v4;
    if ([v4 respondsToSelector:"asiOSCVC"])
    {
      id v6 = [v5 asiOSCVC];

      swift_unknownObjectRelease();
      goto LABEL_7;
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
  id v6 = 0;
LABEL_7:

  return (UIResponder *)v6;
}

- (void)presentScenesPopoverWith:(id)a3 at:(id)a4 passthroughViews:(id)a5
{
  id v5 = (objc_class *)a5;
  if (a5)
  {
    sub_10050BF48(0, (unint64_t *)&qword_1016725F0);
    id v5 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_1005E02A0(v9, (uint64_t)v10, v5);

  swift_bridgeObjectRelease();
}

- (void)dismissScenesPopoverWithAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    id v6 = sub_1005E21D4;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_1005E0998(a3, (uint64_t)v6, v7);
  sub_1005174AC((uint64_t)v6);
}

- (_TtC8Freeform25CRLScenesViewController_i)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void)dismissScenesPopover
{
  NSArray v2 = self;
  id v4 = a1;
  unsigned int v3 = [v2 isReduceMotionEnabled];
  if (([v4 isBeingDismissed] & 1) == 0) {
    [v4 dismissViewControllerAnimated:v3 ^ 1 completion:0];
  }
}

@end