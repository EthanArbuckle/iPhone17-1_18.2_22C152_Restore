@interface RAPPersonalPlaceCorrectionsQuestion
- (BOOL)isAdjustedCoordinateBeyondThreshold;
- (BOOL)isComplete;
- (CLLocationCoordinate2D)correctedCoordinate;
- (CLLocationCoordinate2D)currentCoordinate;
- (CLLocationCoordinate2D)originalCoordinate;
- (MapsSuggestionsShortcut)shortcut;
- (NSString)localizedTitle;
- (RAPCommentQuestion)commentQuestion;
- (RAPPersonalPlaceCorrectionsQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 shortcut:(id)a5;
- (id)_geoCoordinateFromUserCorrections;
- (int)userAction;
- (int64_t)questionCategory;
- (int64_t)shortcutType;
- (void)_fillSubmissionParameters:(id)a3;
- (void)addUserPathItem:(int)a3;
- (void)rapCompleted:(BOOL)a3 privacyShown:(BOOL)a4 analyticsEvent:(id)a5;
- (void)setCorrectedCoordinate:(CLLocationCoordinate2D)a3;
- (void)setShortcutType:(int64_t)a3;
- (void)submitRAPWithWillSubmitBlock:(id)a3 didSubmitBlock:(id)a4;
@end

@implementation RAPPersonalPlaceCorrectionsQuestion

- (RAPPersonalPlaceCorrectionsQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 shortcut:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)RAPPersonalPlaceCorrectionsQuestion;
  v11 = [(RAPQuestion *)&v29 initWithReport:v8 parentQuestion:v9];
  v12 = v11;
  if (v11)
  {
    p_shortcut = (id *)&v11->_shortcut;
    objc_storeStrong((id *)&v11->_shortcut, a5);
    p_latitude = &v12->_correctedCoordinate.latitude;
    if (*p_shortcut)
    {
      v15 = [*p_shortcut geoMapItem];
      [v15 coordinate];
      CLLocationDegrees v17 = v16;
      v18 = [*p_shortcut geoMapItem];
      [v18 coordinate];
      CLLocationCoordinate2D v20 = CLLocationCoordinate2DMake(v17, v19);
      CLLocationDegrees *p_latitude = v20.latitude;
      v12->_correctedCoordinate.longitude = v20.longitude;

      v12->_originalCoordinate = CLLocationCoordinate2DMake(v12->_correctedCoordinate.latitude, v12->_correctedCoordinate.longitude);
    }
    else
    {
      CLLocationCoordinate2D v21 = *(CLLocationCoordinate2D *)MKCoordinateInvalid;
      *(_OWORD *)p_latitude = *(_OWORD *)MKCoordinateInvalid;
      v12->_originalCoordinate = v21;
    }
    v22 = [[RAPCommentQuestion alloc] initWithReport:v8 parentQuestion:v9];
    commentQuestion = v12->_commentQuestion;
    v12->_commentQuestion = v22;

    [(RAPCommentQuestion *)v12->_commentQuestion setEmphasis:5];
    v24 = v12->_commentQuestion;
    v25 = +[RAPCommentQuestion _localizedOptionalInformationTitle];
    v26 = +[NSBundle mainBundle];
    v27 = [v26 localizedStringForKey:@"[RAP] Tell us more about this correction" value:@"localized string not found" table:0];
    [(RAPCommentQuestion *)v24 _setCommentsTitle:v25 placeholderText:v27];
  }
  return v12;
}

- (CLLocationCoordinate2D)currentCoordinate
{
  p_correctedCoordinate = &self->_correctedCoordinate;
  if (CLLocationCoordinate2DIsValid(self->_correctedCoordinate))
  {
    double latitude = p_correctedCoordinate->latitude;
    double longitude = p_correctedCoordinate->longitude;
  }
  else
  {
    [(RAPPersonalPlaceCorrectionsQuestion *)self originalCoordinate];
  }
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4 = a3;
  v5 = [v4 commonContext];

  if (!v5)
  {
    id v6 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    [v4 setCommonContext:v6];
  }
  v7 = [(RAPQuestion *)self parentQuestion];

  if (v7)
  {
    id v8 = [v4 commonContext];
    [v8 addUserPath:48];
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v9 = self->_userPaths;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v49;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v49 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)v13) integerValue:(void)v48];
        v15 = [v4 commonContext];
        [v15 addUserPath:v14];

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v11);
  }

  [(NSMutableArray *)self->_userPaths removeAllObjects];
  [v4 setType:4];
  double v16 = [v4 details];

  if (!v16)
  {
    id v17 = objc_alloc_init((Class)GEORPFeedbackDetails);
    [v4 setDetails:v17];
  }
  v18 = [v4 details:v48];
  CLLocationDegrees v19 = [v18 addressPointFeedback];

  if (!v19)
  {
    id v20 = objc_alloc_init((Class)GEORPAddressFeedback);
    CLLocationCoordinate2D v21 = [v4 details];
    [v21 setAddressPointFeedback:v20];
  }
  v22 = [(MapsSuggestionsShortcut *)self->_shortcut geoMapItem];
  v23 = [v22 _placeData];
  v24 = [v4 details];
  v25 = [v24 addressPointFeedback];
  [v25 setPlace:v23];

  v26 = [v4 details];
  v27 = [v26 addressPointFeedback];
  [v27 setType:2];

  v28 = [v4 details];
  objc_super v29 = [v28 addressPointFeedback];
  id v30 = [v29 personalizedMaps];

  if (!v30)
  {
    id v30 = objc_alloc_init((Class)GEORPPersonalizedMapsContext);
    v31 = [v4 details];
    v32 = [v31 addressPointFeedback];
    [v32 setPersonalizedMaps:v30];
  }
  [v30 setAddressType:9];
  unint64_t v33 = (unint64_t)[(MapsSuggestionsShortcut *)self->_shortcut type];
  if (v33 > 6) {
    uint64_t v34 = 0;
  }
  else {
    uint64_t v34 = dword_100F73C80[v33];
  }
  [v30 setPlaceType:v34];
  v35 = [v4 details];
  v36 = [v35 addressPointFeedback];
  id v37 = [v36 address];

  if (!v37)
  {
    id v37 = objc_alloc_init((Class)GEORPAddressCorrections);
    v38 = [v4 details];
    v39 = [v38 addressPointFeedback];
    [v39 setAddress:v37];
  }
  v40 = [v37 addressFields];

  if (!v40)
  {
    id v41 = objc_alloc_init((Class)GEORPFeedbackAddressFields);
    [v37 setAddressFields:v41];
  }
  v42 = [(RAPPersonalPlaceCorrectionsQuestion *)self _geoCoordinateFromUserCorrections];
  [v37 setCoordinate:v42];

  v43 = [v4 details];
  v44 = [v43 addressPointFeedback];
  [v44 setAddress:v37];

  v45 = [v4 commonContext];
  v46 = [v45 searchCommon];

  if (!v46)
  {
    v46 = objc_opt_new();
    v47 = [v4 commonContext];
    [v47 setSearchCommon:v46];
  }
  [(RAPCommentQuestion *)self->_commentQuestion _fillSubmissionParameters:v4];
}

- (id)_geoCoordinateFromUserCorrections
{
  id v3 = objc_alloc_init((Class)GEORPCorrectedCoordinate);
  [(RAPPersonalPlaceCorrectionsQuestion *)self originalCoordinate];
  id v6 = [objc_alloc((Class)GEOLatLng) initWithLatitude:v4 longitude:v5];
  [v3 setOriginalCoordinate:v6];

  [(RAPPersonalPlaceCorrectionsQuestion *)self correctedCoordinate];
  if (CLLocationCoordinate2DIsValid(v13))
  {
    id v7 = objc_alloc((Class)GEOLatLng);
    [(RAPPersonalPlaceCorrectionsQuestion *)self correctedCoordinate];
    double v9 = v8;
    [(RAPPersonalPlaceCorrectionsQuestion *)self correctedCoordinate];
    id v10 = [v7 initWithLatitude:v9];
    [v3 setCorrectedCoordinate:v10];
  }

  return v3;
}

- (BOOL)isAdjustedCoordinateBeyondThreshold
{
  [(RAPPersonalPlaceCorrectionsQuestion *)self originalCoordinate];
  CLLocationDegrees v4 = v3;
  CLLocationDegrees v6 = v5;
  [(RAPPersonalPlaceCorrectionsQuestion *)self correctedCoordinate];
  if (CLLocationCoordinate2DIsValid(v14) && (v15.double latitude = v4, v15.longitude = v6, CLLocationCoordinate2DIsValid(v15)))
  {
    [(RAPPersonalPlaceCorrectionsQuestion *)self correctedCoordinate];
    GEOCalculateDistance();
    double v8 = v7;
    GEOConfigGetDouble();
    return v8 >= v9;
  }
  else
  {
    [(RAPPersonalPlaceCorrectionsQuestion *)self correctedCoordinate];
    return CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&v11);
  }
}

- (void)setCorrectedCoordinate:(CLLocationCoordinate2D)a3
{
  if (vabdd_f64(a3.latitude, self->_correctedCoordinate.latitude) >= 0.00000000999999994
    || vabdd_f64(a3.longitude, self->_correctedCoordinate.longitude) >= 0.00000000999999994)
  {
    self->_correctedCoordinate = a3;
    [(RAPQuestion *)self _didChange];
  }
}

- (void)rapCompleted:(BOOL)a3 privacyShown:(BOOL)a4 analyticsEvent:(id)a5
{
  if (a3) {
    uint64_t v5 = 10112;
  }
  else {
    uint64_t v5 = 10113;
  }
  if (a4) {
    uint64_t v6 = 1313;
  }
  else {
    uint64_t v6 = 1305;
  }
  +[GEOAPPortal captureUserAction:v5 target:v6 value:a5];
}

- (void)submitRAPWithWillSubmitBlock:(id)a3 didSubmitBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(RAPQuestion *)self report];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100C68540;
  v15[3] = &unk_101318C90;
  v15[4] = self;
  id v12 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100C68664;
  v13[3] = &unk_1012F6590;
  id v14 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100C6867C;
  v11[3] = &unk_10131D268;
  id v9 = v7;
  id v10 = v6;
  [v8 submitWithPrivacyRequestHandler:v15 willStartSubmitting:v13 didFinishSubmitting:v11];
}

- (BOOL)isComplete
{
  return [(RAPPersonalPlaceCorrectionsQuestion *)self isAdjustedCoordinateBeyondThreshold];
}

- (void)addUserPathItem:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  userPaths = self->_userPaths;
  if (!userPaths)
  {
    id v6 = +[NSMutableArray array];
    id v7 = self->_userPaths;
    self->_userPaths = v6;

    userPaths = self->_userPaths;
  }
  id v8 = +[NSNumber numberWithInt:v3];
  [(NSMutableArray *)userPaths addObject:v8];
}

- (int)userAction
{
  return 13001;
}

- (int64_t)questionCategory
{
  int64_t v2 = [(RAPPersonalPlaceCorrectionsQuestion *)self shortcutType];
  if ((unint64_t)(v2 - 2) > 3) {
    return 0;
  }
  else {
    return qword_100F73CA0[v2 - 2];
  }
}

- (NSString)localizedTitle
{
  id v2 = [(MapsSuggestionsShortcut *)self->_shortcut type];
  if (v2 == (id)5)
  {
    uint64_t v3 = +[NSBundle mainBundle];
    CLLocationDegrees v4 = v3;
    CFStringRef v5 = @"School Details";
    goto LABEL_7;
  }
  if (v2 == (id)3)
  {
    uint64_t v3 = +[NSBundle mainBundle];
    CLLocationDegrees v4 = v3;
    CFStringRef v5 = @"Work Details";
    goto LABEL_7;
  }
  if (v2 == (id)2)
  {
    uint64_t v3 = +[NSBundle mainBundle];
    CLLocationDegrees v4 = v3;
    CFStringRef v5 = @"Home Details";
LABEL_7:
    id v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

    goto LABEL_9;
  }
  id v6 = &stru_101324E70;
LABEL_9:

  return (NSString *)v6;
}

- (int64_t)shortcutType
{
  return self->_shortcutType;
}

- (void)setShortcutType:(int64_t)a3
{
  self->_shortcutType = a3;
}

- (MapsSuggestionsShortcut)shortcut
{
  return self->_shortcut;
}

- (RAPCommentQuestion)commentQuestion
{
  return self->_commentQuestion;
}

- (CLLocationCoordinate2D)originalCoordinate
{
  double latitude = self->_originalCoordinate.latitude;
  double longitude = self->_originalCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (CLLocationCoordinate2D)correctedCoordinate
{
  double latitude = self->_correctedCoordinate.latitude;
  double longitude = self->_correctedCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentQuestion, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);

  objc_storeStrong((id *)&self->_userPaths, 0);
}

@end