@interface NPKProtoDisplayableSharesForPassIdentifierRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)passIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPassIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoDisplayableSharesForPassIdentifierRequest

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoDisplayableSharesForPassIdentifierRequest;
  v4 = [(NPKProtoDisplayableSharesForPassIdentifierRequest *)&v8 description];
  v5 = [(NPKProtoDisplayableSharesForPassIdentifierRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  passIdentifier = self->_passIdentifier;
  if (passIdentifier) {
    [v3 setObject:passIdentifier forKey:@"passIdentifier"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoDisplayableSharesForPassIdentifierRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_passIdentifier) {
    -[NPKProtoDisplayableSharesForPassIdentifierRequest writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_passIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    passIdentifier = self->_passIdentifier;
    if ((unint64_t)passIdentifier | v4[1]) {
      char v6 = -[NSString isEqual:](passIdentifier, "isEqual:");
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
  return [(NSString *)self->_passIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoDisplayableSharesForPassIdentifierRequest setPassIdentifier:](self, "setPassIdentifier:");
  }
}

- (NSString)passIdentifier
{
  return self->_passIdentifier;
}

- (void)setPassIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoDisplayableSharesForPassIdentifierRequest writeTo:]", "NPKProtoDisplayableSharesForPassIdentifierRequest.m", 72, "nil != self->_passIdentifier");
}

@end