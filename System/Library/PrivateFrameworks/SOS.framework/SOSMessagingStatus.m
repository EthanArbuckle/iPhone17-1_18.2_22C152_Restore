@interface SOSMessagingStatus
- (BOOL)hasFlowState;
- (BOOL)hasIsPairedDeviceStatus;
- (BOOL)hasResolution;
- (BOOL)hasTimeOfDetection;
- (BOOL)hasTimeOfResolution;
- (BOOL)hasTrigger;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPairedDeviceStatus;
- (BOOL)readFrom:(id)a3;
- (NSString)uuid;
- (SOSMessagingStatus)initWithSOSStatus:(id)a3;
- (SOSStatus)sosStatus;
- (double)timeOfDetection;
- (double)timeOfResolution;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)flowState;
- (int)resolution;
- (int)trigger;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFlowState:(int)a3;
- (void)setHasFlowState:(BOOL)a3;
- (void)setHasIsPairedDeviceStatus:(BOOL)a3;
- (void)setHasResolution:(BOOL)a3;
- (void)setHasTimeOfDetection:(BOOL)a3;
- (void)setHasTimeOfResolution:(BOOL)a3;
- (void)setHasTrigger:(BOOL)a3;
- (void)setIsPairedDeviceStatus:(BOOL)a3;
- (void)setResolution:(int)a3;
- (void)setTimeOfDetection:(double)a3;
- (void)setTimeOfResolution:(double)a3;
- (void)setTrigger:(int)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SOSMessagingStatus

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setTrigger:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_trigger = a3;
}

- (void)setHasTrigger:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTrigger
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTimeOfDetection:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeOfDetection = a3;
}

- (void)setHasTimeOfDetection:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeOfDetection
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimeOfResolution:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timeOfResolution = a3;
}

- (void)setHasTimeOfResolution:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimeOfResolution
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setResolution:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_resolution = a3;
}

- (void)setHasResolution:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasResolution
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setFlowState:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_flowState = a3;
}

- (void)setHasFlowState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFlowState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsPairedDeviceStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isPairedDeviceStatus = a3;
}

- (void)setHasIsPairedDeviceStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsPairedDeviceStatus
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SOSMessagingStatus;
  v4 = [(SOSMessagingStatus *)&v8 description];
  v5 = [(SOSMessagingStatus *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v9 = [NSNumber numberWithInt:self->_trigger];
    [v4 setObject:v9 forKey:@"trigger"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  v10 = [NSNumber numberWithDouble:self->_timeOfDetection];
  [v4 setObject:v10 forKey:@"timeOfDetection"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  v11 = [NSNumber numberWithDouble:self->_timeOfResolution];
  [v4 setObject:v11 forKey:@"timeOfResolution"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  v12 = [NSNumber numberWithInt:self->_resolution];
  [v4 setObject:v12 forKey:@"resolution"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  v13 = [NSNumber numberWithInt:self->_flowState];
  [v4 setObject:v13 forKey:@"flowState"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_9:
    v7 = [NSNumber numberWithBool:self->_isPairedDeviceStatus];
    [v4 setObject:v7 forKey:@"isPairedDeviceStatus"];
  }
LABEL_10:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SOSMessagingStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_9:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_10:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_uuid)
  {
    id v6 = v4;
    objc_msgSend(v4, "setUuid:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_trigger;
    *((unsigned char *)v4 + 52) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 1) = *(void *)&self->_timeOfDetection;
  *((unsigned char *)v4 + 52) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)v4 + 2) = *(void *)&self->_timeOfResolution;
  *((unsigned char *)v4 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 7) = self->_resolution;
  *((unsigned char *)v4 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)v4 + 6) = self->_flowState;
  *((unsigned char *)v4 + 52) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_9:
    *((unsigned char *)v4 + 48) = self->_isPairedDeviceStatus;
    *((unsigned char *)v4 + 52) |= 0x20u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuid copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_trigger;
    *(unsigned char *)(v5 + 52) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 8) = self->_timeOfDetection;
  *(unsigned char *)(v5 + 52) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *(double *)(v5 + 16) = self->_timeOfResolution;
  *(unsigned char *)(v5 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    *(_DWORD *)(v5 + 24) = self->_flowState;
    *(unsigned char *)(v5 + 52) |= 4u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return (id)v5;
    }
    goto LABEL_7;
  }
LABEL_12:
  *(_DWORD *)(v5 + 28) = self->_resolution;
  *(unsigned char *)(v5 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    *(unsigned char *)(v5 + 48) = self->_isPairedDeviceStatus;
    *(unsigned char *)(v5 + 52) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x10) == 0 || self->_trigger != *((_DWORD *)v4 + 8)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_timeOfDetection != *((double *)v4 + 1)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_timeOfResolution != *((double *)v4 + 2)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0 || self->_resolution != *((_DWORD *)v4 + 7)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_flowState != *((_DWORD *)v4 + 6)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_31;
  }
  BOOL v6 = (*((unsigned char *)v4 + 52) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x20) == 0)
    {
LABEL_31:
      BOOL v6 = 0;
      goto LABEL_32;
    }
    if (self->_isPairedDeviceStatus)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_31;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_31;
    }
    BOOL v6 = 1;
  }
LABEL_32:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuid hash];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v5 = 2654435761 * self->_trigger;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double timeOfDetection = self->_timeOfDetection;
  double v7 = -timeOfDetection;
  if (timeOfDetection >= 0.0) {
    double v7 = self->_timeOfDetection;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((has & 2) != 0)
  {
    double timeOfResolution = self->_timeOfResolution;
    double v13 = -timeOfResolution;
    if (timeOfResolution >= 0.0) {
      double v13 = self->_timeOfResolution;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((has & 8) == 0)
  {
    uint64_t v16 = 0;
    if ((has & 4) != 0) {
      goto LABEL_21;
    }
LABEL_24:
    uint64_t v17 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_22;
    }
LABEL_25:
    uint64_t v18 = 0;
    return v5 ^ v3 ^ v10 ^ v11 ^ v16 ^ v17 ^ v18;
  }
  uint64_t v16 = 2654435761 * self->_resolution;
  if ((has & 4) == 0) {
    goto LABEL_24;
  }
LABEL_21:
  uint64_t v17 = 2654435761 * self->_flowState;
  if ((has & 0x20) == 0) {
    goto LABEL_25;
  }
LABEL_22:
  uint64_t v18 = 2654435761 * self->_isPairedDeviceStatus;
  return v5 ^ v3 ^ v10 ^ v11 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 5))
  {
    id v6 = v4;
    -[SOSMessagingStatus setUuid:](self, "setUuid:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 0x10) != 0)
  {
    self->_trigger = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 52);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_double timeOfDetection = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_double timeOfResolution = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_resolution = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  self->_flowState = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 52) & 0x20) != 0)
  {
LABEL_9:
    self->_isPairedDeviceStatus = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_10:
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (int)trigger
{
  return self->_trigger;
}

- (double)timeOfDetection
{
  return self->_timeOfDetection;
}

- (double)timeOfResolution
{
  return self->_timeOfResolution;
}

- (int)resolution
{
  return self->_resolution;
}

- (int)flowState
{
  return self->_flowState;
}

- (BOOL)isPairedDeviceStatus
{
  return self->_isPairedDeviceStatus;
}

- (void).cxx_destruct
{
}

- (SOSMessagingStatus)initWithSOSStatus:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)SOSMessagingStatus;
    char v5 = [(SOSMessagingStatus *)&v13 init];
    if (v5)
    {
      id v6 = [v4 uuid];
      double v7 = [v6 UUIDString];
      [(SOSMessagingStatus *)v5 setUuid:v7];

      -[SOSMessagingStatus setTrigger:](v5, "setTrigger:", [v4 trigger]);
      long double v8 = [v4 timeOfDetection];
      [v8 timeIntervalSince1970];
      -[SOSMessagingStatus setTimeOfDetection:](v5, "setTimeOfDetection:");

      double v9 = [v4 timeOfResolution];
      [v9 timeIntervalSince1970];
      -[SOSMessagingStatus setTimeOfResolution:](v5, "setTimeOfResolution:");

      -[SOSMessagingStatus setResolution:](v5, "setResolution:", [v4 resolution]);
      -[SOSMessagingStatus setFlowState:](v5, "setFlowState:", [v4 flowState]);
      -[SOSMessagingStatus setIsPairedDeviceStatus:](v5, "setIsPairedDeviceStatus:", [v4 isPairedDeviceStatus]);
    }
    self = v5;
    unint64_t v10 = self;
  }
  else
  {
    unint64_t v11 = sos_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SOSMessagingStatus(Additions) initWithSOSStatus:]();
    }

    unint64_t v10 = 0;
  }

  return v10;
}

- (SOSStatus)sosStatus
{
  NSUInteger v3 = objc_alloc_init(SOSStatus);
  if ([(SOSMessagingStatus *)self hasUuid])
  {
    if ([(SOSMessagingStatus *)self hasTrigger])
    {
      if ([(SOSMessagingStatus *)self hasTimeOfDetection])
      {
        id v4 = objc_alloc(MEMORY[0x1E4F29128]);
        char v5 = [(SOSMessagingStatus *)self uuid];
        id v6 = (void *)[v4 initWithUUIDString:v5];
        [(SOSStatus *)v3 setUuid:v6];

        [(SOSStatus *)v3 setTrigger:[(SOSMessagingStatus *)self trigger]];
        id v7 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        [(SOSMessagingStatus *)self timeOfDetection];
        long double v8 = objc_msgSend(v7, "initWithTimeIntervalSince1970:");
        [(SOSStatus *)v3 setTimeOfDetection:v8];

        if ([(SOSMessagingStatus *)self hasTimeOfResolution])
        {
          id v9 = objc_alloc(MEMORY[0x1E4F1C9C8]);
          [(SOSMessagingStatus *)self timeOfResolution];
          unint64_t v10 = objc_msgSend(v9, "initWithTimeIntervalSince1970:");
          [(SOSStatus *)v3 setTimeOfResolution:v10];
        }
        else
        {
          [(SOSStatus *)v3 setTimeOfResolution:0];
        }
        if ([(SOSMessagingStatus *)self hasResolution]) {
          uint64_t v14 = [(SOSMessagingStatus *)self resolution];
        }
        else {
          uint64_t v14 = 0;
        }
        [(SOSStatus *)v3 setResolution:v14];
        if ([(SOSMessagingStatus *)self hasFlowState]) {
          uint64_t v15 = [(SOSMessagingStatus *)self flowState];
        }
        else {
          uint64_t v15 = 0;
        }
        [(SOSStatus *)v3 setFlowState:v15];
        [(SOSStatus *)v3 setIsPairedDeviceStatus:[(SOSMessagingStatus *)self isPairedDeviceStatus]];
        v12 = (void *)[(SOSStatus *)v3 copy];
        goto LABEL_13;
      }
      unint64_t v11 = sos_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SOSMessagingStatus(Additions) sosStatus]();
      }
    }
    else
    {
      unint64_t v11 = sos_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SOSMessagingStatus(Additions) sosStatus]();
      }
    }
  }
  else
  {
    unint64_t v11 = sos_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SOSMessagingStatus(Additions) sosStatus]();
    }
  }

  v12 = 0;
LABEL_13:

  return (SOSStatus *)v12;
}

@end