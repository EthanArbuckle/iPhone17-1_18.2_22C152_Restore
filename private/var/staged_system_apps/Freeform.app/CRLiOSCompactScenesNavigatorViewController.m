@interface CRLiOSCompactScenesNavigatorViewController
+ (BOOL)scenesNavigatorHasFixedPositionWith:(id)a3;
- (_TtC8Freeform42CRLiOSCompactScenesNavigatorViewController)initWithCoder:(id)a3;
- (_TtC8Freeform42CRLiOSCompactScenesNavigatorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismiss;
- (void)selectionPathDidChangeWithNotification:(id)a3;
- (void)teardown;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CRLiOSCompactScenesNavigatorViewController

- (_TtC8Freeform42CRLiOSCompactScenesNavigatorViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8Freeform42CRLiOSCompactScenesNavigatorViewController_contentViewSize);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC8Freeform42CRLiOSCompactScenesNavigatorViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)teardown
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1008DB4B8();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLiOSCompactScenesNavigatorViewController();
  id v2 = v3.receiver;
  [(CRLiOSCompactScenesNavigatorViewController *)&v3 viewDidLayoutSubviews];
  sub_1008DBE08();
}

+ (BOOL)scenesNavigatorHasFixedPositionWith:(id)a3
{
  v4 = self;
  id v5 = a3;
  if (objc_msgSend(v4, "crl_phoneUI")) {
    unsigned __int8 v6 = 1;
  }
  else {
    unsigned __int8 v6 = [v5 crl_isCompactWidth];
  }

  return v6;
}

- (void)dismiss
{
  v4 = self;
  id v2 = [(CRLiOSCompactScenesNavigatorViewController *)v4 view];
  if (v2)
  {
    objc_super v3 = v2;
    [v2 removeFromSuperview];

    [(CRLiOSCompactScenesNavigatorViewController *)v4 removeFromParentViewController];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC8Freeform42CRLiOSCompactScenesNavigatorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Freeform42CRLiOSCompactScenesNavigatorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform42CRLiOSCompactScenesNavigatorViewController_hostingController));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform42CRLiOSCompactScenesNavigatorViewController_editorController);
}

- (void)selectionPathDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1008DC214(v4);
}

@end