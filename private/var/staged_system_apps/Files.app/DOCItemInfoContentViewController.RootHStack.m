@interface DOCItemInfoContentViewController.RootHStack
- (UIEdgeInsets)layoutMargins;
- (_TtCC5Files32DOCItemInfoContentViewControllerP33_5854F2584B6BB42CC0BFB2F44FFF0F2910RootHStack)init;
- (_TtCC5Files32DOCItemInfoContentViewControllerP33_5854F2584B6BB42CC0BFB2F44FFF0F2910RootHStack)initWithFrame:(CGRect)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
@end

@implementation DOCItemInfoContentViewController.RootHStack

- (_TtCC5Files32DOCItemInfoContentViewControllerP33_5854F2584B6BB42CC0BFB2F44FFF0F2910RootHStack)init
{
  return (_TtCC5Files32DOCItemInfoContentViewControllerP33_5854F2584B6BB42CC0BFB2F44FFF0F2910RootHStack *)sub_100275188();
}

- (UIEdgeInsets)layoutMargins
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCItemInfoContentViewController.RootHStack();
  [(DOCItemInfoContentViewController.RootHStack *)&v6 layoutMargins];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCItemInfoContentViewController.RootHStack();
  v7 = (char *)v9.receiver;
  -[DOCItemInfoContentViewController.RootHStack setLayoutMargins:](&v9, "setLayoutMargins:", top, left, bottom, right);
  v8 = *(void **)&v7[OBJC_IVAR____TtCC5Files32DOCItemInfoContentViewControllerP33_5854F2584B6BB42CC0BFB2F44FFF0F2910RootHStack_stackView];
  [v7 layoutMargins];
  UIEdgeInsets.verticalInsetsOnly.getter();
  [v8 setLayoutMargins:];
  sub_100275DA0(0);
}

- (_TtCC5Files32DOCItemInfoContentViewControllerP33_5854F2584B6BB42CC0BFB2F44FFF0F2910RootHStack)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Files32DOCItemInfoContentViewControllerP33_5854F2584B6BB42CC0BFB2F44FFF0F2910RootHStack_stackView));

  swift_bridgeObjectRelease();
}

@end