@interface AWDCoreRoutineFMCCarParkedInstance
- (BOOL)hasHorizontalAccuracy;
- (BOOL)hasLocationType;
- (BOOL)hasParkingId;
- (BOOL)hasQualityIndicator;
- (BOOL)hasTimestamp;
- (BOOL)hasTriggerTypes;
- (BOOL)hasUserAssistanceRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)userAssistanceRequired;
- (NSString)parkingId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)horizontalAccuracy;
- (int)locationType;
- (int)qualityIndicator;
- (int)triggerTypes;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasHorizontalAccuracy:(BOOL)a3;
- (void)setHasLocationType:(BOOL)a3;
- (void)setHasQualityIndicator:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTriggerTypes:(BOOL)a3;
- (void)setHasUserAssistanceRequired:(BOOL)a3;
- (void)setHorizontalAccuracy:(int)a3;
- (void)setLocationType:(int)a3;
- (void)setParkingId:(id)a3;
- (void)setQualityIndicator:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerTypes:(int)a3;
- (void)setUserAssistanceRequired:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineFMCCarParkedInstance

- (void)dealloc
{
  [(AWDCoreRoutineFMCCarParkedInstance *)self setParkingId:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineFMCCarParkedInstance;
  [(AWDCoreRoutineFMCCarParkedInstance *)&v3 dealloc];
}

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

- (BOOL)hasParkingId
{
  return self->_parkingId != 0;
}

- (void)setTriggerTypes:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_triggerTypes = a3;
}

- (void)setHasTriggerTypes:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTriggerTypes
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setUserAssistanceRequired:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_userAssistanceRequired = a3;
}

- (void)setHasUserAssistanceRequired:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUserAssistanceRequired
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHorizontalAccuracy:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_horizontalAccuracy = a3;
}

- (void)setHasHorizontalAccuracy:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHorizontalAccuracy
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setQualityIndicator:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_qualityIndicator = a3;
}

- (void)setHasQualityIndicator:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasQualityIndicator
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLocationType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLocationType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineFMCCarParkedInstance;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineFMCCarParkedInstance description](&v3, sel_description), -[AWDCoreRoutineFMCCarParkedInstance dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  parkingId = self->_parkingId;
  if (parkingId) {
    [v3 setObject:parkingId forKey:@"parkingId"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_triggerTypes] forKey:@"triggerTypes"];
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_userAssistanceRequired] forKey:@"userAssistanceRequired"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    [v3 setObject:[NSNumber numberWithInt:self->_qualityIndicator] forKey:@"qualityIndicator"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_10;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithInt:self->_horizontalAccuracy] forKey:@"horizontalAccuracy"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_15;
  }
LABEL_9:
  if ((has & 4) != 0) {
LABEL_10:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_locationType] forKey:@"locationType"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineFMCCarParkedInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_parkingId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
LABEL_14:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_14;
  }
LABEL_9:
  if ((has & 4) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 44) |= 1u;
  }
  if (self->_parkingId) {
    [a3 setParkingId:];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 9) = self->_triggerTypes;
    *((unsigned char *)a3 + 44) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)a3 + 40) = self->_userAssistanceRequired;
  *((unsigned char *)a3 + 44) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 4) = self->_horizontalAccuracy;
  *((unsigned char *)a3 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      return;
    }
    goto LABEL_10;
  }
LABEL_15:
  *((_DWORD *)a3 + 8) = self->_qualityIndicator;
  *((unsigned char *)a3 + 44) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 5) = self->_locationType;
  *((unsigned char *)a3 + 44) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 44) |= 1u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_parkingId copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 36) = self->_triggerTypes;
    *(unsigned char *)(v6 + 44) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v6 + 40) = self->_userAssistanceRequired;
  *(unsigned char *)(v6 + 44) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    *(_DWORD *)(v6 + 32) = self->_qualityIndicator;
    *(unsigned char *)(v6 + 44) |= 8u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v6;
    }
    goto LABEL_8;
  }
LABEL_12:
  *(_DWORD *)(v6 + 16) = self->_horizontalAccuracy;
  *(unsigned char *)(v6 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_13;
  }
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    *(_DWORD *)(v6 + 20) = self->_locationType;
    *(unsigned char *)(v6 + 44) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_37;
    }
  }
  else if (*((unsigned char *)a3 + 44))
  {
    goto LABEL_37;
  }
  parkingId = self->_parkingId;
  if ((unint64_t)parkingId | *((void *)a3 + 3))
  {
    int v5 = -[NSString isEqual:](parkingId, "isEqual:");
    if (!v5) {
      return v5;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 0x10) == 0 || self->_triggerTypes != *((_DWORD *)a3 + 9)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 0x10) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 0x20) == 0)
  {
    if ((*((unsigned char *)a3 + 44) & 0x20) != 0) {
      goto LABEL_37;
    }
    goto LABEL_23;
  }
  if ((*((unsigned char *)a3 + 44) & 0x20) == 0) {
    goto LABEL_37;
  }
  if (self->_userAssistanceRequired)
  {
    if (!*((unsigned char *)a3 + 40)) {
      goto LABEL_37;
    }
    goto LABEL_23;
  }
  if (*((unsigned char *)a3 + 40))
  {
LABEL_37:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_23:
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_horizontalAccuracy != *((_DWORD *)a3 + 4)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 2) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 8) == 0 || self->_qualityIndicator != *((_DWORD *)a3 + 8)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 8) != 0)
  {
    goto LABEL_37;
  }
  LOBYTE(v5) = (*((unsigned char *)a3 + 44) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_locationType != *((_DWORD *)a3 + 5)) {
      goto LABEL_37;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_parkingId hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v5 = 2654435761 * self->_triggerTypes;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_userAssistanceRequired;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_horizontalAccuracy;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_12:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_qualityIndicator;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_locationType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 44))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDCoreRoutineFMCCarParkedInstance setParkingId:](self, "setParkingId:");
  }
  char v5 = *((unsigned char *)a3 + 44);
  if ((v5 & 0x10) != 0)
  {
    self->_triggerTypes = *((_DWORD *)a3 + 9);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)a3 + 44);
    if ((v5 & 0x20) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 0x20) == 0)
  {
    goto LABEL_7;
  }
  self->_userAssistanceRequired = *((unsigned char *)a3 + 40);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)a3 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_horizontalAccuracy = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)a3 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      return;
    }
    goto LABEL_10;
  }
LABEL_15:
  self->_qualityIndicator = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 44) & 4) == 0) {
    return;
  }
LABEL_10:
  self->_locationType = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)parkingId
{
  return self->_parkingId;
}

- (void)setParkingId:(id)a3
{
}

- (int)triggerTypes
{
  return self->_triggerTypes;
}

- (BOOL)userAssistanceRequired
{
  return self->_userAssistanceRequired;
}

- (int)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (int)qualityIndicator
{
  return self->_qualityIndicator;
}

- (int)locationType
{
  return self->_locationType;
}

@end