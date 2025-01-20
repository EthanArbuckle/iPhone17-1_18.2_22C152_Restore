@interface PresentRAPAction
- (BOOL)isCompatibleWithRestorationTask;
- (BOOL)showReports;
- (GEORPProblemStatusResponse)response;
- (GEORPRapInfo)rapInfo;
- (GEOURLLocationQueryItem)locationQueryItem;
- (MKMapItem)mapItem;
- (PresentRAPAction)initWithLocationQueryItem:(id)a3;
- (PresentRAPAction)initWithMapItem:(id)a3;
- (PresentRAPAction)initWithRapInfo:(id)a3;
- (PresentRAPAction)initWithResponse:(id)a3;
- (PresentRAPAction)initWithShowReports:(BOOL)a3;
- (int)analyticsLaunchActionType;
- (void)resolveMapItemWithTraits:(id)a3 completion:(id)a4;
- (void)setMapItem:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation PresentRAPAction

- (PresentRAPAction)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PresentRAPAction;
  v6 = [(PresentRAPAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapItem, a3);
  }

  return v7;
}

- (PresentRAPAction)initWithResponse:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PresentRAPAction;
  v6 = [(PresentRAPAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_response, a3);
  }

  return v7;
}

- (PresentRAPAction)initWithRapInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PresentRAPAction;
  v6 = [(PresentRAPAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rapInfo, a3);
  }

  return v7;
}

- (PresentRAPAction)initWithLocationQueryItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PresentRAPAction;
  v6 = [(PresentRAPAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_locationQueryItem, a3);
  }

  return v7;
}

- (PresentRAPAction)initWithShowReports:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PresentRAPAction;
  result = [(PresentRAPAction *)&v5 init];
  if (result) {
    result->_showReports = a3;
  }
  return result;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 20;
}

- (void)resolveMapItemWithTraits:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(GEOURLLocationQueryItem *)self->_locationQueryItem mapItemIdentifier];

  if (v8)
  {
    id v9 = objc_alloc((Class)MKMapItemIdentifier);
    v10 = [(GEOURLLocationQueryItem *)self->_locationQueryItem mapItemIdentifier];
    id v11 = [v9 initWithGEOMapItemIdentifier:v10];

    v12 = +[MKMapService sharedService];
    id v22 = v11;
    v13 = +[NSArray arrayWithObjects:&v22 count:1];
    v14 = [v12 ticketForIdentifiers:v13 traits:v6];

    if (!v14) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v15 = [(GEOURLLocationQueryItem *)self->_locationQueryItem address];

  if (v15)
  {
    v16 = +[MKMapService sharedService];
    v17 = [(GEOURLLocationQueryItem *)self->_locationQueryItem address];
    v14 = [v16 ticketForForwardGeocodeString:v17 traits:v6];
  }
  else
  {
    [(GEOURLLocationQueryItem *)self->_locationQueryItem coordinate];
    if (v19 < -180.0 || v19 > 180.0 || v18 < -90.0 || v18 > 90.0) {
      goto LABEL_13;
    }
    v16 = +[MKMapService sharedService];
    [(GEOURLLocationQueryItem *)self->_locationQueryItem coordinate];
    v14 = [v16 ticketForReverseGeocodeCoordinate:v6];
  }

  if (v14)
  {
LABEL_12:
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100436108;
    v20[3] = &unk_1012E6EF8;
    v20[4] = self;
    id v21 = v7;
    [v14 submitWithHandler:v20 networkActivity:0];
  }
LABEL_13:
}

- (GEORPProblemStatusResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (GEORPRapInfo)rapInfo
{
  return self->_rapInfo;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (GEOURLLocationQueryItem)locationQueryItem
{
  return self->_locationQueryItem;
}

- (BOOL)showReports
{
  return self->_showReports;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationQueryItem, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_rapInfo, 0);

  objc_storeStrong((id *)&self->_response, 0);
}

@end