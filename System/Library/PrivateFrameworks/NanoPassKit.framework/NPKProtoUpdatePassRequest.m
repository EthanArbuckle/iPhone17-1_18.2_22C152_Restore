@interface NPKProtoUpdatePassRequest
- (BOOL)hasCatalog;
- (BOOL)hasLastKnownResyncID;
- (BOOL)hasLibraryHash;
- (BOOL)hasPreviousManifestHash;
- (BOOL)hasResyncID;
- (BOOL)hasSyncID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoCatalog)catalog;
- (NPKProtoHash)libraryHash;
- (NPKProtoPass)pass;
- (NSData)previousManifestHash;
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
- (void)setPass:(id)a3;
- (void)setPreviousManifestHash:(id)a3;
- (void)setResyncID:(unsigned int)a3;
- (void)setSyncID:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoUpdatePassRequest

- (BOOL)hasLibraryHash
{
  return self->_libraryHash != 0;
}

- (BOOL)hasPreviousManifestHash
{
  return self->_previousManifestHash != 0;
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
  v8.super_class = (Class)NPKProtoUpdatePassRequest;
  v4 = [(NPKProtoUpdatePassRequest *)&v8 description];
  v5 = [(NPKProtoUpdatePassRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  pass = self->_pass;
  if (pass)
  {
    v5 = [(NPKProtoPass *)pass dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"pass"];
  }
  libraryHash = self->_libraryHash;
  if (libraryHash)
  {
    v7 = [(NPKProtoHash *)libraryHash dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"libraryHash"];
  }
  previousManifestHash = self->_previousManifestHash;
  if (previousManifestHash) {
    [v3 setObject:previousManifestHash forKey:@"previousManifestHash"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_resyncID];
    [v3 setObject:v9 forKey:@"resyncID"];
  }
  catalog = self->_catalog;
  if (catalog)
  {
    v11 = [(NPKProtoCatalog *)catalog dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"catalog"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v13 = [NSNumber numberWithUnsignedInt:self->_lastKnownResyncID];
    [v3 setObject:v13 forKey:@"lastKnownResyncID"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v14 = [NSNumber numberWithUnsignedInt:self->_syncID];
    [v3 setObject:v14 forKey:@"syncID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoUpdatePassRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_pass) {
    -[NPKProtoUpdatePassRequest writeTo:]();
  }
  id v7 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_libraryHash) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_previousManifestHash) {
    PBDataWriterWriteDataField();
  }
  v5 = v7;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = v7;
  }
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
  [v6 setPass:self->_pass];
  if (self->_libraryHash) {
    objc_msgSend(v6, "setLibraryHash:");
  }
  if (self->_previousManifestHash) {
    objc_msgSend(v6, "setPreviousManifestHash:");
  }
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_resyncID;
    *((unsigned char *)v6 + 56) |= 2u;
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
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[13] = self->_syncID;
    *((unsigned char *)v4 + 56) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoPass *)self->_pass copyWithZone:a3];
  id v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  id v8 = [(NPKProtoHash *)self->_libraryHash copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSData *)self->_previousManifestHash copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_resyncID;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  id v12 = [(NPKProtoCatalog *)self->_catalog copyWithZone:a3];
  v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_lastKnownResyncID;
    *(unsigned char *)(v5 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_syncID;
    *(unsigned char *)(v5 + 56) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  pass = self->_pass;
  if ((unint64_t)pass | *((void *)v4 + 4))
  {
    if (!-[NPKProtoPass isEqual:](pass, "isEqual:")) {
      goto LABEL_25;
    }
  }
  libraryHash = self->_libraryHash;
  if ((unint64_t)libraryHash | *((void *)v4 + 3))
  {
    if (!-[NPKProtoHash isEqual:](libraryHash, "isEqual:")) {
      goto LABEL_25;
    }
  }
  previousManifestHash = self->_previousManifestHash;
  if ((unint64_t)previousManifestHash | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](previousManifestHash, "isEqual:")) {
      goto LABEL_25;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_resyncID != *((_DWORD *)v4 + 12)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_25;
  }
  catalog = self->_catalog;
  if ((unint64_t)catalog | *((void *)v4 + 1))
  {
    if (!-[NPKProtoCatalog isEqual:](catalog, "isEqual:"))
    {
LABEL_25:
      BOOL v10 = 0;
      goto LABEL_26;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_lastKnownResyncID != *((_DWORD *)v4 + 4)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_25;
  }
  BOOL v10 = (*((unsigned char *)v4 + 56) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_syncID != *((_DWORD *)v4 + 13)) {
      goto LABEL_25;
    }
    BOOL v10 = 1;
  }
LABEL_26:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NPKProtoPass *)self->_pass hash];
  unint64_t v4 = [(NPKProtoHash *)self->_libraryHash hash];
  uint64_t v5 = [(NSData *)self->_previousManifestHash hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_resyncID;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(NPKProtoCatalog *)self->_catalog hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = 2654435761 * self->_lastKnownResyncID;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v9 = 2654435761 * self->_syncID;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  pass = self->_pass;
  uint64_t v6 = *((void *)v4 + 4);
  id v12 = v4;
  if (pass)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoPass mergeFrom:](pass, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoUpdatePassRequest setPass:](self, "setPass:");
  }
  id v4 = v12;
LABEL_7:
  libraryHash = self->_libraryHash;
  uint64_t v8 = *((void *)v4 + 3);
  if (libraryHash)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[NPKProtoHash mergeFrom:](libraryHash, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[NPKProtoUpdatePassRequest setLibraryHash:](self, "setLibraryHash:");
  }
  id v4 = v12;
LABEL_13:
  if (*((void *)v4 + 5))
  {
    -[NPKProtoUpdatePassRequest setPreviousManifestHash:](self, "setPreviousManifestHash:");
    id v4 = v12;
  }
  if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    self->_resyncID = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
  catalog = self->_catalog;
  uint64_t v10 = *((void *)v4 + 1);
  if (catalog)
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[NPKProtoCatalog mergeFrom:](catalog, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[NPKProtoUpdatePassRequest setCatalog:](self, "setCatalog:");
  }
  id v4 = v12;
LABEL_23:
  char v11 = *((unsigned char *)v4 + 56);
  if (v11)
  {
    self->_lastKnownResyncID = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v11 = *((unsigned char *)v4 + 56);
  }
  if ((v11 & 4) != 0)
  {
    self->_syncID = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (NPKProtoPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (NPKProtoHash)libraryHash
{
  return self->_libraryHash;
}

- (void)setLibraryHash:(id)a3
{
}

- (NSData)previousManifestHash
{
  return self->_previousManifestHash;
}

- (void)setPreviousManifestHash:(id)a3
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
  objc_storeStrong((id *)&self->_previousManifestHash, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_libraryHash, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoUpdatePassRequest writeTo:]", "NPKProtoUpdatePassRequest.m", 229, "self->_pass != nil");
}

@end