@interface RAPIncidentsQuestion
- ($C79183323B9A0D5602617FF3BE5395AC)_initialCoordinatePickingMapRect;
- ($C79183323B9A0D5602617FF3BE5395AC)coordinatePickingMapRect;
- (BOOL)isComplete;
- (CLLocationCoordinate2D)originalCoordinate;
- (CLLocationCoordinate2D)selectedCoordinate;
- (NSString)eventValue;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (RAPCommentQuestion)commentQuestion;
- (RAPIncidentsQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 incidentLayoutItem:(id)a5;
- (TrafficIncidentLayoutItem)incidentLayoutItem;
- (UIImage)image;
- (int)analyticTarget;
- (int)userAction;
- (int64_t)questionCategory;
- (void)_fillSubmissionParameters:(id)a3;
- (void)setOriginalCoordinate:(CLLocationCoordinate2D)a3;
- (void)setSelectedCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation RAPIncidentsQuestion

- (RAPIncidentsQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 incidentLayoutItem:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RAPIncidentsQuestion;
  v10 = [(RAPQuestion *)&v17 initWithReport:v8 parentQuestion:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_incidentLayoutItem, a5);
    v12 = [v8 _context];
    v13 = [v12 mapCamera];
    [v13 centerCoordinate];
    v11->_selectedCoordinate.latitude = v14;
    v11->_selectedCoordinate.longitude = v15;

    v11->_originalCoordinate = CLLocationCoordinate2DMake(v11->_selectedCoordinate.latitude, v11->_selectedCoordinate.longitude);
  }

  return v11;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  v6 = [v4 commonContext];
  [v6 setClientCreatedAt:Current];

  id v7 = objc_alloc_init((Class)GEORPFeedbackDetails);
  [v4 setDetails:v7];

  id v8 = objc_alloc_init((Class)GEORPIncidentFeedback);
  id v9 = [v4 details];
  [v9 setIncidentFeedback:v8];

  id v16 = objc_alloc_init((Class)GEORPNewIncidentDetails);
  id v10 = objc_alloc_init((Class)GEORPIncidentLocation);
  [v16 setIncidentLocation:v10];

  id v11 = [objc_alloc((Class)GEOLatLng) initWithLatitude:self->_selectedCoordinate.latitude longitude:self->_selectedCoordinate.longitude];
  v12 = [v16 incidentLocation];
  [v12 setLatLng:v11];

  [v16 setType:[self->_incidentLayoutItem incidentType]];
  v13 = [v4 details];
  CLLocationDegrees v14 = [v13 incidentFeedback];
  [v14 setNewIncidentDetails:v16];

  CLLocationDegrees v15 = [(RAPIncidentsQuestion *)self commentQuestion];
  [v15 _fillSubmissionParameters:v4];
}

- (int64_t)questionCategory
{
  return 19;
}

- (int)userAction
{
  return 115;
}

- (UIImage)image
{
  return (UIImage *)[(TrafficIncidentLayoutItem *)self->_incidentLayoutItem displayImage];
}

- (NSString)localizedTitle
{
  return (NSString *)[(TrafficIncidentLayoutItem *)self->_incidentLayoutItem displayText];
}

- (NSString)localizedDescription
{
  return (NSString *)[(TrafficIncidentLayoutItem *)self->_incidentLayoutItem descriptionText];
}

- ($C79183323B9A0D5602617FF3BE5395AC)coordinatePickingMapRect
{
  [(RAPIncidentsQuestion *)self selectedCoordinate];
  if (v4 < -180.0 || v4 > 180.0 || v3 < -90.0 || v3 > 90.0)
  {
    [(RAPIncidentsQuestion *)self _initialCoordinatePickingMapRect];
  }
  else
  {
    [(RAPIncidentsQuestion *)self selectedCoordinate];
    MKCoordinateRegionMakeWithDistance(v9, 200.0, 200.0);
    MKMapRectForCoordinateRegion();
  }
  result.var1.var1 = v8;
  result.var1.var0 = v7;
  result.var0.var1 = v6;
  result.var0.var0 = v5;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)_initialCoordinatePickingMapRect
{
  v2 = [(RAPQuestion *)self _context];
  double v3 = sub_1005817B0(v2);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.var1.var1 = v13;
  result.var1.var0 = v12;
  result.var0.var1 = v11;
  result.var0.var0 = v10;
  return result;
}

- (RAPCommentQuestion)commentQuestion
{
  commentQuestion = self->_commentQuestion;
  if (!commentQuestion)
  {
    double v4 = [RAPCommentQuestion alloc];
    double v5 = [(RAPQuestion *)self report];
    double v6 = +[RAPCommentQuestion _localizedOptionalInformationTitle];
    double v7 = +[NSBundle mainBundle];
    double v8 = [v7 localizedStringForKey:@"Add more information about the Incident" value:@"localized string not found" table:0];
    double v9 = [(RAPCommentQuestion *)v4 initWithReport:v5 parentQuestion:self title:v6 placeholderText:v8 emphasis:5];
    double v10 = self->_commentQuestion;
    self->_commentQuestion = v9;

    commentQuestion = self->_commentQuestion;
  }

  return commentQuestion;
}

- (BOOL)isComplete
{
  v2 = [(RAPIncidentsQuestion *)self commentQuestion];
  unsigned __int8 v3 = [v2 isComplete];

  return v3;
}

- (void)setSelectedCoordinate:(CLLocationCoordinate2D)a3
{
  self->_selectedCoordinate = a3;
}

- (int)analyticTarget
{
  return 741;
}

- (NSString)eventValue
{
  return (NSString *)[(TrafficIncidentLayoutItem *)self->_incidentLayoutItem incidentTypeAsString];
}

- (TrafficIncidentLayoutItem)incidentLayoutItem
{
  return self->_incidentLayoutItem;
}

- (CLLocationCoordinate2D)selectedCoordinate
{
  double latitude = self->_selectedCoordinate.latitude;
  double longitude = self->_selectedCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (CLLocationCoordinate2D)originalCoordinate
{
  double latitude = self->_originalCoordinate.latitude;
  double longitude = self->_originalCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setOriginalCoordinate:(CLLocationCoordinate2D)a3
{
  self->_originalCoordinate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentLayoutItem, 0);

  objc_storeStrong((id *)&self->_commentQuestion, 0);
}

@end