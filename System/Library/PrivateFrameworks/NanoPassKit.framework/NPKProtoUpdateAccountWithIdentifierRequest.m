@interface NPKProtoUpdateAccountWithIdentifierRequest
- (BOOL)hasAccountIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)accountIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoUpdateAccountWithIdentifierRequest

- (BOOL)hasAccountIdentifier
{
  return self->_accountIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoUpdateAccountWithIdentifierRequest;
  v4 = [(NPKProtoUpdateAccountWithIdentifierRequest *)&v8 description];
  v5 = [(NPKProtoUpdateAccountWithIdentifierRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier) {
    [v3 setObject:accountIdentifier forKey:@"accountIdentifier"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoUpdateAccountWithIdentifierRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_accountIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier) {
    [a3 setAccountIdentifier:accountIdentifier];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    accountIdentifier = self->_accountIdentifier;
    if ((unint64_t)accountIdentifier | v4[1]) {
      char v6 = -[NSString isEqual:](accountIdentifier, "isEqual:");
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
  return [(NSString *)self->_accountIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoUpdateAccountWithIdentifierRequest setAccountIdentifier:](self, "setAccountIdentifier:");
  }
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end