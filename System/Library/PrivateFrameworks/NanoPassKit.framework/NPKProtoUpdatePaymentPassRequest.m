@interface NPKProtoUpdatePaymentPassRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)passTypeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoUpdatePaymentPassRequest

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoUpdatePaymentPassRequest;
  v4 = [(NPKProtoUpdatePaymentPassRequest *)&v8 description];
  v5 = [(NPKProtoUpdatePaymentPassRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  passTypeIdentifier = self->_passTypeIdentifier;
  if (passTypeIdentifier) {
    [v3 setObject:passTypeIdentifier forKey:@"passTypeIdentifier"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoUpdatePaymentPassRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_passTypeIdentifier) {
    -[NPKProtoUpdatePaymentPassRequest writeTo:]();
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
  uint64_t v6 = [(NSString *)self->_passTypeIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    passTypeIdentifier = self->_passTypeIdentifier;
    if ((unint64_t)passTypeIdentifier | v4[1]) {
      char v6 = -[NSString isEqual:](passTypeIdentifier, "isEqual:");
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
  return [(NSString *)self->_passTypeIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoUpdatePaymentPassRequest setPassTypeIdentifier:](self, "setPassTypeIdentifier:");
  }
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoUpdatePaymentPassRequest writeTo:]", "NPKProtoUpdatePaymentPassRequest.m", 72, "nil != self->_passTypeIdentifier");
}

@end