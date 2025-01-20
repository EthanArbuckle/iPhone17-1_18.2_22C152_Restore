@interface GEORouteAttributes(MNExtras)
+ (id)defaultRouteAttributesForTransportType:()MNExtras;
- (id)_userPreferences;
- (id)_vehicleSpecifications;
- (uint64_t)supportsDirections;
- (uint64_t)supportsTurnByTurnNavigation;
@end

@implementation GEORouteAttributes(MNExtras)

+ (id)defaultRouteAttributesForTransportType:()MNExtras
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F649A0] defaultRouteAttributes];
  [v4 setMainTransportType:a3];
  if (a3 == 1) {
    uint64_t BOOL = 0;
  }
  else {
    uint64_t BOOL = GEOConfigGetBOOL();
  }
  [v4 setIncludeRoutingPathLeg:BOOL];
  v6 = [MEMORY[0x1E4F64500] sharedConfiguration];
  int v7 = [v6 currentCountrySupportsNavigation];

  if (!v7) {
    goto LABEL_13;
  }
  v8 = [MEMORY[0x1E4F28F80] processInfo];
  int v9 = objc_msgSend(v8, "_navigation_isNavd");

  if (v9) {
    +[MNUserOptionsEngine sharedInstance];
  }
  else {
  v10 = +[MNNavigationService sharedService];
  }
  v11 = [v10 currentVoiceLanguage];
  [v4 setPhoneticLocaleIdentifier:v11];

  v12 = [v4 phoneticLocaleIdentifier];

  if (!v12)
  {
    v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315906;
      v19 = "+[GEORouteAttributes(MNExtras) defaultRouteAttributesForTransportType:]";
      __int16 v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/GEORouteAttributes+MNExtras.m";
      __int16 v22 = 1024;
      int v23 = 80;
      __int16 v24 = 2080;
      v25 = "attributes.phoneticLocaleIdentifier != nil";
      _os_log_impl(&dword_1B542B000, v17, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v18, 0x26u);
    }
  }
  [v4 setIncludeContingencyRoutes:1];
  [v4 setIncludePhonetics:1];
  v13 = [MEMORY[0x1E4F1CA20] currentLocale];
  objc_msgSend(v4, "setUseMetricThreshold:", objc_msgSend(v13, "_navigation_distanceUsesMetricSystem"));

  if ((a3 - 2) < 2)
  {
LABEL_12:
    [v4 addUiContext:4];
LABEL_13:
    switch((int)a3)
    {
      case 0:
        id v14 = objc_alloc_init(MEMORY[0x1E4F64410]);
        [v14 setIncludeHistoricTravelTime:1];
        [v14 setTrafficType:3];
        [v4 setAutomobileOptions:v14];
        goto LABEL_21;
      case 1:
        goto LABEL_15;
      case 2:
        id v14 = objc_alloc_init(MEMORY[0x1E4F64BF0]);
        [v14 setAvoidHills:0];
        [v14 setAvoidStairs:0];
        [v14 setAvoidBusyRoads:0];
        id v15 = objc_alloc_init(MEMORY[0x1E4F64BE8]);
        [v15 setWalkingUserPreferences:v14];
        [v4 setWalkingOptions:v15];
        goto LABEL_20;
      case 3:
        id v14 = objc_alloc_init(MEMORY[0x1E4F64510]);
        [v14 setAvoidStairs:0];
        [v14 setAvoidHills:0];
        [v14 setAvoidBusyRoads:0];
        id v15 = objc_alloc_init(MEMORY[0x1E4F64508]);
        [v15 setCyclingUserPreferences:v14];
        [v4 setCyclingOptions:v15];
LABEL_20:

        goto LABEL_21;
      default:
        goto LABEL_22;
    }
  }
  if (a3 == 1)
  {
LABEL_15:
    id v14 = objc_alloc_init(MEMORY[0x1E4F64AF8]);
    [v14 setPrioritization:0];
    if (GEOConfigGetBOOL()) {
      [v14 setRoutingBehavior:1];
    }
    [v4 setTransitOptions:v14];
LABEL_21:
  }
  else if (!a3)
  {
    goto LABEL_12;
  }
LABEL_22:
  [v4 setRoutePointTypeForTransportType:a3];
  return v4;
}

- (uint64_t)supportsDirections
{
  if ([a1 mainTransportType] == 4) {
    return 0;
  }
  if (([a1 includeRoutingPathLeg] & 1) != 0
    || (uint64_t result = [a1 includeZilchPoints], result))
  {
    uint64_t result = [a1 includeManeuverIcons];
    if (result)
    {
      uint64_t result = [a1 uiContextsCount];
      if (result)
      {
        int v3 = 0;
        unint64_t v4 = 0;
        do
          v3 |= 1 << ([a1 uiContextAtIndex:v4++] - 1);
        while (v4 < [a1 uiContextsCount]);
        return (~v3 & 3) == 0;
      }
    }
  }
  return result;
}

- (uint64_t)supportsTurnByTurnNavigation
{
  if (![a1 supportsDirections]) {
    return 0;
  }
  v2 = [a1 phoneticLocaleIdentifier];
  uint64_t v3 = [v2 length];

  if (!v3 || ![a1 includePhonetics]) {
    return 0;
  }
  if (![a1 uiContextsCount]) {
    return 1;
  }
  unint64_t v4 = 0;
  do
  {
    unsigned int v5 = [a1 uiContextAtIndex:v4];
    uint64_t v6 = (v5 >> 2) & 1;
    if ((v5 & 4) == 0) {
      break;
    }
    ++v4;
  }
  while (v4 < [a1 uiContextsCount]);
  return v6;
}

- (id)_vehicleSpecifications
{
  v2 = [a1 automobileOptions];

  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F64410]);
    [a1 setAutomobileOptions:v3];
  }
  unint64_t v4 = [a1 automobileOptions];
  unsigned int v5 = [v4 vehicleSpecifications];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F64BB8]);
    int v7 = [a1 automobileOptions];
    [v7 setVehicleSpecifications:v6];
  }
  v8 = [a1 automobileOptions];
  int v9 = [v8 vehicleSpecifications];

  return v9;
}

- (id)_userPreferences
{
  v2 = [a1 automobileOptions];

  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F64410]);
    [a1 setAutomobileOptions:v3];
  }
  unint64_t v4 = [a1 automobileOptions];
  unsigned int v5 = [v4 userPreferences];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F64B88]);
    int v7 = [a1 automobileOptions];
    [v7 setUserPreferences:v6];
  }
  v8 = [a1 automobileOptions];
  int v9 = [v8 userPreferences];

  return v9;
}

@end