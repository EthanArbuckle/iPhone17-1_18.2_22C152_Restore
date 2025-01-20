@interface RMSSetLikeStateMessage
- (BOOL)hasDatabaseID;
- (BOOL)hasItemID;
- (BOOL)hasLikeState;
- (BOOL)hasSessionIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)likeState;
- (int)sessionIdentifier;
- (unint64_t)databaseID;
- (unint64_t)hash;
- (unint64_t)itemID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDatabaseID:(unint64_t)a3;
- (void)setHasDatabaseID:(BOOL)a3;
- (void)setHasItemID:(BOOL)a3;
- (void)setHasLikeState:(BOOL)a3;
- (void)setHasSessionIdentifier:(BOOL)a3;
- (void)setItemID:(unint64_t)a3;
- (void)setLikeState:(int)a3;
- (void)setSessionIdentifier:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RMSSetLikeStateMessage

- (void)setLikeState:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_likeState = a3;
}

- (void)setHasLikeState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLikeState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setItemID:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_itemID = a3;
}

- (void)setHasItemID:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasItemID
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDatabaseID:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_databaseID = a3;
}

- (void)setHasDatabaseID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDatabaseID
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSessionIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_sessionIdentifier = a3;
}

- (void)setHasSessionIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSessionIdentifier
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)RMSSetLikeStateMessage;
  v4 = [(RMSSetLikeStateMessage *)&v8 description];
  v5 = [(RMSSetLikeStateMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v7 = [NSNumber numberWithInt:self->_likeState];
    [v3 setObject:v7 forKey:@"likeState"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_itemID];
  [v3 setObject:v8 forKey:@"itemID"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = [NSNumber numberWithUnsignedLongLong:self->_databaseID];
  [v3 setObject:v9 forKey:@"databaseID"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = [NSNumber numberWithInt:self->_sessionIdentifier];
    [v3 setObject:v5 forKey:@"sessionIdentifier"];
  }
LABEL_6:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return RMSSetLikeStateMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[6] = self->_likeState;
    *((unsigned char *)v4 + 32) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v4 + 2) = self->_itemID;
  *((unsigned char *)v4 + 32) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *((void *)v4 + 1) = self->_databaseID;
  *((unsigned char *)v4 + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v4[7] = self->_sessionIdentifier;
    *((unsigned char *)v4 + 32) |= 8u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 6) = self->_likeState;
    *((unsigned char *)result + 32) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_itemID;
  *((unsigned char *)result + 32) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((void *)result + 1) = self->_databaseID;
  *((unsigned char *)result + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 7) = self->_sessionIdentifier;
  *((unsigned char *)result + 32) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_likeState != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_itemID != *((void *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_databaseID != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_sessionIdentifier != *((_DWORD *)v4 + 7)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v2 = 2654435761 * self->_likeState;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_itemID;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_databaseID;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_sessionIdentifier;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) != 0)
  {
    self->_likeState = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_itemID = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_databaseID = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
LABEL_5:
    self->_sessionIdentifier = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
}

- (int)likeState
{
  return self->_likeState;
}

- (unint64_t)itemID
{
  return self->_itemID;
}

- (unint64_t)databaseID
{
  return self->_databaseID;
}

- (int)sessionIdentifier
{
  return self->_sessionIdentifier;
}

@end