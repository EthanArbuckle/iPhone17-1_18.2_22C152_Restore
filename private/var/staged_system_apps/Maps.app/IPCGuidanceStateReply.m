@interface IPCGuidanceStateReply
- (BOOL)affectsDimming;
- (BOOL)isAlerting;
- (BOOL)isArrived;
- (BOOL)isArriving;
- (BOOL)isInArrivalState;
- (BOOL)isInParkingState;
- (BOOL)isMapsForegroundOnMainScreen;
- (BOOL)isNavigating;
- (BOOL)isParked;
- (BOOL)isParking;
- (BOOL)isRerouting;
- (BOOL)isSticky;
- (BOOL)shouldExpandForSpokenEventFromGuidanceUpdate:(id)a3 forType:(unint64_t)a4;
- (BOOL)shouldPresentNextGuidanceUpdate:(id)a3 forType:(unint64_t)a4 target:(id)a5;
- (BOOL)showInCarPlay;
- (BOOL)showInMainScreen;
- (GEOTransitArtworkDataSource)artworkOverride;
- (IPCGuidanceStateReply)initWithDictionary:(id)a3;
- (IPCLaneGuidanceInfoReply)laneGuidanceInfo;
- (IPCShieldInfoMessage)shieldInfo;
- (IPCTrafficIncidentAlertMessage)trafficIncidentAlert;
- (MKJunction)junction;
- (MNArrivalInfo)arrivalInfo;
- (NSArray)incidentsOnRouteData;
- (NSArray)incidentsOnRouteOffsets;
- (NSArray)primaryInstructions;
- (NSArray)secondaryInstructions;
- (NSData)etaFilterData;
- (NSData)evChargingMetadata;
- (NSData)legacyRouteData;
- (NSData)navSessionData;
- (NSData)originalWaypointRouteData;
- (NSDate)lastSceneDeactivationTime;
- (NSNumber)distance;
- (NSNumber)remainingDistanceOnRoute;
- (NSNumber)remainingMinutesOnRoute;
- (NSNumber)timeToNextManeuver;
- (NSString)navVolumeSetting;
- (NSUUID)currentSpokenEventID;
- (NSUUID)maneuverID;
- (TransitAlightMessage)alightMessage;
- (id)description;
- (id)dictionaryValue;
- (id)maneuverGuidanceInfo;
- (id)maneuverUniqueId;
- (id)shortDescription;
- (id)trafficAlertUniqueId;
- (id)transitAlightUniqueId;
- (id)transitDestinationUniqueId;
- (id)uniqueIdForBannerType:(unint64_t)a3;
- (int)drivingSide;
- (int)maneuver;
- (int)transportType;
- (unint64_t)currentLegIndex;
- (unint64_t)guidanceState;
- (unint64_t)navigationState;
- (unint64_t)numberOfLegs;
- (void)setAffectsDimming:(BOOL)a3;
- (void)setAlightMessage:(id)a3;
- (void)setArrivalInfo:(id)a3;
- (void)setArtworkOverride:(id)a3;
- (void)setCurrentLegIndex:(unint64_t)a3;
- (void)setCurrentSpokenEventID:(id)a3;
- (void)setDistance:(id)a3;
- (void)setDrivingSide:(int)a3;
- (void)setEtaFilterData:(id)a3;
- (void)setEvChargingMetadata:(id)a3;
- (void)setGuidanceState:(unint64_t)a3;
- (void)setIncidentsOnRouteData:(id)a3;
- (void)setIncidentsOnRouteOffsets:(id)a3;
- (void)setIsAlerting:(BOOL)a3;
- (void)setIsMapsForegroundOnMainScreen:(BOOL)a3;
- (void)setIsNavigating:(BOOL)a3;
- (void)setIsRerouting:(BOOL)a3;
- (void)setIsSticky:(BOOL)a3;
- (void)setJunction:(id)a3;
- (void)setLaneGuidanceInfo:(id)a3;
- (void)setLastSceneDeactivationTime:(id)a3;
- (void)setLegacyRouteData:(id)a3;
- (void)setManeuver:(int)a3;
- (void)setManeuverID:(id)a3;
- (void)setNavSessionData:(id)a3;
- (void)setNavVolumeSetting:(id)a3;
- (void)setNavigationState:(unint64_t)a3;
- (void)setNumberOfLegs:(unint64_t)a3;
- (void)setOriginalWaypointRouteData:(id)a3;
- (void)setPrimaryInstructions:(id)a3;
- (void)setRemainingDistanceOnRoute:(id)a3;
- (void)setRemainingMinutesOnRoute:(id)a3;
- (void)setSecondaryInstructions:(id)a3;
- (void)setShieldInfo:(id)a3;
- (void)setShowInCarPlay:(BOOL)a3;
- (void)setShowInMainScreen:(BOOL)a3;
- (void)setTimeToNextManeuver:(id)a3;
- (void)setTrafficIncidentAlert:(id)a3;
- (void)setTransportType:(int)a3;
@end

@implementation IPCGuidanceStateReply

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeToNextManeuver, 0);
  objc_storeStrong((id *)&self->_remainingMinutesOnRoute, 0);
  objc_storeStrong((id *)&self->_remainingDistanceOnRoute, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_navSessionData, 0);
  objc_storeStrong((id *)&self->_navVolumeSetting, 0);
  objc_storeStrong((id *)&self->_evChargingMetadata, 0);
  objc_storeStrong((id *)&self->_incidentsOnRouteOffsets, 0);
  objc_storeStrong((id *)&self->_incidentsOnRouteData, 0);
  objc_storeStrong((id *)&self->_etaFilterData, 0);
  objc_storeStrong((id *)&self->_originalWaypointRouteData, 0);
  objc_storeStrong((id *)&self->_legacyRouteData, 0);
  objc_storeStrong((id *)&self->_currentSpokenEventID, 0);
  objc_storeStrong((id *)&self->_lastSceneDeactivationTime, 0);
  objc_storeStrong((id *)&self->_arrivalInfo, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);
  objc_storeStrong((id *)&self->_junction, 0);
  objc_storeStrong((id *)&self->_maneuverID, 0);
  objc_storeStrong((id *)&self->_laneGuidanceInfo, 0);
  objc_storeStrong((id *)&self->_shieldInfo, 0);
  objc_storeStrong((id *)&self->_secondaryInstructions, 0);
  objc_storeStrong((id *)&self->_primaryInstructions, 0);
  objc_storeStrong((id *)&self->_alightMessage, 0);

  objc_storeStrong((id *)&self->_trafficIncidentAlert, 0);
}

- (void)setShowInMainScreen:(BOOL)a3
{
  self->_showInMainScreen = a3;
}

- (IPCGuidanceStateReply)initWithDictionary:(id)a3
{
  id v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)IPCGuidanceStateReply;
  v5 = [(IPCMessageObject *)&v79 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_32;
  }
  v6 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyGuidanceStateKey"];
  -[IPCGuidanceStateReply setGuidanceState:](v5, "setGuidanceState:", [v6 unsignedIntegerValue]);

  v7 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyNavigationStateKey"];
  -[IPCGuidanceStateReply setNavigationState:](v5, "setNavigationState:", [v7 unsignedIntegerValue]);

  v8 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyAffectsDimmingKey"];
  -[IPCGuidanceStateReply setAffectsDimming:](v5, "setAffectsDimming:", [v8 BOOLValue]);

  v9 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyTransportTypeKey"];
  -[IPCGuidanceStateReply setTransportType:](v5, "setTransportType:", [v9 integerValue]);

  v10 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyTrafficIncidentAlertKey"];

  if (v10)
  {
    v11 = [IPCTrafficIncidentAlertMessage alloc];
    v12 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyTrafficIncidentAlertKey"];
    v13 = [(IPCTrafficIncidentAlertMessage *)v11 initWithDictionary:v12];
    [(IPCGuidanceStateReply *)v5 setTrafficIncidentAlert:v13];
  }
  v14 = NSStringFromSelector("alightMessage");
  v15 = [v4 objectForKeyedSubscript:v14];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [[TransitAlightMessage alloc] initWithDictionary:v15];
    [(IPCGuidanceStateReply *)v5 setAlightMessage:v16];
  }
  v17 = sub_1000ABC9C(v4, @"kIPCGuidanceStateReplyPrimaryInstructionsKey");
  [(IPCGuidanceStateReply *)v5 setPrimaryInstructions:v17];

  v18 = sub_1000ABC9C(v4, @"kIPCGuidanceStateReplySecondaryInstructionsKey");
  [(IPCGuidanceStateReply *)v5 setSecondaryInstructions:v18];

  v19 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyShieldInfoKey"];

  if (v19)
  {
    v20 = [IPCShieldInfoMessage alloc];
    v21 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyShieldInfoKey"];
    v22 = [(IPCShieldInfoMessage *)v20 initWithDictionary:v21];
    [(IPCGuidanceStateReply *)v5 setShieldInfo:v22];
  }
  v23 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyLaneGuidanceInfoKey"];

  if (v23)
  {
    v24 = [IPCLaneGuidanceInfoReply alloc];
    v25 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyLaneGuidanceInfoKey"];
    v26 = [(IPCLaneGuidanceInfoReply *)v24 initWithDictionary:v25];
    [(IPCGuidanceStateReply *)v5 setLaneGuidanceInfo:v26];
  }
  v27 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyManeuverIDKey"];

  if (v27)
  {
    id v28 = objc_alloc((Class)NSUUID);
    v29 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyManeuverIDKey"];
    id v30 = [v28 initWithUUIDString:v29];
    [(IPCGuidanceStateReply *)v5 setManeuverID:v30];
  }
  v31 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyManeuverKey"];
  -[IPCGuidanceStateReply setManeuver:](v5, "setManeuver:", [v31 integerValue]);

  v32 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyDrivingSideKey"];
  -[IPCGuidanceStateReply setDrivingSide:](v5, "setDrivingSide:", [v32 integerValue]);

  v33 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyJunctionKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v34 = objc_opt_class();
    id v80 = 0;
    v35 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v34 fromData:v33 error:&v80];
    id v36 = v80;
    if (!v36) {
      goto LABEL_16;
    }
    v37 = v36;
  }
  v35 = 0;
LABEL_16:

  [(IPCGuidanceStateReply *)v5 setJunction:v35];
  v38 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyArtworkOverrideClassKey"];
  v39 = NSClassFromString(v38);

  if (!v39) {
    goto LABEL_22;
  }
  v40 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyArtworkOverrideKey"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_20;
  }
  id v80 = 0;
  v39 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v39 fromData:v40 error:&v80];
  id v41 = v80;
  if (v41)
  {
    v42 = v41;

LABEL_20:
    v39 = 0;
  }

LABEL_22:
  [(IPCGuidanceStateReply *)v5 setArtworkOverride:v39];

  v43 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyCurrentLegIndexKey"];
  -[IPCGuidanceStateReply setCurrentLegIndex:](v5, "setCurrentLegIndex:", [v43 unsignedIntegerValue]);

  v44 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyNumberOfLegsKey"];
  -[IPCGuidanceStateReply setNumberOfLegs:](v5, "setNumberOfLegs:", [v44 unsignedIntegerValue]);

  v45 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyArrivalInfoKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v46 = objc_opt_class();
    id v80 = 0;
    v47 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v46 fromData:v45 error:&v80];
    id v48 = v80;
    if (!v48) {
      goto LABEL_26;
    }
    v49 = v48;
  }
  v47 = 0;
LABEL_26:

  [(IPCGuidanceStateReply *)v5 setArrivalInfo:v47];
  uint64_t v50 = objc_opt_class();
  v51 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplySceneDeactivationDateKey"];
  v52 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v50 fromData:v51 error:0];
  [(IPCGuidanceStateReply *)v5 setLastSceneDeactivationTime:v52];

  v53 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyIsAlertingKey"];
  -[IPCGuidanceStateReply setIsAlerting:](v5, "setIsAlerting:", [v53 BOOLValue]);

  v54 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyIsReroutingKey"];
  -[IPCGuidanceStateReply setIsRerouting:](v5, "setIsRerouting:", [v54 BOOLValue]);

  v55 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyCurrentSpokenEventID"];

  if (v55)
  {
    id v56 = objc_alloc((Class)NSUUID);
    v57 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyCurrentSpokenEventID"];
    id v58 = [v56 initWithUUIDString:v57];
    [(IPCGuidanceStateReply *)v5 setCurrentSpokenEventID:v58];
  }
  v59 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyIsStickyKey"];
  -[IPCGuidanceStateReply setIsSticky:](v5, "setIsSticky:", [v59 BOOLValue]);

  v60 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyShowInMainScreenKey"];
  -[IPCGuidanceStateReply setShowInMainScreen:](v5, "setShowInMainScreen:", [v60 BOOLValue]);

  v61 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyShowInCarPlayKey"];
  -[IPCGuidanceStateReply setShowInCarPlay:](v5, "setShowInCarPlay:", [v61 BOOLValue]);

  v62 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyIsMapsForegroundOnMainScreen"];
  -[IPCGuidanceStateReply setIsMapsForegroundOnMainScreen:](v5, "setIsMapsForegroundOnMainScreen:", [v62 BOOLValue]);

  v63 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyRouteDataKey"];
  [(IPCGuidanceStateReply *)v5 setLegacyRouteData:v63];

  v64 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyOriginalWaypointRouteDataKey"];
  [(IPCGuidanceStateReply *)v5 setOriginalWaypointRouteData:v64];

  v65 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyETAFilterDataKey"];
  [(IPCGuidanceStateReply *)v5 setEtaFilterData:v65];

  v66 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyIncidentsOnRouteDataKey"];
  [(IPCGuidanceStateReply *)v5 setIncidentsOnRouteData:v66];

  v67 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyIncidentsOnRouteOffsetsKey"];
  [(IPCGuidanceStateReply *)v5 setIncidentsOnRouteOffsets:v67];

  v68 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyIsNavigatingKey"];
  -[IPCGuidanceStateReply setIsNavigating:](v5, "setIsNavigating:", [v68 BOOLValue]);

  v69 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyNavVolumeSettingKey"];
  [(IPCGuidanceStateReply *)v5 setNavVolumeSetting:v69];

  v70 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyNavSessionDataKey"];
  [(IPCGuidanceStateReply *)v5 setNavSessionData:v70];

  v71 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyDistanceKey"];
  [(IPCGuidanceStateReply *)v5 setDistance:v71];

  v72 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyRemainingDistanceOnRouteKey"];
  [(IPCGuidanceStateReply *)v5 setRemainingDistanceOnRoute:v72];

  v73 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyRemainingMinutesOnRouteKey"];
  [(IPCGuidanceStateReply *)v5 setRemainingMinutesOnRoute:v73];

  v74 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyTimeToNextManeuverKey"];
  [(IPCGuidanceStateReply *)v5 setTimeToNextManeuver:v74];

  v75 = [v4 objectForKeyedSubscript:@"kIPCGuidanceStateReplyEvChargingMetadataKey"];
  [(IPCGuidanceStateReply *)v5 setEvChargingMetadata:v75];

  if (![(IPCGuidanceStateReply *)v5 maneuver])
  {

    goto LABEL_32;
  }
  v76 = [(IPCGuidanceStateReply *)v5 maneuverID];

  if (v76)
  {
LABEL_32:
    v77 = v5;
    goto LABEL_33;
  }
  v77 = 0;
LABEL_33:

  return v77;
}

- (int)maneuver
{
  return self->_maneuver;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (void)setShowInCarPlay:(BOOL)a3
{
  self->_showInCarPlay = a3;
}

- (void)setNumberOfLegs:(unint64_t)a3
{
  self->_numberOfLegs = a3;
}

- (void)setNavVolumeSetting:(id)a3
{
}

- (void)setLastSceneDeactivationTime:(id)a3
{
}

- (void)setIsSticky:(BOOL)a3
{
  self->_isSticky = a3;
}

- (void)setIsRerouting:(BOOL)a3
{
  self->_isRerouting = a3;
}

- (void)setIsNavigating:(BOOL)a3
{
  self->_isNavigating = a3;
}

- (void)setIsMapsForegroundOnMainScreen:(BOOL)a3
{
  self->_isMapsForegroundOnMainScreen = a3;
}

- (void)setGuidanceState:(unint64_t)a3
{
  self->_guidanceState = a3;
}

- (void)setCurrentLegIndex:(unint64_t)a3
{
  self->_currentLegIndex = a3;
}

- (void)setArrivalInfo:(id)a3
{
}

- (void)setAffectsDimming:(BOOL)a3
{
  self->_affectsDimming = a3;
}

- (void)setTimeToNextManeuver:(id)a3
{
}

- (void)setSecondaryInstructions:(id)a3
{
}

- (void)setRemainingMinutesOnRoute:(id)a3
{
}

- (void)setRemainingDistanceOnRoute:(id)a3
{
}

- (void)setPrimaryInstructions:(id)a3
{
}

- (void)setOriginalWaypointRouteData:(id)a3
{
}

- (void)setNavigationState:(unint64_t)a3
{
  self->_navigationState = a3;
}

- (void)setNavSessionData:(id)a3
{
}

- (void)setManeuver:(int)a3
{
  self->_maneuver = a3;
}

- (void)setLegacyRouteData:(id)a3
{
}

- (void)setJunction:(id)a3
{
}

- (void)setIsAlerting:(BOOL)a3
{
  self->_isAlerting = a3;
}

- (void)setIncidentsOnRouteOffsets:(id)a3
{
}

- (void)setIncidentsOnRouteData:(id)a3
{
}

- (void)setEvChargingMetadata:(id)a3
{
}

- (void)setEtaFilterData:(id)a3
{
}

- (void)setDrivingSide:(int)a3
{
  self->_drivingSide = a3;
}

- (void)setDistance:(id)a3
{
}

- (void)setArtworkOverride:(id)a3
{
}

- (BOOL)showInMainScreen
{
  return self->_showInMainScreen;
}

- (int)transportType
{
  return self->_transportType;
}

- (id)shortDescription
{
  unint64_t v3 = [(IPCGuidanceStateReply *)self guidanceState];
  if (v3 >= 5)
  {
    id v4 = +[NSString stringWithFormat:@"?? - %lu", v3];
  }
  else
  {
    id v4 = *(&off_101323898 + v3);
  }
  v5 = [(IPCGuidanceStateReply *)self maneuverID];
  uint64_t v6 = [(IPCGuidanceStateReply *)self maneuver];
  v7 = @"NO_TURN";
  switch((int)v6)
  {
    case 0:
      break;
    case 1:
      v7 = @"LEFT_TURN";
      break;
    case 2:
      v7 = @"RIGHT_TURN";
      break;
    case 3:
      v7 = @"STRAIGHT_AHEAD";
      break;
    case 4:
      v7 = @"U_TURN";
      break;
    case 5:
      v7 = @"FOLLOW_ROAD";
      break;
    case 6:
      v7 = @"ENTER_ROUNDABOUT";
      break;
    case 7:
      v7 = @"EXIT_ROUNDABOUT";
      break;
    case 11:
      v7 = @"OFF_RAMP";
      break;
    case 12:
      v7 = @"ON_RAMP";
      break;
    case 16:
      v7 = @"ARRIVE_END_OF_NAVIGATION";
      break;
    case 17:
      v7 = @"START_ROUTE";
      break;
    case 18:
      v7 = @"ARRIVE_AT_DESTINATION";
      break;
    case 20:
      v7 = @"KEEP_LEFT";
      break;
    case 21:
      v7 = @"KEEP_RIGHT";
      break;
    case 22:
      v7 = @"ENTER_FERRY";
      break;
    case 23:
      v7 = @"EXIT_FERRY";
      break;
    case 24:
      v7 = @"CHANGE_FERRY";
      break;
    case 25:
      v7 = @"START_ROUTE_WITH_U_TURN";
      break;
    case 26:
      v7 = @"U_TURN_AT_ROUNDABOUT";
      break;
    case 27:
      v7 = @"LEFT_TURN_AT_END";
      break;
    case 28:
      v7 = @"RIGHT_TURN_AT_END";
      break;
    case 29:
      v7 = @"HIGHWAY_OFF_RAMP_LEFT";
      break;
    case 30:
      v7 = @"HIGHWAY_OFF_RAMP_RIGHT";
      break;
    case 33:
      v7 = @"ARRIVE_AT_DESTINATION_LEFT";
      break;
    case 34:
      v7 = @"ARRIVE_AT_DESTINATION_RIGHT";
      break;
    case 35:
      v7 = @"U_TURN_WHEN_POSSIBLE";
      break;
    case 39:
      v7 = @"ARRIVE_END_OF_DIRECTIONS";
      break;
    case 41:
      v7 = @"ROUNDABOUT_EXIT_1";
      break;
    case 42:
      v7 = @"ROUNDABOUT_EXIT_2";
      break;
    case 43:
      v7 = @"ROUNDABOUT_EXIT_3";
      break;
    case 44:
      v7 = @"ROUNDABOUT_EXIT_4";
      break;
    case 45:
      v7 = @"ROUNDABOUT_EXIT_5";
      break;
    case 46:
      v7 = @"ROUNDABOUT_EXIT_6";
      break;
    case 47:
      v7 = @"ROUNDABOUT_EXIT_7";
      break;
    case 48:
      v7 = @"ROUNDABOUT_EXIT_8";
      break;
    case 49:
      v7 = @"ROUNDABOUT_EXIT_9";
      break;
    case 50:
      v7 = @"ROUNDABOUT_EXIT_10";
      break;
    case 51:
      v7 = @"ROUNDABOUT_EXIT_11";
      break;
    case 52:
      v7 = @"ROUNDABOUT_EXIT_12";
      break;
    case 53:
      v7 = @"ROUNDABOUT_EXIT_13";
      break;
    case 54:
      v7 = @"ROUNDABOUT_EXIT_14";
      break;
    case 55:
      v7 = @"ROUNDABOUT_EXIT_15";
      break;
    case 56:
      v7 = @"ROUNDABOUT_EXIT_16";
      break;
    case 57:
      v7 = @"ROUNDABOUT_EXIT_17";
      break;
    case 58:
      v7 = @"ROUNDABOUT_EXIT_18";
      break;
    case 59:
      v7 = @"ROUNDABOUT_EXIT_19";
      break;
    case 60:
      v7 = @"SHARP_LEFT_TURN";
      break;
    case 61:
      v7 = @"SHARP_RIGHT_TURN";
      break;
    case 62:
      v7 = @"SLIGHT_LEFT_TURN";
      break;
    case 63:
      v7 = @"SLIGHT_RIGHT_TURN";
      break;
    case 64:
      v7 = @"CHANGE_HIGHWAY";
      break;
    case 65:
      v7 = @"CHANGE_HIGHWAY_LEFT";
      break;
    case 66:
      v7 = @"CHANGE_HIGHWAY_RIGHT";
      break;
    case 80:
      v7 = @"TOLL_STATION";
      break;
    case 81:
      v7 = @"ENTER_TUNNEL";
      break;
    case 82:
      v7 = @"WAYPOINT_STOP";
      break;
    case 83:
      v7 = @"WAYPOINT_STOP_LEFT";
      break;
    case 84:
      v7 = @"WAYPOINT_STOP_RIGHT";
      break;
    case 85:
      v7 = @"RESUME_ROUTE";
      break;
    case 86:
      v7 = @"RESUME_ROUTE_WITH_U_TURN";
      break;
    case 87:
      v7 = @"CUSTOM";
      break;
    case 88:
      v7 = @"TURN_AROUND";
      break;
    default:
      v7 = +[NSString stringWithFormat:@"(unknown: %i)", v6];
      break;
  }
  v8 = [(IPCGuidanceStateReply *)self distance];
  [v8 doubleValue];
  v10 = +[NSString stringWithFormat:@"%@ | ID:%@: %@ in %#.1lfm | alert: %d | MainScreen:%d | Car:%d", v4, v5, v7, v9, [(IPCGuidanceStateReply *)self isAlerting], [(IPCGuidanceStateReply *)self showInMainScreen], [(IPCGuidanceStateReply *)self showInCarPlay]];

  return v10;
}

- (id)dictionaryValue
{
  v73.receiver = self;
  v73.super_class = (Class)IPCGuidanceStateReply;
  unint64_t v3 = [(IPCMessageObject *)&v73 dictionaryValue];
  id v4 = [v3 mutableCopy];

  v5 = +[NSNumber numberWithUnsignedInteger:[(IPCGuidanceStateReply *)self guidanceState]];
  [v4 setObject:v5 forKeyedSubscript:@"kIPCGuidanceStateReplyGuidanceStateKey"];

  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:[(IPCGuidanceStateReply *)self navigationState]];
  [v4 setObject:v6 forKeyedSubscript:@"kIPCGuidanceStateReplyNavigationStateKey"];

  v7 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self affectsDimming]];
  [v4 setObject:v7 forKeyedSubscript:@"kIPCGuidanceStateReplyAffectsDimmingKey"];

  v8 = +[NSNumber numberWithInt:[(IPCGuidanceStateReply *)self transportType]];
  [v4 setObject:v8 forKeyedSubscript:@"kIPCGuidanceStateReplyTransportTypeKey"];

  uint64_t v9 = [(IPCGuidanceStateReply *)self trafficIncidentAlert];

  if (v9)
  {
    v10 = [(IPCGuidanceStateReply *)self trafficIncidentAlert];
    v11 = [v10 dictionaryValue];
    [v4 setObject:v11 forKeyedSubscript:@"kIPCGuidanceStateReplyTrafficIncidentAlertKey"];
  }
  v12 = [(IPCGuidanceStateReply *)self alightMessage];

  if (v12)
  {
    v13 = [(IPCGuidanceStateReply *)self alightMessage];
    v14 = [v13 dictionaryValue];
    v15 = NSStringFromSelector("alightMessage");
    [v4 setObject:v14 forKeyedSubscript:v15];
  }
  v16 = [(IPCGuidanceStateReply *)self primaryInstructions];

  if (v16)
  {
    v17 = [(IPCGuidanceStateReply *)self primaryInstructions];
    v18 = +[NSKeyedArchiver archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];
    [v4 setObject:v18 forKeyedSubscript:@"kIPCGuidanceStateReplyPrimaryInstructionsKey"];
  }
  v19 = [(IPCGuidanceStateReply *)self secondaryInstructions];

  if (v19)
  {
    v20 = [(IPCGuidanceStateReply *)self secondaryInstructions];
    v21 = +[NSKeyedArchiver archivedDataWithRootObject:v20 requiringSecureCoding:1 error:0];
    [v4 setObject:v21 forKeyedSubscript:@"kIPCGuidanceStateReplySecondaryInstructionsKey"];
  }
  v22 = [(IPCGuidanceStateReply *)self shieldInfo];

  if (v22)
  {
    v23 = [(IPCGuidanceStateReply *)self shieldInfo];
    v24 = [v23 dictionaryValue];
    [v4 setObject:v24 forKeyedSubscript:@"kIPCGuidanceStateReplyShieldInfoKey"];
  }
  v25 = [(IPCGuidanceStateReply *)self laneGuidanceInfo];

  if (v25)
  {
    v26 = [(IPCGuidanceStateReply *)self laneGuidanceInfo];
    v27 = [v26 dictionaryValue];
    [v4 setObject:v27 forKeyedSubscript:@"kIPCGuidanceStateReplyLaneGuidanceInfoKey"];
  }
  id v28 = [(IPCGuidanceStateReply *)self maneuverID];

  if (v28)
  {
    v29 = [(IPCGuidanceStateReply *)self maneuverID];
    id v30 = [v29 UUIDString];
    [v4 setObject:v30 forKeyedSubscript:@"kIPCGuidanceStateReplyManeuverIDKey"];
  }
  v31 = +[NSNumber numberWithInt:[(IPCGuidanceStateReply *)self maneuver]];
  [v4 setObject:v31 forKeyedSubscript:@"kIPCGuidanceStateReplyManeuverKey"];

  v32 = +[NSNumber numberWithInt:[(IPCGuidanceStateReply *)self drivingSide]];
  [v4 setObject:v32 forKeyedSubscript:@"kIPCGuidanceStateReplyDrivingSideKey"];

  v33 = [(IPCGuidanceStateReply *)self junction];

  if (v33)
  {
    uint64_t v34 = [(IPCGuidanceStateReply *)self junction];
    v35 = +[NSKeyedArchiver archivedDataWithRootObject:v34 requiringSecureCoding:1 error:0];
    [v4 setObject:v35 forKeyedSubscript:@"kIPCGuidanceStateReplyJunctionKey"];
  }
  id v36 = [(IPCGuidanceStateReply *)self artworkOverride];

  if (v36)
  {
    v37 = [(IPCGuidanceStateReply *)self artworkOverride];
    v38 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v38);
    [v4 setObject:v39 forKeyedSubscript:@"kIPCGuidanceStateReplyArtworkOverrideClassKey"];

    v40 = [(IPCGuidanceStateReply *)self artworkOverride];
    id v41 = +[NSKeyedArchiver archivedDataWithRootObject:v40 requiringSecureCoding:1 error:0];
    [v4 setObject:v41 forKeyedSubscript:@"kIPCGuidanceStateReplyArtworkOverrideKey"];
  }
  v42 = +[NSNumber numberWithUnsignedInteger:[(IPCGuidanceStateReply *)self currentLegIndex]];
  [v4 setObject:v42 forKeyedSubscript:@"kIPCGuidanceStateReplyCurrentLegIndexKey"];

  v43 = +[NSNumber numberWithUnsignedInteger:[(IPCGuidanceStateReply *)self numberOfLegs]];
  [v4 setObject:v43 forKeyedSubscript:@"kIPCGuidanceStateReplyNumberOfLegsKey"];

  v44 = [(IPCGuidanceStateReply *)self arrivalInfo];

  if (v44)
  {
    v45 = [(IPCGuidanceStateReply *)self arrivalInfo];
    uint64_t v46 = +[NSKeyedArchiver archivedDataWithRootObject:v45 requiringSecureCoding:1 error:0];
    [v4 setObject:v46 forKeyedSubscript:@"kIPCGuidanceStateReplyArrivalInfoKey"];
  }
  v47 = [(IPCGuidanceStateReply *)self lastSceneDeactivationTime];
  id v48 = +[NSKeyedArchiver archivedDataWithRootObject:v47 requiringSecureCoding:1 error:0];
  [v4 setObject:v48 forKeyedSubscript:@"kIPCGuidanceStateReplySceneDeactivationDateKey"];

  v49 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self isAlerting]];
  [v4 setObject:v49 forKeyedSubscript:@"kIPCGuidanceStateReplyIsAlertingKey"];

  uint64_t v50 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self isRerouting]];
  [v4 setObject:v50 forKeyedSubscript:@"kIPCGuidanceStateReplyIsReroutingKey"];

  v51 = [(IPCGuidanceStateReply *)self currentSpokenEventID];
  v52 = [v51 UUIDString];
  [v4 setObject:v52 forKeyedSubscript:@"kIPCGuidanceStateReplyCurrentSpokenEventID"];

  v53 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self isSticky]];
  [v4 setObject:v53 forKeyedSubscript:@"kIPCGuidanceStateReplyIsStickyKey"];

  v54 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self showInMainScreen]];
  [v4 setObject:v54 forKeyedSubscript:@"kIPCGuidanceStateReplyShowInMainScreenKey"];

  v55 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self showInCarPlay]];
  [v4 setObject:v55 forKeyedSubscript:@"kIPCGuidanceStateReplyShowInCarPlayKey"];

  id v56 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self isMapsForegroundOnMainScreen]];
  [v4 setObject:v56 forKeyedSubscript:@"kIPCGuidanceStateReplyIsMapsForegroundOnMainScreen"];

  v57 = [(IPCGuidanceStateReply *)self legacyRouteData];
  [v4 setObject:v57 forKeyedSubscript:@"kIPCGuidanceStateReplyRouteDataKey"];

  id v58 = [(IPCGuidanceStateReply *)self originalWaypointRouteData];
  [v4 setObject:v58 forKeyedSubscript:@"kIPCGuidanceStateReplyOriginalWaypointRouteDataKey"];

  v59 = [(IPCGuidanceStateReply *)self incidentsOnRouteData];
  [v4 setObject:v59 forKeyedSubscript:@"kIPCGuidanceStateReplyIncidentsOnRouteDataKey"];

  v60 = [(IPCGuidanceStateReply *)self incidentsOnRouteOffsets];
  [v4 setObject:v60 forKeyedSubscript:@"kIPCGuidanceStateReplyIncidentsOnRouteOffsetsKey"];

  v61 = [(IPCGuidanceStateReply *)self etaFilterData];
  [v4 setObject:v61 forKeyedSubscript:@"kIPCGuidanceStateReplyETAFilterDataKey"];

  v62 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self isNavigating]];
  [v4 setObject:v62 forKeyedSubscript:@"kIPCGuidanceStateReplyIsNavigatingKey"];

  v63 = [(IPCGuidanceStateReply *)self navVolumeSetting];
  id v64 = [v63 copy];
  [v4 setObject:v64 forKeyedSubscript:@"kIPCGuidanceStateReplyNavVolumeSettingKey"];

  v65 = [(IPCGuidanceStateReply *)self navSessionData];
  [v4 setObject:v65 forKeyedSubscript:@"kIPCGuidanceStateReplyNavSessionDataKey"];

  v66 = [(IPCGuidanceStateReply *)self distance];
  [v4 setObject:v66 forKeyedSubscript:@"kIPCGuidanceStateReplyDistanceKey"];

  v67 = [(IPCGuidanceStateReply *)self remainingDistanceOnRoute];
  [v4 setObject:v67 forKeyedSubscript:@"kIPCGuidanceStateReplyRemainingDistanceOnRouteKey"];

  v68 = [(IPCGuidanceStateReply *)self remainingMinutesOnRoute];
  [v4 setObject:v68 forKeyedSubscript:@"kIPCGuidanceStateReplyRemainingMinutesOnRouteKey"];

  v69 = [(IPCGuidanceStateReply *)self timeToNextManeuver];
  [v4 setObject:v69 forKeyedSubscript:@"kIPCGuidanceStateReplyTimeToNextManeuverKey"];

  v70 = [(IPCGuidanceStateReply *)self evChargingMetadata];
  [v4 setObject:v70 forKeyedSubscript:@"kIPCGuidanceStateReplyEvChargingMetadataKey"];

  id v71 = [v4 copy];

  return v71;
}

- (BOOL)showInCarPlay
{
  return self->_showInCarPlay;
}

- (NSUUID)maneuverID
{
  return self->_maneuverID;
}

- (BOOL)isAlerting
{
  return self->_isAlerting;
}

- (unint64_t)guidanceState
{
  return self->_guidanceState;
}

- (NSNumber)distance
{
  return self->_distance;
}

- (TransitAlightMessage)alightMessage
{
  return self->_alightMessage;
}

- (IPCTrafficIncidentAlertMessage)trafficIncidentAlert
{
  return self->_trafficIncidentAlert;
}

- (NSNumber)timeToNextManeuver
{
  return self->_timeToNextManeuver;
}

- (IPCShieldInfoMessage)shieldInfo
{
  return self->_shieldInfo;
}

- (NSArray)secondaryInstructions
{
  return self->_secondaryInstructions;
}

- (NSNumber)remainingMinutesOnRoute
{
  return self->_remainingMinutesOnRoute;
}

- (NSNumber)remainingDistanceOnRoute
{
  return self->_remainingDistanceOnRoute;
}

- (NSArray)primaryInstructions
{
  return self->_primaryInstructions;
}

- (NSData)originalWaypointRouteData
{
  return self->_originalWaypointRouteData;
}

- (unint64_t)numberOfLegs
{
  return self->_numberOfLegs;
}

- (unint64_t)navigationState
{
  return self->_navigationState;
}

- (NSString)navVolumeSetting
{
  return self->_navVolumeSetting;
}

- (NSData)navSessionData
{
  return self->_navSessionData;
}

- (NSData)legacyRouteData
{
  return self->_legacyRouteData;
}

- (NSDate)lastSceneDeactivationTime
{
  return self->_lastSceneDeactivationTime;
}

- (IPCLaneGuidanceInfoReply)laneGuidanceInfo
{
  return self->_laneGuidanceInfo;
}

- (MKJunction)junction
{
  return self->_junction;
}

- (BOOL)isSticky
{
  return self->_isSticky;
}

- (BOOL)isRerouting
{
  return self->_isRerouting;
}

- (BOOL)isNavigating
{
  return self->_isNavigating;
}

- (BOOL)isMapsForegroundOnMainScreen
{
  return self->_isMapsForegroundOnMainScreen;
}

- (NSArray)incidentsOnRouteOffsets
{
  return self->_incidentsOnRouteOffsets;
}

- (NSArray)incidentsOnRouteData
{
  return self->_incidentsOnRouteData;
}

- (NSData)evChargingMetadata
{
  return self->_evChargingMetadata;
}

- (NSData)etaFilterData
{
  return self->_etaFilterData;
}

- (int)drivingSide
{
  return self->_drivingSide;
}

- (NSUUID)currentSpokenEventID
{
  return self->_currentSpokenEventID;
}

- (unint64_t)currentLegIndex
{
  return self->_currentLegIndex;
}

- (GEOTransitArtworkDataSource)artworkOverride
{
  return self->_artworkOverride;
}

- (MNArrivalInfo)arrivalInfo
{
  return self->_arrivalInfo;
}

- (BOOL)affectsDimming
{
  return self->_affectsDimming;
}

- (id)uniqueIdForBannerType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v5 = [(IPCGuidanceStateReply *)self maneuverUniqueId];
      goto LABEL_9;
    case 1uLL:
      v5 = [(IPCGuidanceStateReply *)self trafficAlertUniqueId];
      goto LABEL_9;
    case 2uLL:
      v5 = [(IPCGuidanceStateReply *)self transitAlightUniqueId];
      goto LABEL_9;
    case 3uLL:
      v5 = [(IPCGuidanceStateReply *)self transitDestinationUniqueId];
LABEL_9:
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)maneuverUniqueId
{
  v2 = [(IPCGuidanceStateReply *)self maneuverID];
  uint64_t v3 = [v2 UUIDString];
  uint64_t v4 = +[NSString stringWithFormat:@"ManeuverBannerItem-%@", v3];

  return v4;
}

- (id)trafficAlertUniqueId
{
  v2 = [(IPCGuidanceStateReply *)self trafficIncidentAlert];
  uint64_t v3 = [v2 identifier];
  uint64_t v4 = +[NSString stringWithFormat:@"TrafficAlertBannerItem-%@", v3];

  return v4;
}

- (id)transitAlightUniqueId
{
  v2 = [(IPCGuidanceStateReply *)self alightMessage];
  uint64_t v3 = [v2 identifier];
  uint64_t v4 = +[NSString stringWithFormat:@"TransitAlightBannerItem-%@", v3];

  return v4;
}

- (id)transitDestinationUniqueId
{
  return +[NSString stringWithFormat:@"TransitDestinationBannerItem-"];
}

- (BOOL)shouldExpandForSpokenEventFromGuidanceUpdate:(id)a3 forType:(unint64_t)a4
{
  id v6 = a3;
  int v7 = SBUIIsSystemApertureEnabled();
  LOBYTE(v8) = 0;
  if (!a4 && v7)
  {
    uint64_t v9 = [v6 currentSpokenEventID];
    if (v9)
    {
      v10 = [(IPCGuidanceStateReply *)self currentSpokenEventID];
      v11 = [v6 currentSpokenEventID];
      unsigned int v8 = [v10 isEqual:v11] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (BOOL)shouldPresentNextGuidanceUpdate:(id)a3 forType:(unint64_t)a4 target:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 2)
  {
    v19 = [(IPCGuidanceStateReply *)self alightMessage];
    id v20 = [v19 stopIndex];
    v21 = [v8 alightMessage];
    if (v20 == [v21 stopIndex])
    {
      v22 = [(IPCGuidanceStateReply *)self alightMessage];
      self = (IPCGuidanceStateReply *)[v22 stepIndex];
      v23 = [v8 alightMessage];
      LOBYTE(self) = self != [v23 stepIndex];
    }
    else
    {
      LOBYTE(self) = 1;
    }
  }
  else
  {
    if (a4 != 1)
    {
      if (!a4)
      {
        v10 = [(IPCGuidanceStateReply *)self maneuverID];
        v11 = [v10 UUIDString];

        if (v11)
        {
          v12 = [(IPCGuidanceStateReply *)self maneuverUniqueId];
          v13 = [v8 maneuverUniqueId];
          unsigned int v14 = [v12 isEqualToString:v13];

          if (!v14)
          {
LABEL_34:
            LOBYTE(self) = 1;
            goto LABEL_36;
          }
          v15 = [(IPCGuidanceStateReply *)self laneGuidanceInfo];
          if (!v15)
          {
            v24 = [v8 laneGuidanceInfo];
            if (v24)
            {

              goto LABEL_34;
            }
          }
          uint64_t v16 = [(IPCGuidanceStateReply *)self laneGuidanceInfo];
          if (v16)
          {
            v17 = (void *)v16;
            v18 = [v8 laneGuidanceInfo];

            if (v15) {
            if (!v18)
            }
              goto LABEL_34;
          }
          else if (v15)
          {
          }
          v25 = [(IPCGuidanceStateReply *)self laneGuidanceInfo];
          uint64_t v26 = [v25 laneInfoId];
          if (v26)
          {
            v27 = (void *)v26;
            id v28 = [(IPCGuidanceStateReply *)self laneGuidanceInfo];
            v29 = [v28 laneInfoId];
            id v30 = [v8 laneGuidanceInfo];
            v31 = [v30 laneInfoId];
            unsigned int v32 = [v29 isEqual:v31];

            if (!v32) {
              goto LABEL_34;
            }
          }
          else
          {
          }
          if ([v8 isAlerting]
            && (!SBUIIsSystemApertureEnabled() || [v9 destination])
            || [(IPCGuidanceStateReply *)self isArrived]
            && ([v8 isParking] & 1) != 0
            || [(IPCGuidanceStateReply *)self isParking]
            && ([v8 isArrived] & 1) != 0
            || [(IPCGuidanceStateReply *)self isParked]
            && ([v8 isArrived] & 1) != 0)
          {
            goto LABEL_34;
          }
        }
      }
      LOBYTE(self) = 0;
      goto LABEL_36;
    }
    v19 = [(IPCGuidanceStateReply *)self trafficAlertUniqueId];
    v21 = [v8 trafficAlertUniqueId];
    LODWORD(self) = [v19 isEqualToString:v21] ^ 1;
  }

LABEL_36:
  return (char)self;
}

- (id)maneuverGuidanceInfo
{
  uint64_t v3 = [(IPCGuidanceStateReply *)self shieldInfo];
  uint64_t v4 = [v3 shieldInfo];

  v5 = [GuidanceManeuverArtwork alloc];
  uint64_t v6 = [(IPCGuidanceStateReply *)self maneuver];
  int v7 = [(IPCGuidanceStateReply *)self junction];
  uint64_t v8 = [(IPCGuidanceStateReply *)self drivingSide];
  id v9 = [(IPCGuidanceStateReply *)self artworkOverride];
  v10 = [(GuidanceManeuverArtwork *)v5 initWithManeuver:v6 junction:v7 drivingSide:v8 artworkDataSource:v9];

  v11 = [NavSignManeuverGuidanceInfo alloc];
  v12 = [(IPCGuidanceStateReply *)self maneuverID];
  v13 = [(IPCGuidanceStateReply *)self primaryInstructions];
  unsigned int v14 = [(IPCGuidanceStateReply *)self secondaryInstructions];
  v15 = [(NavSignManeuverGuidanceInfo *)v11 initWithSignID:v12 maneuverArtwork:v10 majorTextAlternatives:v13 minorTextAlternatives:v14 shieldInfo:v4];

  return v15;
}

- (id)description
{
  uint64_t v3 = [(IPCGuidanceStateReply *)self primaryInstructions];
  id v20 = sub_100099700(v3, &stru_101323858);

  uint64_t v4 = [(IPCGuidanceStateReply *)self secondaryInstructions];
  v19 = sub_100099700(v4, &stru_101323878);

  v50.receiver = self;
  v50.super_class = (Class)IPCGuidanceStateReply;
  v49 = [(IPCGuidanceStateReply *)&v50 description];
  id v48 = +[NSNumber numberWithUnsignedInteger:[(IPCGuidanceStateReply *)self guidanceState]];
  v47 = +[NSNumber numberWithUnsignedInteger:[(IPCGuidanceStateReply *)self navigationState]];
  uint64_t v46 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self affectsDimming]];
  v45 = +[NSNumber numberWithInt:[(IPCGuidanceStateReply *)self transportType]];
  v44 = [(IPCGuidanceStateReply *)self trafficIncidentAlert];
  v43 = [v20 componentsJoinedByString:@" | "];
  v42 = [v19 componentsJoinedByString:@" | "];
  id v41 = [(IPCGuidanceStateReply *)self shieldInfo];
  v40 = [(IPCGuidanceStateReply *)self maneuverID];
  v39 = +[NSNumber numberWithInt:[(IPCGuidanceStateReply *)self maneuver]];
  v38 = +[NSNumber numberWithInt:[(IPCGuidanceStateReply *)self drivingSide]];
  unsigned int v32 = [(IPCGuidanceStateReply *)self junction];
  v37 = [(IPCGuidanceStateReply *)self artworkOverride];
  id v36 = +[NSNumber numberWithUnsignedInteger:[(IPCGuidanceStateReply *)self currentLegIndex]];
  v35 = +[NSNumber numberWithUnsignedInteger:[(IPCGuidanceStateReply *)self numberOfLegs]];
  uint64_t v34 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self isArriving]];
  v33 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self isArrived]];
  v29 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self isParking]];
  v31 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self isParked]];
  v17 = [(IPCGuidanceStateReply *)self arrivalInfo];
  id v30 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self isAlerting]];
  id v28 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self isRerouting]];
  uint64_t v16 = [(IPCGuidanceStateReply *)self currentSpokenEventID];
  v27 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self isSticky]];
  uint64_t v26 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self showInMainScreen]];
  v25 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self showInCarPlay]];
  v24 = [(IPCGuidanceStateReply *)self navVolumeSetting];
  v23 = [(IPCGuidanceStateReply *)self navSessionData];
  v22 = [(IPCGuidanceStateReply *)self distance];
  v21 = [(IPCGuidanceStateReply *)self remainingDistanceOnRoute];
  v15 = [(IPCGuidanceStateReply *)self remainingMinutesOnRoute];
  v5 = +[NSNumber numberWithBool:[(IPCGuidanceStateReply *)self isNavigating]];
  uint64_t v6 = [(IPCGuidanceStateReply *)self legacyRouteData];
  unsigned int v14 = [(IPCGuidanceStateReply *)self originalWaypointRouteData];
  int v7 = [(IPCGuidanceStateReply *)self etaFilterData];
  uint64_t v8 = [(IPCGuidanceStateReply *)self incidentsOnRouteData];
  id v9 = [(IPCGuidanceStateReply *)self incidentsOnRouteOffsets];
  v10 = [(IPCGuidanceStateReply *)self timeToNextManeuver];
  v11 = [(IPCGuidanceStateReply *)self laneGuidanceInfo];
  v12 = [(IPCGuidanceStateReply *)self evChargingMetadata];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@             guidanceState : {%@}             navigationState : {%@}             affectsDimming : {%@}             transportType : {%@}             trafficIncidentAlert : {%@}             primaryInstructions : [%@]             secondaryInstructions : [%@]             shieldInfo : {%@}             maneuverID : {%@}             maneuver : {%@}             drivingSide : {%@}             junction : {%@}             artworkOverride : {%@}             currentLegIndex : {%@}             numberOfLegs : {%@}             isArriving : {%@}             isArrived : {%@}             isParking : {%@}             isParked : {%@}             arrivalInfo : {%@}             isAlerting : {%@}             isRerouting : {%@}             currentSpokenEventID : {%@}             isSticky : {%@}             showInMainScreen : {%@}             showInCarPlay: {%@}             navVolumeSetting : {%@}             navSessionData : {%@}             distance : {%@}             remainingDistanceOnRoute : {%@}             remainingMinutesOnRoute : {%@}             isNavigating : {%@}             legacyRouteData : {%@}             originalWaypointRouteData : {%@}             etaFilterData: {%@}             incidentsOnRouteData: {%@}             incidentsOnRouteOffsets: {%@}             timeToNextManeuver : {%@}             laneGuidance : {%@}             evChargingMetadata: {%@}", v49, v48, v47, v46, v45, v44, v43, v42, v41, v40, v39, v38, v32, v37, v36, v35,
    v34,
    v33,
    v29,
    v31,
    v17,
    v30,
    v28,
    v16,
    v27,
    v26,
    v25,
    v24,
    v23,
    v22,
    v21,
    v15,
    v5,
    v6,
    v14,
    v7,
    v8,
    v9,
    v10,
    v11,
    v12);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)isInArrivalState
{
  if ([(IPCGuidanceStateReply *)self isArriving]) {
    return 1;
  }

  return [(IPCGuidanceStateReply *)self isArrived];
}

- (BOOL)isArriving
{
  v2 = [(IPCGuidanceStateReply *)self arrivalInfo];
  BOOL v3 = [v2 arrivalState] == (id)2;

  return v3;
}

- (BOOL)isArrived
{
  BOOL v3 = [(IPCGuidanceStateReply *)self arrivalInfo];
  if ([v3 arrivalState] == (id)4)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(IPCGuidanceStateReply *)self arrivalInfo];
    BOOL v4 = [v5 arrivalState] == (id)3;
  }
  return v4;
}

- (BOOL)isInParkingState
{
  if ([(IPCGuidanceStateReply *)self isParking]) {
    return 1;
  }

  return [(IPCGuidanceStateReply *)self isParked];
}

- (BOOL)isParking
{
  BOOL v3 = [(IPCGuidanceStateReply *)self arrivalInfo];
  if ([v3 arrivalState] == (id)5)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(IPCGuidanceStateReply *)self arrivalInfo];
    BOOL v4 = [v5 arrivalState] == (id)6;
  }
  return v4;
}

- (BOOL)isParked
{
  v2 = [(IPCGuidanceStateReply *)self arrivalInfo];
  BOOL v3 = [v2 arrivalState] == (id)1;

  return v3;
}

- (void)setTrafficIncidentAlert:(id)a3
{
}

- (void)setAlightMessage:(id)a3
{
}

- (void)setShieldInfo:(id)a3
{
}

- (void)setLaneGuidanceInfo:(id)a3
{
}

- (void)setManeuverID:(id)a3
{
}

- (void)setCurrentSpokenEventID:(id)a3
{
}

@end