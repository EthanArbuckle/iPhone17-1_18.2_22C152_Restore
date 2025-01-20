@interface NPKProtoNewLibraryHashRequest
- (BOOL)hasLastKnownResyncID;
- (BOOL)hasResyncID;
- (BOOL)hasSyncID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoHash)libraryHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)lastKnownResyncID;
- (unsigned)resyncID;
- (unsigned)syncID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLastKnownResyncID:(BOOL)a3;
- (void)setHasResyncID:(BOOL)a3;
- (void)setHasSyncID:(BOOL)a3;
- (void)setLastKnownResyncID:(unsigned int)a3;
- (void)setLibraryHash:(id)a3;
- (void)setResyncID:(unsigned int)a3;
- (void)setSyncID:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoNewLibraryHashRequest

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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoNewLibraryHashRequest;
  v4 = [(NPKProtoNewLibraryHashRequest *)&v8 description];
  v5 = [(NPKProtoNewLibraryHashRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  libraryHash = self->_libraryHash;
  if (libraryHash)
  {
    v5 = [(NPKProtoHash *)libraryHash dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"libraryHash"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_resyncID];
    [v3 setObject:v9 forKey:@"resyncID"];

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
  v10 = [NSNumber numberWithUnsignedInt:self->_lastKnownResyncID];
  [v3 setObject:v10 forKey:@"lastKnownResyncID"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    v7 = [NSNumber numberWithUnsignedInt:self->_syncID];
    [v3 setObject:v7 forKey:@"syncID"];
  }
LABEL_7:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoNewLibraryHashRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_libraryHash) {
    -[NPKProtoNewLibraryHashRequest writeTo:]();
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
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setLibraryHash:self->_libraryHash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_resyncID;
    *((unsigned char *)v5 + 32) |= 2u;
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
  *((_DWORD *)v5 + 2) = self->_lastKnownResyncID;
  *((unsigned char *)v5 + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 7) = self->_syncID;
    *((unsigned char *)v5 + 32) |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoHash *)self->_libraryHash copyWithZone:a3];
  id v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 8) = self->_lastKnownResyncID;
    *(unsigned char *)(v5 + 32) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 24) = self->_resyncID;
  *(unsigned char *)(v5 + 32) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 28) = self->_syncID;
    *(unsigned char *)(v5 + 32) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  libraryHash = self->_libraryHash;
  if ((unint64_t)libraryHash | *((void *)v4 + 2))
  {
    if (!-[NPKProtoHash isEqual:](libraryHash, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_resyncID != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_lastKnownResyncID != *((_DWORD *)v4 + 2)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_syncID != *((_DWORD *)v4 + 7)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NPKProtoHash *)self->_libraryHash hash];
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
    return v4 ^ v3 ^ v5 ^ v6;
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
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  libraryHash = self->_libraryHash;
  uint64_t v6 = *((void *)v4 + 2);
  if (libraryHash)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[NPKProtoHash mergeFrom:](libraryHash, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[NPKProtoNewLibraryHashRequest setLibraryHash:](self, "setLibraryHash:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 32);
  if ((v7 & 2) != 0)
  {
    self->_resyncID = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 32);
    if ((v7 & 1) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_lastKnownResyncID = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
LABEL_10:
    self->_syncID = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_11:
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
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoNewLibraryHashRequest writeTo:]", "NPKProtoNewLibraryHashRequest.m", 158, "self->_libraryHash != nil");
}

@end