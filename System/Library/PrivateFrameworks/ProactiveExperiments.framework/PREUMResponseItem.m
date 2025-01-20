@interface PREUMResponseItem
- (BOOL)hasIsCustomResponse;
- (BOOL)hasIsRobotResponse;
- (BOOL)hasModelId;
- (BOOL)hasReplyTextId;
- (BOOL)hasResponseClassId;
- (BOOL)isCustomResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRobotResponse;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)modelId;
- (unsigned)replyTextId;
- (unsigned)responseClassId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsCustomResponse:(BOOL)a3;
- (void)setHasIsRobotResponse:(BOOL)a3;
- (void)setHasModelId:(BOOL)a3;
- (void)setHasReplyTextId:(BOOL)a3;
- (void)setHasResponseClassId:(BOOL)a3;
- (void)setIsCustomResponse:(BOOL)a3;
- (void)setIsRobotResponse:(BOOL)a3;
- (void)setModelId:(unsigned int)a3;
- (void)setReplyTextId:(unsigned int)a3;
- (void)setResponseClassId:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PREUMResponseItem

- (BOOL)isRobotResponse
{
  return self->_isRobotResponse;
}

- (BOOL)isCustomResponse
{
  return self->_isCustomResponse;
}

- (unsigned)replyTextId
{
  return self->_replyTextId;
}

- (unsigned)responseClassId
{
  return self->_responseClassId;
}

- (unsigned)modelId
{
  return self->_modelId;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_modelId = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_responseClassId = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_replyTextId = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_isCustomResponse = *((unsigned char *)v4 + 20);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 24) & 0x10) != 0)
  {
LABEL_6:
    self->_isRobotResponse = *((unsigned char *)v4 + 21);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_7:
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_modelId;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_responseClassId;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_replyTextId;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_isCustomResponse;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_isRobotResponse;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_modelId != *((_DWORD *)v4 + 2)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_responseClassId != *((_DWORD *)v4 + 4)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_replyTextId != *((_DWORD *)v4 + 3)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0) {
      goto LABEL_27;
    }
    if (self->_isCustomResponse)
    {
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 20))
    {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
    goto LABEL_27;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 0x10) != 0)
    {
      if (self->_isRobotResponse)
      {
        if (!*((unsigned char *)v4 + 21)) {
          goto LABEL_27;
        }
      }
      else if (*((unsigned char *)v4 + 21))
      {
        goto LABEL_27;
      }
      BOOL v5 = 1;
      goto LABEL_28;
    }
LABEL_27:
    BOOL v5 = 0;
  }
LABEL_28:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_modelId;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_responseClassId;
  *((unsigned char *)result + 24) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 3) = self->_replyTextId;
  *((unsigned char *)result + 24) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((unsigned char *)result + 20) = self->_isCustomResponse;
  *((unsigned char *)result + 24) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_6:
  *((unsigned char *)result + 21) = self->_isRobotResponse;
  *((unsigned char *)result + 24) |= 0x10u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_modelId;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_responseClassId;
  *((unsigned char *)v4 + 24) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v4[3] = self->_replyTextId;
  *((unsigned char *)v4 + 24) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((unsigned char *)v4 + 20) = self->_isCustomResponse;
  *((unsigned char *)v4 + 24) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *((unsigned char *)v4 + 21) = self->_isRobotResponse;
    *((unsigned char *)v4 + 24) |= 0x10u;
  }
LABEL_7:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return PREUMResponseItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_modelId];
    [v3 setObject:v7 forKey:@"model_id"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = [NSNumber numberWithUnsignedInt:self->_responseClassId];
  [v3 setObject:v8 forKey:@"response_class_id"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = [NSNumber numberWithUnsignedInt:self->_replyTextId];
  [v3 setObject:v9 forKey:@"reply_text_id"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = [NSNumber numberWithBool:self->_isCustomResponse];
  [v3 setObject:v10 forKey:@"is_custom_response"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    id v5 = [NSNumber numberWithBool:self->_isRobotResponse];
    [v3 setObject:v5 forKey:@"is_robot_response"];
  }
LABEL_7:

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PREUMResponseItem;
  id v4 = [(PREUMResponseItem *)&v8 description];
  id v5 = [(PREUMResponseItem *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIsRobotResponse
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasIsRobotResponse:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setIsRobotResponse:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isRobotResponse = a3;
}

- (BOOL)hasIsCustomResponse
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasIsCustomResponse:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setIsCustomResponse:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isCustomResponse = a3;
}

- (BOOL)hasReplyTextId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasReplyTextId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setReplyTextId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_replyTextId = a3;
}

- (BOOL)hasResponseClassId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasResponseClassId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setResponseClassId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_responseClassId = a3;
}

- (BOOL)hasModelId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasModelId:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setModelId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_modelId = a3;
}

@end