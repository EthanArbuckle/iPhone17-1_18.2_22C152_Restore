@interface ALCLMotionActivity
- (BOOL)hasConfidence;
- (BOOL)hasEstExitTime;
- (BOOL)hasExitState;
- (BOOL)hasIsStanding;
- (BOOL)hasIsVehicleConnected;
- (BOOL)hasMountedConfidence;
- (BOOL)hasMountedState;
- (BOOL)hasStartTime;
- (BOOL)hasTilt;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStanding;
- (BOOL)isVehicleConnected;
- (BOOL)readFrom:(id)a3;
- (double)estExitTime;
- (double)startTime;
- (double)timestamp;
- (float)tilt;
- (id)confidenceAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exitStateAsString:(int)a3;
- (id)mountedConfidenceAsString:(int)a3;
- (id)mountedStateAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsConfidence:(id)a3;
- (int)StringAsExitState:(id)a3;
- (int)StringAsMountedConfidence:(id)a3;
- (int)StringAsMountedState:(id)a3;
- (int)StringAsType:(id)a3;
- (int)confidence;
- (int)exitState;
- (int)mountedConfidence;
- (int)mountedState;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(int)a3;
- (void)setEstExitTime:(double)a3;
- (void)setExitState:(int)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasEstExitTime:(BOOL)a3;
- (void)setHasExitState:(BOOL)a3;
- (void)setHasIsStanding:(BOOL)a3;
- (void)setHasIsVehicleConnected:(BOOL)a3;
- (void)setHasMountedConfidence:(BOOL)a3;
- (void)setHasMountedState:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasTilt:(BOOL)a3;
- (void)setIsStanding:(BOOL)a3;
- (void)setIsVehicleConnected:(BOOL)a3;
- (void)setMountedConfidence:(int)a3;
- (void)setMountedState:(int)a3;
- (void)setStartTime:(double)a3;
- (void)setTilt:(float)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLMotionActivity

- (id)typeAsString:(int)a3
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

- (int)StringAsType:(id)a3
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

- (int)confidence
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_confidence;
  }
  else {
    return 0;
  }
}

- (void)setConfidence:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasConfidence
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)confidenceAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_1022B3A88 + a3);
  }
}

- (int)StringAsConfidence:(id)a3
{
  if ([a3 isEqualToString:@"kConfidenceLow"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kConfidenceMedium"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kConfidenceHigh"]) {
    return 2;
  }
  return 0;
}

- (int)mountedState
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_mountedState;
  }
  else {
    return 0;
  }
}

- (void)setMountedState:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_mountedState = a3;
}

- (void)setHasMountedState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMountedState
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)mountedStateAsString:(int)a3
{
  if (!a3) {
    return @"kNotMounted";
  }
  if (a3 == 1) {
    return @"kMounted";
  }
  return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsMountedState:(id)a3
{
  if ([a3 isEqualToString:@"kNotMounted"]) {
    return 0;
  }
  else {
    return [a3 isEqualToString:@"kMounted"];
  }
}

- (int)mountedConfidence
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_mountedConfidence;
  }
  else {
    return 0;
  }
}

- (void)setMountedConfidence:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_mountedConfidence = a3;
}

- (void)setHasMountedConfidence:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMountedConfidence
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)mountedConfidenceAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_1022B3A88 + a3);
  }
}

- (int)StringAsMountedConfidence:(id)a3
{
  if ([a3 isEqualToString:@"kConfidenceLow"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kConfidenceMedium"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kConfidenceHigh"]) {
    return 2;
  }
  return 0;
}

- (void)setIsStanding:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isStanding = a3;
}

- (void)setHasIsStanding:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsStanding
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTilt:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_tilt = a3;
}

- (void)setHasTilt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTilt
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (int)exitState
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_exitState;
  }
  else {
    return 0;
  }
}

- (void)setExitState:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_exitState = a3;
}

- (void)setHasExitState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasExitState
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)exitStateAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_1022B3AA0 + a3);
  }
}

- (int)StringAsExitState:(id)a3
{
  if ([a3 isEqualToString:@"kNoDetection"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kExitPreheat"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kExitDetected"]) {
    return 2;
  }
  return 0;
}

- (void)setEstExitTime:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_estExitTime = a3;
}

- (void)setHasEstExitTime:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasEstExitTime
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setStartTime:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasStartTime
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setIsVehicleConnected:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isVehicleConnected = a3;
}

- (void)setHasIsVehicleConnected:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsVehicleConnected
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCLMotionActivity;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCLMotionActivity *)&v3 description], [(ALCLMotionActivity *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int type = self->_type;
  if (type > 2023)
  {
    if (type <= 11804)
    {
      if (type <= 2070)
      {
        if (type > 2060)
        {
          if (type == 2061)
          {
            CFStringRef v5 = @"kTypeCrossTraining";
            goto LABEL_80;
          }
          if (type == 2065)
          {
            CFStringRef v5 = @"kTypeStairClimbing";
            goto LABEL_80;
          }
        }
        else
        {
          if (type == 2024)
          {
            CFStringRef v5 = @"kTypeCoreTraining";
            goto LABEL_80;
          }
          if (type == 2048)
          {
            CFStringRef v5 = @"kTypeElliptical";
            goto LABEL_80;
          }
        }
      }
      else if (type <= 2104)
      {
        if (type == 2071)
        {
          CFStringRef v5 = @"kTypeRowing";
          goto LABEL_80;
        }
        if (type == 2101)
        {
          CFStringRef v5 = @"kTypeCoolDown";
          goto LABEL_80;
        }
      }
      else
      {
        switch(type)
        {
          case 2105:
            CFStringRef v5 = @"kTypePilates";
            goto LABEL_80;
          case 2150:
            CFStringRef v5 = @"kTypeYoga";
            goto LABEL_80;
          case 3015:
            CFStringRef v5 = @"kTypeDancing";
            goto LABEL_80;
        }
      }
    }
    else if (type > 17149)
    {
      if (type <= 18239)
      {
        if (type == 17150)
        {
          CFStringRef v5 = @"kTypeIndoorWalking";
          goto LABEL_80;
        }
        if (type == 18200)
        {
          CFStringRef v5 = @"kTypeScubaDiving";
          goto LABEL_80;
        }
      }
      else
      {
        switch(type)
        {
          case 18240:
            CFStringRef v5 = @"kTypeSwimming";
            goto LABEL_80;
          case 19150:
            CFStringRef v5 = @"kTypeSummer";
            goto LABEL_80;
          case 90603:
            CFStringRef v5 = @"kTypeOutdoorWheelchair";
            goto LABEL_80;
        }
      }
    }
    else if (type <= 15109)
    {
      if (type == 11805)
      {
        CFStringRef v5 = @"kTypePushingWheelchair";
        goto LABEL_80;
      }
      if (type == 12150)
      {
        CFStringRef v5 = @"kTypeIndoorRunning";
        goto LABEL_80;
      }
    }
    else
    {
      switch(type)
      {
        case 15110:
          CFStringRef v5 = @"kTypeKickboxing";
          goto LABEL_80;
        case 15255:
          CFStringRef v5 = @"kTypeGolfing";
          goto LABEL_80;
        case 15670:
          CFStringRef v5 = @"kTypeTaiChi";
          goto LABEL_80;
      }
    }
LABEL_79:
    CFStringRef v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    goto LABEL_80;
  }
  if (type > 40)
  {
    if (type > 99)
    {
      if (type > 2019)
      {
        if (type == 2020)
        {
          CFStringRef v5 = @"kTypeCalisthenics";
          goto LABEL_80;
        }
        if (type == 2022)
        {
          CFStringRef v5 = @"kTypeFunctionalStrength";
          goto LABEL_80;
        }
      }
      else
      {
        if (type == 100)
        {
          CFStringRef v5 = @"kTypeCyclingLeg";
          goto LABEL_80;
        }
        if (type == 2010)
        {
          CFStringRef v5 = @"kTypeStationaryCycling";
          goto LABEL_80;
        }
      }
    }
    else if (type > 55)
    {
      if (type == 56)
      {
        CFStringRef v5 = @"kTypeDrivingOther";
        goto LABEL_80;
      }
      if (type == 63)
      {
        CFStringRef v5 = @"kTypeMultiSportTransition";
        goto LABEL_80;
      }
    }
    else
    {
      if (type == 41)
      {
        CFStringRef v5 = @"kTypeWalkingSlow";
        goto LABEL_80;
      }
      if (type == 52)
      {
        CFStringRef v5 = @"kTypeVehicularInHand";
        goto LABEL_80;
      }
    }
    goto LABEL_79;
  }
  CFStringRef v5 = @"kTypeUnknown";
  switch(type)
  {
    case 0:
      break;
    case 1:
      CFStringRef v5 = @"kTypeFrozen";
      break;
    case 2:
      CFStringRef v5 = @"kTypeStatic";
      break;
    case 3:
      CFStringRef v5 = @"kTypeMoving";
      break;
    case 4:
      CFStringRef v5 = @"kTypeWalking";
      break;
    case 5:
      CFStringRef v5 = @"kTypeDriving";
      break;
    case 6:
      CFStringRef v5 = @"kTypeCycling";
      break;
    case 7:
      CFStringRef v5 = @"kTypeSemiStationary";
      break;
    case 8:
      CFStringRef v5 = @"kTypeRunning";
      break;
    case 9:
      CFStringRef v5 = @"kTypeMovingCoarse";
      break;
    case 10:
      CFStringRef v5 = @"kTypeInVehicleFrozen";
      break;
    case 11:
      CFStringRef v5 = @"kTypeInVehicleStatic";
      break;
    default:
      goto LABEL_79;
  }
LABEL_80:
  [v3 setObject:v5 forKey:@"type"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t confidence = self->_confidence;
    if (confidence >= 3) {
      v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_confidence];
    }
    else {
      v9 = (NSString *)*(&off_1022B3A88 + confidence);
    }
    [v3 setObject:v9 forKey:@"confidence"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_82:
      if ((has & 0x10) == 0) {
        goto LABEL_98;
      }
      goto LABEL_94;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_82;
  }
  int mountedState = self->_mountedState;
  if (mountedState)
  {
    if (mountedState == 1) {
      CFStringRef v11 = @"kMounted";
    }
    else {
      CFStringRef v11 = +[NSString stringWithFormat:@"(unknown: %i)", self->_mountedState];
    }
  }
  else
  {
    CFStringRef v11 = @"kNotMounted";
  }
  [v3 setObject:v11 forKey:@"mountedState"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
LABEL_94:
    uint64_t mountedConfidence = self->_mountedConfidence;
    if (mountedConfidence >= 3) {
      v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_mountedConfidence];
    }
    else {
      v13 = (NSString *)*(&off_1022B3A88 + mountedConfidence);
    }
    [v3 setObject:v13 forKey:@"mountedConfidence"];
    __int16 has = (__int16)self->_has;
  }
LABEL_98:
  if ((has & 0x80) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_isStanding] forKey:@"isStanding"];
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *(float *)&double v6 = self->_tilt;
    [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6)] forKey:@"tilt"];
  }
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp)] forKey:@"timestamp"];
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 8) != 0)
  {
    uint64_t exitState = self->_exitState;
    if (exitState >= 3) {
      v17 = +[NSString stringWithFormat:@"(unknown: %i)", self->_exitState];
    }
    else {
      v17 = (NSString *)*(&off_1022B3AA0 + exitState);
    }
    [v3 setObject:v17 forKey:@"exitState"];
    __int16 v14 = (__int16)self->_has;
    if ((v14 & 1) == 0)
    {
LABEL_104:
      if ((v14 & 2) == 0) {
        goto LABEL_105;
      }
LABEL_113:
      [v3 setObject:[NSNumber numberWithDouble:self->_startTime] forKey:@"startTime"];
      if ((*(_WORD *)&self->_has & 0x100) == 0) {
        return v3;
      }
      goto LABEL_106;
    }
  }
  else if ((v14 & 1) == 0)
  {
    goto LABEL_104;
  }
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_estExitTime)] forKey:@"estExitTime"];
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 2) != 0) {
    goto LABEL_113;
  }
LABEL_105:
  if ((v14 & 0x100) != 0) {
LABEL_106:
  }
    [v3 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isVehicleConnected)] forKey:@"isVehicleConnected"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100478324((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_6:
  }
    PBDataWriterWriteFloatField();
LABEL_7:
  PBDataWriterWriteDoubleField();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 1) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0) {
        goto LABEL_10;
      }
LABEL_19:
      PBDataWriterWriteDoubleField();
      if ((*(_WORD *)&self->_has & 0x100) == 0) {
        return;
      }
      goto LABEL_20;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 2) != 0) {
    goto LABEL_19;
  }
LABEL_10:
  if ((v5 & 0x100) == 0) {
    return;
  }
LABEL_20:

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 13) = self->_type;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_confidence;
    *((_WORD *)a3 + 30) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 11) = self->_mountedState;
  *((_WORD *)a3 + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 10) = self->_mountedConfidence;
  *((_WORD *)a3 + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  *((unsigned char *)a3 + 56) = self->_isStanding;
  *((_WORD *)a3 + 30) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 12) = LODWORD(self->_tilt);
    *((_WORD *)a3 + 30) |= 0x40u;
  }
LABEL_7:
  *((void *)a3 + 3) = *(void *)&self->_timestamp;
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 8) != 0)
  {
    *((_DWORD *)a3 + 9) = self->_exitState;
    *((_WORD *)a3 + 30) |= 8u;
    __int16 v4 = (__int16)self->_has;
    if ((v4 & 1) == 0)
    {
LABEL_9:
      if ((v4 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_9;
  }
  *((void *)a3 + 1) = *(void *)&self->_estExitTime;
  *((_WORD *)a3 + 30) |= 1u;
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 2) == 0)
  {
LABEL_10:
    if ((v4 & 0x100) == 0) {
      return;
    }
LABEL_20:
    *((unsigned char *)a3 + 57) = self->_isVehicleConnected;
    *((_WORD *)a3 + 30) |= 0x100u;
    return;
  }
LABEL_19:
  *((void *)a3 + 2) = *(void *)&self->_startTime;
  *((_WORD *)a3 + 30) |= 2u;
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    goto LABEL_20;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  *((_DWORD *)result + 13) = self->_type;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 8) = self->_confidence;
    *((_WORD *)result + 30) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 11) = self->_mountedState;
  *((_WORD *)result + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 10) = self->_mountedConfidence;
  *((_WORD *)result + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_16:
  *((unsigned char *)result + 56) = self->_isStanding;
  *((_WORD *)result + 30) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *((_DWORD *)result + 12) = LODWORD(self->_tilt);
    *((_WORD *)result + 30) |= 0x40u;
  }
LABEL_7:
  *((void *)result + 3) = *(void *)&self->_timestamp;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)result + 9) = self->_exitState;
    *((_WORD *)result + 30) |= 8u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_9;
  }
  *((void *)result + 1) = *(void *)&self->_estExitTime;
  *((_WORD *)result + 30) |= 1u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 0x100) == 0) {
      return result;
    }
    goto LABEL_11;
  }
LABEL_20:
  *((void *)result + 2) = *(void *)&self->_startTime;
  *((_WORD *)result + 30) |= 2u;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    return result;
  }
LABEL_11:
  *((unsigned char *)result + 57) = self->_isVehicleConnected;
  *((_WORD *)result + 30) |= 0x100u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if (self->_type != *((_DWORD *)a3 + 13)) {
    goto LABEL_49;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 30);
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_confidence != *((_DWORD *)a3 + 8)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_mountedState != *((_DWORD *)a3 + 11)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_mountedConfidence != *((_DWORD *)a3 + 10)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_49;
    }
    if (self->_isStanding)
    {
      if (!*((unsigned char *)a3 + 56)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)a3 + 56))
    {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_tilt != *((float *)a3 + 12)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_49;
  }
  if (self->_timestamp != *((double *)a3 + 3))
  {
LABEL_49:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_exitState != *((_DWORD *)a3 + 9)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_49;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_estExitTime != *((double *)a3 + 1)) {
      goto LABEL_49;
    }
  }
  else if (v7)
  {
    goto LABEL_49;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_startTime != *((double *)a3 + 2)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_49;
  }
  LOBYTE(v5) = (v7 & 0x100) == 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 30) & 0x100) == 0) {
      goto LABEL_49;
    }
    if (self->_isVehicleConnected)
    {
      if (!*((unsigned char *)a3 + 57)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)a3 + 57))
    {
      goto LABEL_49;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v39 = 2654435761 * self->_confidence;
    if ((has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v39 = 0;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v38 = 2654435761 * self->_mountedState;
      goto LABEL_6;
    }
  }
  uint64_t v38 = 0;
LABEL_6:
  if ((has & 0x10) != 0) {
    uint64_t v4 = 2654435761 * self->_mountedConfidence;
  }
  else {
    uint64_t v4 = 0;
  }
  if ((has & 0x80) != 0) {
    uint64_t v5 = 2654435761 * self->_isStanding;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t type = self->_type;
  if ((has & 0x40) != 0)
  {
    float tilt = self->_tilt;
    float v9 = -tilt;
    if (tilt >= 0.0) {
      float v9 = self->_tilt;
    }
    float v10 = floorf(v9 + 0.5);
    float v11 = (float)(v9 - v10) * 1.8447e19;
    float v12 = fmodf(v10, 1.8447e19);
    unint64_t v13 = 2654435761u * (unint64_t)v12;
    unint64_t v14 = v13 + (unint64_t)v11;
    if (v11 <= 0.0) {
      unint64_t v14 = 2654435761u * (unint64_t)v12;
    }
    unint64_t v15 = v13 - (unint64_t)fabsf(v11);
    if (v11 < 0.0) {
      unint64_t v7 = v15;
    }
    else {
      unint64_t v7 = v14;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  double timestamp = self->_timestamp;
  double v17 = -timestamp;
  if (timestamp >= 0.0) {
    double v17 = self->_timestamp;
  }
  long double v18 = floor(v17 + 0.5);
  double v19 = (v17 - v18) * 1.84467441e19;
  double v20 = fmod(v18, 1.84467441e19);
  unint64_t v21 = 2654435761u * (unint64_t)v20;
  unint64_t v22 = v21 + (unint64_t)v19;
  if (v19 <= 0.0) {
    unint64_t v22 = 2654435761u * (unint64_t)v20;
  }
  unint64_t v23 = v21 - (unint64_t)fabs(v19);
  if (v19 < 0.0) {
    unint64_t v24 = v23;
  }
  else {
    unint64_t v24 = v22;
  }
  if ((has & 8) != 0)
  {
    uint64_t v25 = 2654435761 * self->_exitState;
    if (has) {
      goto LABEL_30;
    }
LABEL_35:
    unint64_t v30 = 0;
    goto LABEL_38;
  }
  uint64_t v25 = 0;
  if ((has & 1) == 0) {
    goto LABEL_35;
  }
LABEL_30:
  double estExitTime = self->_estExitTime;
  double v27 = -estExitTime;
  if (estExitTime >= 0.0) {
    double v27 = self->_estExitTime;
  }
  long double v28 = floor(v27 + 0.5);
  double v29 = (v27 - v28) * 1.84467441e19;
  unint64_t v30 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
  if (v29 >= 0.0)
  {
    if (v29 > 0.0) {
      v30 += (unint64_t)v29;
    }
  }
  else
  {
    v30 -= (unint64_t)fabs(v29);
  }
LABEL_38:
  if ((has & 2) != 0)
  {
    double startTime = self->_startTime;
    double v33 = -startTime;
    if (startTime >= 0.0) {
      double v33 = self->_startTime;
    }
    long double v34 = floor(v33 + 0.5);
    double v35 = (v33 - v34) * 1.84467441e19;
    unint64_t v31 = 2654435761u * (unint64_t)fmod(v34, 1.84467441e19);
    if (v35 >= 0.0)
    {
      if (v35 > 0.0) {
        v31 += (unint64_t)v35;
      }
      if ((has & 0x100) == 0) {
        goto LABEL_49;
      }
    }
    else
    {
      v31 -= (unint64_t)fabs(v35);
      if ((has & 0x100) == 0)
      {
LABEL_49:
        uint64_t v36 = 0;
        return v39 ^ v38 ^ v4 ^ v5 ^ v7 ^ v25 ^ v30 ^ v31 ^ v36 ^ (2654435761 * type) ^ v24;
      }
    }
  }
  else
  {
    unint64_t v31 = 0;
    if ((has & 0x100) == 0) {
      goto LABEL_49;
    }
  }
  uint64_t v36 = 2654435761 * self->_isVehicleConnected;
  return v39 ^ v38 ^ v4 ^ v5 ^ v7 ^ v25 ^ v30 ^ v31 ^ v36 ^ (2654435761 * type) ^ v24;
}

- (void)mergeFrom:(id)a3
{
  self->_uint64_t type = *((_DWORD *)a3 + 13);
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 4) != 0)
  {
    self->_uint64_t confidence = *((_DWORD *)a3 + 8);
    *(_WORD *)&self->_has |= 4u;
    __int16 v3 = *((_WORD *)a3 + 30);
    if ((v3 & 0x20) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_int mountedState = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_uint64_t mountedConfidence = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  self->_isStanding = *((unsigned char *)a3 + 56);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)a3 + 30) & 0x40) != 0)
  {
LABEL_6:
    self->_float tilt = *((float *)a3 + 12);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_7:
  self->_double timestamp = *((double *)a3 + 3);
  __int16 v4 = *((_WORD *)a3 + 30);
  if ((v4 & 8) != 0)
  {
    self->_uint64_t exitState = *((_DWORD *)a3 + 9);
    *(_WORD *)&self->_has |= 8u;
    __int16 v4 = *((_WORD *)a3 + 30);
    if ((v4 & 1) == 0)
    {
LABEL_9:
      if ((v4 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_double estExitTime = *((double *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v4 = *((_WORD *)a3 + 30);
  if ((v4 & 2) == 0)
  {
LABEL_10:
    if ((v4 & 0x100) == 0) {
      return;
    }
LABEL_20:
    self->_isVehicleConnected = *((unsigned char *)a3 + 57);
    *(_WORD *)&self->_has |= 0x100u;
    return;
  }
LABEL_19:
  self->_double startTime = *((double *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)a3 + 30) & 0x100) != 0) {
    goto LABEL_20;
  }
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_uint64_t type = a3;
}

- (BOOL)isStanding
{
  return self->_isStanding;
}

- (float)tilt
{
  return self->_tilt;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (double)estExitTime
{
  return self->_estExitTime;
}

- (double)startTime
{
  return self->_startTime;
}

- (BOOL)isVehicleConnected
{
  return self->_isVehicleConnected;
}

@end