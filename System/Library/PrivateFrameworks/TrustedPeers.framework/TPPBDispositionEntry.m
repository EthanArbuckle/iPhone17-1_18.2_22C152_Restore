@interface TPPBDispositionEntry
- (BOOL)hasDisposition;
- (BOOL)hasPeerID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)peerID;
- (TPPBDisposition)disposition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisposition:(id)a3;
- (void)setPeerID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBDispositionEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_disposition, 0);
}

- (void)setDisposition:(id)a3
{
}

- (TPPBDisposition)disposition
{
  return self->_disposition;
}

- (void)setPeerID:(id)a3
{
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[TPPBDispositionEntry setPeerID:](self, "setPeerID:");
    v4 = v7;
  }
  disposition = self->_disposition;
  uint64_t v6 = v4[1];
  if (disposition)
  {
    if (v6) {
      -[TPPBDisposition mergeFrom:](disposition, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[TPPBDispositionEntry setDisposition:](self, "setDisposition:");
  }
  MEMORY[0x270F9A758]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_peerID hash];
  return [(TPPBDisposition *)self->_disposition hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((peerID = self->_peerID, !((unint64_t)peerID | v4[2]))
     || -[NSString isEqual:](peerID, "isEqual:")))
  {
    disposition = self->_disposition;
    if ((unint64_t)disposition | v4[1]) {
      char v7 = -[TPPBDisposition isEqual:](disposition, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_peerID copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(TPPBDisposition *)self->_disposition copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_peerID)
  {
    objc_msgSend(v4, "setPeerID:");
    id v4 = v5;
  }
  if (self->_disposition)
  {
    objc_msgSend(v5, "setDisposition:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_peerID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_disposition)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBDispositionEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  peerID = self->_peerID;
  if (peerID) {
    [v3 setObject:peerID forKey:@"peerID"];
  }
  disposition = self->_disposition;
  if (disposition)
  {
    char v7 = [(TPPBDisposition *)disposition dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"disposition"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBDispositionEntry;
  id v4 = [(TPPBDispositionEntry *)&v8 description];
  id v5 = [(TPPBDispositionEntry *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasDisposition
{
  return self->_disposition != 0;
}

- (BOOL)hasPeerID
{
  return self->_peerID != 0;
}

@end