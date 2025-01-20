@interface _MRSetVolumeMutedMessageProtobuf
- (BOOL)hasDetails;
- (BOOL)hasIsMuted;
- (BOOL)hasOutputDeviceUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMuted;
- (BOOL)readFrom:(id)a3;
- (NSString)outputDeviceUID;
- (_MRRequestDetailsProtobuf)details;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDetails:(id)a3;
- (void)setHasIsMuted:(BOOL)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setOutputDeviceUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSetVolumeMutedMessageProtobuf

- (void)setIsMuted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isMuted = a3;
}

- (void)setHasIsMuted:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsMuted
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasOutputDeviceUID
{
  return self->_outputDeviceUID != 0;
}

- (BOOL)hasDetails
{
  return self->_details != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSetVolumeMutedMessageProtobuf;
  v4 = [(_MRSetVolumeMutedMessageProtobuf *)&v8 description];
  v5 = [(_MRSetVolumeMutedMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithBool:self->_isMuted];
    [v3 setObject:v4 forKey:@"isMuted"];
  }
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID) {
    [v3 setObject:outputDeviceUID forKey:@"outputDeviceUID"];
  }
  details = self->_details;
  if (details)
  {
    v7 = [(_MRRequestDetailsProtobuf *)details dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"details"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSetVolumeMutedMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_outputDeviceUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_details)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_isMuted;
    v4[28] |= 1u;
  }
  id v5 = v4;
  if (self->_outputDeviceUID)
  {
    objc_msgSend(v4, "setOutputDeviceUID:");
    id v4 = v5;
  }
  if (self->_details)
  {
    objc_msgSend(v5, "setDetails:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_isMuted;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_outputDeviceUID copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(_MRRequestDetailsProtobuf *)self->_details copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_isMuted)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_10;
      }
    }
LABEL_14:
    char v7 = 0;
    goto LABEL_15;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_14;
  }
LABEL_10:
  outputDeviceUID = self->_outputDeviceUID;
  if ((unint64_t)outputDeviceUID | *((void *)v4 + 2)
    && !-[NSString isEqual:](outputDeviceUID, "isEqual:"))
  {
    goto LABEL_14;
  }
  details = self->_details;
  if ((unint64_t)details | *((void *)v4 + 1)) {
    char v7 = -[_MRRequestDetailsProtobuf isEqual:](details, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_isMuted;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_outputDeviceUID hash] ^ v3;
  return v4 ^ [(_MRRequestDetailsProtobuf *)self->_details hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  uint64_t v5 = v4;
  if (v4[28])
  {
    self->_isMuted = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  objc_super v8 = v4;
  if (*((void *)v4 + 2))
  {
    -[_MRSetVolumeMutedMessageProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
    uint64_t v5 = v8;
  }
  details = self->_details;
  uint64_t v7 = *((void *)v5 + 1);
  if (details)
  {
    if (!v7) {
      goto LABEL_11;
    }
    details = (_MRRequestDetailsProtobuf *)-[_MRRequestDetailsProtobuf mergeFrom:](details, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    details = (_MRRequestDetailsProtobuf *)-[_MRSetVolumeMutedMessageProtobuf setDetails:](self, "setDetails:");
  }
  uint64_t v5 = v8;
LABEL_11:

  MEMORY[0x1F41817F8](details, v5);
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
}

- (_MRRequestDetailsProtobuf)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);

  objc_storeStrong((id *)&self->_details, 0);
}

@end