@interface _MRApplicationConnectionProtocolMessageProtobuf
- (BOOL)hasApplicationMessage;
- (BOOL)hasContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRApplicationConnectionContextProtobuf)context;
- (_MRApplicationConnectionMessageProtobuf)applicationMessage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationMessage:(id)a3;
- (void)setContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRApplicationConnectionProtocolMessageProtobuf

- (BOOL)hasApplicationMessage
{
  return self->_applicationMessage != 0;
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRApplicationConnectionProtocolMessageProtobuf;
  v4 = [(_MRApplicationConnectionProtocolMessageProtobuf *)&v8 description];
  v5 = [(_MRApplicationConnectionProtocolMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  applicationMessage = self->_applicationMessage;
  if (applicationMessage)
  {
    v5 = [(_MRApplicationConnectionMessageProtobuf *)applicationMessage dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"applicationMessage"];
  }
  context = self->_context;
  if (context)
  {
    v7 = [(_MRApplicationConnectionContextProtobuf *)context dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"context"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRApplicationConnectionProtocolMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_applicationMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_context)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_applicationMessage)
  {
    objc_msgSend(v4, "setApplicationMessage:");
    id v4 = v5;
  }
  if (self->_context)
  {
    objc_msgSend(v5, "setContext:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRApplicationConnectionMessageProtobuf *)self->_applicationMessage copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(_MRApplicationConnectionContextProtobuf *)self->_context copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((applicationMessage = self->_applicationMessage, !((unint64_t)applicationMessage | v4[1]))
     || -[_MRApplicationConnectionMessageProtobuf isEqual:](applicationMessage, "isEqual:")))
  {
    context = self->_context;
    if ((unint64_t)context | v4[2]) {
      char v7 = -[_MRApplicationConnectionContextProtobuf isEqual:](context, "isEqual:");
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
  unint64_t v3 = [(_MRApplicationConnectionMessageProtobuf *)self->_applicationMessage hash];
  return [(_MRApplicationConnectionContextProtobuf *)self->_context hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  applicationMessage = self->_applicationMessage;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (applicationMessage)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRApplicationConnectionMessageProtobuf mergeFrom:](applicationMessage, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRApplicationConnectionProtocolMessageProtobuf setApplicationMessage:](self, "setApplicationMessage:");
  }
  id v4 = v9;
LABEL_7:
  context = self->_context;
  uint64_t v8 = v4[2];
  if (context)
  {
    if (v8) {
      -[_MRApplicationConnectionContextProtobuf mergeFrom:](context, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[_MRApplicationConnectionProtocolMessageProtobuf setContext:](self, "setContext:");
  }

  MEMORY[0x1F41817F8]();
}

- (_MRApplicationConnectionMessageProtobuf)applicationMessage
{
  return self->_applicationMessage;
}

- (void)setApplicationMessage:(id)a3
{
}

- (_MRApplicationConnectionContextProtobuf)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_applicationMessage, 0);
}

@end