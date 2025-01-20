@interface _PKAccountDocumentsViewController
- (_PKAccountDocumentsViewController)initWithCoder:(id)a3;
- (_PKAccountDocumentsViewController)initWithConfiguration:(id)a3;
- (_PKAccountDocumentsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation _PKAccountDocumentsViewController

- (_PKAccountDocumentsViewController)initWithConfiguration:(id)a3
{
  return (_PKAccountDocumentsViewController *)AccountDocumentsViewController.init(withConfiguration:)(a3);
}

- (_PKAccountDocumentsViewController)initWithCoder:(id)a3
{
  result = (_PKAccountDocumentsViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_19F5B7158(type metadata accessor for AccountDocumentsViewController, &OBJC_IVAR____PKAccountDocumentsViewController_documentsHostingVC);
}

- (void)viewWillLayoutSubviews
{
}

- (_PKAccountDocumentsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____PKAccountDocumentsViewController_documentsHostingVC));
}

@end