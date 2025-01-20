@interface PlaceRefinementAction
- (NSString)address;
- (PlaceRefinementAction)initWithLabel:(id)a3 atCoordinate:(CLLocationCoordinate2D)a4 address:(id)a5;
- (int)analyticsLaunchActionType;
- (void)resolveMapItemWithTraits:(id)a3 completion:(id)a4;
- (void)setAddress:(id)a3;
@end

@implementation PlaceRefinementAction

- (PlaceRefinementAction)initWithLabel:(id)a3 atCoordinate:(CLLocationCoordinate2D)a4 address:(id)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PlaceRefinementAction;
  v10 = -[ReverseGeocodeAction initWithLabel:atCoordinate:](&v14, "initWithLabel:atCoordinate:", a3, latitude, longitude);
  if (v10)
  {
    v11 = (NSString *)[v9 copy];
    address = v10->_address;
    v10->_address = v11;
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
  CLLocationCoordinate2D v23 = CLLocationCoordinate2DMake(v8, v10);
  v12 = [(ReverseGeocodeAction *)self label];
  v13 = +[MKMapService sharedService];
  objc_super v14 = [(PlaceRefinementAction *)self address];
  v15 = [v13 ticketForPlaceRefinementRequestWithCoordinate:&v23 addressLine:v14 placeName:v12 traits:v7];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100BCC570;
  v18[3] = &unk_101319508;
  CLLocationDegrees v21 = v9;
  CLLocationDegrees v22 = v11;
  id v19 = v12;
  id v20 = v6;
  id v16 = v6;
  id v17 = v12;
  [v15 submitWithHandler:v18 networkActivity:0];
}

- (int)analyticsLaunchActionType
{
  return 14;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end