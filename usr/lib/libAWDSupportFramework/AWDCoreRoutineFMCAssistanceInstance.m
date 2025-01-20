@interface AWDCoreRoutineFMCAssistanceInstance
- (BOOL)hasAssistanceType;
- (BOOL)hasAssistanceValue;
- (BOOL)hasParkingId;
- (BOOL)hasTimestamp;
- (BOOL)hasUiPlacement;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)parkingId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)assistanceType;
- (int)assistanceValue;
- (int)uiPlacement;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAssistanceType:(int)a3;
- (void)setAssistanceValue:(int)a3;
- (void)setHasAssistanceType:(BOOL)a3;
- (void)setHasAssistanceValue:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUiPlacement:(BOOL)a3;
- (void)setParkingId:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUiPlacement:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineFMCAssistanceInstance

- (void)dealloc
{
  [(AWDCoreRoutineFMCAssistanceInstance *)self setParkingId:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineFMCAssistanceInstance;
  [(AWDCoreRoutineFMCAssistanceInstance *)&v3 dealloc];
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

- (void)setAssistanceType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_assistanceType = a3;
}

- (void)setHasAssistanceType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAssistanceType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAssistanceValue:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_assistanceValue = a3;
}

- (void)setHasAssistanceValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAssistanceValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setUiPlacement:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uiPlacement = a3;
}

- (void)setHasUiPlacement:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUiPlacement
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineFMCAssistanceInstance;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineFMCAssistanceInstance description](&v3, sel_description), -[AWDCoreRoutineFMCAssistanceInstance dictionaryRepresentation](self, "dictionaryRepresentation")];
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
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    [v3 setObject:[NSNumber numberWithInt:self->_assistanceValue] forKey:@"assistanceValue"];
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return v3;
    }
    goto LABEL_8;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_assistanceType] forKey:@"assistanceType"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if ((has & 8) != 0) {
LABEL_8:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_uiPlacement] forKey:@"uiPlacement"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineFMCAssistanceInstanceReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_7;
    }
LABEL_10:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return;
    }
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_10;
  }
LABEL_7:
  if ((has & 8) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 36) |= 1u;
  }
  if (self->_parkingId) {
    [a3 setParkingId:];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_assistanceType;
    *((unsigned char *)a3 + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        return;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 5) = self->_assistanceValue;
  *((unsigned char *)a3 + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return;
  }
LABEL_8:
  *((_DWORD *)a3 + 8) = self->_uiPlacement;
  *((unsigned char *)a3 + 36) |= 8u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 36) |= 1u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_parkingId copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(_DWORD *)(v6 + 20) = self->_assistanceValue;
    *(unsigned char *)(v6 + 36) |= 4u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return (id)v6;
    }
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 16) = self->_assistanceType;
  *(unsigned char *)(v6 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 32) = self->_uiPlacement;
    *(unsigned char *)(v6 + 36) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if (has)
    {
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
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
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_assistanceType != *((_DWORD *)a3 + 4)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 2) != 0)
    {
      goto LABEL_24;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 4) == 0 || self->_assistanceValue != *((_DWORD *)a3 + 5)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 4) != 0)
    {
      goto LABEL_24;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 8) == 0;
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 8) == 0 || self->_uiPlacement != *((_DWORD *)a3 + 8)) {
        goto LABEL_24;
      }
      LOBYTE(v5) = 1;
    }
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
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_assistanceType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_assistanceValue;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_uiPlacement;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 36))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDCoreRoutineFMCAssistanceInstance setParkingId:](self, "setParkingId:");
  }
  char v5 = *((unsigned char *)a3 + 36);
  if ((v5 & 2) != 0)
  {
    self->_assistanceType = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 36);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        return;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_assistanceValue = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 36) & 8) == 0) {
    return;
  }
LABEL_8:
  self->_uiPlacement = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
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

- (int)assistanceType
{
  return self->_assistanceType;
}

- (int)assistanceValue
{
  return self->_assistanceValue;
}

- (int)uiPlacement
{
  return self->_uiPlacement;
}

@end