@interface NARPBWorkspaceMetadata
- (BOOL)hasSequenceNumber;
- (BOOL)hasUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)description;
- (NSString)objectIdentifier;
- (NSString)sequencer;
- (NSString)uUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)syncId;
- (int64_t)changeType;
- (unint64_t)hash;
- (unsigned)sequenceNumber;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setUUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NARPBWorkspaceMetadata

- (void)setSequenceNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequenceNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasUUID
{
  return self->_uUID != 0;
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)NARPBWorkspaceMetadata;
  v3 = [(NARPBWorkspaceMetadata *)&v7 description];
  v4 = [(NARPBWorkspaceMetadata *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return (NSString *)v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_sequenceNumber];
    [v3 setObject:v4 forKey:@"sequenceNumber"];
  }
  uUID = self->_uUID;
  if (uUID) {
    [v3 setObject:uUID forKey:@"UUID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100009A14((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_uUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_sequenceNumber;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_uUID)
  {
    id v5 = v4;
    objc_msgSend(v4, "setUUID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = self->_sequenceNumber;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  id v7 = [(NSString *)self->_uUID copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  uUID = self->_uUID;
  if ((unint64_t)uUID | *((void *)v4 + 2)) {
    unsigned __int8 v6 = -[NSString isEqual:](uUID, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_sequenceNumber;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_uUID hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[6])
  {
    self->_sequenceNumber = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    id v5 = v4;
    -[NARPBWorkspaceMetadata setUUID:](self, "setUUID:");
    id v4 = v5;
  }
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSString)uUID
{
  return self->_uUID;
}

- (void)setUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)syncId
{
  uint64_t v2 = +[NSNumber numberWithUnsignedInt:[(NARPBWorkspaceMetadata *)self sequenceNumber]];
  v3 = +[NSString stringWithFormat:@"%@", v2];

  return v3;
}

- (NSString)objectIdentifier
{
  return (NSString *)[(NARPBWorkspaceMetadata *)self syncId];
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return 1;
}

@end