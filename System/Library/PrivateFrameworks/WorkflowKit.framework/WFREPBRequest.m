@interface WFREPBRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)message;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMessage:(id)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setMessage:(id)a3
{
}

- (NSData)message
{
  return self->_message;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (int)version
{
  return self->_version;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[WFREPBRequest setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  self->_version = v4[6];
  if (*((void *)v4 + 2))
  {
    -[WFREPBRequest setMessage:](self, "setMessage:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  uint64_t v4 = 2654435761 * self->_version;
  return v4 ^ v3 ^ [(NSData *)self->_message hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[1]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && self->_version == *((_DWORD *)v4 + 6))
  {
    message = self->_message;
    if ((unint64_t)message | v4[2]) {
      char v7 = -[NSData isEqual:](message, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  char v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(_DWORD *)(v5 + 24) = self->_version;
  uint64_t v8 = [(NSData *)self->_message copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  identifier = self->_identifier;
  uint64_t v5 = a3;
  [v5 setIdentifier:identifier];
  v5[6] = self->_version;
  [v5 setMessage:self->_message];
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_identifier) {
    __assert_rtn("-[WFREPBRequest writeTo:]", "WFREPBRequest.m", 90, "nil != self->_identifier");
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (!self->_message) {
    __assert_rtn("-[WFREPBRequest writeTo:]", "WFREPBRequest.m", 99, "nil != self->_message");
  }
  PBDataWriterWriteDataField();
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  uint64_t v6 = [NSNumber numberWithInt:self->_version];
  [v4 setObject:v6 forKey:@"version"];

  message = self->_message;
  if (message) {
    [v4 setObject:message forKey:@"message"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBRequest;
  id v4 = [(WFREPBRequest *)&v8 description];
  uint64_t v5 = [(WFREPBRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end