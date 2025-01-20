@interface VMAudioMessage
- (BOOL)hasAudioData;
- (BOOL)hasProtocolVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)audioData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)protocolVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAudioData:(id)a3;
- (void)setHasProtocolVersion:(BOOL)a3;
- (void)setProtocolVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VMAudioMessage

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

- (BOOL)hasAudioData
{
  return self->_audioData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VMAudioMessage;
  v4 = [(VMAudioMessage *)&v8 description];
  v5 = [(VMAudioMessage *)self dictionaryRepresentation];
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
  audioData = self->_audioData;
  if (audioData) {
    [v3 setObject:audioData forKey:@"audioData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VMAudioMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_audioData)
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
    v4[4] = self->_protocolVersion;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  if (self->_audioData)
  {
    id v5 = v4;
    objc_msgSend(v4, "setAudioData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_protocolVersion;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_audioData copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

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
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_protocolVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  audioData = self->_audioData;
  if ((unint64_t)audioData | *((void *)v4 + 1)) {
    char v6 = -[NSData isEqual:](audioData, "isEqual:");
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
  return [(NSData *)self->_audioData hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[5])
  {
    self->_protocolVersion = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[VMAudioMessage setAudioData:](self, "setAudioData:");
    id v4 = v5;
  }
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (NSData)audioData
{
  return self->_audioData;
}

- (void)setAudioData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end