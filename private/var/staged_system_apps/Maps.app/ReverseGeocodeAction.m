@interface ReverseGeocodeAction
- (BOOL)isCompatibleWithRestorationTask;
- (CLLocationCoordinate2D)coordinate;
- (NSString)label;
- (ReverseGeocodeAction)initWithLabel:(id)a3 atCoordinate:(CLLocationCoordinate2D)a4;
- (int)analyticsLaunchActionType;
- (void)resolveMapItemWithTraits:(id)a3 completion:(id)a4;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setLabel:(id)a3;
@end

@implementation ReverseGeocodeAction

- (ReverseGeocodeAction)initWithLabel:(id)a3 atCoordinate:(CLLocationCoordinate2D)a4
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ReverseGeocodeAction;
  v9 = [(ReverseGeocodeAction *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    v10->_coordinate.CLLocationDegrees latitude = latitude;
    v10->_coordinate.CLLocationDegrees longitude = longitude;
  }

  return v10;
}

- (void)resolveMapItemWithTraits:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ReverseGeocodeAction *)self coordinate];
  CLLocationDegrees v9 = v8;
  CLLocationDegrees v11 = v10;
  objc_super v12 = [(ReverseGeocodeAction *)self label];
  v13 = +[MKMapService sharedService];
  CLLocationCoordinate2D v14 = CLLocationCoordinate2DMake(v9, v11);
  v15 = [v13 ticketForReverseGeocodeCoordinate:v7 latitude:v14.latitude longitude:v14.longitude];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100B651B0;
  v18[3] = &unk_101319508;
  CLLocationDegrees v21 = v9;
  CLLocationDegrees v22 = v11;
  id v19 = v12;
  id v20 = v6;
  id v16 = v6;
  id v17 = v12;
  [v15 submitWithHandler:v18 networkActivity:0];
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 27;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end