@interface MBSFileReference
- (BOOL)hasFileID;
- (BOOL)hasSnapshotID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)fileID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)snapshotID;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFileID:(id)a3;
- (void)setHasSnapshotID:(BOOL)a3;
- (void)setSnapshotID:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBSFileReference

- (void)dealloc
{
  [(MBSFileReference *)self setFileID:0];
  v3.receiver = self;
  v3.super_class = (Class)MBSFileReference;
  [(MBSFileReference *)&v3 dealloc];
}

- (void)setSnapshotID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_snapshotID = a3;
}

- (void)setHasSnapshotID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSnapshotID
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasFileID
{
  return self->_fileID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MBSFileReference;
  return +[NSString stringWithFormat:@"%@ %@", [(MBSFileReference *)&v3 description], [(MBSFileReference *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_snapshotID)] forKey:@"snapshotID"];
  }
  fileID = self->_fileID;
  if (fileID) {
    [v3 setObject:fileID forKey:@"fileID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100008A9C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_fileID)
  {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 4) = self->_snapshotID;
    *((unsigned char *)a3 + 20) |= 1u;
  }
  fileID = self->_fileID;
  if (fileID) {
    [a3 setFileID:fileID];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_snapshotID;
    *((unsigned char *)v5 + 20) |= 1u;
  }

  v6[1] = [(NSData *)self->_fileID copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 20) & 1) == 0 || self->_snapshotID != *((_DWORD *)a3 + 4)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)a3 + 20))
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    fileID = self->_fileID;
    if ((unint64_t)fileID | *((void *)a3 + 1))
    {
      LOBYTE(v5) = -[NSData isEqual:](fileID, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_snapshotID;
  }
  else {
    uint64_t v2 = 0;
  }
  return (unint64_t)[(NSData *)self->_fileID hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 20))
  {
    self->_snapshotID = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 1)) {
    -[MBSFileReference setFileID:](self, "setFileID:");
  }
}

- (unsigned)snapshotID
{
  return self->_snapshotID;
}

- (NSData)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
}

@end