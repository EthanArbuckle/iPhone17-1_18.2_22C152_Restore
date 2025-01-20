@interface CRLSelectionAwareActivityViewController
- (BOOL)staysOpenOnSelectionChange;
- (_TtC8Freeform39CRLSelectionAwareActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4;
- (void)setStaysOpenOnSelectionChange:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CRLSelectionAwareActivityViewController

- (BOOL)staysOpenOnSelectionChange
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC8Freeform39CRLSelectionAwareActivityViewController_staysOpenOnSelectionChange);
}

- (void)setStaysOpenOnSelectionChange:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform39CRLSelectionAwareActivityViewController_staysOpenOnSelectionChange) = a3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLSelectionAwareActivityViewController();
  id v2 = v5.receiver;
  [(CRLSelectionAwareActivityViewController *)&v5 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    [v3 setAccessibilityViewIsModal:1];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLSelectionAwareActivityViewController();
  id v4 = v6.receiver;
  [(CRLSelectionAwareActivityViewController *)&v6 viewDidAppear:v3];
  LODWORD(v3) = UIAccessibilityLayoutChangedNotification;
  id v5 = [v4 view];
  UIAccessibilityPostNotification(v3, v5);
}

- (_TtC8Freeform39CRLSelectionAwareActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    sub_100DC6CD8();
    a4 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform39CRLSelectionAwareActivityViewController_staysOpenOnSelectionChange) = 1;
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (a4)
  {
    sub_100DC6CD8();
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CRLSelectionAwareActivityViewController();
  v8 = [(CRLSelectionAwareActivityViewController *)&v10 initWithActivityItems:v6.super.isa applicationActivities:v7.super.isa];

  return v8;
}

@end