@interface VMTranscriptMessage
- (BOOL)hasProtocolVersion;
- (BOOL)hasTranscriptionData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)transcriptionData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)protocolVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasProtocolVersion:(BOOL)a3;
- (void)setProtocolVersion:(unsigned int)a3;
- (void)setTranscriptionData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VMTranscriptMessage

- (void)setProtocolVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProtocolVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasTranscriptionData
{
  return self->_transcriptionData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VMTranscriptMessage;
  v4 = [(VMTranscriptMessage *)&v8 description];
  v5 = [(VMTranscriptMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedInt:self->_protocolVersion];
    [v3 setObject:v4 forKey:@"protocolVersion"];
  }
  transcriptionData = self->_transcriptionData;
  if (transcriptionData) {
    [v3 setObject:transcriptionData forKey:@"transcriptionData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VMTranscriptMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_transcriptionData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_protocolVersion;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_transcriptionData)
  {
    id v5 = v4;
    objc_msgSend(v4, "setTranscriptionData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_protocolVersion;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_transcriptionData copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
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
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_protocolVersion != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  transcriptionData = self->_transcriptionData;
  if ((unint64_t)transcriptionData | *((void *)v4 + 2)) {
    char v6 = -[NSData isEqual:](transcriptionData, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_protocolVersion;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSData *)self->_transcriptionData hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[6])
  {
    self->_protocolVersion = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[VMTranscriptMessage setTranscriptionData:](self, "setTranscriptionData:");
    id v4 = v5;
  }
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (NSData)transcriptionData
{
  return self->_transcriptionData;
}

- (void)setTranscriptionData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end