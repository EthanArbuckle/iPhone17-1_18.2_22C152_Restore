@interface NPKProtoCatalogChangedRequest
- (BOOL)hasLastKnownResyncID;
- (BOOL)hasResyncID;
- (BOOL)hasSyncID;
- (BOOL)hasWatchCatalog;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoCatalog)companionCatalog;
- (NPKProtoCatalog)watchCatalog;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)lastKnownResyncID;
- (unsigned)resyncID;
- (unsigned)syncID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompanionCatalog:(id)a3;
- (void)setHasLastKnownResyncID:(BOOL)a3;
- (void)setHasResyncID:(BOOL)a3;
- (void)setHasSyncID:(BOOL)a3;
- (void)setLastKnownResyncID:(unsigned int)a3;
- (void)setResyncID:(unsigned int)a3;
- (void)setSyncID:(unsigned int)a3;
- (void)setWatchCatalog:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCatalogChangedRequest

- (void)setResyncID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_resyncID = a3;
}

- (void)setHasResyncID:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResyncID
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLastKnownResyncID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_lastKnownResyncID = a3;
}

- (void)setHasLastKnownResyncID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastKnownResyncID
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSyncID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_syncID = a3;
}

- (void)setHasSyncID:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSyncID
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasWatchCatalog
{
  return self->_watchCatalog != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCatalogChangedRequest;
  v4 = [(NPKProtoCatalogChangedRequest *)&v8 description];
  v5 = [(NPKProtoCatalogChangedRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  companionCatalog = self->_companionCatalog;
  if (companionCatalog)
  {
    v5 = [(NPKProtoCatalog *)companionCatalog dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"companionCatalog"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = [NSNumber numberWithUnsignedInt:self->_resyncID];
    [v3 setObject:v11 forKey:@"resyncID"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  v12 = [NSNumber numberWithUnsignedInt:self->_lastKnownResyncID];
  [v3 setObject:v12 forKey:@"lastKnownResyncID"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    v7 = [NSNumber numberWithUnsignedInt:self->_syncID];
    [v3 setObject:v7 forKey:@"syncID"];
  }
LABEL_7:
  watchCatalog = self->_watchCatalog;
  if (watchCatalog)
  {
    v9 = [(NPKProtoCatalog *)watchCatalog dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"watchCatalog"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCatalogChangedRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_companionCatalog) {
    -[NPKProtoCatalogChangedRequest writeTo:]();
  }
  id v7 = v4;
  PBDataWriterWriteSubmessage();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v7;
  }
  if (self->_watchCatalog)
  {
    PBDataWriterWriteSubmessage();
    v6 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [v6 setCompanionCatalog:self->_companionCatalog];
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 5) = self->_resyncID;
    *((unsigned char *)v6 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 4) = self->_lastKnownResyncID;
  *((unsigned char *)v6 + 40) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v6 + 6) = self->_syncID;
    *((unsigned char *)v6 + 40) |= 4u;
  }
LABEL_5:
  if (self->_watchCatalog)
  {
    objc_msgSend(v6, "setWatchCatalog:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoCatalog *)self->_companionCatalog copyWithZone:a3];
  id v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 16) = self->_lastKnownResyncID;
    *(unsigned char *)(v5 + 40) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 20) = self->_resyncID;
  *(unsigned char *)(v5 + 40) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_syncID;
    *(unsigned char *)(v5 + 40) |= 4u;
  }
LABEL_5:
  id v9 = [(NPKProtoCatalog *)self->_watchCatalog copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  companionCatalog = self->_companionCatalog;
  if ((unint64_t)companionCatalog | *((void *)v4 + 1))
  {
    if (!-[NPKProtoCatalog isEqual:](companionCatalog, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_resyncID != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_21:
    char v7 = 0;
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_lastKnownResyncID != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_syncID != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_21;
  }
  watchCatalog = self->_watchCatalog;
  if ((unint64_t)watchCatalog | *((void *)v4 + 4)) {
    char v7 = -[NPKProtoCatalog isEqual:](watchCatalog, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NPKProtoCatalog *)self->_companionCatalog hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(NPKProtoCatalog *)self->_watchCatalog hash];
  }
  uint64_t v4 = 2654435761 * self->_resyncID;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_lastKnownResyncID;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_syncID;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NPKProtoCatalog *)self->_watchCatalog hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  companionCatalog = self->_companionCatalog;
  uint64_t v6 = *((void *)v4 + 1);
  id v10 = v4;
  if (companionCatalog)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoCatalog mergeFrom:](companionCatalog, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoCatalogChangedRequest setCompanionCatalog:](self, "setCompanionCatalog:");
  }
  id v4 = v10;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 40);
  if ((v7 & 2) != 0)
  {
    self->_resyncID = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 40);
    if ((v7 & 1) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_lastKnownResyncID = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_10:
    self->_syncID = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_11:
  watchCatalog = self->_watchCatalog;
  uint64_t v9 = *((void *)v4 + 4);
  if (watchCatalog)
  {
    if (!v9) {
      goto LABEL_20;
    }
    -[NPKProtoCatalog mergeFrom:](watchCatalog, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_20;
    }
    -[NPKProtoCatalogChangedRequest setWatchCatalog:](self, "setWatchCatalog:");
  }
  id v4 = v10;
LABEL_20:
}

- (NPKProtoCatalog)companionCatalog
{
  return self->_companionCatalog;
}

- (void)setCompanionCatalog:(id)a3
{
}

- (unsigned)resyncID
{
  return self->_resyncID;
}

- (unsigned)lastKnownResyncID
{
  return self->_lastKnownResyncID;
}

- (unsigned)syncID
{
  return self->_syncID;
}

- (NPKProtoCatalog)watchCatalog
{
  return self->_watchCatalog;
}

- (void)setWatchCatalog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchCatalog, 0);
  objc_storeStrong((id *)&self->_companionCatalog, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoCatalogChangedRequest writeTo:]", "NPKProtoCatalogChangedRequest.m", 185, "self->_companionCatalog != nil");
}

@end