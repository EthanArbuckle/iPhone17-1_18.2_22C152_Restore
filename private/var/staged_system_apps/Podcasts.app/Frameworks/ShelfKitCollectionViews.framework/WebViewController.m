@interface WebViewController
- (_TtC23ShelfKitCollectionViews17WebViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews17WebViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WebViewController

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  v5 = self;
  id v6 = [v4 defaultCenter];
  id v7 = v6;
  if (qword_470880 != -1)
  {
    swift_once();
    id v6 = v7;
  }
  [v6 postNotificationName:qword_482570 object:0];
}

- (_TtC23ShelfKitCollectionViews17WebViewController)initWithCoder:(id)a3
{
  result = (_TtC23ShelfKitCollectionViews17WebViewController *)sub_385890();
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViews17WebViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23ShelfKitCollectionViews17WebViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end