@interface HOHomeDevicesHeaderItem
- (HMHome)home;
- (HMRoom)room;
- (HOHomeDevicesHeaderItem)init;
- (HOHomeDevicesHeaderItem)initWithHome:(id)a3 room:(id)a4;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HOHomeDevicesHeaderItem

- (HOHomeDevicesHeaderItem)initWithHome:(id)a3 room:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HOHomeDevicesHeaderItem;
  v9 = [(HOHomeDevicesHeaderItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_room, a4);
  }

  return v10;
}

- (HOHomeDevicesHeaderItem)init
{
  v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HOHomeDevicesHeaderItem.m" lineNumber:29 description:@"Use -initWithHome:room:"];

  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = objc_alloc_init((Class)NAFuture);
  id v5 = objc_alloc((Class)HFServiceItemProvider);
  v6 = [(HOHomeDevicesHeaderItem *)self home];
  id v7 = [v5 initWithHome:v6 serviceTypes:0];

  id v8 = [(HOHomeDevicesHeaderItem *)self room];

  if (v8)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100028048;
    v21[3] = &unk_1000C29F8;
    v21[4] = self;
    [v7 setFilter:v21];
  }
  v9 = [v7 reloadItems];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002814C;
  v19[3] = &unk_1000C1F30;
  id v10 = v4;
  id v20 = v10;
  id v11 = [v9 addFailureBlock:v19];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100028158;
  v17[3] = &unk_1000C2A20;
  v17[4] = self;
  id v12 = v10;
  id v18 = v12;
  id v13 = [v9 addSuccessBlock:v17];
  v14 = v18;
  id v15 = v12;

  return v15;
}

- (HMHome)home
{
  return self->_home;
}

- (HMRoom)room
{
  return self->_room;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_room, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end