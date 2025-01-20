@interface TrafficIncidentReport
+ (BOOL)supportsSecureCoding;
+ (id)personalizedItemKey;
+ (int)actionForVoteType:(int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (BOOL)isReportedFromCarplay;
- (BOOL)isSiriContext;
- (BOOL)submissionFailed;
- (GEOLocation)incidentLocation;
- (GEOLocation)userLocation;
- (NSDate)incidentUpdateTime;
- (NSString)countryCodeUponCreation;
- (NSString)descriptionText;
- (NSString)displayText;
- (NSString)incidentId;
- (NSUUID)uniqueID;
- (TrafficIncidentReport)initWithCoder:(id)a3;
- (TrafficIncidentReport)initWithIncidentLocation:(id)a3 type:(int)a4 userPath:(int)a5;
- (TrafficIncidentReport)initWithType:(int)a3 countryCodeUponCreation:(id)a4;
- (TrafficIncidentReport)initWithUserLocation:(id)a3 type:(int)a4 userPath:(int)a5;
- (double)timestamp;
- (id)_incidentUserPath;
- (id)_processLocations:(id)a3;
- (id)description;
- (id)mapItemLocation;
- (int)annotationType;
- (int)incidentType;
- (int)userPath;
- (unint64_t)submissionCount;
- (void)_commonInit;
- (void)_displayInternalErrorAlert;
- (void)_submitFeedbackRequestParameters:(id)a3 attachedImages:(id)a4 comments:(id)a5 requireAuthenication:(BOOL)a6 completionHandler:(id)a7;
- (void)_submitFeedbackRequestParameters:(id)a3 attachedImages:(id)a4 comments:(id)a5 userInfo:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)setAnnotationType:(int)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIncidentId:(id)a3;
- (void)setIncidentLocation:(id)a3;
- (void)setIncidentType:(int)a3;
- (void)setIncidentUpdateTime:(id)a3;
- (void)setReportedFromCarplay:(BOOL)a3;
- (void)setSiriContext:(BOOL)a3;
- (void)setSubmissionCount:(unint64_t)a3;
- (void)setSubmissionFailed:(BOOL)a3;
- (void)setUniqueID:(id)a3;
- (void)setUserLocation:(id)a3;
- (void)setUserPath:(int)a3;
- (void)submitFeedbackForType:(int)a3 incidentId:(id)a4 completionHandler:(id)a5;
- (void)submitWithAttachedImages:(id)a3 comments:(id)a4 completionHandler:(id)a5;
- (void)submitWithCompletionHandler:(id)a3;
@end

@implementation TrafficIncidentReport

- (TrafficIncidentReport)initWithType:(int)a3 countryCodeUponCreation:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TrafficIncidentReport;
  v8 = [(TrafficIncidentReport *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_incidentType = a3;
    objc_storeStrong((id *)&v8->_countryCodeUponCreation, a4);
    [(TrafficIncidentReport *)v9 _commonInit];
  }

  return v9;
}

- (TrafficIncidentReport)initWithIncidentLocation:(id)a3 type:(int)a4 userPath:(int)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TrafficIncidentReport;
  v10 = [(TrafficIncidentReport *)&v13 init];
  objc_super v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_incidentLocation, a3);
    v11->_incidentType = a4;
    v11->_userPath = a5;
    [(TrafficIncidentReport *)v11 _commonInit];
  }

  return v11;
}

- (TrafficIncidentReport)initWithUserLocation:(id)a3 type:(int)a4 userPath:(int)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TrafficIncidentReport;
  v10 = [(TrafficIncidentReport *)&v13 init];
  objc_super v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_userLocation, a3);
    v11->_incidentType = a4;
    v11->_userPath = a5;
    [(TrafficIncidentReport *)v11 _commonInit];
  }

  return v11;
}

- (void)_commonInit
{
  v3 = +[NSUUID UUID];
  uniqueID = self->_uniqueID;
  self->_uniqueID = v3;

  v5 = +[NSDate date];
  incidentUpdateTime = self->_incidentUpdateTime;
  self->_incidentUpdateTime = v5;

  self->_submissionCount = 0;
  [(GEOLocation *)self->_incidentLocation clearSensitiveFields:0];
  userLocation = self->_userLocation;

  [(GEOLocation *)userLocation clearSensitiveFields:0];
}

- (TrafficIncidentReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TrafficIncidentReport;
  v5 = [(TrafficIncidentReport *)&v12 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"incidentLocation"];
    [(TrafficIncidentReport *)v5 setIncidentLocation:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userLocation"];
    [(TrafficIncidentReport *)v5 setUserLocation:v7];

    -[TrafficIncidentReport setIncidentType:](v5, "setIncidentType:", [v4 decodeInt32ForKey:@"incidentType"]);
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"incidentId"];
    [(TrafficIncidentReport *)v5 setIncidentId:v8];

    -[TrafficIncidentReport setAnnotationType:](v5, "setAnnotationType:", [v4 decodeInt32ForKey:@"annotationType"]);
    -[TrafficIncidentReport setUserPath:](v5, "setUserPath:", [v4 decodeInt32ForKey:@"userPath"]);
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueID"];
    [(TrafficIncidentReport *)v5 setUniqueID:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"incidentUpdateTime"];
    [(TrafficIncidentReport *)v5 setIncidentUpdateTime:v10];

    -[TrafficIncidentReport setSiriContext:](v5, "setSiriContext:", [v4 decodeBoolForKey:@"siriContext"]);
    -[TrafficIncidentReport setHidden:](v5, "setHidden:", [v4 decodeBoolForKey:@"hidden"]);
    -[TrafficIncidentReport setReportedFromCarplay:](v5, "setReportedFromCarplay:", [v4 decodeBoolForKey:@"reportedFromCarplay"]);
    -[TrafficIncidentReport setSubmissionFailed:](v5, "setSubmissionFailed:", [v4 decodeBoolForKey:@"submissionFailed"]);
    -[TrafficIncidentReport setSubmissionCount:](v5, "setSubmissionCount:", [v4 decodeIntegerForKey:@"submissionCount"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(TrafficIncidentReport *)self incidentLocation];
  [v9 encodeObject:v4 forKey:@"incidentLocation"];

  v5 = [(TrafficIncidentReport *)self userLocation];
  [v9 encodeObject:v5 forKey:@"userLocation"];

  [v9 encodeInt32:[self incidentType] forKey:@"incidentType"];
  v6 = [(TrafficIncidentReport *)self incidentId];
  [v9 encodeObject:v6 forKey:@"incidentId"];

  [v9 encodeInt32:-[TrafficIncidentReport annotationType](self, "annotationType") forKey:@"annotationType"];
  [v9 encodeInt32:[self userPath] forKey:@"userPath"];
  id v7 = [(TrafficIncidentReport *)self uniqueID];
  [v9 encodeObject:v7 forKey:@"uniqueID"];

  v8 = [(TrafficIncidentReport *)self incidentUpdateTime];
  [v9 encodeObject:v8 forKey:@"incidentUpdateTime"];

  [v9 encodeBool:[self isSiriContext] forKey:@"siriContext"];
  [v9 encodeBool:[self isHidden] forKey:@"hidden"];
  [v9 encodeBool:[self isReportedFromCarplay] forKey:@"reportedFromCarplay"];
  [v9 encodeBool:[self submissionFailed] forKey:@"submissionFailed"];
  [v9 encodeInteger:-[TrafficIncidentReport submissionCount](self, "submissionCount") forKey:@"submissionCount"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TrafficIncidentReport *)a3;
  if (v4 == self)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(TrafficIncidentReport *)v4 uniqueID];
      v6 = [v5 UUIDString];
      id v7 = [(TrafficIncidentReport *)self uniqueID];
      v8 = [v7 UUIDString];
      unsigned __int8 v9 = [v6 isEqualToString:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  uniqueID = self->_uniqueID;
  uint64_t incidentType = self->_incidentType;
  if (incidentType >= 0x12)
  {
    v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_incidentType];
  }
  else
  {
    v5 = (void *)*((void *)&off_101303288 + incidentType);
  }
  incidentLocation = self->_incidentLocation;
  userLocation = self->_userLocation;
  uint64_t userPath = self->_userPath;
  if (userPath >= 7)
  {
    unsigned __int8 v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_userPath];
  }
  else
  {
    unsigned __int8 v9 = (void *)*((void *)&off_101303250 + userPath);
  }
  unint64_t submissionCount = self->_submissionCount;
  incidentId = self->_incidentId;
  int v12 = self->_annotationType - 1;
  if (v12 >= 4)
  {
    objc_super v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_annotationType];
  }
  else
  {
    objc_super v13 = (void *)*((void *)&off_101303318 + v12);
  }
  v14 = +[NSString stringWithFormat:@"uniqueID: %@ incidentType: %@ incidentLocation: %@ userLocation: %@ userPath:%@,TransitPassManager submissionCount: %lu, incidentId :%@, annotationType:%@", uniqueID, v5, incidentLocation, userLocation, v9, submissionCount, incidentId, v13];

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)personalizedItemKey
{
  return @"TrafficIncidentReport";
}

- (id)mapItemLocation
{
  incidentLocation = self->_incidentLocation;
  if (!incidentLocation) {
    incidentLocation = self->_userLocation;
  }
  return incidentLocation;
}

- (double)timestamp
{
  [(GEOLocation *)self->_incidentLocation timestamp];
  uint64_t v3 = 64;
  if (v4 != 0.0) {
    uint64_t v3 = 56;
  }
  v5 = *(Class *)((char *)&self->super.isa + v3);

  [v5 timestamp];
  return result;
}

+ (int)actionForVoteType:(int)a3
{
  if ((a3 - 1) > 3) {
    return 107;
  }
  else {
    return dword_100F72AB0[a3 - 1];
  }
}

- (NSString)displayText
{
  uint64_t v2 = [(TrafficIncidentReport *)self incidentType];

  return (NSString *)+[TrafficIncidentLayoutItem defaultDisplayTextForType:v2];
}

- (NSString)descriptionText
{
  uint64_t v3 = +[MKTrafficSupport sharedTrafficSupport];
  int v4 = [(TrafficIncidentReport *)self incidentType];
  if (v4 > 6)
  {
    if (v4 == 7)
    {
      v5 = v3;
      uint64_t v6 = 1;
      goto LABEL_11;
    }
    if (v4 == 16)
    {
      v5 = v3;
      uint64_t v6 = 13;
      goto LABEL_11;
    }
LABEL_8:
    id v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Incident [OON, Report Incident]", @"localized string not found", 0 value table];

    goto LABEL_12;
  }
  if (v4 == 5)
  {
    v5 = v3;
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if (v4 != 6) {
    goto LABEL_8;
  }
  v5 = v3;
  uint64_t v6 = 4;
LABEL_11:
  v8 = [v5 localizedReportedByYouForGEOIncidentType:v6];
LABEL_12:

  return (NSString *)v8;
}

- (void)submitWithCompletionHandler:(id)a3
{
  int annotationType = self->_annotationType;
  id v5 = a3;
  uint64_t v6 = sub_100576E2C();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (annotationType)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Submitting feedback", buf, 2u);
    }

    [(TrafficIncidentReport *)self submitFeedbackForType:self->_annotationType incidentId:self->_incidentId completionHandler:v5];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Submitting new report", v8, 2u);
    }

    [(TrafficIncidentReport *)self submitWithAttachedImages:0 comments:0 completionHandler:v5];
  }
}

- (void)submitWithAttachedImages:(id)a3 comments:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = +[TrafficIncidentsStorageManager sharedInstance];
  [v11 addReport:self];

  int v12 = +[DeviceRecentLocations sharedInstance];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100955164;
  v16[3] = &unk_101303160;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [v12 updateLocationsWithCompletionHandler:v16];
}

- (void)submitFeedbackForType:(int)a3 incidentId:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if (v7 == 4 && (sub_100CDC3E4() & 1) == 0)
  {
    v27 = sub_100576E2C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Submitting Feedback for AUTO_UP_VOTE is disabled", buf, 2u);
    }

    if (v10) {
      v10[2](v10);
    }
  }
  else
  {
    objc_super v11 = +[MKLocationManager sharedLocationManager];
    int v12 = [v11 currentLocation];

    id v13 = objc_alloc_init((Class)GEORPIncidentAnnotationDetails);
    id v14 = objc_alloc_init((Class)GEORPUserLocationDetails);
    [v13 setUserLocation:v14];

    id v15 = [v13 userLocation];
    [v15 setCurrentUserLocation:v12];

    [v13 setAnnotationType:v7];
    [v13 setIncidentId:v9];
    [v13 setIncidentType:self->_incidentType];
    v16 = [(GEOLocation *)self->_incidentLocation latLng];
    [v13 setIncidentLocation:v16];

    self->_int annotationType = v7;
    objc_storeStrong((id *)&self->_incidentId, a4);
    objc_storeStrong((id *)&self->_userLocation, v12);
    id v17 = +[TrafficIncidentsStorageManager sharedInstance];
    [v17 addReport:self];

    if (v7 == 3 || v9)
    {
      id v18 = +[TrafficIncidentsStorageManager sharedInstance];
      [v18 hideReport:self];
    }
    objc_initWeak(&location, self);
    id v19 = objc_alloc((Class)GEORPFeedbackRequestParameters);
    v20 = [(TrafficIncidentReport *)self _incidentUserPath];
    id v21 = [v19 initWithIncidentAnnotationDetails:v13 userPath:v20];

    unsigned int v22 = sub_100CDC80C();
    if (v7 == 4) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = v22;
    }
    v24 = sub_100576E2C();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int incidentType = self->_incidentType;
      if ((v7 - 1) >= 4)
      {
        v26 = +[NSString stringWithFormat:@"(unknown: %i)", v7];
      }
      else
      {
        v26 = (void *)*((void *)&off_101303318 + (int)v7 - 1);
      }
      *(_DWORD *)buf = 67109378;
      int v33 = incidentType;
      __int16 v34 = 2112;
      v35 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Submitting incident feedback: %d annotationType %@", buf, 0x12u);
    }
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10095574C;
    v28[3] = &unk_1012E9950;
    objc_copyWeak(&v30, &location);
    v29 = v10;
    [(TrafficIncidentReport *)self _submitFeedbackRequestParameters:v21 attachedImages:0 comments:0 requireAuthenication:v23 completionHandler:v28];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
}

- (void)_submitFeedbackRequestParameters:(id)a3 attachedImages:(id)a4 comments:(id)a5 requireAuthenication:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = v15;
  if (v15) {
    (*((void (**)(id))v15 + 2))(v15);
  }
  if (v8)
  {
    id v17 = +[TrafficIncidentAuthenticationManager sharedInstance];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100955918;
    v18[3] = &unk_101303188;
    v18[4] = self;
    id v19 = v12;
    id v20 = v13;
    id v21 = v14;
    [v17 generateAuthenticationInfoWithCompletionHandler:v18];
  }
  else
  {
    [(TrafficIncidentReport *)self _submitFeedbackRequestParameters:v12 attachedImages:v13 comments:v14 userInfo:0];
  }
}

- (void)_submitFeedbackRequestParameters:(id)a3 attachedImages:(id)a4 comments:(id)a5 userInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = sub_100CDC5F8();
  char v15 = v14;
  if (v12 && v14)
  {
    v16 = [v10 submissionParameters];
    id v17 = [v16 commonCorrections];

    if (!v17)
    {
      id v18 = objc_alloc_init((Class)GEORPFeedbackCommonCorrections);
      id v19 = [v10 submissionParameters];
      [v19 setCommonCorrections:v18];
    }
    id v20 = [v10 submissionParameters];
    id v21 = [v20 commonCorrections];
    [v21 setComments:v12];
  }
  if (sub_100CDCA20())
  {
    unsigned int v22 = +[GEORPFeedbackRequest clientTestingDebugSettings];
  }
  else
  {
    unsigned int v22 = 0;
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100955BCC;
  v27[3] = &unk_1012E6900;
  char v33 = v15;
  id v28 = v10;
  id v29 = v11;
  id v30 = v13;
  id v31 = v22;
  v32 = self;
  id v23 = v22;
  id v24 = v13;
  id v25 = v11;
  id v26 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v27);
}

- (void)_displayInternalErrorAlert
{
  uint64_t v3 = +[GEOPlatform sharedPlatform];
  unsigned int v4 = [v3 isInternalInstall];

  if (v4)
  {
    unint64_t v5 = [(TrafficIncidentReport *)self submissionCount];
    if (v5 >= GEOConfigGetUInteger())
    {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1013031D0);
    }
  }
}

- (id)_processLocations:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    unsigned int v4 = (char *)[v3 count];
    if ((unint64_t)[v3 count] <= 0x78) {
      uint64_t v5 = (uint64_t)[v3 count];
    }
    else {
      uint64_t v5 = 120;
    }
    uint64_t v7 = [v3 subarrayWithRange:&v4[-v5] count:[v3 count] - &v4[-v5]];
    uint64_t v6 = sub_100099700(v7, &stru_101303230);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_incidentUserPath
{
  id v3 = objc_alloc_init((Class)GEORPIncidentUserPath);
  [v3 addUserPath:self->_userPath];
  [v3 setReportedFromCarplay:self->_reportedFromCarplay];
  unsigned int v4 = +[MNNavigationService sharedService];
  unsigned int v5 = [v4 isInNavigatingState];

  if (v5)
  {
    [v3 setNavigationActive:1];
    uint64_t v6 = +[MNNavigationService sharedService];
    [v3 setTransportType:[v6 navigationTransportType]];
  }

  return v3;
}

- (BOOL)isSiriContext
{
  return self->_siriContext;
}

- (void)setSiriContext:(BOOL)a3
{
  self->_siriContext = a3;
}

- (BOOL)isReportedFromCarplay
{
  return self->_reportedFromCarplay;
}

- (void)setReportedFromCarplay:(BOOL)a3
{
  self->_reportedFromCarplay = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)submissionFailed
{
  return self->_submissionFailed;
}

- (void)setSubmissionFailed:(BOOL)a3
{
  self->_submissionFailed = a3;
}

- (unint64_t)submissionCount
{
  return self->_submissionCount;
}

- (void)setSubmissionCount:(unint64_t)a3
{
  self->_unint64_t submissionCount = a3;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (int)incidentType
{
  return self->_incidentType;
}

- (void)setIncidentType:(int)a3
{
  self->_int incidentType = a3;
}

- (NSDate)incidentUpdateTime
{
  return self->_incidentUpdateTime;
}

- (void)setIncidentUpdateTime:(id)a3
{
}

- (NSString)countryCodeUponCreation
{
  return self->_countryCodeUponCreation;
}

- (GEOLocation)incidentLocation
{
  return self->_incidentLocation;
}

- (void)setIncidentLocation:(id)a3
{
}

- (GEOLocation)userLocation
{
  return self->_userLocation;
}

- (void)setUserLocation:(id)a3
{
}

- (NSString)incidentId
{
  return self->_incidentId;
}

- (void)setIncidentId:(id)a3
{
}

- (int)annotationType
{
  return self->_annotationType;
}

- (void)setAnnotationType:(int)a3
{
  self->_int annotationType = a3;
}

- (int)userPath
{
  return self->_userPath;
}

- (void)setUserPath:(int)a3
{
  self->_uint64_t userPath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentId, 0);
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_incidentLocation, 0);
  objc_storeStrong((id *)&self->_countryCodeUponCreation, 0);
  objc_storeStrong((id *)&self->_incidentUpdateTime, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end