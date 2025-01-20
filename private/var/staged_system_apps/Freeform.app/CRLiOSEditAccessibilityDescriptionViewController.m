@interface CRLiOSEditAccessibilityDescriptionViewController
- (BOOL)isCancelled;
- (NSString)accessibilityDescriptionToSubmit;
- (_TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController)initWithCoder:(id)a3;
- (_TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController)initWithInitialAccessibilityDescription:(id)a3 title:(id)a4 subtitle:(id)a5 submitButtonTitle:(id)a6 placeholder:(id)a7 delegate:(id)a8;
- (_TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)loadView;
- (void)setIsCancelled:(BOOL)a3;
- (void)triggerClose;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CRLiOSEditAccessibilityDescriptionViewController

- (BOOL)isCancelled
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController_isCancelled);
}

- (void)setIsCancelled:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController_isCancelled) = a3;
  if (a3) {
    [(CRLiOSEditAccessibilityDescriptionViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (_TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController)initWithInitialAccessibilityDescription:(id)a3 title:(id)a4 subtitle:(id)a5 submitButtonTitle:(id)a6 placeholder:(id)a7 delegate:(id)a8
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v24 = v10;
  uint64_t v25 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = v21;
  swift_getObjectType();
  swift_unknownObjectRetain();
  return (_TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController *)sub_100BA3E7C(v25, v24, v11, v13, v14, v16, v17, v19, v20, v22, (uint64_t)a8, self);
}

- (_TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController_isCancelled) = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController_isCompact) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController____lazy_storage___textView) = 0;
  id v5 = a3;

  result = (_TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_100BA2A08();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLiOSEditAccessibilityDescriptionViewController();
  id v4 = v7.receiver;
  [(CRLiOSEditAccessibilityDescriptionViewController *)&v7 viewWillAppear:v3];
  id v5 = [v4 navigationItem];
  NSString v6 = String._bridgeToObjectiveC()();
  [v5 setTitle:v6];
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLiOSEditAccessibilityDescriptionViewController();
  id v4 = v6.receiver;
  [(CRLiOSEditAccessibilityDescriptionViewController *)&v6 viewDidAppear:v3];
  LODWORD(v3) = UIAccessibilityLayoutChangedNotification;
  id v5 = [v4 view];
  UIAccessibilityPostNotification(v3, v5);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_100BA3314(a3);
}

- (void)triggerClose
{
}

- (_TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController_delegate);
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController____lazy_storage___textView);
}

- (NSString)accessibilityDescriptionToSubmit
{
  v2 = self;
  id v3 = sub_100BA3810();
  id v4 = [v3 text];

  if (v4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
  }
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  int64_t v9 = sub_100BA403C(v7);

  return v9;
}

@end