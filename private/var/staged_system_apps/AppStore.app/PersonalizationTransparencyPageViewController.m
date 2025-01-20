@interface PersonalizationTransparencyPageViewController
- (_TtC8AppStore45PersonalizationTransparencyPageViewController)initWithCoder:(id)a3;
- (_TtC8AppStore45PersonalizationTransparencyPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation PersonalizationTransparencyPageViewController

- (_TtC8AppStore45PersonalizationTransparencyPageViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore45PersonalizationTransparencyPageViewController_overlayViewController) = 0;
  id v4 = a3;

  result = (_TtC8AppStore45PersonalizationTransparencyPageViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(PersonalizationTransparencyPageViewController *)&v3 viewDidLoad];
  dispatch thunk of BasePresenter.didLoad()();
}

- (_TtC8AppStore45PersonalizationTransparencyPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore45PersonalizationTransparencyPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore45PersonalizationTransparencyPageViewController_overlayViewController);
}

@end