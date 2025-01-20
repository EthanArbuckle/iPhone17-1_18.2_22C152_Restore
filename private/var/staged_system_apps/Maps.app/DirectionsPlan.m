@interface DirectionsPlan
+ (Class)handlesForSharingETAType;
+ (Class)planningWaypointType;
+ (id)_maps_expiryDateForRoute:(id)a3;
- (BOOL)avoidHighways;
- (BOOL)avoidTolls;
- (BOOL)hasArrivalTime;
- (BOOL)hasAvoidHighways;
- (BOOL)hasAvoidTolls;
- (BOOL)hasCompanionRouteContextData;
- (BOOL)hasCurrentRouteIndex;
- (BOOL)hasCurrentRouteStep;
- (BOOL)hasDepartureTime;
- (BOOL)hasDestinationString;
- (BOOL)hasDisplayMethod;
- (BOOL)hasEarlierPagesLoaded;
- (BOOL)hasExpiryTime;
- (BOOL)hasIsPlayingTrace;
- (BOOL)hasLaterPagesLoaded;
- (BOOL)hasOriginString;
- (BOOL)hasRouteRequestStorage;
- (BOOL)hasRoutesPerEarlierPage;
- (BOOL)hasRoutesPerInitialPage;
- (BOOL)hasRoutesPerLaterPage;
- (BOOL)hasShouldRestoreLowGuidance;
- (BOOL)hasTransitPreferences;
- (BOOL)hasTransitPrioritization;
- (BOOL)hasTransitSurchargeOption;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlayingTrace;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldRestoreLowGuidance;
- (DirectionsPlanTransitPreferences)transitPreferences;
- (GEOStorageRouteRequestStorage)routeRequestStorage;
- (NSData)companionRouteContextData;
- (NSMutableArray)handlesForSharingETAs;
- (NSMutableArray)planningWaypoints;
- (NSString)destinationString;
- (NSString)originString;
- (double)arrivalTime;
- (double)departureTime;
- (double)expiryTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayMethodAsString:(int)a3;
- (id)handlesForSharingETAAtIndex:(unint64_t)a3;
- (id)planningWaypointAtIndex:(unint64_t)a3;
- (id)transitPrioritizationAsString:(int)a3;
- (int)StringAsDisplayMethod:(id)a3;
- (int)StringAsTransitPrioritization:(id)a3;
- (int)displayMethod;
- (int)transitPrioritization;
- (int)transitSurchargeOption;
- (unint64_t)currentRouteIndex;
- (unint64_t)currentRouteStep;
- (unint64_t)handlesForSharingETAsCount;
- (unint64_t)hash;
- (unint64_t)planningWaypointsCount;
- (unsigned)earlierPagesLoaded;
- (unsigned)laterPagesLoaded;
- (unsigned)routesPerEarlierPage;
- (unsigned)routesPerInitialPage;
- (unsigned)routesPerLaterPage;
- (void)addHandlesForSharingETA:(id)a3;
- (void)addPlanningWaypoint:(id)a3;
- (void)clearHandlesForSharingETAs;
- (void)clearPlanningWaypoints;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArrivalTime:(double)a3;
- (void)setAvoidHighways:(BOOL)a3;
- (void)setAvoidTolls:(BOOL)a3;
- (void)setCompanionRouteContextData:(id)a3;
- (void)setCurrentRouteIndex:(unint64_t)a3;
- (void)setCurrentRouteStep:(unint64_t)a3;
- (void)setDepartureTime:(double)a3;
- (void)setDestinationString:(id)a3;
- (void)setDisplayMethod:(int)a3;
- (void)setEarlierPagesLoaded:(unsigned int)a3;
- (void)setExpiryTime:(double)a3;
- (void)setHandlesForSharingETAs:(id)a3;
- (void)setHasArrivalTime:(BOOL)a3;
- (void)setHasAvoidHighways:(BOOL)a3;
- (void)setHasAvoidTolls:(BOOL)a3;
- (void)setHasCurrentRouteIndex:(BOOL)a3;
- (void)setHasCurrentRouteStep:(BOOL)a3;
- (void)setHasDepartureTime:(BOOL)a3;
- (void)setHasDisplayMethod:(BOOL)a3;
- (void)setHasEarlierPagesLoaded:(BOOL)a3;
- (void)setHasExpiryTime:(BOOL)a3;
- (void)setHasIsPlayingTrace:(BOOL)a3;
- (void)setHasLaterPagesLoaded:(BOOL)a3;
- (void)setHasRoutesPerEarlierPage:(BOOL)a3;
- (void)setHasRoutesPerInitialPage:(BOOL)a3;
- (void)setHasRoutesPerLaterPage:(BOOL)a3;
- (void)setHasShouldRestoreLowGuidance:(BOOL)a3;
- (void)setHasTransitPrioritization:(BOOL)a3;
- (void)setHasTransitSurchargeOption:(BOOL)a3;
- (void)setIsPlayingTrace:(BOOL)a3;
- (void)setLaterPagesLoaded:(unsigned int)a3;
- (void)setOriginString:(id)a3;
- (void)setPlanningWaypoints:(id)a3;
- (void)setRouteRequestStorage:(id)a3;
- (void)setRoutesPerEarlierPage:(unsigned int)a3;
- (void)setRoutesPerInitialPage:(unsigned int)a3;
- (void)setRoutesPerLaterPage:(unsigned int)a3;
- (void)setShouldRestoreLowGuidance:(BOOL)a3;
- (void)setTransitPreferences:(id)a3;
- (void)setTransitPrioritization:(int)a3;
- (void)setTransitSurchargeOption:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation DirectionsPlan

+ (id)_maps_expiryDateForRoute:(id)a3
{
  if (a3)
  {
    unsigned int v3 = [a3 expectedTime];
    double v4 = (double)v3 + (double)v3;
    if (v3 > 0xE10) {
      double v4 = (double)v3 + 3600.0;
    }
  }
  else
  {
    GEOConfigGetDouble();
  }

  return +[NSDate dateWithTimeIntervalSinceNow:v4];
}

- (BOOL)hasRouteRequestStorage
{
  return self->_routeRequestStorage != 0;
}

- (BOOL)hasOriginString
{
  return self->_originString != 0;
}

- (BOOL)hasDestinationString
{
  return self->_destinationString != 0;
}

- (void)setDepartureTime:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_departureTime = a3;
}

- (void)setHasDepartureTime:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDepartureTime
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setArrivalTime:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_arrivalTime = a3;
}

- (void)setHasArrivalTime:(BOOL)a3
{
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasArrivalTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCurrentRouteIndex:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_currentRouteIndex = a3;
}

- (void)setHasCurrentRouteIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCurrentRouteIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCurrentRouteStep:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_currentRouteStep = a3;
}

- (void)setHasCurrentRouteStep:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCurrentRouteStep
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)displayMethod
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_displayMethod;
  }
  else {
    return 0;
  }
}

- (void)setDisplayMethod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_displayMethod = a3;
}

- (void)setHasDisplayMethod:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDisplayMethod
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)displayMethodAsString:(int)a3
{
  if (a3 >= 3)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = off_1012FA208[a3];
  }

  return v3;
}

- (int)StringAsDisplayMethod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DirectionsSearch"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RoutePicking"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DirectionsStarted"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasTransitPreferences
{
  return self->_transitPreferences != 0;
}

- (void)setRoutesPerInitialPage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_routesPerInitialPage = a3;
}

- (void)setHasRoutesPerInitialPage:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRoutesPerInitialPage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setEarlierPagesLoaded:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_earlierPagesLoaded = a3;
}

- (void)setHasEarlierPagesLoaded:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasEarlierPagesLoaded
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setLaterPagesLoaded:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_laterPagesLoaded = a3;
}

- (void)setHasLaterPagesLoaded:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLaterPagesLoaded
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setRoutesPerEarlierPage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_routesPerEarlierPage = a3;
}

- (void)setHasRoutesPerEarlierPage:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasRoutesPerEarlierPage
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setRoutesPerLaterPage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_routesPerLaterPage = a3;
}

- (void)setHasRoutesPerLaterPage:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRoutesPerLaterPage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (int)transitPrioritization
{
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    return self->_transitPrioritization;
  }
  else {
    return 0;
  }
}

- (void)setTransitPrioritization:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_transitPrioritization = a3;
}

- (void)setHasTransitPrioritization:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTransitPrioritization
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)transitPrioritizationAsString:(int)a3
{
  if (a3 >= 4)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = off_1012FA220[a3];
  }

  return v3;
}

- (int)StringAsTransitPrioritization:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TRANSIT_PRIORITIZE_DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT_PRIORITIZE_BY_TRAVEL_TIME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRANSIT_PRIORITIZE_BY_TRANSFER_COUNT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRANSIT_PRIORITIZE_BY_WALKING_DISTANCE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setTransitSurchargeOption:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_transitSurchargeOption = a3;
}

- (void)setHasTransitSurchargeOption:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasTransitSurchargeOption
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setExpiryTime:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_expiryTime = a3;
}

- (void)setHasExpiryTime:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasExpiryTime
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsPlayingTrace:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isPlayingTrace = a3;
}

- (void)setHasIsPlayingTrace:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsPlayingTrace
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setShouldRestoreLowGuidance:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_shouldRestoreLowGuidance = a3;
}

- (void)setHasShouldRestoreLowGuidance:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasShouldRestoreLowGuidance
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setAvoidTolls:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_avoidTolls = a3;
}

- (void)setHasAvoidTolls:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasAvoidTolls
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setAvoidHighways:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_avoidHighways = a3;
}

- (void)setHasAvoidHighways:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAvoidHighways
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)clearPlanningWaypoints
{
}

- (void)addPlanningWaypoint:(id)a3
{
  id v4 = a3;
  planningWaypoints = self->_planningWaypoints;
  id v8 = v4;
  if (!planningWaypoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_planningWaypoints;
    self->_planningWaypoints = v6;

    id v4 = v8;
    planningWaypoints = self->_planningWaypoints;
  }
  [(NSMutableArray *)planningWaypoints addObject:v4];
}

- (unint64_t)planningWaypointsCount
{
  return (unint64_t)[(NSMutableArray *)self->_planningWaypoints count];
}

- (id)planningWaypointAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_planningWaypoints objectAtIndex:a3];
}

+ (Class)planningWaypointType
{
  return (Class)objc_opt_class();
}

- (void)clearHandlesForSharingETAs
{
}

- (void)addHandlesForSharingETA:(id)a3
{
  id v4 = a3;
  handlesForSharingETAs = self->_handlesForSharingETAs;
  id v8 = v4;
  if (!handlesForSharingETAs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_handlesForSharingETAs;
    self->_handlesForSharingETAs = v6;

    id v4 = v8;
    handlesForSharingETAs = self->_handlesForSharingETAs;
  }
  [(NSMutableArray *)handlesForSharingETAs addObject:v4];
}

- (unint64_t)handlesForSharingETAsCount
{
  return (unint64_t)[(NSMutableArray *)self->_handlesForSharingETAs count];
}

- (id)handlesForSharingETAAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_handlesForSharingETAs objectAtIndex:a3];
}

+ (Class)handlesForSharingETAType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCompanionRouteContextData
{
  return self->_companionRouteContextData != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)DirectionsPlan;
  int v3 = [(DirectionsPlan *)&v7 description];
  id v4 = [(DirectionsPlan *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  routeRequestStorage = self->_routeRequestStorage;
  if (routeRequestStorage)
  {
    v5 = [(GEOStorageRouteRequestStorage *)routeRequestStorage dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"routeRequestStorage"];
  }
  originString = self->_originString;
  if (originString) {
    [v3 setObject:originString forKey:@"originString"];
  }
  destinationString = self->_destinationString;
  if (destinationString) {
    [v3 setObject:destinationString forKey:@"destinationString"];
  }
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    v9 = +[NSNumber numberWithDouble:self->_departureTime];
    [v3 setObject:v9 forKey:@"departureTime"];

    $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_9;
  }
  v10 = +[NSNumber numberWithDouble:self->_arrivalTime];
  [v3 setObject:v10 forKey:@"arrivalTime"];

  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_16;
  }
LABEL_15:
  v11 = +[NSNumber numberWithUnsignedLongLong:self->_currentRouteIndex];
  [v3 setObject:v11 forKey:@"currentRouteIndex"];

  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
LABEL_16:
  v12 = +[NSNumber numberWithUnsignedLongLong:self->_currentRouteStep];
  [v3 setObject:v12 forKey:@"currentRouteStep"];

  if ((*(_DWORD *)&self->_has & 0x20) == 0) {
    goto LABEL_21;
  }
LABEL_17:
  uint64_t displayMethod = self->_displayMethod;
  if (displayMethod >= 3)
  {
    v14 = +[NSString stringWithFormat:@"(unknown: %i)", self->_displayMethod];
  }
  else
  {
    v14 = off_1012FA208[displayMethod];
  }
  [v3 setObject:v14 forKey:@"displayMethod"];

LABEL_21:
  transitPreferences = self->_transitPreferences;
  if (transitPreferences)
  {
    v16 = [(DirectionsPlanTransitPreferences *)transitPreferences dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"transitPreferences"];
  }
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x200) != 0)
  {
    v29 = +[NSNumber numberWithUnsignedInt:self->_routesPerInitialPage];
    [v3 setObject:v29 forKey:@"routesPerInitialPage"];

    $C75E4E3A3DEB277DB9C7B3008F0DFC00 v17 = self->_has;
    if ((*(unsigned char *)&v17 & 0x40) == 0)
    {
LABEL_25:
      if ((*(unsigned char *)&v17 & 0x80) == 0) {
        goto LABEL_26;
      }
      goto LABEL_54;
    }
  }
  else if ((*(unsigned char *)&v17 & 0x40) == 0)
  {
    goto LABEL_25;
  }
  v30 = +[NSNumber numberWithUnsignedInt:self->_earlierPagesLoaded];
  [v3 setObject:v30 forKey:@"earlierPagesLoaded"];

  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v17 = self->_has;
  if ((*(unsigned char *)&v17 & 0x80) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v17 & 0x100) == 0) {
      goto LABEL_27;
    }
    goto LABEL_55;
  }
LABEL_54:
  v31 = +[NSNumber numberWithUnsignedInt:self->_laterPagesLoaded];
  [v3 setObject:v31 forKey:@"laterPagesLoaded"];

  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x100) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v17 & 0x400) == 0) {
      goto LABEL_28;
    }
    goto LABEL_56;
  }
LABEL_55:
  v32 = +[NSNumber numberWithUnsignedInt:self->_routesPerEarlierPage];
  [v3 setObject:v32 forKey:@"routesPerEarlierPage"];

  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x400) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v17 & 0x800) == 0) {
      goto LABEL_29;
    }
    goto LABEL_57;
  }
LABEL_56:
  v33 = +[NSNumber numberWithUnsignedInt:self->_routesPerLaterPage];
  [v3 setObject:v33 forKey:@"routesPerLaterPage"];

  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x800) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v17 & 0x1000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_61;
  }
LABEL_57:
  uint64_t transitPrioritization = self->_transitPrioritization;
  if (transitPrioritization >= 4)
  {
    v35 = +[NSString stringWithFormat:@"(unknown: %i)", self->_transitPrioritization];
  }
  else
  {
    v35 = off_1012FA220[transitPrioritization];
  }
  [v3 setObject:v35 forKey:@"transitPrioritization"];

  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x1000) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&v17 & 0x10) == 0) {
      goto LABEL_31;
    }
    goto LABEL_62;
  }
LABEL_61:
  v36 = +[NSNumber numberWithInt:self->_transitSurchargeOption];
  [v3 setObject:v36 forKey:@"transitSurchargeOption"];

  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v17 = self->_has;
  if ((*(unsigned char *)&v17 & 0x10) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v17 & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_63;
  }
LABEL_62:
  v37 = +[NSNumber numberWithDouble:self->_expiryTime];
  [v3 setObject:v37 forKey:@"expiryTime"];

  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x8000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v17 & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_64;
  }
LABEL_63:
  v38 = +[NSNumber numberWithBool:self->_isPlayingTrace];
  [v3 setObject:v38 forKey:@"isPlayingTrace"];

  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x10000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v17 & 0x4000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_65;
  }
LABEL_64:
  v39 = +[NSNumber numberWithBool:self->_shouldRestoreLowGuidance];
  [v3 setObject:v39 forKey:@"shouldRestoreLowGuidance"];

  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v17 & 0x2000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_65:
  v40 = +[NSNumber numberWithBool:self->_avoidTolls];
  [v3 setObject:v40 forKey:@"avoidTolls"];

  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_35:
    v18 = +[NSNumber numberWithBool:self->_avoidHighways];
    [v3 setObject:v18 forKey:@"avoidHighways"];
  }
LABEL_36:
  if ([(NSMutableArray *)self->_planningWaypoints count])
  {
    id v19 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_planningWaypoints, "count")];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v20 = self->_planningWaypoints;
    id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v42;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v42 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v41 + 1) + 8 * i) dictionaryRepresentation];
          [v19 addObject:v25];
        }
        id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKey:@"planningWaypoint"];
  }
  handlesForSharingETAs = self->_handlesForSharingETAs;
  if (handlesForSharingETAs) {
    [v3 setObject:handlesForSharingETAs forKey:@"handlesForSharingETA"];
  }
  companionRouteContextData = self->_companionRouteContextData;
  if (companionRouteContextData) {
    [v3 setObject:companionRouteContextData forKey:@"companionRouteContextData"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100831B04((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_routeRequestStorage) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_originString) {
    PBDataWriterWriteStringField();
  }
  if (self->_destinationString) {
    PBDataWriterWriteStringField();
  }
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_48;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint64Field();
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_49:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x20) != 0) {
LABEL_12:
  }
    PBDataWriterWriteInt32Field();
LABEL_13:
  if (self->_transitPreferences) {
    PBDataWriterWriteSubmessage();
  }
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 0x40) == 0)
    {
LABEL_17:
      if ((*(unsigned char *)&v6 & 0x80) == 0) {
        goto LABEL_18;
      }
      goto LABEL_53;
    }
  }
  else if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteUint32Field();
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteInt32Field();
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt32Field();
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteDoubleField();
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteBOOLField();
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x2000) != 0) {
LABEL_26:
  }
    PBDataWriterWriteBOOLField();
LABEL_27:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  objc_super v7 = self->_planningWaypoints;
  id v8 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v12 = self->_handlesForSharingETAs;
  v13 = (char *)[(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteStringField();
        ++v16;
      }
      while (v14 != v16);
      v14 = (char *)[(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  if (self->_companionRouteContextData) {
    PBDataWriterWriteDataField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (self->_routeRequestStorage)
  {
    [v4 setRouteRequestStorage:];
    id v4 = v15;
  }
  if (self->_originString)
  {
    [v15 setOriginString];
    id v4 = v15;
  }
  if (self->_destinationString)
  {
    [v15 setDestinationString:];
    id v4 = v15;
  }
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    *((void *)v4 + 4) = *(void *)&self->_departureTime;
    *((_DWORD *)v4 + 37) |= 8u;
    $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_44;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 1) = *(void *)&self->_arrivalTime;
  *((_DWORD *)v4 + 37) |= 1u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((void *)v4 + 2) = self->_currentRouteIndex;
  *((_DWORD *)v4 + 37) |= 2u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_45:
  *((void *)v4 + 3) = self->_currentRouteStep;
  *((_DWORD *)v4 + 37) |= 4u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 16) = self->_displayMethod;
    *((_DWORD *)v4 + 37) |= 0x20u;
  }
LABEL_13:
  if (self->_transitPreferences)
  {
    [v15 setTransitPreferences:];
    id v4 = v15;
  }
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    *((_DWORD *)v4 + 29) = self->_routesPerInitialPage;
    *((_DWORD *)v4 + 37) |= 0x200u;
    $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 0x40) == 0)
    {
LABEL_17:
      if ((*(unsigned char *)&v6 & 0x80) == 0) {
        goto LABEL_18;
      }
      goto LABEL_49;
    }
  }
  else if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v4 + 17) = self->_earlierPagesLoaded;
  *((_DWORD *)v4 + 37) |= 0x40u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 20) = self->_laterPagesLoaded;
  *((_DWORD *)v4 + 37) |= 0x80u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 28) = self->_routesPerEarlierPage;
  *((_DWORD *)v4 + 37) |= 0x100u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 30) = self->_routesPerLaterPage;
  *((_DWORD *)v4 + 37) |= 0x400u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 34) = self->_transitPrioritization;
  *((_DWORD *)v4 + 37) |= 0x800u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 35) = self->_transitSurchargeOption;
  *((_DWORD *)v4 + 37) |= 0x1000u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((void *)v4 + 5) = *(void *)&self->_expiryTime;
  *((_DWORD *)v4 + 37) |= 0x10u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_25;
    }
LABEL_56:
    *((unsigned char *)v4 + 145) = self->_avoidTolls;
    *((_DWORD *)v4 + 37) |= 0x4000u;
    if ((*(_DWORD *)&self->_has & 0x2000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_55:
  *((unsigned char *)v4 + 147) = self->_shouldRestoreLowGuidance;
  *((_DWORD *)v4 + 37) |= 0x10000u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0) {
    goto LABEL_56;
  }
LABEL_25:
  if ((*(_WORD *)&v6 & 0x2000) != 0)
  {
LABEL_26:
    *((unsigned char *)v4 + 144) = self->_avoidHighways;
    *((_DWORD *)v4 + 37) |= 0x2000u;
  }
LABEL_27:
  if ([(DirectionsPlan *)self planningWaypointsCount])
  {
    [v15 clearPlanningWaypoints];
    unint64_t v7 = [(DirectionsPlan *)self planningWaypointsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(DirectionsPlan *)self planningWaypointAtIndex:i];
        [v15 addPlanningWaypoint:v10];
      }
    }
  }
  if ([(DirectionsPlan *)self handlesForSharingETAsCount])
  {
    [v15 clearHandlesForSharingETAs];
    unint64_t v11 = [(DirectionsPlan *)self handlesForSharingETAsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        v14 = [(DirectionsPlan *)self handlesForSharingETAAtIndex:j];
        [v15 addHandlesForSharingETA:v14];
      }
    }
  }
  if (self->_companionRouteContextData) {
    [v15 setCompanionRouteContextData:];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    *((unsigned char *)v15 + 146) = self->_isPlayingTrace;
    *((_DWORD *)v15 + 37) |= 0x8000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(GEOStorageRouteRequestStorage *)self->_routeRequestStorage copyWithZone:a3];
  unint64_t v7 = (void *)v5[13];
  v5[13] = v6;

  id v8 = [(NSString *)self->_originString copyWithZone:a3];
  v9 = (void *)v5[11];
  v5[11] = v8;

  id v10 = [(NSString *)self->_destinationString copyWithZone:a3];
  unint64_t v11 = (void *)v5[7];
  v5[7] = v10;

  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    v5[4] = *(void *)&self->_departureTime;
    *((_DWORD *)v5 + 37) |= 8u;
    $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_38;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[1] = *(void *)&self->_arrivalTime;
  *((_DWORD *)v5 + 37) |= 1u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_38:
  v5[2] = self->_currentRouteIndex;
  *((_DWORD *)v5 + 37) |= 2u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_39:
  v5[3] = self->_currentRouteStep;
  *((_DWORD *)v5 + 37) |= 4u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 16) = self->_displayMethod;
    *((_DWORD *)v5 + 37) |= 0x20u;
  }
LABEL_7:
  id v13 = [(DirectionsPlanTransitPreferences *)self->_transitPreferences copyWithZone:a3];
  v14 = (void *)v5[16];
  v5[16] = v13;

  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x200) != 0)
  {
    *((_DWORD *)v5 + 29) = self->_routesPerInitialPage;
    *((_DWORD *)v5 + 37) |= 0x200u;
    $C75E4E3A3DEB277DB9C7B3008F0DFC00 v15 = self->_has;
    if ((*(unsigned char *)&v15 & 0x40) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&v15 & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_43;
    }
  }
  else if ((*(unsigned char *)&v15 & 0x40) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v5 + 17) = self->_earlierPagesLoaded;
  *((_DWORD *)v5 + 37) |= 0x40u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v15 = self->_has;
  if ((*(unsigned char *)&v15 & 0x80) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v15 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v5 + 20) = self->_laterPagesLoaded;
  *((_DWORD *)v5 + 37) |= 0x80u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&v15 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v5 + 28) = self->_routesPerEarlierPage;
  *((_DWORD *)v5 + 37) |= 0x100u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v15 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v5 + 30) = self->_routesPerLaterPage;
  *((_DWORD *)v5 + 37) |= 0x400u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v15 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v5 + 34) = self->_transitPrioritization;
  *((_DWORD *)v5 + 37) |= 0x800u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x1000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&v15 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v5 + 35) = self->_transitSurchargeOption;
  *((_DWORD *)v5 + 37) |= 0x1000u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v15 = self->_has;
  if ((*(unsigned char *)&v15 & 0x10) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v15 & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_49;
  }
LABEL_48:
  v5[5] = *(void *)&self->_expiryTime;
  *((_DWORD *)v5 + 37) |= 0x10u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v15 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((unsigned char *)v5 + 147) = self->_shouldRestoreLowGuidance;
  *((_DWORD *)v5 + 37) |= 0x10000u;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v15 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_50:
  *((unsigned char *)v5 + 145) = self->_avoidTolls;
  *((_DWORD *)v5 + 37) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_18:
    *((unsigned char *)v5 + 144) = self->_avoidHighways;
    *((_DWORD *)v5 + 37) |= 0x2000u;
  }
LABEL_19:
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v16 = self->_planningWaypoints;
  id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v35 + 1) + 8 * i) copyWithZone:a3];
        [v5 addPlanningWaypoint:v21];
      }
      id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v18);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v22 = self->_handlesForSharingETAs;
  id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v24; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)j) copyWithZone:a3];
        [v5 addHandlesForSharingETA:v27];
      }
      id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v24);
  }

  id v28 = [(NSData *)self->_companionRouteContextData copyWithZone:a3];
  v29 = (void *)v5[6];
  v5[6] = v28;

  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    *((unsigned char *)v5 + 146) = self->_isPlayingTrace;
    *((_DWORD *)v5 + 37) |= 0x8000u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_109;
  }
  routeRequestStorage = self->_routeRequestStorage;
  if ((unint64_t)routeRequestStorage | *((void *)v4 + 13))
  {
    if (!-[GEOStorageRouteRequestStorage isEqual:](routeRequestStorage, "isEqual:")) {
      goto LABEL_109;
    }
  }
  originString = self->_originString;
  if ((unint64_t)originString | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](originString, "isEqual:")) {
      goto LABEL_109;
    }
  }
  destinationString = self->_destinationString;
  if ((unint64_t)destinationString | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](destinationString, "isEqual:")) {
      goto LABEL_109;
    }
  }
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
  int v9 = *((_DWORD *)v4 + 37);
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_departureTime != *((double *)v4 + 4)) {
      goto LABEL_109;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_109;
  }
  if (*(unsigned char *)&has)
  {
    if ((v9 & 1) == 0 || self->_arrivalTime != *((double *)v4 + 1)) {
      goto LABEL_109;
    }
  }
  else if (v9)
  {
    goto LABEL_109;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_currentRouteIndex != *((void *)v4 + 2)) {
      goto LABEL_109;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_109;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_currentRouteStep != *((void *)v4 + 3)) {
      goto LABEL_109;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_109;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_displayMethod != *((_DWORD *)v4 + 16)) {
      goto LABEL_109;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_109;
  }
  transitPreferences = self->_transitPreferences;
  if ((unint64_t)transitPreferences | *((void *)v4 + 16))
  {
    if (!-[DirectionsPlanTransitPreferences isEqual:](transitPreferences, "isEqual:")) {
      goto LABEL_109;
    }
    $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
    int v9 = *((_DWORD *)v4 + 37);
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v9 & 0x200) == 0 || self->_routesPerInitialPage != *((_DWORD *)v4 + 29)) {
      goto LABEL_109;
    }
  }
  else if ((v9 & 0x200) != 0)
  {
    goto LABEL_109;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_earlierPagesLoaded != *((_DWORD *)v4 + 17)) {
      goto LABEL_109;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_109;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_laterPagesLoaded != *((_DWORD *)v4 + 20)) {
      goto LABEL_109;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v9 & 0x100) == 0 || self->_routesPerEarlierPage != *((_DWORD *)v4 + 28)) {
      goto LABEL_109;
    }
  }
  else if ((v9 & 0x100) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v9 & 0x400) == 0 || self->_routesPerLaterPage != *((_DWORD *)v4 + 30)) {
      goto LABEL_109;
    }
  }
  else if ((v9 & 0x400) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v9 & 0x800) == 0 || self->_transitPrioritization != *((_DWORD *)v4 + 34)) {
      goto LABEL_109;
    }
  }
  else if ((v9 & 0x800) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v9 & 0x1000) == 0 || self->_transitSurchargeOption != *((_DWORD *)v4 + 35)) {
      goto LABEL_109;
    }
  }
  else if ((v9 & 0x1000) != 0)
  {
    goto LABEL_109;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_expiryTime != *((double *)v4 + 5)) {
      goto LABEL_109;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v9 & 0x10000) == 0) {
      goto LABEL_109;
    }
    if (self->_shouldRestoreLowGuidance)
    {
      if (!*((unsigned char *)v4 + 147)) {
        goto LABEL_109;
      }
    }
    else if (*((unsigned char *)v4 + 147))
    {
      goto LABEL_109;
    }
  }
  else if ((v9 & 0x10000) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v9 & 0x4000) == 0) {
      goto LABEL_109;
    }
    if (self->_avoidTolls)
    {
      if (!*((unsigned char *)v4 + 145)) {
        goto LABEL_109;
      }
    }
    else if (*((unsigned char *)v4 + 145))
    {
      goto LABEL_109;
    }
  }
  else if ((v9 & 0x4000) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0) {
      goto LABEL_109;
    }
    if (self->_avoidHighways)
    {
      if (!*((unsigned char *)v4 + 144)) {
        goto LABEL_109;
      }
    }
    else if (*((unsigned char *)v4 + 144))
    {
      goto LABEL_109;
    }
  }
  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_109;
  }
  planningWaypoints = self->_planningWaypoints;
  if ((unint64_t)planningWaypoints | *((void *)v4 + 12)
    && !-[NSMutableArray isEqual:](planningWaypoints, "isEqual:"))
  {
    goto LABEL_109;
  }
  handlesForSharingETAs = self->_handlesForSharingETAs;
  if ((unint64_t)handlesForSharingETAs | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](handlesForSharingETAs, "isEqual:")) {
      goto LABEL_109;
    }
  }
  companionRouteContextData = self->_companionRouteContextData;
  if ((unint64_t)companionRouteContextData | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](companionRouteContextData, "isEqual:")) {
      goto LABEL_109;
    }
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    if ((*((_DWORD *)v4 + 37) & 0x8000) != 0)
    {
      if (self->_isPlayingTrace)
      {
        if (!*((unsigned char *)v4 + 146)) {
          goto LABEL_109;
        }
      }
      else if (*((unsigned char *)v4 + 146))
      {
        goto LABEL_109;
      }
      BOOL v14 = 1;
      goto LABEL_110;
    }
LABEL_109:
    BOOL v14 = 0;
    goto LABEL_110;
  }
  BOOL v14 = (*((_DWORD *)v4 + 37) & 0x8000) == 0;
LABEL_110:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v43 = (unint64_t)[(GEOStorageRouteRequestStorage *)self->_routeRequestStorage hash];
  NSUInteger v42 = [(NSString *)self->_originString hash];
  NSUInteger v41 = [(NSString *)self->_destinationString hash];
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    double departureTime = self->_departureTime;
    double v6 = -departureTime;
    if (departureTime >= 0.0) {
      double v6 = self->_departureTime;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (*(unsigned char *)&has)
  {
    double arrivalTime = self->_arrivalTime;
    double v11 = -arrivalTime;
    if (arrivalTime >= 0.0) {
      double v11 = self->_arrivalTime;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    unint64_t v39 = 2654435761u * self->_currentRouteIndex;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v39 = 0;
    if ((*(unsigned char *)&has & 4) != 0)
    {
LABEL_19:
      unint64_t v38 = 2654435761u * self->_currentRouteStep;
      goto LABEL_22;
    }
  }
  unint64_t v38 = 0;
LABEL_22:
  unint64_t v40 = v9;
  if ((*(unsigned char *)&has & 0x20) != 0) {
    uint64_t v37 = 2654435761 * self->_displayMethod;
  }
  else {
    uint64_t v37 = 0;
  }
  unint64_t v36 = [(DirectionsPlanTransitPreferences *)self->_transitPreferences hash];
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    uint64_t v35 = 2654435761 * self->_routesPerInitialPage;
    if ((*(unsigned char *)&v14 & 0x40) != 0)
    {
LABEL_27:
      uint64_t v34 = 2654435761 * self->_earlierPagesLoaded;
      if ((*(unsigned char *)&v14 & 0x80) != 0) {
        goto LABEL_28;
      }
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v35 = 0;
    if ((*(unsigned char *)&v14 & 0x40) != 0) {
      goto LABEL_27;
    }
  }
  uint64_t v34 = 0;
  if ((*(unsigned char *)&v14 & 0x80) != 0)
  {
LABEL_28:
    uint64_t v33 = 2654435761 * self->_laterPagesLoaded;
    if ((*(_WORD *)&v14 & 0x100) != 0) {
      goto LABEL_29;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v33 = 0;
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
LABEL_29:
    uint64_t v32 = 2654435761 * self->_routesPerEarlierPage;
    if ((*(_WORD *)&v14 & 0x400) != 0) {
      goto LABEL_30;
    }
LABEL_36:
    uint64_t v31 = 0;
    if ((*(_WORD *)&v14 & 0x800) != 0) {
      goto LABEL_31;
    }
    goto LABEL_37;
  }
LABEL_35:
  uint64_t v32 = 0;
  if ((*(_WORD *)&v14 & 0x400) == 0) {
    goto LABEL_36;
  }
LABEL_30:
  uint64_t v31 = 2654435761 * self->_routesPerLaterPage;
  if ((*(_WORD *)&v14 & 0x800) != 0)
  {
LABEL_31:
    uint64_t v30 = 2654435761 * self->_transitPrioritization;
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v30 = 0;
LABEL_38:
  if ((*(_WORD *)&v14 & 0x1000) != 0)
  {
    uint64_t v28 = 2654435761 * self->_transitSurchargeOption;
    if ((*(unsigned char *)&v14 & 0x10) != 0) {
      goto LABEL_40;
    }
LABEL_45:
    unint64_t v19 = 0;
    goto LABEL_48;
  }
  uint64_t v28 = 0;
  if ((*(unsigned char *)&v14 & 0x10) == 0) {
    goto LABEL_45;
  }
LABEL_40:
  double expiryTime = self->_expiryTime;
  double v16 = -expiryTime;
  if (expiryTime >= 0.0) {
    double v16 = self->_expiryTime;
  }
  long double v17 = floor(v16 + 0.5);
  double v18 = (v16 - v17) * 1.84467441e19;
  unint64_t v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0) {
      v19 += (unint64_t)v18;
    }
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
LABEL_48:
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
    uint64_t v20 = 0;
    if ((*(_WORD *)&v14 & 0x4000) != 0) {
      goto LABEL_50;
    }
LABEL_53:
    uint64_t v21 = 0;
    if ((*(_WORD *)&v14 & 0x2000) != 0) {
      goto LABEL_51;
    }
    goto LABEL_54;
  }
  uint64_t v20 = 2654435761 * self->_shouldRestoreLowGuidance;
  if ((*(_WORD *)&v14 & 0x4000) == 0) {
    goto LABEL_53;
  }
LABEL_50:
  uint64_t v21 = 2654435761 * self->_avoidTolls;
  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
LABEL_51:
    uint64_t v22 = 2654435761 * self->_avoidHighways;
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v22 = 0;
LABEL_55:
  unint64_t v23 = (unint64_t)[(NSMutableArray *)self->_planningWaypoints hash];
  unint64_t v24 = (unint64_t)[(NSMutableArray *)self->_handlesForSharingETAs hash];
  unint64_t v25 = (unint64_t)[(NSData *)self->_companionRouteContextData hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    uint64_t v26 = 2654435761 * self->_isPlayingTrace;
  }
  else {
    uint64_t v26 = 0;
  }
  return v42 ^ v43 ^ v41 ^ v4 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  routeRequestStorage = self->_routeRequestStorage;
  uint64_t v6 = *((void *)v4 + 13);
  if (routeRequestStorage)
  {
    if (v6) {
      -[GEOStorageRouteRequestStorage mergeFrom:](routeRequestStorage, "mergeFrom:");
    }
  }
  else if (v6)
  {
    [(DirectionsPlan *)self setRouteRequestStorage:"setRouteRequestStorage:"];
  }
  if (*((void *)v4 + 11)) {
    -[DirectionsPlan setOriginString:](self, "setOriginString:");
  }
  if (*((void *)v4 + 7)) {
    -[DirectionsPlan setDestinationString:](self, "setDestinationString:");
  }
  int v7 = *((_DWORD *)v4 + 37);
  if ((v7 & 8) != 0)
  {
    self->_double departureTime = *((double *)v4 + 4);
    *(_DWORD *)&self->_has |= 8u;
    int v7 = *((_DWORD *)v4 + 37);
    if ((v7 & 1) == 0)
    {
LABEL_12:
      if ((v7 & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_21;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_12;
  }
  self->_double arrivalTime = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v7 = *((_DWORD *)v4 + 37);
  if ((v7 & 2) == 0)
  {
LABEL_13:
    if ((v7 & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_currentRouteIndex = *((void *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v7 = *((_DWORD *)v4 + 37);
  if ((v7 & 4) == 0)
  {
LABEL_14:
    if ((v7 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_22:
  self->_currentRouteStep = *((void *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  if ((*((_DWORD *)v4 + 37) & 0x20) != 0)
  {
LABEL_15:
    self->_uint64_t displayMethod = *((_DWORD *)v4 + 16);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_16:
  transitPreferences = self->_transitPreferences;
  uint64_t v9 = *((void *)v4 + 16);
  if (transitPreferences)
  {
    if (v9) {
      -[DirectionsPlanTransitPreferences mergeFrom:](transitPreferences, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[DirectionsPlan setTransitPreferences:](self, "setTransitPreferences:");
  }
  int v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x200) != 0)
  {
    self->_routesPerInitialPage = *((_DWORD *)v4 + 29);
    *(_DWORD *)&self->_has |= 0x200u;
    int v10 = *((_DWORD *)v4 + 37);
    if ((v10 & 0x40) == 0)
    {
LABEL_28:
      if ((v10 & 0x80) == 0) {
        goto LABEL_29;
      }
      goto LABEL_59;
    }
  }
  else if ((v10 & 0x40) == 0)
  {
    goto LABEL_28;
  }
  self->_earlierPagesLoaded = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x40u;
  int v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x80) == 0)
  {
LABEL_29:
    if ((v10 & 0x100) == 0) {
      goto LABEL_30;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_laterPagesLoaded = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x80u;
  int v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x100) == 0)
  {
LABEL_30:
    if ((v10 & 0x400) == 0) {
      goto LABEL_31;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_routesPerEarlierPage = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x100u;
  int v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x400) == 0)
  {
LABEL_31:
    if ((v10 & 0x800) == 0) {
      goto LABEL_32;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_routesPerLaterPage = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x400u;
  int v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x800) == 0)
  {
LABEL_32:
    if ((v10 & 0x1000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_uint64_t transitPrioritization = *((_DWORD *)v4 + 34);
  *(_DWORD *)&self->_has |= 0x800u;
  int v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x1000) == 0)
  {
LABEL_33:
    if ((v10 & 0x10) == 0) {
      goto LABEL_34;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_transitSurchargeOption = *((_DWORD *)v4 + 35);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x10) == 0)
  {
LABEL_34:
    if ((v10 & 0x10000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_double expiryTime = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x10000) == 0)
  {
LABEL_35:
    if ((v10 & 0x4000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_shouldRestoreLowGuidance = *((unsigned char *)v4 + 147);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x4000) == 0)
  {
LABEL_36:
    if ((v10 & 0x2000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_66:
  self->_avoidTolls = *((unsigned char *)v4 + 145);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 37) & 0x2000) != 0)
  {
LABEL_37:
    self->_avoidHighways = *((unsigned char *)v4 + 144);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
LABEL_38:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = *((id *)v4 + 12);
  id v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [(DirectionsPlan *)self addPlanningWaypoint:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      }
      id v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = *((id *)v4 + 9);
  id v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v18; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[DirectionsPlan addHandlesForSharingETA:](self, "addHandlesForSharingETA:", *(void *)(*((void *)&v21 + 1) + 8 * (void)j), (void)v21);
      }
      id v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v18);
  }

  if (*((void *)v4 + 6)) {
    [(DirectionsPlan *)self setCompanionRouteContextData:"setCompanionRouteContextData:"];
  }
  if ((*((unsigned char *)v4 + 149) & 0x80) != 0)
  {
    self->_isPlayingTrace = *((unsigned char *)v4 + 146);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
}

- (GEOStorageRouteRequestStorage)routeRequestStorage
{
  return self->_routeRequestStorage;
}

- (void)setRouteRequestStorage:(id)a3
{
}

- (NSString)originString
{
  return self->_originString;
}

- (void)setOriginString:(id)a3
{
}

- (NSString)destinationString
{
  return self->_destinationString;
}

- (void)setDestinationString:(id)a3
{
}

- (double)departureTime
{
  return self->_departureTime;
}

- (double)arrivalTime
{
  return self->_arrivalTime;
}

- (unint64_t)currentRouteIndex
{
  return self->_currentRouteIndex;
}

- (unint64_t)currentRouteStep
{
  return self->_currentRouteStep;
}

- (DirectionsPlanTransitPreferences)transitPreferences
{
  return self->_transitPreferences;
}

- (void)setTransitPreferences:(id)a3
{
}

- (unsigned)routesPerInitialPage
{
  return self->_routesPerInitialPage;
}

- (unsigned)earlierPagesLoaded
{
  return self->_earlierPagesLoaded;
}

- (unsigned)laterPagesLoaded
{
  return self->_laterPagesLoaded;
}

- (unsigned)routesPerEarlierPage
{
  return self->_routesPerEarlierPage;
}

- (unsigned)routesPerLaterPage
{
  return self->_routesPerLaterPage;
}

- (int)transitSurchargeOption
{
  return self->_transitSurchargeOption;
}

- (double)expiryTime
{
  return self->_expiryTime;
}

- (BOOL)isPlayingTrace
{
  return self->_isPlayingTrace;
}

- (BOOL)shouldRestoreLowGuidance
{
  return self->_shouldRestoreLowGuidance;
}

- (BOOL)avoidTolls
{
  return self->_avoidTolls;
}

- (BOOL)avoidHighways
{
  return self->_avoidHighways;
}

- (NSMutableArray)planningWaypoints
{
  return self->_planningWaypoints;
}

- (void)setPlanningWaypoints:(id)a3
{
}

- (NSMutableArray)handlesForSharingETAs
{
  return self->_handlesForSharingETAs;
}

- (void)setHandlesForSharingETAs:(id)a3
{
}

- (NSData)companionRouteContextData
{
  return self->_companionRouteContextData;
}

- (void)setCompanionRouteContextData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitPreferences, 0);
  objc_storeStrong((id *)&self->_routeRequestStorage, 0);
  objc_storeStrong((id *)&self->_planningWaypoints, 0);
  objc_storeStrong((id *)&self->_originString, 0);
  objc_storeStrong((id *)&self->_handlesForSharingETAs, 0);
  objc_storeStrong((id *)&self->_destinationString, 0);

  objc_storeStrong((id *)&self->_companionRouteContextData, 0);
}

@end