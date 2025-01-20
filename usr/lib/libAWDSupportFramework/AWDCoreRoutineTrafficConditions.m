@interface AWDCoreRoutineTrafficConditions
- (BOOL)hasPrecisionRecall;
- (BOOL)hasPredictedLocationOfInterest;
- (BOOL)hasTimestamp;
- (BOOL)hasTrafficDensity;
- (BOOL)hasVehicleConnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)predictedLocationOfInterest;
- (BOOL)readFrom:(id)a3;
- (BOOL)vehicleConnected;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)precisionRecallAsString:(int)a3;
- (id)trafficDensityAsString:(int)a3;
- (int)StringAsPrecisionRecall:(id)a3;
- (int)StringAsTrafficDensity:(id)a3;
- (int)precisionRecall;
- (int)trafficDensity;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPrecisionRecall:(BOOL)a3;
- (void)setHasPredictedLocationOfInterest:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTrafficDensity:(BOOL)a3;
- (void)setHasVehicleConnected:(BOOL)a3;
- (void)setPrecisionRecall:(int)a3;
- (void)setPredictedLocationOfInterest:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTrafficDensity:(int)a3;
- (void)setVehicleConnected:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineTrafficConditions

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setVehicleConnected:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_vehicleConnected = a3;
}

- (void)setHasVehicleConnected:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVehicleConnected
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPredictedLocationOfInterest:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_predictedLocationOfInterest = a3;
}

- (void)setHasPredictedLocationOfInterest:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPredictedLocationOfInterest
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)trafficDensity
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_trafficDensity;
  }
  else {
    return 0;
  }
}

- (void)setTrafficDensity:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_trafficDensity = a3;
}

- (void)setHasTrafficDensity:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTrafficDensity
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)trafficDensityAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9678[a3];
  }
}

- (int)StringAsTrafficDensity:(id)a3
{
  if ([a3 isEqualToString:@"CoreRoutineTrafficDensityUnknown"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"CoreRoutineTrafficDensityLight"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"CoreRoutineTrafficDensityNormal"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"CoreRoutineTrafficDensityHeavy"]) {
    return 3;
  }
  return 0;
}

- (int)precisionRecall
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_precisionRecall;
  }
  else {
    return 0;
  }
}

- (void)setPrecisionRecall:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_precisionRecall = a3;
}

- (void)setHasPrecisionRecall:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPrecisionRecall
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)precisionRecallAsString:(int)a3
{
  if (a3 >= 5) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9698[a3];
  }
}

- (int)StringAsPrecisionRecall:(id)a3
{
  if ([a3 isEqualToString:@"CoreRoutinePrecisionRecallUnknown"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"CoreRoutinePrecisionRecallTruePositive"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"CoreRoutinePrecisionRecallFalsePositive"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"CoreRoutinePrecisionRecallTrueNegative"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"CoreRoutinePrecisionRecallFalseNegative"]) {
    return 4;
  }
  return 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineTrafficConditions;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineTrafficConditions description](&v3, sel_description), -[AWDCoreRoutineTrafficConditions dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_vehicleConnected] forKey:@"vehicleConnected"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  [v3 setObject:[NSNumber numberWithBool:self->_predictedLocationOfInterest] forKey:@"predictedLocationOfInterest"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return v3;
    }
    goto LABEL_14;
  }
LABEL_10:
  uint64_t trafficDensity = self->_trafficDensity;
  if (trafficDensity >= 4) {
    v6 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_trafficDensity];
  }
  else {
    v6 = off_2641B9678[trafficDensity];
  }
  [v3 setObject:v6 forKey:@"trafficDensity"];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_14:
    uint64_t precisionRecall = self->_precisionRecall;
    if (precisionRecall >= 5) {
      v8 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_precisionRecall];
    }
    else {
      v8 = off_2641B9698[precisionRecall];
    }
    [v3 setObject:v8 forKey:@"precisionRecall"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineTrafficConditionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_9:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 2) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)a3 + 25) = self->_vehicleConnected;
  *((unsigned char *)a3 + 28) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  *((unsigned char *)a3 + 24) = self->_predictedLocationOfInterest;
  *((unsigned char *)a3 + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return;
    }
LABEL_11:
    *((_DWORD *)a3 + 4) = self->_precisionRecall;
    *((unsigned char *)a3 + 28) |= 2u;
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 5) = self->_trafficDensity;
  *((unsigned char *)a3 + 28) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 25) = self->_vehicleConnected;
  *((unsigned char *)result + 28) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((unsigned char *)result + 24) = self->_predictedLocationOfInterest;
  *((unsigned char *)result + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_trafficDensity;
  *((unsigned char *)result + 28) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 4) = self->_precisionRecall;
  *((unsigned char *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)a3 + 28))
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 0x10) == 0) {
      goto LABEL_32;
    }
    if (self->_vehicleConnected)
    {
      if (!*((unsigned char *)a3 + 25)) {
        goto LABEL_32;
      }
    }
    else if (*((unsigned char *)a3 + 25))
    {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    if ((*((unsigned char *)a3 + 28) & 8) != 0) {
      goto LABEL_32;
    }
    goto LABEL_23;
  }
  if ((*((unsigned char *)a3 + 28) & 8) == 0) {
    goto LABEL_32;
  }
  if (self->_predictedLocationOfInterest)
  {
    if (!*((unsigned char *)a3 + 24)) {
      goto LABEL_32;
    }
    goto LABEL_23;
  }
  if (*((unsigned char *)a3 + 24))
  {
LABEL_32:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_23:
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 4) == 0 || self->_trafficDensity != *((_DWORD *)a3 + 5)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 4) != 0)
  {
    goto LABEL_32;
  }
  LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_precisionRecall != *((_DWORD *)a3 + 4)) {
      goto LABEL_32;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_vehicleConnected;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_predictedLocationOfInterest;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_trafficDensity;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_precisionRecall;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 28);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 28);
    if ((v3 & 0x10) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_vehicleConnected = *((unsigned char *)a3 + 25);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  self->_predictedLocationOfInterest = *((unsigned char *)a3 + 24);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_11:
    self->_uint64_t precisionRecall = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
LABEL_10:
  self->_uint64_t trafficDensity = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 28) & 2) != 0) {
    goto LABEL_11;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)vehicleConnected
{
  return self->_vehicleConnected;
}

- (BOOL)predictedLocationOfInterest
{
  return self->_predictedLocationOfInterest;
}

@end