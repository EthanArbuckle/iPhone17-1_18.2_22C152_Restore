@interface CRLiOSCanvasZoomControlViewController
- (_TtC8Freeform37CRLiOSCanvasZoomControlViewController)initWithCoder:(id)a3;
- (_TtC8Freeform37CRLiOSCanvasZoomControlViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)updateViewConstraints;
- (void)viewDidLoad;
@end

@implementation CRLiOSCanvasZoomControlViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1005EB334();
}

- (void)updateViewConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLiOSCanvasZoomControlViewController();
  id v2 = v3.receiver;
  [(CRLiOSCanvasZoomControlViewController *)&v3 updateViewConstraints];
  sub_1005EC078();
}

- (_TtC8Freeform37CRLiOSCanvasZoomControlViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8Freeform37CRLiOSCanvasZoomControlViewController *)sub_1005EC884(v5, v7, a4);
}

- (_TtC8Freeform37CRLiOSCanvasZoomControlViewController)initWithCoder:(id)a3
{
  return (_TtC8Freeform37CRLiOSCanvasZoomControlViewController *)sub_1005ECA0C(a3);
}

- (void).cxx_destruct
{
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform37CRLiOSCanvasZoomControlViewController_delegate);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform37CRLiOSCanvasZoomControlViewController____lazy_storage___button));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform37CRLiOSCanvasZoomControlViewController_menu));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform37CRLiOSCanvasZoomControlViewController_buttonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform37CRLiOSCanvasZoomControlViewController_buttonHeightConstraint));

  swift_unknownObjectRelease();
}

@end