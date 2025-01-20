@interface DOCFilenameViewController
- (BOOL)presentFromViewController:(id)a3 animated:(BOOL)a4;
- (FPItem)item;
- (NSArray)keyCommands;
- (_TtC5Files15DOCFilenameView)filenameView;
- (_TtC5Files25DOCFilenameViewController)initWithCoder:(id)a3;
- (_TtC5Files25DOCFilenameViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelViewController;
- (void)editingDidChange:(id)a3;
- (void)editingDidEnd:(id)a3;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)loadView;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DOCFilenameViewController

- (_TtC5Files15DOCFilenameView)filenameView
{
  return (_TtC5Files15DOCFilenameView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                + OBJC_IVAR____TtC5Files25DOCFilenameViewController_filenameView));
}

- (FPItem)item
{
  return (FPItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC5Files25DOCFilenameViewController_item));
}

- (_TtC5Files25DOCFilenameViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC5Files25DOCFilenameViewController_keyboardWasOnScreenInViewWillAppear) = 2;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files25DOCFilenameViewController_dismissing) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files25DOCFilenameViewController_visibilityState) = 0;
  id v4 = a3;

  result = (_TtC5Files25DOCFilenameViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)presentFromViewController:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1002E97A4(v6, a4);

  return 1;
}

- (void)loadView
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files25DOCFilenameViewController_filenameView);
  id v4 = objc_allocWithZone((Class)type metadata accessor for DOCSafeAreaView());
  v5 = self;
  id v6 = sub_1002E4A88(v3);
  [(DOCFilenameViewController *)v5 setView:v6];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for DOCFilenameViewController();
  [(DOCFilenameViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCFilenameViewController();
  id v4 = v5.receiver;
  [(DOCFilenameViewController *)&v5 viewWillAppear:v3];
  v4[OBJC_IVAR____TtC5Files25DOCFilenameViewController_keyboardWasOnScreenInViewWillAppear] = [self isOnScreen];
  sub_1002E877C(v4[OBJC_IVAR____TtC5Files25DOCFilenameViewController_contentMustBeSelected]);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCFilenameViewController();
  id v4 = v5.receiver;
  [(DOCFilenameViewController *)&v5 viewDidDisappear:v3];
  v4[OBJC_IVAR____TtC5Files25DOCFilenameViewController_keyboardWasOnScreenInViewWillAppear] = 2;
  v4[OBJC_IVAR____TtC5Files25DOCFilenameViewController_dismissing] = 0;
  sub_1002E90AC();
}

- (void)cancelViewController
{
  objc_super v2 = self;
  sub_1002E9C48();
}

- (NSArray)keyCommands
{
  BOOL v3 = self;
  id v4 = self;
  id v5 = [v3 dismissingKeyCommandsWithAction:"cancelViewController"];
  sub_10009E6C4(0, &qword_100708860);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v6.super.isa;
}

- (void)editingDidEnd:(id)a3
{
}

- (void)editingDidChange:(id)a3
{
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCFilenameViewController();
  id v6 = v8.receiver;
  id v7 = a3;
  [(DOCFilenameViewController *)&v8 viewDidMoveToWindow:v7 shouldAppearOrDisappear:v4];
  if (v7)
  {
    sub_1002EA854();
  }
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCFilenameViewController();
  id v4 = a3;
  id v5 = v9.receiver;
  [(DOCFilenameViewController *)&v9 effectiveAppearanceDidChange:v4];
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    id v6 = [v5 viewIfLoaded];
    if (v6)
    {
      id v7 = v6;
      id v8 = [v4 backgroundColor];
      [v7 setBackgroundColor:v8];

      id v4 = v7;
      id v5 = v8;
    }
  }
}

- (_TtC5Files25DOCFilenameViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Files25DOCFilenameViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCFilenameViewController_filenameView));
  swift_unknownObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files25DOCFilenameViewController_item);
}

@end