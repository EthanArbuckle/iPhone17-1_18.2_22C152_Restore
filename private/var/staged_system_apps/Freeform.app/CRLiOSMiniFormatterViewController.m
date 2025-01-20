@interface CRLiOSMiniFormatterViewController
- (CRLCanvasRep)crlaxCurrentPresentedRep;
- (_TtC8Freeform33CRLiOSMiniFormatterViewController)initWithCoder:(id)a3;
- (_TtC8Freeform33CRLiOSMiniFormatterViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)crlaxAccessibilityViews;
- (void)loadView;
- (void)setCrlaxCurrentPresentedRep:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CRLiOSMiniFormatterViewController

- (CRLCanvasRep)crlaxCurrentPresentedRep
{
  return (CRLCanvasRep *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_crlaxCurrentPresentedRep));
}

- (void)setCrlaxCurrentPresentedRep:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_crlaxCurrentPresentedRep);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_crlaxCurrentPresentedRep) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform33CRLiOSMiniFormatterViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10093B7C4();
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)UIView);
  id v4 = self;
  id v5 = [v3 init];
  [(CRLiOSMiniFormatterViewController *)v4 setView:v5];
}

- (id)crlaxAccessibilityViews
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_stackViewForDisplay);
  id v3 = self;
  id v4 = [v2 arrangedSubviews];
  sub_10050BF48(0, (unint64_t *)&qword_1016725F0);
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100590A14(v5);
  swift_bridgeObjectRelease();
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1009361D4();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLiOSMiniFormatterViewController();
  id v4 = v5.receiver;
  [(CRLiOSMiniFormatterViewController *)&v5 viewDidAppear:v3];
  sub_10050F848(&v4[OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_delegate], *(void *)&v4[OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_delegate + 24]);
  sub_100669178();
  v4[OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_viewDidAppear] = 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CRLiOSMiniFormatterViewController();
  swift_unknownObjectRetain();
  id v7 = v10.receiver;
  -[CRLiOSMiniFormatterViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  id v8 = [v7 view];
  if (v8)
  {
    v9 = v8;
    [v8 setNeedsLayout];
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_100936C74();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLiOSMiniFormatterViewController();
  v2 = v3.receiver;
  [(CRLiOSMiniFormatterViewController *)&v3 viewDidLayoutSubviews];
  if ((v2[OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_isAnimatingHide] & 1) == 0
    && v2[OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_isAnimatingDisplay] != 1)
  {
    sub_10093A8AC();
  }
}

- (_TtC8Freeform33CRLiOSMiniFormatterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Freeform33CRLiOSMiniFormatterViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_stackViewForDisplay));
  swift_bridgeObjectRelease();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_repTrackingViewHelper));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_fixedPositionDynamicOperationViewHelper));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_crlaxCurrentPresentedRep);
}

@end