@interface OverlayManager
- (MKMapView)mapView;
- (VKLabelMarker)selectedLabelMarker;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (void)addOverlay:(id)a3 level:(int64_t)a4 fromProvider:(id)a5;
- (void)addOverlayProvider:(id)a3;
- (void)removeOverlay:(id)a3 fromProvider:(id)a4;
- (void)removeOverlayProvider:(id)a3;
- (void)setMapView:(id)a3;
- (void)setSelectedLabelMarker:(id)a3;
@end

@implementation OverlayManager

- (void)addOverlayProvider:(id)a3
{
  id v4 = a3;
  providers = self->_providers;
  id v8 = v4;
  if (!providers)
  {
    v6 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:517 capacity:1];
    v7 = self->_providers;
    self->_providers = v6;

    id v4 = v8;
    providers = self->_providers;
  }
  [(NSHashTable *)providers addObject:v4];
}

- (void)removeOverlayProvider:(id)a3
{
  id v4 = a3;
  [(NSHashTable *)self->_providers removeObject:v4];
  v5 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v6 = self->_providerOverlays;
  id v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v12 = [(NSMapTable *)self->_providerOverlays objectForKey:v11];
        if (v12 == v4) {
          [v5 addObject:v11];
        }
      }
      id v8 = [(NSMapTable *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  [(MKMapView *)self->_mapView removeOverlays:v5];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v5;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[NSMapTable removeObjectForKey:](self->_providerOverlays, "removeObjectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * (void)j), (void)v18);
      }
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (void)addOverlay:(id)a3 level:(int64_t)a4 fromProvider:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  providerOverlays = self->_providerOverlays;
  if (!providerOverlays)
  {
    v10 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:517 capacity:1];
    uint64_t v11 = self->_providerOverlays;
    self->_providerOverlays = v10;

    providerOverlays = self->_providerOverlays;
  }
  [(NSMapTable *)providerOverlays setObject:v8 forKey:v12];
  [(MKMapView *)self->_mapView addOverlay:v12 level:a4];
}

- (void)removeOverlay:(id)a3 fromProvider:(id)a4
{
  mapView = self->_mapView;
  id v6 = a3;
  [(MKMapView *)mapView removeOverlay:v6];
  [(NSMapTable *)self->_providerOverlays removeObjectForKey:v6];
}

- (void)setMapView:(id)a3
{
  v5 = (MKMapView *)a3;
  mapView = self->_mapView;
  id v8 = v5;
  if (mapView != v5)
  {
    if (self->_selectedItemUncertaintyRadiusOverlay) {
      -[MKMapView removeOverlay:](mapView, "removeOverlay:");
    }
    objc_storeStrong((id *)&self->_mapView, a3);
    selectedItemUncertaintyRadiusOverlay = self->_selectedItemUncertaintyRadiusOverlay;
    if (selectedItemUncertaintyRadiusOverlay) {
      [(MKMapView *)self->_mapView addOverlay:selectedItemUncertaintyRadiusOverlay level:0];
    }
  }
}

- (void)setSelectedLabelMarker:(id)a3
{
  v5 = (VKLabelMarker *)a3;
  if (self->_selectedLabelMarker != v5)
  {
    v40 = v5;
    if (self->_selectedItemUncertaintyRadiusOverlay)
    {
      -[MKMapView removeOverlay:](self->_mapView, "removeOverlay:");
      selectedItemUncertaintyRadiusOverlay = self->_selectedItemUncertaintyRadiusOverlay;
      self->_selectedItemUncertaintyRadiusOverlay = 0;

      selectedItemUncertaintyRadiusColor = self->_selectedItemUncertaintyRadiusColor;
      self->_selectedItemUncertaintyRadiusColor = 0;
    }
    objc_storeStrong((id *)&self->_selectedLabelMarker, a3);
    id v8 = [(VKLabelMarker *)self->_selectedLabelMarker featureAnnotation];
    uint64_t v9 = v8;
    if (v8 && [v8 conformsToProtocol:&OBJC_PROTOCOL___CustomPOIAnnotation])
    {
      id v10 = v9;
      uint64_t v11 = [v10 parkedCar];
      id v12 = v11;
      if (v11)
      {
        [v11 horizontalAccuracy];
        if (v13 > 0.0)
        {
          [v12 coordinate];
          double v15 = v14;
          double v17 = v16;
          [v12 horizontalAccuracy];
          +[MKCircle circleWithCenterCoordinate:radius:](MKCircle, "circleWithCenterCoordinate:radius:", v15, v17, v18);
          long long v19 = (MKCircle *)objc_claimAutoreleasedReturnValue();
          long long v20 = self->_selectedItemUncertaintyRadiusOverlay;
          self->_selectedItemUncertaintyRadiusOverlay = v19;

          long long v21 = [v10 styleAttributes];
          long long v22 = [v21 styleAttributes];

          long long v23 = +[GEOFeatureStyleAttributes styleAttributesForCalloutWithAttributes:v22];

          long long v24 = [(OverlayManager *)self mapView];
          long long v25 = [v24 window];
          v26 = [v25 screen];
          if (v26)
          {
            v27 = [(OverlayManager *)self mapView];
            [v27 window];
            v28 = v39 = v23;
            v29 = [v28 screen];
            [v29 scale];
            double v31 = v30;

            long long v23 = v39;
          }
          else
          {
            v27 = +[UIScreen mainScreen];
            [v27 scale];
            double v31 = v32;
          }

          v33 = [(OverlayManager *)self mapView];
          v34 = [v33 _mapLayer];
          v35 = [v34 iconForStyleAttributes:v23 contentScale:8 size:1 transparent:v31];

          if (v35)
          {
            v36 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v35 fillColor]);
            v37 = [v36 colorWithAlphaComponent:0.200000003];
            v38 = self->_selectedItemUncertaintyRadiusColor;
            self->_selectedItemUncertaintyRadiusColor = v37;
          }
          [(MKMapView *)self->_mapView addOverlay:self->_selectedItemUncertaintyRadiusOverlay level:0];
        }
      }
    }
    v5 = v40;
  }
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6 = a3;
  id v7 = (MKCircle *)a4;
  if (self->_selectedItemUncertaintyRadiusOverlay == v7)
  {
    id v9 = [objc_alloc((Class)MKCircleRenderer) initWithCircle:self->_selectedItemUncertaintyRadiusOverlay];
    [v9 setFillColor:self->_selectedItemUncertaintyRadiusColor];
  }
  else
  {
    id v8 = [(NSMapTable *)self->_providerOverlays objectForKey:v7];
    id v9 = [v8 mapView:v6 rendererForOverlay:v7];
  }

  return v9;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (VKLabelMarker)selectedLabelMarker
{
  return self->_selectedLabelMarker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedLabelMarker, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_providerOverlays, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_selectedItemUncertaintyRadiusColor, 0);

  objc_storeStrong((id *)&self->_selectedItemUncertaintyRadiusOverlay, 0);
}

@end