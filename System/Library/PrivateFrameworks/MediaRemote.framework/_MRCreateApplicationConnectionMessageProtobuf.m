@interface _MRCreateApplicationConnectionMessageProtobuf
- (BOOL)hasContext;
- (BOOL)hasRequestInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRApplicationConnectionContextProtobuf)context;
- (_MRApplicationConnectionRequestInfoProtobuf)requestInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContext:(id)a3;
- (void)setRequestInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRCreateApplicationConnectionMessageProtobuf

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (BOOL)hasRequestInfo
{
  return self->_requestInfo != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRCreateApplicationConnectionMessageProtobuf;
  v4 = [(_MRCreateApplicationConnectionMessageProtobuf *)&v8 description];
  v5 = [(_MRCreateApplicationConnectionMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  context = self->_context;
  if (context)
  {
    v5 = [(_MRApplicationConnectionContextProtobuf *)context dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"context"];
  }
  requestInfo = self->_requestInfo;
  if (requestInfo)
  {
    v7 = [(_MRApplicationConnectionRequestInfoProtobuf *)requestInfo dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"requestInfo"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRCreateApplicationConnectionMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_context)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_requestInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_context)
  {
    objc_msgSend(v4, "setContext:");
    id v4 = v5;
  }
  if (self->_requestInfo)
  {
    objc_msgSend(v5, "setRequestInfo:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRApplicationConnectionContextProtobuf *)self->_context copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(_MRApplicationConnectionRequestInfoProtobuf *)self->_requestInfo copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((context = self->_context, !((unint64_t)context | v4[1]))
     || -[_MRApplicationConnectionContextProtobuf isEqual:](context, "isEqual:")))
  {
    requestInfo = self->_requestInfo;
    if ((unint64_t)requestInfo | v4[2]) {
      char v7 = -[_MRApplicationConnectionRequestInfoProtobuf isEqual:](requestInfo, "isEqual:");
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
  unint64_t v3 = [(_MRApplicationConnectionContextProtobuf *)self->_context hash];
  return [(_MRApplicationConnectionRequestInfoProtobuf *)self->_requestInfo hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  context = self->_context;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (context)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRApplicationConnectionContextProtobuf mergeFrom:](context, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRCreateApplicationConnectionMessageProtobuf setContext:](self, "setContext:");
  }
  id v4 = v9;
LABEL_7:
  requestInfo = self->_requestInfo;
  uint64_t v8 = v4[2];
  if (requestInfo)
  {
    if (v8) {
      -[_MRApplicationConnectionRequestInfoProtobuf mergeFrom:](requestInfo, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[_MRCreateApplicationConnectionMessageProtobuf setRequestInfo:](self, "setRequestInfo:");
  }

  MEMORY[0x1F41817F8]();
}

- (_MRApplicationConnectionContextProtobuf)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (_MRApplicationConnectionRequestInfoProtobuf)requestInfo
{
  return self->_requestInfo;
}

- (void)setRequestInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestInfo, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end