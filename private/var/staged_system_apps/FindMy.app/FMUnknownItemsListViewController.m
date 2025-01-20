@interface FMUnknownItemsListViewController
- (_TtC6FindMy32FMUnknownItemsListViewController)initWithCoder:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FMUnknownItemsListViewController

- (_TtC6FindMy32FMUnknownItemsListViewController)initWithCoder:(id)a3
{
  *(void *)&self->super.mediator[OBJC_IVAR____TtC6FindMy32FMUnknownItemsListViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC6FindMy32FMUnknownItemsListViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for FMUnknownItemsListViewController();
  [(FMBaseContentViewController *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1004F237C(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1004F2570(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMUnknownItemsListViewController();
  id v4 = v5.receiver;
  [(FMUnknownItemsListViewController *)&v5 viewDidDisappear:v3];
  sub_10023A84C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMUnknownItemsListViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMUnknownItemsListViewController_dataSource));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC6FindMy32FMUnknownItemsListViewController_delegate;

  sub_100068760((uint64_t)v3);
}

@end