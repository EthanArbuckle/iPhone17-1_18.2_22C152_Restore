@interface ALCMMotionContextMotionState
- (BOOL)hasExitState;
- (BOOL)hasIsMoving;
- (BOOL)hasIsVehicular;
- (BOOL)hasMounted;
- (BOOL)hasMountedConfidence;
- (BOOL)hasStartTime;
- (BOOL)hasTurn;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMoving;
- (BOOL)isVehicular;
- (BOOL)readFrom:(id)a3;
- (id)confidenceAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exitStateAsString:(int)a3;
- (id)mountedAsString:(int)a3;
- (id)mountedConfidenceAsString:(int)a3;
- (id)turnAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsConfidence:(id)a3;
- (int)StringAsExitState:(id)a3;
- (int)StringAsMounted:(id)a3;
- (int)StringAsMountedConfidence:(id)a3;
- (int)StringAsTurn:(id)a3;
- (int)StringAsType:(id)a3;
- (int)confidence;
- (int)exitState;
- (int)mounted;
- (int)mountedConfidence;
- (int)turn;
- (int)type;
- (unint64_t)hash;
- (unint64_t)startTime;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(int)a3;
- (void)setExitState:(int)a3;
- (void)setHasExitState:(BOOL)a3;
- (void)setHasIsMoving:(BOOL)a3;
- (void)setHasIsVehicular:(BOOL)a3;
- (void)setHasMounted:(BOOL)a3;
- (void)setHasMountedConfidence:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasTurn:(BOOL)a3;
- (void)setIsMoving:(BOOL)a3;
- (void)setIsVehicular:(BOOL)a3;
- (void)setMounted:(int)a3;
- (void)setMountedConfidence:(int)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)setTurn:(int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMMotionContextMotionState

- (id)typeAsString:(int)a3
{
  if (a3 >= 0x4000)
  {
    if (a3 < 462848)
    {
      if (a3 < 196608)
      {
        switch(a3)
        {
          case 16384:
            return @"kTypeDrivingMounted";
          case 65664:
            return @"kTypeCyclingSeat";
          case 131200:
            return @"kTypeCyclingChassis";
        }
      }
      else if (a3 > 327807)
      {
        if (a3 == 327808) {
          return @"kTypeCyclingTorso";
        }
        if (a3 == 397312) {
          return @"kTypeDrivingSeat";
        }
      }
      else
      {
        if (a3 == 196608) {
          return @"kTypeCyclingLeg";
        }
        if (a3 == 262272) {
          return @"kTypeCyclingArm";
        }
      }
    }
    else if (a3 > 720911)
    {
      if (a3 > 851979)
      {
        if (a3 == 851980) {
          return @"kTypeSemiStationaryPocket";
        }
        if (a3 == 917516) {
          return @"kTypeSemiStationaryArm";
        }
      }
      else
      {
        if (a3 == 720912) {
          return @"kTypeWalkingLeg";
        }
        if (a3 == 786448) {
          return @"kTypeWalkingArm";
        }
      }
    }
    else if (a3 > 589887)
    {
      if (a3 == 589888) {
        return @"kTypeRunningLeg";
      }
      if (a3 == 655424) {
        return @"kTypeRunningArm";
      }
    }
    else
    {
      if (a3 == 462848) {
        return @"kTypeDrivingArm";
      }
      if (a3 == 528384) {
        return @"kTypeDrivingStowed";
      }
    }
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  if (a3 > 127)
  {
    if (a3 <= 4095)
    {
      switch(a3)
      {
        case 128:
          return @"kTypeCycling";
        case 256:
          return @"kTypeInVehicleFrozen";
        case 512:
          return @"kTypeInVehicleStatic";
      }
    }
    else if (a3 >= 0x2000)
    {
      if (a3 == 0x2000) {
        return @"kTypeVehicularInHand";
      }
      if (a3 == 12288) {
        return @"kTypeDrivingOther";
      }
    }
    else
    {
      if (a3 == 4096) {
        return @"kTypeDriving";
      }
      if (a3 == 4128) {
        return @"kTypeDrivingOrWalkingSlow";
      }
    }
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  if (a3 > 11)
  {
    if (a3 > 31)
    {
      if (a3 == 32) {
        return @"kTypeWalkingSlow";
      }
      if (a3 == 64) {
        return @"kTypeRunning";
      }
    }
    else
    {
      if (a3 == 12) {
        return @"kTypeSemiStationary";
      }
      if (a3 == 16) {
        return @"kTypeWalking";
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
    case 4:
      id result = @"kTypeMoving";
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
    return 4;
  }
  if ([a3 isEqualToString:@"kTypeSemiStationary"]) {
    return 12;
  }
  if ([a3 isEqualToString:@"kTypeWalking"]) {
    return 16;
  }
  if ([a3 isEqualToString:@"kTypeWalkingSlow"]) {
    return 32;
  }
  if ([a3 isEqualToString:@"kTypeRunning"]) {
    return 64;
  }
  if ([a3 isEqualToString:@"kTypeCycling"]) {
    return 128;
  }
  if ([a3 isEqualToString:@"kTypeInVehicleFrozen"]) {
    return 256;
  }
  if ([a3 isEqualToString:@"kTypeInVehicleStatic"]) {
    return 512;
  }
  if ([a3 isEqualToString:@"kTypeDriving"]) {
    return 4096;
  }
  if ([a3 isEqualToString:@"kTypeVehicularInHand"]) {
    return 0x2000;
  }
  if ([a3 isEqualToString:@"kTypeDrivingOther"]) {
    return 12288;
  }
  if ([a3 isEqualToString:@"kTypeDrivingMounted"]) {
    return 0x4000;
  }
  if ([a3 isEqualToString:@"kTypeDrivingOrWalkingSlow"]) {
    return 4128;
  }
  unsigned __int8 v5 = [a3 isEqualToString:@"kTypeCyclingSeat"];
  int result = 65664;
  if ((v5 & 1) == 0)
  {
    if ([a3 isEqualToString:@"kTypeCyclingChassis"])
    {
      int v6 = 65664;
      return v6 + 0x10000;
    }
    if ([a3 isEqualToString:@"kTypeCyclingLeg"])
    {
      return 196608;
    }
    else if ([a3 isEqualToString:@"kTypeCyclingArm"])
    {
      return 262272;
    }
    else if ([a3 isEqualToString:@"kTypeCyclingTorso"])
    {
      return 327808;
    }
    else
    {
      unsigned __int8 v7 = [a3 isEqualToString:@"kTypeDrivingSeat"];
      int result = 397312;
      if ((v7 & 1) == 0)
      {
        if ([a3 isEqualToString:@"kTypeDrivingArm"])
        {
          int v6 = 397312;
          return v6 + 0x10000;
        }
        if ([a3 isEqualToString:@"kTypeDrivingStowed"])
        {
          return 528384;
        }
        else
        {
          unsigned __int8 v8 = [a3 isEqualToString:@"kTypeRunningLeg"];
          int result = 589888;
          if ((v8 & 1) == 0)
          {
            if ([a3 isEqualToString:@"kTypeRunningArm"])
            {
              int v6 = 589888;
              return v6 + 0x10000;
            }
            unsigned __int8 v9 = [a3 isEqualToString:@"kTypeWalkingLeg"];
            int result = 720912;
            if ((v9 & 1) == 0)
            {
              if ([a3 isEqualToString:@"kTypeWalkingArm"])
              {
                int v6 = 720912;
                return v6 + 0x10000;
              }
              unsigned __int8 v10 = [a3 isEqualToString:@"kTypeSemiStationaryPocket"];
              int result = 851980;
              if ((v10 & 1) == 0)
              {
                if ([a3 isEqualToString:@"kTypeSemiStationaryArm"]) {
                  return 917516;
                }
                else {
                  return 0;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)confidenceAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_1022B32D8 + a3);
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

- (int)mounted
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_mounted;
  }
  else {
    return 0;
  }
}

- (void)setMounted:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_mounted = a3;
}

- (void)setHasMounted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMounted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)mountedAsString:(int)a3
{
  if (!a3) {
    return @"kNotMounted";
  }
  if (a3 == 1) {
    return @"kMounted";
  }
  return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsMounted:(id)a3
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
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_mountedConfidence;
  }
  else {
    return 0;
  }
}

- (void)setMountedConfidence:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_mountedConfidence = a3;
}

- (void)setHasMountedConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMountedConfidence
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)mountedConfidenceAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_1022B32D8 + a3);
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

- (int)turn
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_turn;
  }
  else {
    return 0;
  }
}

- (void)setTurn:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_turn = a3;
}

- (void)setHasTurn:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTurn
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)turnAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_1022B32F0 + a3);
  }
}

- (int)StringAsTurn:(id)a3
{
  if ([a3 isEqualToString:@"kTurnStateUnknown"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kTurnStateStatic"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kTurnStateTurning"]) {
    return 2;
  }
  return 0;
}

- (void)setIsVehicular:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_isVehicular = a3;
}

- (void)setHasIsVehicular:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsVehicular
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setIsMoving:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isMoving = a3;
}

- (void)setHasIsMoving:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsMoving
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (int)exitState
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_exitState;
  }
  else {
    return 0;
  }
}

- (void)setExitState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_exitState = a3;
}

- (void)setHasExitState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExitState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)exitStateAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_1022B3308 + a3);
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

- (void)setStartTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCMMotionContextMotionState;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCMMotionContextMotionState *)&v3 description], [(ALCMMotionContextMotionState *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int type = self->_type;
  if (type >= 0x4000)
  {
    if (type < 462848)
    {
      if (type < 196608)
      {
        switch(type)
        {
          case 16384:
            CFStringRef v5 = @"kTypeDrivingMounted";
            goto LABEL_70;
          case 65664:
            CFStringRef v5 = @"kTypeCyclingSeat";
            goto LABEL_70;
          case 131200:
            CFStringRef v5 = @"kTypeCyclingChassis";
            goto LABEL_70;
        }
      }
      else if (type > 327807)
      {
        if (type == 327808)
        {
          CFStringRef v5 = @"kTypeCyclingTorso";
          goto LABEL_70;
        }
        if (type == 397312)
        {
          CFStringRef v5 = @"kTypeDrivingSeat";
          goto LABEL_70;
        }
      }
      else
      {
        if (type == 196608)
        {
          CFStringRef v5 = @"kTypeCyclingLeg";
          goto LABEL_70;
        }
        if (type == 262272)
        {
          CFStringRef v5 = @"kTypeCyclingArm";
          goto LABEL_70;
        }
      }
    }
    else if (type > 720911)
    {
      if (type > 851979)
      {
        if (type == 851980)
        {
          CFStringRef v5 = @"kTypeSemiStationaryPocket";
          goto LABEL_70;
        }
        if (type == 917516)
        {
          CFStringRef v5 = @"kTypeSemiStationaryArm";
          goto LABEL_70;
        }
      }
      else
      {
        if (type == 720912)
        {
          CFStringRef v5 = @"kTypeWalkingLeg";
          goto LABEL_70;
        }
        if (type == 786448)
        {
          CFStringRef v5 = @"kTypeWalkingArm";
          goto LABEL_70;
        }
      }
    }
    else if (type > 589887)
    {
      if (type == 589888)
      {
        CFStringRef v5 = @"kTypeRunningLeg";
        goto LABEL_70;
      }
      if (type == 655424)
      {
        CFStringRef v5 = @"kTypeRunningArm";
        goto LABEL_70;
      }
    }
    else
    {
      if (type == 462848)
      {
        CFStringRef v5 = @"kTypeDrivingArm";
        goto LABEL_70;
      }
      if (type == 528384)
      {
        CFStringRef v5 = @"kTypeDrivingStowed";
        goto LABEL_70;
      }
    }
    goto LABEL_69;
  }
  if (type > 127)
  {
    if (type <= 4095)
    {
      switch(type)
      {
        case 128:
          CFStringRef v5 = @"kTypeCycling";
          goto LABEL_70;
        case 256:
          CFStringRef v5 = @"kTypeInVehicleFrozen";
          goto LABEL_70;
        case 512:
          CFStringRef v5 = @"kTypeInVehicleStatic";
          goto LABEL_70;
      }
    }
    else if (type >= 0x2000)
    {
      if (type == 0x2000)
      {
        CFStringRef v5 = @"kTypeVehicularInHand";
        goto LABEL_70;
      }
      if (type == 12288)
      {
        CFStringRef v5 = @"kTypeDrivingOther";
        goto LABEL_70;
      }
    }
    else
    {
      if (type == 4096)
      {
        CFStringRef v5 = @"kTypeDriving";
        goto LABEL_70;
      }
      if (type == 4128)
      {
        CFStringRef v5 = @"kTypeDrivingOrWalkingSlow";
        goto LABEL_70;
      }
    }
LABEL_69:
    CFStringRef v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    goto LABEL_70;
  }
  if (type > 11)
  {
    if (type > 31)
    {
      if (type == 32)
      {
        CFStringRef v5 = @"kTypeWalkingSlow";
        goto LABEL_70;
      }
      if (type == 64)
      {
        CFStringRef v5 = @"kTypeRunning";
        goto LABEL_70;
      }
    }
    else
    {
      if (type == 12)
      {
        CFStringRef v5 = @"kTypeSemiStationary";
        goto LABEL_70;
      }
      if (type == 16)
      {
        CFStringRef v5 = @"kTypeWalking";
        goto LABEL_70;
      }
    }
    goto LABEL_69;
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
    case 4:
      CFStringRef v5 = @"kTypeMoving";
      break;
    default:
      goto LABEL_69;
  }
LABEL_70:
  [v3 setObject:v5 forKey:@"type"];
  uint64_t confidence = self->_confidence;
  if (confidence >= 3) {
    unsigned __int8 v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_confidence];
  }
  else {
    unsigned __int8 v7 = (NSString *)*(&off_1022B32D8 + confidence);
  }
  [v3 setObject:v7 forKey:@"confidence"];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    int mounted = self->_mounted;
    if (mounted)
    {
      if (mounted == 1) {
        CFStringRef v11 = @"kMounted";
      }
      else {
        CFStringRef v11 = +[NSString stringWithFormat:@"(unknown: %i)", self->_mounted];
      }
    }
    else
    {
      CFStringRef v11 = @"kNotMounted";
    }
    [v3 setObject:v11 forKey:@"mounted"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_75:
      if ((has & 0x10) == 0) {
        goto LABEL_76;
      }
      goto LABEL_92;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_75;
  }
  uint64_t mountedConfidence = self->_mountedConfidence;
  if (mountedConfidence >= 3) {
    v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_mountedConfidence];
  }
  else {
    v13 = (NSString *)*(&off_1022B32D8 + mountedConfidence);
  }
  [v3 setObject:v13 forKey:@"mountedConfidence"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_76:
    if ((has & 0x40) == 0) {
      goto LABEL_77;
    }
    goto LABEL_96;
  }
LABEL_92:
  uint64_t turn = self->_turn;
  if (turn >= 3) {
    v15 = +[NSString stringWithFormat:@"(unknown: %i)", self->_turn];
  }
  else {
    v15 = (NSString *)*(&off_1022B32F0 + turn);
  }
  [v3 setObject:v15 forKey:@"turn"];
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_77:
    if ((has & 0x20) == 0) {
      goto LABEL_78;
    }
    goto LABEL_97;
  }
LABEL_96:
  [v3 setObject:[NSNumber numberWithBool:self->_isVehicular] forKey:@"isVehicular"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_78:
    if ((has & 2) == 0) {
      goto LABEL_79;
    }
LABEL_98:
    uint64_t exitState = self->_exitState;
    if (exitState >= 3) {
      v17 = +[NSString stringWithFormat:@"(unknown: %i)", self->_exitState];
    }
    else {
      v17 = (NSString *)*(&off_1022B3308 + exitState);
    }
    [v3 setObject:v17 forKey:@"exitState"];
    if (*(unsigned char *)&self->_has) {
      goto LABEL_80;
    }
    return v3;
  }
LABEL_97:
  [v3 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isMoving)] forKey:@"isMoving"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_98;
  }
LABEL_79:
  if (has) {
LABEL_80:
  }
    [v3 setObject:[+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_startTime)] forKey:@"startTime"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10045D878((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((has & 1) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 9) = self->_type;
  *((_DWORD *)a3 + 4) = self->_confidence;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_mounted;
    *((unsigned char *)a3 + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_mountedConfidence;
  *((unsigned char *)a3 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 8) = self->_turn;
  *((unsigned char *)a3 + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)a3 + 41) = self->_isVehicular;
  *((unsigned char *)a3 + 44) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)a3 + 40) = self->_isMoving;
  *((unsigned char *)a3 + 44) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      return;
    }
LABEL_15:
    *((void *)a3 + 1) = self->_startTime;
    *((unsigned char *)a3 + 44) |= 1u;
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 5) = self->_exitState;
  *((unsigned char *)a3 + 44) |= 2u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  *((_DWORD *)result + 9) = self->_type;
  *((_DWORD *)result + 4) = self->_confidence;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 6) = self->_mounted;
    *((unsigned char *)result + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_mountedConfidence;
  *((unsigned char *)result + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 8) = self->_turn;
  *((unsigned char *)result + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)result + 41) = self->_isVehicular;
  *((unsigned char *)result + 44) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)result + 40) = self->_isMoving;
  *((unsigned char *)result + 44) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 5) = self->_exitState;
  *((unsigned char *)result + 44) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_8:
  *((void *)result + 1) = self->_startTime;
  *((unsigned char *)result + 44) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if (self->_type != *((_DWORD *)a3 + 9) || self->_confidence != *((_DWORD *)a3 + 4)) {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_mounted != *((_DWORD *)a3 + 6)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 8) == 0 || self->_mountedConfidence != *((_DWORD *)a3 + 7)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 0x10) == 0 || self->_turn != *((_DWORD *)a3 + 8)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 0x40) == 0) {
      goto LABEL_44;
    }
    if (self->_isVehicular)
    {
      if (!*((unsigned char *)a3 + 41)) {
        goto LABEL_44;
      }
    }
    else if (*((unsigned char *)a3 + 41))
    {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 0x40) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    if ((*((unsigned char *)a3 + 44) & 0x20) != 0) {
      goto LABEL_44;
    }
    goto LABEL_35;
  }
  if ((*((unsigned char *)a3 + 44) & 0x20) == 0) {
    goto LABEL_44;
  }
  if (self->_isMoving)
  {
    if (!*((unsigned char *)a3 + 40)) {
      goto LABEL_44;
    }
    goto LABEL_35;
  }
  if (*((unsigned char *)a3 + 40))
  {
LABEL_44:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_35:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_exitState != *((_DWORD *)a3 + 5)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 2) != 0)
  {
    goto LABEL_44;
  }
  LOBYTE(v5) = (*((unsigned char *)a3 + 44) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_startTime != *((void *)a3 + 1)) {
      goto LABEL_44;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v2 = 2654435761 * self->_mounted;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_mountedConfidence;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 0x40) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_turn;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_isVehicular;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v5 = 0;
LABEL_10:
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v6 = 2654435761 * self->_isMoving;
  }
  else {
    uint64_t v6 = 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_exitState;
  }
  else {
    uint64_t v7 = 0;
  }
  if (*(unsigned char *)&self->_has) {
    unint64_t v8 = 2654435761u * self->_startTime;
  }
  else {
    unint64_t v8 = 0;
  }
  return (2654435761 * self->_confidence) ^ (2654435761 * self->_type) ^ v2 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  self->_int type = *((_DWORD *)a3 + 9);
  self->_uint64_t confidence = *((_DWORD *)a3 + 4);
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 4) != 0)
  {
    self->_int mounted = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 44);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t mountedConfidence = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_uint64_t turn = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_isVehicular = *((unsigned char *)a3 + 41);
  *(unsigned char *)&self->_has |= 0x40u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_isMoving = *((unsigned char *)a3 + 40);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 2) == 0)
  {
LABEL_7:
    if ((v3 & 1) == 0) {
      return;
    }
LABEL_15:
    self->_startTime = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    return;
  }
LABEL_14:
  self->_uint64_t exitState = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 44)) {
    goto LABEL_15;
  }
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_int type = a3;
}

- (int)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int)a3
{
  self->_uint64_t confidence = a3;
}

- (BOOL)isVehicular
{
  return self->_isVehicular;
}

- (BOOL)isMoving
{
  return self->_isMoving;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

@end