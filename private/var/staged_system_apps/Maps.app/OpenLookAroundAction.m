@interface OpenLookAroundAction
- (BOOL)isCompatibleWithRestorationTask;
- (GEOMuninViewState)muninViewState;
- (GEOURLLocationQueryItem)locationQueryItem;
- (MKMapItem)originalMapItem;
- (OpenLookAroundAction)initWithLocationQueryItem:(id)a3;
- (OpenLookAroundAction)initWithMapItem:(id)a3;
- (OpenLookAroundAction)initWithMuninViewState:(id)a3;
- (int)analyticsLaunchActionType;
- (void)resolveMapItemWithTraits:(id)a3 completion:(id)a4;
- (void)setLocationQueryItem:(id)a3;
- (void)setMuninViewState:(id)a3;
- (void)setOriginalMapItem:(id)a3;
@end

@implementation OpenLookAroundAction

- (OpenLookAroundAction)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OpenLookAroundAction;
  v6 = [(OpenLookAroundAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_originalMapItem, a3);
  }

  return v7;
}

- (OpenLookAroundAction)initWithMuninViewState:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OpenLookAroundAction;
  v6 = [(OpenLookAroundAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_muninViewState, a3);
  }

  return v7;
}

- (OpenLookAroundAction)initWithLocationQueryItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OpenLookAroundAction;
  v6 = [(OpenLookAroundAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_locationQueryItem, a3);
  }

  return v7;
}

- (void)resolveMapItemWithTraits:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = [(OpenLookAroundAction *)self originalMapItem];

  if (v8)
  {
    id v9 = [(OpenLookAroundAction *)self originalMapItem];
    v10 = +[MKMapService sharedService];
    v11 = [v10 ticketForMapItemToRefine:v9 traits:v6];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
    v12 = [(GEOURLLocationQueryItem *)self->_locationQueryItem mapItemIdentifier];

    if (v12)
    {
      id v13 = objc_alloc((Class)MKMapItemIdentifier);
      v14 = [(GEOURLLocationQueryItem *)self->_locationQueryItem mapItemIdentifier];
      id v15 = [v13 initWithGEOMapItemIdentifier:v14];

      v16 = +[MKMapService sharedService];
      id v25 = v15;
      v17 = +[NSArray arrayWithObjects:&v25 count:1];
      v11 = [v16 ticketForIdentifiers:v17 traits:v6];
    }
    else
    {
      id v9 = [(GEOURLLocationQueryItem *)self->_locationQueryItem address];

      if (!v9)
      {
        [(GEOURLLocationQueryItem *)self->_locationQueryItem coordinate];
        if (v19 >= -180.0 && v19 <= 180.0 && v18 >= -90.0 && v18 <= 90.0)
        {
          id v20 = objc_alloc((Class)MKPlacemark);
          [(GEOURLLocationQueryItem *)self->_locationQueryItem coordinate];
          id v21 = [v20 initWithCoordinate:];
          id v9 = [objc_alloc((Class)MKMapItem) initWithPlacemark:v21];
        }
        goto LABEL_15;
      }
      id v15 = +[MKMapService sharedService];
      v16 = [(GEOURLLocationQueryItem *)self->_locationQueryItem address];
      v11 = [v15 ticketForForwardGeocodeString:v16 traits:v6];
    }

    id v9 = 0;
    if (!v11)
    {
LABEL_15:
      v7[2](v7, v9);
      goto LABEL_16;
    }
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10039EA08;
  v22[3] = &unk_1012E6EF8;
  id v9 = v9;
  id v23 = v9;
  v24 = v7;
  [v11 submitWithHandler:v22 networkActivity:0];

LABEL_16:
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 13;
}

- (MKMapItem)originalMapItem
{
  return self->_originalMapItem;
}

- (void)setOriginalMapItem:(id)a3
{
}

- (GEOMuninViewState)muninViewState
{
  return self->_muninViewState;
}

- (void)setMuninViewState:(id)a3
{
}

- (GEOURLLocationQueryItem)locationQueryItem
{
  return self->_locationQueryItem;
}

- (void)setLocationQueryItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationQueryItem, 0);
  objc_storeStrong((id *)&self->_muninViewState, 0);

  objc_storeStrong((id *)&self->_originalMapItem, 0);
}

@end