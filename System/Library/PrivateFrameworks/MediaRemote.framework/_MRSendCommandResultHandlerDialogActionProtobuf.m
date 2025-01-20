@interface _MRSendCommandResultHandlerDialogActionProtobuf
- (BOOL)hasEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)title;
- (_MRSendCommandMessageProtobuf)event;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEvent:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSendCommandResultHandlerDialogActionProtobuf

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E57D3E08[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Cancel"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Destructive"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasEvent
{
  return self->_event != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSendCommandResultHandlerDialogActionProtobuf;
  int v4 = [(_MRSendCommandResultHandlerDialogActionProtobuf *)&v8 description];
  v5 = [(_MRSendCommandResultHandlerDialogActionProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t type = self->_type;
  if (type >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E57D3E08[type];
  }
  [v3 setObject:v5 forKey:@"type"];

  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  event = self->_event;
  if (event)
  {
    objc_super v8 = [(_MRSendCommandMessageProtobuf *)event dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"event"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendCommandResultHandlerDialogActionProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_title) {
    -[_MRSendCommandResultHandlerDialogActionProtobuf writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (self->_event) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[6] = self->_type;
  id v5 = v4;
  [v4 setTitle:self->_title];
  if (self->_event) {
    objc_msgSend(v5, "setEvent:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_type;
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(_MRSendCommandMessageProtobuf *)self->_event copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_type == *((_DWORD *)v4 + 6)
    && ((title = self->_title, !((unint64_t)title | v4[2]))
     || -[NSString isEqual:](title, "isEqual:")))
  {
    event = self->_event;
    if ((unint64_t)event | v4[1]) {
      char v7 = -[_MRSendCommandMessageProtobuf isEqual:](event, "isEqual:");
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
  uint64_t v3 = 2654435761 * self->_type;
  NSUInteger v4 = [(NSString *)self->_title hash];
  return v4 ^ [(_MRSendCommandMessageProtobuf *)self->_event hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  self->_uint64_t type = v4[6];
  char v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[_MRSendCommandResultHandlerDialogActionProtobuf setTitle:](self, "setTitle:");
    NSUInteger v4 = v7;
  }
  event = self->_event;
  uint64_t v6 = *((void *)v4 + 1);
  if (event)
  {
    if (v6) {
      -[_MRSendCommandMessageProtobuf mergeFrom:](event, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRSendCommandResultHandlerDialogActionProtobuf setEvent:](self, "setEvent:");
  }

  MEMORY[0x1F41817F8]();
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_uint64_t type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (_MRSendCommandMessageProtobuf)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_MRSendCommandResultHandlerDialogActionProtobuf writeTo:]", "_MRSendCommandResultHandlerDialogActionProtobuf.m", 120, "nil != self->_title");
}

@end