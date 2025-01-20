@interface RouteTrafficFeaturesUpdater
- (id)_nearestTrafficCameraInFeatures:(id)a3 onRoute:(id)a4 ofType:(int64_t)a5 fromCoordinate:(id)a6;
- (void)updateTrafficFeatures:(id)a3 onRoute:(id)a4 forLocation:(id)a5;
@end

@implementation RouteTrafficFeaturesUpdater

- (void)updateTrafficFeatures:(id)a3 onRoute:(id)a4 forLocation:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  [v9 speed];
  if (v10 >= 0.0 && ([v9 locationUnreliable] & 1) == 0)
  {
    v11 = [v9 routeMatch];
    v12 = -[RouteTrafficFeaturesUpdater _nearestTrafficCameraInFeatures:onRoute:ofType:fromCoordinate:](self, "_nearestTrafficCameraInFeatures:onRoute:ofType:fromCoordinate:", v14, v8, 1, [v11 routeCoordinate]);

    [v9 speed];
    [v12 setIsAboveSpeedThreshold:v13 > [v12 speedThreshold]];
  }
}

- (id)_nearestTrafficCameraInFeatures:(id)a3 onRoute:(id)a4 ofType:(int64_t)a5 fromCoordinate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    double v13 = 0;
    uint64_t v14 = *(void *)v24;
    double v15 = 3.40282347e38;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v9);
        }
        v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v17 isCamera])
        {
          id v18 = v17;
          if ([v18 type] == (id)a5
            && ([v18 navigationState] == (id)2 || objc_msgSend(v18, "navigationState") == (id)1)
            && ((objc_msgSend(v10, "distanceFromPoint:toPoint:", a6, objc_msgSend(v18, "routeOffset")), v19 >= 0.0)
              ? (double v20 = v19)
              : (double v20 = -v19),
                v20 < v15))
          {
            id v21 = v18;

            double v13 = v21;
          }
          else
          {
            double v20 = v15;
          }

          double v15 = v20;
        }
      }
      id v12 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

@end