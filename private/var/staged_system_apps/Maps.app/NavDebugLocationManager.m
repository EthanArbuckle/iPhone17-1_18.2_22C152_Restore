@interface NavDebugLocationManager
- (MKMapView)mapView;
- (NavDebugLocationManager)init;
- (id)rendererForOverlay:(id)a3;
- (id)viewForAnnotation:(id)a3;
- (void)addLocation:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setMapView:(id)a3;
@end

@implementation NavDebugLocationManager

- (NavDebugLocationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)NavDebugLocationManager;
  v2 = [(NavDebugLocationManager *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    overlays = v2->_overlays;
    v2->_overlays = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    annotations = v2->_annotations;
    v2->_annotations = v5;

    v7 = +[NSUserDefaults standardUserDefaults];
    [v7 addObserver:v2 forKeyPath:@"NavigationShowRawGPSTrail" options:0 context:0];

    v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"NavigationShowRawGPSTrail"];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v4 = [(NSMutableDictionary *)self->_overlays allValues];
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        mapView = self->_mapView;
        objc_super v10 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v8) overlay];
        [(MKMapView *)mapView removeOverlay:v10];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = self->_annotations;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        [(MKMapView *)self->_mapView removeAnnotation:*(void *)(*((void *)&v17 + 1) + 8 * (void)v15)];
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  v16.receiver = self;
  v16.super_class = (Class)NavDebugLocationManager;
  [(NavDebugLocationManager *)&v16 dealloc];
}

- (void)setMapView:(id)a3
{
  id v5 = (MKMapView *)a3;
  p_mapView = (id *)&self->_mapView;
  if (self->_mapView != v5)
  {
    id obj = a3;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v7 = [(NSMutableDictionary *)self->_overlays allValues];
    id v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v13 = *p_mapView;
          uint64_t v14 = [v12 overlay];
          [v13 removeOverlay:v14];

          v15 = [v12 overlay];
          [(MKMapView *)v5 addOverlay:v15];
        }
        id v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    objc_super v16 = self->_annotations;
    id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v23 + 1) + 8 * (void)j);
          [*p_mapView removeAnnotation:v21];
          [(MKMapView *)v5 addAnnotation:v21];
        }
        id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v18);
    }

    if (!v5)
    {
      [(NSMutableDictionary *)self->_overlays removeAllObjects];
      [(NSMutableArray *)self->_annotations removeAllObjects];
    }
    objc_storeStrong((id *)&self->_mapView, obj);
  }
}

- (void)addLocation:(id)a3
{
  id v8 = a3;
  v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"NavigationShowRawGPSTrail"];

  if (v5)
  {
    if ((unint64_t)[(NSMutableArray *)self->_annotations count] >= 3)
    {
      id v6 = [(NSMutableArray *)self->_annotations firstObject];
      [(NSMutableArray *)self->_annotations removeObjectAtIndex:0];
      [(MKMapView *)self->_mapView removeAnnotation:v6];
    }
    uint64_t v7 = objc_alloc_init(DebugLocationAnnotation);
    [(DebugLocationAnnotation *)v7 setLocation:v8];
    [(DebugLocationAnnotation *)v7 setLocationType:0];
    [(NSMutableArray *)self->_annotations addObject:v7];
    [(MKMapView *)self->_mapView addAnnotation:v7];
  }
}

- (id)rendererForOverlay:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unsigned int v5 = [(NSMutableDictionary *)self->_overlays allValues];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 overlay];

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)viewForAnnotation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(MKMapView *)self->_mapView dequeueReusableAnnotationViewWithIdentifier:@"NavDebugLocationManager"];
    if (v6)
    {
      uint64_t v7 = v6;
      [(DebugLocationAnnotationView *)v6 setDebugLocationAnnotation:v5];
    }
    else
    {
      uint64_t v7 = [[DebugLocationAnnotationView alloc] initWithAnnotation:v5 debugLocationAnnotation:v5 reuseIdentifier:@"NavDebugLocationManager"];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"NavigationShowRawGPSTrail"]
    && ([v9 BOOLForKey:v8] & 1) == 0)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = self->_annotations;
    id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        long long v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          -[MKMapView removeAnnotation:](self->_mapView, "removeAnnotation:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v14), (void)v15);
          long long v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }

    [(NSMutableArray *)self->_annotations removeAllObjects];
  }
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_overlays, 0);

  objc_storeStrong((id *)&self->_mapView, 0);
}

@end