@interface FlowRedirectionWrapperViewController
- (CGSize)preferredContentSize;
- (_TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewDidLoad;
@end

@implementation FlowRedirectionWrapperViewController

- (_TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController)initWithCoder:(id)a3
{
  result = (_TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController *)sub_385890();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_57DC8();
}

- (CGSize)preferredContentSize
{
  [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController_child) preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
}

- (_TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController_child));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews36FlowRedirectionWrapperViewController_customNextResponder);
}

@end