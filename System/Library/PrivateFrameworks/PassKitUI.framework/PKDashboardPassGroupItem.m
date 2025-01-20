@interface PKDashboardPassGroupItem
+ (id)identifier;
- (PKDashboardPassGroupItem)initWithGroupView:(id)a3;
- (PKPassGroupView)groupView;
@end

@implementation PKDashboardPassGroupItem

- (PKDashboardPassGroupItem)initWithGroupView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDashboardPassGroupItem;
  v6 = [(PKDashboardPassGroupItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_groupView, a3);
  }

  return v7;
}

+ (id)identifier
{
  return @"pass";
}

- (PKPassGroupView)groupView
{
  return self->_groupView;
}

- (void).cxx_destruct
{
}

@end