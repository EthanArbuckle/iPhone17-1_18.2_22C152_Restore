@interface ComponentViewOverflowViewController
- (NSArray)keyCommands;
- (_TtC8AppStore35ComponentViewOverflowViewController)initWithCoder:(id)a3;
- (_TtC8AppStore35ComponentViewOverflowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleDismissKeyCommandWithCommand:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ComponentViewOverflowViewController

- (_TtC8AppStore35ComponentViewOverflowViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore35ComponentViewOverflowViewController_overflowTransitioning) = 0;
  id v4 = a3;

  result = (_TtC8AppStore35ComponentViewOverflowViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10030AE20();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10030B524();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v5.receiver;
  [(ComponentViewOverflowViewController *)&v5 viewWillDisappear:v3];
  [v4[OBJC_IVAR____TtC8AppStore35ComponentViewOverflowViewController_scrollView] setContentOffset:0.0 animated:0.0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10030B83C(a3);
}

- (NSArray)keyCommands
{
  v2 = self;
  unint64_t v3 = sub_1001EDBA4();

  if (v3)
  {
    sub_1001EF440();
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)handleDismissKeyCommandWithCommand:(id)a3
{
}

- (_TtC8AppStore35ComponentViewOverflowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore35ComponentViewOverflowViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)self + OBJC_IVAR____TtC8AppStore35ComponentViewOverflowViewController_model);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35ComponentViewOverflowViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35ComponentViewOverflowViewController_componentView));
  swift_release();
  unint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore35ComponentViewOverflowViewController_overflowTransitioning);
}

@end