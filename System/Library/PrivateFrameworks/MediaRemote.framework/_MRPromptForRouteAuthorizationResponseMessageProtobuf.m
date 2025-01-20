@interface _MRPromptForRouteAuthorizationResponseMessageProtobuf
- (BOOL)hasResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)response;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setResponse:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPromptForRouteAuthorizationResponseMessageProtobuf

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRPromptForRouteAuthorizationResponseMessageProtobuf;
  v4 = [(_MRPromptForRouteAuthorizationResponseMessageProtobuf *)&v8 description];
  v5 = [(_MRPromptForRouteAuthorizationResponseMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  response = self->_response;
  if (response) {
    [v3 setObject:response forKey:@"response"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPromptForRouteAuthorizationResponseMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_response) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  response = self->_response;
  if (response) {
    [a3 setResponse:response];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_response copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    response = self->_response;
    if ((unint64_t)response | v4[1]) {
      char v6 = -[NSString isEqual:](response, "isEqual:");
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
  return [(NSString *)self->_response hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[_MRPromptForRouteAuthorizationResponseMessageProtobuf setResponse:](self, "setResponse:");
  }
}

- (NSString)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (void).cxx_destruct
{
}

@end