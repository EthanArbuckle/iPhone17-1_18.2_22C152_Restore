@interface MUParkedCarHeaderViewModel
- (MUParkedCarHeaderViewModel)initWithParkedCar:(id)a3;
@end

@implementation MUParkedCarHeaderViewModel

- (MUParkedCarHeaderViewModel)initWithParkedCar:(id)a3
{
  id v5 = a3;
  v6 = [v5 mapItem];
  v9.receiver = self;
  v9.super_class = (Class)MUParkedCarHeaderViewModel;
  v7 = [(MUParkedCarHeaderViewModel *)&v9 initWithMapItem:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_parkedCar, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end