@interface VKRouteWaypointInfo
+ (id)newRouteWaypointForAnchorpoint:(id)a3 legIndex:(unint64_t)a4 routeCoordinate:(id)a5 adjacentRouteCoordinate:(id)a6 polylineCoordinate:(PolylineCoordinate)a7;
+ (id)newRouteWaypointForWaypoint:(id)a3 displayInfo:(id)a4 legIndex:(unint64_t)a5 routeCoordinate:(id)a6 adjacentRouteCoordinate:(id)a7 polylineCoordinate:(PolylineCoordinate)a8;
- ($1AB5FA073B851C12C2339EC22442E995)adjacentRouteCoordinate;
- ($1AB5FA073B851C12C2339EC22442E995)coordinate;
- ($1AB5FA073B851C12C2339EC22442E995)routeCoordinate;
- (BOOL)_isAnchorpoint;
- (BOOL)isAtEnd;
- (BOOL)isAtStart;
- (BOOL)isOnSelectedRoute;
- (BOOL)needsTextUpdate;
- (GEOComposedWaypoint)waypoint;
- (GEOFeatureStyleAttributes)styleAttributes;
- (NSString)annotationText;
- (NSString)name;
- (PolylineCoordinate)polylineCoordinate;
- (VKRouteWaypointInfo)initWithWaypoint:(id)a3 displayInfo:(id)a4 legIndex:(unint64_t)a5 routeCoordinate:(id)a6 adjacentRouteCoordinate:(id)a7 polylineCoordinate:(PolylineCoordinate)a8 waypointType:(unsigned __int8)a9;
- (id).cxx_construct;
- (id)_anchorpoint;
- (unint64_t)legIndex;
- (unint64_t)muid;
- (unint64_t)waypointIndex;
- (unsigned)type;
- (unsigned)when;
- (void)setIsAtEnd:(BOOL)a3;
- (void)setIsAtStart:(BOOL)a3;
- (void)setIsOnSelectedRoute:(BOOL)a3;
- (void)setNeedsTextUpdate:(BOOL)a3;
- (void)setWaypointIndex:(unint64_t)a3;
- (void)setWhen:(unsigned __int8)a3;
@end

@implementation VKRouteWaypointInfo

- (id).cxx_construct
{
  *((void *)self + 12) = 0xBF80000000000000;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationText, 0);
  objc_storeStrong((id *)&self->_displayInfo, 0);
  objc_storeStrong((id *)&self->_waypoint, 0);
}

- (void)setWaypointIndex:(unint64_t)a3
{
  self->_waypointIndex = a3;
}

- (unint64_t)waypointIndex
{
  return self->_waypointIndex;
}

- (NSString)annotationText
{
  return self->_annotationText;
}

- (void)setIsOnSelectedRoute:(BOOL)a3
{
  self->_isOnSelectedRoute = a3;
}

- (BOOL)isOnSelectedRoute
{
  return self->_isOnSelectedRoute;
}

- (void)setIsAtEnd:(BOOL)a3
{
  self->_isAtEnd = a3;
}

- (BOOL)isAtEnd
{
  return self->_isAtEnd;
}

- (void)setIsAtStart:(BOOL)a3
{
  self->_isAtStart = a3;
}

- (BOOL)isAtStart
{
  return self->_isAtStart;
}

- (PolylineCoordinate)polylineCoordinate
{
  return self->_polylineCoordinate;
}

- ($1AB5FA073B851C12C2339EC22442E995)adjacentRouteCoordinate
{
  double latitude = self->_adjacentRouteCoordinate.latitude;
  double longitude = self->_adjacentRouteCoordinate.longitude;
  double altitude = self->_adjacentRouteCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)routeCoordinate
{
  double latitude = self->_routeCoordinate.latitude;
  double longitude = self->_routeCoordinate.longitude;
  double altitude = self->_routeCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setNeedsTextUpdate:(BOOL)a3
{
  self->_needsTextUpdate = a3;
}

- (BOOL)needsTextUpdate
{
  return self->_needsTextUpdate;
}

- (unint64_t)legIndex
{
  return self->_legIndex;
}

- (void)setWhen:(unsigned __int8)a3
{
  self->_when = a3;
}

- (unsigned)when
{
  return self->_when;
}

- (unsigned)type
{
  return self->_type;
}

- (GEOComposedWaypoint)waypoint
{
  return self->_waypoint;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinate
{
  if ([(VKRouteWaypointInfo *)self _isAnchorpoint])
  {
    v3 = [(VKRouteWaypointInfo *)self _anchorpoint];
    [v3 locationCoordinate];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;

    double v10 = v5;
    double v11 = v7;
    double v12 = v9;
  }
  else
  {
    waypoint = self->_waypoint;
    [(GEOComposedWaypoint *)waypoint coordinate];
  }
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (unint64_t)muid
{
  if ([(VKRouteWaypointInfo *)self _isAnchorpoint])
  {
    v3 = [(VKRouteWaypointInfo *)self _anchorpoint];
    unint64_t v4 = [v3 muid];

    return v4;
  }
  else
  {
    waypoint = self->_waypoint;
    return [(GEOComposedWaypoint *)waypoint muid];
  }
}

- (NSString)name
{
  if ([(VKRouteWaypointInfo *)self _isAnchorpoint])
  {
    v3 = [(VKRouteWaypointInfo *)self _anchorpoint];
    unint64_t v4 = [v3 name];
  }
  else
  {
    unint64_t v4 = [(GEOComposedWaypoint *)self->_waypoint name];
  }
  return (NSString *)v4;
}

- (id)_anchorpoint
{
  if ([(VKRouteWaypointInfo *)self _isAnchorpoint]) {
    waypoint = self->_waypoint;
  }
  else {
    waypoint = 0;
  }
  return waypoint;
}

- (BOOL)_isAnchorpoint
{
  return self->_type == 4;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  v3 = [(GEOComposedWaypointDisplayInfo *)self->_displayInfo artwork];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F645A0]);
    double v5 = [(GEOComposedWaypointDisplayInfo *)self->_displayInfo artwork];
    double v6 = [v5 icon];
    double v7 = [v6 styleAttributes];
    uint64_t v8 = [v4 initWithGEOStyleAttributes:v7];
LABEL_5:
    double v11 = (void *)v8;

    goto LABEL_6;
  }
  double v9 = [(GEOComposedWaypoint *)self->_waypoint artwork];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F645A0]);
    double v5 = [(GEOComposedWaypoint *)self->_waypoint artwork];
    double v6 = [v5 iconDataSource];
    double v7 = [v6 styleAttributes];
    uint64_t v8 = [v10 initWithGEOStyleAttributes:v7];
    goto LABEL_5;
  }
  v13 = [(VKRouteWaypointInfo *)self _anchorpoint];
  v14 = [v13 styleAttributes];

  if (!v14)
  {
    v15 = [(GEOComposedWaypoint *)self->_waypoint styleAttributes];

    if (v15)
    {
      uint64_t v16 = [(GEOComposedWaypoint *)self->_waypoint styleAttributes];
    }
    else
    {
      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithAttributes:", 5, 3, 6, 348, 0);
    }
    double v11 = (void *)v16;
    goto LABEL_7;
  }
  double v5 = [(VKRouteWaypointInfo *)self _anchorpoint];
  double v11 = [v5 styleAttributes];
LABEL_6:

LABEL_7:
  return (GEOFeatureStyleAttributes *)v11;
}

- (VKRouteWaypointInfo)initWithWaypoint:(id)a3 displayInfo:(id)a4 legIndex:(unint64_t)a5 routeCoordinate:(id)a6 adjacentRouteCoordinate:(id)a7 polylineCoordinate:(PolylineCoordinate)a8 waypointType:(unsigned __int8)a9
{
  double var2 = a7.var2;
  double var1 = a7.var1;
  double var0 = a7.var0;
  double v14 = a6.var2;
  double v15 = a6.var1;
  double v16 = a6.var0;
  id v21 = a3;
  id v22 = a4;
  v31.receiver = self;
  v31.super_class = (Class)VKRouteWaypointInfo;
  v23 = [(VKRouteWaypointInfo *)&v31 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_waypoint, a3);
    objc_storeStrong((id *)&v24->_displayInfo, a4);
    v24->_type = a9;
    v24->_legIndex = a5;
    v24->_needsTextUpdate = 0;
    v24->_routeCoordinate.double latitude = v16;
    v24->_routeCoordinate.double longitude = v15;
    v24->_routeCoordinate.double altitude = v14;
    v24->_adjacentRouteCoordinate.double latitude = var0;
    v24->_adjacentRouteCoordinate.double longitude = var1;
    v24->_adjacentRouteCoordinate.double altitude = var2;
    v24->_polylineCoordinate = a8;
    v24->_when = 1;
    displayInfo = v24->_displayInfo;
    if (displayInfo)
    {
      v26 = [(GEOComposedWaypointDisplayInfo *)displayInfo waypointCaption];
      uint64_t v27 = [v26 stringWithDefaultOptions];
      annotationText = v24->_annotationText;
      v24->_annotationText = (NSString *)v27;
    }
    else
    {
      v26 = v24->_annotationText;
      v24->_annotationText = 0;
    }

    v29 = v24;
  }

  return v24;
}

+ (id)newRouteWaypointForAnchorpoint:(id)a3 legIndex:(unint64_t)a4 routeCoordinate:(id)a5 adjacentRouteCoordinate:(id)a6 polylineCoordinate:(PolylineCoordinate)a7
{
  double var2 = a6.var2;
  double var1 = a6.var1;
  double var0 = a6.var0;
  double v11 = a5.var2;
  double v12 = a5.var1;
  double v13 = a5.var0;
  id v15 = a3;
  double v16 = [VKRouteWaypointInfo alloc];
  v17 = [v15 displayInfo];
  v18 = -[VKRouteWaypointInfo initWithWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:waypointType:](v16, "initWithWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:waypointType:", v15, v17, a4, a7, 4, v13, v12, v11, var0, var1, var2);

  return v18;
}

+ (id)newRouteWaypointForWaypoint:(id)a3 displayInfo:(id)a4 legIndex:(unint64_t)a5 routeCoordinate:(id)a6 adjacentRouteCoordinate:(id)a7 polylineCoordinate:(PolylineCoordinate)a8
{
  double var2 = a7.var2;
  double var1 = a7.var1;
  double var0 = a7.var0;
  double v12 = a6.var2;
  double v13 = a6.var1;
  double v14 = a6.var0;
  id v17 = a3;
  id v18 = a4;
  v19 = [v17 chargingInfo];

  if (!v19)
  {
    id v22 = v17;
    v23 = [v22 styleAttributes];

    if (v23)
    {
      v24 = [v22 styleAttributes];
      uint64_t v25 = [v24 featureStyleAttributes];
      if (*(unsigned char *)(v25 + 33))
      {
        uint64_t v26 = 0;
        uint64_t v27 = *(int **)v25;
        while (1)
        {
          int v28 = *v27;
          v27 += 2;
          if (v28 == 6) {
            break;
          }
          if (*(unsigned __int8 *)(v25 + 33) == ++v26) {
            goto LABEL_9;
          }
        }
        int v31 = *(_DWORD *)(*(void *)v25 + 8 * v26 + 4);

        if (v31 == 456)
        {
          v20 = off_1E5A8B240;
          goto LABEL_3;
        }
LABEL_11:
        id v21 = -[VKRouteWaypointInfo initWithWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:waypointType:]([VKRouteWaypointInfo alloc], "initWithWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:waypointType:", v22, v18, a5, a8, 1, v14, v13, v12, var0, var1, var2);
        goto LABEL_12;
      }
LABEL_9:
    }
    goto LABEL_11;
  }
  v20 = off_1E5A8B128;
LABEL_3:
  id v21 = (VKRouteWaypointInfo *)objc_msgSend(objc_alloc(*v20), "initWithWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:", v17, v18, a5, a8, v14, v13, v12, var0, var1, var2);
LABEL_12:
  v29 = v21;

  return v29;
}

@end