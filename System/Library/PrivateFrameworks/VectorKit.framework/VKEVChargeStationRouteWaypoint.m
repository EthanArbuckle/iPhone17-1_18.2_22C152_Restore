@interface VKEVChargeStationRouteWaypoint
- (GEOComposedRouteEVChargingStationInfo)chargeInfo;
- (NSString)chargeTimeText;
- (VKEVChargeStationRouteWaypoint)initWithWaypoint:(id)a3 displayInfo:(id)a4 legIndex:(unint64_t)a5 routeCoordinate:(id)a6 adjacentRouteCoordinate:(id)a7 polylineCoordinate:(PolylineCoordinate)a8;
- (void)setChargeTimeText:(id)a3;
@end

@implementation VKEVChargeStationRouteWaypoint

- (void).cxx_destruct
{
}

- (NSString)chargeTimeText
{
  return self->_chargeTimeText;
}

- (GEOComposedRouteEVChargingStationInfo)chargeInfo
{
  v2 = [(VKRouteWaypointInfo *)self waypoint];
  v3 = [v2 chargingInfo];

  return (GEOComposedRouteEVChargingStationInfo *)v3;
}

- (void)setChargeTimeText:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_chargeTimeText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_chargeTimeText, a3);
    [(VKRouteWaypointInfo *)self setNeedsTextUpdate:1];
  }
}

- (VKEVChargeStationRouteWaypoint)initWithWaypoint:(id)a3 displayInfo:(id)a4 legIndex:(unint64_t)a5 routeCoordinate:(id)a6 adjacentRouteCoordinate:(id)a7 polylineCoordinate:(PolylineCoordinate)a8
{
  v12.receiver = self;
  v12.super_class = (Class)VKEVChargeStationRouteWaypoint;
  v8 = -[VKRouteWaypointInfo initWithWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:waypointType:](&v12, sel_initWithWaypoint_displayInfo_legIndex_routeCoordinate_adjacentRouteCoordinate_polylineCoordinate_waypointType_, a3, a4, a5, a8, 2, a6.var0, a6.var1, a6.var2, a7.var0, a7.var1, a7.var2);
  v9 = v8;
  if (v8) {
    v10 = v8;
  }

  return v9;
}

@end