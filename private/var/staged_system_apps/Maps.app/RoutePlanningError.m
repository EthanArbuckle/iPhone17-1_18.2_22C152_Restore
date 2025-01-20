@interface RoutePlanningError
- (BOOL)_buildOutOfCoverageErrorStringsForError:(id)a3 transportType:(unint64_t)a4 origin:(id)a5 destination:(id)a6;
- (BOOL)errorViewShouldShowRegularDirectionsFallback;
- (BOOL)errorViewShouldShowRoutingApps;
- (GEOTransitRoutingIncidentMessage)incidentMessage;
- (NSString)errorMessage;
- (NSString)errorTitle;
- (NSURL)errorViewFeatureAvailabilityPunchoutURL;
- (RoutePlanningError)initWithError:(id)a3 transportType:(unint64_t)a4;
- (RoutePlanningError)initWithError:(id)a3 transportType:(unint64_t)a4 origin:(id)a5 destination:(id)a6;
- (int64_t)errorCode;
- (void)_buildErrorStringsFromError:(id)a3 transportType:(unint64_t)a4 origin:(id)a5 destination:(id)a6;
- (void)_updateRegularDirectionsFallbackVisibilityWithError:(id)a3 transportType:(unint64_t)a4;
- (void)_updateRoutingAppsVisibilityWithError:(id)a3 transportType:(unint64_t)a4;
- (void)setErrorCode:(int64_t)a3;
@end

@implementation RoutePlanningError

- (RoutePlanningError)initWithError:(id)a3 transportType:(unint64_t)a4
{
  return [(RoutePlanningError *)self initWithError:a3 transportType:a4 origin:0 destination:0];
}

- (RoutePlanningError)initWithError:(id)a3 transportType:(unint64_t)a4 origin:(id)a5 destination:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)RoutePlanningError;
  v13 = [(RoutePlanningError *)&v19 init];
  if (v13)
  {
    v14 = [v10 userInfo];
    v15 = [v14 objectForKeyedSubscript:MKDirectionsErrorCodeKey];
    -[RoutePlanningError setErrorCode:](v13, "setErrorCode:", [v15 integerValue]);

    [(RoutePlanningError *)v13 _buildErrorStringsFromError:v10 transportType:a4 origin:v11 destination:v12];
    [(RoutePlanningError *)v13 _updateRoutingAppsVisibilityWithError:v10 transportType:a4];
    [(RoutePlanningError *)v13 _updateRegularDirectionsFallbackVisibilityWithError:v10 transportType:a4];
    uint64_t v16 = [v10 _mapkit_transitIncident];
    incidentMessage = v13->_incidentMessage;
    v13->_incidentMessage = (GEOTransitRoutingIncidentMessage *)v16;
  }
  return v13;
}

- (void)_buildErrorStringsFromError:(id)a3 transportType:(unint64_t)a4 origin:(id)a5 destination:(id)a6
{
  id v10 = a3;
  id v53 = a5;
  id v52 = a6;
  id v11 = [v10 domain];
  id v12 = [v10 userInfo];
  v13 = [v12 objectForKeyedSubscript:NSLocalizedDescriptionKey];

  v14 = [v10 userInfo];
  v15 = [v14 objectForKeyedSubscript:NSLocalizedFailureReasonErrorKey];

  switch(MKCurrentNetworkConnectionFailureDiagnosis())
  {
    case 0:
    case 4:
      if (![(RoutePlanningError *)self _buildOutOfCoverageErrorStringsForError:v10 transportType:a4 origin:v53 destination:v52])break; {
      goto LABEL_52;
      }
    case 1:
      switch(MGGetSInt32Answer())
      {
        case 1u:
          uint64_t v16 = +[NSBundle mainBundle];
          v17 = v16;
          CFStringRef v18 = @"RoutePlanningError_AirplaneMode_iPhone";
          break;
        case 2u:
          uint64_t v16 = +[NSBundle mainBundle];
          v17 = v16;
          CFStringRef v18 = @"RoutePlanningError_AirplaneMode_iPod";
          break;
        case 3u:
          uint64_t v16 = +[NSBundle mainBundle];
          v17 = v16;
          CFStringRef v18 = @"RoutePlanningError_AirplaneMode_iPad";
          break;
        case 6u:
          uint64_t v16 = +[NSBundle mainBundle];
          v17 = v16;
          CFStringRef v18 = @"RoutePlanningError_AirplaneMode_Watch";
          break;
        default:
          uint64_t v16 = +[NSBundle mainBundle];
          v17 = v16;
          CFStringRef v18 = @"RoutePlanningError_AirplaneMode_Device";
          break;
      }
      goto LABEL_7;
    case 2:
      uint64_t v16 = +[NSBundle mainBundle];
      v17 = v16;
      CFStringRef v18 = @"Enable Cellular Data [Route Planning]";
      goto LABEL_7;
    case 3:
      switch(MGGetSInt32Answer())
      {
        case 1u:
          uint64_t v16 = +[NSBundle mainBundle];
          v17 = v16;
          CFStringRef v18 = @"RoutePlanningError_NoNetworkConnection_iPhone";
          break;
        case 2u:
          uint64_t v16 = +[NSBundle mainBundle];
          v17 = v16;
          CFStringRef v18 = @"RoutePlanningError_NoNetworkConnection_iPod";
          break;
        case 3u:
          uint64_t v16 = +[NSBundle mainBundle];
          v17 = v16;
          CFStringRef v18 = @"RoutePlanningError_NoNetworkConnection_iPad";
          break;
        case 6u:
          uint64_t v16 = +[NSBundle mainBundle];
          v17 = v16;
          CFStringRef v18 = @"RoutePlanningError_NoNetworkConnection_Watch";
          break;
        default:
          uint64_t v16 = +[NSBundle mainBundle];
          v17 = v16;
          CFStringRef v18 = @"RoutePlanningError_NoNetworkConnection_Device";
          break;
      }
LABEL_7:
      uint64_t v19 = [v16 localizedStringForKey:v18 value:@"localized string not found" table:0];

      v15 = 0;
      v13 = (void *)v19;
      break;
    default:
      break;
  }
  if ([v11 isEqualToString:MNErrorDomain] && objc_msgSend(v10, "code") == (id)3)
  {
    v20 = +[NSBundle mainBundle];
    uint64_t v21 = [v20 localizedStringForKey:@"RoutePlanningError_NilWaypoints_Title" value:@"localized string not found" table:0];

    v22 = +[NSBundle mainBundle];
    uint64_t v23 = [v22 localizedStringForKey:@"RoutePlanningError_NilWaypoints_Message" value:@"localized string not found" table:0];
    v13 = v15;
    v15 = v22;
LABEL_13:

    v15 = (void *)v23;
    v13 = (void *)v21;
    goto LABEL_14;
  }
  if ([v11 isEqualToString:NSURLErrorDomain])
  {
    uint64_t v23 = 0;
    uint64_t v21 = 0;
    goto LABEL_13;
  }
LABEL_14:
  if (([v11 isEqualToString:kCFErrorDomainCFNetwork] & 1) != 0
    || (id)[(RoutePlanningError *)self errorCode] == (id)2
    || (id)[(RoutePlanningError *)self errorCode] == (id)22)
  {
    int BOOL = GEOConfigGetBOOL();
    v25 = +[NSBundle mainBundle];
    v26 = v25;
    if (BOOL) {
      CFStringRef v27 = @"Using Offline Maps";
    }
    else {
      CFStringRef v27 = @"You’re Offline";
    }
    v28 = [v25 localizedStringForKey:v27 value:@"localized string not found" table:@"Offline"];

    v29 = +[NSBundle mainBundle];
    id v30 = [v29 localizedStringForKey:@"RoutePlanningError_NoNetworkConnection_Message" value:@"localized string not found" table:0];

    if (![(RoutePlanningError *)self errorCode]) {
      [(RoutePlanningError *)self setErrorCode:2];
    }
  }
  else
  {
    id v30 = v15;
    v28 = v13;
  }
  if ([v28 length] || objc_msgSend(v30, "length"))
  {
    v13 = v28;
  }
  else if (([v11 isEqualToString:kCLErrorDomain] & 1) != 0 {
         || [v11 isEqualToString:MKLocationErrorDomain])
  }
  {
    v40 = +[MKLocationManager sharedLocationManager];
    id v54 = 0;
    unsigned int v41 = [v40 isLocationServicesPossiblyAvailable:&v54];
    id v42 = v54;

    if (v41)
    {
      v43 = +[NSBundle mainBundle];
      v13 = [v43 localizedStringForKey:@"Current Location Not Available" value:@"localized string not found" table:0];

      v44 = +[NSBundle mainBundle];
      [v44 localizedStringForKey:@"Your current location cannot be determined at this time." value:@"localized string not found" table:0];
    }
    else
    {
      v45 = [v42 userInfo];
      v13 = [v45 objectForKeyedSubscript:NSLocalizedDescriptionKey];

      v44 = [v42 userInfo];
      [v44 objectForKeyedSubscript:NSLocalizedRecoverySuggestionErrorKey];
    uint64_t v46 = };

    id v30 = (id)v46;
  }
  else
  {
    v51 = +[NSBundle mainBundle];
    v13 = [v51 localizedStringForKey:@"A route can’t be shown because of a problem connecting to the server." value:@"localized string not found" table:0];

    id v30 = 0;
  }
  if (!v10) {
    goto LABEL_51;
  }
  v31 = +[GEOPlatform sharedPlatform];
  if (![v31 isInternalInstall]) {
    goto LABEL_50;
  }
  int v32 = GEOConfigGetBOOL();

  if (v32)
  {
    v33 = [v10 userInfo];
    v31 = [v33 objectForKeyedSubscript:MKErrorDirectionsErrorInfoKey];

    v34 = [v31 internalServerErrors];
    id v35 = [v34 count];

    if (v35)
    {
      v36 = [v31 internalServerErrors];
      v37 = [v36 firstObject];
      v38 = +[NSString stringWithFormat:@"[Internal Only] %@", v37];

      if (v30)
      {
        uint64_t v39 = [v30 stringByAppendingFormat:@"\n\n%@", v38];

        id v30 = (id)v39;
      }
      else
      {
        id v30 = v38;
      }
    }
LABEL_50:
  }
LABEL_51:
  v47 = (NSString *)[v13 copy];
  errorTitle = self->_errorTitle;
  self->_errorTitle = v47;

  v49 = (NSString *)[v30 copy];
  errorMessage = self->_errorMessage;
  self->_errorMessage = v49;

  v15 = v30;
LABEL_52:
}

- (BOOL)_buildOutOfCoverageErrorStringsForError:(id)a3 transportType:(unint64_t)a4 origin:(id)a5 destination:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  BOOL v14 = 0;
  if (a4 == 8 && v11 && v12)
  {
    if (objc_msgSend(v10, "_mapkit_isDirectionsError")
      && GEOConfigGetBOOL()
      && ([v10 userInfo],
          v15 = objc_claimAutoreleasedReturnValue(),
          [v15 objectForKeyedSubscript:MKDirectionsErrorCodeKey],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          unint64_t v17 = (unint64_t)[v16 integerValue],
          v16,
          v15,
          (v17 & 0xFFFFFFFFFFFFFFFELL) == 8))
    {
      CFStringRef v18 = +[NSBundle mainBundle];
      uint64_t v19 = [v18 localizedStringForKey:@"Cycling Directions Not Available [Title]" value:@"localized string not found" table:0];
      errorTitle = self->_errorTitle;
      self->_errorTitle = v19;

      uint64_t v21 = sub_100439E8C(v11);
      uint64_t v22 = sub_100439E8C(v13);
      uint64_t v23 = (void *)v22;
      if (v21) {
        BOOL v24 = v22 == 0;
      }
      else {
        BOOL v24 = 1;
      }
      BOOL v14 = !v24;
      if (!v24)
      {
        unsigned int v25 = [v21 isEqualToString:v22];
        v26 = +[NSBundle mainBundle];
        CFStringRef v27 = v26;
        if (v25)
        {
          v28 = [v26 localizedStringForKey:@"Cycling Directions Not Available [Message, Single City]", @"localized string not found", 0 value table];
        }
        else
        {
          v28 = [v26 localizedStringForKey:@"Cycling Directions Not Available [Message, Multi City]", @"localized string not found", 0 value table];
          id v35 = v23;
        }
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v28, v21, v35);
        id v30 = (NSString *)objc_claimAutoreleasedReturnValue();
        errorMessage = self->_errorMessage;
        self->_errorMessage = v30;

        int v32 = GEOConfigGetString();
        if ([v32 length])
        {
          v33 = +[NSURL URLWithString:v32];
          if (v33)
          {
            v34 = +[UIApplication sharedApplication];
            unsigned int v36 = [v34 canOpenURL:v33];

            if (v36) {
              objc_storeStrong((id *)&self->_errorViewFeatureAvailabilityPunchoutURL, v33);
            }
          }
        }
        else
        {
          v33 = 0;
        }
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (void)_updateRoutingAppsVisibilityWithError:(id)a3 transportType:(unint64_t)a4
{
  id v10 = a3;
  BOOL v9 = objc_msgSend(v10, "_mapkit_isDirectionsError")
    && (([v10 userInfo],
         v6 = objc_claimAutoreleasedReturnValue(),
         [v6 objectForKeyedSubscript:MKDirectionsErrorCodeKey],
         v7 = objc_claimAutoreleasedReturnValue(),
         unint64_t v8 = (unint64_t)[v7 integerValue],
         v7,
         v6,
         a4 == 8)
     || a4 == 4)
    && (v8 & 0xFFFFFFFFFFFFFFFELL) == 8;
  self->_errorViewShouldShowRoutingApps = v9;
}

- (void)_updateRegularDirectionsFallbackVisibilityWithError:(id)a3 transportType:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v11 = v6;
    if (objc_msgSend(v6, "_mapkit_isDirectionsError"))
    {
      v7 = [v11 userInfo];
      unint64_t v8 = [v7 objectForKeyedSubscript:MKDirectionsErrorCodeKey];
      BOOL v9 = (char *)[v8 integerValue];

      BOOL v10 = (unint64_t)(v9 - 18) < 3;
    }
    else
    {
      BOOL v10 = 0;
    }
    self->_errorViewShouldShowRegularDirectionsFallback = v10;
    id v6 = v11;
  }
  else
  {
    self->_errorViewShouldShowRegularDirectionsFallback = 0;
  }
}

- (NSString)errorTitle
{
  return self->_errorTitle;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (BOOL)errorViewShouldShowRoutingApps
{
  return self->_errorViewShouldShowRoutingApps;
}

- (BOOL)errorViewShouldShowRegularDirectionsFallback
{
  return self->_errorViewShouldShowRegularDirectionsFallback;
}

- (NSURL)errorViewFeatureAvailabilityPunchoutURL
{
  return self->_errorViewFeatureAvailabilityPunchoutURL;
}

- (GEOTransitRoutingIncidentMessage)incidentMessage
{
  return self->_incidentMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentMessage, 0);
  objc_storeStrong((id *)&self->_errorViewFeatureAvailabilityPunchoutURL, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);

  objc_storeStrong((id *)&self->_errorTitle, 0);
}

@end