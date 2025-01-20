@interface NPKProtoPaymentWebServiceRegistrationRequest
- (BOOL)hasBrokerURLString;
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)brokerURLString;
- (NSString)reason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBrokerURLString:(id)a3;
- (void)setReason:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPaymentWebServiceRegistrationRequest

- (BOOL)hasBrokerURLString
{
  return self->_brokerURLString != 0;
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPaymentWebServiceRegistrationRequest;
  v4 = [(NPKProtoPaymentWebServiceRegistrationRequest *)&v8 description];
  v5 = [(NPKProtoPaymentWebServiceRegistrationRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  brokerURLString = self->_brokerURLString;
  if (brokerURLString) {
    [v3 setObject:brokerURLString forKey:@"brokerURLString"];
  }
  reason = self->_reason;
  if (reason) {
    [v4 setObject:reason forKey:@"reason"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPaymentWebServiceRegistrationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_brokerURLString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_reason)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_brokerURLString)
  {
    objc_msgSend(v4, "setBrokerURLString:");
    id v4 = v5;
  }
  if (self->_reason)
  {
    objc_msgSend(v5, "setReason:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_brokerURLString copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_reason copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((brokerURLString = self->_brokerURLString, !((unint64_t)brokerURLString | v4[1]))
     || -[NSString isEqual:](brokerURLString, "isEqual:")))
  {
    reason = self->_reason;
    if ((unint64_t)reason | v4[2]) {
      char v7 = -[NSString isEqual:](reason, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_brokerURLString hash];
  return [(NSString *)self->_reason hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[NPKProtoPaymentWebServiceRegistrationRequest setBrokerURLString:](self, "setBrokerURLString:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[NPKProtoPaymentWebServiceRegistrationRequest setReason:](self, "setReason:");
    id v4 = v5;
  }
}

- (NSString)brokerURLString
{
  return self->_brokerURLString;
}

- (void)setBrokerURLString:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_brokerURLString, 0);
}

@end