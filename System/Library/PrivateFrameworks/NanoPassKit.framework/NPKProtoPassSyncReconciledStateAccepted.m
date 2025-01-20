@interface NPKProtoPassSyncReconciledStateAccepted
- (BOOL)hasReconciledStateHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)reconciledStateHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setReconciledStateHash:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPassSyncReconciledStateAccepted

- (BOOL)hasReconciledStateHash
{
  return self->_reconciledStateHash != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPassSyncReconciledStateAccepted;
  v4 = [(NPKProtoPassSyncReconciledStateAccepted *)&v8 description];
  v5 = [(NPKProtoPassSyncReconciledStateAccepted *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  reconciledStateHash = self->_reconciledStateHash;
  if (reconciledStateHash) {
    [v3 setObject:reconciledStateHash forKey:@"reconciledStateHash"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPassSyncReconciledStateAcceptedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_reconciledStateHash) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  reconciledStateHash = self->_reconciledStateHash;
  if (reconciledStateHash) {
    [a3 setReconciledStateHash:reconciledStateHash];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_reconciledStateHash copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    reconciledStateHash = self->_reconciledStateHash;
    if ((unint64_t)reconciledStateHash | v4[1]) {
      char v6 = -[NSData isEqual:](reconciledStateHash, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSData *)self->_reconciledStateHash hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoPassSyncReconciledStateAccepted setReconciledStateHash:](self, "setReconciledStateHash:");
  }
}

- (NSData)reconciledStateHash
{
  return self->_reconciledStateHash;
}

- (void)setReconciledStateHash:(id)a3
{
}

- (void).cxx_destruct
{
}

@end