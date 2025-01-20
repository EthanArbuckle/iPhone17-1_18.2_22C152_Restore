@interface ALCLNatalieDataDeprecated
- (BOOL)hasBasalMETs;
- (BOOL)hasBasalNatalies;
- (BOOL)hasDuration;
- (BOOL)hasMets;
- (BOOL)hasRecordId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStanding;
- (BOOL)readFrom:(id)a3;
- (BOOL)regularEntry;
- (double)duration;
- (double)mets;
- (double)timestamp;
- (float)basalMETs;
- (id)activityTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsActivityType:(id)a3;
- (int)activityType;
- (int)recordId;
- (int64_t)basalNatalies;
- (int64_t)natalies;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityType:(int)a3;
- (void)setBasalMETs:(float)a3;
- (void)setBasalNatalies:(int64_t)a3;
- (void)setDuration:(double)a3;
- (void)setHasBasalMETs:(BOOL)a3;
- (void)setHasBasalNatalies:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasMets:(BOOL)a3;
- (void)setHasRecordId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsStanding:(BOOL)a3;
- (void)setMets:(double)a3;
- (void)setNatalies:(int64_t)a3;
- (void)setRecordId:(int)a3;
- (void)setRegularEntry:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLNatalieDataDeprecated

- (void)setRecordId:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_recordId = a3;
}

- (void)setHasRecordId:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRecordId
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

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

- (void)setMets:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_mets = a3;
}

- (void)setHasMets:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMets
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setBasalMETs:(float)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_basalMETs = a3;
}

- (void)setHasBasalMETs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBasalMETs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setBasalNatalies:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_basalNatalies = a3;
}

- (void)setHasBasalNatalies:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBasalNatalies
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCLNatalieDataDeprecated;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCLNatalieDataDeprecated *)&v3 description], [(ALCLNatalieDataDeprecated *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_recordId)] forKey:@"recordId"];
  }
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
            goto LABEL_82;
          }
          if (activityType == 2065)
          {
            CFStringRef v5 = @"kTypeStairClimbing";
            goto LABEL_82;
          }
        }
        else
        {
          if (activityType == 2024)
          {
            CFStringRef v5 = @"kTypeCoreTraining";
            goto LABEL_82;
          }
          if (activityType == 2048)
          {
            CFStringRef v5 = @"kTypeElliptical";
            goto LABEL_82;
          }
        }
      }
      else if (activityType <= 2104)
      {
        if (activityType == 2071)
        {
          CFStringRef v5 = @"kTypeRowing";
          goto LABEL_82;
        }
        if (activityType == 2101)
        {
          CFStringRef v5 = @"kTypeCoolDown";
          goto LABEL_82;
        }
      }
      else
      {
        switch(activityType)
        {
          case 2105:
            CFStringRef v5 = @"kTypePilates";
            goto LABEL_82;
          case 2150:
            CFStringRef v5 = @"kTypeYoga";
            goto LABEL_82;
          case 3015:
            CFStringRef v5 = @"kTypeDancing";
            goto LABEL_82;
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
          goto LABEL_82;
        }
        if (activityType == 18200)
        {
          CFStringRef v5 = @"kTypeScubaDiving";
          goto LABEL_82;
        }
      }
      else
      {
        switch(activityType)
        {
          case 18240:
            CFStringRef v5 = @"kTypeSwimming";
            goto LABEL_82;
          case 19150:
            CFStringRef v5 = @"kTypeSummer";
            goto LABEL_82;
          case 90603:
            CFStringRef v5 = @"kTypeOutdoorWheelchair";
            goto LABEL_82;
        }
      }
    }
    else if (activityType <= 15109)
    {
      if (activityType == 11805)
      {
        CFStringRef v5 = @"kTypePushingWheelchair";
        goto LABEL_82;
      }
      if (activityType == 12150)
      {
        CFStringRef v5 = @"kTypeIndoorRunning";
        goto LABEL_82;
      }
    }
    else
    {
      switch(activityType)
      {
        case 15110:
          CFStringRef v5 = @"kTypeKickboxing";
          goto LABEL_82;
        case 15255:
          CFStringRef v5 = @"kTypeGolfing";
          goto LABEL_82;
        case 15670:
          CFStringRef v5 = @"kTypeTaiChi";
          goto LABEL_82;
      }
    }
LABEL_81:
    CFStringRef v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_activityType];
    goto LABEL_82;
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
          goto LABEL_82;
        }
        if (activityType == 2022)
        {
          CFStringRef v5 = @"kTypeFunctionalStrength";
          goto LABEL_82;
        }
      }
      else
      {
        if (activityType == 100)
        {
          CFStringRef v5 = @"kTypeCyclingLeg";
          goto LABEL_82;
        }
        if (activityType == 2010)
        {
          CFStringRef v5 = @"kTypeStationaryCycling";
          goto LABEL_82;
        }
      }
    }
    else if (activityType > 55)
    {
      if (activityType == 56)
      {
        CFStringRef v5 = @"kTypeDrivingOther";
        goto LABEL_82;
      }
      if (activityType == 63)
      {
        CFStringRef v5 = @"kTypeMultiSportTransition";
        goto LABEL_82;
      }
    }
    else
    {
      if (activityType == 41)
      {
        CFStringRef v5 = @"kTypeWalkingSlow";
        goto LABEL_82;
      }
      if (activityType == 52)
      {
        CFStringRef v5 = @"kTypeVehicularInHand";
        goto LABEL_82;
      }
    }
    goto LABEL_81;
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
      goto LABEL_81;
  }
LABEL_82:
  [v3 setObject:v5 forKey:@"activityType"];
  [v3 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isStanding)] forKey:@"isStanding"];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithDouble:self->_mets] forKey:@"mets"];
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(float *)&double v6 = self->_basalMETs;
    [v3 setObject:[NSNumber numberWithFloat:v6] forKey:@"basalMETs"];
  }
  [v3 setObject:[+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_natalies)] forKey:@"natalies"];
  char v8 = (char)self->_has;
  if ((v8 & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_88;
    }
LABEL_92:
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp)] forKey:@"timestamp"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_90;
    }
    goto LABEL_89;
  }
  [v3 setObject:[+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_basalNatalies)] forKey:@"basalNatalies"];
  char v8 = (char)self->_has;
  if ((v8 & 8) != 0) {
    goto LABEL_92;
  }
LABEL_88:
  if ((v8 & 2) != 0) {
LABEL_89:
  }
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_duration)] forKey:@"duration"];
LABEL_90:
  [v3 setObject:[NSNumber numberWithBool:self->_regularEntry] forKey:@"regularEntry"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_101114648((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0) {
    PBDataWriterWriteFloatField();
  }
  PBDataWriterWriteInt64Field();
  char v5 = (char)self->_has;
  if (v5)
  {
    PBDataWriterWriteInt64Field();
    char v5 = (char)self->_has;
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_10:
  }
    PBDataWriterWriteDoubleField();
LABEL_11:

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)a3 + 14) = self->_recordId;
    *((unsigned char *)a3 + 64) |= 0x20u;
  }
  *((_DWORD *)a3 + 12) = self->_activityType;
  *((unsigned char *)a3 + 60) = self->_isStanding;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = *(void *)&self->_mets;
    *((unsigned char *)a3 + 64) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 13) = LODWORD(self->_basalMETs);
    *((unsigned char *)a3 + 64) |= 0x10u;
  }
  *((void *)a3 + 4) = self->_natalies;
  char v4 = (char)self->_has;
  if ((v4 & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_9;
    }
LABEL_13:
    *((void *)a3 + 5) = *(void *)&self->_timestamp;
    *((unsigned char *)a3 + 64) |= 8u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  *((void *)a3 + 1) = self->_basalNatalies;
  *((unsigned char *)a3 + 64) |= 1u;
  char v4 = (char)self->_has;
  if ((v4 & 8) != 0) {
    goto LABEL_13;
  }
LABEL_9:
  if ((v4 & 2) != 0)
  {
LABEL_10:
    *((void *)a3 + 2) = *(void *)&self->_duration;
    *((unsigned char *)a3 + 64) |= 2u;
  }
LABEL_11:
  *((unsigned char *)a3 + 61) = self->_regularEntry;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)result + 14) = self->_recordId;
    *((unsigned char *)result + 64) |= 0x20u;
  }
  *((_DWORD *)result + 12) = self->_activityType;
  *((unsigned char *)result + 60) = self->_isStanding;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = *(void *)&self->_mets;
    *((unsigned char *)result + 64) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)result + 13) = LODWORD(self->_basalMETs);
    *((unsigned char *)result + 64) |= 0x10u;
  }
  *((void *)result + 4) = self->_natalies;
  char v6 = (char)self->_has;
  if ((v6 & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_9;
    }
LABEL_13:
    *((void *)result + 5) = *(void *)&self->_timestamp;
    *((unsigned char *)result + 64) |= 8u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  *((void *)result + 1) = self->_basalNatalies;
  *((unsigned char *)result + 64) |= 1u;
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0) {
    goto LABEL_13;
  }
LABEL_9:
  if ((v6 & 2) != 0)
  {
LABEL_10:
    *((void *)result + 2) = *(void *)&self->_duration;
    *((unsigned char *)result + 64) |= 2u;
  }
LABEL_11:
  *((unsigned char *)result + 61) = self->_regularEntry;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)a3 + 64) & 0x20) == 0 || self->_recordId != *((_DWORD *)a3 + 14)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)a3 + 64) & 0x20) != 0)
  {
    goto LABEL_40;
  }
  if (self->_activityType != *((_DWORD *)a3 + 12)) {
    goto LABEL_40;
  }
  if (self->_isStanding)
  {
    if (!*((unsigned char *)a3 + 60)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)a3 + 60))
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 64) & 4) == 0 || self->_mets != *((double *)a3 + 3)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)a3 + 64) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 64) & 0x10) == 0 || self->_basalMETs != *((float *)a3 + 13)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)a3 + 64) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  if (self->_natalies != *((void *)a3 + 4))
  {
LABEL_40:
    LOBYTE(v5) = 0;
    return v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 64) & 1) == 0 || self->_basalNatalies != *((void *)a3 + 1)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)a3 + 64))
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 64) & 8) == 0 || self->_timestamp != *((double *)a3 + 5)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)a3 + 64) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 64) & 2) == 0 || self->_duration != *((double *)a3 + 2)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)a3 + 64) & 2) != 0)
  {
    goto LABEL_40;
  }
  int v6 = *((unsigned __int8 *)a3 + 61);
  if (self->_regularEntry) {
    LOBYTE(v5) = v6 != 0;
  }
  else {
    LOBYTE(v5) = v6 == 0;
  }
  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    uint64_t v29 = 2654435761 * self->_recordId;
  }
  else {
    uint64_t v29 = 0;
  }
  uint64_t activityType = self->_activityType;
  BOOL isStanding = self->_isStanding;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    double mets = self->_mets;
    double v8 = -mets;
    if (mets >= 0.0) {
      double v8 = self->_mets;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 0x10) != 0)
  {
    float basalMETs = self->_basalMETs;
    float v13 = -basalMETs;
    if (basalMETs >= 0.0) {
      float v13 = self->_basalMETs;
    }
    float v14 = floorf(v13 + 0.5);
    float v15 = (float)(v13 - v14) * 1.8447e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmodf(v14, 1.8447e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabsf(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if (has) {
    uint64_t v16 = 2654435761 * self->_basalNatalies;
  }
  else {
    uint64_t v16 = 0;
  }
  int64_t natalies = self->_natalies;
  if ((has & 8) != 0)
  {
    double timestamp = self->_timestamp;
    double v20 = -timestamp;
    if (timestamp >= 0.0) {
      double v20 = self->_timestamp;
    }
    long double v21 = floor(v20 + 0.5);
    double v22 = (v20 - v21) * 1.84467441e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v18 += (unint64_t)v22;
      }
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  if ((has & 2) != 0)
  {
    double duration = self->_duration;
    double v25 = -duration;
    if (duration >= 0.0) {
      double v25 = self->_duration;
    }
    long double v26 = floor(v25 + 0.5);
    double v27 = (v25 - v26) * 1.84467441e19;
    unint64_t v23 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
    if (v27 >= 0.0)
    {
      if (v27 > 0.0) {
        v23 += (unint64_t)v27;
      }
    }
    else
    {
      v23 -= (unint64_t)fabs(v27);
    }
  }
  else
  {
    unint64_t v23 = 0;
  }
  return (2654435761 * activityType) ^ v29 ^ (2654435761 * isStanding) ^ v6 ^ v11 ^ (2654435761 * natalies) ^ v16 ^ v18 ^ v23 ^ (2654435761 * self->_regularEntry);
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 64) & 0x20) != 0)
  {
    self->_recordId = *((_DWORD *)a3 + 14);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  self->_uint64_t activityType = *((_DWORD *)a3 + 12);
  self->_BOOL isStanding = *((unsigned char *)a3 + 60);
  char v3 = *((unsigned char *)a3 + 64);
  if ((v3 & 4) != 0)
  {
    self->_double mets = *((double *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 64);
  }
  if ((v3 & 0x10) != 0)
  {
    self->_float basalMETs = *((float *)a3 + 13);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  self->_int64_t natalies = *((void *)a3 + 4);
  char v4 = *((unsigned char *)a3 + 64);
  if ((v4 & 1) == 0)
  {
    if ((*((unsigned char *)a3 + 64) & 8) == 0) {
      goto LABEL_9;
    }
LABEL_13:
    self->_double timestamp = *((double *)a3 + 5);
    *(unsigned char *)&self->_has |= 8u;
    if ((*((unsigned char *)a3 + 64) & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  self->_basalNatalies = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v4 = *((unsigned char *)a3 + 64);
  if ((v4 & 8) != 0) {
    goto LABEL_13;
  }
LABEL_9:
  if ((v4 & 2) != 0)
  {
LABEL_10:
    self->_double duration = *((double *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_11:
  self->_regularEntry = *((unsigned char *)a3 + 61);
}

- (int)recordId
{
  return self->_recordId;
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

- (double)mets
{
  return self->_mets;
}

- (float)basalMETs
{
  return self->_basalMETs;
}

- (int64_t)natalies
{
  return self->_natalies;
}

- (void)setNatalies:(int64_t)a3
{
  self->_int64_t natalies = a3;
}

- (int64_t)basalNatalies
{
  return self->_basalNatalies;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)regularEntry
{
  return self->_regularEntry;
}

- (void)setRegularEntry:(BOOL)a3
{
  self->_regularEntry = a3;
}

@end