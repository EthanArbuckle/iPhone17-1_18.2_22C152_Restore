@interface MNGuidanceEventFeedback
+ (BOOL)supportsSecureCoding;
- (MNGuidanceEventFeedback)initWithCoder:(id)a3;
- (MNGuidanceEventFeedback)initWithEvent:(id)a3;
- (NSArray)junctionViewImageIDs;
- (NSData)routeID;
- (NSString)enrouteNoticeIdentifier;
- (NSString)eventDescription;
- (NSUUID)uniqueID;
- (double)endDistance;
- (double)endTime;
- (double)maneuverTime;
- (double)startDistance;
- (double)startTime;
- (double)vehicleSpeed;
- (id)copyWithZone:(_NSZone *)a3;
- (int)trafficCameraType;
- (unint64_t)enrouteNoticeIndex;
- (unint64_t)eventIndex;
- (unint64_t)selectedPrimaryStringIndex;
- (unint64_t)selectedSecondaryStringIndex;
- (unint64_t)stepID;
- (unint64_t)trafficColor;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDistance:(double)a3;
- (void)setEndTime:(double)a3;
- (void)setEnrouteNoticeIdentifier:(id)a3;
- (void)setEnrouteNoticeIndex:(unint64_t)a3;
- (void)setEventDescription:(id)a3;
- (void)setEventIndex:(unint64_t)a3;
- (void)setJunctionViewImageIDs:(id)a3;
- (void)setManeuverTime:(double)a3;
- (void)setRouteID:(id)a3;
- (void)setSelectedPrimaryStringIndex:(unint64_t)a3;
- (void)setSelectedSecondaryStringIndex:(unint64_t)a3;
- (void)setStartDistance:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setStepID:(unint64_t)a3;
- (void)setTrafficCameraType:(int)a3;
- (void)setTrafficColor:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setUniqueID:(id)a3;
- (void)setVehicleSpeed:(double)a3;
@end

@implementation MNGuidanceEventFeedback

- (MNGuidanceEventFeedback)initWithEvent:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MNGuidanceEventFeedback;
  v5 = [(MNGuidanceEventFeedback *)&v17 init];
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = [v4 uniqueID];
  v7 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v6;

  uint64_t v8 = [v4 serverRouteID];
  v9 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v8;

  *((void *)v5 + 6) = 0x7FFFFFFFFFFFFFFFLL;
  int64x2_t v10 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *((int64x2_t *)v5 + 2) = v10;
  *(int64x2_t *)(v5 + 120) = v10;
  uint64_t v11 = [v4 source];
  switch(v11)
  {
    case 3:
      *((void *)v5 + 5) = [v4 enrouteNoticeIndex];
      goto LABEL_7;
    case 2:
LABEL_7:
      *((void *)v5 + 6) = [v4 sourceIndex];
      break;
    case 1:
      *((void *)v5 + 4) = [v4 stepID];
      goto LABEL_7;
  }
  if ([v4 hasSpokenGuidance])
  {
    uint64_t v12 = 2;
  }
  else if ([v4 hasSignGuidance])
  {
    uint64_t v12 = 1;
  }
  else if ([v4 hasJunctionView])
  {
    uint64_t v12 = 4;
  }
  else
  {
    uint64_t v12 = 3;
  }
  *((void *)v5 + 7) = v12;
  uint64_t v13 = [v4 description];
  v14 = (void *)*((void *)v5 + 19);
  *((void *)v5 + 19) = v13;

  v15 = v5;
LABEL_16:

  return (MNGuidanceEventFeedback *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[MNGuidanceEventFeedback allocWithZone:a3] init];
  uint64_t v5 = [(NSUUID *)self->_uniqueID copy];
  uniqueID = v4->_uniqueID;
  v4->_uniqueID = (NSUUID *)v5;

  uint64_t v7 = [(NSData *)self->_routeID copy];
  routeID = v4->_routeID;
  v4->_routeID = (NSData *)v7;

  v4->_stepID = self->_stepID;
  v4->_enrouteNoticeIndex = self->_enrouteNoticeIndex;
  v4->_eventIndex = self->_eventIndex;
  v4->_type = self->_type;
  v4->_startTime = self->_startTime;
  v4->_endTime = self->_endTime;
  v4->_maneuverTime = self->_maneuverTime;
  v4->_startDistance = self->_startDistance;
  v4->_endDistance = self->_endDistance;
  v4->_vehicleSpeed = self->_vehicleSpeed;
  v4->_trafficColor = self->_trafficColor;
  v4->_selectedPrimaryStringIndex = self->_selectedPrimaryStringIndex;
  v4->_selectedSecondaryStringIndex = self->_selectedSecondaryStringIndex;
  uint64_t v9 = [(NSArray *)self->_junctionViewImageIDs copy];
  junctionViewImageIDs = v4->_junctionViewImageIDs;
  v4->_junctionViewImageIDs = (NSArray *)v9;

  uint64_t v11 = [(NSString *)self->_enrouteNoticeIdentifier copy];
  enrouteNoticeIdentifier = v4->_enrouteNoticeIdentifier;
  v4->_enrouteNoticeIdentifier = (NSString *)v11;

  v4->_trafficCameraType = self->_trafficCameraType;
  uint64_t v13 = [(NSString *)self->_eventDescription copy];
  eventDescription = v4->_eventDescription;
  v4->_eventDescription = (NSString *)v13;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNGuidanceEventFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MNGuidanceEventFeedback *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uniqueID"];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeID"];
    routeID = v5->_routeID;
    v5->_routeID = (NSData *)v8;

    v5->_stepID = [v4 decodeIntegerForKey:@"_stepID"];
    v5->_enrouteNoticeIndex = [v4 decodeIntegerForKey:@"_enrouteNoticeIndex"];
    v5->_eventIndex = [v4 decodeIntegerForKey:@"_eventIndex"];
    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    [v4 decodeDoubleForKey:@"_startTime"];
    v5->_startTime = v10;
    [v4 decodeDoubleForKey:@"_endTime"];
    v5->_endTime = v11;
    [v4 decodeDoubleForKey:@"_maneuverTime"];
    v5->_maneuverTime = v12;
    [v4 decodeDoubleForKey:@"_startDistance"];
    v5->_startDistance = v13;
    [v4 decodeDoubleForKey:@"_endDistance"];
    v5->_endDistance = v14;
    [v4 decodeDoubleForKey:@"_vehicleSpeed"];
    v5->_vehicleSpeed = v15;
    v5->_trafficColor = [v4 decodeIntegerForKey:@"_trafficColor"];
    v5->_selectedPrimaryStringIndex = [v4 decodeIntegerForKey:@"_selectedPrimaryStringIndex"];
    v5->_selectedSecondaryStringIndex = [v4 decodeIntegerForKey:@"_selectedSecondaryStringIndex"];
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"_junctionViewImageIDs"];
    junctionViewImageIDs = v5->_junctionViewImageIDs;
    v5->_junctionViewImageIDs = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_enrouteNoticeIdentifier"];
    enrouteNoticeIdentifier = v5->_enrouteNoticeIdentifier;
    v5->_enrouteNoticeIdentifier = (NSString *)v21;

    v5->_trafficCameraType = [v4 decodeIntegerForKey:@"_trafficCameraType"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_eventDescription"];
    eventDescription = v5->_eventDescription;
    v5->_eventDescription = (NSString *)v23;

    v25 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueID = self->_uniqueID;
  id v5 = a3;
  [v5 encodeObject:uniqueID forKey:@"_uniqueID"];
  [v5 encodeObject:self->_routeID forKey:@"_routeID"];
  [v5 encodeInteger:self->_stepID forKey:@"_stepID"];
  [v5 encodeInteger:self->_enrouteNoticeIndex forKey:@"_enrouteNoticeIndex"];
  [v5 encodeInteger:self->_eventIndex forKey:@"_eventIndex"];
  [v5 encodeInteger:self->_type forKey:@"_type"];
  [v5 encodeDouble:@"_startTime" forKey:self->_startTime];
  [v5 encodeDouble:@"_endTime" forKey:self->_endTime];
  [v5 encodeDouble:@"_maneuverTime" forKey:self->_maneuverTime];
  [v5 encodeDouble:@"_startDistance" forKey:self->_startDistance];
  [v5 encodeDouble:@"_endDistance" forKey:self->_endDistance];
  [v5 encodeDouble:@"_vehicleSpeed" forKey:self->_vehicleSpeed];
  [v5 encodeInteger:self->_trafficColor forKey:@"_trafficColor"];
  [v5 encodeInteger:self->_selectedPrimaryStringIndex forKey:@"_selectedPrimaryStringIndex"];
  [v5 encodeInteger:self->_selectedSecondaryStringIndex forKey:@"_selectedSecondaryStringIndex"];
  [v5 encodeObject:self->_junctionViewImageIDs forKey:@"_junctionViewImageIDs"];
  [v5 encodeObject:self->_enrouteNoticeIdentifier forKey:@"_enrouteNoticeIdentifier"];
  [v5 encodeInteger:self->_trafficCameraType forKey:@"_trafficCameraType"];
  [v5 encodeObject:self->_eventDescription forKey:@"_eventDescription"];
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NSData)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
}

- (unint64_t)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unint64_t)a3
{
  self->_stepID = a3;
}

- (unint64_t)enrouteNoticeIndex
{
  return self->_enrouteNoticeIndex;
}

- (void)setEnrouteNoticeIndex:(unint64_t)a3
{
  self->_enrouteNoticeIndex = a3;
}

- (unint64_t)eventIndex
{
  return self->_eventIndex;
}

- (void)setEventIndex:(unint64_t)a3
{
  self->_eventIndex = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (double)maneuverTime
{
  return self->_maneuverTime;
}

- (void)setManeuverTime:(double)a3
{
  self->_maneuverTime = a3;
}

- (double)startDistance
{
  return self->_startDistance;
}

- (void)setStartDistance:(double)a3
{
  self->_startDistance = a3;
}

- (double)endDistance
{
  return self->_endDistance;
}

- (void)setEndDistance:(double)a3
{
  self->_endDistance = a3;
}

- (double)vehicleSpeed
{
  return self->_vehicleSpeed;
}

- (void)setVehicleSpeed:(double)a3
{
  self->_vehicleSpeed = a3;
}

- (unint64_t)trafficColor
{
  return self->_trafficColor;
}

- (void)setTrafficColor:(unint64_t)a3
{
  self->_trafficColor = a3;
}

- (unint64_t)selectedPrimaryStringIndex
{
  return self->_selectedPrimaryStringIndex;
}

- (void)setSelectedPrimaryStringIndex:(unint64_t)a3
{
  self->_selectedPrimaryStringIndex = a3;
}

- (unint64_t)selectedSecondaryStringIndex
{
  return self->_selectedSecondaryStringIndex;
}

- (void)setSelectedSecondaryStringIndex:(unint64_t)a3
{
  self->_selectedSecondaryStringIndex = a3;
}

- (NSArray)junctionViewImageIDs
{
  return self->_junctionViewImageIDs;
}

- (void)setJunctionViewImageIDs:(id)a3
{
}

- (NSString)enrouteNoticeIdentifier
{
  return self->_enrouteNoticeIdentifier;
}

- (void)setEnrouteNoticeIdentifier:(id)a3
{
}

- (int)trafficCameraType
{
  return self->_trafficCameraType;
}

- (void)setTrafficCameraType:(int)a3
{
  self->_trafficCameraType = a3;
}

- (NSString)eventDescription
{
  return self->_eventDescription;
}

- (void)setEventDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDescription, 0);
  objc_storeStrong((id *)&self->_enrouteNoticeIdentifier, 0);
  objc_storeStrong((id *)&self->_junctionViewImageIDs, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end