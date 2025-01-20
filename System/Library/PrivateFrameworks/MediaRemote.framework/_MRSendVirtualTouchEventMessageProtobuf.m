@interface _MRSendVirtualTouchEventMessageProtobuf
- (BOOL)hasEvent;
- (BOOL)hasVirtualDeviceID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRVirtualTouchEventProtobuf)event;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)virtualDeviceID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEvent:(id)a3;
- (void)setHasVirtualDeviceID:(BOOL)a3;
- (void)setVirtualDeviceID:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSendVirtualTouchEventMessageProtobuf

- (void)setVirtualDeviceID:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_virtualDeviceID = a3;
}

- (void)setHasVirtualDeviceID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVirtualDeviceID
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasEvent
{
  return self->_event != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSendVirtualTouchEventMessageProtobuf;
  v4 = [(_MRSendVirtualTouchEventMessageProtobuf *)&v8 description];
  v5 = [(_MRSendVirtualTouchEventMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:self->_virtualDeviceID];
    [v3 setObject:v4 forKey:@"virtualDeviceID"];
  }
  event = self->_event;
  if (event)
  {
    v6 = [(_MRVirtualTouchEventProtobuf *)event dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"event"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendVirtualTouchEventMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_event)
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
    v4[1] = self->_virtualDeviceID;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_event)
  {
    id v5 = v4;
    objc_msgSend(v4, "setEvent:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_virtualDeviceID;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  id v7 = [(_MRVirtualTouchEventProtobuf *)self->_event copyWithZone:a3];
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
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_virtualDeviceID != *((void *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  event = self->_event;
  if ((unint64_t)event | *((void *)v4 + 2)) {
    char v6 = -[_MRVirtualTouchEventProtobuf isEqual:](event, "isEqual:");
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
    unint64_t v2 = 2654435761u * self->_virtualDeviceID;
  }
  else {
    unint64_t v2 = 0;
  }
  return [(_MRVirtualTouchEventProtobuf *)self->_event hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4[3])
  {
    self->_virtualDeviceID = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  event = self->_event;
  uint64_t v7 = v5[2];
  if (event)
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_super v8 = v5;
    event = (_MRVirtualTouchEventProtobuf *)-[_MRVirtualTouchEventProtobuf mergeFrom:](event, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_super v8 = v5;
    event = (_MRVirtualTouchEventProtobuf *)-[_MRSendVirtualTouchEventMessageProtobuf setEvent:](self, "setEvent:");
  }
  uint64_t v5 = v8;
LABEL_9:

  MEMORY[0x1F41817F8](event, v5);
}

- (unint64_t)virtualDeviceID
{
  return self->_virtualDeviceID;
}

- (_MRVirtualTouchEventProtobuf)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end