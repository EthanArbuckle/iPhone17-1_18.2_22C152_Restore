@interface MNTrafficIncidentAlert
+ (BOOL)supportsSecureCoding;
+ (id)_validTrafficIncidentAlertsForBannerTexts:(id)a3 mainRouteInfo:(id)a4 alternateRouteInfo:(id)a5;
+ (id)createFakeTrafficBannerTextWithType:(unint64_t)a3 mainRouteInfo:(id)a4 alternateRouteInfo:(id)a5 incidentDistance:(unsigned int)a6;
+ (id)validTrafficIncidentAlertsForETAUpdate:(id)a3 alternateRouteInfo:(id)a4;
+ (id)validTrafficIncidentAlertsForNewRoute:(id)a3 alternateRouteInfo:(id)a4;
+ (void)_addDebugArguments:(id)a3;
- ($212C09783140BCCD23384160D545CE0D)alternateEndValidCoordinateRange;
- ($212C09783140BCCD23384160D545CE0D)endValidCoordinateRange;
- ($212C09783140BCCD23384160D545CE0D)incidentCoordinate;
- ($212C09783140BCCD23384160D545CE0D)startValidCoordinateRange;
- (BOOL)defaultToNewRoute;
- (BOOL)isAutomaticReroute;
- (BOOL)isReroute;
- (BOOL)persistAcrossUpdates;
- (BOOL)shouldShowTimer;
- (GEOComposedRoute)alternateRoute;
- (GEOComposedRoute)originalRoute;
- (GEONavigabilityInfo)originalRouteNavigability;
- (GEOPBTransitArtwork)artwork;
- (GEORouteIncident)incident;
- (MNActiveRouteInfo)alternateRouteInfo;
- (MNActiveRouteInfo)mainRouteInfo;
- (MNTrafficIncidentAlert)initWithCoder:(id)a3;
- (MNTrafficIncidentTriggerRange)progressBarTriggerRange;
- (MNTrafficIncidentTriggerRange)triggerRange;
- (NSArray)alertDescriptions;
- (NSArray)alertTitles;
- (NSArray)spokenTexts;
- (NSData)alertID;
- (NSData)etaResponseID;
- (NSData)eventInfo;
- (NSDate)alertDate;
- (NSMutableArray)oldRouteIncidents;
- (NSString)analyticsMessage;
- (NSString)bannerDescription;
- (NSString)bannerID;
- (double)alertDisplayDuration;
- (double)distanceToDestination;
- (double)distanceToIncident;
- (double)minDisplayTime;
- (double)newEstimatedTime;
- (double)oldEstimatedTime;
- (double)oldHistoricTime;
- (double)overlapDelayTime;
- (id)_buttonTitleForAlertAction:(unint64_t)a3;
- (id)_dynamicStringValues;
- (id)_initWithGeoTrafficBannerText:(id)a3 mainRouteInfo:(id)a4 alternateRouteInfo:(id)a5;
- (id)_stringForAlertType:(unint64_t)a3;
- (id)acceptButtonTitle;
- (id)buttonActionTitles;
- (id)description;
- (id)dismissButtonTitle;
- (int)_buttonDisplayForAlertAction:(unint64_t)a3;
- (int)acceptButtonDisplay;
- (int)dismissButtonDisplay;
- (int)previousBannerChange;
- (unint64_t)_alertTypeForGeoBannerStyle:(int)a3;
- (unint64_t)alertType;
- (unint64_t)priority;
- (unint64_t)secondsSaved;
- (void)_initRouteCoordinates;
- (void)_populateButtonActionAndTitles:(id)a3;
- (void)_populateIncidentDetails:(id)a3;
- (void)_populateServerFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAlertDisplayDuration:(double)a3;
- (void)setDistanceToDestination:(double)a3;
- (void)setDistanceToIncident:(double)a3;
- (void)setShouldShowTimer:(BOOL)a3;
- (void)updateAlertIDWithAlert:(id)a3;
- (void)updateLocation:(id)a3;
@end

@implementation MNTrafficIncidentAlert

+ (id)validTrafficIncidentAlertsForNewRoute:(id)a3 alternateRouteInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 route];
  v8 = [v7 geoTrafficBannerTexts];
  v9 = +[MNTrafficIncidentAlert _validTrafficIncidentAlertsForBannerTexts:v8 mainRouteInfo:v6 alternateRouteInfo:v5];

  return v9;
}

+ (id)validTrafficIncidentAlertsForETAUpdate:(id)a3 alternateRouteInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 etaRoute];
  v8 = [v7 geoTrafficBannerTexts];
  v9 = +[MNTrafficIncidentAlert _validTrafficIncidentAlertsForBannerTexts:v8 mainRouteInfo:v6 alternateRouteInfo:v5];

  return v9;
}

+ (id)_validTrafficIncidentAlertsForBannerTexts:(id)a3 mainRouteInfo:(id)a4 alternateRouteInfo:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v33 = a4;
  id v8 = a5;
  v9 = objc_opt_new();
  if (v7)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v31 = v7;
    id obj = v7;
    uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v34 + 1) + 8 * v13);
          v15 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = [v14 bannerStyle];
            if (v16 >= 8)
            {
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v16);
              v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v17 = off_1E60FBA38[(int)v16];
            }
            v18 = [v14 bannerId];
            *(_DWORD *)buf = 138412546;
            v39 = (const char *)v17;
            __int16 v40 = 2112;
            v41 = v18;
            _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_DEFAULT, "Received Dodgeball alert from server response: %@, %@", buf, 0x16u);
          }
          switch([v14 bannerStyle])
          {
            case 0u:
              v22 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v39 = "+[MNTrafficIncidentAlert _validTrafficIncidentAlertsForBannerTexts:mainRouteInfo:alternateRouteInfo:]";
                __int16 v40 = 2080;
                v41 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNTrafficIncidentAlert.m";
                __int16 v42 = 1024;
                int v43 = 174;
                _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
              }

              v23 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B542B000, v23, OS_LOG_TYPE_ERROR, "Dodgeball response has no banner style. This is a server error. Attempting to continue.", buf, 2u);
              }

              if (v8) {
                uint64_t v24 = 1;
              }
              else {
                uint64_t v24 = 2;
              }
              [v14 setBannerStyle:v24];
              goto LABEL_31;
            case 1u:
            case 4u:
            case 7u:
              if (v8) {
                goto LABEL_31;
              }
              v19 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                uint64_t v20 = [v14 bannerStyle];
                if (v20 >= 8)
                {
                  objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v20);
                  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v21 = off_1E60FBA38[(int)v20];
                }
                *(_DWORD *)buf = 138412290;
                v39 = (const char *)v21;
                _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_ERROR, "Dodgeball response (%@) requires alternate route, but none was found.", buf, 0xCu);
              }
              id v8 = 0;
              break;
            case 2u:
            case 5u:

              id v8 = 0;
              goto LABEL_31;
            case 3u:
            case 6u:
LABEL_31:
              v19 = [[MNTrafficIncidentAlert alloc] _initWithGeoTrafficBannerText:v14 mainRouteInfo:v33 alternateRouteInfo:v8];
              [v9 addObject:v19];
              break;
            default:
              v25 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v39 = "+[MNTrafficIncidentAlert _validTrafficIncidentAlertsForBannerTexts:mainRouteInfo:alternateRouteInfo:]";
                __int16 v40 = 2080;
                v41 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNTrafficIncidentAlert.m";
                __int16 v42 = 1024;
                int v43 = 185;
                _os_log_impl(&dword_1B542B000, v25, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
              }

              v19 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                uint64_t v26 = [v14 bannerStyle];
                if (v26 >= 8)
                {
                  objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v26);
                  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v27 = off_1E60FBA38[(int)v26];
                }
                *(_DWORD *)buf = 138412290;
                v39 = (const char *)v27;
                _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_ERROR, "Dodgeball response returned a type that is not supported on the client yet (%@)", buf, 0xCu);
              }
              break;
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
        uint64_t v11 = v28;
      }
      while (v28);
    }

    id v29 = v9;
    id v7 = v31;
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (id)buttonActionTitles
{
  return self->_buttonActionTitles;
}

- (NSArray)alertTitles
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(GEOTrafficBannerText *)self->_geoTrafficBannerText hasBannerLargeText])
  {
    v3 = NSString;
    v4 = [(GEOTrafficBannerText *)self->_geoTrafficBannerText bannerLargeText];
    id v5 = [(MNTrafficIncidentAlert *)self _dynamicStringValues];
    id v6 = objc_msgSend(v3, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", v4, 1, 0, 0, v5);

    v9[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    id v7 = 0;
  }
  return (NSArray *)v7;
}

- (NSArray)alertDescriptions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(GEOTrafficBannerText *)self->_geoTrafficBannerText hasBannerSmallText])
  {
    v3 = NSString;
    v4 = [(GEOTrafficBannerText *)self->_geoTrafficBannerText bannerSmallText];
    id v5 = [(MNTrafficIncidentAlert *)self _dynamicStringValues];
    id v6 = objc_msgSend(v3, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", v4, 1, 0, 0, v5);

    v9[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    id v7 = 0;
  }
  return (NSArray *)v7;
}

- (NSArray)spokenTexts
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(GEOTrafficBannerText *)self->_geoTrafficBannerText hasSpokenPrompt])
  {
    v3 = NSString;
    v4 = [(GEOTrafficBannerText *)self->_geoTrafficBannerText spokenPrompt];
    id v5 = [(MNTrafficIncidentAlert *)self _dynamicStringValues];
    id v6 = objc_msgSend(v3, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", v4, 0, 1, 1, v5);

    v9[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    id v7 = 0;
  }
  return (NSArray *)v7;
}

- (GEOComposedRoute)originalRoute
{
  return [(MNActiveRouteInfo *)self->_mainRouteInfo route];
}

- (GEOComposedRoute)alternateRoute
{
  return [(MNActiveRouteInfo *)self->_alternateRouteInfo route];
}

- (GEONavigabilityInfo)originalRouteNavigability
{
  v2 = [(MNActiveRouteInfo *)self->_mainRouteInfo etaRoute];
  v3 = [v2 navigabilityInfo];

  return (GEONavigabilityInfo *)v3;
}

- (double)alertDisplayDuration
{
  double result = self->_alertDisplayDuration;
  if (result <= 0.0)
  {
    unint64_t alertType = self->_alertType;
    double result = 978307200.0;
    if (alertType <= 7)
    {
      if (((1 << alertType) & 0x66) != 0)
      {
LABEL_5:
        GEOConfigGetDouble();
        return result;
      }
      if (((1 << alertType) & 0x90) != 0)
      {
        return 0.0;
      }
      else if (alertType == 3 && self->_isAutomaticReroute)
      {
        goto LABEL_5;
      }
    }
  }
  return result;
}

- (BOOL)defaultToNewRoute
{
  return [(GEOTrafficBannerText *)self->_geoTrafficBannerText defaultToNewRoute];
}

- (BOOL)isReroute
{
  return (self->_alertType > 6) | (0x18u >> self->_alertType) & 1;
}

- (int)acceptButtonDisplay
{
  return [(MNTrafficIncidentAlert *)self _buttonDisplayForAlertAction:2];
}

- (int)dismissButtonDisplay
{
  return [(MNTrafficIncidentAlert *)self _buttonDisplayForAlertAction:1];
}

- (int)_buttonDisplayForAlertAction:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(MNTrafficIncidentAlert *)self buttonActionTitles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 action] == a3)
        {
          int v10 = [v9 buttonDisplay];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  int v10 = 0;
LABEL_11:

  return v10;
}

- (id)acceptButtonTitle
{
  return [(MNTrafficIncidentAlert *)self _buttonTitleForAlertAction:2];
}

- (id)dismissButtonTitle
{
  return [(MNTrafficIncidentAlert *)self _buttonTitleForAlertAction:1];
}

- (id)_buttonTitleForAlertAction:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(MNTrafficIncidentAlert *)self buttonActionTitles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 action] == a3)
        {
          int v10 = [v9 title];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  int v10 = 0;
LABEL_11:

  return v10;
}

- (void)updateLocation:(id)a3
{
  id v4 = a3;
  if (self->_incidentCoordinate.offset >= 0.0)
  {
    id v14 = v4;
    uint64_t v5 = [v4 routeMatch];
    int v6 = [v5 isGoodMatch];

    id v4 = v14;
    if (v6)
    {
      uint64_t v7 = [v14 routeMatch];
      uint64_t v8 = [v7 routeCoordinate];

      v9 = [(MNTrafficIncidentAlert *)self originalRoute];
      [v9 distanceToEndFromRouteCoordinate:v8];
      self->_distanceToDestination = v10;

      if (GEOPolylineCoordinateIsABeforeB())
      {
        uint64_t v11 = [(MNTrafficIncidentAlert *)self originalRoute];
        long long v12 = [v14 routeMatch];
        objc_msgSend(v11, "distanceFromPoint:toPoint:", objc_msgSend(v12, "routeCoordinate"), *(void *)&self->_incidentCoordinate);
        self->_distanceToIncident = v13;
      }
      else
      {
        self->_distanceToIncident = 0.0;
      }
      id v4 = v14;
    }
  }
  else
  {
    self->_distanceToIncident = -1.0;
  }
}

- (void)updateAlertIDWithAlert:(id)a3
{
  id v4 = [a3 alertID];
  alertID = self->_alertID;
  self->_alertID = v4;
  MEMORY[0x1F41817F8](v4, alertID);
}

- (unint64_t)secondsSaved
{
  if ([(MNTrafficIncidentAlert *)self isReroute]
    && [(GEOTrafficBannerText *)self->_geoTrafficBannerText hasSecondsSaved])
  {
    return [(GEOTrafficBannerText *)self->_geoTrafficBannerText secondsSaved];
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int)previousBannerChange
{
  return [(GEOTrafficBannerText *)self->_geoTrafficBannerText previousBannerChange];
}

- (GEOPBTransitArtwork)artwork
{
  v3 = [(GEOTrafficBannerText *)self->_geoTrafficBannerText artworkOverride];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(GEORouteIncident *)self->_incident artwork];
  }
  int v6 = v5;

  return (GEOPBTransitArtwork *)v6;
}

- (id)_initWithGeoTrafficBannerText:(id)a3 mainRouteInfo:(id)a4 alternateRouteInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MNTrafficIncidentAlert;
  long long v12 = [(MNTrafficIncidentAlert *)&v23 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F29128], "_geo_dataForUUID");
    alertID = v12->_alertID;
    v12->_alertID = (NSData *)v13;

    long long v15 = [v10 etaRoute];
    uint64_t v16 = [v15 etauResponseID];
    uint64_t v17 = objc_msgSend(v16, "_geo_data");
    etaResponseID = v12->_etaResponseID;
    v12->_etaResponseID = (NSData *)v17;

    v12->_unint64_t alertType = -[MNTrafficIncidentAlert _alertTypeForGeoBannerStyle:](v12, "_alertTypeForGeoBannerStyle:", [v9 bannerStyle]);
    objc_storeStrong((id *)&v12->_geoTrafficBannerText, a3);
    objc_storeStrong((id *)&v12->_mainRouteInfo, a4);
    objc_storeStrong((id *)&v12->_alternateRouteInfo, a5);
    uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
    alertDate = v12->_alertDate;
    v12->_alertDate = (NSDate *)v19;

    v12->_isAutomaticReroute = GEOConfigGetBOOL();
    [(MNTrafficIncidentAlert *)v12 _initRouteCoordinates];
    v12->_distanceToIncident = -1.0;
    [(MNTrafficIncidentAlert *)v12 _populateServerFields:v9];
    [(MNTrafficIncidentAlert *)v12 _populateButtonActionAndTitles:v9];
    [(MNTrafficIncidentAlert *)v12 _populateIncidentDetails:v9];
    v21 = v12;
  }

  return v12;
}

- (void)_initRouteCoordinates
{
  v3 = [(MNActiveRouteInfo *)self->_mainRouteInfo route];
  id v4 = [v3 legs];
  id v5 = [v4 firstObject];

  int v6 = [(MNActiveRouteInfo *)self->_mainRouteInfo etaRoute];

  if (v6)
  {
    uint64_t v7 = [(MNActiveRouteInfo *)self->_mainRouteInfo route];
    uint64_t v8 = [v7 legs];
    uint64_t v9 = [v8 count];
    id v10 = [(MNActiveRouteInfo *)self->_mainRouteInfo etaRoute];
    id v11 = [v10 legs];
    unint64_t v12 = v9 - [v11 count];

    uint64_t v13 = [(MNActiveRouteInfo *)self->_mainRouteInfo route];
    id v14 = [v13 legs];
    unint64_t v15 = [v14 count];

    if (v12 >= v15)
    {
      uint64_t v19 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_ERROR, "Error finding leg index from which the ETAU request was made. Defaulting to first leg of route.", buf, 2u);
      }
    }
    else
    {
      uint64_t v16 = [(MNActiveRouteInfo *)self->_mainRouteInfo route];
      uint64_t v17 = [v16 legs];
      uint64_t v18 = [v17 objectAtIndexedSubscript:v12];

      id v5 = (void *)v18;
    }
  }
  uint64_t v20 = [(MNActiveRouteInfo *)self->_mainRouteInfo route];
  [v20 distance];
  self->_distanceToDestination = v21;

  if ([(GEOTrafficBannerText *)self->_geoTrafficBannerText hasTriggerRange])
  {
    uint64_t v65 = MEMORY[0x1E4F143A8];
    uint64_t v66 = 3221225472;
    v67 = __47__MNTrafficIncidentAlert__initRouteCoordinates__block_invoke;
    v68 = &unk_1E60FBA18;
    v69 = self;
    id v70 = v5;
    v22 = (void (**)(void, void))MEMORY[0x1BA99B3A0](&v65);
    objc_super v23 = [(GEOTrafficBannerText *)self->_geoTrafficBannerText triggerRange];
    ((void (**)(void, void *))v22)[2](v22, v23);
    uint64_t v24 = (MNTrafficIncidentTriggerRange *)objc_claimAutoreleasedReturnValue();
    triggerRange = self->_triggerRange;
    self->_triggerRange = v24;

    uint64_t v26 = [(GEOTrafficBannerText *)self->_geoTrafficBannerText progressBarRange];
    ((void (**)(void, void *))v22)[2](v22, v26);
    v27 = (MNTrafficIncidentTriggerRange *)objc_claimAutoreleasedReturnValue();
    progressBarTriggerRange = self->_progressBarTriggerRange;
    self->_progressBarTriggerRange = v27;

    self->_priority = [(GEOTrafficBannerText *)self->_geoTrafficBannerText priority];
    self->_minDisplayTime = (double)[(GEOTrafficBannerText *)self->_geoTrafficBannerText minDisplayTime];
    self->_overlapDelayTime = (double)[(GEOTrafficBannerText *)self->_geoTrafficBannerText overlapDelayTime];
    self->_persistAcrossUpdates = [(GEOTrafficBannerText *)self->_geoTrafficBannerText preserveBannerInUpdates];
    if (GEOConfigGetBOOL())
    {
      id v29 = [(GEOTrafficBannerText *)self->_geoTrafficBannerText bannerId];
      v30 = [@"MNIncidentAlert_FakeDodgeball" description];
      char v31 = [v29 hasPrefix:v30];

      if ((v31 & 1) == 0) {
        self->_priority = GEOConfigGetUInteger();
      }
    }
    v32 = [(MNTrafficIncidentTriggerRange *)self->_triggerRange hideTriggerPoint];
    if (!v32)
    {
      if (self->_progressBarTriggerRange || ![(MNTrafficIncidentAlert *)self isReroute])
      {
        v32 = 0;
      }
      else
      {
        if (!self->_alternateRouteInfo) {
          goto LABEL_35;
        }
        v32 = objc_alloc_init(MNRouteDivergenceFinder);
        id v33 = [(MNActiveRouteInfo *)self->_mainRouteInfo route];
        long long v34 = [(MNActiveRouteInfo *)self->_alternateRouteInfo route];
        long long v35 = [(MNRouteDivergenceFinder *)v32 findFirstDivergenceBetweenRoute:v33 andRoute:v34];
        long long v36 = [v35 firstObject];

        uint64_t v37 = [v36 routeCoordinate];
        v38 = [MNTrafficIncidentTriggerRange alloc];
        v39 = [(MNTrafficIncidentTriggerRange *)self->_triggerRange showTriggerPoint];
        __int16 v40 = [[MNTrafficIncidentTriggerPoint alloc] initWithReferenceCoordinate:v37 allowsShifting:0];
        [(MNTrafficIncidentTriggerRange *)self->_triggerRange displayTime];
        v41 = -[MNTrafficIncidentTriggerRange initWithTriggerPointShow:hide:displayTime:](v38, "initWithTriggerPointShow:hide:displayTime:", v39, v40);
        __int16 v42 = self->_triggerRange;
        self->_triggerRange = v41;
      }
    }

LABEL_35:
    v60 = self->_progressBarTriggerRange;
    if (v60)
    {
      v61 = [(MNTrafficIncidentTriggerRange *)v60 showTriggerPoint];
      [v61 referenceCoordinate];
      v62 = [(MNTrafficIncidentTriggerRange *)self->_triggerRange showTriggerPoint];
      [v62 referenceCoordinate];
      self->_shouldShowTimer = GEOPolylineCoordinateEqual();

      if (!self->_shouldShowTimer)
      {
LABEL_40:

        goto LABEL_41;
      }
      [(MNTrafficIncidentTriggerRange *)self->_progressBarTriggerRange displayTime];
    }
    else
    {
      self->_shouldShowTimer = 0;
      double v63 = 0.0;
    }
    self->_alertDisplayDuration = v63;
    goto LABEL_40;
  }
  self->_startValidCoordinateRange = 0;
  if ([(GEOTrafficBannerText *)self->_geoTrafficBannerText hasShowAtDistance])
  {
    int v43 = [(MNActiveRouteInfo *)self->_mainRouteInfo route];
    self->_startValidCoordinateRange = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v43, "routeCoordinateForDistance:beforeRouteCoordinate:", objc_msgSend(v5, "endRouteCoordinate"), (double)-[GEOTrafficBannerText showAtDistance](self->_geoTrafficBannerText, "showAtDistance"));
  }
  v44 = [(MNActiveRouteInfo *)self->_mainRouteInfo route];
  self->_endValidCoordinateRange = ($604ECB7A8067A7300F159AE8ED6889F8)[v44 endRouteCoordinate];

  if ([(GEOTrafficBannerText *)self->_geoTrafficBannerText hasHideAtDistance])
  {
    uint64_t v45 = [(MNActiveRouteInfo *)self->_mainRouteInfo route];
    self->_endValidCoordinateRange = ($604ECB7A8067A7300F159AE8ED6889F8)-[MNRouteDivergenceFinder routeCoordinateForDistance:beforeRouteCoordinate:](v45, "routeCoordinateForDistance:beforeRouteCoordinate:", [v5 endRouteCoordinate], (double)-[GEOTrafficBannerText hideAtDistance](self->_geoTrafficBannerText, "hideAtDistance"));
LABEL_25:

    goto LABEL_26;
  }
  if ([(MNTrafficIncidentAlert *)self isReroute] && self->_alternateRouteInfo)
  {
    uint64_t v45 = objc_alloc_init(MNRouteDivergenceFinder);
    v46 = [(MNActiveRouteInfo *)self->_mainRouteInfo route];
    v47 = [(MNActiveRouteInfo *)self->_alternateRouteInfo route];
    v48 = [(MNRouteDivergenceFinder *)v45 findFirstDivergenceBetweenRoute:v46 andRoute:v47];
    v49 = [v48 firstObject];

    $604ECB7A8067A7300F159AE8ED6889F8 v50 = ($604ECB7A8067A7300F159AE8ED6889F8)[v49 routeCoordinate];
    if (GEOPolylineCoordinateIsValid()) {
      self->_endValidCoordinateRange = v50;
    }

    goto LABEL_25;
  }
LABEL_26:
  alternateRouteInfo = self->_alternateRouteInfo;
  if (alternateRouteInfo)
  {
    v52 = [(MNActiveRouteInfo *)alternateRouteInfo route];
    unsigned int v53 = [v52 pointCount] - 1;
  }
  else
  {
    unsigned int v53 = 0;
  }
  self->_alternateEndValidCoordinateRange.index = v53;
  self->_alternateEndValidCoordinateRange.offset = 0.0;
  if ([(MNTrafficIncidentAlert *)self isAutomaticReroute] && self->_alternateRouteInfo)
  {
    v54 = [(MNActiveRouteInfo *)self->_mainRouteInfo route];
    [v54 pointAtRouteCoordinate:*(void *)&self->_endValidCoordinateRange];
    double v56 = v55;
    double v58 = v57;

    v59 = [(MNActiveRouteInfo *)self->_alternateRouteInfo route];
    self->_alternateEndValidCoordinateRange = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v59, "closestPointOnRoute:", v56, v58);
  }
  self->_shouldShowTimer = [(GEOTrafficBannerText *)self->_geoTrafficBannerText shouldShowTimer];
  self->_alertDisplayDuration = (double)[(GEOTrafficBannerText *)self->_geoTrafficBannerText alertDurationSeconds];
LABEL_41:
  self->_incidentCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)*MEMORY[0x1E4F64198];
  if ([(GEOTrafficBannerText *)self->_geoTrafficBannerText hasIncidentDistance])
  {
    v64 = [(MNActiveRouteInfo *)self->_mainRouteInfo route];
    self->_incidentCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v64, "routeCoordinateForDistance:beforeRouteCoordinate:", objc_msgSend(v5, "endRouteCoordinate"), (double)-[GEOTrafficBannerText incidentDistance](self->_geoTrafficBannerText, "incidentDistance"));
  }
}

MNTrafficIncidentTriggerRange *__47__MNTrafficIncidentAlert__initRouteCoordinates__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3)
  {
    id v14 = 0;
    goto LABEL_9;
  }
  id v5 = [v3 showAtPoint];
  uint64_t v6 = [v4 hideAtPoint];
  uint64_t v7 = (void *)v6;
  if (!v5)
  {
    id v10 = 0;
    if (v6) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v13 = 0;
    goto LABEL_8;
  }
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 96) route];
  uint64_t v9 = objc_msgSend(v8, "routeCoordinateForDistance:beforeRouteCoordinate:", objc_msgSend(*(id *)(a1 + 40), "endRouteCoordinate"), (double)objc_msgSend(v5, "referenceOffsetCm") / 100.0);

  id v10 = -[MNTrafficIncidentTriggerPoint initWithReferenceCoordinate:allowsShifting:]([MNTrafficIncidentTriggerPoint alloc], "initWithReferenceCoordinate:allowsShifting:", v9, [v5 allowsShifting]);
  if (!v7) {
    goto LABEL_7;
  }
LABEL_4:
  id v11 = [*(id *)(*(void *)(a1 + 32) + 96) route];
  uint64_t v12 = objc_msgSend(v11, "routeCoordinateForDistance:beforeRouteCoordinate:", objc_msgSend(*(id *)(a1 + 40), "endRouteCoordinate"), (double)objc_msgSend(v7, "referenceOffsetCm") / 100.0);

  uint64_t v13 = -[MNTrafficIncidentTriggerPoint initWithReferenceCoordinate:allowsShifting:]([MNTrafficIncidentTriggerPoint alloc], "initWithReferenceCoordinate:allowsShifting:", v12, [v7 allowsShifting]);
LABEL_8:
  id v14 = -[MNTrafficIncidentTriggerRange initWithTriggerPointShow:hide:displayTime:]([MNTrafficIncidentTriggerRange alloc], "initWithTriggerPointShow:hide:displayTime:", v10, v13, (double)[v4 displayTime]);

LABEL_9:
  return v14;
}

- (unint64_t)_alertTypeForGeoBannerStyle:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 < 8) {
    return qword_1B5542D08[a3];
  }
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v9 = "-[MNTrafficIncidentAlert _alertTypeForGeoBannerStyle:]";
    __int16 v10 = 2080;
    id v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNTrafficIncidentAlert.m";
    __int16 v12 = 1024;
    int v13 = 557;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
  }

  uint64_t v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
    uint64_t v7 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "(%@) banner style not supported on client yet", buf, 0xCu);
  }
  return 0;
}

- (id)_dynamicStringValues
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(MNTrafficIncidentAlert *)self distanceToIncident];
  if (v4 >= 0.0)
  {
    [(MNTrafficIncidentAlert *)self distanceToIncident];
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:vcvtpd_u64_f64(v5)];
    [v3 setObject:v6 forKeyedSubscript:@"{distance}"];
  }
  if ([(MNTrafficIncidentAlert *)self isReroute])
  {
    unint64_t v7 = [(MNTrafficIncidentAlert *)self secondsSaved];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:v7];
      [v3 setObject:v8 forKeyedSubscript:@"{duration}"];
    }
  }
  if ([v3 count]) {
    uint64_t v9 = v3;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  return v10;
}

- (id)description
{
  id v3 = [(MNTrafficIncidentAlert *)self originalRoute];
  [v3 pointAtRouteCoordinate:*(void *)&self->_startValidCoordinateRange];
  uint64_t v5 = v4;
  uint64_t v7 = v6;

  uint64_t v8 = [(MNTrafficIncidentAlert *)self originalRoute];
  [v8 pointAtRouteCoordinate:*(void *)&self->_endValidCoordinateRange];
  uint64_t v10 = v9;
  uint64_t v12 = v11;

  int v13 = (void *)MEMORY[0x1E4F28E78];
  if (self->_triggerRange)
  {
    uint64_t v14 = [(MNTrafficIncidentAlert *)self _stringForAlertType:self->_alertType];
    unint64_t v15 = objc_msgSend(MEMORY[0x1E4F29128], "_geo_uuidForData:", self->_alertID);
    uint64_t v16 = [v13 stringWithFormat:@"%@, %@ (%@) | minDisplayTime: %lf | overlapDelayTime: %lf | priority: %d | triggerRange: %@ | progressBarTriggerRange: %@ | [%@]", v14, v15, self->_bannerID, *(void *)&self->_minDisplayTime, *(void *)&self->_overlapDelayTime, self->_priority, self->_triggerRange, self->_progressBarTriggerRange, self->_analyticsMessage];
  }
  else
  {
    uint64_t v14 = [(MNTrafficIncidentAlert *)self _stringForAlertType:self->_alertType];
    unint64_t v15 = objc_msgSend(MEMORY[0x1E4F29128], "_geo_uuidForData:", self->_alertID);
    bannerID = self->_bannerID;
    uint64_t v18 = GEOPolylineCoordinateAsShortString();
    uint64_t v19 = GEOPolylineCoordinateAsShortString();
    uint64_t v16 = [v13 stringWithFormat:@"%@, %@ (%@) | [%@] (%f, %f) to [%@] (%f, %f) | [%@]", v14, v15, bannerID, v18, v5, v7, v19, v10, v12, self->_analyticsMessage];
  }
  if (GEOPolylineCoordinateIsValid())
  {
    uint64_t v20 = GEOPolylineCoordinateAsShortString();
    [v16 appendFormat:@" | Incident: [%@]", v20];
  }
  return v16;
}

- (id)_stringForAlertType:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return @"None";
  }
  else {
    return off_1E60FBA78[a3 - 1];
  }
}

- (MNTrafficIncidentAlert)initWithCoder:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)MNTrafficIncidentAlert;
  uint64_t v5 = [(MNTrafficIncidentAlert *)&v44 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_alertID"];
    alertID = v5->_alertID;
    v5->_alertID = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_etaResponseID"];
    etaResponseID = v5->_etaResponseID;
    v5->_etaResponseID = (NSData *)v8;

    v5->_unint64_t alertType = [v4 decodeIntegerForKey:@"_alertType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_geoTrafficBannerText"];
    geoTrafficBannerText = v5->_geoTrafficBannerText;
    v5->_geoTrafficBannerText = (GEOTrafficBannerText *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mainRouteInfo"];
    mainRouteInfo = v5->_mainRouteInfo;
    v5->_mainRouteInfo = (MNActiveRouteInfo *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_alternateRouteInfo"];
    alternateRouteInfo = v5->_alternateRouteInfo;
    v5->_alternateRouteInfo = (MNActiveRouteInfo *)v14;

    v5->_startValidCoordinateRange.index = [v4 decodeIntegerForKey:@"_startValidCoordinateRange.index"];
    [v4 decodeDoubleForKey:@"_startValidCoordinateRange.offset"];
    *(float *)&double v16 = v16;
    v5->_startValidCoordinateRange.offset = *(float *)&v16;
    v5->_endValidCoordinateRange.index = [v4 decodeIntegerForKey:@"_endValidCoordinateRange.index"];
    [v4 decodeDoubleForKey:@"_endValidCoordinateRange.offset"];
    *(float *)&double v17 = v17;
    v5->_endValidCoordinateRange.offset = *(float *)&v17;
    v5->_incidentCoordinate.index = [v4 decodeIntegerForKey:@"_incidentCoordinate.index"];
    [v4 decodeDoubleForKey:@"_incidentCoordinate.offset"];
    *(float *)&double v18 = v18;
    v5->_incidentCoordinate.offset = *(float *)&v18;
    v5->_alternateEndValidCoordinateRange.index = [v4 decodeIntegerForKey:@"_alternateEndValidCoordinateRange.index"];
    [v4 decodeDoubleForKey:@"_alternateEndValidCoordinateRange.offset"];
    *(float *)&double v19 = v19;
    v5->_alternateEndValidCoordinateRange.offset = *(float *)&v19;
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_triggerRange"];
    triggerRange = v5->_triggerRange;
    v5->_triggerRange = (MNTrafficIncidentTriggerRange *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_progressBarTriggerRange"];
    progressBarTriggerRange = v5->_progressBarTriggerRange;
    v5->_progressBarTriggerRange = (MNTrafficIncidentTriggerRange *)v22;

    v5->_priority = [v4 decodeIntegerForKey:@"_priority"];
    [v4 decodeDoubleForKey:@"_minDisplayTime"];
    v5->_minDisplayTime = v24;
    [v4 decodeDoubleForKey:@"_overlapDelayTime"];
    v5->_overlapDelayTime = v25;
    v5->_persistAcrossUpdates = [v4 decodeBoolForKey:@"_persistAcrossUpdates"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_alertDate"];
    alertDate = v5->_alertDate;
    v5->_alertDate = (NSDate *)v26;

    [v4 decodeDoubleForKey:@"_distanceToIncident"];
    v5->_distanceToIncident = v28;
    v5->_isAutomaticReroute = [v4 decodeBoolForKey:@"_isAutomaticReroute"];
    v5->_shouldShowTimer = [v4 decodeBoolForKey:@"_shouldShowTimer"];
    [v4 decodeDoubleForKey:@"_alertDisplayDuration"];
    v5->_alertDisplayDuration = v29;
    v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"_buttonActionTitles"];
    buttonActionTitles = v5->_buttonActionTitles;
    v5->_buttonActionTitles = (NSArray *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_analyticsMessage"];
    analyticsMessage = v5->_analyticsMessage;
    v5->_analyticsMessage = (NSString *)v35;

    [v4 decodeDoubleForKey:@"_distanceToDestination"];
    v5->_distanceToDestination = v37;
    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bannerID"];
    bannerID = v5->_bannerID;
    v5->_bannerID = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_incident"];
    incident = v5->_incident;
    v5->_incident = (GEORouteIncident *)v40;

    __int16 v42 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  alertID = self->_alertID;
  id v5 = a3;
  [v5 encodeObject:alertID forKey:@"_alertID"];
  [v5 encodeObject:self->_etaResponseID forKey:@"_etaResponseID"];
  [v5 encodeInteger:self->_alertType forKey:@"_alertType"];
  [v5 encodeObject:self->_geoTrafficBannerText forKey:@"_geoTrafficBannerText"];
  [v5 encodeObject:self->_mainRouteInfo forKey:@"_mainRouteInfo"];
  [v5 encodeObject:self->_alternateRouteInfo forKey:@"_alternateRouteInfo"];
  [v5 encodeInteger:self->_startValidCoordinateRange.index forKey:@"_startValidCoordinateRange.index"];
  [v5 encodeDouble:@"_startValidCoordinateRange.offset" forKey:self->_startValidCoordinateRange.offset];
  [v5 encodeInteger:self->_endValidCoordinateRange.index forKey:@"_endValidCoordinateRange.index"];
  [v5 encodeDouble:@"_endValidCoordinateRange.offset" forKey:self->_endValidCoordinateRange.offset];
  [v5 encodeInteger:self->_incidentCoordinate.index forKey:@"_incidentCoordinate.index"];
  [v5 encodeDouble:@"_incidentCoordinate.offset" forKey:self->_incidentCoordinate.offset];
  [v5 encodeInteger:self->_alternateEndValidCoordinateRange.index forKey:@"_alternateEndValidCoordinateRange.index"];
  [v5 encodeDouble:@"_alternateEndValidCoordinateRange.offset" forKey:self->_alternateEndValidCoordinateRange.offset];
  [v5 encodeObject:self->_triggerRange forKey:@"_triggerRange"];
  [v5 encodeObject:self->_progressBarTriggerRange forKey:@"_progressBarTriggerRange"];
  [v5 encodeInteger:self->_priority forKey:@"_priority"];
  [v5 encodeDouble:@"_minDisplayTime" forKey:self->_minDisplayTime];
  [v5 encodeDouble:@"_overlapDelayTime" forKey:self->_overlapDelayTime];
  [v5 encodeBool:self->_persistAcrossUpdates forKey:@"_persistAcrossUpdates"];
  [v5 encodeObject:self->_alertDate forKey:@"_alertDate"];
  [v5 encodeDouble:@"_distanceToIncident" forKey:self->_distanceToIncident];
  [v5 encodeBool:self->_isAutomaticReroute forKey:@"_isAutomaticReroute"];
  [v5 encodeBool:self->_shouldShowTimer forKey:@"_shouldShowTimer"];
  [v5 encodeDouble:@"_alertDisplayDuration" forKey:self->_alertDisplayDuration];
  [v5 encodeObject:self->_buttonActionTitles forKey:@"_buttonActionTitles"];
  [v5 encodeObject:self->_analyticsMessage forKey:@"_analyticsMessage"];
  [v5 encodeDouble:@"_distanceToDestination" forKey:self->_distanceToDestination];
  [v5 encodeObject:self->_bannerID forKey:@"_bannerID"];
  [v5 encodeObject:self->_incident forKey:@"_incident"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_populateServerFields:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = NSString;
  uint64_t v6 = [v4 bannerDescription];
  objc_msgSend(v5, "_navigation_stringForServerFormattedString:", v6);
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  bannerDescription = self->_bannerDescription;
  self->_bannerDescription = v7;

  uint64_t v9 = [v4 bannerId];
  bannerID = self->_bannerID;
  self->_bannerID = v9;

  uint64_t v11 = [v4 eventInfo];
  eventInfo = self->_eventInfo;
  self->_eventInfo = v11;

  int v13 = [v4 analyticsMessageValue];
  analyticsMessage = self->_analyticsMessage;
  self->_analyticsMessage = v13;

  if (!self->_bannerID)
  {
    unint64_t v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138477827;
      id v17 = v4;
      _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_ERROR, "Received a traffic banner text which is missing a banner ID: %{private}@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_populateButtonActionAndTitles:(id)a3
{
  id v17 = self;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [v3 buttons];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasAction", v17) && objc_msgSend(v10, "hasText"))
        {
          uint64_t v11 = [MNButtonActionTitle alloc];
          uint64_t v12 = (int)[v10 action];
          int v13 = [v10 text];
          uint64_t v14 = -[MNButtonActionTitle initWithAction:withTitle:buttonDisplay:](v11, "initWithAction:withTitle:buttonDisplay:", v12, v13, [v10 buttonDisplay]);

          [v4 addObject:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  uint64_t v15 = [v4 copy];
  buttonActionTitles = v17->_buttonActionTitles;
  v17->_buttonActionTitles = (NSArray *)v15;
}

- (void)_populateIncidentDetails:(id)a3
{
  if ([(GEOTrafficBannerText *)self->_geoTrafficBannerText hasIncidentIndex])
  {
    unsigned int v4 = [(GEOTrafficBannerText *)self->_geoTrafficBannerText incidentIndex];
    id v5 = [(MNActiveRouteInfo *)self->_mainRouteInfo traffic];
    id v9 = [v5 routeIncidents];

    if ([v9 count] > (unint64_t)v4)
    {
      uint64_t v6 = [v9 objectAtIndexedSubscript:v4];
      uint64_t v7 = [v6 incident];
      incident = self->_incident;
      self->_incident = v7;
    }
  }
}

- (NSData)alertID
{
  return self->_alertID;
}

- (NSData)etaResponseID
{
  return self->_etaResponseID;
}

- (NSString)bannerID
{
  return self->_bannerID;
}

- (unint64_t)alertType
{
  return self->_alertType;
}

- (BOOL)shouldShowTimer
{
  return self->_shouldShowTimer;
}

- (void)setShouldShowTimer:(BOOL)a3
{
  self->_shouldShowTimer = a3;
}

- (NSString)bannerDescription
{
  return self->_bannerDescription;
}

- (double)distanceToIncident
{
  return self->_distanceToIncident;
}

- (void)setDistanceToIncident:(double)a3
{
  self->_distanceToIncident = a3;
}

- (GEORouteIncident)incident
{
  return self->_incident;
}

- (MNActiveRouteInfo)mainRouteInfo
{
  return self->_mainRouteInfo;
}

- (MNActiveRouteInfo)alternateRouteInfo
{
  return self->_alternateRouteInfo;
}

- ($212C09783140BCCD23384160D545CE0D)incidentCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_incidentCoordinate;
}

- ($212C09783140BCCD23384160D545CE0D)startValidCoordinateRange
{
  return ($212C09783140BCCD23384160D545CE0D)self->_startValidCoordinateRange;
}

- ($212C09783140BCCD23384160D545CE0D)endValidCoordinateRange
{
  return ($212C09783140BCCD23384160D545CE0D)self->_endValidCoordinateRange;
}

- ($212C09783140BCCD23384160D545CE0D)alternateEndValidCoordinateRange
{
  return ($212C09783140BCCD23384160D545CE0D)self->_alternateEndValidCoordinateRange;
}

- (MNTrafficIncidentTriggerRange)triggerRange
{
  return self->_triggerRange;
}

- (MNTrafficIncidentTriggerRange)progressBarTriggerRange
{
  return self->_progressBarTriggerRange;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (double)minDisplayTime
{
  return self->_minDisplayTime;
}

- (double)overlapDelayTime
{
  return self->_overlapDelayTime;
}

- (BOOL)persistAcrossUpdates
{
  return self->_persistAcrossUpdates;
}

- (NSDate)alertDate
{
  return self->_alertDate;
}

- (void)setAlertDisplayDuration:(double)a3
{
  self->_alertDisplayDuration = a3;
}

- (BOOL)isAutomaticReroute
{
  return self->_isAutomaticReroute;
}

- (NSString)analyticsMessage
{
  return self->_analyticsMessage;
}

- (double)distanceToDestination
{
  return self->_distanceToDestination;
}

- (void)setDistanceToDestination:(double)a3
{
  self->_distanceToDestination = a3;
}

- (NSData)eventInfo
{
  return self->_eventInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventInfo, 0);
  objc_storeStrong((id *)&self->_alertDate, 0);
  objc_storeStrong((id *)&self->_progressBarTriggerRange, 0);
  objc_storeStrong((id *)&self->_triggerRange, 0);
  objc_storeStrong((id *)&self->_alternateRouteInfo, 0);
  objc_storeStrong((id *)&self->_mainRouteInfo, 0);
  objc_storeStrong((id *)&self->_incident, 0);
  objc_storeStrong((id *)&self->_bannerDescription, 0);
  objc_storeStrong((id *)&self->_bannerID, 0);
  objc_storeStrong((id *)&self->_etaResponseID, 0);
  objc_storeStrong((id *)&self->_alertID, 0);
  objc_storeStrong((id *)&self->_analyticsMessage, 0);
  objc_storeStrong((id *)&self->_buttonActionTitles, 0);
  objc_storeStrong((id *)&self->_geoTrafficBannerText, 0);
}

- (double)newEstimatedTime
{
  v2 = [(MNActiveRouteInfo *)self->_alternateRouteInfo route];
  double v3 = (double)[v2 expectedTime];

  return v3;
}

- (double)oldEstimatedTime
{
  v2 = [(MNActiveRouteInfo *)self->_mainRouteInfo etaRoute];
  [v2 travelDuration];
  double v4 = v3;

  return v4;
}

- (double)oldHistoricTime
{
  v2 = [(MNActiveRouteInfo *)self->_mainRouteInfo etaRoute];
  [v2 historicTravelDuration];
  double v4 = v3;

  return v4;
}

- (NSMutableArray)oldRouteIncidents
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v3 = [(MNActiveRouteInfo *)self->_mainRouteInfo traffic];
  double v4 = [v3 routeIncidents];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (!v7)
        {
          uint64_t v11 = (void *)MEMORY[0x1E4F1CA48];
          uint64_t v12 = [(MNActiveRouteInfo *)self->_mainRouteInfo traffic];
          int v13 = [v12 routeIncidents];
          uint64_t v7 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v13, "count"));
        }
        uint64_t v14 = [v10 incident];

        if (v14)
        {
          uint64_t v15 = [v10 incident];
          [v7 addObject:v15];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (NSMutableArray *)v7;
}

+ (id)createFakeTrafficBannerTextWithType:(unint64_t)a3 mainRouteInfo:(id)a4 alternateRouteInfo:(id)a5 incidentDistance:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F64AE0]);
  uint64_t v12 = NSString;
  int v13 = objc_opt_new();
  uint64_t v14 = [v13 description];
  uint64_t v15 = [v12 stringWithFormat:@"%@_%@", @"MNIncidentAlert_FakeDodgeball", v14];
  [v11 setBannerId:v15];

  [v11 setIncidentDistance:v6];
  id v16 = objc_alloc_init(MEMORY[0x1E4F64AE8]);
  [v16 setAction:1];
  id v17 = objc_alloc_init(MEMORY[0x1E4F645B8]);
  [v16 setText:v17];

  long long v18 = [v16 text];
  [v18 addFormatString:@"Dismiss"];

  [v11 addButton:v16];
  long long v19 = 0;
  unint64_t v20 = a3 - 1;
  long long v21 = 0;
  uint64_t v22 = 0;
  switch(v20)
  {
    case 0uLL:
      if (v10) {
        long long v19 = @"Road closed ahead. I-280 N at Hwy 84. Your route has been updated.";
      }
      else {
        long long v19 = @"Road closed ahead. I-280 N at Hwy 84.";
      }
      if (v10) {
        long long v21 = @"I-280 N at Hwy 84\nYour route has been updated (debug)";
      }
      else {
        long long v21 = @"I-280 N at Hwy 84 (debug)";
      }
      [v11 setBannerStyle:3];
      uint64_t v22 = @"Road Closed Ahead";
      break;
    case 1uLL:
      uint64_t v23 = NSString;
      int v24 = [v11 incidentDistance];
      double v25 = &off_1B5542000;
      LODWORD(v25) = llround((double)(v24 + 200) * 0.000621371192);
      long long v21 = [v23 stringWithFormat:@"In about %d miles, I-280 N\nYou're still on the fastest route. (debug)", v25];
      [v11 setBannerStyle:2];
      uint64_t v22 = @"Accident Ahead";
      long long v19 = @"There are unexpected delays ahead in 2 miles.";
      break;
    case 2uLL:
      uint64_t v26 = [v9 route];
      uint64_t v27 = [v26 expectedTime];
      double v28 = [v10 route];
      uint64_t v29 = v27 - [v28 expectedTime];

      objc_msgSend(NSString, "_navigation_spokenStringWithSeconds:abbreviated:", v29, 0);
      v30 = v51 = v10;
      uint64_t v22 = [NSString stringWithFormat:@"Save %@", v30];
      uint64_t v31 = NSString;
      v32 = [v51 route];
      [v32 name];
      uint64_t v33 = v50 = v9;
      long long v21 = [v31 stringWithFormat:@"Via %@ (debug)", v33];

      long long v19 = [NSString stringWithFormat:@"There are unexpected delays ahead. You can save %@ by taking a different route.", v30];
      [v11 setBannerStyle:1];
      long long v34 = [v16 text];
      [v34 clearFormatStrings];

      uint64_t v35 = [v16 text];
      [v35 addFormatString:@"No Thanks"];

      id v36 = objc_alloc_init(MEMORY[0x1E4F64AE8]);
      [v36 setAction:2];
      id v37 = objc_alloc_init(MEMORY[0x1E4F645B8]);
      [v36 setText:v37];

      uint64_t v38 = [v36 text];
      [v38 addFormatString:@"OK"];

      [v11 addButton:v36];
      [v11 setDefaultButtonIndex:1];

      id v9 = v50;
      id v10 = v51;
      break;
    case 4uLL:
      [v11 setBannerStyle:6];
      uint64_t v22 = @"Low battery charge";
      long long v21 = @"There are no charging stations nearby, you're stranded. (debug)";
      long long v19 = @"There are no charging stations nearby, you're stranded.";
      break;
    case 5uLL:
      [v11 setBannerStyle:2];
      uint64_t v22 = @"Restricted Zone Ahead";
      long long v21 = @"Vehicles with minimum petrol standard Euro 2, Diesel 5 or a day pass are allowed. (debug)";
      long long v19 = @"Restricted Zone Ahead. Vehicles with minimum petrol standard Euro 2, Diesel 5 or a day pass are allowed. (debug)";
      break;
    case 6uLL:
      [v11 setBannerStyle:7];
      long long v19 = 0;
      long long v21 = 0;
      uint64_t v22 = 0;
      break;
    default:
      break;
  }
  int BOOL = GEOConfigGetBOOL();
  if (v20 <= 1 && BOOL)
  {
    uint64_t Integer = GEOConfigGetInteger();
    [v16 setButtonDisplay:Integer];
    id v41 = objc_alloc_init(MEMORY[0x1E4F645B8]);
    [v16 setText:v41];

    __int16 v42 = [v16 text];
    [v42 addFormatString:@"Cleared"];

    id v43 = objc_alloc_init(MEMORY[0x1E4F64AE8]);
    [v43 setButtonDisplay:Integer];
    [v43 setAction:2];
    id v44 = objc_alloc_init(MEMORY[0x1E4F645B8]);
    [v43 setText:v44];

    uint64_t v45 = [v43 text];
    [v45 addFormatString:@"Still There"];

    [v11 addButton:v43];
    [v11 setDefaultButtonIndex:1];
  }
  if (v22)
  {
    id v46 = objc_alloc_init(MEMORY[0x1E4F645B8]);
    [v46 addFormatString:v22];
    +[MNTrafficIncidentAlert _addDebugArguments:v46];
    [v11 setBannerLargeText:v46];
  }
  if (v21)
  {
    id v47 = objc_alloc_init(MEMORY[0x1E4F645B8]);
    [v47 addFormatString:v21];
    +[MNTrafficIncidentAlert _addDebugArguments:v47];
    [v11 setBannerSmallText:v47];
  }
  if (v19)
  {
    id v48 = objc_alloc_init(MEMORY[0x1E4F645B8]);
    [v48 addFormatString:v19];
    +[MNTrafficIncidentAlert _addDebugArguments:v48];
    [v11 setSpokenPrompt:v48];
  }
  return v11;
}

+ (void)_addDebugArguments:(id)a3
{
  double v3 = (objc_class *)MEMORY[0x1E4F645B0];
  id v4 = a3;
  id v6 = objc_alloc_init(v3);
  [v6 setToken:@"{distance}"];
  [v6 setFormat:1];
  [v6 setValInt1:5000];
  [v4 addFormatArgument:v6];
  id v5 = objc_alloc_init(MEMORY[0x1E4F645B0]);
  [v5 setToken:@"{time}"];
  [v5 setFormat:2];
  [v5 setValInt1:5000];
  [v4 addFormatArgument:v5];
}

@end