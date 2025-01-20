@interface UserInterfaceStyleObserverView
- (_TtC7MeasureP33_EDD96BC629EA7EBD01211224C3FF48E430UserInterfaceStyleObserverView)initWithCoder:(id)a3;
- (_TtC7MeasureP33_EDD96BC629EA7EBD01211224C3FF48E430UserInterfaceStyleObserverView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UserInterfaceStyleObserverView

- (_TtC7MeasureP33_EDD96BC629EA7EBD01211224C3FF48E430UserInterfaceStyleObserverView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v7 = -[UserInterfaceStyleObserverView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  [(UserInterfaceStyleObserverView *)v7 setAutoresizingMask:0];
  [(UserInterfaceStyleObserverView *)v7 setUserInteractionEnabled:0];

  return v7;
}

- (_TtC7MeasureP33_EDD96BC629EA7EBD01211224C3FF48E430UserInterfaceStyleObserverView)initWithCoder:(id)a3
{
  result = (_TtC7MeasureP33_EDD96BC629EA7EBD01211224C3FF48E430UserInterfaceStyleObserverView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [(UserInterfaceStyleObserverView *)v5 traitCollection];
  sub_100204B34(v6);
}

- (void)didMoveToSuperview
{
  v2 = self;
  id v3 = [(UserInterfaceStyleObserverView *)v2 traitCollection];
  sub_100204B34(v3);
}

@end