@interface UpsellGridViewController
- (_TtC8AppStore24UpsellGridViewController)initWithCoder:(id)a3;
- (_TtC8AppStore24UpsellGridViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation UpsellGridViewController

- (_TtC8AppStore24UpsellGridViewController)initWithCoder:(id)a3
{
  result = (_TtC8AppStore24UpsellGridViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  if (([(UpsellGridViewController *)v2 isViewLoaded] & 1) == 0) {
    [(UpsellGridViewController *)v2 setView:*(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC8AppStore24UpsellGridViewController_gridView)];
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(UpsellGridViewController *)&v5 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    [v3 setLayoutMargins:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];

    dispatch thunk of BasePresenter.didLoad()();
  }
  else
  {
    __break(1u);
  }
}

- (_TtC8AppStore24UpsellGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore24UpsellGridViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24UpsellGridViewController_gridView));
  swift_release();

  swift_release();
}

@end