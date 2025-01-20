@interface NPKProtoPassSyncStateManifestEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)fileHash;
- (NSString)relativePath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFileHash:(id)a3;
- (void)setRelativePath:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPassSyncStateManifestEntry

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPassSyncStateManifestEntry;
  v4 = [(NPKProtoPassSyncStateManifestEntry *)&v8 description];
  v5 = [(NPKProtoPassSyncStateManifestEntry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  relativePath = self->_relativePath;
  if (relativePath) {
    [v3 setObject:relativePath forKey:@"relativePath"];
  }
  fileHash = self->_fileHash;
  if (fileHash) {
    [v4 setObject:fileHash forKey:@"fileHash"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPassSyncStateManifestEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_relativePath) {
    -[NPKProtoPassSyncStateManifestEntry writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_fileHash) {
    -[NPKProtoPassSyncStateManifestEntry writeTo:]();
  }
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  relativePath = self->_relativePath;
  id v5 = a3;
  [v5 setRelativePath:relativePath];
  [v5 setFileHash:self->_fileHash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_relativePath copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_fileHash copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((relativePath = self->_relativePath, !((unint64_t)relativePath | v4[2]))
     || -[NSString isEqual:](relativePath, "isEqual:")))
  {
    fileHash = self->_fileHash;
    if ((unint64_t)fileHash | v4[1]) {
      char v7 = -[NSString isEqual:](fileHash, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_relativePath hash];
  return [(NSString *)self->_fileHash hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NPKProtoPassSyncStateManifestEntry setRelativePath:](self, "setRelativePath:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoPassSyncStateManifestEntry setFileHash:](self, "setFileHash:");
    id v4 = v5;
  }
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
}

- (NSString)fileHash
{
  return self->_fileHash;
}

- (void)setFileHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoPassSyncStateManifestEntry writeTo:]", "NPKProtoPassSyncStateManifestEntry.m", 83, "nil != self->_relativePath");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoPassSyncStateManifestEntry writeTo:]", "NPKProtoPassSyncStateManifestEntry.m", 88, "nil != self->_fileHash");
}

@end