@interface ALCMWorkoutEventDeprecated
- (BOOL)hasSessionId;
- (BOOL)hasWorkoutType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)sessionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)workoutEventAsString:(int)a3;
- (id)workoutTypeAsString:(int)a3;
- (int)StringAsWorkoutEvent:(id)a3;
- (int)StringAsWorkoutType:(id)a3;
- (int)workoutEvent;
- (int)workoutType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasWorkoutType:(BOOL)a3;
- (void)setSessionId:(id)a3;
- (void)setWorkoutEvent:(int)a3;
- (void)setWorkoutType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMWorkoutEventDeprecated

- (void)dealloc
{
  [(ALCMWorkoutEventDeprecated *)self setSessionId:0];
  v3.receiver = self;
  v3.super_class = (Class)ALCMWorkoutEventDeprecated;
  [(ALCMWorkoutEventDeprecated *)&v3 dealloc];
}

- (id)workoutEventAsString:(int)a3
{
  if (a3 >= 6) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_102311850[a3];
  }
}

- (int)StringAsWorkoutEvent:(id)a3
{
  if ([a3 isEqualToString:@"kDidStart"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kDidStop"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kWillPause"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"kWillResume"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"kSuggestedStart"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"kSuggestedStop"]) {
    return 5;
  }
  return 0;
}

- (int)workoutType
{
  if (*(unsigned char *)&self->_has) {
    return self->_workoutType;
  }
  else {
    return 0;
  }
}

- (void)setWorkoutType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_workoutType = a3;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWorkoutType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)workoutTypeAsString:(int)a3
{
  if (a3 > 2023)
  {
    if (a3 <= 11804)
    {
      if (a3 <= 2070)
      {
        if (a3 > 2060)
        {
          if (a3 == 2061) {
            return @"kTypeCrossTraining";
          }
          if (a3 == 2065) {
            return @"kTypeStairClimbing";
          }
        }
        else
        {
          if (a3 == 2024) {
            return @"kTypeCoreTraining";
          }
          if (a3 == 2048) {
            return @"kTypeElliptical";
          }
        }
      }
      else if (a3 <= 2104)
      {
        if (a3 == 2071) {
          return @"kTypeRowing";
        }
        if (a3 == 2101) {
          return @"kTypeCoolDown";
        }
      }
      else
      {
        switch(a3)
        {
          case 2105:
            return @"kTypePilates";
          case 2150:
            return @"kTypeYoga";
          case 3015:
            return @"kTypeDancing";
        }
      }
    }
    else if (a3 > 17149)
    {
      if (a3 <= 18239)
      {
        if (a3 == 17150) {
          return @"kTypeIndoorWalking";
        }
        if (a3 == 18200) {
          return @"kTypeScubaDiving";
        }
      }
      else
      {
        switch(a3)
        {
          case 18240:
            return @"kTypeSwimming";
          case 19150:
            return @"kTypeSummer";
          case 90603:
            return @"kTypeOutdoorWheelchair";
        }
      }
    }
    else if (a3 <= 15109)
    {
      if (a3 == 11805) {
        return @"kTypePushingWheelchair";
      }
      if (a3 == 12150) {
        return @"kTypeIndoorRunning";
      }
    }
    else
    {
      switch(a3)
      {
        case 15110:
          return @"kTypeKickboxing";
        case 15255:
          return @"kTypeGolfing";
        case 15670:
          return @"kTypeTaiChi";
      }
    }
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  if (a3 > 40)
  {
    if (a3 > 99)
    {
      if (a3 > 2019)
      {
        if (a3 == 2020) {
          return @"kTypeCalisthenics";
        }
        if (a3 == 2022) {
          return @"kTypeFunctionalStrength";
        }
      }
      else
      {
        if (a3 == 100) {
          return @"kTypeCyclingLeg";
        }
        if (a3 == 2010) {
          return @"kTypeStationaryCycling";
        }
      }
    }
    else if (a3 > 55)
    {
      if (a3 == 56) {
        return @"kTypeDrivingOther";
      }
      if (a3 == 63) {
        return @"kTypeMultiSportTransition";
      }
    }
    else
    {
      if (a3 == 41) {
        return @"kTypeWalkingSlow";
      }
      if (a3 == 52) {
        return @"kTypeVehicularInHand";
      }
    }
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  id result = @"kTypeUnknown";
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      id result = @"kTypeFrozen";
      break;
    case 2:
      id result = @"kTypeStatic";
      break;
    case 3:
      id result = @"kTypeMoving";
      break;
    case 4:
      id result = @"kTypeWalking";
      break;
    case 5:
      id result = @"kTypeDriving";
      break;
    case 6:
      id result = @"kTypeCycling";
      break;
    case 7:
      id result = @"kTypeSemiStationary";
      break;
    case 8:
      id result = @"kTypeRunning";
      break;
    case 9:
      id result = @"kTypeMovingCoarse";
      break;
    case 10:
      id result = @"kTypeInVehicleFrozen";
      break;
    case 11:
      id result = @"kTypeInVehicleStatic";
      break;
    default:
      return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  return result;
}

- (int)StringAsWorkoutType:(id)a3
{
  if ([a3 isEqualToString:@"kTypeUnknown"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kTypeFrozen"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kTypeStatic"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"kTypeMoving"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"kTypeWalking"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"kTypeDriving"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"kTypeCycling"]) {
    return 6;
  }
  if ([a3 isEqualToString:@"kTypeSemiStationary"]) {
    return 7;
  }
  if ([a3 isEqualToString:@"kTypeRunning"]) {
    return 8;
  }
  if ([a3 isEqualToString:@"kTypeMovingCoarse"]) {
    return 9;
  }
  if ([a3 isEqualToString:@"kTypeInVehicleFrozen"]) {
    return 10;
  }
  if ([a3 isEqualToString:@"kTypeInVehicleStatic"]) {
    return 11;
  }
  if ([a3 isEqualToString:@"kTypeWalkingSlow"]) {
    return 41;
  }
  if ([a3 isEqualToString:@"kTypeVehicularInHand"]) {
    return 52;
  }
  if ([a3 isEqualToString:@"kTypeDrivingOther"]) {
    return 56;
  }
  if ([a3 isEqualToString:@"kTypeCyclingLeg"]) {
    return 100;
  }
  if ([a3 isEqualToString:@"kTypeStationaryCycling"]) {
    return 2010;
  }
  if ([a3 isEqualToString:@"kTypeCalisthenics"]) {
    return 2020;
  }
  if ([a3 isEqualToString:@"kTypeElliptical"]) {
    return 2048;
  }
  if ([a3 isEqualToString:@"kTypeCrossTraining"]) {
    return 2061;
  }
  if ([a3 isEqualToString:@"kTypeStairClimbing"]) {
    return 2065;
  }
  if ([a3 isEqualToString:@"kTypeRowing"]) {
    return 2071;
  }
  if ([a3 isEqualToString:@"kTypeYoga"]) {
    return 2150;
  }
  if ([a3 isEqualToString:@"kTypeDancing"]) {
    return 3015;
  }
  if ([a3 isEqualToString:@"kTypePushingWheelchair"]) {
    return 11805;
  }
  if ([a3 isEqualToString:@"kTypeIndoorRunning"]) {
    return 12150;
  }
  if ([a3 isEqualToString:@"kTypeGolfing"]) {
    return 15255;
  }
  if ([a3 isEqualToString:@"kTypeIndoorWalking"]) {
    return 17150;
  }
  if ([a3 isEqualToString:@"kTypeSwimming"]) {
    return 18240;
  }
  if ([a3 isEqualToString:@"kTypeSummer"]) {
    return 19150;
  }
  if ([a3 isEqualToString:@"kTypeOutdoorWheelchair"]) {
    return 90603;
  }
  if ([a3 isEqualToString:@"kTypeFunctionalStrength"]) {
    return 2022;
  }
  if ([a3 isEqualToString:@"kTypeCoolDown"]) {
    return 2101;
  }
  if ([a3 isEqualToString:@"kTypeCoreTraining"]) {
    return 2024;
  }
  if ([a3 isEqualToString:@"kTypeTaiChi"]) {
    return 15670;
  }
  if ([a3 isEqualToString:@"kTypePilates"]) {
    return 2105;
  }
  if ([a3 isEqualToString:@"kTypeMultiSportTransition"]) {
    return 63;
  }
  if ([a3 isEqualToString:@"kTypeScubaDiving"]) {
    return 18200;
  }
  if ([a3 isEqualToString:@"kTypeKickboxing"]) {
    return 15110;
  }
  return 0;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCMWorkoutEventDeprecated;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCMWorkoutEventDeprecated *)&v3 description], [(ALCMWorkoutEventDeprecated *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  uint64_t workoutEvent = self->_workoutEvent;
  if (workoutEvent >= 6) {
    v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_workoutEvent];
  }
  else {
    v5 = off_102311850[workoutEvent];
  }
  [v3 setObject:v5 forKey:@"workoutEvent"];
  if (*(unsigned char *)&self->_has)
  {
    int workoutType = self->_workoutType;
    if (workoutType <= 2023)
    {
      if (workoutType <= 40)
      {
        CFStringRef v7 = @"kTypeUnknown";
        switch(workoutType)
        {
          case 0:
            goto LABEL_84;
          case 1:
            CFStringRef v7 = @"kTypeFrozen";
            break;
          case 2:
            CFStringRef v7 = @"kTypeStatic";
            break;
          case 3:
            CFStringRef v7 = @"kTypeMoving";
            break;
          case 4:
            CFStringRef v7 = @"kTypeWalking";
            break;
          case 5:
            CFStringRef v7 = @"kTypeDriving";
            break;
          case 6:
            CFStringRef v7 = @"kTypeCycling";
            break;
          case 7:
            CFStringRef v7 = @"kTypeSemiStationary";
            break;
          case 8:
            CFStringRef v7 = @"kTypeRunning";
            break;
          case 9:
            CFStringRef v7 = @"kTypeMovingCoarse";
            break;
          case 10:
            CFStringRef v7 = @"kTypeInVehicleFrozen";
            break;
          case 11:
            CFStringRef v7 = @"kTypeInVehicleStatic";
            break;
          default:
            goto LABEL_83;
        }
        goto LABEL_84;
      }
      if (workoutType > 99)
      {
        if (workoutType > 2019)
        {
          if (workoutType == 2020)
          {
            CFStringRef v7 = @"kTypeCalisthenics";
            goto LABEL_84;
          }
          if (workoutType == 2022)
          {
            CFStringRef v7 = @"kTypeFunctionalStrength";
            goto LABEL_84;
          }
        }
        else
        {
          if (workoutType == 100)
          {
            CFStringRef v7 = @"kTypeCyclingLeg";
            goto LABEL_84;
          }
          if (workoutType == 2010)
          {
            CFStringRef v7 = @"kTypeStationaryCycling";
            goto LABEL_84;
          }
        }
      }
      else if (workoutType > 55)
      {
        if (workoutType == 56)
        {
          CFStringRef v7 = @"kTypeDrivingOther";
          goto LABEL_84;
        }
        if (workoutType == 63)
        {
          CFStringRef v7 = @"kTypeMultiSportTransition";
          goto LABEL_84;
        }
      }
      else
      {
        if (workoutType == 41)
        {
          CFStringRef v7 = @"kTypeWalkingSlow";
          goto LABEL_84;
        }
        if (workoutType == 52)
        {
          CFStringRef v7 = @"kTypeVehicularInHand";
          goto LABEL_84;
        }
      }
LABEL_83:
      CFStringRef v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_workoutType];
      goto LABEL_84;
    }
    if (workoutType <= 11804)
    {
      if (workoutType <= 2070)
      {
        if (workoutType > 2060)
        {
          if (workoutType == 2061)
          {
            CFStringRef v7 = @"kTypeCrossTraining";
            goto LABEL_84;
          }
          if (workoutType == 2065)
          {
            CFStringRef v7 = @"kTypeStairClimbing";
            goto LABEL_84;
          }
        }
        else
        {
          if (workoutType == 2024)
          {
            CFStringRef v7 = @"kTypeCoreTraining";
            goto LABEL_84;
          }
          if (workoutType == 2048)
          {
            CFStringRef v7 = @"kTypeElliptical";
            goto LABEL_84;
          }
        }
        goto LABEL_83;
      }
      if (workoutType <= 2104)
      {
        if (workoutType == 2071)
        {
          CFStringRef v7 = @"kTypeRowing";
          goto LABEL_84;
        }
        if (workoutType == 2101)
        {
          CFStringRef v7 = @"kTypeCoolDown";
          goto LABEL_84;
        }
        goto LABEL_83;
      }
      if (workoutType == 2105)
      {
        CFStringRef v7 = @"kTypePilates";
        goto LABEL_84;
      }
      if (workoutType == 2150)
      {
        CFStringRef v7 = @"kTypeYoga";
        goto LABEL_84;
      }
      if (workoutType != 3015) {
        goto LABEL_83;
      }
      CFStringRef v7 = @"kTypeDancing";
    }
    else
    {
      if (workoutType > 17149)
      {
        if (workoutType <= 18239)
        {
          if (workoutType == 17150)
          {
            CFStringRef v7 = @"kTypeIndoorWalking";
            goto LABEL_84;
          }
          if (workoutType == 18200)
          {
            CFStringRef v7 = @"kTypeScubaDiving";
            goto LABEL_84;
          }
        }
        else
        {
          switch(workoutType)
          {
            case 18240:
              CFStringRef v7 = @"kTypeSwimming";
              goto LABEL_84;
            case 19150:
              CFStringRef v7 = @"kTypeSummer";
              goto LABEL_84;
            case 90603:
              CFStringRef v7 = @"kTypeOutdoorWheelchair";
              goto LABEL_84;
          }
        }
        goto LABEL_83;
      }
      if (workoutType <= 15109)
      {
        if (workoutType == 11805)
        {
          CFStringRef v7 = @"kTypePushingWheelchair";
          goto LABEL_84;
        }
        if (workoutType == 12150)
        {
          CFStringRef v7 = @"kTypeIndoorRunning";
          goto LABEL_84;
        }
        goto LABEL_83;
      }
      if (workoutType == 15110)
      {
        CFStringRef v7 = @"kTypeKickboxing";
        goto LABEL_84;
      }
      if (workoutType == 15255)
      {
        CFStringRef v7 = @"kTypeGolfing";
        goto LABEL_84;
      }
      if (workoutType != 15670) {
        goto LABEL_83;
      }
      CFStringRef v7 = @"kTypeTaiChi";
    }
LABEL_84:
    [v3 setObject:v7 forKey:@"workoutType"];
  }
  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"sessionId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1010FC984((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_sessionId)
  {
    _PBDataWriterWriteDataField(a3);
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_workoutEvent;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 5) = self->_workoutType;
    *((unsigned char *)a3 + 24) |= 1u;
  }
  sessionId = self->_sessionId;
  if (sessionId) {
    [a3 setSessionId:sessionId];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  *((_DWORD *)v5 + 4) = self->_workoutEvent;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 5) = self->_workoutType;
    *((unsigned char *)v5 + 24) |= 1u;
  }

  v6[1] = [(NSData *)self->_sessionId copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_workoutEvent != *((_DWORD *)a3 + 4))
    {
LABEL_10:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_workoutType != *((_DWORD *)a3 + 5)) {
        goto LABEL_10;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
      goto LABEL_10;
    }
    sessionId = self->_sessionId;
    if ((unint64_t)sessionId | *((void *)a3 + 1))
    {
      LOBYTE(v5) = -[NSData isEqual:](sessionId, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_workoutType;
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = 2654435761 * self->_workoutEvent;
  return v2 ^ (unint64_t)[(NSData *)self->_sessionId hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  self->_uint64_t workoutEvent = *((_DWORD *)a3 + 4);
  if (*((unsigned char *)a3 + 24))
  {
    self->_int workoutType = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 1)) {
    -[ALCMWorkoutEventDeprecated setSessionId:](self, "setSessionId:");
  }
}

- (int)workoutEvent
{
  return self->_workoutEvent;
}

- (void)setWorkoutEvent:(int)a3
{
  self->_uint64_t workoutEvent = a3;
}

- (NSData)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

@end