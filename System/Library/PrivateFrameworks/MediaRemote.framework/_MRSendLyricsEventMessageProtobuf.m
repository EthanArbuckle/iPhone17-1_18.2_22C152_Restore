@interface _MRSendLyricsEventMessageProtobuf
- (BOOL)hasEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRLyricsEventProtobuf)event;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEvent:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSendLyricsEventMessageProtobuf

- (BOOL)hasEvent
{
  return self->_event != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSendLyricsEventMessageProtobuf;
  v4 = [(_MRSendLyricsEventMessageProtobuf *)&v8 description];
  v5 = [(_MRSendLyricsEventMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  event = self->_event;
  if (event)
  {
    v5 = [(_MRLyricsEventProtobuf *)event dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"event"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendLyricsEventMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_event) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  event = self->_event;
  if (event) {
    [a3 setEvent:event];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRLyricsEventProtobuf *)self->_event copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    event = self->_event;
    if ((unint64_t)event | v4[1]) {
      char v6 = -[_MRLyricsEventProtobuf isEqual:](event, "isEqual:");
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
  return [(_MRLyricsEventProtobuf *)self->_event hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  event = self->_event;
  uint64_t v6 = v4[1];
  if (event)
  {
    if (v6) {
      -[_MRLyricsEventProtobuf mergeFrom:](event, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRSendLyricsEventMessageProtobuf setEvent:](self, "setEvent:");
  }

  MEMORY[0x1F41817F8]();
}

- (_MRLyricsEventProtobuf)event
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