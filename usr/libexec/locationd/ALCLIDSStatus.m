@interface ALCLIDSStatus
- (BOOL)hasPairedModelId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)pairedModelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)connectionStatus;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConnectionStatus:(unsigned int)a3;
- (void)setPairedModelId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLIDSStatus

- (void)dealloc
{
  [(ALCLIDSStatus *)self setPairedModelId:0];
  v3.receiver = self;
  v3.super_class = (Class)ALCLIDSStatus;
  [(ALCLIDSStatus *)&v3 dealloc];
}

- (BOOL)hasPairedModelId
{
  return self->_pairedModelId != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCLIDSStatus;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCLIDSStatus *)&v3 description], [(ALCLIDSStatus *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_connectionStatus)] forKey:@"connectionStatus"];
  pairedModelId = self->_pairedModelId;
  if (pairedModelId) {
    [v3 setObject:pairedModelId forKey:@"pairedModelId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100A70270((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field();
  if (self->_pairedModelId)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_connectionStatus;
  pairedModelId = self->_pairedModelId;
  if (pairedModelId) {
    [a3 setPairedModelId:pairedModelId];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  *((_DWORD *)v5 + 2) = self->_connectionStatus;

  *((void *)v5 + 2) = [(NSString *)self->_pairedModelId copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_connectionStatus == *((_DWORD *)a3 + 2))
    {
      pairedModelId = self->_pairedModelId;
      if ((unint64_t)pairedModelId | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[NSString isEqual:](pairedModelId, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_connectionStatus;
  return [(NSString *)self->_pairedModelId hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_connectionStatus = *((_DWORD *)a3 + 2);
  if (*((void *)a3 + 2)) {
    -[ALCLIDSStatus setPairedModelId:](self, "setPairedModelId:");
  }
}

- (unsigned)connectionStatus
{
  return self->_connectionStatus;
}

- (void)setConnectionStatus:(unsigned int)a3
{
  self->_connectionStatus = a3;
}

- (NSString)pairedModelId
{
  return self->_pairedModelId;
}

- (void)setPairedModelId:(id)a3
{
}

@end