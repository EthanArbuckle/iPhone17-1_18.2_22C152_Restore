@interface ContextMenuPreviewViewController
- (_TtC23ShelfKitCollectionViews32ContextMenuPreviewViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews32ContextMenuPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ContextMenuPreviewViewController

- (_TtC23ShelfKitCollectionViews32ContextMenuPreviewViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_11387C();
}

- (void)loadView
{
  v2 = self;
  sub_112054();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1126C4();
}

- (_TtC23ShelfKitCollectionViews32ContextMenuPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23ShelfKitCollectionViews32ContextMenuPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews32ContextMenuPreviewViewController_lockupView);
}

@end