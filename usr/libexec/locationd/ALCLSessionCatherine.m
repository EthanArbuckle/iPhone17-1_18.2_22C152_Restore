@interface ALCLSessionCatherine
- (BOOL)hasFirstCatherine;
- (BOOL)hasFirstCatherineStartTime;
- (BOOL)hasLongestDropout;
- (BOOL)hasMaxGoodCatherine;
- (BOOL)hasMeanCatherine;
- (BOOL)hasMeanGoodCatherine;
- (BOOL)hasMinGoodCatherine;
- (BOOL)hasNCatherine;
- (BOOL)hasNDropout;
- (BOOL)hasNGoodCatherine;
- (BOOL)hasNHighCatherine;
- (BOOL)hasNInterpolatedCatherine;
- (BOOL)hasNLowCatherine;
- (BOOL)hasNSampleAndHoldCatherine;
- (BOOL)hasNVeryHighCatherine;
- (BOOL)hasNVeryLowCatherine;
- (BOOL)hasOnsetCatherine;
- (BOOL)hasOnsetReason;
- (BOOL)hasPersistedMinHR;
- (BOOL)hasStartTime;
- (BOOL)hasTotalDropoutTime;
- (BOOL)hasUserMaxCatherine;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)startTime;
- (float)firstCatherine;
- (float)firstCatherineStartTime;
- (float)longestDropout;
- (float)maxGoodCatherine;
- (float)meanCatherine;
- (float)meanGoodCatherine;
- (float)minGoodCatherine;
- (float)onsetCatherine;
- (float)persistedMinHR;
- (float)totalDropoutTime;
- (float)userMaxCatherine;
- (id)activityTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)onsetReasonAsString:(int)a3;
- (int)StringAsActivityType:(id)a3;
- (int)StringAsOnsetReason:(id)a3;
- (int)activityType;
- (int)onsetReason;
- (unint64_t)hash;
- (unsigned)nCatherine;
- (unsigned)nDropout;
- (unsigned)nGoodCatherine;
- (unsigned)nHighCatherine;
- (unsigned)nInterpolatedCatherine;
- (unsigned)nLowCatherine;
- (unsigned)nSampleAndHoldCatherine;
- (unsigned)nVeryHighCatherine;
- (unsigned)nVeryLowCatherine;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityType:(int)a3;
- (void)setFirstCatherine:(float)a3;
- (void)setFirstCatherineStartTime:(float)a3;
- (void)setHasFirstCatherine:(BOOL)a3;
- (void)setHasFirstCatherineStartTime:(BOOL)a3;
- (void)setHasLongestDropout:(BOOL)a3;
- (void)setHasMaxGoodCatherine:(BOOL)a3;
- (void)setHasMeanCatherine:(BOOL)a3;
- (void)setHasMeanGoodCatherine:(BOOL)a3;
- (void)setHasMinGoodCatherine:(BOOL)a3;
- (void)setHasNCatherine:(BOOL)a3;
- (void)setHasNDropout:(BOOL)a3;
- (void)setHasNGoodCatherine:(BOOL)a3;
- (void)setHasNHighCatherine:(BOOL)a3;
- (void)setHasNInterpolatedCatherine:(BOOL)a3;
- (void)setHasNLowCatherine:(BOOL)a3;
- (void)setHasNSampleAndHoldCatherine:(BOOL)a3;
- (void)setHasNVeryHighCatherine:(BOOL)a3;
- (void)setHasNVeryLowCatherine:(BOOL)a3;
- (void)setHasOnsetCatherine:(BOOL)a3;
- (void)setHasOnsetReason:(BOOL)a3;
- (void)setHasPersistedMinHR:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasTotalDropoutTime:(BOOL)a3;
- (void)setHasUserMaxCatherine:(BOOL)a3;
- (void)setLongestDropout:(float)a3;
- (void)setMaxGoodCatherine:(float)a3;
- (void)setMeanCatherine:(float)a3;
- (void)setMeanGoodCatherine:(float)a3;
- (void)setMinGoodCatherine:(float)a3;
- (void)setNCatherine:(unsigned int)a3;
- (void)setNDropout:(unsigned int)a3;
- (void)setNGoodCatherine:(unsigned int)a3;
- (void)setNHighCatherine:(unsigned int)a3;
- (void)setNInterpolatedCatherine:(unsigned int)a3;
- (void)setNLowCatherine:(unsigned int)a3;
- (void)setNSampleAndHoldCatherine:(unsigned int)a3;
- (void)setNVeryHighCatherine:(unsigned int)a3;
- (void)setNVeryLowCatherine:(unsigned int)a3;
- (void)setOnsetCatherine:(float)a3;
- (void)setOnsetReason:(int)a3;
- (void)setPersistedMinHR:(float)a3;
- (void)setStartTime:(double)a3;
- (void)setTotalDropoutTime:(float)a3;
- (void)setUserMaxCatherine:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLSessionCatherine

- (id)activityTypeAsString:(int)a3
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

- (int)StringAsActivityType:(id)a3
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

- (void)setNCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_nCatherine = a3;
}

- (void)setHasNCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNCatherine
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setNVeryLowCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_nVeryLowCatherine = a3;
}

- (void)setHasNVeryLowCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasNVeryLowCatherine
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setNLowCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_nLowCatherine = a3;
}

- (void)setHasNLowCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasNLowCatherine
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setNHighCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_nHighCatherine = a3;
}

- (void)setHasNHighCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasNHighCatherine
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setNVeryHighCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_nVeryHighCatherine = a3;
}

- (void)setHasNVeryHighCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasNVeryHighCatherine
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNGoodCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_nGoodCatherine = a3;
}

- (void)setHasNGoodCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasNGoodCatherine
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setNInterpolatedCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_nInterpolatedCatherine = a3;
}

- (void)setHasNInterpolatedCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNInterpolatedCatherine
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setNSampleAndHoldCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_nSampleAndHoldCatherine = a3;
}

- (void)setHasNSampleAndHoldCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasNSampleAndHoldCatherine
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMinGoodCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_minGoodCatherine = a3;
}

- (void)setHasMinGoodCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasMinGoodCatherine
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setMaxGoodCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_maxGoodCatherine = a3;
}

- (void)setHasMaxGoodCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasMaxGoodCatherine
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMeanCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_meanCatherine = a3;
}

- (void)setHasMeanCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasMeanCatherine
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setMeanGoodCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_meanGoodCatherine = a3;
}

- (void)setHasMeanGoodCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasMeanGoodCatherine
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setFirstCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_firstCatherine = a3;
}

- (void)setHasFirstCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasFirstCatherine
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFirstCatherineStartTime:(float)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_firstCatherineStartTime = a3;
}

- (void)setHasFirstCatherineStartTime:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasFirstCatherineStartTime
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLongestDropout:(float)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_longestDropout = a3;
}

- (void)setHasLongestDropout:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasLongestDropout
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTotalDropoutTime:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_totalDropoutTime = a3;
}

- (void)setHasTotalDropoutTime:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasTotalDropoutTime
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setNDropout:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_nDropout = a3;
}

- (void)setHasNDropout:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasNDropout
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setStartTime:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasStartTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (int)onsetReason
{
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    return self->_onsetReason;
  }
  else {
    return -1;
  }
}

- (void)setOnsetReason:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_onsetReason = a3;
}

- (void)setHasOnsetReason:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasOnsetReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)onsetReasonAsString:(int)a3
{
  if ((a3 + 1) >= 5) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_1022C7DD0[a3 + 1];
  }
}

- (int)StringAsOnsetReason:(id)a3
{
  if ([a3 isEqualToString:@"kOnsetNotSet"]) {
    return -1;
  }
  if ([a3 isEqualToString:@"kOnsetElevated"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kOnsetActive"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kOnsetNotElevated"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"kOnsetTimeout"]) {
    return 3;
  }
  return -1;
}

- (void)setOnsetCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_onsetCatherine = a3;
}

- (void)setHasOnsetCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasOnsetCatherine
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setUserMaxCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_userMaxCatherine = a3;
}

- (void)setHasUserMaxCatherine:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasUserMaxCatherine
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setPersistedMinHR:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_persistedMinHR = a3;
}

- (void)setHasPersistedMinHR:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasPersistedMinHR
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCLSessionCatherine;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCLSessionCatherine *)&v3 description], [(ALCLSessionCatherine *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int activityType = self->_activityType;
  if (activityType > 2023)
  {
    if (activityType <= 11804)
    {
      if (activityType <= 2070)
      {
        if (activityType > 2060)
        {
          if (activityType == 2061)
          {
            CFStringRef v5 = @"kTypeCrossTraining";
            goto LABEL_80;
          }
          if (activityType == 2065)
          {
            CFStringRef v5 = @"kTypeStairClimbing";
            goto LABEL_80;
          }
        }
        else
        {
          if (activityType == 2024)
          {
            CFStringRef v5 = @"kTypeCoreTraining";
            goto LABEL_80;
          }
          if (activityType == 2048)
          {
            CFStringRef v5 = @"kTypeElliptical";
            goto LABEL_80;
          }
        }
      }
      else if (activityType <= 2104)
      {
        if (activityType == 2071)
        {
          CFStringRef v5 = @"kTypeRowing";
          goto LABEL_80;
        }
        if (activityType == 2101)
        {
          CFStringRef v5 = @"kTypeCoolDown";
          goto LABEL_80;
        }
      }
      else
      {
        switch(activityType)
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
    else if (activityType > 17149)
    {
      if (activityType <= 18239)
      {
        if (activityType == 17150)
        {
          CFStringRef v5 = @"kTypeIndoorWalking";
          goto LABEL_80;
        }
        if (activityType == 18200)
        {
          CFStringRef v5 = @"kTypeScubaDiving";
          goto LABEL_80;
        }
      }
      else
      {
        switch(activityType)
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
    else if (activityType <= 15109)
    {
      if (activityType == 11805)
      {
        CFStringRef v5 = @"kTypePushingWheelchair";
        goto LABEL_80;
      }
      if (activityType == 12150)
      {
        CFStringRef v5 = @"kTypeIndoorRunning";
        goto LABEL_80;
      }
    }
    else
    {
      switch(activityType)
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
    CFStringRef v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_activityType];
    goto LABEL_80;
  }
  if (activityType > 40)
  {
    if (activityType > 99)
    {
      if (activityType > 2019)
      {
        if (activityType == 2020)
        {
          CFStringRef v5 = @"kTypeCalisthenics";
          goto LABEL_80;
        }
        if (activityType == 2022)
        {
          CFStringRef v5 = @"kTypeFunctionalStrength";
          goto LABEL_80;
        }
      }
      else
      {
        if (activityType == 100)
        {
          CFStringRef v5 = @"kTypeCyclingLeg";
          goto LABEL_80;
        }
        if (activityType == 2010)
        {
          CFStringRef v5 = @"kTypeStationaryCycling";
          goto LABEL_80;
        }
      }
    }
    else if (activityType > 55)
    {
      if (activityType == 56)
      {
        CFStringRef v5 = @"kTypeDrivingOther";
        goto LABEL_80;
      }
      if (activityType == 63)
      {
        CFStringRef v5 = @"kTypeMultiSportTransition";
        goto LABEL_80;
      }
    }
    else
    {
      if (activityType == 41)
      {
        CFStringRef v5 = @"kTypeWalkingSlow";
        goto LABEL_80;
      }
      if (activityType == 52)
      {
        CFStringRef v5 = @"kTypeVehicularInHand";
        goto LABEL_80;
      }
    }
    goto LABEL_79;
  }
  CFStringRef v5 = @"kTypeUnknown";
  switch(activityType)
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
  [v3 setObject:v5 forKey:@"activityType"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nCatherine)] forKey:@"nCatherine"];
    $16169639337E07BB51B78E1150F773F4 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_82:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_83;
      }
      goto LABEL_106;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_82;
  }
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nVeryLowCatherine)] forKey:@"nVeryLowCatherine"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_83:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_84;
    }
    goto LABEL_107;
  }
LABEL_106:
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nLowCatherine)] forKey:@"nLowCatherine"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_84:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_108;
  }
LABEL_107:
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nHighCatherine)] forKey:@"nHighCatherine"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_85:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_86;
    }
    goto LABEL_109;
  }
LABEL_108:
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nVeryHighCatherine)] forKey:@"nVeryHighCatherine"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_86:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_110;
  }
LABEL_109:
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nGoodCatherine)] forKey:@"nGoodCatherine"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_87:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_111;
  }
LABEL_110:
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nInterpolatedCatherine)] forKey:@"nInterpolatedCatherine"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_88:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_89;
    }
    goto LABEL_112;
  }
LABEL_111:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_nSampleAndHoldCatherine] forKey:@"nSampleAndHoldCatherine"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_89:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_90;
    }
    goto LABEL_113;
  }
LABEL_112:
  *(float *)&double v6 = self->_minGoodCatherine;
  [v3 setObject:[NSNumber numberWithFloat:v6] forKey:@"minGoodCatherine"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_90:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_91;
    }
    goto LABEL_114;
  }
LABEL_113:
  *(float *)&double v6 = self->_maxGoodCatherine;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6)] forKey:@"maxGoodCatherine"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_91:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_92;
    }
    goto LABEL_115;
  }
LABEL_114:
  *(float *)&double v6 = self->_meanCatherine;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6)] forKey:@"meanCatherine"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_92:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_93;
    }
    goto LABEL_116;
  }
LABEL_115:
  *(float *)&double v6 = self->_meanGoodCatherine;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6)] forKey:@"meanGoodCatherine"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_93:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_94;
    }
    goto LABEL_117;
  }
LABEL_116:
  *(float *)&double v6 = self->_firstCatherine;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6)] forKey:@"firstCatherine"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_94:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_95;
    }
    goto LABEL_118;
  }
LABEL_117:
  *(float *)&double v6 = self->_firstCatherineStartTime;
  [v3 setObject:[NSNumber numberWithFloat:v6] forKey:@"firstCatherineStartTime"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_95:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_96;
    }
    goto LABEL_119;
  }
LABEL_118:
  *(float *)&double v6 = self->_longestDropout;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6)] forKey:@"longestDropout"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_96:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_97;
    }
    goto LABEL_120;
  }
LABEL_119:
  *(float *)&double v6 = self->_totalDropoutTime;
  [v3 setObject:[NSNumber numberWithFloat:v6] forKey:@"totalDropoutTime"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_97:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_98;
    }
    goto LABEL_121;
  }
LABEL_120:
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nDropout)] forKey:@"nDropout"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_98:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_122;
  }
LABEL_121:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime)] forKey:@"startTime"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_99:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_100;
    }
    goto LABEL_126;
  }
LABEL_122:
  unsigned int v9 = self->_onsetReason + 1;
  if (v9 >= 5) {
    v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_onsetReason];
  }
  else {
    v10 = off_1022C7DD0[v9];
  }
  [v3 setObject:v10 forKey:@"onsetReason"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_100:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_101;
    }
LABEL_127:
    *(float *)&double v6 = self->_userMaxCatherine;
    [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6)] forKey:@"userMaxCatherine"];
    if ((*(_DWORD *)&self->_has & 0x80000) == 0) {
      return v3;
    }
    goto LABEL_102;
  }
LABEL_126:
  *(float *)&double v6 = self->_onsetCatherine;
  [v3 setObject:[NSNumber numberWithFloat:v6] forKey:@"onsetCatherine"];
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0) {
    goto LABEL_127;
  }
LABEL_101:
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_102:
    *(float *)&double v6 = self->_persistedMinHR;
    [v3 setObject:[NSNumber numberWithFloat:v6] forKey:@"persistedMinHR"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10077FCD8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteInt32Field();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    $16169639337E07BB51B78E1150F773F4 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteFloatField();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteFloatField();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteFloatField();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteFloatField();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteFloatField();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteFloatField();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteFloatField();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteFloatField();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteDoubleField();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_22;
    }
LABEL_44:
    PBDataWriterWriteFloatField();
    if ((*(_DWORD *)&self->_has & 0x80000) == 0) {
      return;
    }
    goto LABEL_45;
  }
LABEL_43:
  PBDataWriterWriteFloatField();
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0) {
    goto LABEL_44;
  }
LABEL_22:
  if ((*(_DWORD *)&has & 0x80000) == 0) {
    return;
  }
LABEL_45:

  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_activityType;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_nCatherine;
    *((_DWORD *)a3 + 26) |= 0x100u;
    $16169639337E07BB51B78E1150F773F4 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 20) = self->_nVeryLowCatherine;
  *((_DWORD *)a3 + 26) |= 0x10000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 17) = self->_nLowCatherine;
  *((_DWORD *)a3 + 26) |= 0x2000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 15) = self->_nHighCatherine;
  *((_DWORD *)a3 + 26) |= 0x800u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 19) = self->_nVeryHighCatherine;
  *((_DWORD *)a3 + 26) |= 0x8000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 14) = self->_nGoodCatherine;
  *((_DWORD *)a3 + 26) |= 0x400u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)a3 + 16) = self->_nInterpolatedCatherine;
  *((_DWORD *)a3 + 26) |= 0x1000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 18) = self->_nSampleAndHoldCatherine;
  *((_DWORD *)a3 + 26) |= 0x4000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 11) = LODWORD(self->_minGoodCatherine);
  *((_DWORD *)a3 + 26) |= 0x80u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 8) = LODWORD(self->_maxGoodCatherine);
  *((_DWORD *)a3 + 26) |= 0x10u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 9) = LODWORD(self->_meanCatherine);
  *((_DWORD *)a3 + 26) |= 0x20u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 10) = LODWORD(self->_meanGoodCatherine);
  *((_DWORD *)a3 + 26) |= 0x40u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 5) = LODWORD(self->_firstCatherine);
  *((_DWORD *)a3 + 26) |= 2u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 6) = LODWORD(self->_firstCatherineStartTime);
  *((_DWORD *)a3 + 26) |= 4u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 7) = LODWORD(self->_longestDropout);
  *((_DWORD *)a3 + 26) |= 8u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 24) = LODWORD(self->_totalDropoutTime);
  *((_DWORD *)a3 + 26) |= 0x100000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)a3 + 13) = self->_nDropout;
  *((_DWORD *)a3 + 26) |= 0x200u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)a3 + 1) = *(void *)&self->_startTime;
  *((_DWORD *)a3 + 26) |= 1u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 22) = self->_onsetReason;
  *((_DWORD *)a3 + 26) |= 0x40000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 21) = LODWORD(self->_onsetCatherine);
  *((_DWORD *)a3 + 26) |= 0x20000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      return;
    }
LABEL_45:
    *((_DWORD *)a3 + 23) = LODWORD(self->_persistedMinHR);
    *((_DWORD *)a3 + 26) |= 0x80000u;
    return;
  }
LABEL_44:
  *((_DWORD *)a3 + 25) = LODWORD(self->_userMaxCatherine);
  *((_DWORD *)a3 + 26) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0) {
    goto LABEL_45;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  *((_DWORD *)result + 4) = self->_activityType;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *((_DWORD *)result + 12) = self->_nCatherine;
    *((_DWORD *)result + 26) |= 0x100u;
    $16169639337E07BB51B78E1150F773F4 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 20) = self->_nVeryLowCatherine;
  *((_DWORD *)result + 26) |= 0x10000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 17) = self->_nLowCatherine;
  *((_DWORD *)result + 26) |= 0x2000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 15) = self->_nHighCatherine;
  *((_DWORD *)result + 26) |= 0x800u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 19) = self->_nVeryHighCatherine;
  *((_DWORD *)result + 26) |= 0x8000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 14) = self->_nGoodCatherine;
  *((_DWORD *)result + 26) |= 0x400u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 16) = self->_nInterpolatedCatherine;
  *((_DWORD *)result + 26) |= 0x1000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 18) = self->_nSampleAndHoldCatherine;
  *((_DWORD *)result + 26) |= 0x4000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 11) = LODWORD(self->_minGoodCatherine);
  *((_DWORD *)result + 26) |= 0x80u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 8) = LODWORD(self->_maxGoodCatherine);
  *((_DWORD *)result + 26) |= 0x10u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)result + 9) = LODWORD(self->_meanCatherine);
  *((_DWORD *)result + 26) |= 0x20u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)result + 10) = LODWORD(self->_meanGoodCatherine);
  *((_DWORD *)result + 26) |= 0x40u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 5) = LODWORD(self->_firstCatherine);
  *((_DWORD *)result + 26) |= 2u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)result + 6) = LODWORD(self->_firstCatherineStartTime);
  *((_DWORD *)result + 26) |= 4u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)result + 7) = LODWORD(self->_longestDropout);
  *((_DWORD *)result + 26) |= 8u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)result + 24) = LODWORD(self->_totalDropoutTime);
  *((_DWORD *)result + 26) |= 0x100000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)result + 13) = self->_nDropout;
  *((_DWORD *)result + 26) |= 0x200u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)result + 1) = *(void *)&self->_startTime;
  *((_DWORD *)result + 26) |= 1u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)result + 22) = self->_onsetReason;
  *((_DWORD *)result + 26) |= 0x40000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)result + 21) = LODWORD(self->_onsetCatherine);
  *((_DWORD *)result + 26) |= 0x20000u;
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      return result;
    }
    goto LABEL_23;
  }
LABEL_45:
  *((_DWORD *)result + 25) = LODWORD(self->_userMaxCatherine);
  *((_DWORD *)result + 26) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x80000) == 0) {
    return result;
  }
LABEL_23:
  *((_DWORD *)result + 23) = LODWORD(self->_persistedMinHR);
  *((_DWORD *)result + 26) |= 0x80000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_activityType != *((_DWORD *)a3 + 4))
    {
LABEL_112:
      LOBYTE(v5) = 0;
      return v5;
    }
    $16169639337E07BB51B78E1150F773F4 has = self->_has;
    int v7 = *((_DWORD *)a3 + 26);
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_nCatherine != *((_DWORD *)a3 + 12)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_nVeryLowCatherine != *((_DWORD *)a3 + 20)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_nLowCatherine != *((_DWORD *)a3 + 17)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_nHighCatherine != *((_DWORD *)a3 + 15)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_nVeryHighCatherine != *((_DWORD *)a3 + 19)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_nGoodCatherine != *((_DWORD *)a3 + 14)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_nInterpolatedCatherine != *((_DWORD *)a3 + 16)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_nSampleAndHoldCatherine != *((_DWORD *)a3 + 18)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_112;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_minGoodCatherine != *((float *)a3 + 11)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_112;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_maxGoodCatherine != *((float *)a3 + 8)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_112;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_meanCatherine != *((float *)a3 + 9)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_112;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_meanGoodCatherine != *((float *)a3 + 10)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_112;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_firstCatherine != *((float *)a3 + 5)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_112;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_firstCatherineStartTime != *((float *)a3 + 6)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_112;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_longestDropout != *((float *)a3 + 7)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_totalDropoutTime != *((float *)a3 + 24)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_nDropout != *((_DWORD *)a3 + 13)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_112;
    }
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_startTime != *((double *)a3 + 1)) {
        goto LABEL_112;
      }
    }
    else if (v7)
    {
      goto LABEL_112;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_onsetReason != *((_DWORD *)a3 + 22)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_onsetCatherine != *((float *)a3 + 21)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_userMaxCatherine != *((float *)a3 + 25)) {
        goto LABEL_112;
      }
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_112;
    }
    LOBYTE(v5) = (v7 & 0x80000) == 0;
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_persistedMinHR != *((float *)a3 + 23)) {
        goto LABEL_112;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $16169639337E07BB51B78E1150F773F4 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    uint64_t v82 = 2654435761 * self->_nCatherine;
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
LABEL_3:
      uint64_t v81 = 2654435761 * self->_nVeryLowCatherine;
      if ((*(_WORD *)&has & 0x2000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v82 = 0;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v81 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_4:
    uint64_t v80 = 2654435761 * self->_nLowCatherine;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v80 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_5:
    uint64_t v79 = 2654435761 * self->_nHighCatherine;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v78 = 0;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v79 = 0;
  if ((*(_WORD *)&has & 0x8000) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v78 = 2654435761 * self->_nVeryHighCatherine;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_7:
    uint64_t v77 = 2654435761 * self->_nGoodCatherine;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v77 = 0;
LABEL_14:
  if ((*(_WORD *)&has & 0x1000) != 0) {
    uint64_t v76 = 2654435761 * self->_nInterpolatedCatherine;
  }
  else {
    uint64_t v76 = 0;
  }
  if ((*(_WORD *)&has & 0x4000) != 0) {
    uint64_t v75 = 2654435761 * self->_nSampleAndHoldCatherine;
  }
  else {
    uint64_t v75 = 0;
  }
  uint64_t activityType = self->_activityType;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    float minGoodCatherine = self->_minGoodCatherine;
    float v6 = -minGoodCatherine;
    if (minGoodCatherine >= 0.0) {
      float v6 = self->_minGoodCatherine;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    float maxGoodCatherine = self->_maxGoodCatherine;
    float v11 = -maxGoodCatherine;
    if (maxGoodCatherine >= 0.0) {
      float v11 = self->_maxGoodCatherine;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    float meanCatherine = self->_meanCatherine;
    float v16 = -meanCatherine;
    if (meanCatherine >= 0.0) {
      float v16 = self->_meanCatherine;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    float meanGoodCatherine = self->_meanGoodCatherine;
    float v21 = -meanGoodCatherine;
    if (meanGoodCatherine >= 0.0) {
      float v21 = self->_meanGoodCatherine;
    }
    float v22 = floorf(v21 + 0.5);
    float v23 = (float)(v21 - v22) * 1.8447e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    float firstCatherine = self->_firstCatherine;
    float v26 = -firstCatherine;
    if (firstCatherine >= 0.0) {
      float v26 = self->_firstCatherine;
    }
    float v27 = floorf(v26 + 0.5);
    float v28 = (float)(v26 - v27) * 1.8447e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabsf(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    float firstCatherineStartTime = self->_firstCatherineStartTime;
    float v31 = -firstCatherineStartTime;
    if (firstCatherineStartTime >= 0.0) {
      float v31 = self->_firstCatherineStartTime;
    }
    float v32 = floorf(v31 + 0.5);
    float v33 = (float)(v31 - v32) * 1.8447e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmodf(v32, 1.8447e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabsf(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  unint64_t v73 = v9;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    float longestDropout = self->_longestDropout;
    float v36 = -longestDropout;
    if (longestDropout >= 0.0) {
      float v36 = self->_longestDropout;
    }
    float v37 = floorf(v36 + 0.5);
    float v38 = (float)(v36 - v37) * 1.8447e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmodf(v37, 1.8447e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabsf(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    float totalDropoutTime = self->_totalDropoutTime;
    float v41 = -totalDropoutTime;
    if (totalDropoutTime >= 0.0) {
      float v41 = self->_totalDropoutTime;
    }
    float v42 = floorf(v41 + 0.5);
    float v43 = (float)(v41 - v42) * 1.8447e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmodf(v42, 1.8447e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabsf(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  if ((*(_WORD *)&has & 0x200) != 0) {
    uint64_t v69 = 2654435761 * self->_nDropout;
  }
  else {
    uint64_t v69 = 0;
  }
  unint64_t v71 = v34;
  unint64_t v72 = v24;
  if (*(unsigned char *)&has)
  {
    double startTime = self->_startTime;
    double v46 = -startTime;
    if (startTime >= 0.0) {
      double v46 = self->_startTime;
    }
    long double v47 = floor(v46 + 0.5);
    double v48 = (v46 - v47) * 1.84467441e19;
    unint64_t v44 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0) {
        v44 += (unint64_t)v48;
      }
    }
    else
    {
      v44 -= (unint64_t)fabs(v48);
    }
  }
  else
  {
    unint64_t v44 = 0;
  }
  unint64_t v70 = v29;
  if ((*(_DWORD *)&has & 0x40000) != 0) {
    uint64_t v49 = 2654435761 * self->_onsetReason;
  }
  else {
    uint64_t v49 = 0;
  }
  unint64_t v50 = v39;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    float onsetCatherine = self->_onsetCatherine;
    float v54 = -onsetCatherine;
    if (onsetCatherine >= 0.0) {
      float v54 = self->_onsetCatherine;
    }
    float v55 = floorf(v54 + 0.5);
    float v56 = (float)(v54 - v55) * 1.8447e19;
    unint64_t v52 = 2654435761u * (unint64_t)fmodf(v55, 1.8447e19);
    unint64_t v51 = v19;
    if (v56 >= 0.0)
    {
      if (v56 > 0.0) {
        v52 += (unint64_t)v56;
      }
    }
    else
    {
      v52 -= (unint64_t)fabsf(v56);
    }
  }
  else
  {
    unint64_t v51 = v19;
    unint64_t v52 = 0;
  }
  unint64_t v57 = v4;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    float userMaxCatherine = self->_userMaxCatherine;
    float v60 = -userMaxCatherine;
    if (userMaxCatherine >= 0.0) {
      float v60 = self->_userMaxCatherine;
    }
    float v61 = floorf(v60 + 0.5);
    float v62 = (float)(v60 - v61) * 1.8447e19;
    unint64_t v58 = 2654435761u * (unint64_t)fmodf(v61, 1.8447e19);
    if (v62 >= 0.0)
    {
      if (v62 > 0.0) {
        v58 += (unint64_t)v62;
      }
    }
    else
    {
      v58 -= (unint64_t)fabsf(v62);
    }
  }
  else
  {
    unint64_t v58 = 0;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    float persistedMinHR = self->_persistedMinHR;
    float v65 = -persistedMinHR;
    if (persistedMinHR >= 0.0) {
      float v65 = self->_persistedMinHR;
    }
    float v66 = floorf(v65 + 0.5);
    float v67 = (float)(v65 - v66) * 1.8447e19;
    unint64_t v63 = 2654435761u * (unint64_t)fmodf(v66, 1.8447e19);
    if (v67 >= 0.0)
    {
      if (v67 > 0.0) {
        v63 += (unint64_t)v67;
      }
    }
    else
    {
      v63 -= (unint64_t)fabsf(v67);
    }
  }
  else
  {
    unint64_t v63 = 0;
  }
  return v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v57 ^ v73 ^ v14 ^ v51 ^ v72 ^ v70 ^ v71 ^ v50 ^ (2654435761 * activityType) ^ v69 ^ v44 ^ v49 ^ v52 ^ v58 ^ v63;
}

- (void)mergeFrom:(id)a3
{
  self->_uint64_t activityType = *((_DWORD *)a3 + 4);
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x100) != 0)
  {
    self->_nCatherine = *((_DWORD *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x100u;
    int v3 = *((_DWORD *)a3 + 26);
    if ((v3 & 0x10000) == 0)
    {
LABEL_3:
      if ((v3 & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((v3 & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  self->_nVeryLowCatherine = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x2000) == 0)
  {
LABEL_4:
    if ((v3 & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_nLowCatherine = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x800) == 0)
  {
LABEL_5:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_nHighCatherine = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x800u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x8000) == 0)
  {
LABEL_6:
    if ((v3 & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_nVeryHighCatherine = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x400) == 0)
  {
LABEL_7:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_nGoodCatherine = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x400u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x1000) == 0)
  {
LABEL_8:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_nInterpolatedCatherine = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x4000) == 0)
  {
LABEL_9:
    if ((v3 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_nSampleAndHoldCatherine = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x80) == 0)
  {
LABEL_10:
    if ((v3 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_float minGoodCatherine = *((float *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x80u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x10) == 0)
  {
LABEL_11:
    if ((v3 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_float maxGoodCatherine = *((float *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x10u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x20) == 0)
  {
LABEL_12:
    if ((v3 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_float meanCatherine = *((float *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x20u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x40) == 0)
  {
LABEL_13:
    if ((v3 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_float meanGoodCatherine = *((float *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x40u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 2) == 0)
  {
LABEL_14:
    if ((v3 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_float firstCatherine = *((float *)a3 + 5);
  *(_DWORD *)&self->_has |= 2u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 4) == 0)
  {
LABEL_15:
    if ((v3 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_float firstCatherineStartTime = *((float *)a3 + 6);
  *(_DWORD *)&self->_has |= 4u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 8) == 0)
  {
LABEL_16:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_float longestDropout = *((float *)a3 + 7);
  *(_DWORD *)&self->_has |= 8u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x100000) == 0)
  {
LABEL_17:
    if ((v3 & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_float totalDropoutTime = *((float *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x200) == 0)
  {
LABEL_18:
    if ((v3 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_nDropout = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x200u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 1) == 0)
  {
LABEL_19:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_double startTime = *((double *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x40000) == 0)
  {
LABEL_20:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_onsetReason = *((_DWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x20000) == 0)
  {
LABEL_21:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_float onsetCatherine = *((float *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x200000) == 0)
  {
LABEL_22:
    if ((v3 & 0x80000) == 0) {
      return;
    }
LABEL_45:
    self->_float persistedMinHR = *((float *)a3 + 23);
    *(_DWORD *)&self->_has |= 0x80000u;
    return;
  }
LABEL_44:
  self->_float userMaxCatherine = *((float *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x200000u;
  if ((*((_DWORD *)a3 + 26) & 0x80000) != 0) {
    goto LABEL_45;
  }
}

- (int)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(int)a3
{
  self->_uint64_t activityType = a3;
}

- (unsigned)nCatherine
{
  return self->_nCatherine;
}

- (unsigned)nVeryLowCatherine
{
  return self->_nVeryLowCatherine;
}

- (unsigned)nLowCatherine
{
  return self->_nLowCatherine;
}

- (unsigned)nHighCatherine
{
  return self->_nHighCatherine;
}

- (unsigned)nVeryHighCatherine
{
  return self->_nVeryHighCatherine;
}

- (unsigned)nGoodCatherine
{
  return self->_nGoodCatherine;
}

- (unsigned)nInterpolatedCatherine
{
  return self->_nInterpolatedCatherine;
}

- (unsigned)nSampleAndHoldCatherine
{
  return self->_nSampleAndHoldCatherine;
}

- (float)minGoodCatherine
{
  return self->_minGoodCatherine;
}

- (float)maxGoodCatherine
{
  return self->_maxGoodCatherine;
}

- (float)meanCatherine
{
  return self->_meanCatherine;
}

- (float)meanGoodCatherine
{
  return self->_meanGoodCatherine;
}

- (float)firstCatherine
{
  return self->_firstCatherine;
}

- (float)firstCatherineStartTime
{
  return self->_firstCatherineStartTime;
}

- (float)longestDropout
{
  return self->_longestDropout;
}

- (float)totalDropoutTime
{
  return self->_totalDropoutTime;
}

- (unsigned)nDropout
{
  return self->_nDropout;
}

- (double)startTime
{
  return self->_startTime;
}

- (float)onsetCatherine
{
  return self->_onsetCatherine;
}

- (float)userMaxCatherine
{
  return self->_userMaxCatherine;
}

- (float)persistedMinHR
{
  return self->_persistedMinHR;
}

@end