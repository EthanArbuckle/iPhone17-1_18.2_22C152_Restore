@interface VKPolylineGroupOverlay
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)containsTransit;
- (BOOL)showTraffic;
- (GEOMapRegion)boundingMapRegion;
- (NSSet)polylines;
- (NSString)description;
- (VKPolylineOverlay)focusedPolyline;
- (VKPolylineOverlay)selectedPolyline;
- (VKPolylineOverlay)skippedPolyline;
- (void)_updateBoundingMapRegion;
- (void)_updateContainsTransit;
- (void)addObserver:(id)a3;
- (void)addPolyline:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)removePolyline:(id)a3;
- (void)setFocusedPolyline:(id)a3;
- (void)setSelectedPolyline:(id)a3;
- (void)setShowTraffic:(BOOL)a3;
- (void)setSkippedPolyline:(id)a3;
@end

@implementation VKPolylineGroupOverlay

- (NSSet)polylines
{
  return &self->_polylines->super;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  if (!observers)
  {
    CFSetCallBacks v6 = *(CFSetCallBacks *)byte_1EF58FBA8;
    observers = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v6);
    self->_observers = observers;
  }
  CFSetAddValue(observers, v4);
}

- (VKPolylineOverlay)selectedPolyline
{
  return self->_selectedPolyline;
}

- (GEOMapRegion)boundingMapRegion
{
  return self->_boundingMapRegion;
}

- (void)setShowTraffic:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitRouteLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitRouteLog_onceToken, &__block_literal_global_33);
  }
  v5 = (id)GEOGetVectorKitRouteLog_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v16 = v3;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "VKPolylineGroupOverlay setShowTraffic: %d", buf, 8u);
  }

  if (self->_showTraffic != v3)
  {
    self->_showTraffic = v3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    CFSetCallBacks v6 = self->_polylines;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "setShowTraffic:", v3, (void)v10);
        }
        uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skippedPolyline, 0);
  objc_storeStrong((id *)&self->_focusedPolyline, 0);
  objc_storeStrong((id *)&self->_selectedPolyline, 0);
  objc_storeStrong((id *)&self->_boundingMapRegion, 0);
  objc_storeStrong((id *)&self->_polylines, 0);
}

- (BOOL)showTraffic
{
  return self->_showTraffic;
}

- (BOOL)containsTransit
{
  return self->_containsTransit;
}

- (VKPolylineOverlay)skippedPolyline
{
  return self->_skippedPolyline;
}

- (VKPolylineOverlay)focusedPolyline
{
  return self->_focusedPolyline;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<VKPolylineGroupOverlay: %p polylines:%@>", self, self->_polylines];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  [(GEOMapRegion *)self->_boundingMapRegion southLat];
  double v4 = v3;
  [(GEOMapRegion *)self->_boundingMapRegion northLat];
  double v6 = (v5 + v4) * 0.5;
  [(GEOMapRegion *)self->_boundingMapRegion westLng];
  double v8 = v7;
  [(GEOMapRegion *)self->_boundingMapRegion eastLng];
  double v10 = (v9 + v8) * 0.5;
  double v11 = v6;
  result.var1 = v10;
  result.var0 = v11;
  return result;
}

- (void)_updateContainsTransit
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  self->_containsTransit = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = self->_polylines;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (self->_containsTransit) {
          char v7 = 1;
        }
        else {
          char v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "containsTransit", (void)v8);
        }
        self->_containsTransit = v7;
      }
      uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_updateBoundingMapRegion
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  boundingMapRegion = self->_boundingMapRegion;
  self->_boundingMapRegion = 0;

  if ([(NSMutableSet *)self->_polylines count])
  {
    uint64_t v4 = (GEOMapRegion *)objc_alloc_init(MEMORY[0x1E4F64700]);
    uint64_t v5 = self->_boundingMapRegion;
    self->_boundingMapRegion = v4;

    [(GEOMapRegion *)self->_boundingMapRegion setNorthLat:-90.0];
    [(GEOMapRegion *)self->_boundingMapRegion setSouthLat:90.0];
    [(GEOMapRegion *)self->_boundingMapRegion setEastLng:-180.0];
    [(GEOMapRegion *)self->_boundingMapRegion setWestLng:180.0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    double v6 = self->_polylines;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          long long v10 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v9), "boundingMapRegion", (void)v28);
          [(GEOMapRegion *)self->_boundingMapRegion northLat];
          double v12 = v11;
          [v10 northLat];
          uint64_t v13 = (GEOMapRegion *)v10;
          if (v12 > v14) {
            uint64_t v13 = self->_boundingMapRegion;
          }
          [(GEOMapRegion *)v13 northLat];
          -[GEOMapRegion setNorthLat:](self->_boundingMapRegion, "setNorthLat:");
          [(GEOMapRegion *)self->_boundingMapRegion southLat];
          double v16 = v15;
          [v10 southLat];
          uint64_t v17 = (GEOMapRegion *)v10;
          if (v16 < v18) {
            uint64_t v17 = self->_boundingMapRegion;
          }
          [(GEOMapRegion *)v17 southLat];
          [(GEOMapRegion *)self->_boundingMapRegion setSouthLat:"setSouthLat:"];
          [(GEOMapRegion *)self->_boundingMapRegion eastLng];
          double v20 = v19;
          [v10 eastLng];
          v21 = (GEOMapRegion *)v10;
          if (v20 > v22) {
            v21 = self->_boundingMapRegion;
          }
          [(GEOMapRegion *)v21 eastLng];
          -[GEOMapRegion setEastLng:](self->_boundingMapRegion, "setEastLng:");
          [(GEOMapRegion *)self->_boundingMapRegion westLng];
          double v24 = v23;
          [v10 westLng];
          v25 = (GEOMapRegion *)v10;
          if (v24 < v26) {
            v25 = self->_boundingMapRegion;
          }
          [(GEOMapRegion *)v25 westLng];
          -[GEOMapRegion setWestLng:](self->_boundingMapRegion, "setWestLng:");

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v7);
    }

    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 postNotificationName:@"VKRouteOverlayBoundingMapRegionDidChange" object:self];
  }
}

- (void)setSkippedPolyline:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (VKPolylineOverlay *)a3;
  if (GEOGetVectorKitRouteLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitRouteLog_onceToken, &__block_literal_global_33);
  }
  double v6 = (id)GEOGetVectorKitRouteLog_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [(VKPolylineOverlay *)v5 composedRoute];
    uint64_t v8 = [v7 uniqueRouteID];
    *(_DWORD *)buf = 134218242;
    v21 = self;
    __int16 v22 = 2112;
    double v23 = v8;
    _os_log_impl(&dword_1A1780000, v6, OS_LOG_TYPE_INFO, "VKPolylineGroupOverlay %p setSelectedPolyline | route: %@", buf, 0x16u);
  }
  p_skippedPolyline = (id *)&self->_skippedPolyline;
  skippedPolyline = self->_skippedPolyline;
  if (skippedPolyline != v5)
  {
    if (v5)
    {
      if (![(NSMutableSet *)self->_polylines containsObject:v5]) {
        goto LABEL_17;
      }
      skippedPolyline = (VKPolylineOverlay *)*p_skippedPolyline;
    }
    [(VKPolylineOverlay *)skippedPolyline setSkipped:0];
    objc_storeStrong((id *)&self->_skippedPolyline, a3);
    [*p_skippedPolyline setSkipped:1];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v11 = self->_observers;
    uint64_t v12 = [(__CFSet *)v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "polylineGroup:didSkipPolyline:", self, v5, (void)v15);
        }
        uint64_t v12 = [(__CFSet *)v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
LABEL_17:
}

- (void)setFocusedPolyline:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (VKPolylineOverlay *)a3;
  if (GEOGetVectorKitRouteLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitRouteLog_onceToken, &__block_literal_global_33);
  }
  double v6 = (id)GEOGetVectorKitRouteLog_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [(VKPolylineOverlay *)v5 composedRoute];
    uint64_t v8 = [v7 uniqueRouteID];
    *(_DWORD *)buf = 134218242;
    v21 = self;
    __int16 v22 = 2112;
    double v23 = v8;
    _os_log_impl(&dword_1A1780000, v6, OS_LOG_TYPE_INFO, "VKPolylineGroupOverlay %p setFocusedPolyline | route: %@", buf, 0x16u);
  }
  p_focusedPolyline = (id *)&self->_focusedPolyline;
  focusedPolyline = self->_focusedPolyline;
  if (focusedPolyline != v5)
  {
    if (v5)
    {
      if (![(NSMutableSet *)self->_polylines containsObject:v5]) {
        goto LABEL_17;
      }
      focusedPolyline = (VKPolylineOverlay *)*p_focusedPolyline;
    }
    [(VKPolylineOverlay *)focusedPolyline setHasFocus:0];
    objc_storeStrong((id *)&self->_focusedPolyline, a3);
    [*p_focusedPolyline setHasFocus:1];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v11 = self->_observers;
    uint64_t v12 = [(__CFSet *)v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "polylineGroup:didFocusPolyline:", self, v5, (void)v15);
        }
        uint64_t v12 = [(__CFSet *)v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
LABEL_17:
}

- (void)setSelectedPolyline:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (VKPolylineOverlay *)a3;
  if (GEOGetVectorKitRouteLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitRouteLog_onceToken, &__block_literal_global_33);
  }
  double v6 = (id)GEOGetVectorKitRouteLog_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [(VKPolylineOverlay *)v5 composedRoute];
    uint64_t v8 = [v7 uniqueRouteID];
    *(_DWORD *)buf = 134218242;
    v21 = self;
    __int16 v22 = 2112;
    double v23 = v8;
    _os_log_impl(&dword_1A1780000, v6, OS_LOG_TYPE_INFO, "VKPolylineGroupOverlay %p setSelectedPolyline | route: %@", buf, 0x16u);
  }
  p_selectedPolyline = (id *)&self->_selectedPolyline;
  selectedPolyline = self->_selectedPolyline;
  if (selectedPolyline != v5)
  {
    if (v5)
    {
      if (![(NSMutableSet *)self->_polylines containsObject:v5]) {
        goto LABEL_17;
      }
      selectedPolyline = (VKPolylineOverlay *)*p_selectedPolyline;
    }
    [(VKPolylineOverlay *)selectedPolyline setSelected:0];
    objc_storeStrong((id *)&self->_selectedPolyline, a3);
    [*p_selectedPolyline setSelected:1];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v11 = self->_observers;
    uint64_t v12 = [(__CFSet *)v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "polylineGroup:didSelectPolyline:", self, v5, (void)v15);
        }
        uint64_t v12 = [(__CFSet *)v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
LABEL_17:
}

- (void)removePolyline:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (VKPolylineOverlay *)a3;
  if (GEOGetVectorKitRouteLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitRouteLog_onceToken, &__block_literal_global_33);
  }
  uint64_t v5 = (id)GEOGetVectorKitRouteLog_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double v6 = [(VKPolylineOverlay *)v4 composedRoute];
    uint64_t v7 = [v6 uniqueRouteID];
    BOOL showTraffic = self->_showTraffic;
    uint64_t v9 = [(VKPolylineOverlay *)v4 traffic];
    *(_DWORD *)buf = 134218754;
    double v20 = self;
    __int16 v21 = 2112;
    __int16 v22 = v7;
    __int16 v23 = 1024;
    BOOL v24 = showTraffic;
    __int16 v25 = 2112;
    double v26 = v9;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "VKPolylineGroupOverlay %p removePolyline | route: %@ | _showTraffic: %d | traffic: %@", buf, 0x26u);
  }
  if (([(NSMutableSet *)self->_polylines containsObject:v4] & 1) != 0
    && [(NSMutableSet *)self->_polylines containsObject:v4])
  {
    if (self->_selectedPolyline == v4) {
      [(VKPolylineGroupOverlay *)self setSelectedPolyline:0];
    }
    if (self->_focusedPolyline == v4) {
      [(VKPolylineGroupOverlay *)self setFocusedPolyline:0];
    }
    if (self->_skippedPolyline == v4) {
      [(VKPolylineGroupOverlay *)self setSkippedPolyline:0];
    }
    [(NSMutableSet *)self->_polylines removeObject:v4];
    [(VKPolylineGroupOverlay *)self _updateBoundingMapRegion];
    [(VKPolylineGroupOverlay *)self _updateContainsTransit];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v10 = self->_observers;
    uint64_t v11 = [(__CFSet *)v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "polylineGroup:didRemovePolyline:", self, v4, (void)v14);
        }
        uint64_t v11 = [(__CFSet *)v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)addPolyline:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (GEOGetVectorKitRouteLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitRouteLog_onceToken, &__block_literal_global_33);
  }
  uint64_t v5 = (id)GEOGetVectorKitRouteLog_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double v6 = [v4 composedRoute];
    uint64_t v7 = [v6 uniqueRouteID];
    BOOL showTraffic = self->_showTraffic;
    uint64_t v9 = [v4 traffic];
    *(_DWORD *)buf = 134218754;
    __int16 v23 = self;
    __int16 v24 = 2112;
    __int16 v25 = v7;
    __int16 v26 = 1024;
    BOOL v27 = showTraffic;
    __int16 v28 = 2112;
    long long v29 = v9;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "VKPolylineGroupOverlay %p addPolyline | route: %@ | _showTraffic: %d | traffic: %@", buf, 0x26u);
  }
  polylines = self->_polylines;
  if (!polylines)
  {
    uint64_t v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v12 = self->_polylines;
    self->_polylines = v11;

    polylines = self->_polylines;
  }
  if (([(NSMutableSet *)polylines containsObject:v4] & 1) == 0)
  {
    [v4 setShowTraffic:self->_showTraffic];
    [(NSMutableSet *)self->_polylines addObject:v4];
    [(VKPolylineGroupOverlay *)self _updateBoundingMapRegion];
    [(VKPolylineGroupOverlay *)self _updateContainsTransit];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v13 = self->_observers;
    uint64_t v14 = [(__CFSet *)v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "polylineGroup:didAddPolyline:", self, v4, (void)v17);
        }
        uint64_t v14 = [(__CFSet *)v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
}

- (void)removeObserver:(id)a3
{
}

- (void)dealloc
{
  observers = self->_observers;
  if (observers) {
    CFRelease(observers);
  }
  v4.receiver = self;
  v4.super_class = (Class)VKPolylineGroupOverlay;
  [(VKPolylineGroupOverlay *)&v4 dealloc];
}

@end