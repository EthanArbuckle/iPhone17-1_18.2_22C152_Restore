@interface RefineMapItemAction
- (MKMapItem)originalMapItem;
- (RefineMapItemAction)initWithMapItem:(id)a3;
- (int)analyticsLaunchActionType;
- (void)resolveMapItemWithTraits:(id)a3 completion:(id)a4;
- (void)setOriginalMapItem:(id)a3;
@end

@implementation RefineMapItemAction

- (RefineMapItemAction)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RefineMapItemAction;
  v6 = [(RefineMapItemAction *)&v9 init];
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
  v8 = [(RefineMapItemAction *)self originalMapItem];
  objc_super v9 = +[MKMapService sharedService];
  v10 = [v9 ticketForMapItemToRefine:v8 traits:v7];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100D61408;
  v13[3] = &unk_1012E6EF8;
  id v14 = v8;
  id v15 = v6;
  id v11 = v6;
  id v12 = v8;
  [v10 submitWithHandler:v13 networkActivity:0];
}

- (int)analyticsLaunchActionType
{
  return 23;
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