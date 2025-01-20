@interface NPKProtoPassSyncReconciledStateUnrecognized
- (BOOL)hasLibraryPassSyncState;
- (BOOL)hasUnrecognizedReconciledStateHash;
- (BOOL)hasUnrecognizedReconciledStateVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoPassSyncState)libraryPassSyncState;
- (NSData)unrecognizedReconciledStateHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)unrecognizedReconciledStateVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasUnrecognizedReconciledStateVersion:(BOOL)a3;
- (void)setLibraryPassSyncState:(id)a3;
- (void)setUnrecognizedReconciledStateHash:(id)a3;
- (void)setUnrecognizedReconciledStateVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPassSyncReconciledStateUnrecognized

- (BOOL)hasUnrecognizedReconciledStateHash
{
  return self->_unrecognizedReconciledStateHash != 0;
}

- (BOOL)hasLibraryPassSyncState
{
  return self->_libraryPassSyncState != 0;
}

- (void)setUnrecognizedReconciledStateVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unrecognizedReconciledStateVersion = a3;
}

- (void)setHasUnrecognizedReconciledStateVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUnrecognizedReconciledStateVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPassSyncReconciledStateUnrecognized;
  v4 = [(NPKProtoPassSyncReconciledStateUnrecognized *)&v8 description];
  v5 = [(NPKProtoPassSyncReconciledStateUnrecognized *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  unrecognizedReconciledStateHash = self->_unrecognizedReconciledStateHash;
  if (unrecognizedReconciledStateHash) {
    [v3 setObject:unrecognizedReconciledStateHash forKey:@"unrecognizedReconciledStateHash"];
  }
  libraryPassSyncState = self->_libraryPassSyncState;
  if (libraryPassSyncState)
  {
    v7 = [(NPKProtoPassSyncState *)libraryPassSyncState dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"libraryPassSyncState"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_unrecognizedReconciledStateVersion];
    [v4 setObject:v8 forKey:@"unrecognizedReconciledStateVersion"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPassSyncReconciledStateUnrecognizedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_unrecognizedReconciledStateHash)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_libraryPassSyncState)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_unrecognizedReconciledStateHash)
  {
    objc_msgSend(v4, "setUnrecognizedReconciledStateHash:");
    id v4 = v5;
  }
  if (self->_libraryPassSyncState)
  {
    objc_msgSend(v5, "setLibraryPassSyncState:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_unrecognizedReconciledStateVersion;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_unrecognizedReconciledStateHash copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(NPKProtoPassSyncState *)self->_libraryPassSyncState copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_unrecognizedReconciledStateVersion;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  unrecognizedReconciledStateHash = self->_unrecognizedReconciledStateHash;
  if ((unint64_t)unrecognizedReconciledStateHash | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](unrecognizedReconciledStateHash, "isEqual:")) {
      goto LABEL_10;
    }
  }
  libraryPassSyncState = self->_libraryPassSyncState;
  if ((unint64_t)libraryPassSyncState | *((void *)v4 + 1))
  {
    if (!-[NPKProtoPassSyncState isEqual:](libraryPassSyncState, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_unrecognizedReconciledStateVersion == *((_DWORD *)v4 + 6))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_unrecognizedReconciledStateHash hash];
  unint64_t v4 = [(NPKProtoPassSyncState *)self->_libraryPassSyncState hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_unrecognizedReconciledStateVersion;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unsigned int *)a3;
  BOOL v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[NPKProtoPassSyncReconciledStateUnrecognized setUnrecognizedReconciledStateHash:](self, "setUnrecognizedReconciledStateHash:");
    unint64_t v4 = v7;
  }
  libraryPassSyncState = self->_libraryPassSyncState;
  uint64_t v6 = *((void *)v4 + 1);
  if (libraryPassSyncState)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[NPKProtoPassSyncState mergeFrom:](libraryPassSyncState, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[NPKProtoPassSyncReconciledStateUnrecognized setLibraryPassSyncState:](self, "setLibraryPassSyncState:");
  }
  unint64_t v4 = v7;
LABEL_9:
  if (v4[7])
  {
    self->_unrecognizedReconciledStateVersion = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)unrecognizedReconciledStateHash
{
  return self->_unrecognizedReconciledStateHash;
}

- (void)setUnrecognizedReconciledStateHash:(id)a3
{
}

- (NPKProtoPassSyncState)libraryPassSyncState
{
  return self->_libraryPassSyncState;
}

- (void)setLibraryPassSyncState:(id)a3
{
}

- (unsigned)unrecognizedReconciledStateVersion
{
  return self->_unrecognizedReconciledStateVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unrecognizedReconciledStateHash, 0);
  objc_storeStrong((id *)&self->_libraryPassSyncState, 0);
}

@end