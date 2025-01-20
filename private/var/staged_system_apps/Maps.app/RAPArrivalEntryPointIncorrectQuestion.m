@interface RAPArrivalEntryPointIncorrectQuestion
- ($C79183323B9A0D5602617FF3BE5395AC)visibleMapRect;
- (BOOL)_isRecursivelyComplete;
- (BOOL)isComplete;
- (BOOL)showPin;
- (CLLocationCoordinate2D)coordinate;
- (CLLocationCoordinate2D)originalCoordinate;
- (CLLocationCoordinate2D)selectedCoordinate;
- (NSString)localizedCoordinatePickingPrompt;
- (NSString)localizedTitle;
- (RAPArrivalEntryPointIncorrectQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 arrivalPoint:(CLLocationCoordinate2D)a5;
- (RAPCommentQuestion)commentQuestion;
- (int)analyticTarget;
- (int)userAction;
- (int64_t)questionCategory;
- (unint64_t)coordinatePickingMapType;
- (unint64_t)mapType;
- (unint64_t)maptype;
- (void)_fillSubmissionParameters:(id)a3;
- (void)setSelectedCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation RAPArrivalEntryPointIncorrectQuestion

- (RAPArrivalEntryPointIncorrectQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 arrivalPoint:(CLLocationCoordinate2D)a5
{
  CLLocationDegrees longitude = a5.longitude;
  CLLocationDegrees latitude = a5.latitude;
  v8.receiver = self;
  v8.super_class = (Class)RAPArrivalEntryPointIncorrectQuestion;
  result = [(RAPQuestion *)&v8 initWithReport:a3 parentQuestion:a4];
  if (result)
  {
    result->_originalCoordinate.CLLocationDegrees latitude = latitude;
    result->_originalCoordinate.CLLocationDegrees longitude = longitude;
    result->_selectedCoordinate = result->_originalCoordinate;
    result->_mapType = 0;
    result->_showPin = 1;
  }
  return result;
}

- (int)analyticTarget
{
  return 1105;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (BOOL)showPin
{
  return self->_showPin;
}

- ($C79183323B9A0D5602617FF3BE5395AC)visibleMapRect
{
  MKCoordinateRegionMakeWithDistance(self->_selectedCoordinate, 50.0, 50.0);

  MKMapRectForCoordinateRegion();
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_selectedCoordinate.latitude;
  double longitude = self->_selectedCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (unint64_t)coordinatePickingMapType
{
  return self->_mapType;
}

- (void)setSelectedCoordinate:(CLLocationCoordinate2D)a3
{
  if (vabdd_f64(a3.latitude, self->_selectedCoordinate.latitude) >= 0.00000000999999994
    || vabdd_f64(a3.longitude, self->_selectedCoordinate.longitude) >= 0.00000000999999994)
  {
    self->_selectedCoordinate = a3;
    [(RAPQuestion *)self _didChange];
  }
}

- (BOOL)isComplete
{
  CLLocationDegrees latitude = self->_selectedCoordinate.latitude;
  double longitude = self->_selectedCoordinate.longitude;
  BOOL v4 = vabdd_f64(latitude, self->_originalCoordinate.latitude) >= 0.00000000999999994;
  char v5 = vabdd_f64(longitude, self->_originalCoordinate.longitude) >= 0.00000000999999994 || v4;
  return CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&latitude) & v5;
}

- (NSString)localizedTitle
{
  double v2 = +[NSBundle mainBundle];
  double v3 = [v2 localizedStringForKey:@"Arrival Entrance [Report a Problem category]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (NSString)localizedCoordinatePickingPrompt
{
  double v2 = +[NSBundle mainBundle];
  double v3 = [v2 localizedStringForKey:@"Pan the map to position the entrance [Report a Problem]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (RAPCommentQuestion)commentQuestion
{
  commentQuestion = self->_commentQuestion;
  if (!commentQuestion)
  {
    BOOL v4 = [RAPCommentQuestion alloc];
    char v5 = [(RAPQuestion *)self report];
    v6 = +[RAPCommentQuestion _localizedMoreInformationTitle];
    v7 = +[NSBundle mainBundle];
    objc_super v8 = [v7 localizedStringForKey:@"Add more details about the incorrect arrival entrance" value:@"localized string not found" table:0];
    v9 = [(RAPCommentQuestion *)v4 initWithReport:v5 parentQuestion:self title:v6 placeholderText:v8 emphasis:2];
    v10 = self->_commentQuestion;
    self->_commentQuestion = v9;

    commentQuestion = self->_commentQuestion;
  }

  return commentQuestion;
}

- (BOOL)_isRecursivelyComplete
{
  BOOL v3 = [(RAPQuestion *)self->_commentQuestion _isRecursivelyComplete];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)RAPArrivalEntryPointIncorrectQuestion;
    LOBYTE(v3) = [(RAPQuestion *)&v5 _isRecursivelyComplete];
  }
  return v3;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v23 = a3;
  [v23 setType:8];
  BOOL v4 = [v23 commonContext];

  if (!v4)
  {
    id v5 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    [v23 setCommonContext:v5];
  }
  v6 = [v23 commonContext];
  [v6 addUserPath:46];

  v7 = [(RAPArrivalEntryPointIncorrectQuestion *)self commentQuestion];
  [v7 _fillSubmissionParameters:v23];

  p_selectedCoordinate = &self->_selectedCoordinate;
  if (CLLocationCoordinate2DIsValid(self->_selectedCoordinate))
  {
    p_originalCoordinate = &self->_originalCoordinate;
    if (vabdd_f64(self->_originalCoordinate.latitude, p_selectedCoordinate->latitude) >= 0.00000000999999994
      || vabdd_f64(self->_originalCoordinate.longitude, self->_selectedCoordinate.longitude) >= 0.00000000999999994)
    {
      v10 = [v23 details];

      if (!v10)
      {
        id v11 = objc_alloc_init((Class)GEORPFeedbackDetails);
        [v23 setDetails:v11];
      }
      v12 = [v23 details];
      id v13 = [v12 directionsFeedback];

      if (!v13)
      {
        id v13 = objc_alloc_init((Class)GEORPDirectionsFeedback);
        v14 = [v23 details];
        [v14 setDirectionsFeedback:v13];
      }
      [v13 setCorrectionType:2];
      v15 = [v23 details];
      v16 = [v15 directionsFeedback];
      id v17 = [v16 directionsCorrections];

      if (!v17)
      {
        id v17 = objc_alloc_init((Class)GEORPDirectionsCorrections);
        v18 = [v23 details];
        v19 = [v18 directionsFeedback];
        [v19 setDirectionsCorrections:v17];
      }
      id v20 = objc_alloc_init((Class)GEORPCorrectedCoordinate);
      id v21 = [objc_alloc((Class)GEOLatLng) initWithLatitude:p_selectedCoordinate->latitude longitude:p_selectedCoordinate->longitude];
      [v20 setCorrectedCoordinate:v21];

      id v22 = [objc_alloc((Class)GEOLatLng) initWithLatitude:p_originalCoordinate->latitude longitude:p_originalCoordinate->longitude];
      [v20 setOriginalCoordinate:v22];

      [v17 setArrivalCoordinate:v20];
    }
  }
}

- (int64_t)questionCategory
{
  return 4;
}

- (int)userAction
{
  return 10103;
}

- (CLLocationCoordinate2D)originalCoordinate
{
  double latitude = self->_originalCoordinate.latitude;
  double longitude = self->_originalCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (CLLocationCoordinate2D)selectedCoordinate
{
  double latitude = self->_selectedCoordinate.latitude;
  double longitude = self->_selectedCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (unint64_t)maptype
{
  return self->_maptype;
}

- (void).cxx_destruct
{
}

@end