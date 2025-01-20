@interface NPKProtoStandalonePaymentCredential
- (BOOL)hasExpiration;
- (BOOL)hasLongDescription;
- (BOOL)hasSanitizedPrimaryAccountNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)expiration;
- (NSString)longDescription;
- (NSString)sanitizedPrimaryAccountNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExpiration:(id)a3;
- (void)setLongDescription:(id)a3;
- (void)setSanitizedPrimaryAccountNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentCredential

- (BOOL)hasSanitizedPrimaryAccountNumber
{
  return self->_sanitizedPrimaryAccountNumber != 0;
}

- (BOOL)hasExpiration
{
  return self->_expiration != 0;
}

- (BOOL)hasLongDescription
{
  return self->_longDescription != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentCredential;
  v4 = [(NPKProtoStandalonePaymentCredential *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentCredential *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  sanitizedPrimaryAccountNumber = self->_sanitizedPrimaryAccountNumber;
  if (sanitizedPrimaryAccountNumber) {
    [v3 setObject:sanitizedPrimaryAccountNumber forKey:@"sanitizedPrimaryAccountNumber"];
  }
  expiration = self->_expiration;
  if (expiration) {
    [v4 setObject:expiration forKey:@"expiration"];
  }
  longDescription = self->_longDescription;
  if (longDescription) {
    [v4 setObject:longDescription forKey:@"longDescription"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentCredentialReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sanitizedPrimaryAccountNumber)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_expiration)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_longDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sanitizedPrimaryAccountNumber)
  {
    objc_msgSend(v4, "setSanitizedPrimaryAccountNumber:");
    id v4 = v5;
  }
  if (self->_expiration)
  {
    objc_msgSend(v5, "setExpiration:");
    id v4 = v5;
  }
  if (self->_longDescription)
  {
    objc_msgSend(v5, "setLongDescription:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sanitizedPrimaryAccountNumber copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_expiration copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_longDescription copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((sanitizedPrimaryAccountNumber = self->_sanitizedPrimaryAccountNumber,
         !((unint64_t)sanitizedPrimaryAccountNumber | v4[3]))
     || -[NSString isEqual:](sanitizedPrimaryAccountNumber, "isEqual:"))
    && ((expiration = self->_expiration, !((unint64_t)expiration | v4[1]))
     || -[NSString isEqual:](expiration, "isEqual:")))
  {
    longDescription = self->_longDescription;
    if ((unint64_t)longDescription | v4[2]) {
      char v8 = -[NSString isEqual:](longDescription, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sanitizedPrimaryAccountNumber hash];
  NSUInteger v4 = [(NSString *)self->_expiration hash] ^ v3;
  return v4 ^ [(NSString *)self->_longDescription hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[3]) {
    -[NPKProtoStandalonePaymentCredential setSanitizedPrimaryAccountNumber:](self, "setSanitizedPrimaryAccountNumber:");
  }
  if (v4[1]) {
    -[NPKProtoStandalonePaymentCredential setExpiration:](self, "setExpiration:");
  }
  if (v4[2]) {
    -[NPKProtoStandalonePaymentCredential setLongDescription:](self, "setLongDescription:");
  }
}

- (NSString)sanitizedPrimaryAccountNumber
{
  return self->_sanitizedPrimaryAccountNumber;
}

- (void)setSanitizedPrimaryAccountNumber:(id)a3
{
}

- (NSString)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
}

- (NSString)longDescription
{
  return self->_longDescription;
}

- (void)setLongDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sanitizedPrimaryAccountNumber, 0);
  objc_storeStrong((id *)&self->_longDescription, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
}

@end