@interface NPKProtoRemovePassRequest
- (BOOL)hasCatalog;
- (BOOL)hasLastKnownResyncID;
- (BOOL)hasLibraryHash;
- (BOOL)hasResyncID;
- (BOOL)hasSyncID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoCatalog)catalog;
- (NPKProtoHash)libraryHash;
- (NSString)passID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)lastKnownResyncID;
- (unsigned)resyncID;
- (unsigned)syncID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCatalog:(id)a3;
- (void)setHasLastKnownResyncID:(BOOL)a3;
- (void)setHasResyncID:(BOOL)a3;
- (void)setHasSyncID:(BOOL)a3;
- (void)setLastKnownResyncID:(unsigned int)a3;
- (void)setLibraryHash:(id)a3;
- (void)setPassID:(id)a3;
- (void)setResyncID:(unsigned int)a3;
- (void)setSyncID:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRemovePassRequest

- (BOOL)hasLibraryHash
{
  return self->_libraryHash != 0;
}

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

- (BOOL)hasCatalog
{
  return self->_catalog != 0;
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRemovePassRequest;
  v4 = [(NPKProtoRemovePassRequest *)&v8 description];
  v5 = [(NPKProtoRemovePassRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  passID = self->_passID;
  if (passID) {
    [v3 setObject:passID forKey:@"passID"];
  }
  libraryHash = self->_libraryHash;
  if (libraryHash)
  {
    v7 = [(NPKProtoHash *)libraryHash dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"libraryHash"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_resyncID];
    [v4 setObject:v8 forKey:@"resyncID"];
  }
  catalog = self->_catalog;
  if (catalog)
  {
    v10 = [(NPKProtoCatalog *)catalog dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"catalog"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v12 = [NSNumber numberWithUnsignedInt:self->_lastKnownResyncID];
    [v4 setObject:v12 forKey:@"lastKnownResyncID"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v13 = [NSNumber numberWithUnsignedInt:self->_syncID];
    [v4 setObject:v13 forKey:@"syncID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemovePassRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_passID) {
    -[NPKProtoRemovePassRequest writeTo:]();
  }
  id v7 = v4;
  PBDataWriterWriteStringField();
  if (self->_libraryHash) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  v5 = v7;
  if (self->_catalog)
  {
    PBDataWriterWriteSubmessage();
    v5 = v7;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    v5 = v7;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [v6 setPassID:self->_passID];
  if (self->_libraryHash) {
    objc_msgSend(v6, "setLibraryHash:");
  }
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_resyncID;
    *((unsigned char *)v6 + 48) |= 2u;
  }
  if (self->_catalog)
  {
    objc_msgSend(v6, "setCatalog:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    v4[4] = self->_lastKnownResyncID;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[11] = self->_syncID;
    *((unsigned char *)v4 + 48) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_passID copyWithZone:a3];
  id v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  id v8 = [(NPKProtoHash *)self->_libraryHash copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_resyncID;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  id v10 = [(NPKProtoCatalog *)self->_catalog copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_lastKnownResyncID;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_syncID;
    *(unsigned char *)(v5 + 48) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  passID = self->_passID;
  if ((unint64_t)passID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](passID, "isEqual:")) {
      goto LABEL_23;
    }
  }
  libraryHash = self->_libraryHash;
  if ((unint64_t)libraryHash | *((void *)v4 + 3))
  {
    if (!-[NPKProtoHash isEqual:](libraryHash, "isEqual:")) {
      goto LABEL_23;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_resyncID != *((_DWORD *)v4 + 10)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_23;
  }
  catalog = self->_catalog;
  if ((unint64_t)catalog | *((void *)v4 + 1))
  {
    if (!-[NPKProtoCatalog isEqual:](catalog, "isEqual:"))
    {
LABEL_23:
      BOOL v9 = 0;
      goto LABEL_24;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_lastKnownResyncID != *((_DWORD *)v4 + 4)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_23;
  }
  BOOL v9 = (*((unsigned char *)v4 + 48) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_syncID != *((_DWORD *)v4 + 11)) {
      goto LABEL_23;
    }
    BOOL v9 = 1;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_passID hash];
  unint64_t v4 = [(NPKProtoHash *)self->_libraryHash hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_resyncID;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(NPKProtoCatalog *)self->_catalog hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = 2654435761 * self->_lastKnownResyncID;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_syncID;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unsigned int *)a3;
  id v10 = v4;
  if (*((void *)v4 + 4))
  {
    -[NPKProtoRemovePassRequest setPassID:](self, "setPassID:");
    unint64_t v4 = v10;
  }
  libraryHash = self->_libraryHash;
  uint64_t v6 = *((void *)v4 + 3);
  if (libraryHash)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[NPKProtoHash mergeFrom:](libraryHash, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[NPKProtoRemovePassRequest setLibraryHash:](self, "setLibraryHash:");
  }
  unint64_t v4 = v10;
LABEL_9:
  if ((v4[12] & 2) != 0)
  {
    self->_resyncID = v4[10];
    *(unsigned char *)&self->_has |= 2u;
  }
  catalog = self->_catalog;
  uint64_t v8 = *((void *)v4 + 1);
  if (catalog)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[NPKProtoCatalog mergeFrom:](catalog, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[NPKProtoRemovePassRequest setCatalog:](self, "setCatalog:");
  }
  unint64_t v4 = v10;
LABEL_17:
  char v9 = *((unsigned char *)v4 + 48);
  if (v9)
  {
    self->_lastKnownResyncID = v4[4];
    *(unsigned char *)&self->_has |= 1u;
    char v9 = *((unsigned char *)v4 + 48);
  }
  if ((v9 & 4) != 0)
  {
    self->_syncID = v4[11];
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (NSString)passID
{
  return self->_passID;
}

- (void)setPassID:(id)a3
{
}

- (NPKProtoHash)libraryHash
{
  return self->_libraryHash;
}

- (void)setLibraryHash:(id)a3
{
}

- (unsigned)resyncID
{
  return self->_resyncID;
}

- (NPKProtoCatalog)catalog
{
  return self->_catalog;
}

- (void)setCatalog:(id)a3
{
}

- (unsigned)lastKnownResyncID
{
  return self->_lastKnownResyncID;
}

- (unsigned)syncID
{
  return self->_syncID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passID, 0);
  objc_storeStrong((id *)&self->_libraryHash, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRemovePassRequest writeTo:]", "NPKProtoRemovePassRequest.m", 201, "nil != self->_passID");
}

@end