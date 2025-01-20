@interface AWDMETRICSCellularPowerLogRATChangeEvent
- (BOOL)hasEvent;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventAsString:(int)a3;
- (int)StringAsEvent:(id)a3;
- (int)event;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEvent:(int)a3;
- (void)setHasEvent:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMETRICSCellularPowerLogRATChangeEvent

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

- (int)event
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_event;
  }
  else {
    return 0;
  }
}

- (void)setEvent:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_event = a3;
}

- (void)setHasEvent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEvent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)eventAsString:(int)a3
{
  if (a3 >= 0x30)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_265442F38[a3];
  }
  return v3;
}

- (int)StringAsEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"HDR_ALMP"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CDMA_TO_LTE_START"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GSM_TO_WCDMA_START"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GSM_TO_LTE_START"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WCDMA_TO_GSM_START"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"WCDMA_TO_LTE_START"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LTE_TO_HYBRID_START"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LTE_TO_1X_START"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LTE_TO_GSM_START"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"LTE_TO_WCDMA_START"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"GERAN_TO_GSM_START"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"GERAN_TO_WCDMA_START"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"GERAN_TO_LTE_START"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"DS_GERAN_GRR_START"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"DS_GSM_TO_LTE_START"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"DS_GSM_TO_WCDMA_START"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"CDMA_TO_LTE_SUCCESS"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"GSM_TO_WCDMA_SUCCESS"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"GSM_TO_LTE_SUCCESS"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"WCDMA_TO_GSM_SUCCESS"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"WCDMA_TO_LTE_SUCCESS"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"LTE_TO_HYBRID_SUCCESS"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"LTE_TO_1X_SUCCESS"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"LTE_TO_GSM_SUCCESS"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"LTE_TO_WCDMA_SUCCESS"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"GERAN_SUCCESS"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"DS_GERAN_GRR_SUCCESS"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"DS_GSM_TO_LTE_SUCCESS"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"DS_GSM_TO_WCDMA_SUCCESS"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"CDMA_TO_LTE_FAIL"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"GSM_TO_WCDMA_FAIL"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"GSM_TO_LTE_FAIL"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"WCDMA_TO_GSM_FAIL"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"WCDMA_TO_LTE_FAIL"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"LTE_TO_HYBRID_FAIL"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"LTE_TO_1X_FAIL"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"LTE_TO_GSM_FAIL"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"LTE_TO_WCDMA_FAIL"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"GERAN_FAIL"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"DS_GERAN_GRR_FAIL"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"DS_GSM_TO_LTE_FAIL"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"DS_GSM_TO_WCDMA_FAIL"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"NR_TO_LTE_START"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"NR_TO_LTE_SUCCESS"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"NR_TO_LTE_FAIL"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"LTE_TO_NR_START"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"LTE_TO_NR_SUCCESS"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"LTE_TO_NR_FAIL"])
  {
    int v4 = 47;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDMETRICSCellularPowerLogRATChangeEvent;
  int v4 = [(AWDMETRICSCellularPowerLogRATChangeEvent *)&v8 description];
  v5 = [(AWDMETRICSCellularPowerLogRATChangeEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t event = self->_event;
  if (event >= 0x30)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_event);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_265442F38[event];
  }
  [v3 setObject:v9 forKey:@"event"];

  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  v5 = [NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v5 forKey:@"subs_id"];

LABEL_5:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSCellularPowerLogRATChangeEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 4) = self->_event;
  *((unsigned char *)v4 + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 5) = self->_subsId;
    *((unsigned char *)v4 + 24) |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_event;
  *((unsigned char *)result + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 5) = self->_subsId;
  *((unsigned char *)result + 24) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_event != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_subsId != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  unint64_t v2 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_event;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_subsId;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t event = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
LABEL_4:
    self->_subsId = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end