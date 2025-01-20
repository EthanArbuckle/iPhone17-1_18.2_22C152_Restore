@interface CarAlternateRouteItemsContainingView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CarAlternateRouteItemsContainingView)initWithDataSource:(id)a3;
- (CarAlternateRouteItemsContainingViewDataSource)dataSource;
- (id)focusItemsInRect:(CGRect)a3;
@end

@implementation CarAlternateRouteItemsContainingView

- (CarAlternateRouteItemsContainingView)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarAlternateRouteItemsContainingView;
  v6 = -[CarAlternateRouteItemsContainingView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (id)focusItemsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)CarAlternateRouteItemsContainingView;
  v8 = -[CarAlternateRouteItemsContainingView focusItemsInRect:](&v16, "focusItemsInRect:");
  objc_super v9 = [(CarAlternateRouteItemsContainingView *)self dataSource];
  v10 = [v9 focusableRouteItems];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10045C9B0;
  v15[3] = &unk_1012EAD30;
  v15[4] = self;
  *(CGFloat *)&v15[5] = x;
  *(CGFloat *)&v15[6] = y;
  *(CGFloat *)&v15[7] = width;
  *(CGFloat *)&v15[8] = height;
  v11 = +[NSPredicate predicateWithBlock:v15];
  v12 = [v10 filteredArrayUsingPredicate:v11];
  v13 = [v8 arrayByAddingObjectsFromArray:v12];

  return v13;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (CarAlternateRouteItemsContainingViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
}

@end