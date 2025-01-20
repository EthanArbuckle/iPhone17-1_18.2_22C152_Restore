@interface NavCameraCaches
+ (id)cachesWithRoute:(id)a3 context:(id)a4;
- (GEOComposedRoute)currentRoute;
- (GEOMapFeatureAccess)mapFeatureAccess;
- (NSArray)groupedManeuverCounts;
- (NSArray)stepsWithCloseDistanceCache;
- (NSArray)stepsWithNearDistanceCache;
- (NSArray)stepsWithRampCache;
- (NSArray)stepsWithRoundaboutCache;
- (NavCameraCaches)init;
- (VKNavContext)navContex;
- (void)_calculateRoadTileGroupedManeuversWithUpdateHandler:(id)a3;
- (void)_calculateRouteGroupedManeuvers;
- (void)_roadForCoordinate:(id)a3 course:(double)a4 handler:(id)a5;
- (void)_updateGroupedManeuverCounts;
- (void)recalculateGroupedManeuversCaches;
- (void)setCurrentRoute:(id)a3;
- (void)setGroupedManeuverCounts:(id)a3;
- (void)setMapFeatureAccess:(id)a3;
- (void)setNavContex:(id)a3;
- (void)setStepsWithCloseDistanceCache:(id)a3;
- (void)setStepsWithNearDistanceCache:(id)a3;
- (void)setStepsWithRampCache:(id)a3;
- (void)setStepsWithRoundaboutCache:(id)a3;
@end

@implementation NavCameraCaches

- (NavCameraCaches)init
{
  v7.receiver = self;
  v7.super_class = (Class)NavCameraCaches;
  v2 = [(NavCameraCaches *)&v7 init];
  if (v2)
  {
    v3 = (GEOMapFeatureAccess *)[objc_alloc((Class)GEOMapFeatureAccess) initWithQueue:&_dispatch_main_q];
    mapFeatureAccess = v2->_mapFeatureAccess;
    v2->_mapFeatureAccess = v3;

    [(GEOMapFeatureAccess *)v2->_mapFeatureAccess setAllowNetworkTileLoad:1];
    v5 = v2;
  }

  return v2;
}

+ (id)cachesWithRoute:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = objc_alloc_init(NavCameraCaches);
  [(NavCameraCaches *)v7 setCurrentRoute:v6];

  [(NavCameraCaches *)v7 setNavContex:v5];
  v8 = [(NavCameraCaches *)v7 currentRoute];
  id v9 = [v8 stepsCount];

  v10 = +[NSArray _navigation_newArrayWithDefaultValue:&off_1013A8A58 withCapacity:v9];
  [(NavCameraCaches *)v7 setStepsWithCloseDistanceCache:v10];

  v11 = +[NSArray _navigation_newArrayWithDefaultValue:&off_1013A8A58 withCapacity:v9];
  [(NavCameraCaches *)v7 setStepsWithNearDistanceCache:v11];

  v12 = +[NSArray _navigation_newArrayWithDefaultValue:&off_1013A8A58 withCapacity:v9];
  [(NavCameraCaches *)v7 setStepsWithRoundaboutCache:v12];

  v13 = +[NSArray _navigation_newArrayWithDefaultValue:&off_1013A8A70 withCapacity:v9];
  [(NavCameraCaches *)v7 setStepsWithRampCache:v13];

  [(NavCameraCaches *)v7 recalculateGroupedManeuversCaches];

  return v7;
}

- (void)recalculateGroupedManeuversCaches
{
  [(NavCameraCaches *)self _calculateRouteGroupedManeuvers];
  [(NavCameraCaches *)self _updateGroupedManeuverCounts];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1007B4A30;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  [(NavCameraCaches *)self _calculateRoadTileGroupedManeuversWithUpdateHandler:v3];
}

- (void)_updateGroupedManeuverCounts
{
  v3 = [(NavCameraCaches *)self currentRoute];
  id v4 = [v3 stepsCount];

  id v5 = +[NSArray _navigation_newArrayWithDefaultValue:&off_1013A8A58 withCapacity:v4];
  id v6 = [v5 mutableCopy];

  objc_super v7 = [(NavCameraCaches *)self stepsWithCloseDistanceCache];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1007B4D30;
  v32[3] = &unk_1012F8B90;
  id v8 = v6;
  id v33 = v8;
  [v7 enumerateObjectsUsingBlock:v32];

  id v9 = [(NavCameraCaches *)self stepsWithRoundaboutCache];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1007B4D90;
  v30[3] = &unk_1012F8B90;
  id v10 = v8;
  id v31 = v10;
  [v9 enumerateObjectsUsingBlock:v30];

  stepsWithRampCache = self->_stepsWithRampCache;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1007B4DF0;
  v28[3] = &unk_1012F8B90;
  id v12 = v10;
  id v29 = v12;
  [(NSArray *)stepsWithRampCache enumerateObjectsUsingBlock:v28];
  stepsWithNearDistanceCache = self->_stepsWithNearDistanceCache;
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_1007B4E50;
  v26 = &unk_1012F8B90;
  id v14 = v12;
  id v27 = v14;
  [(NSArray *)stepsWithNearDistanceCache enumerateObjectsUsingBlock:&v23];
  if (objc_msgSend(v14, "count", v23, v24, v25, v26))
  {
    v15 = (char *)[v14 count];
    if (v15)
    {
      uint64_t v16 = 0;
      v17 = v15 - 1;
      do
      {
        v18 = [v14 objectAtIndexedSubscript:v17];
        if ([v18 unsignedIntegerValue])
        {
          v19 = +[NSNumber numberWithUnsignedInteger:++v16];
        }
        else
        {
          if (v16) {
            uint64_t v20 = v16 + 1;
          }
          else {
            uint64_t v20 = 0;
          }
          v19 = +[NSNumber numberWithUnsignedInteger:v20];
          uint64_t v16 = 0;
        }
        [v14 setObject:v19 atIndexedSubscript:v17];

        --v17;
      }
      while (v17 != (char *)-1);
    }
  }
  [(NavCameraCaches *)self setGroupedManeuverCounts:v14];
  v21 = [(NavCameraCaches *)self groupedManeuverCounts];
  v22 = [(NavCameraCaches *)self navContex];
  [v22 setGroupedManeuverCounts:v21];
}

- (void)_calculateRouteGroupedManeuvers
{
  id v4 = [(NavCameraCaches *)self currentRoute];
  id v5 = [v4 stepsCount];

  GEOConfigGetDouble();
  double v7 = v6;
  GEOConfigGetDouble();
  double v9 = v8;
  GEOConfigGetDouble();
  double v11 = v10;
  id v12 = +[NSArray _navigation_newArrayWithDefaultValue:&off_1013A8A58 withCapacity:v5];
  id v48 = [v12 mutableCopy];

  v13 = +[NSArray _navigation_newArrayWithDefaultValue:&off_1013A8A58 withCapacity:v5];
  id v47 = [v13 mutableCopy];

  id v14 = +[NSArray _navigation_newArrayWithDefaultValue:&off_1013A8A58 withCapacity:v5];
  id v46 = [v14 mutableCopy];

  v45 = self;
  v15 = [(NavCameraCaches *)self currentRoute];
  uint64_t v16 = [v15 steps];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v16;
  id v17 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v52;
    uint64_t v20 = &off_1013A8A88;
    do
    {
      v21 = 0;
      id v49 = v18;
      do
      {
        if (*(void *)v52 != v19) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v21);
        id v23 = [v22 stepIndex];
        [v22 distance];
        if (v24 > 0.0)
        {
          [v22 distance];
          if (v25 <= v7) {
            [v48 setObject:v20 atIndexedSubscript:v23];
          }
        }
        [v22 distance];
        if (v26 > 0.0)
        {
          [v22 distance];
          if (v27 <= v9) {
            [v47 setObject:v20 atIndexedSubscript:v23];
          }
        }
        v28 = [v22 geoStep];
        int v29 = [v28 maneuverType];
        if (v29 < 41
          || ([v22 geoStep],
              v2 = objc_claimAutoreleasedReturnValue(),
              (int)[v2 maneuverType] >= 60))
        {
          id v33 = [v22 geoStep];
          if ([v33 maneuverType] == 6)
          {
            [v22 distance];
            if (v34 <= 0.0)
            {

              if (v29 > 40) {
LABEL_24:
              }

              goto LABEL_36;
            }
            [v22 distance];
            BOOL v36 = v35 <= v11;
          }
          else
          {
            uint64_t v37 = v19;
            v38 = v20;
            v39 = [v22 geoStep];
            if ([v39 maneuverType] != 7)
            {

              if (v29 > 40) {
              uint64_t v20 = v38;
              }
              uint64_t v19 = v37;
              id v18 = v49;
              goto LABEL_36;
            }
            [v22 distance];
            if (v40 <= 0.0)
            {
              BOOL v36 = 0;
            }
            else
            {
              [v22 distance];
              BOOL v36 = v41 <= v11;
            }

            uint64_t v20 = v38;
            uint64_t v19 = v37;
            id v18 = v49;
          }

          if (v29 <= 40)
          {

            if (!v36) {
              goto LABEL_36;
            }
LABEL_35:
            [v46 setObject:v20 atIndexedSubscript:v23];
            goto LABEL_36;
          }

          if (v36) {
            goto LABEL_35;
          }
        }
        else
        {
          [v22 distance];
          if (v30 <= 0.0) {
            goto LABEL_24;
          }
          [v22 distance];
          double v32 = v31;

          if (v32 <= v11) {
            goto LABEL_35;
          }
        }
LABEL_36:
        v21 = (char *)v21 + 1;
      }
      while (v18 != v21);
      id v18 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v18);
  }

  id v42 = [v48 copy];
  [(NavCameraCaches *)v45 setStepsWithCloseDistanceCache:v42];

  id v43 = [v47 copy];
  [(NavCameraCaches *)v45 setStepsWithNearDistanceCache:v43];

  id v44 = [v46 copy];
  [(NavCameraCaches *)v45 setStepsWithRoundaboutCache:v44];
}

- (void)_calculateRoadTileGroupedManeuversWithUpdateHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(NavCameraCaches *)self currentRoute];
  id v6 = [v5 stepsCount];

  double v7 = +[NSArray _navigation_newArrayWithDefaultValue:&off_1013A8A70 withCapacity:v6];
  id v8 = [v7 mutableCopy];

  double v9 = [(NavCameraCaches *)self currentRoute];
  double v10 = [v9 steps];

  GEOConfigGetDouble();
  double v12 = v11;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v10;
  id v13 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v37;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v18 = [v17 stepIndex];
        uint64_t v19 = [v8 objectAtIndexedSubscript:v18];
        unint64_t v20 = (unint64_t)[v19 integerValue];

        if ((v20 & 0x8000000000000000) != 0)
        {
          [v17 distance];
          if (v22 > v12)
          {
            [v8 setObject:&off_1013A8A58 atIndexedSubscript:v18];
            v4[2](v4);
          }
          id v23 = [(NavCameraCaches *)self currentRoute];
          [v23 pointAtRouteCoordinate:[v17 endRouteCoordinate]];
          double v25 = v24;
          double v27 = v26;

          v28 = [(NavCameraCaches *)self currentRoute];
          [v28 courseAtRouteCoordinateIndex:[v17 endRouteCoordinate]];
          double v30 = v29;

          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_1007B5638;
          v32[3] = &unk_1012F8BB8;
          void v32[4] = self;
          id v35 = v18;
          id v33 = v8;
          double v34 = v4;
          -[NavCameraCaches _roadForCoordinate:course:handler:](self, "_roadForCoordinate:course:handler:", v32, v25, v27, v30);
        }
        else
        {
          v21 = [(NSArray *)self->_stepsWithRampCache objectAtIndexedSubscript:v18];
          [v8 setObject:v21 atIndexedSubscript:v18];
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v14);
  }
}

- (void)_roadForCoordinate:(id)a3 course:(double)a4 handler:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v9 = a5;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0x4039000000000000;
  mapFeatureAccess = self->_mapFeatureAccess;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1007B5804;
  v13[3] = &unk_1012F8BE0;
  double v16 = var0;
  double v17 = var1;
  double v18 = a4;
  uint64_t v15 = v19;
  id v11 = v9;
  id v14 = v11;
  id v12 = -[GEOMapFeatureAccess findRoadsNear:radius:handler:completionHandler:](mapFeatureAccess, "findRoadsNear:radius:handler:completionHandler:", v13, 0, var0, var1, 50.0);

  _Block_object_dispose(v19, 8);
}

- (NSArray)stepsWithRampCache
{
  return self->_stepsWithRampCache;
}

- (void)setStepsWithRampCache:(id)a3
{
}

- (NSArray)stepsWithCloseDistanceCache
{
  return self->_stepsWithCloseDistanceCache;
}

- (void)setStepsWithCloseDistanceCache:(id)a3
{
}

- (NSArray)stepsWithNearDistanceCache
{
  return self->_stepsWithNearDistanceCache;
}

- (void)setStepsWithNearDistanceCache:(id)a3
{
}

- (NSArray)stepsWithRoundaboutCache
{
  return self->_stepsWithRoundaboutCache;
}

- (void)setStepsWithRoundaboutCache:(id)a3
{
}

- (NSArray)groupedManeuverCounts
{
  return self->_groupedManeuverCounts;
}

- (void)setGroupedManeuverCounts:(id)a3
{
}

- (GEOComposedRoute)currentRoute
{
  return self->_currentRoute;
}

- (void)setCurrentRoute:(id)a3
{
}

- (GEOMapFeatureAccess)mapFeatureAccess
{
  return self->_mapFeatureAccess;
}

- (void)setMapFeatureAccess:(id)a3
{
}

- (VKNavContext)navContex
{
  return self->_navContex;
}

- (void)setNavContex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navContex, 0);
  objc_storeStrong((id *)&self->_mapFeatureAccess, 0);
  objc_storeStrong((id *)&self->_currentRoute, 0);
  objc_storeStrong((id *)&self->_groupedManeuverCounts, 0);
  objc_storeStrong((id *)&self->_stepsWithRoundaboutCache, 0);
  objc_storeStrong((id *)&self->_stepsWithNearDistanceCache, 0);
  objc_storeStrong((id *)&self->_stepsWithCloseDistanceCache, 0);

  objc_storeStrong((id *)&self->_stepsWithRampCache, 0);
}

@end