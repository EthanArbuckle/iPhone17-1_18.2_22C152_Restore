@interface MNGuidanceARInfo
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinate;
- (BOOL)_isInstructionStringOutputEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (GEOComposedString)instructionString;
- (GEOPolylineCoordinateRange)locationCoordinateRange;
- (GEOServerFormattedString)instruction;
- (MNGuidanceARInfo)init;
- (MNGuidanceARInfo)initWithCoder:(id)a3;
- (MNGuidanceARInfo)initWithEventID:(id)a3 type:(int)a4 maneuverType:(int)a5 instruction:(id)a6 variableOverrides:(id)a7 arrowLabel:(id)a8 locationCoordinate:(id)a9 maneuverRoadName:(id)a10 heading:(double)a11 stepIndex:(unint64_t)a12;
- (MNGuidanceARInfo)initWithEventID:(id)a3 type:(int)a4 maneuverType:(int)a5 instruction:(id)a6 variableOverrides:(id)a7 arrowLabel:(id)a8 locationCoordinateRange:(GEOPolylineCoordinateRange)a9 maneuverRoadName:(id)a10 stepIndex:(unint64_t)a11;
- (NSDictionary)variableOverrides;
- (NSString)arrowLabel;
- (NSString)maneuverRoadName;
- (NSUUID)guidanceEventID;
- (double)heading;
- (id)debugDescription;
- (id)description;
- (int)eventType;
- (int)maneuverType;
- (unint64_t)hash;
- (unint64_t)priority;
- (unint64_t)stepIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setInstructionString:(id)a3;
- (void)setPriority:(unint64_t)a3;
@end

@implementation MNGuidanceARInfo

- (MNGuidanceARInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)MNGuidanceARInfo;
  result = [(MNGuidanceARInfo *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_locationCoordinate.latitude = kGEOLocationCoordinate3DInvalid_0;
    result->_locationCoordinate.altitude = 1.79769313e308;
    result->_locationCoordinateRange = (GEOPolylineCoordinateRange)*MEMORY[0x1E4F641A0];
    result->_heading = -1.0;
  }
  return result;
}

- (MNGuidanceARInfo)initWithEventID:(id)a3 type:(int)a4 maneuverType:(int)a5 instruction:(id)a6 variableOverrides:(id)a7 arrowLabel:(id)a8 locationCoordinate:(id)a9 maneuverRoadName:(id)a10 heading:(double)a11 stepIndex:(unint64_t)a12
{
  double var2 = a9.var2;
  double var1 = a9.var1;
  double var0 = a9.var0;
  id v32 = a3;
  id v31 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a10;
  v26 = [(MNGuidanceARInfo *)self init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_guidanceEventID, a3);
    v27->_eventType = a4;
    v27->_maneuverType = a5;
    objc_storeStrong((id *)&v27->_instruction, a6);
    uint64_t v28 = [v23 objectForKeyedSubscript:@"{Destination}"];
    variableOverrides = v27->_variableOverrides;
    v27->_variableOverrides = (NSDictionary *)v28;

    objc_storeStrong((id *)&v27->_arrowLabel, a8);
    v27->_locationCoordinate.latitude = var0;
    v27->_locationCoordinate.longitude = var1;
    v27->_locationCoordinate.altitude = var2;
    objc_storeStrong((id *)&v27->_maneuverRoadName, a10);
    v27->_heading = a11;
    v27->_stepIndex = a12;
  }

  return v27;
}

- (MNGuidanceARInfo)initWithEventID:(id)a3 type:(int)a4 maneuverType:(int)a5 instruction:(id)a6 variableOverrides:(id)a7 arrowLabel:(id)a8 locationCoordinateRange:(GEOPolylineCoordinateRange)a9 maneuverRoadName:(id)a10 stepIndex:(unint64_t)a11
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v25 = a8;
  id v19 = a10;
  v20 = [(MNGuidanceARInfo *)self init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_guidanceEventID, a3);
    v21->_eventType = a4;
    v21->_maneuverType = a5;
    objc_storeStrong((id *)&v21->_instruction, a6);
    objc_storeStrong((id *)&v21->_variableOverrides, a7);
    objc_storeStrong((id *)&v21->_arrowLabel, a8);
    v21->_locationCoordinateRange = a9;
    objc_storeStrong((id *)&v21->_maneuverRoadName, a10);
    v21->_stepIndex = a11;
  }

  return v21;
}

- (id)description
{
  uint64_t eventType = self->_eventType;
  if (eventType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", eventType);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E60FB1B8[eventType];
  }
  v5 = [(__CFString *)v4 stringByReplacingOccurrencesOfString:@"AR_GUIDANCE_TYPE_" withString:&stru_1F0E08010];
  v6 = [v5 capitalizedString];

  v7 = [(GEOComposedString *)self->_instructionString optionsWithArgumentHandler:&__block_literal_global_36];
  [v7 setCreateAttributedString:1];
  v8 = [(GEOComposedString *)self->_instructionString stringWithOptions:v7];
  v9 = [MEMORY[0x1E4F28E78] stringWithFormat:@"[%@] %@", v6, v8];
  v10 = v9;
  if (self->_arrowLabel) {
    [v9 appendFormat:@" | %@", self->_arrowLabel];
  }
  v11 = @"LEFT_TURN";
  switch(self->_maneuverType)
  {
    case 0:
      goto LABEL_70;
    case 1:
      goto LABEL_69;
    case 2:
      v11 = @"RIGHT_TURN";
      goto LABEL_69;
    case 3:
      v11 = @"STRAIGHT_AHEAD";
      goto LABEL_69;
    case 4:
      v11 = @"U_TURN";
      goto LABEL_69;
    case 5:
      v11 = @"FOLLOW_ROAD";
      goto LABEL_69;
    case 6:
      v11 = @"ENTER_ROUNDABOUT";
      goto LABEL_69;
    case 7:
      v11 = @"EXIT_ROUNDABOUT";
      goto LABEL_69;
    case 0xB:
      v11 = @"OFF_RAMP";
      goto LABEL_69;
    case 0xC:
      v11 = @"ON_RAMP";
      goto LABEL_69;
    case 0x10:
      v11 = @"ARRIVE_END_OF_NAVIGATION";
      goto LABEL_69;
    case 0x11:
      v11 = @"START_ROUTE";
      goto LABEL_69;
    case 0x12:
      v11 = @"ARRIVE_AT_DESTINATION";
      goto LABEL_69;
    case 0x14:
      v11 = @"KEEP_LEFT";
      goto LABEL_69;
    case 0x15:
      v11 = @"KEEP_RIGHT";
      goto LABEL_69;
    case 0x16:
      v11 = @"ENTER_FERRY";
      goto LABEL_69;
    case 0x17:
      v11 = @"EXIT_FERRY";
      goto LABEL_69;
    case 0x18:
      v11 = @"CHANGE_FERRY";
      goto LABEL_69;
    case 0x19:
      v11 = @"START_ROUTE_WITH_U_TURN";
      goto LABEL_69;
    case 0x1A:
      v11 = @"U_TURN_AT_ROUNDABOUT";
      goto LABEL_69;
    case 0x1B:
      v11 = @"LEFT_TURN_AT_END";
      goto LABEL_69;
    case 0x1C:
      v11 = @"RIGHT_TURN_AT_END";
      goto LABEL_69;
    case 0x1D:
      v11 = @"HIGHWAY_OFF_RAMP_LEFT";
      goto LABEL_69;
    case 0x1E:
      v11 = @"HIGHWAY_OFF_RAMP_RIGHT";
      goto LABEL_69;
    case 0x21:
      v11 = @"ARRIVE_AT_DESTINATION_LEFT";
      goto LABEL_69;
    case 0x22:
      v11 = @"ARRIVE_AT_DESTINATION_RIGHT";
      goto LABEL_69;
    case 0x23:
      v11 = @"U_TURN_WHEN_POSSIBLE";
      goto LABEL_69;
    case 0x27:
      v11 = @"ARRIVE_END_OF_DIRECTIONS";
      goto LABEL_69;
    case 0x29:
      v11 = @"ROUNDABOUT_EXIT_1";
      goto LABEL_69;
    case 0x2A:
      v11 = @"ROUNDABOUT_EXIT_2";
      goto LABEL_69;
    case 0x2B:
      v11 = @"ROUNDABOUT_EXIT_3";
      goto LABEL_69;
    case 0x2C:
      v11 = @"ROUNDABOUT_EXIT_4";
      goto LABEL_69;
    case 0x2D:
      v11 = @"ROUNDABOUT_EXIT_5";
      goto LABEL_69;
    case 0x2E:
      v11 = @"ROUNDABOUT_EXIT_6";
      goto LABEL_69;
    case 0x2F:
      v11 = @"ROUNDABOUT_EXIT_7";
      goto LABEL_69;
    case 0x30:
      v11 = @"ROUNDABOUT_EXIT_8";
      goto LABEL_69;
    case 0x31:
      v11 = @"ROUNDABOUT_EXIT_9";
      goto LABEL_69;
    case 0x32:
      v11 = @"ROUNDABOUT_EXIT_10";
      goto LABEL_69;
    case 0x33:
      v11 = @"ROUNDABOUT_EXIT_11";
      goto LABEL_69;
    case 0x34:
      v11 = @"ROUNDABOUT_EXIT_12";
      goto LABEL_69;
    case 0x35:
      v11 = @"ROUNDABOUT_EXIT_13";
      goto LABEL_69;
    case 0x36:
      v11 = @"ROUNDABOUT_EXIT_14";
      goto LABEL_69;
    case 0x37:
      v11 = @"ROUNDABOUT_EXIT_15";
      goto LABEL_69;
    case 0x38:
      v11 = @"ROUNDABOUT_EXIT_16";
      goto LABEL_69;
    case 0x39:
      v11 = @"ROUNDABOUT_EXIT_17";
      goto LABEL_69;
    case 0x3A:
      v11 = @"ROUNDABOUT_EXIT_18";
      goto LABEL_69;
    case 0x3B:
      v11 = @"ROUNDABOUT_EXIT_19";
      goto LABEL_69;
    case 0x3C:
      v11 = @"SHARP_LEFT_TURN";
      goto LABEL_69;
    case 0x3D:
      v11 = @"SHARP_RIGHT_TURN";
      goto LABEL_69;
    case 0x3E:
      v11 = @"SLIGHT_LEFT_TURN";
      goto LABEL_69;
    case 0x3F:
      v11 = @"SLIGHT_RIGHT_TURN";
      goto LABEL_69;
    case 0x40:
      v11 = @"CHANGE_HIGHWAY";
      goto LABEL_69;
    case 0x41:
      v11 = @"CHANGE_HIGHWAY_LEFT";
      goto LABEL_69;
    case 0x42:
      v11 = @"CHANGE_HIGHWAY_RIGHT";
      goto LABEL_69;
    case 0x50:
      v11 = @"TOLL_STATION";
      goto LABEL_69;
    case 0x51:
      v11 = @"ENTER_TUNNEL";
      goto LABEL_69;
    case 0x52:
      v11 = @"WAYPOINT_STOP";
      goto LABEL_69;
    case 0x53:
      v11 = @"WAYPOINT_STOP_LEFT";
      goto LABEL_69;
    case 0x54:
      v11 = @"WAYPOINT_STOP_RIGHT";
      goto LABEL_69;
    case 0x55:
      v11 = @"RESUME_ROUTE";
      goto LABEL_69;
    case 0x56:
      v11 = @"RESUME_ROUTE_WITH_U_TURN";
      goto LABEL_69;
    case 0x57:
      v11 = @"CUSTOM";
      goto LABEL_69;
    case 0x58:
      v11 = @"TURN_AROUND";
      goto LABEL_69;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_maneuverType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_69:
      [v10 appendFormat:@" | %@", v11];

LABEL_70:
      double longitude = self->_locationCoordinate.longitude;
      if (longitude >= -180.0 && longitude <= 180.0)
      {
        double latitude = self->_locationCoordinate.latitude;
        if (latitude >= -90.0 && latitude <= 90.0) {
          [v10 appendFormat:@" | %f, %f, %f", *(void *)&latitude, *(void *)&self->_locationCoordinate.longitude, *(void *)&self->_locationCoordinate.altitude];
        }
      }
      if (self->_heading != -1.0) {
        objc_msgSend(v10, "appendFormat:", @" | %.2lf", *(void *)&self->_heading);
      }
      if (GEOPolylineCoordinateRangeIsValid())
      {
        v14 = GEOPolylineCoordinateRangeAsString();
        [v10 appendFormat:@" | %@", v14];
      }
      [v10 appendFormat:@" | %@", self->_guidanceEventID];

      return v10;
  }
}

void __31__MNGuidanceARInfo_description__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 maneuverFormat];

  if (v2)
  {
    objc_super v3 = [v4 maneuverFormat];
    [v3 setAttributedStringHandler:&__block_literal_global_13_0];
  }
}

id __31__MNGuidanceARInfo_description__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = @"NO_TURN";
  switch((int)a2)
  {
    case 0:
      break;
    case 1:
      v5 = @"LEFT_TURN";
      break;
    case 2:
      v5 = @"RIGHT_TURN";
      break;
    case 3:
      v5 = @"STRAIGHT_AHEAD";
      break;
    case 4:
      v5 = @"U_TURN";
      break;
    case 5:
      v5 = @"FOLLOW_ROAD";
      break;
    case 6:
      v5 = @"ENTER_ROUNDABOUT";
      break;
    case 7:
      v5 = @"EXIT_ROUNDABOUT";
      break;
    case 11:
      v5 = @"OFF_RAMP";
      break;
    case 12:
      v5 = @"ON_RAMP";
      break;
    case 16:
      v5 = @"ARRIVE_END_OF_NAVIGATION";
      break;
    case 17:
      v5 = @"START_ROUTE";
      break;
    case 18:
      v5 = @"ARRIVE_AT_DESTINATION";
      break;
    case 20:
      v5 = @"KEEP_LEFT";
      break;
    case 21:
      v5 = @"KEEP_RIGHT";
      break;
    case 22:
      v5 = @"ENTER_FERRY";
      break;
    case 23:
      v5 = @"EXIT_FERRY";
      break;
    case 24:
      v5 = @"CHANGE_FERRY";
      break;
    case 25:
      v5 = @"START_ROUTE_WITH_U_TURN";
      break;
    case 26:
      v5 = @"U_TURN_AT_ROUNDABOUT";
      break;
    case 27:
      v5 = @"LEFT_TURN_AT_END";
      break;
    case 28:
      v5 = @"RIGHT_TURN_AT_END";
      break;
    case 29:
      v5 = @"HIGHWAY_OFF_RAMP_LEFT";
      break;
    case 30:
      v5 = @"HIGHWAY_OFF_RAMP_RIGHT";
      break;
    case 33:
      v5 = @"ARRIVE_AT_DESTINATION_LEFT";
      break;
    case 34:
      v5 = @"ARRIVE_AT_DESTINATION_RIGHT";
      break;
    case 35:
      v5 = @"U_TURN_WHEN_POSSIBLE";
      break;
    case 39:
      v5 = @"ARRIVE_END_OF_DIRECTIONS";
      break;
    case 41:
      v5 = @"ROUNDABOUT_EXIT_1";
      break;
    case 42:
      v5 = @"ROUNDABOUT_EXIT_2";
      break;
    case 43:
      v5 = @"ROUNDABOUT_EXIT_3";
      break;
    case 44:
      v5 = @"ROUNDABOUT_EXIT_4";
      break;
    case 45:
      v5 = @"ROUNDABOUT_EXIT_5";
      break;
    case 46:
      v5 = @"ROUNDABOUT_EXIT_6";
      break;
    case 47:
      v5 = @"ROUNDABOUT_EXIT_7";
      break;
    case 48:
      v5 = @"ROUNDABOUT_EXIT_8";
      break;
    case 49:
      v5 = @"ROUNDABOUT_EXIT_9";
      break;
    case 50:
      v5 = @"ROUNDABOUT_EXIT_10";
      break;
    case 51:
      v5 = @"ROUNDABOUT_EXIT_11";
      break;
    case 52:
      v5 = @"ROUNDABOUT_EXIT_12";
      break;
    case 53:
      v5 = @"ROUNDABOUT_EXIT_13";
      break;
    case 54:
      v5 = @"ROUNDABOUT_EXIT_14";
      break;
    case 55:
      v5 = @"ROUNDABOUT_EXIT_15";
      break;
    case 56:
      v5 = @"ROUNDABOUT_EXIT_16";
      break;
    case 57:
      v5 = @"ROUNDABOUT_EXIT_17";
      break;
    case 58:
      v5 = @"ROUNDABOUT_EXIT_18";
      break;
    case 59:
      v5 = @"ROUNDABOUT_EXIT_19";
      break;
    case 60:
      v5 = @"SHARP_LEFT_TURN";
      break;
    case 61:
      v5 = @"SHARP_RIGHT_TURN";
      break;
    case 62:
      v5 = @"SLIGHT_LEFT_TURN";
      break;
    case 63:
      v5 = @"SLIGHT_RIGHT_TURN";
      break;
    case 64:
      v5 = @"CHANGE_HIGHWAY";
      break;
    case 65:
      v5 = @"CHANGE_HIGHWAY_LEFT";
      break;
    case 66:
      v5 = @"CHANGE_HIGHWAY_RIGHT";
      break;
    case 80:
      v5 = @"TOLL_STATION";
      break;
    case 81:
      v5 = @"ENTER_TUNNEL";
      break;
    case 82:
      v5 = @"WAYPOINT_STOP";
      break;
    case 83:
      v5 = @"WAYPOINT_STOP_LEFT";
      break;
    case 84:
      v5 = @"WAYPOINT_STOP_RIGHT";
      break;
    case 85:
      v5 = @"RESUME_ROUTE";
      break;
    case 86:
      v5 = @"RESUME_ROUTE_WITH_U_TURN";
      break;
    case 87:
      v5 = @"CUSTOM";
      break;
    case 88:
      v5 = @"TURN_AROUND";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  v6 = [(__CFString *)v5 capitalizedString];
  v7 = [v6 stringByReplacingOccurrencesOfString:@"_" withString:&stru_1F0E08010];

  id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
  v9 = [NSString stringWithFormat:@"(%@)", v7];
  v10 = (void *)[v8 initWithString:v9];

  return v10;
}

- (id)debugDescription
{
  objc_super v3 = NSString;
  uint64_t eventType = self->_eventType;
  if (eventType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E60FB1B8[eventType];
  }
  v6 = [v3 stringWithFormat:@"ar event: %@\n\tinstruction: %@", v5, self->_instructionString];

  if (self->_arrowLabel)
  {
    uint64_t v7 = [v6 stringByAppendingFormat:@"\n\tarrowLabel: %@", self->_arrowLabel];

    v6 = (void *)v7;
  }
  id v8 = @"LEFT_TURN";
  switch(self->_maneuverType)
  {
    case 0:
      goto LABEL_70;
    case 1:
      goto LABEL_69;
    case 2:
      id v8 = @"RIGHT_TURN";
      goto LABEL_69;
    case 3:
      id v8 = @"STRAIGHT_AHEAD";
      goto LABEL_69;
    case 4:
      id v8 = @"U_TURN";
      goto LABEL_69;
    case 5:
      id v8 = @"FOLLOW_ROAD";
      goto LABEL_69;
    case 6:
      id v8 = @"ENTER_ROUNDABOUT";
      goto LABEL_69;
    case 7:
      id v8 = @"EXIT_ROUNDABOUT";
      goto LABEL_69;
    case 0xB:
      id v8 = @"OFF_RAMP";
      goto LABEL_69;
    case 0xC:
      id v8 = @"ON_RAMP";
      goto LABEL_69;
    case 0x10:
      id v8 = @"ARRIVE_END_OF_NAVIGATION";
      goto LABEL_69;
    case 0x11:
      id v8 = @"START_ROUTE";
      goto LABEL_69;
    case 0x12:
      id v8 = @"ARRIVE_AT_DESTINATION";
      goto LABEL_69;
    case 0x14:
      id v8 = @"KEEP_LEFT";
      goto LABEL_69;
    case 0x15:
      id v8 = @"KEEP_RIGHT";
      goto LABEL_69;
    case 0x16:
      id v8 = @"ENTER_FERRY";
      goto LABEL_69;
    case 0x17:
      id v8 = @"EXIT_FERRY";
      goto LABEL_69;
    case 0x18:
      id v8 = @"CHANGE_FERRY";
      goto LABEL_69;
    case 0x19:
      id v8 = @"START_ROUTE_WITH_U_TURN";
      goto LABEL_69;
    case 0x1A:
      id v8 = @"U_TURN_AT_ROUNDABOUT";
      goto LABEL_69;
    case 0x1B:
      id v8 = @"LEFT_TURN_AT_END";
      goto LABEL_69;
    case 0x1C:
      id v8 = @"RIGHT_TURN_AT_END";
      goto LABEL_69;
    case 0x1D:
      id v8 = @"HIGHWAY_OFF_RAMP_LEFT";
      goto LABEL_69;
    case 0x1E:
      id v8 = @"HIGHWAY_OFF_RAMP_RIGHT";
      goto LABEL_69;
    case 0x21:
      id v8 = @"ARRIVE_AT_DESTINATION_LEFT";
      goto LABEL_69;
    case 0x22:
      id v8 = @"ARRIVE_AT_DESTINATION_RIGHT";
      goto LABEL_69;
    case 0x23:
      id v8 = @"U_TURN_WHEN_POSSIBLE";
      goto LABEL_69;
    case 0x27:
      id v8 = @"ARRIVE_END_OF_DIRECTIONS";
      goto LABEL_69;
    case 0x29:
      id v8 = @"ROUNDABOUT_EXIT_1";
      goto LABEL_69;
    case 0x2A:
      id v8 = @"ROUNDABOUT_EXIT_2";
      goto LABEL_69;
    case 0x2B:
      id v8 = @"ROUNDABOUT_EXIT_3";
      goto LABEL_69;
    case 0x2C:
      id v8 = @"ROUNDABOUT_EXIT_4";
      goto LABEL_69;
    case 0x2D:
      id v8 = @"ROUNDABOUT_EXIT_5";
      goto LABEL_69;
    case 0x2E:
      id v8 = @"ROUNDABOUT_EXIT_6";
      goto LABEL_69;
    case 0x2F:
      id v8 = @"ROUNDABOUT_EXIT_7";
      goto LABEL_69;
    case 0x30:
      id v8 = @"ROUNDABOUT_EXIT_8";
      goto LABEL_69;
    case 0x31:
      id v8 = @"ROUNDABOUT_EXIT_9";
      goto LABEL_69;
    case 0x32:
      id v8 = @"ROUNDABOUT_EXIT_10";
      goto LABEL_69;
    case 0x33:
      id v8 = @"ROUNDABOUT_EXIT_11";
      goto LABEL_69;
    case 0x34:
      id v8 = @"ROUNDABOUT_EXIT_12";
      goto LABEL_69;
    case 0x35:
      id v8 = @"ROUNDABOUT_EXIT_13";
      goto LABEL_69;
    case 0x36:
      id v8 = @"ROUNDABOUT_EXIT_14";
      goto LABEL_69;
    case 0x37:
      id v8 = @"ROUNDABOUT_EXIT_15";
      goto LABEL_69;
    case 0x38:
      id v8 = @"ROUNDABOUT_EXIT_16";
      goto LABEL_69;
    case 0x39:
      id v8 = @"ROUNDABOUT_EXIT_17";
      goto LABEL_69;
    case 0x3A:
      id v8 = @"ROUNDABOUT_EXIT_18";
      goto LABEL_69;
    case 0x3B:
      id v8 = @"ROUNDABOUT_EXIT_19";
      goto LABEL_69;
    case 0x3C:
      id v8 = @"SHARP_LEFT_TURN";
      goto LABEL_69;
    case 0x3D:
      id v8 = @"SHARP_RIGHT_TURN";
      goto LABEL_69;
    case 0x3E:
      id v8 = @"SLIGHT_LEFT_TURN";
      goto LABEL_69;
    case 0x3F:
      id v8 = @"SLIGHT_RIGHT_TURN";
      goto LABEL_69;
    case 0x40:
      id v8 = @"CHANGE_HIGHWAY";
      goto LABEL_69;
    case 0x41:
      id v8 = @"CHANGE_HIGHWAY_LEFT";
      goto LABEL_69;
    case 0x42:
      id v8 = @"CHANGE_HIGHWAY_RIGHT";
      goto LABEL_69;
    case 0x50:
      id v8 = @"TOLL_STATION";
      goto LABEL_69;
    case 0x51:
      id v8 = @"ENTER_TUNNEL";
      goto LABEL_69;
    case 0x52:
      id v8 = @"WAYPOINT_STOP";
      goto LABEL_69;
    case 0x53:
      id v8 = @"WAYPOINT_STOP_LEFT";
      goto LABEL_69;
    case 0x54:
      id v8 = @"WAYPOINT_STOP_RIGHT";
      goto LABEL_69;
    case 0x55:
      id v8 = @"RESUME_ROUTE";
      goto LABEL_69;
    case 0x56:
      id v8 = @"RESUME_ROUTE_WITH_U_TURN";
      goto LABEL_69;
    case 0x57:
      id v8 = @"CUSTOM";
      goto LABEL_69;
    case 0x58:
      id v8 = @"TURN_AROUND";
      goto LABEL_69;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_maneuverType);
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_69:
      uint64_t v9 = [v6 stringByAppendingFormat:@"\n\tmaneuverType: %@", v8];

      v6 = (void *)v9;
LABEL_70:
      double longitude = self->_locationCoordinate.longitude;
      if (longitude >= -180.0 && longitude <= 180.0)
      {
        double latitude = self->_locationCoordinate.latitude;
        if (latitude >= -90.0 && latitude <= 90.0)
        {
          uint64_t v12 = [v6 stringByAppendingFormat:@"\n\tlocationCoordinate: %f, %f, %f", *(void *)&latitude, *(void *)&self->_locationCoordinate.longitude, *(void *)&self->_locationCoordinate.altitude];

          v6 = (void *)v12;
        }
      }
      if (self->_heading != -1.0)
      {
        uint64_t v13 = objc_msgSend(v6, "stringByAppendingFormat:", @"\n\theading: %.2lf", *(void *)&self->_heading);

        v6 = (void *)v13;
      }
      if (GEOPolylineCoordinateRangeIsValid())
      {
        v14 = GEOPolylineCoordinateRangeAsString();
        uint64_t v15 = [v6 stringByAppendingFormat:@"\n\tlocationCoordinateRange %@", v14];

        v6 = (void *)v15;
      }
      return v6;
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  v5 = (MNGuidanceARInfo *)a3;
  if (v5 == self)
  {
    BOOL v7 = 1;
    goto LABEL_15;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    id v8 = v5;
    uint64_t v9 = [(MNGuidanceARInfo *)self guidanceEventID];
    v10 = [(MNGuidanceARInfo *)v8 guidanceEventID];
    if (![v9 isEqual:v10]
      || (int v11 = [(MNGuidanceARInfo *)self eventType], v11 != [(MNGuidanceARInfo *)v8 eventType])
      || (int v12 = [(MNGuidanceARInfo *)self maneuverType],
          v12 != [(MNGuidanceARInfo *)v8 maneuverType]))
    {
      BOOL v7 = 0;
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v13 = [(MNGuidanceARInfo *)self instruction];
    v14 = [(MNGuidanceARInfo *)v8 instruction];
    unint64_t v15 = v13;
    unint64_t v16 = v14;
    id v17 = (void *)v16;
    if (!(v15 | v16))
    {
LABEL_9:
      v96 = v17;
      id v18 = [(MNGuidanceARInfo *)self arrowLabel];
      if (v18
        || ([(MNGuidanceARInfo *)v8 arrowLabel], (v102 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v3 = [(MNGuidanceARInfo *)self arrowLabel];
        id v17 = [(MNGuidanceARInfo *)v8 arrowLabel];
        if (![(id)v3 isEqual:v17])
        {
          BOOL v7 = 0;
          goto LABEL_61;
        }
        int v19 = 1;
      }
      else
      {
        int v19 = 0;
        v102 = 0;
      }
      [(MNGuidanceARInfo *)self locationCoordinate];
      double v51 = v50;
      double v53 = v52;
      double v55 = v54;
      [(MNGuidanceARInfo *)v8 locationCoordinate];
      if (vabdd_f64(v51, v58) >= 0.000000999999997 || vabdd_f64(v53, v56) >= 0.000000999999997)
      {
        BOOL v7 = 0;
        if ((v19 & 1) == 0)
        {
LABEL_62:
          id v17 = v96;
          if (!v18) {

          }
          goto LABEL_114;
        }
      }
      else if (vabdd_f64(v55, v57) < 0.000000999999997 {
             && ([(MNGuidanceARInfo *)self locationCoordinateRange],
      }
                 [(MNGuidanceARInfo *)v8 locationCoordinateRange],
                 GEOPolylineCoordinateRangeEqual()))
      {
        BOOL v7 = [(MNGuidanceARInfo *)self _isInstructionStringOutputEqual:v8];
        if ((v19 & 1) == 0) {
          goto LABEL_62;
        }
      }
      else
      {
        BOOL v7 = 0;
        if (!v19) {
          goto LABEL_62;
        }
      }
LABEL_61:

      goto LABEL_62;
    }
    if (v16) {
      BOOL v21 = 0;
    }
    else {
      BOOL v21 = v15 != 0;
    }
    if (v16) {
      BOOL v22 = v15 == 0;
    }
    else {
      BOOL v22 = 0;
    }
    if (v22 || v21) {
      goto LABEL_112;
    }
    id v23 = [(id)v15 formatStrings];
    id v24 = [v17 formatStrings];
    unint64_t v25 = v23;
    unint64_t v26 = v24;
    v27 = (void *)v26;
    if (v25 | v26)
    {
      if (v26) {
        BOOL v39 = 0;
      }
      else {
        BOOL v39 = v25 != 0;
      }
      if (v26) {
        BOOL v40 = v25 == 0;
      }
      else {
        BOOL v40 = 0;
      }
      if (v40 || v39 || (uint64_t v41 = [(id)v25 count], v41 != objc_msgSend(v27, "count")))
      {

LABEL_111:
LABEL_112:

        goto LABEL_113;
      }
      v102 = v27;
      v97 = v17;
      unint64_t v82 = v15;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      unint64_t v87 = v25;
      id obja = (id)v25;
      uint64_t v42 = [obja countByEnumeratingWithState:&v103 objects:v107 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = 0;
        uint64_t v101 = *(void *)v104;
        while (2)
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v104 != v101) {
              objc_enumerationMutation(obja);
            }
            unint64_t v46 = *(void *)(*((void *)&v103 + 1) + 8 * i);
            uint64_t v47 = [v102 objectAtIndexedSubscript:v44 + i];
            if (v46 | v47)
            {
              v48 = (void *)v47;
              int v49 = [(id)v46 isEqual:v47];

              if (!v49)
              {

                v27 = v102;
                unint64_t v15 = v82;
                id v17 = v97;
                unint64_t v25 = v87;
                goto LABEL_111;
              }
            }
          }
          uint64_t v43 = [obja countByEnumeratingWithState:&v103 objects:v107 count:16];
          v44 += i;
          if (v43) {
            continue;
          }
          break;
        }
      }

      unint64_t v15 = v82;
      id v17 = v97;
      unint64_t v25 = v87;
    }
    else
    {
      v102 = (void *)v26;
    }
    uint64_t v28 = [(id)v15 separators];
    v29 = [v17 separators];
    unint64_t v30 = v28;
    unint64_t v31 = v29;
    id v32 = (void *)v31;
    if (v30 | v31)
    {
      if (v31) {
        BOOL v59 = 0;
      }
      else {
        BOOL v59 = v30 != 0;
      }
      if (v31) {
        BOOL v60 = v30 == 0;
      }
      else {
        BOOL v60 = 0;
      }
      if (v60
        || v59
        || (v89 = (void *)v30,
            uint64_t v61 = [(id)v30 count],
            BOOL v22 = v61 == [v32 count],
            unint64_t v30 = (unint64_t)v89,
            !v22))
      {

        v70 = v32;
LABEL_88:
        v27 = v102;
LABEL_110:

        goto LABEL_111;
      }
      v98 = v17;
      v100 = v32;
      unint64_t v88 = v25;
      unint64_t v83 = v15;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      id v90 = v89;
      uint64_t v62 = [v90 countByEnumeratingWithState:&v103 objects:v107 count:16];
      if (v62)
      {
        uint64_t v63 = v62;
        uint64_t v64 = 0;
        id objb = *(id *)v104;
        while (2)
        {
          for (uint64_t j = 0; j != v63; ++j)
          {
            if (*(id *)v104 != objb) {
              objc_enumerationMutation(v90);
            }
            unint64_t v66 = *(void *)(*((void *)&v103 + 1) + 8 * j);
            uint64_t v67 = [v100 objectAtIndexedSubscript:v64 + j];
            if (v66 | v67)
            {
              v68 = (void *)v67;
              int v69 = [(id)v66 isEqual:v67];

              if (!v69)
              {

                v70 = v100;
                unint64_t v15 = v83;
                id v17 = v98;
                unint64_t v25 = v88;
                unint64_t v30 = (unint64_t)v89;
                goto LABEL_88;
              }
            }
          }
          uint64_t v63 = [v90 countByEnumeratingWithState:&v103 objects:v107 count:16];
          v64 += j;
          if (v63) {
            continue;
          }
          break;
        }
      }

      unint64_t v15 = v83;
      id v17 = v98;
      unint64_t v25 = v88;
    }
    else
    {
      v100 = (void *)v31;
      v89 = (void *)v30;
    }
    v33 = [(id)v15 formatTokens];
    v34 = [v17 formatTokens];
    unint64_t v35 = v33;
    unint64_t v36 = v34;
    obuint64_t j = (id)v36;
    if (!(v35 | v36))
    {
      v86 = (void *)v25;
LABEL_30:
      uint64_t v3 = [(id)v15 alternativeString];
      uint64_t v37 = [v17 alternativeString];
      v38 = v17;
      if (!(v3 | v37))
      {

        goto LABEL_9;
      }
      v80 = (void *)v37;
      char v92 = [(id)v3 isEqual:v37];

      id v17 = v38;
      if (v92) {
        goto LABEL_9;
      }
LABEL_113:
      BOOL v7 = 0;
LABEL_114:

      goto LABEL_14;
    }
    if (v36) {
      BOOL v71 = 0;
    }
    else {
      BOOL v71 = v35 != 0;
    }
    if (v36) {
      BOOL v72 = v35 == 0;
    }
    else {
      BOOL v72 = 0;
    }
    v27 = v102;
    if (!v72 && !v71)
    {
      v81 = (void *)v35;
      uint64_t v73 = [(id)v35 count];
      BOOL v22 = v73 == [obj count];
      unint64_t v35 = (unint64_t)v81;
      if (v22)
      {
        v86 = (void *)v25;
        v99 = v17;
        unint64_t v84 = v15;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        id v85 = v81;
        uint64_t v74 = [v85 countByEnumeratingWithState:&v103 objects:v107 count:16];
        if (v74)
        {
          uint64_t v75 = v74;
          uint64_t v76 = 0;
          id v91 = *(id *)v104;
          while (2)
          {
            for (uint64_t k = 0; k != v75; ++k)
            {
              if (*(id *)v104 != v91) {
                objc_enumerationMutation(v85);
              }
              v78 = [obj objectAtIndexedSubscript:v76 + k];
              int v79 = GEOServerFormatTokenEqual();

              if (!v79)
              {

                unint64_t v15 = v84;
                id v17 = v99;
                unint64_t v25 = (unint64_t)v86;
                v27 = v102;
                goto LABEL_109;
              }
            }
            uint64_t v75 = [v85 countByEnumeratingWithState:&v103 objects:v107 count:16];
            v76 += k;
            if (v75) {
              continue;
            }
            break;
          }
        }

        unint64_t v35 = (unint64_t)v81;
        unint64_t v15 = v84;
        id v17 = v99;
        goto LABEL_30;
      }
    }

LABEL_109:
    unint64_t v30 = (unint64_t)v89;
    v70 = v100;
    goto LABEL_110;
  }
  BOOL v7 = 0;
LABEL_15:

  return v7;
}

- (BOOL)_isInstructionStringOutputEqual:(id)a3
{
  id v4 = a3;
  v5 = [(MNGuidanceARInfo *)self instructionString];
  if (v5)
  {
  }
  else
  {
    uint64_t v6 = [v4 instructionString];

    if (!v6)
    {
      char v15 = 1;
      goto LABEL_5;
    }
  }
  BOOL v7 = [(MNGuidanceARInfo *)self instructionString];
  id v8 = [v7 defaultOptions];

  [v8 setShouldUpdateFormatStrings:1];
  uint64_t v9 = [(MNGuidanceARInfo *)self instructionString];
  v10 = [v9 composedStringWithOptions:v8];

  int v11 = [v4 instructionString];
  int v12 = [v11 defaultOptions];

  [v12 setShouldUpdateFormatStrings:1];
  uint64_t v13 = [v4 instructionString];
  v14 = [v13 composedStringWithOptions:v12];

  char v15 = [v10 isEqual:v14];
LABEL_5:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3 = [(MNGuidanceARInfo *)self guidanceEventID];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = 31 * (31 * v4 + [(MNGuidanceARInfo *)self eventType]);
  uint64_t v6 = v5 + [(MNGuidanceARInfo *)self maneuverType];
  BOOL v7 = [(MNGuidanceARInfo *)self instructionString];
  uint64_t v8 = [v7 hash] - v6 + 32 * v6;

  uint64_t v9 = [(MNGuidanceARInfo *)self instruction];
  uint64_t v10 = [v9 hash] - v8 + 32 * v8;

  int v11 = [(MNGuidanceARInfo *)self arrowLabel];
  uint64_t v12 = [v11 hash] - v10 + 32 * v10;

  [(MNGuidanceARInfo *)self locationCoordinate];
  unint64_t v14 = (unint64_t)(v13 * 1000000.0) - v12 + 32 * v12;
  [(MNGuidanceARInfo *)self locationCoordinate];
  unint64_t v16 = (unint64_t)(v15 * 1000000.0) - v14 + 32 * v14;
  [(MNGuidanceARInfo *)self locationCoordinate];
  unint64_t v18 = 31 * ((unint64_t)(v17 * 1000000.0) - v16 + 32 * v16)
      + [(MNGuidanceARInfo *)self locationCoordinateRange];
  unint64_t v19 = 31
      * ((unint64_t)(COERCE_FLOAT((unint64_t)[(MNGuidanceARInfo *)self locationCoordinateRange] >> 32)* 1000000.0)- v18+ 32 * v18);
  [(MNGuidanceARInfo *)self locationCoordinateRange];
  unint64_t v21 = v19 + v20;
  [(MNGuidanceARInfo *)self locationCoordinateRange];
  return (unint64_t)(v22 * 1000000.0) - v21 + 32 * v21 + 0x52DC8CFCE1DDC99FLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNGuidanceARInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)MNGuidanceARInfo;
  uint64_t v5 = [(MNGuidanceARInfo *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_guidanceEventID"];
    guidanceEventID = v5->_guidanceEventID;
    v5->_guidanceEventID = (NSUUID *)v6;

    v5->_uint64_t eventType = [v4 decodeIntegerForKey:@"_eventType"];
    v5->_maneuverType = [v4 decodeIntegerForKey:@"_maneuverType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_instructionString"];
    instructionString = v5->_instructionString;
    v5->_instructionString = (GEOComposedString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_instruction"];
    instruction = v5->_instruction;
    v5->_instruction = (GEOServerFormattedString *)v10;

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    double v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"_variableOverrides"];
    variableOverrides = v5->_variableOverrides;
    v5->_variableOverrides = (NSDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_arrowLabel"];
    arrowLabel = v5->_arrowLabel;
    v5->_arrowLabel = (NSString *)v18;

    unint64_t v30 = 0;
    id v20 = v4;
    unint64_t v21 = (const void *)[v20 decodeBytesForKey:@"_locationCoordinate" returnedLength:&v30];
    if (v30 && v21)
    {
      if (v30 >= 0x18) {
        size_t v22 = 24;
      }
      else {
        size_t v22 = v30;
      }
      memcpy(&v5->_locationCoordinate, v21, v22);
    }
    unint64_t v30 = 0;
    id v23 = v20;
    id v24 = (const void *)[v23 decodeBytesForKey:@"_locationCoordinateRange" returnedLength:&v30];
    if (v30 && v24)
    {
      if (v30 >= 0x10) {
        size_t v25 = 16;
      }
      else {
        size_t v25 = v30;
      }
      memcpy(&v5->_locationCoordinateRange, v24, v25);
    }
    uint64_t v26 = [v23 decodeObjectOfClass:objc_opt_class() forKey:@"_maneuverRoadName"];
    maneuverRoadName = v5->_maneuverRoadName;
    v5->_maneuverRoadName = (NSString *)v26;

    [v23 decodeDoubleForKey:@"_heading"];
    v5->_heading = v28;
    v5->_stepIndex = [v23 decodeIntegerForKey:@"_stepIndex"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  guidanceEventID = self->_guidanceEventID;
  id v5 = a3;
  [v5 encodeObject:guidanceEventID forKey:@"_guidanceEventID"];
  [v5 encodeInteger:self->_eventType forKey:@"_eventType"];
  [v5 encodeInteger:self->_maneuverType forKey:@"_maneuverType"];
  [v5 encodeObject:self->_instructionString forKey:@"_instructionString"];
  [v5 encodeObject:self->_instruction forKey:@"_instruction"];
  [v5 encodeObject:self->_variableOverrides forKey:@"_variableOverrides"];
  [v5 encodeObject:self->_arrowLabel forKey:@"_arrowLabel"];
  [v5 encodeBytes:&self->_locationCoordinate length:24 forKey:@"_locationCoordinate"];
  [v5 encodeBytes:&self->_locationCoordinateRange length:16 forKey:@"_locationCoordinateRange"];
  [v5 encodeObject:self->_maneuverRoadName forKey:@"_maneuverRoadName"];
  [v5 encodeDouble:@"_heading" forKey:self->_heading];
  [v5 encodeInteger:self->_stepIndex forKey:@"_stepIndex"];
}

- (NSUUID)guidanceEventID
{
  return self->_guidanceEventID;
}

- (int)eventType
{
  return self->_eventType;
}

- (int)maneuverType
{
  return self->_maneuverType;
}

- (GEOComposedString)instructionString
{
  return self->_instructionString;
}

- (void)setInstructionString:(id)a3
{
}

- (GEOServerFormattedString)instruction
{
  return self->_instruction;
}

- (NSDictionary)variableOverrides
{
  return self->_variableOverrides;
}

- (NSString)arrowLabel
{
  return self->_arrowLabel;
}

- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinate
{
  double latitude = self->_locationCoordinate.latitude;
  double longitude = self->_locationCoordinate.longitude;
  double altitude = self->_locationCoordinate.altitude;
  result.double var2 = altitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (GEOPolylineCoordinateRange)locationCoordinateRange
{
  PolylineCoordinate end = self->_locationCoordinateRange.end;
  PolylineCoordinate start = self->_locationCoordinateRange.start;
  result.PolylineCoordinate end = end;
  result.PolylineCoordinate start = start;
  return result;
}

- (NSString)maneuverRoadName
{
  return self->_maneuverRoadName;
}

- (double)heading
{
  return self->_heading;
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maneuverRoadName, 0);
  objc_storeStrong((id *)&self->_arrowLabel, 0);
  objc_storeStrong((id *)&self->_variableOverrides, 0);
  objc_storeStrong((id *)&self->_instruction, 0);
  objc_storeStrong((id *)&self->_instructionString, 0);
  objc_storeStrong((id *)&self->_guidanceEventID, 0);
}

@end