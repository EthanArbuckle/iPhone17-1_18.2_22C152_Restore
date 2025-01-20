@interface ALCMCalorieData
- (BOOL)hasMetsFM;
- (BOOL)hasMetsHR;
- (BOOL)hasMetsWR;
- (BOOL)hasTruthMetsSource;
- (BOOL)hasUserMetsSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStanding;
- (BOOL)readFrom:(id)a3;
- (double)truthMets;
- (double)userMets;
- (float)metsFM;
- (float)metsHR;
- (float)metsWR;
- (id)activityTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)truthMetsSourceAsString:(int)a3;
- (id)userMetsSourceAsString:(int)a3;
- (int)StringAsActivityType:(id)a3;
- (int)StringAsTruthMetsSource:(id)a3;
- (int)StringAsUserMetsSource:(id)a3;
- (int)activityType;
- (int)truthMetsSource;
- (int)userMetsSource;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityType:(int)a3;
- (void)setHasMetsFM:(BOOL)a3;
- (void)setHasMetsHR:(BOOL)a3;
- (void)setHasMetsWR:(BOOL)a3;
- (void)setHasTruthMetsSource:(BOOL)a3;
- (void)setHasUserMetsSource:(BOOL)a3;
- (void)setIsStanding:(BOOL)a3;
- (void)setMetsFM:(float)a3;
- (void)setMetsHR:(float)a3;
- (void)setMetsWR:(float)a3;
- (void)setTruthMets:(double)a3;
- (void)setTruthMetsSource:(int)a3;
- (void)setUserMets:(double)a3;
- (void)setUserMetsSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMCalorieData

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

- (int)userMetsSource
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_userMetsSource;
  }
  else {
    return 0;
  }
}

- (void)setUserMetsSource:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_userMetsSource = a3;
}

- (void)setHasUserMetsSource:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUserMetsSource
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)userMetsSourceAsString:(int)a3
{
  if (a3 >= 5) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_1022C81D0[a3];
  }
}

- (int)StringAsUserMetsSource:(id)a3
{
  if ([a3 isEqualToString:@"kWorkRate"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kHeartRate"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kCalibratedWorkRate"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"kDefaultValue"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"kFitnessMachine"]) {
    return 4;
  }
  return 0;
}

- (int)truthMetsSource
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_truthMetsSource;
  }
  else {
    return 0;
  }
}

- (void)setTruthMetsSource:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_truthMetsSource = a3;
}

- (void)setHasTruthMetsSource:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTruthMetsSource
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)truthMetsSourceAsString:(int)a3
{
  if (a3 >= 5) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_1022C81D0[a3];
  }
}

- (int)StringAsTruthMetsSource:(id)a3
{
  if ([a3 isEqualToString:@"kWorkRate"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kHeartRate"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kCalibratedWorkRate"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"kDefaultValue"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"kFitnessMachine"]) {
    return 4;
  }
  return 0;
}

- (void)setMetsHR:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_metsHR = a3;
}

- (void)setHasMetsHR:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMetsHR
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMetsWR:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_metsWR = a3;
}

- (void)setHasMetsWR:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMetsWR
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMetsFM:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_metsFM = a3;
}

- (void)setHasMetsFM:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMetsFM
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCMCalorieData;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCMCalorieData *)&v3 description], [(ALCMCalorieData *)self dictionaryRepresentation]];
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
  [v3 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isStanding)] forKey:@"isStanding"];
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_userMets)] forKey:@"userMets"];
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_truthMets)] forKey:@"truthMets"];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t userMetsSource = self->_userMetsSource;
    if (userMetsSource >= 5) {
      v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_userMetsSource];
    }
    else {
      v10 = off_1022C81D0[userMetsSource];
    }
    [v3 setObject:v10 forKey:@"userMetsSource"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_82:
      if ((has & 2) == 0) {
        goto LABEL_83;
      }
      goto LABEL_95;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_82;
  }
  uint64_t truthMetsSource = self->_truthMetsSource;
  if (truthMetsSource >= 5) {
    v12 = +[NSString stringWithFormat:@"(unknown: %i)", self->_truthMetsSource];
  }
  else {
    v12 = off_1022C81D0[truthMetsSource];
  }
  [v3 setObject:v12 forKey:@"truthMetsSource"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_83:
    if ((has & 4) == 0) {
      goto LABEL_84;
    }
LABEL_96:
    *(float *)&double v6 = self->_metsWR;
    [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6)] forKey:@"metsWR"];
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_85;
  }
LABEL_95:
  *(float *)&double v6 = self->_metsHR;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6)] forKey:@"metsHR"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_96;
  }
LABEL_84:
  if (has)
  {
LABEL_85:
    *(float *)&double v6 = self->_metsFM;
    [v3 setObject:[NSNumber numberWithFloat:v6] forKey:@"metsFM"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10078ED9C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    PBDataWriterWriteFloatField();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_9:
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 1) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 6) = self->_activityType;
  *((unsigned char *)a3 + 48) = self->_isStanding;
  *((void *)a3 + 2) = *(void *)&self->_userMets;
  *((void *)a3 + 1) = *(void *)&self->_truthMets;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_userMetsSource;
    *((unsigned char *)a3 + 52) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 10) = self->_truthMetsSource;
  *((unsigned char *)a3 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  *((_DWORD *)a3 + 8) = LODWORD(self->_metsHR);
  *((unsigned char *)a3 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      return;
    }
LABEL_11:
    *((_DWORD *)a3 + 7) = LODWORD(self->_metsFM);
    *((unsigned char *)a3 + 52) |= 1u;
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 9) = LODWORD(self->_metsWR);
  *((unsigned char *)a3 + 52) |= 4u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  *((_DWORD *)result + 6) = self->_activityType;
  *((unsigned char *)result + 48) = self->_isStanding;
  *((void *)result + 2) = *(void *)&self->_userMets;
  *((void *)result + 1) = *(void *)&self->_truthMets;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)result + 11) = self->_userMetsSource;
    *((unsigned char *)result + 52) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_truthMetsSource;
  *((unsigned char *)result + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 8) = LODWORD(self->_metsHR);
  *((unsigned char *)result + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 9) = LODWORD(self->_metsWR);
  *((unsigned char *)result + 52) |= 4u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 7) = LODWORD(self->_metsFM);
  *((unsigned char *)result + 52) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if (self->_activityType != *((_DWORD *)a3 + 6)) {
    goto LABEL_33;
  }
  if (self->_isStanding)
  {
    if (!*((unsigned char *)a3 + 48)) {
      goto LABEL_33;
    }
    goto LABEL_7;
  }
  if (*((unsigned char *)a3 + 48))
  {
LABEL_33:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_7:
  if (self->_userMets != *((double *)a3 + 2) || self->_truthMets != *((double *)a3 + 1)) {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 52) & 0x10) == 0 || self->_userMetsSource != *((_DWORD *)a3 + 11)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 0x10) != 0)
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 52) & 8) == 0 || self->_truthMetsSource != *((_DWORD *)a3 + 10)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 8) != 0)
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 52) & 2) == 0 || self->_metsHR != *((float *)a3 + 8)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 52) & 4) == 0 || self->_metsWR != *((float *)a3 + 9)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 4) != 0)
  {
    goto LABEL_33;
  }
  LOBYTE(v5) = (*((unsigned char *)a3 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 52) & 1) == 0 || self->_metsFM != *((float *)a3 + 7)) {
      goto LABEL_33;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t activityType = self->_activityType;
  BOOL isStanding = self->_isStanding;
  double userMets = self->_userMets;
  double v5 = -userMets;
  if (userMets >= 0.0) {
    double v5 = self->_userMets;
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
  double truthMets = self->_truthMets;
  double v14 = -truthMets;
  if (truthMets >= 0.0) {
    double v14 = self->_truthMets;
  }
  long double v15 = floor(v14 + 0.5);
  double v16 = (v14 - v15) * 1.84467441e19;
  double v17 = fmod(v15, 1.84467441e19);
  unint64_t v18 = 2654435761u * (unint64_t)v17;
  unint64_t v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0) {
    unint64_t v19 = 2654435761u * (unint64_t)v17;
  }
  unint64_t v20 = v18 - (unint64_t)fabs(v16);
  if (v16 < 0.0) {
    unint64_t v21 = v20;
  }
  else {
    unint64_t v21 = v19;
  }
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
    uint64_t v23 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_17;
    }
LABEL_23:
    uint64_t v24 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_18;
    }
LABEL_24:
    unint64_t v29 = 0;
    goto LABEL_27;
  }
  uint64_t v23 = 2654435761 * self->_userMetsSource;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_23;
  }
LABEL_17:
  uint64_t v24 = 2654435761 * self->_truthMetsSource;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_24;
  }
LABEL_18:
  float metsHR = self->_metsHR;
  float v26 = -metsHR;
  if (metsHR >= 0.0) {
    float v26 = self->_metsHR;
  }
  float v27 = floorf(v26 + 0.5);
  float v28 = (float)(v26 - v27) * 1.8447e19;
  unint64_t v29 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
  if (v28 >= 0.0)
  {
    if (v28 > 0.0) {
      v29 += (unint64_t)v28;
    }
  }
  else
  {
    v29 -= (unint64_t)fabsf(v28);
  }
LABEL_27:
  if ((has & 4) != 0)
  {
    float metsWR = self->_metsWR;
    float v32 = -metsWR;
    if (metsWR >= 0.0) {
      float v32 = self->_metsWR;
    }
    float v33 = floorf(v32 + 0.5);
    float v34 = (float)(v32 - v33) * 1.8447e19;
    float v35 = fmodf(v33, 1.8447e19);
    unint64_t v36 = 2654435761u * (unint64_t)v35;
    if (v34 >= 0.0)
    {
      if (v34 > 0.0) {
        unint64_t v30 = v36 + (unint64_t)v34;
      }
      else {
        unint64_t v30 = 2654435761u * (unint64_t)v35;
      }
      if ((has & 1) == 0) {
        goto LABEL_45;
      }
    }
    else
    {
      unint64_t v30 = v36 - (unint64_t)fabsf(v34);
      if ((has & 1) == 0)
      {
LABEL_45:
        unint64_t v44 = 0;
        return (2654435761 * isStanding) ^ v21 ^ (2654435761 * activityType) ^ v12 ^ v23 ^ v24 ^ v29 ^ v30 ^ v44;
      }
    }
  }
  else
  {
    unint64_t v30 = 0;
    if ((has & 1) == 0) {
      goto LABEL_45;
    }
  }
  float metsFM = self->_metsFM;
  float v38 = -metsFM;
  if (metsFM >= 0.0) {
    float v38 = self->_metsFM;
  }
  float v39 = floorf(v38 + 0.5);
  float v40 = (float)(v38 - v39) * 1.8447e19;
  float v41 = fmodf(v39, 1.8447e19);
  unint64_t v42 = 2654435761u * (unint64_t)v41;
  unint64_t v43 = v42 + (unint64_t)v40;
  if (v40 <= 0.0) {
    unint64_t v43 = 2654435761u * (unint64_t)v41;
  }
  unint64_t v44 = v42 - (unint64_t)fabsf(v40);
  if (v40 >= 0.0) {
    unint64_t v44 = v43;
  }
  return (2654435761 * isStanding) ^ v21 ^ (2654435761 * activityType) ^ v12 ^ v23 ^ v24 ^ v29 ^ v30 ^ v44;
}

- (void)mergeFrom:(id)a3
{
  self->_uint64_t activityType = *((_DWORD *)a3 + 6);
  self->_BOOL isStanding = *((unsigned char *)a3 + 48);
  self->_double userMets = *((double *)a3 + 2);
  self->_double truthMets = *((double *)a3 + 1);
  char v3 = *((unsigned char *)a3 + 52);
  if ((v3 & 0x10) != 0)
  {
    self->_uint64_t userMetsSource = *((_DWORD *)a3 + 11);
    *(unsigned char *)&self->_has |= 0x10u;
    char v3 = *((unsigned char *)a3 + 52);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t truthMetsSource = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 52);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  self->_float metsHR = *((float *)a3 + 8);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 52);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 1) == 0) {
      return;
    }
LABEL_11:
    self->_float metsFM = *((float *)a3 + 7);
    *(unsigned char *)&self->_has |= 1u;
    return;
  }
LABEL_10:
  self->_float metsWR = *((float *)a3 + 9);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)a3 + 52)) {
    goto LABEL_11;
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

- (BOOL)isStanding
{
  return self->_isStanding;
}

- (void)setIsStanding:(BOOL)a3
{
  self->_BOOL isStanding = a3;
}

- (double)userMets
{
  return self->_userMets;
}

- (void)setUserMets:(double)a3
{
  self->_double userMets = a3;
}

- (double)truthMets
{
  return self->_truthMets;
}

- (void)setTruthMets:(double)a3
{
  self->_double truthMets = a3;
}

- (float)metsHR
{
  return self->_metsHR;
}

- (float)metsWR
{
  return self->_metsWR;
}

- (float)metsFM
{
  return self->_metsFM;
}

@end