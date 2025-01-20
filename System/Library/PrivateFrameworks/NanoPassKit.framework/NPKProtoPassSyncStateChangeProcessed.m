@interface NPKProtoPassSyncStateChangeProcessed
- (BOOL)changeAccepted;
- (BOOL)fullPassRequired;
- (BOOL)hasChangeAccepted;
- (BOOL)hasFullPassRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)acceptedChangeUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAcceptedChangeUUID:(id)a3;
- (void)setChangeAccepted:(BOOL)a3;
- (void)setFullPassRequired:(BOOL)a3;
- (void)setHasChangeAccepted:(BOOL)a3;
- (void)setHasFullPassRequired:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPassSyncStateChangeProcessed

- (void)setChangeAccepted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_changeAccepted = a3;
}

- (void)setHasChangeAccepted:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChangeAccepted
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFullPassRequired:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_fullPassRequired = a3;
}

- (void)setHasFullPassRequired:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFullPassRequired
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPassSyncStateChangeProcessed;
  v4 = [(NPKProtoPassSyncStateChangeProcessed *)&v8 description];
  v5 = [(NPKProtoPassSyncStateChangeProcessed *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  acceptedChangeUUID = self->_acceptedChangeUUID;
  if (acceptedChangeUUID) {
    [v3 setObject:acceptedChangeUUID forKey:@"acceptedChangeUUID"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithBool:self->_changeAccepted];
    [v4 setObject:v7 forKey:@"changeAccepted"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_fullPassRequired];
    [v4 setObject:v8 forKey:@"fullPassRequired"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPassSyncStateChangeProcessedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_acceptedChangeUUID) {
    -[NPKProtoPassSyncStateChangeProcessed writeTo:]();
  }
  id v6 = v4;
  PBDataWriterWriteDataField();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [v5 setAcceptedChangeUUID:self->_acceptedChangeUUID];
  char has = (char)self->_has;
  if (has)
  {
    v5[16] = self->_changeAccepted;
    v5[20] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[17] = self->_fullPassRequired;
    v5[20] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_acceptedChangeUUID copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(unsigned char *)(v5 + 16) = self->_changeAccepted;
    *(unsigned char *)(v5 + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 17) = self->_fullPassRequired;
    *(unsigned char *)(v5 + 20) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  acceptedChangeUUID = self->_acceptedChangeUUID;
  if ((unint64_t)acceptedChangeUUID | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](acceptedChangeUUID, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0) {
      goto LABEL_14;
    }
    if (self->_changeAccepted)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) != 0)
    {
      if (self->_fullPassRequired)
      {
        if (!*((unsigned char *)v4 + 17)) {
          goto LABEL_14;
        }
      }
      else if (*((unsigned char *)v4 + 17))
      {
        goto LABEL_14;
      }
      BOOL v6 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v6 = 0;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_acceptedChangeUUID hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_changeAccepted;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_fullPassRequired;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  if (*((void *)v4 + 1))
  {
    BOOL v6 = v4;
    -[NPKProtoPassSyncStateChangeProcessed setAcceptedChangeUUID:](self, "setAcceptedChangeUUID:");
    uint64_t v4 = v6;
  }
  BOOL v5 = v4[20];
  if (v5)
  {
    self->_changeAccepted = v4[16];
    *(unsigned char *)&self->_has |= 1u;
    BOOL v5 = v4[20];
  }
  if ((v5 & 2) != 0)
  {
    self->_fullPassRequired = v4[17];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSData)acceptedChangeUUID
{
  return self->_acceptedChangeUUID;
}

- (void)setAcceptedChangeUUID:(id)a3
{
}

- (BOOL)changeAccepted
{
  return self->_changeAccepted;
}

- (BOOL)fullPassRequired
{
  return self->_fullPassRequired;
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoPassSyncStateChangeProcessed writeTo:]", "NPKProtoPassSyncStateChangeProcessed.m", 120, "nil != self->_acceptedChangeUUID");
}

@end