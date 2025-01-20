@interface ALCMWorkoutEvent
- (BOOL)hasEndTime;
- (BOOL)hasLocationType;
- (BOOL)hasSessionId;
- (BOOL)hasWorkoutType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)sessionId;
- (double)endTime;
- (double)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationTypeAsString:(int)a3;
- (id)workoutEventAsString:(int)a3;
- (id)workoutTypeAsString:(int)a3;
- (int)StringAsLocationType:(id)a3;
- (int)StringAsWorkoutEvent:(id)a3;
- (int)StringAsWorkoutType:(id)a3;
- (int)locationType;
- (int)workoutEvent;
- (int)workoutType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setHasEndTime:(BOOL)a3;
- (void)setHasLocationType:(BOOL)a3;
- (void)setHasWorkoutType:(BOOL)a3;
- (void)setLocationType:(int)a3;
- (void)setSessionId:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setWorkoutEvent:(int)a3;
- (void)setWorkoutType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMWorkoutEvent

- (void)dealloc
{
  [(ALCMWorkoutEvent *)self setSessionId:0];
  v3.receiver = self;
  v3.super_class = (Class)ALCMWorkoutEvent;
  [(ALCMWorkoutEvent *)&v3 dealloc];
}

- (id)workoutEventAsString:(int)a3
{
  if (a3 >= 6) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_102328498 + a3);
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
  if ([a3 isEqualToString:@"kSuggestedStop"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"kPrediction"]) {
    return 5;
  }
  return 0;
}

- (void)setEndTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_endTime = a3;
}

- (void)setHasEndTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)workoutType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_workoutType;
  }
  else {
    return 0;
  }
}

- (void)setWorkoutType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_workoutType = a3;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWorkoutType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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

- (int)locationType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_locationType;
  }
  else {
    return 0;
  }
}

- (void)setLocationType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLocationType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)locationTypeAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_1023284C8 + a3);
  }
}

- (int)StringAsLocationType:(id)a3
{
  if ([a3 isEqualToString:@"kUnknown"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kIndoor"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kOutdoor"]) {
    return 2;
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
  v3.super_class = (Class)ALCMWorkoutEvent;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCMWorkoutEvent *)&v3 description], [(ALCMWorkoutEvent *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  uint64_t workoutEvent = self->_workoutEvent;
  if (workoutEvent >= 6) {
    v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_workoutEvent];
  }
  else {
    v5 = (NSString *)*(&off_102328498 + workoutEvent);
  }
  [v3 setObject:v5 forKey:@"workoutEvent"];
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime)] forKey:@"startTime"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_6;
    }
LABEL_9:
    int workoutType = self->_workoutType;
    if (workoutType > 2023)
    {
      if (workoutType <= 11804)
      {
        if (workoutType <= 2070)
        {
          if (workoutType > 2060)
          {
            if (workoutType == 2061)
            {
              CFStringRef v8 = @"kTypeCrossTraining";
              goto LABEL_88;
            }
            if (workoutType == 2065)
            {
              CFStringRef v8 = @"kTypeStairClimbing";
              goto LABEL_88;
            }
          }
          else
          {
            if (workoutType == 2024)
            {
              CFStringRef v8 = @"kTypeCoreTraining";
              goto LABEL_88;
            }
            if (workoutType == 2048)
            {
              CFStringRef v8 = @"kTypeElliptical";
              goto LABEL_88;
            }
          }
        }
        else if (workoutType <= 2104)
        {
          if (workoutType == 2071)
          {
            CFStringRef v8 = @"kTypeRowing";
            goto LABEL_88;
          }
          if (workoutType == 2101)
          {
            CFStringRef v8 = @"kTypeCoolDown";
            goto LABEL_88;
          }
        }
        else
        {
          switch(workoutType)
          {
            case 2105:
              CFStringRef v8 = @"kTypePilates";
              goto LABEL_88;
            case 2150:
              CFStringRef v8 = @"kTypeYoga";
              goto LABEL_88;
            case 3015:
              CFStringRef v8 = @"kTypeDancing";
              goto LABEL_88;
          }
        }
      }
      else if (workoutType > 17149)
      {
        if (workoutType <= 18239)
        {
          if (workoutType == 17150)
          {
            CFStringRef v8 = @"kTypeIndoorWalking";
            goto LABEL_88;
          }
          if (workoutType == 18200)
          {
            CFStringRef v8 = @"kTypeScubaDiving";
            goto LABEL_88;
          }
        }
        else
        {
          switch(workoutType)
          {
            case 18240:
              CFStringRef v8 = @"kTypeSwimming";
              goto LABEL_88;
            case 19150:
              CFStringRef v8 = @"kTypeSummer";
              goto LABEL_88;
            case 90603:
              CFStringRef v8 = @"kTypeOutdoorWheelchair";
              goto LABEL_88;
          }
        }
      }
      else if (workoutType <= 15109)
      {
        if (workoutType == 11805)
        {
          CFStringRef v8 = @"kTypePushingWheelchair";
          goto LABEL_88;
        }
        if (workoutType == 12150)
        {
          CFStringRef v8 = @"kTypeIndoorRunning";
          goto LABEL_88;
        }
      }
      else
      {
        switch(workoutType)
        {
          case 15110:
            CFStringRef v8 = @"kTypeKickboxing";
            goto LABEL_88;
          case 15255:
            CFStringRef v8 = @"kTypeGolfing";
            goto LABEL_88;
          case 15670:
            CFStringRef v8 = @"kTypeTaiChi";
            goto LABEL_88;
        }
      }
    }
    else
    {
      if (workoutType <= 40)
      {
        CFStringRef v8 = @"kTypeUnknown";
        switch(workoutType)
        {
          case 0:
            break;
          case 1:
            CFStringRef v8 = @"kTypeFrozen";
            break;
          case 2:
            CFStringRef v8 = @"kTypeStatic";
            break;
          case 3:
            CFStringRef v8 = @"kTypeMoving";
            break;
          case 4:
            CFStringRef v8 = @"kTypeWalking";
            break;
          case 5:
            CFStringRef v8 = @"kTypeDriving";
            break;
          case 6:
            CFStringRef v8 = @"kTypeCycling";
            break;
          case 7:
            CFStringRef v8 = @"kTypeSemiStationary";
            break;
          case 8:
            CFStringRef v8 = @"kTypeRunning";
            break;
          case 9:
            CFStringRef v8 = @"kTypeMovingCoarse";
            break;
          case 10:
            CFStringRef v8 = @"kTypeInVehicleFrozen";
            break;
          case 11:
            CFStringRef v8 = @"kTypeInVehicleStatic";
            break;
          default:
            goto LABEL_87;
        }
LABEL_88:
        [v3 setObject:v8 forKey:@"workoutType"];
        if ((*(unsigned char *)&self->_has & 2) == 0) {
          goto LABEL_93;
        }
LABEL_89:
        uint64_t locationType = self->_locationType;
        if (locationType >= 3) {
          v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_locationType];
        }
        else {
          v10 = (NSString *)*(&off_1023284C8 + locationType);
        }
        [v3 setObject:v10 forKey:@"locationType"];
        goto LABEL_93;
      }
      if (workoutType > 99)
      {
        if (workoutType > 2019)
        {
          if (workoutType == 2020)
          {
            CFStringRef v8 = @"kTypeCalisthenics";
            goto LABEL_88;
          }
          if (workoutType == 2022)
          {
            CFStringRef v8 = @"kTypeFunctionalStrength";
            goto LABEL_88;
          }
        }
        else
        {
          if (workoutType == 100)
          {
            CFStringRef v8 = @"kTypeCyclingLeg";
            goto LABEL_88;
          }
          if (workoutType == 2010)
          {
            CFStringRef v8 = @"kTypeStationaryCycling";
            goto LABEL_88;
          }
        }
      }
      else if (workoutType > 55)
      {
        if (workoutType == 56)
        {
          CFStringRef v8 = @"kTypeDrivingOther";
          goto LABEL_88;
        }
        if (workoutType == 63)
        {
          CFStringRef v8 = @"kTypeMultiSportTransition";
          goto LABEL_88;
        }
      }
      else
      {
        if (workoutType == 41)
        {
          CFStringRef v8 = @"kTypeWalkingSlow";
          goto LABEL_88;
        }
        if (workoutType == 52)
        {
          CFStringRef v8 = @"kTypeVehicularInHand";
          goto LABEL_88;
        }
      }
    }
LABEL_87:
    CFStringRef v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_workoutType];
    goto LABEL_88;
  }
  [v3 setObject:[NSNumber numberWithDouble:self->_endTime] forKey:@"endTime"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_6:
  if ((has & 2) != 0) {
    goto LABEL_89;
  }
LABEL_93:
  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"sessionId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10149732C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_sessionId)
  {
    _PBDataWriterWriteDataField(a3);
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 10) = self->_workoutEvent;
  *((void *)a3 + 2) = *(void *)&self->_startTime;
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = *(void *)&self->_endTime;
    *((unsigned char *)a3 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 11) = self->_workoutType;
  *((unsigned char *)a3 + 48) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 6) = self->_locationType;
    *((unsigned char *)a3 + 48) |= 2u;
  }
LABEL_5:
  sessionId = self->_sessionId;
  if (sessionId) {
    [a3 setSessionId:sessionId];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  *((_DWORD *)v5 + 10) = self->_workoutEvent;
  *((void *)v5 + 2) = *(void *)&self->_startTime;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((_DWORD *)v5 + 11) = self->_workoutType;
    *((unsigned char *)v5 + 48) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((void *)v5 + 1) = *(void *)&self->_endTime;
  *((unsigned char *)v5 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 6) = self->_locationType;
    *((unsigned char *)v5 + 48) |= 2u;
  }
LABEL_5:

  v6[4] = [(NSData *)self->_sessionId copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_workoutEvent != *((_DWORD *)a3 + 10) || self->_startTime != *((double *)a3 + 2)) {
      goto LABEL_21;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_endTime != *((double *)a3 + 1)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_workoutType != *((_DWORD *)a3 + 11)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 4) != 0)
    {
      goto LABEL_21;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_locationType != *((_DWORD *)a3 + 6)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 2) != 0)
    {
      goto LABEL_21;
    }
    sessionId = self->_sessionId;
    if ((unint64_t)sessionId | *((void *)a3 + 4))
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
  uint64_t workoutEvent = self->_workoutEvent;
  double startTime = self->_startTime;
  double v5 = -startTime;
  if (startTime >= 0.0) {
    double v5 = self->_startTime;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  double v8 = fmod(v6, 1.84467441e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabs(v7);
  if (v7 < 0.0) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  char has = (char)self->_has;
  if (has)
  {
    double endTime = self->_endTime;
    double v16 = -endTime;
    if (endTime >= 0.0) {
      double v16 = self->_endTime;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 4) != 0)
  {
    uint64_t v19 = 2654435761 * self->_workoutType;
    if ((has & 2) != 0) {
      goto LABEL_18;
    }
LABEL_20:
    uint64_t v20 = 0;
    return v12 ^ (2654435761 * workoutEvent) ^ v14 ^ v19 ^ v20 ^ (unint64_t)[(NSData *)self->_sessionId hash];
  }
  uint64_t v19 = 0;
  if ((has & 2) == 0) {
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v20 = 2654435761 * self->_locationType;
  return v12 ^ (2654435761 * workoutEvent) ^ v14 ^ v19 ^ v20 ^ (unint64_t)[(NSData *)self->_sessionId hash];
}

- (void)mergeFrom:(id)a3
{
  self->_uint64_t workoutEvent = *((_DWORD *)a3 + 10);
  self->_double startTime = *((double *)a3 + 2);
  char v3 = *((unsigned char *)a3 + 48);
  if (v3)
  {
    self->_double endTime = *((double *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 48);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_int workoutType = *((_DWORD *)a3 + 11);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 48) & 2) != 0)
  {
LABEL_4:
    self->_uint64_t locationType = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  if (*((void *)a3 + 4)) {
    -[ALCMWorkoutEvent setSessionId:](self, "setSessionId:");
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

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_double startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (NSData)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

@end