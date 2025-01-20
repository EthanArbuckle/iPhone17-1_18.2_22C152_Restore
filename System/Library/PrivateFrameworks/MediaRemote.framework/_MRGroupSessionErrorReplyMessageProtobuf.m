@interface _MRGroupSessionErrorReplyMessageProtobuf
- (BOOL)hasErrorMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorMessage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGroupSessionErrorReplyMessageProtobuf

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGroupSessionErrorReplyMessageProtobuf;
  v4 = [(_MRGroupSessionErrorReplyMessageProtobuf *)&v8 description];
  v5 = [(_MRGroupSessionErrorReplyMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  errorMessage = self->_errorMessage;
  if (errorMessage) {
    [v3 setObject:errorMessage forKey:@"errorMessage"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionErrorReplyMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_errorMessage) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  errorMessage = self->_errorMessage;
  if (errorMessage) {
    [a3 setErrorMessage:errorMessage];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_errorMessage copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    errorMessage = self->_errorMessage;
    if ((unint64_t)errorMessage | v4[1]) {
      char v6 = -[NSString isEqual:](errorMessage, "isEqual:");
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
  return [(NSString *)self->_errorMessage hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[_MRGroupSessionErrorReplyMessageProtobuf setErrorMessage:](self, "setErrorMessage:");
  }
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end