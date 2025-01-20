@interface NSDictionary
+ (BOOL)dictionary:(id)a3 isEqualToDictionary:(id)a4;
- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_endPoint;
- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_jumpPoint;
- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_midPoint;
- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_pointWithKeys:(id)a3;
- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_startPoint;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_mapstest_VKLocationCoordinate2D;
- (BOOL)_maps_writeBinaryPlist:(id)a3 error:(id *)a4;
- (BOOL)_mapstest_hasAltitude;
- (BOOL)_mapstest_hasEndPoint;
- (BOOL)_mapstest_hasLatitudeAndLongitude;
- (BOOL)_mapstest_hasMapRegion;
- (BOOL)_mapstest_hasMapType;
- (BOOL)_mapstest_hasMidPoint;
- (BOOL)_mapstest_hasStartPoint;
- (BOOL)_mapstest_hasViewMode;
- (BOOL)_mapstest_isUsingSampleProactiveData;
- (CLLocation)_mapstest_location;
- (CLLocationCoordinate2D)_mapstest_locationCoordinate2D;
- (DirectionsPlan)_mapstest_directionsPlan;
- (GEOMapRegion)_mapstest_mapRegion;
- (NSArray)_mapstest_readSubTestsFromTestSerial;
- (NSArray)_mapstest_rptTestActions;
- (NSArray)_mapstest_serialSubTests;
- (NSArray)_mapstest_waypointStrings;
- (NSDate)_mapstest_customDepartureDate;
- (NSString)_mapstest_destinationString;
- (NSString)_mapstest_originString;
- (double)_mapstest_altitude;
- (double)_mapstest_animationDurationWithDefault:(double)a3;
- (double)_mapstest_doubleValueForKey:(id)a3 defaultValue:(double)a4;
- (double)_mapstest_duration;
- (double)_mapstest_pitch;
- (double)_mapstest_yaw;
- (id)_mapstest_addressDictionaryForKey:(id)a3;
- (id)_mapstest_arrayWithJSONForKey:(id)a3;
- (id)_mapstest_directionsPlanWithResolvedDestination:(id)a3;
- (int)_mapstest_transportType;
- (int)_mapstest_waitSecondsForMapViewSetup;
- (int)_maptest_lookAroundNavigationAmountToTurnInDegrees;
- (int)_maptest_lookAroundNavigationTaps;
- (int)_maptest_lookAroundOffsetTapPositionX;
- (int)_maptest_lookAroundOffsetTapPositionY;
- (int64_t)_mapstest_directionIntentType;
- (int64_t)_mapstest_guidanceStepSwipeCount;
- (int64_t)_mapstest_integerValueForKey:(id)a3 defaultValue:(int64_t)a4;
- (int64_t)_mapstest_orientation;
- (int64_t)_mapstest_viewMode;
- (int64_t)_mapstest_viewModeWithDefaultType:(int64_t)a3;
- (unint64_t)_mapstest_flyoverTourId;
- (unint64_t)_mapstest_mapType;
- (unint64_t)_mapstest_mapTypeWithDefaultType:(unint64_t)a3;
- (unsigned)_mapstest_searchTestACMode;
- (void)_mapstest_getSelectedFeatures:(unint64_t *)a3 disabled:(unint64_t *)a4;
@end

@implementation NSDictionary

+ (BOOL)dictionary:(id)a3 isEqualToDictionary:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    unsigned __int8 v8 = 0;
    if (v5 && v6) {
      unsigned __int8 v8 = [(id)v5 isEqualToDictionary:v6];
    }
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (id)_mapstest_arrayWithJSONForKey:(id)a3
{
  if (a3)
  {
    v3 = -[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:");
    v4 = v3;
    if (v3)
    {
      unint64_t v5 = [v3 dataUsingEncoding:4];
      uint64_t v9 = 0;
      unint64_t v6 = +[NSJSONSerialization JSONObjectWithData:v5 options:1 error:&v9];
      objc_opt_class();
      id v7 = 0;
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSArray)_mapstest_serialSubTests
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"serialSubTests"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSArray)_mapstest_readSubTestsFromTestSerial
{
  v2 = [(NSDictionary *)self _mapstest_arrayWithJSONForKey:@"testSerial"];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v47 = v2;
    id v4 = v2;
    id v54 = [v4 countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (!v54) {
      goto LABEL_28;
    }
    unint64_t v5 = NSCollectionLayoutEdgeSpacing_ptr;
    uint64_t v53 = *(void *)v56;
    id v48 = v4;
    v49 = v3;
    while (1)
    {
      for (i = 0; i != v54; i = (char *)i + 1)
      {
        if (*(void *)v56 != v53) {
          objc_enumerationMutation(v4);
        }
        id v7 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        unsigned __int8 v8 = (char *)[v4 indexOfObject:v7];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = [v7 objectForKeyedSubscript:@"selector"];
          v10 = v9;
          if (v9)
          {
            v11 = v5;
            if (([v9 hasSuffix:@":"] & 1) == 0)
            {
              v12 = v3;
              uint64_t v13 = [v10 stringByAppendingString:@":"];

              v10 = (void *)v13;
LABEL_17:
              v41 = objc_opt_new();
              [v41 setObject:v10 forKeyedSubscript:@"selector"];
              v42 = [v7 objectForKeyedSubscript:@"subTestName"];
              if (v42)
              {
                id v43 = [v7 objectForKeyedSubscript:@"subTestName"];
              }
              else
              {
                id v43 = v10;
              }
              v33 = v43;

              if ([v33 hasSuffix:@":"])
              {
                uint64_t v44 = [v33 substringToIndex:[v33 length] - 1];

                v33 = (void *)v44;
              }
              if ((unint64_t)[v4 count] >= 2)
              {
                uint64_t v45 = +[NSString stringWithFormat:@"step%lu-%@", v8 + 1, v33];

                v33 = (void *)v45;
              }
              [v7 removeObjectForKey:@"selector"];
              [v7 removeObjectForKey:@"subTestName"];
              [v7 setObject:v33 forKeyedSubscript:@"subTestName"];
              v40 = v41;
              [v41 setObject:v7 forKeyedSubscript:@"options"];
              id v3 = v12;
              [v12 addObject:v40];
              unint64_t v5 = v11;
              goto LABEL_25;
            }
          }
          else
          {
            v11 = v5;
          }
          v12 = v3;
          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        id v52 = v7;
        v10 = [v52 componentsSeparatedByString:@" "];
        v14 = [v10 objectAtIndexedSubscript:0];
        [v14 doubleValue];
        double v16 = v15;

        v17 = [v10 objectAtIndexedSubscript:1];
        [v17 doubleValue];
        double v19 = v18;

        v20 = [v10 objectAtIndexedSubscript:2];
        [v20 doubleValue];
        double v22 = v21;

        v23 = [v10 objectAtIndexedSubscript:3];
        [v23 doubleValue];
        double v25 = v24;

        v26 = [v10 objectAtIndexedSubscript:4];
        [v26 doubleValue];
        double v28 = v27;

        double v29 = cos(v28 * 0.0174532925);
        double v30 = 5.0;
        if ([v10 count] == (id)6)
        {
          v31 = [v10 objectAtIndexedSubscript:5];
          [v31 doubleValue];
          double v30 = v32;
        }
        v33 = +[NSString stringWithFormat:@"step%lu", v8 + 1];
        v61[0] = @"selector";
        v61[1] = @"options";
        v62[0] = @"setCenterCoordinateFull:";
        v59[0] = @"latitude";
        v51 = +[NSNumber numberWithDouble:v16];
        v60[0] = v51;
        v59[1] = @"longitude";
        v50 = +[NSNumber numberWithDouble:v19];
        v60[1] = v50;
        v59[2] = @"altitude";
        v34 = +[NSNumber numberWithDouble:v22 * v29];
        v60[2] = v34;
        v59[3] = @"yaw";
        v35 = +[NSNumber numberWithDouble:v25];
        v60[3] = v35;
        v59[4] = @"pitch";
        v36 = +[NSNumber numberWithDouble:v28];
        v60[4] = v36;
        v59[5] = @"duration";
        v37 = +[NSNumber numberWithDouble:v30];
        v59[6] = @"subTestName";
        v60[5] = v37;
        v60[6] = v33;
        unint64_t v5 = NSCollectionLayoutEdgeSpacing_ptr;
        v38 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:7];
        v62[1] = v38;
        v39 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];

        id v3 = v49;
        [v49 addObject:v39];

        id v4 = v48;
        v40 = v52;
LABEL_25:
      }
      id v54 = [v4 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (!v54)
      {
LABEL_28:

        v2 = v47;
        goto LABEL_30;
      }
    }
  }
  id v3 = 0;
LABEL_30:

  return (NSArray *)v3;
}

- (id)_mapstest_addressDictionaryForKey:(id)a3
{
  id v3 = [(NSDictionary *)self objectForKeyedSubscript:a3];
  id v4 = [v3 dataUsingEncoding:4];
  unint64_t v5 = +[NSJSONSerialization JSONObjectWithData:v4 options:0 error:0];

  return v5;
}

- (int64_t)_mapstest_integerValueForKey:(id)a3 defaultValue:(int64_t)a4
{
  unint64_t v5 = [(NSDictionary *)self objectForKeyedSubscript:a3];
  unint64_t v6 = v5;
  if (v5) {
    a4 = (int64_t)[v5 integerValue];
  }

  return a4;
}

- (double)_mapstest_doubleValueForKey:(id)a3 defaultValue:(double)a4
{
  unint64_t v5 = [(NSDictionary *)self objectForKeyedSubscript:a3];
  unint64_t v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    a4 = v7;
  }

  return a4;
}

- (void)_mapstest_getSelectedFeatures:(unint64_t *)a3 disabled:(unint64_t *)a4
{
  uint64_t v8 = [(NSDictionary *)self objectForKeyedSubscript:@"enable"];
  uint64_t v7 = [(NSDictionary *)self objectForKeyedSubscript:@"disable"];
  if (v7 | v8)
  {
    if (a3) {
      *a3 = sub_100571658((void *)v8);
    }
    if (a4) {
      *a4 = sub_100571658((void *)v7);
    }
  }
}

- (int64_t)_mapstest_viewModeWithDefaultType:(int64_t)a3
{
  id v4 = [(NSDictionary *)self objectForKeyedSubscript:@"viewMode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isEqualToString:@"standard"])
    {
      a3 = 0;
    }
    else if ([v4 isEqualToString:@"driving"])
    {
      a3 = 7;
    }
    else if ([v4 isEqualToString:@"transit"])
    {
      a3 = 3;
    }
    else if ([v4 isEqualToString:@"satelliteFlyover"])
    {
      a3 = 6;
    }
    else if ([v4 isEqualToString:@"satellite"])
    {
      a3 = 2;
    }
    else if ([v4 isEqualToString:@"hybrid"])
    {
      a3 = 1;
    }
  }

  return a3;
}

- (unint64_t)_mapstest_mapTypeWithDefaultType:(unint64_t)a3
{
  id v4 = [(NSDictionary *)self objectForKeyedSubscript:@"mapType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isEqualToString:@"standard"])
    {
      a3 = 0;
    }
    else if ([v4 isEqualToString:@"transit"])
    {
      a3 = 104;
    }
    else if ([v4 isEqualToString:@"satellite"])
    {
      a3 = 1;
    }
    else if ([v4 isEqualToString:@"satelliteFlyover"])
    {
      a3 = 3;
    }
    else if ([v4 isEqualToString:@"hybrid"])
    {
      a3 = 2;
    }
  }

  return a3;
}

- (BOOL)_mapstest_hasViewMode
{
  v2 = [(NSDictionary *)self objectForKey:@"viewMode"];
  if (v2)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (int64_t)_mapstest_viewMode
{
  return [(NSDictionary *)self _mapstest_viewModeWithDefaultType:0];
}

- (BOOL)_mapstest_hasMapType
{
  v2 = [(NSDictionary *)self objectForKey:@"mapType"];
  if (v2)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (unint64_t)_mapstest_mapType
{
  return [(NSDictionary *)self _mapstest_mapTypeWithDefaultType:0];
}

- (unsigned)_mapstest_searchTestACMode
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"searchTestACMode"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v2 isEqualToString:@"SearchTestFullAC"] & 1) == 0)
  {
    if ([v2 isEqualToString:@"SearchTestMiniAC"])
    {
      unsigned int v3 = 1;
    }
    else if ([v2 isEqualToString:@"SearchTestNoAC"])
    {
      unsigned int v3 = 2;
    }
    else
    {
      unsigned int v3 = 0;
    }
  }
  else
  {
    unsigned int v3 = 0;
  }

  return v3;
}

- (int64_t)_mapstest_directionIntentType
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"directionIntentMode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v2 isEqualToString:@"Directions"])
    {
      int64_t v3 = 1;
    }
    else if ([v2 isEqualToString:@"DirectionsTo"])
    {
      int64_t v3 = 2;
    }
    else if ([v2 isEqualToString:@"DirectionsToFrom"])
    {
      int64_t v3 = 3;
    }
    else
    {
      int64_t v3 = 0;
    }
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_mapstest_hasMapRegion
{
  int64_t v3 = [(NSDictionary *)self objectForKeyedSubscript:@"westLng"];
  if (v3)
  {
    id v4 = [(NSDictionary *)self objectForKeyedSubscript:@"eastLng"];
    if (v4)
    {
      unint64_t v5 = [(NSDictionary *)self objectForKeyedSubscript:@"southLat"];
      if (v5)
      {
        unint64_t v6 = [(NSDictionary *)self objectForKeyedSubscript:@"northLat"];
        BOOL v7 = v6 != 0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (GEOMapRegion)_mapstest_mapRegion
{
  int64_t v3 = objc_opt_new();
  id v4 = [(NSDictionary *)self valueForKey:@"westLng"];
  [v4 doubleValue];
  [v3 setWestLng:];

  unint64_t v5 = [(NSDictionary *)self valueForKey:@"eastLng"];
  [v5 doubleValue];
  [v3 setEastLng:];

  unint64_t v6 = [(NSDictionary *)self valueForKey:@"southLat"];
  [v6 doubleValue];
  [v3 setSouthLat:];

  BOOL v7 = [(NSDictionary *)self valueForKey:@"northLat"];
  [v7 doubleValue];
  [v3 setNorthLat:];

  return (GEOMapRegion *)v3;
}

- (BOOL)_mapstest_hasLatitudeAndLongitude
{
  int64_t v3 = [(NSDictionary *)self objectForKeyedSubscript:@"latitude"];
  if (v3)
  {
    id v4 = [(NSDictionary *)self objectForKeyedSubscript:@"longitude"];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (CLLocation)_mapstest_location
{
  int64_t v3 = [(NSDictionary *)self objectForKeyedSubscript:@"latitude"];
  [v3 doubleValue];
  double v5 = v4;

  unint64_t v6 = [(NSDictionary *)self objectForKeyedSubscript:@"longitude"];
  [v6 doubleValue];
  double v8 = v7;

  id v9 = [objc_alloc((Class)CLLocation) initWithLatitude:v5 longitude:v8];

  return (CLLocation *)v9;
}

- (CLLocationCoordinate2D)_mapstest_locationCoordinate2D
{
  int64_t v3 = [(NSDictionary *)self objectForKeyedSubscript:@"latitude"];
  [v3 doubleValue];
  CLLocationDegrees v5 = v4;

  unint64_t v6 = [(NSDictionary *)self objectForKeyedSubscript:@"longitude"];
  [v6 doubleValue];
  CLLocationDegrees v8 = v7;

  CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(v5, v8);
  double longitude = v11.longitude;
  double latitude = v11.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_mapstest_VKLocationCoordinate2D
{
  int64_t v3 = [(NSDictionary *)self objectForKeyedSubscript:@"latitude"];
  [v3 doubleValue];

  double v4 = [(NSDictionary *)self objectForKeyedSubscript:@"longitude"];
  [v4 doubleValue];

  VKLocationCoordinate2DMake();
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_jumpPoint
{
  int64_t v3 = [(NSDictionary *)self objectForKeyedSubscript:@"latitude"];
  [v3 doubleValue];
  double v4 = [(NSDictionary *)self objectForKeyedSubscript:@"longitude"];
  [v4 doubleValue];
  [(NSDictionary *)self _mapstest_doubleValueForKey:@"regionSize" defaultValue:1.0];
  VKLocationCoordinate3DMake();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v6;
  double v12 = v8;
  double v13 = v10;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (int)_maptest_lookAroundOffsetTapPositionX
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"offsetTapPointX"];
  int v3 = [v2 intValue];

  return v3;
}

- (int)_maptest_lookAroundOffsetTapPositionY
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"offsetTapPointY"];
  int v3 = [v2 intValue];

  return v3;
}

- (int)_maptest_lookAroundNavigationTaps
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"totalTaps"];
  int v3 = [v2 intValue];

  return v3;
}

- (int)_maptest_lookAroundNavigationAmountToTurnInDegrees
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"amountToTurnInDegrees"];
  int v3 = [v2 intValue];

  return v3;
}

- (BOOL)_mapstest_hasStartPoint
{
  int v3 = [(NSDictionary *)self objectForKeyedSubscript:@"startLatitude"];
  if (v3)
  {
    double v4 = [(NSDictionary *)self objectForKeyedSubscript:@"startLongitude"];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_startPoint
{
  [(NSDictionary *)self _mapstest_pointWithKeys:&off_1013AD770];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (BOOL)_mapstest_hasEndPoint
{
  double v3 = [(NSDictionary *)self objectForKeyedSubscript:@"endLatitude"];
  if (v3)
  {
    double v4 = [(NSDictionary *)self objectForKeyedSubscript:@"endLongitude"];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_endPoint
{
  [(NSDictionary *)self _mapstest_pointWithKeys:&off_1013AD788];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (BOOL)_mapstest_hasMidPoint
{
  double v3 = [(NSDictionary *)self objectForKeyedSubscript:@"midLatitude"];
  if (v3)
  {
    double v4 = [(NSDictionary *)self objectForKeyedSubscript:@"midLongitude"];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_midPoint
{
  [(NSDictionary *)self _mapstest_pointWithKeys:&off_1013AD7A0];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_pointWithKeys:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] > 2)
  {
    double v11 = [v4 objectAtIndexedSubscript:0];
    double v12 = [(NSDictionary *)self objectForKeyedSubscript:v11];
    [v12 doubleValue];
    double v13 = [v4 objectAtIndexedSubscript:1];
    v14 = [(NSDictionary *)self objectForKeyedSubscript:v13];
    [v14 doubleValue];
    double v15 = [v4 objectAtIndexedSubscript:2];
    double v16 = [(NSDictionary *)self objectForKeyedSubscript:v15];
    [v16 doubleValue];
    VKLocationCoordinate3DMake();
    double v6 = v17;
    double v8 = v18;
    double v10 = v19;
  }
  else
  {
    VKLocationCoordinate3DMake();
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }

  double v20 = v6;
  double v21 = v8;
  double v22 = v10;
  result.var2 = v22;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- (double)_mapstest_pitch
{
  [(NSDictionary *)self _mapstest_doubleValueForKey:@"pitch" defaultValue:0.0];
  return result;
}

- (double)_mapstest_yaw
{
  [(NSDictionary *)self _mapstest_doubleValueForKey:@"yaw" defaultValue:0.0];
  return result;
}

- (double)_mapstest_altitude
{
  [(NSDictionary *)self _mapstest_doubleValueForKey:@"altitude" defaultValue:0.0];
  return result;
}

- (BOOL)_mapstest_hasAltitude
{
  double v2 = [(NSDictionary *)self objectForKeyedSubscript:@"altitude"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (double)_mapstest_duration
{
  [(NSDictionary *)self _mapstest_doubleValueForKey:@"duration" defaultValue:0.0];
  return result;
}

- (unint64_t)_mapstest_flyoverTourId
{
  double v2 = [(NSDictionary *)self objectForKeyedSubscript:@"tourId"];
  id v3 = [v2 longLongValue];

  return (unint64_t)v3;
}

- (double)_mapstest_animationDurationWithDefault:(double)a3
{
  [(NSDictionary *)self _mapstest_doubleValueForKey:@"animDuration" defaultValue:a3];
  return result;
}

- (NSString)_mapstest_originString
{
  return (NSString *)[(NSDictionary *)self objectForKeyedSubscript:@"originString"];
}

- (NSString)_mapstest_destinationString
{
  return (NSString *)[(NSDictionary *)self objectForKeyedSubscript:@"destinationString"];
}

- (NSArray)_mapstest_waypointStrings
{
  return (NSArray *)[(NSDictionary *)self _mapstest_arrayWithJSONForKey:@"waypointsAsJSON"];
}

- (int)_mapstest_transportType
{
  double v2 = [(NSDictionary *)self objectForKeyedSubscript:@"transportType"];
  int v3 = [v2 integerValue];

  return v3;
}

- (NSDate)_mapstest_customDepartureDate
{
  int v3 = [(NSDictionary *)self objectForKeyedSubscript:@"leaveOnNextWeekday"];
  uint64_t v4 = [(NSDictionary *)self objectForKeyedSubscript:@"leaveAtHour"];
  double v5 = (void *)v4;
  if (v3)
  {
    id v6 = [v3 integerValue];
    if (v5) {
      uint64_t v7 = (uint64_t)[v5 integerValue];
    }
    else {
      uint64_t v7 = 9;
    }
    double v8 = +[NSDate date];
    double v10 = +[NSTimeZone localTimeZone];
    uint64_t v11 = [v8 _maps_nextWeekday:v6 atHour:v7 timeZone:v10];
    goto LABEL_8;
  }
  if (v4)
  {
    double v8 = +[NSDate date];
    id v9 = [v5 integerValue];
    double v10 = +[NSTimeZone localTimeZone];
    uint64_t v11 = [v8 _maps_nextDayAtHour:v9 timeZone:v10];
LABEL_8:
    double v12 = (void *)v11;

    goto LABEL_9;
  }
  double v12 = 0;
LABEL_9:

  return (NSDate *)v12;
}

- (DirectionsPlan)_mapstest_directionsPlan
{
  return (DirectionsPlan *)[(NSDictionary *)self _mapstest_directionsPlanWithResolvedDestination:0];
}

- (id)_mapstest_directionsPlanWithResolvedDestination:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(DirectionsPlan);
  id v6 = objc_alloc((Class)GEOComposedWaypoint);
  id v7 = [objc_alloc((Class)GEOLocation) initWithLatitude:0.0 longitude:0.0];
  id v8 = [v6 initWithLocation:v7 isCurrentLocation:1];

  [(DirectionsPlan *)v5 setDisplayMethod:1];
  id v9 = objc_alloc_init((Class)GEOStorageRouteRequestStorage);
  [(DirectionsPlan *)v5 setRouteRequestStorage:v9];

  uint64_t v10 = [(NSDictionary *)self _mapstest_transportType];
  uint64_t v11 = [(DirectionsPlan *)v5 routeRequestStorage];
  [v11 setTransportType:v10];

  double v12 = [(NSDictionary *)self _mapstest_waypointStrings];
  double v13 = v12;
  if (v12)
  {
    v14 = (char *)[v12 count] - 1;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1005729B4;
    v33[3] = &unk_1012EF508;
    id v34 = v8;
    v37 = v14;
    id v35 = v4;
    v36 = v5;
    [v13 enumerateObjectsUsingBlock:v33];

    double v15 = v34;
LABEL_11:

    goto LABEL_12;
  }
  double v16 = [(NSDictionary *)self _mapstest_originString];
  [(DirectionsPlan *)v5 setOriginString:v16];

  double v17 = [(NSDictionary *)self _mapstest_destinationString];
  [(DirectionsPlan *)v5 setDestinationString:v17];

  double v18 = [(DirectionsPlan *)v5 originString];
  unsigned int v19 = [v18 _mapstest_isCurrentLocationString];

  if (v4)
  {
    if ((v19 & 1) == 0)
    {
      id v32 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Invalid waypoint pairs" userInfo:0];
      objc_exception_throw(v32);
    }
    [(DirectionsPlan *)v5 setOriginString:0];
    [(DirectionsPlan *)v5 setDestinationString:0];
    v40[0] = v8;
    v40[1] = v4;
    double v20 = (id *)v40;
    uint64_t v21 = 2;
    goto LABEL_10;
  }
  if (v19)
  {
    [(DirectionsPlan *)v5 setOriginString:0];
    id v39 = v8;
    double v22 = +[NSArray arrayWithObjects:&v39 count:1];
    id v23 = [v22 mutableCopy];
    double v24 = [(DirectionsPlan *)v5 routeRequestStorage];
    [v24 setWaypoints:v23];
  }
  double v25 = [(DirectionsPlan *)v5 destinationString];
  unsigned int v26 = [v25 _mapstest_isCurrentLocationString];

  if (v26)
  {
    [(DirectionsPlan *)v5 setDestinationString:0];
    id v38 = v8;
    double v20 = &v38;
    uint64_t v21 = 1;
LABEL_10:
    double v15 = +[NSArray arrayWithObjects:v20 count:v21];
    id v27 = [v15 mutableCopy];
    double v28 = [(DirectionsPlan *)v5 routeRequestStorage];
    [v28 setWaypoints:v27];

    goto LABEL_11;
  }
LABEL_12:
  double v29 = [(NSDictionary *)self _mapstest_customDepartureDate];
  double v30 = v29;
  if (v29)
  {
    [v29 timeIntervalSinceReferenceDate];
    -[DirectionsPlan setDepartureTime:](v5, "setDepartureTime:");
  }

  return v5;
}

- (int64_t)_mapstest_orientation
{
  double v2 = [(NSDictionary *)self objectForKeyedSubscript:@"orientation"];
  if ([v2 isEqualToString:@"landscape"]) {
    int64_t v3 = 4;
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (int64_t)_mapstest_guidanceStepSwipeCount
{
  double v2 = [(NSDictionary *)self objectForKeyedSubscript:@"swipeCount"];
  int64_t v3 = v2;
  if (v2) {
    int64_t v4 = (int64_t)[v2 integerValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (BOOL)_mapstest_isUsingSampleProactiveData
{
  double v2 = [(NSDictionary *)self objectForKeyedSubscript:@"isUsingSampleProactiveData"];
  int64_t v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 isEqual:@"YES"];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (int)_mapstest_waitSecondsForMapViewSetup
{
  return [(NSDictionary *)self _mapstest_integerValueForKey:@"waitSecondsForMapViewSetup" defaultValue:0];
}

- (NSArray)_mapstest_rptTestActions
{
  return (NSArray *)[(NSDictionary *)self _mapstest_arrayWithJSONForKey:@"actions"];
}

- (BOOL)_maps_writeBinaryPlist:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v17 = 0;
  id v7 = +[NSPropertyListSerialization dataWithPropertyList:self format:200 options:0 error:&v17];
  id v8 = v17;
  id v9 = v8;
  if (v8)
  {
    unsigned __int8 v10 = 0;
    if (*a4) {
      *a4 = v8;
    }
  }
  else
  {
    uint64_t v11 = [v6 stringByDeletingLastPathComponent];
    double v12 = +[NSFileManager defaultManager];
    if (([v12 fileExistsAtPath:v11 isDirectory:0] & 1) == 0) {
      [v12 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:0];
    }
    id v16 = 0;
    unsigned __int8 v10 = [v7 writeToFile:v6 options:1 error:&v16];
    id v13 = v16;
    v14 = v13;
    if (v13)
    {
      unsigned __int8 v10 = 0;
      if (*a4) {
        *a4 = v13;
      }
    }
  }
  return v10;
}

@end