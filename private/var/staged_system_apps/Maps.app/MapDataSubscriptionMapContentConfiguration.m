@interface MapDataSubscriptionMapContentConfiguration
- (MapDataSubscriptionMapContentConfiguration)initWithSubscriptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)makeContentView;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
@end

@implementation MapDataSubscriptionMapContentConfiguration

- (MapDataSubscriptionMapContentConfiguration)initWithSubscriptions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapDataSubscriptionMapContentConfiguration;
  v5 = [(MapDataSubscriptionMapContentConfiguration *)&v10 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    subscriptions = v5->_subscriptions;
    v5->_subscriptions = v6;

    v8 = v5;
  }

  return v5;
}

- (id)makeContentView
{
  v3 = objc_alloc_init(MapDataSubscriptionMapView);
  [(MapDataSubscriptionMapView *)v3 setDelegate:self];
  [(MapDataSubscriptionMapView *)v3 setScrollEnabled:0];
  [(MapDataSubscriptionMapView *)v3 setZoomEnabled:0];
  [(MapDataSubscriptionMapView *)v3 setRotateEnabled:0];
  v45 = v3;
  [(MapDataSubscriptionMapView *)v3 setPitchEnabled:0];
  id v4 = +[NSMutableArray array];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v5 = self->_subscriptions;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v52;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v52 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = [*(id *)(*((void *)&v51 + 1) + 8 * i) subscription];
        v11 = [v10 region];

        if ([v11 vertexsCount])
        {
          v12 = malloc_type_calloc((size_t)[v11 vertexsCount], 0x10uLL, 0x1000040451B5BE8uLL);
          v13 = [v11 vertexs];
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_100708DD0;
          v50[3] = &unk_1012F6140;
          v50[4] = v12;
          [v13 enumerateObjectsUsingBlock:v50];

          v14 = +[MKPolygon polygonWithCoordinates:count:](MKPolygon, "polygonWithCoordinates:count:", v12, [v11 vertexsCount]);
          free(v12);
          [v4 addObject:v14];
        }
        else
        {
          [v11 northLat];
          uint64_t v16 = v15;
          [v11 westLng];
          v56[0] = v16;
          v56[1] = v17;
          [v11 southLat];
          uint64_t v19 = v18;
          [v11 westLng];
          v56[2] = v19;
          v56[3] = v20;
          [v11 southLat];
          uint64_t v22 = v21;
          [v11 eastLng];
          v56[4] = v22;
          v56[5] = v23;
          [v11 northLat];
          uint64_t v25 = v24;
          [v11 eastLng];
          v56[6] = v25;
          v56[7] = v26;
          v27 = +[MKPolygon polygonWithCoordinates:v56 count:4];
          [v4 addObject:v27];
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v7);
  }

  double y = MKMapRectNull.origin.y;
  double width = MKMapRectNull.size.width;
  double height = MKMapRectNull.size.height;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v31 = v4;
  id v32 = [v31 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v47;
    double v35 = y;
    double x = MKMapRectNull.origin.x;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v47 != v34) {
          objc_enumerationMutation(v31);
        }
        v38 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
        if (x == MKMapRectNull.origin.x && v35 == y)
        {
          [v38 boundingMapRect];
        }
        else
        {
          [v38 boundingMapRect];
          v61.origin.double x = v40;
          v61.origin.double y = v41;
          v61.size.double width = v42;
          v61.size.double height = v43;
          v59.origin.double x = x;
          v59.origin.double y = v35;
          v59.size.double width = width;
          v59.size.double height = height;
          MKMapRect v60 = MKMapRectUnion(v59, v61);
        }
        double x = v60.origin.x;
        double v35 = v60.origin.y;
        double width = v60.size.width;
        double height = v60.size.height;
      }
      id v33 = [v31 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v33);
  }
  else
  {
    double v35 = y;
    double x = MKMapRectNull.origin.x;
  }

  -[MapDataSubscriptionMapView setVisibleMapRect:edgePadding:animated:](v45, "setVisibleMapRect:edgePadding:animated:", 0, x, v35, width, height, 20.0, 20.0, 20.0, 20.0);
  [(MapDataSubscriptionMapView *)v45 addOverlays:v31];

  return v45;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[MapDataSubscriptionMapContentConfiguration allocWithZone:a3];
  subscriptions = self->_subscriptions;

  return [(MapDataSubscriptionMapContentConfiguration *)v4 initWithSubscriptions:subscriptions];
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v4 = a4;
  id v5 = [objc_alloc((Class)MKPolygonRenderer) initWithOverlay:v4];

  id v6 = +[UIColor systemBlueColor];
  [v5 setStrokeColor:v6];

  id v7 = +[UIColor systemBlueColor];
  uint64_t v8 = [v7 colorWithAlphaComponent:0.400000006];
  [v5 setFillColor:v8];

  [v5 setLineWidth:3.0];

  return v5;
}

- (void).cxx_destruct
{
}

@end