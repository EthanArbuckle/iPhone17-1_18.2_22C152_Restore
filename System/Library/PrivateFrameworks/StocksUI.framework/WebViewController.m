@interface WebViewController
- (_TtC8StocksUI17WebViewController)initWithURL:(id)a3 configuration:(id)a4;
- (_TtC8StocksUI17WebViewController)initWithURL:(id)a3 entersReaderIfAvailable:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation WebViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(WebViewController *)&v4 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_traitCollection, v4.receiver, v4.super_class);
  sub_20A6C6F0C((uint64_t)v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4 = self;
  sub_20A6C7148(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4 = self;
  sub_20A6C7554(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(WebViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_20A6C6F0C((uint64_t)v6);
}

- (_TtC8StocksUI17WebViewController)initWithURL:(id)a3 configuration:(id)a4
{
  uint64_t v5 = sub_20A8C2530();
  MEMORY[0x270FA5388](v5 - 8);
  sub_20A8C24E0();
  id v6 = a4;
  result = (_TtC8StocksUI17WebViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8StocksUI17WebViewController)initWithURL:(id)a3 entersReaderIfAvailable:(BOOL)a4
{
  uint64_t v4 = sub_20A8C2530();
  MEMORY[0x270FA5388](v4 - 8);
  sub_20A8C24E0();
  result = (_TtC8StocksUI17WebViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI17WebViewController_styler);
  sub_20A49127C((uint64_t)self + OBJC_IVAR____TtC8StocksUI17WebViewController_webViewCoordinator, (unint64_t *)&qword_26763AB80, &qword_26763C420);
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC8StocksUI17WebViewController_session;

  sub_20A6C8C10((uint64_t)v3);
}

@end