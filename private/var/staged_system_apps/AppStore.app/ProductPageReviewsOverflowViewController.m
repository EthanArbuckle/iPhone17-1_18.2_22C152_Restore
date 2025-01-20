@interface ProductPageReviewsOverflowViewController
- (NSArray)keyCommands;
- (_TtC8AppStore40ProductPageReviewsOverflowViewController)initWithCoder:(id)a3;
- (_TtC8AppStore40ProductPageReviewsOverflowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleDismissKeyCommandWithCommand:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ProductPageReviewsOverflowViewController

- (_TtC8AppStore40ProductPageReviewsOverflowViewController)initWithCoder:(id)a3
{
  result = (_TtC8AppStore40ProductPageReviewsOverflowViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001F9CD4();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1001FA0F8();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  [(ProductPageReviewsOverflowViewController *)&v5 viewWillDisappear:v3];
  [*(id *)&v4[OBJC_IVAR____TtC8AppStore40ProductPageReviewsOverflowViewController_scrollView] setContentOffset:0 animated:0.0 v5.receiver, v5.super_class];
}

- (NSArray)keyCommands
{
  v2 = self;
  unint64_t v3 = sub_1001E27BC();

  if (v3)
  {
    sub_100084CF0(0, (unint64_t *)&qword_100989350);
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

- (_TtC8AppStore40ProductPageReviewsOverflowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore40ProductPageReviewsOverflowViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  unint64_t v3 = (char *)self + OBJC_IVAR____TtC8AppStore40ProductPageReviewsOverflowViewController_itemLayoutContext;
  uint64_t v4 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40ProductPageReviewsOverflowViewController_scrollView));
  objc_super v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore40ProductPageReviewsOverflowViewController_componentView);
}

@end