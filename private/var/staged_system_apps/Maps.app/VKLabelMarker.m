@interface VKLabelMarker
- (BOOL)_maps_hasCustomPOIAnnotation;
- (BOOL)_maps_isOfflineAnnotation;
- (BOOL)_maps_isOfflineClusterAnnotation;
- (BOOL)_maps_lineShouldZoomMapRegionOnSelection;
- (CustomPOIAnnotation)_maps_customPOIAnnotation;
- (NSArray)_maps_lineIdentifiers;
- (NSArray)_maps_loadedLineItems;
- (id)_maps_analyticsEventValue;
- (id)_maps_mapItem;
- (id)_maps_selectableRouteAnnotations;
- (unint64_t)_maps_numLines;
- (void)_maps_loadLineInfoUsingTraits:(id)a3 withCompletion:(id)a4;
- (void)set_maps_lineShouldZoomMapRegionOnSelection:(BOOL)a3;
@end

@implementation VKLabelMarker

- (unint64_t)_maps_numLines
{
  if (![(VKLabelMarker *)self isTransitLine]) {
    return 0;
  }

  return (unint64_t)[(VKLabelMarker *)self countFeatureIDs];
}

- (NSArray)_maps_lineIdentifiers
{
  if ([(VKLabelMarker *)self isTransitLine])
  {
    unint64_t v3 = [(VKLabelMarker *)self _maps_numLines];
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v3];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        uint64_t v6 = *((void *)[(VKLabelMarker *)self featureIDs] + i);
        id v7 = objc_alloc((Class)MKMapItemIdentifier);
        [(VKLabelMarker *)self coordinate];
        id v8 = [v7 initWithMUID:v6 resultProviderID:0 coordinate:];
        if (v8) {
          [v4 addObject:v8];
        }
      }
    }
    v9 = +[NSArray arrayWithArray:v4];
  }
  else
  {
    v9 = 0;
  }

  return (NSArray *)v9;
}

- (void)_maps_loadLineInfoUsingTraits:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  if ([(VKLabelMarker *)self isTransitLine])
  {
    id v8 = objc_getAssociatedObject(self, &unk_10160EAB1);
    if (v8)
    {
      if (v7) {
        v7[2](v7, v8, 0);
      }
    }
    else
    {
      uint64_t v9 = objc_getAssociatedObject(self, &unk_10160EAB2);
      if (v9)
      {
        id v10 = (id)v9;
        if (v7)
        {
          v11 = objc_retainBlock(v7);
          [v10 addObject:v11];
        }
      }
      else
      {
        if (v7)
        {
          v12 = objc_retainBlock(v7);
          v13 = +[NSMutableArray arrayWithObject:v12];
        }
        else
        {
          v13 = +[NSMutableArray array];
        }
        objc_setAssociatedObject(self, &unk_10160EAB2, v13, (void *)1);
        v14 = +[MKMapService sharedService];
        v15 = [(VKLabelMarker *)self _maps_lineIdentifiers];
        v16 = [v14 ticketForTransitLines:v15 traits:v6];

        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1003BE0E4;
        v17[3] = &unk_1012E7B20;
        v17[4] = self;
        id v10 = v13;
        id v18 = v10;
        [v16 submitWithHandler:v17 networkActivity:0];
      }
    }
  }
  else if (v7)
  {
    v7[2](v7, 0, 0);
  }
}

- (id)_maps_analyticsEventValue
{
  unint64_t v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(VKLabelMarker *)self _maps_lineIdentifiers];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [*(id *)(*((void *)&v12 + 1) + 8 * i) muid]);
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 componentsJoinedByString:@","];

  return v10;
}

- (NSArray)_maps_loadedLineItems
{
  return (NSArray *)objc_getAssociatedObject(self, &unk_10160EAB1);
}

- (BOOL)_maps_lineShouldZoomMapRegionOnSelection
{
  v2 = objc_getAssociatedObject(self, &unk_10160EAB0);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)set_maps_lineShouldZoomMapRegionOnSelection:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, &unk_10160EAB0, v4, (void *)3);
}

- (BOOL)_maps_hasCustomPOIAnnotation
{
  v2 = [(VKLabelMarker *)self featureAnnotation];
  unsigned __int8 v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 conformsToProtocol:&OBJC_PROTOCOL___CustomPOIAnnotation];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (CustomPOIAnnotation)_maps_customPOIAnnotation
{
  v2 = [(VKLabelMarker *)self featureAnnotation];
  unsigned __int8 v3 = v2;
  if (v2 && [v2 conformsToProtocol:&OBJC_PROTOCOL___CustomPOIAnnotation]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CustomPOIAnnotation *)v4;
}

- (BOOL)_maps_isOfflineAnnotation
{
  v2 = [(VKLabelMarker *)self featureAnnotation];
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

- (BOOL)_maps_isOfflineClusterAnnotation
{
  if ([(VKLabelMarker *)self isCluster]) {
    BOOL v3 = [(VKLabelMarker *)self clusterFeatureCount] != 0;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = [(VKLabelMarker *)self clusterFeatureAnnotations];
  id v5 = [v4 firstObject];

  char isKindOfClass = 0;
  if (v3 && v5)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)_maps_mapItem
{
  BOOL v3 = +[UIApplication sharedMapsDelegate];
  id v4 = [v3 poiSearchManager];
  id v5 = [(VKLabelMarker *)self identifier];
  id v6 = [v4 searchResultForIdentifier:v5];

  id v7 = [v6 mapItem];
  if (!v7) {
    id v7 = [objc_alloc((Class)MKMapItem) _initWithLabelMarker:self];
  }

  return v7;
}

- (id)_maps_selectableRouteAnnotations
{
  if ([(VKLabelMarker *)self isRouteAnnotation])
  {
    BOOL v3 = [(VKLabelMarker *)self routeAnnotations];
    id v4 = sub_100099700(v3, &stru_10131C650);
  }
  else
  {
    id v4 = &__NSArray0__struct;
  }

  return v4;
}

@end