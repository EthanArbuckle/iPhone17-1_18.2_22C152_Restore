@interface ForwardGeocodeAction
- (ForwardGeocodeAction)initWithMapItem:(id)a3;
- (MKMapItem)originalMapItem;
- (int)analyticsLaunchActionType;
- (void)resolveMapItemWithTraits:(id)a3 completion:(id)a4;
- (void)setOriginalMapItem:(id)a3;
@end

@implementation ForwardGeocodeAction

- (ForwardGeocodeAction)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ForwardGeocodeAction;
  v6 = [(ForwardGeocodeAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_originalMapItem, a3);
  }

  return v7;
}

- (void)resolveMapItemWithTraits:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ForwardGeocodeAction *)self originalMapItem];
  objc_super v9 = +[MKMapService sharedService];
  v10 = [v8 _geoAddress];
  v11 = [v10 singleLineAddress];
  v12 = [v9 ticketForForwardGeocodeString:v11 traits:v7];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100D06F0C;
  v15[3] = &unk_1012E6EF8;
  id v16 = v8;
  id v17 = v6;
  id v13 = v6;
  id v14 = v8;
  [v12 submitWithHandler:v15 networkActivity:0];
}

- (int)analyticsLaunchActionType
{
  return 9;
}

- (MKMapItem)originalMapItem
{
  return self->_originalMapItem;
}

- (void)setOriginalMapItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end