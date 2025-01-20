@interface RidesharingPOIAnnotation
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)showsBalloonCallout;
- (RidesharingPOIAnnotation)initWithMapItem:(id)a3;
- (id)feature;
@end

@implementation RidesharingPOIAnnotation

- (RidesharingPOIAnnotation)initWithMapItem:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RidesharingPOIAnnotation;
  v5 = [(RidesharingPOIAnnotation *)&v18 init];
  if (v5)
  {
    [v4 _coordinate];
    double v7 = v6;
    [v4 _coordinate];
    double v9 = v8;
    id v10 = [objc_alloc((Class)VKCustomFeature) initWithCoordinate:v7, v8];
    v11 = [v4 _geoMapItem];
    unsigned __int8 v12 = [v11 _hasMUID];

    if (v12) {
      [v4 _styleAttributes];
    }
    else {
    v13 = +[GEOFeatureStyleAttributes markerStyleAttributes];
    }
    id v14 = [v13 copy];

    long long v19 = xmmword_100F73750;
    [v14 replaceAttributes:&v19 count:2];
    [v10 setStyleAttributes:v14];
    v15 = [v4 name];
    [v10 setText:v15 locale:0];

    feature = v5->_feature;
    v5->_feature = (VKCustomFeature *)v10;

    v5->_coordinate.latitude = v7;
    v5->_coordinate.longitude = v9;
  }
  return v5;
}

- (id)feature
{
  return self->_feature;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (void).cxx_destruct
{
}

@end