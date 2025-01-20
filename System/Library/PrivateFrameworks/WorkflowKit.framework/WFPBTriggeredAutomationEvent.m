@interface WFPBTriggeredAutomationEvent
- (BOOL)hasBatchCount;
- (BOOL)hasBatchDroppedCount;
- (BOOL)hasKey;
- (BOOL)hasRequiredRuntimeConfirmation;
- (BOOL)hasShowsNotification;
- (BOOL)hasTriggerType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiredRuntimeConfirmation;
- (BOOL)showsNotification;
- (NSString)key;
- (NSString)triggerType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)batchCount;
- (unsigned)batchDroppedCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBatchCount:(unsigned int)a3;
- (void)setBatchDroppedCount:(unsigned int)a3;
- (void)setHasBatchCount:(BOOL)a3;
- (void)setHasBatchDroppedCount:(BOOL)a3;
- (void)setHasRequiredRuntimeConfirmation:(BOOL)a3;
- (void)setHasShowsNotification:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setRequiredRuntimeConfirmation:(BOOL)a3;
- (void)setShowsNotification:(BOOL)a3;
- (void)setTriggerType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBTriggeredAutomationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (BOOL)showsNotification
{
  return self->_showsNotification;
}

- (unsigned)batchDroppedCount
{
  return self->_batchDroppedCount;
}

- (unsigned)batchCount
{
  return self->_batchCount;
}

- (BOOL)requiredRuntimeConfirmation
{
  return self->_requiredRuntimeConfirmation;
}

- (void)setTriggerType:(id)a3
{
}

- (NSString)triggerType
{
  return self->_triggerType;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[WFPBTriggeredAutomationEvent setKey:](self, "setKey:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBTriggeredAutomationEvent setTriggerType:](self, "setTriggerType:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) != 0)
  {
    self->_requiredRuntimeConfirmation = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 1) == 0)
  {
    goto LABEL_7;
  }
  self->_batchCount = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  self->_batchDroppedCount = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
LABEL_9:
    self->_showsNotification = *((unsigned char *)v4 + 33);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_10:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_triggerType hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_requiredRuntimeConfirmation;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_batchCount;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v7 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_batchDroppedCount;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v8 = 2654435761 * self->_showsNotification;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_26;
    }
  }
  triggerType = self->_triggerType;
  if ((unint64_t)triggerType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](triggerType, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0) {
      goto LABEL_26;
    }
    if (self->_requiredRuntimeConfirmation)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_batchCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_batchDroppedCount != *((_DWORD *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_26;
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) != 0)
    {
      if (self->_showsNotification)
      {
        if (!*((unsigned char *)v4 + 33)) {
          goto LABEL_26;
        }
      }
      else if (*((unsigned char *)v4 + 33))
      {
        goto LABEL_26;
      }
      BOOL v7 = 1;
      goto LABEL_27;
    }
LABEL_26:
    BOOL v7 = 0;
  }
LABEL_27:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_triggerType copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_requiredRuntimeConfirmation;
    *(unsigned char *)(v5 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 12) = self->_batchDroppedCount;
      *(unsigned char *)(v5 + 36) |= 2u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 8) = self->_batchCount;
  *(unsigned char *)(v5 + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(unsigned char *)(v5 + 33) = self->_showsNotification;
    *(unsigned char *)(v5 + 36) |= 8u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v6;
  }
  if (self->_triggerType)
  {
    objc_msgSend(v6, "setTriggerType:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 32) = self->_requiredRuntimeConfirmation;
    *((unsigned char *)v4 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 2) = self->_batchCount;
  *((unsigned char *)v4 + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  *((_DWORD *)v4 + 3) = self->_batchDroppedCount;
  *((unsigned char *)v4 + 36) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    *((unsigned char *)v4 + 33) = self->_showsNotification;
    *((unsigned char *)v4 + 36) |= 8u;
  }
LABEL_10:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_triggerType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_10:
}

- (BOOL)readFrom:(id)a3
{
  return WFPBTriggeredAutomationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  triggerType = self->_triggerType;
  if (triggerType) {
    [v4 setObject:triggerType forKey:@"triggerType"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_requiredRuntimeConfirmation];
    [v4 setObject:v10 forKey:@"requiredRuntimeConfirmation"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  v11 = [NSNumber numberWithUnsignedInt:self->_batchCount];
  [v4 setObject:v11 forKey:@"batchCount"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  v12 = [NSNumber numberWithUnsignedInt:self->_batchDroppedCount];
  [v4 setObject:v12 forKey:@"batchDroppedCount"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    uint64_t v8 = [NSNumber numberWithBool:self->_showsNotification];
    [v4 setObject:v8 forKey:@"showsNotification"];
  }
LABEL_10:
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBTriggeredAutomationEvent;
  id v4 = [(WFPBTriggeredAutomationEvent *)&v8 description];
  uint64_t v5 = [(WFPBTriggeredAutomationEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasShowsNotification
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasShowsNotification:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setShowsNotification:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_showsNotification = a3;
}

- (BOOL)hasBatchDroppedCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasBatchDroppedCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setBatchDroppedCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_batchDroppedCount = a3;
}

- (BOOL)hasBatchCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasBatchCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setBatchCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_batchCount = a3;
}

- (BOOL)hasRequiredRuntimeConfirmation
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasRequiredRuntimeConfirmation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setRequiredRuntimeConfirmation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_requiredRuntimeConfirmation = a3;
}

- (BOOL)hasTriggerType
{
  return self->_triggerType != 0;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"TriggeredAutomation";
  }
}

@end