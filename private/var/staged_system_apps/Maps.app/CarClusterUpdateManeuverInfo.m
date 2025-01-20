@interface CarClusterUpdateManeuverInfo
+ (id)_enumProperties;
+ (id)_integersKeyed;
+ (id)_maneuverDescriptionForGuidanceEvent:(id)a3 routeStep:(id)a4;
+ (id)maneuverUpdateWithGuidanceEvent:(id)a3 routeStep:(id)a4 component:(id)a5;
+ (id)maneuverUpdateWithStep:(id)a3 component:(id)a4;
- (BOOL)hasBeenSent;
- (BOOL)isSecondary;
- (CarClusterUpdateManeuverInfo)init;
- (GEOComposedGuidanceEvent)guidanceEvent;
- (GEOComposedRouteStep)routeStep;
- (NSArray)junctionElementAngle;
- (NSNumber)distanceBetweenManeuver;
- (NSNumber)index;
- (NSNumber)junctionElementExitAngle;
- (NSNumber)linkedLaneGuidanceInfo;
- (NSString)afterManeuverRoadName;
- (NSString)distanceBetweenManeuverDisplayString;
- (NSString)exitInfo;
- (NSString)maneuverDescription;
- (NSUUID)uniqueID;
- (id)debugProperties;
- (unsigned)distanceBetweenManeuverDisplayUnits;
- (unsigned)drivingSide;
- (unsigned)junctionType;
- (unsigned)maneuverType;
- (void)setAfterManeuverRoadName:(id)a3;
- (void)setDistanceBetweenManeuver:(id)a3;
- (void)setDistanceBetweenManeuverDisplayString:(id)a3;
- (void)setDistanceBetweenManeuverDisplayUnits:(unsigned __int16)a3;
- (void)setDrivingSide:(unsigned __int16)a3;
- (void)setExitInfo:(id)a3;
- (void)setGuidanceEvent:(id)a3;
- (void)setHasBeenSent:(BOOL)a3;
- (void)setIndex:(id)a3;
- (void)setIsSecondary:(BOOL)a3;
- (void)setJunctionElementAngle:(id)a3;
- (void)setJunctionElementExitAngle:(id)a3;
- (void)setJunctionType:(unsigned __int16)a3;
- (void)setLinkedLaneGuidanceInfo:(id)a3;
- (void)setManeuverDescription:(id)a3;
- (void)setManeuverType:(unsigned __int16)a3;
- (void)setRouteStep:(id)a3;
@end

@implementation CarClusterUpdateManeuverInfo

+ (id)maneuverUpdateWithGuidanceEvent:(id)a3 routeStep:(id)a4 component:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 hasSignGuidance])
  {
    v10 = objc_opt_new();
    [v10 setGuidanceEvent:v7];
    id v32 = v9;
    [v10 setComponent:v9];
    v11 = +[CarClusterUpdateManeuverInfo _maneuverDescriptionForGuidanceEvent:v7 routeStep:v8];
    [v10 setManeuverDescription:v11];

    [v10 setManeuverType:[CarClusterUpdate _accNavManeuverTypeForGEOManeuverType:[v7 maneuverType]]];
    v12 = [v7 roadName];
    [v10 setAfterManeuverRoadName:v12];

    [v7 distance];
    v14 = +[NSNumber numberWithUnsignedInt:v13];
    [v10 setDistanceBetweenManeuver:v14];

    unsigned __int16 v34 = 0;
    id v33 = 0;
    [v7 distance];
    +[CarClusterUpdate getStringValue:displayUnits:forRemainingDistance:](CarClusterUpdate, "getStringValue:displayUnits:forRemainingDistance:", &v33, &v34);
    id v31 = v33;
    [v10 setDistanceBetweenManeuverDisplayString:];
    [v10 setDistanceBetweenManeuverDisplayUnits:v34];
    [v10 setDrivingSide:[v7 drivingSide]];
    v15 = [v7 maneuverJunction];
    [v10 setJunctionType:[v15 junctionType]];
    v16 = objc_opt_new();
    if ([v15 numElements])
    {
      uint64_t v17 = 0;
      unint64_t v18 = 0;
      do
      {
        v19 = (char *)[v15 elements];
        int v20 = *(_DWORD *)&v19[v17 + 8];
        v21 = +[NSNumber numberWithInt:*(unsigned int *)&v19[v17]];
        if (v20 != 1)
        {
          if (v20 == 2)
          {
            if ([v15 maneuverType] == 4)
            {
              if (![v10 drivingSide] && (objc_msgSend(v21, "doubleValue"), v22 > 0.0)
                || [v10 drivingSide] == 1 && (objc_msgSend(v21, "doubleValue"), v23 < 0.0))
              {
                [v21 doubleValue];
                uint64_t v25 = +[NSNumber numberWithDouble:-v24];

                v21 = (void *)v25;
              }
            }
            [v10 setJunctionElementExitAngle:v21];
          }
          else
          {
            [v16 addObject:v21];
          }
        }

        ++v18;
        v17 += 16;
      }
      while (v18 < (unint64_t)[v15 numElements]);
    }
    [v10 setJunctionElementAngle:v16];
    v26 = [v8 geoStep];
    v27 = [v26 exitNumber];
    v28 = [v27 name];
    id v29 = [v28 copy];
    [v10 setExitInfo:v29];

    id v9 = v32;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)maneuverUpdateWithStep:(id)a3 component:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setComponent:v6];
  id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 stepIndex]);
  [v7 setIndex:v8];

  id v9 = [v5 contentsForContext:1];
  v10 = [v9 instructionWithShorterAlternatives];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v55;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        id v17 = [v16 length];
        if (v17 <= objc_msgSend(v6, "maxLength_ManeuverDescription"))
        {
          CFStringRef v18 = v16;
          goto LABEL_12;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    CFStringRef v18 = &stru_101324E70;
  }
  else
  {
    CFStringRef v18 = &stru_101324E70;
  }
LABEL_12:
  v51 = v11;

  v50 = (__CFString *)v18;
  [v7 setManeuverDescription:v18];
  [v7 setManeuverType:[CarClusterUpdate _accNavManeuverTypeForGEOManeuverType:[v5 maneuverType]]];
  uint64_t v19 = [v5 maneuverRoadName];
  int v20 = (void *)v19;
  if (v19) {
    CFStringRef v21 = (const __CFString *)v19;
  }
  else {
    CFStringRef v21 = &stru_101324E70;
  }
  [v7 setAfterManeuverRoadName:v21];

  [v5 distance];
  double v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v7 setDistanceBetweenManeuver:v22];

  unsigned __int16 v53 = 0;
  id v52 = 0;
  [v5 distance];
  double v23 = NSCollectionLayoutEdgeSpacing_ptr;
  +[CarClusterUpdate getStringValue:displayUnits:forRemainingDistance:](CarClusterUpdate, "getStringValue:displayUnits:forRemainingDistance:", &v52, &v53);
  id v49 = v52;
  [v7 setDistanceBetweenManeuverDisplayString:];
  [v7 setDistanceBetweenManeuverDisplayUnits:v53];
  [v7 setDrivingSide:[v5 drivingSide]];
  double v24 = [v5 geoStep];
  [v7 setJunctionType:[v24 junctionType]];

  uint64_t v25 = objc_opt_new();
  v26 = [v5 geoStep];
  id v27 = [v26 junctionElementsCount];

  if (v27)
  {
    unint64_t v28 = 0;
    do
    {
      id v29 = [v5 geoStep];
      [v29 junctionElementAtIndex:v28];
      int v31 = v30;

      id v32 = v23[55];
      id v33 = [v5 geoStep];
      unsigned __int16 v34 = [v32 numberWithInt:[v33 junctionElementAtIndex:v28]];

      if (v31 != 1)
      {
        if (v31 == 2)
        {
          v35 = [v5 geoStep];
          unsigned int v36 = [v35 maneuverType];

          if (v36 == 4)
          {
            if (![v5 drivingSide] && (objc_msgSend(v34, "doubleValue"), v37 > 0.0)
              || [v5 drivingSide] == 1 && (objc_msgSend(v34, "doubleValue"), v38 < 0.0))
            {
              v39 = v23[55];
              [v34 doubleValue];
              uint64_t v41 = [v39 numberWithDouble:-v40];

              unsigned __int16 v34 = (void *)v41;
            }
          }
          [v7 setJunctionElementExitAngle:v34];
          v42 = [v5 geoStep];
          v43 = [v42 exitNumber];
          v44 = [v43 shield];
          id v45 = [v44 copy];
          [v7 setExitInfo:v45];

          double v23 = NSCollectionLayoutEdgeSpacing_ptr;
        }
        else
        {
          [v25 addObject:v34];
        }
      }

      ++v28;
      v46 = [v5 geoStep];
      id v47 = [v46 junctionElementsCount];
    }
    while (v28 < (unint64_t)v47);
  }
  [v7 setJunctionElementAngle:v25];

  return v7;
}

+ (id)_maneuverDescriptionForGuidanceEvent:(id)a3 routeStep:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = [v5 maneuverType];
  if (v7 <= 0x27 && ((1 << v7) & 0x8600050000) != 0)
  {
    id v8 = +[MNNavigationService sharedService];
    id v9 = [v8 route];

    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    id v11 = [v9 legIndexForStepIndex:[v6 stepIndex]];
    if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v12 = [v9 destination];
    }
    else
    {
      unint64_t v13 = (unint64_t)v11;
      uint64_t v14 = [v9 legs];
      if (v13 >= (unint64_t)[v14 count])
      {
        id v12 = [v9 destination];
      }
      else
      {
        v15 = [v9 legs];
        v16 = [v15 objectAtIndexedSubscript:v13];
        id v12 = [v16 destination];
      }
    }
    id v17 = [v12 navDisplayAddress];
    [v10 setObject:v17 forKeyedSubscript:@"{Address}"];

    CFStringRef v18 = [v12 navDisplayName];
    [v10 setObject:v18 forKeyedSubscript:@"{Name}"];

    uint64_t v19 = [v6 maneuverRoadOrExitName];
    [v10 setObject:v19 forKeyedSubscript:@"{Road}"];

    int v20 = [v5 signDetails];
    CFStringRef v21 = [v20 firstObject];
    *((void *)&v27 + 1) = 0;
    uint64_t v26 = 1;
    *(_DWORD *)((char *)&v27 + 7) = 0;
    uint64_t v28 = 0;
    *(void *)&long long v27 = 0;
    double v22 = +[NSString _navigation_stringForServerFormattedString:v21 options:&v26 overrideVariables:v10];
  }
  else
  {
    double v24 = [v5 signDetails];
    uint64_t v25 = [v24 firstObject];
    double v22 = +[NSString _navigation_stringForServerFormattedString:v25];
  }

  return v22;
}

- (CarClusterUpdateManeuverInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)CarClusterUpdateManeuverInfo;
  result = [(CarClusterUpdateManeuverInfo *)&v3 init];
  if (result)
  {
    result->_maneuverType = -1;
    result->_distanceBetweenManeuverDisplayUnits = -1;
    result->_drivingSide = -1;
    result->_junctionType = -1;
  }
  return result;
}

- (NSUUID)uniqueID
{
  v2 = [(CarClusterUpdateManeuverInfo *)self guidanceEvent];
  objc_super v3 = [v2 uniqueID];

  return (NSUUID *)v3;
}

- (void)setManeuverDescription:(id)a3
{
  v4 = [a3 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  maneuverDescription = self->_maneuverDescription;
  self->_maneuverDescription = v4;
}

- (void)setAfterManeuverRoadName:(id)a3
{
  v4 = [a3 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  afterManeuverRoadName = self->_afterManeuverRoadName;
  self->_afterManeuverRoadName = v4;
}

- (id)debugProperties
{
  unsigned int v2 = [(CarClusterUpdateManeuverInfo *)self hasBeenSent];
  CFStringRef v3 = @"NO";
  if (v2) {
    CFStringRef v3 = @"YES";
  }
  return +[NSString stringWithFormat:@"hasBeenSent=%@", v3];
}

+ (id)_enumProperties
{
  if (qword_101610F58 != -1) {
    dispatch_once(&qword_101610F58, &stru_1013218C0);
  }
  unsigned int v2 = (void *)qword_101610F60;

  return v2;
}

+ (id)_integersKeyed
{
  if (qword_101610F68 != -1) {
    dispatch_once(&qword_101610F68, &stru_1013218E0);
  }
  unsigned int v2 = (void *)qword_101610F70;

  return v2;
}

- (BOOL)hasBeenSent
{
  return self->_hasBeenSent;
}

- (void)setHasBeenSent:(BOOL)a3
{
  self->_hasBeenSent = a3;
}

- (GEOComposedGuidanceEvent)guidanceEvent
{
  return self->_guidanceEvent;
}

- (void)setGuidanceEvent:(id)a3
{
}

- (GEOComposedRouteStep)routeStep
{
  return self->_routeStep;
}

- (void)setRouteStep:(id)a3
{
}

- (NSNumber)index
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIndex:(id)a3
{
}

- (BOOL)isSecondary
{
  return self->_isSecondary;
}

- (void)setIsSecondary:(BOOL)a3
{
  self->_isSecondary = a3;
}

- (NSString)maneuverDescription
{
  return self->_maneuverDescription;
}

- (unsigned)maneuverType
{
  return self->_maneuverType;
}

- (void)setManeuverType:(unsigned __int16)a3
{
  self->_maneuverType = a3;
}

- (NSString)afterManeuverRoadName
{
  return self->_afterManeuverRoadName;
}

- (NSNumber)distanceBetweenManeuver
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDistanceBetweenManeuver:(id)a3
{
}

- (NSString)distanceBetweenManeuverDisplayString
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDistanceBetweenManeuverDisplayString:(id)a3
{
}

- (unsigned)distanceBetweenManeuverDisplayUnits
{
  return self->_distanceBetweenManeuverDisplayUnits;
}

- (void)setDistanceBetweenManeuverDisplayUnits:(unsigned __int16)a3
{
  self->_distanceBetweenManeuverDisplayUnits = a3;
}

- (unsigned)drivingSide
{
  return self->_drivingSide;
}

- (void)setDrivingSide:(unsigned __int16)a3
{
  self->_drivingSide = a3;
}

- (unsigned)junctionType
{
  return self->_junctionType;
}

- (void)setJunctionType:(unsigned __int16)a3
{
  self->_junctionType = a3;
}

- (NSArray)junctionElementAngle
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setJunctionElementAngle:(id)a3
{
}

- (NSNumber)junctionElementExitAngle
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setJunctionElementExitAngle:(id)a3
{
}

- (NSNumber)linkedLaneGuidanceInfo
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLinkedLaneGuidanceInfo:(id)a3
{
}

- (NSString)exitInfo
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setExitInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitInfo, 0);
  objc_storeStrong((id *)&self->_linkedLaneGuidanceInfo, 0);
  objc_storeStrong((id *)&self->_junctionElementExitAngle, 0);
  objc_storeStrong((id *)&self->_junctionElementAngle, 0);
  objc_storeStrong((id *)&self->_distanceBetweenManeuverDisplayString, 0);
  objc_storeStrong((id *)&self->_distanceBetweenManeuver, 0);
  objc_storeStrong((id *)&self->_afterManeuverRoadName, 0);
  objc_storeStrong((id *)&self->_maneuverDescription, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_routeStep, 0);

  objc_storeStrong((id *)&self->_guidanceEvent, 0);
}

@end