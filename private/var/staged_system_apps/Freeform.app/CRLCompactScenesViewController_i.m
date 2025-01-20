@interface CRLCompactScenesViewController_i
- (UIResponder)nextResponder;
- (_TtC8Freeform32CRLCompactScenesViewController_i)initWithCoder:(id)a3;
- (_TtC8Freeform32CRLCompactScenesViewController_i)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)dismissScenesPopoverWithAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentScenesPopoverWith:(id)a3;
- (void)updateSheetPresentationDetents;
- (void)viewDidLoad;
@end

@implementation CRLCompactScenesViewController_i

- (_TtC8Freeform32CRLCompactScenesViewController_i)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform32CRLCompactScenesViewController_i_isTornDown) = 0;
  id v4 = a3;

  result = (_TtC8Freeform32CRLCompactScenesViewController_i *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dealloc
{
  char v2 = *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform32CRLCompactScenesViewController_i_isTornDown);
  v3 = self;
  if ((v2 & 1) == 0)
  {
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLScenesViewController_i.swift", 95, 2, 168, (uint64_t)"teardown not called for CRLCompactScenesViewController_i", 56, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLScenesViewController_i.swift", 95, 2, 168);
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CRLCompactScenesViewController_i();
  [(CRLCompactScenesViewController_i *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLCompactScenesViewController_i_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLCompactScenesViewController_i_scenesPopoverState));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform32CRLCompactScenesViewController_i_icc);
}

- (void)viewDidLoad
{
  char v2 = self;
  sub_1005E0D48();
}

- (UIResponder)nextResponder
{
  char v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform32CRLCompactScenesViewController_i_icc);
  v3 = self;
  id v4 = [v2 layerHost];
  if (v4)
  {
    v5 = v4;
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

- (void)presentScenesPopoverWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1005E13AC(v4);
}

- (void)dismissScenesPopoverWithAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    id v6 = sub_1005E2108;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_1005E1758(a3, (uint64_t)v6, v7);
  sub_1005174AC((uint64_t)v6);
}

- (void)updateSheetPresentationDetents
{
  id v6 = self;
  id v2 = [(CRLCompactScenesViewController_i *)v6 sheetPresentationController];
  if (v2)
  {
    v3 = v2;
    sub_1005E1FAC();
    sub_10050BF48(0, (unint64_t *)&qword_1016A0060);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v3 setDetents:isa];

    v5 = isa;
  }
  else
  {
    v5 = v6;
  }
}

- (_TtC8Freeform32CRLCompactScenesViewController_i)initWithNibName:(id)a3 bundle:(id)a4
{
}

@end