@interface _MRApplicationConnectionMessageProtobuf
- (BOOL)hasHeader;
- (BOOL)hasUnderlyingMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)underlyingMessage;
- (_MRApplicationConnectionMessageHeaderProtobuf)header;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHeader:(id)a3;
- (void)setUnderlyingMessage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRApplicationConnectionMessageProtobuf

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRApplicationConnectionMessageHeaderProtobuf *)self->_header copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_underlyingMessage copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (BOOL)hasUnderlyingMessage
{
  return self->_underlyingMessage != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRApplicationConnectionMessageProtobuf;
  v4 = [(_MRApplicationConnectionMessageProtobuf *)&v8 description];
  v5 = [(_MRApplicationConnectionMessageProtobuf *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  header = self->_header;
  if (header)
  {
    v5 = [(_MRApplicationConnectionMessageHeaderProtobuf *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  underlyingMessage = self->_underlyingMessage;
  if (underlyingMessage) {
    [v3 setObject:underlyingMessage forKey:@"underlyingMessage"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRApplicationConnectionMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_underlyingMessage)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_header)
  {
    objc_msgSend(v4, "setHeader:");
    id v4 = v5;
  }
  if (self->_underlyingMessage)
  {
    objc_msgSend(v5, "setUnderlyingMessage:");
    id v4 = v5;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((header = self->_header, !((unint64_t)header | v4[1]))
     || -[_MRApplicationConnectionMessageHeaderProtobuf isEqual:](header, "isEqual:")))
  {
    underlyingMessage = self->_underlyingMessage;
    if ((unint64_t)underlyingMessage | v4[2]) {
      char v7 = -[NSData isEqual:](underlyingMessage, "isEqual:");
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
  unint64_t v3 = [(_MRApplicationConnectionMessageHeaderProtobuf *)self->_header hash];
  return [(NSData *)self->_underlyingMessage hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  header = self->_header;
  uint64_t v6 = v4[1];
  char v7 = v4;
  if (header)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRApplicationConnectionMessageHeaderProtobuf mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRApplicationConnectionMessageProtobuf setHeader:](self, "setHeader:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[2]) {
    -[_MRApplicationConnectionMessageProtobuf setUnderlyingMessage:](self, "setUnderlyingMessage:");
  }

  MEMORY[0x1F41817F8]();
}

- (_MRApplicationConnectionMessageHeaderProtobuf)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSData)underlyingMessage
{
  return self->_underlyingMessage;
}

- (void)setUnderlyingMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingMessage, 0);

  objc_storeStrong((id *)&self->_header, 0);
}

@end