@interface NPKProtoCarKeyRoutingInformationResponse
- (BOOL)hasErrorData;
- (BOOL)hasRoutingInformation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)errorData;
- (NSString)routingInformation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setRoutingInformation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCarKeyRoutingInformationResponse

- (BOOL)hasRoutingInformation
{
  return self->_routingInformation != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCarKeyRoutingInformationResponse;
  v4 = [(NPKProtoCarKeyRoutingInformationResponse *)&v8 description];
  v5 = [(NPKProtoCarKeyRoutingInformationResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  routingInformation = self->_routingInformation;
  if (routingInformation) {
    [v3 setObject:routingInformation forKey:@"routingInformation"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v4 setObject:errorData forKey:@"errorData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCarKeyRoutingInformationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_routingInformation)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_routingInformation)
  {
    objc_msgSend(v4, "setRoutingInformation:");
    id v4 = v5;
  }
  if (self->_errorData)
  {
    objc_msgSend(v5, "setErrorData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_routingInformation copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_errorData copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((routingInformation = self->_routingInformation, !((unint64_t)routingInformation | v4[2]))
     || -[NSString isEqual:](routingInformation, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[1]) {
      char v7 = -[NSData isEqual:](errorData, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_routingInformation hash];
  return [(NSData *)self->_errorData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    [(NPKProtoCarKeyRoutingInformationResponse *)self setRoutingInformation:"setRoutingInformation:"];
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoCarKeyRoutingInformationResponse setErrorData:](self, "setErrorData:");
    id v4 = v5;
  }
}

- (NSString)routingInformation
{
  return self->_routingInformation;
}

- (void)setRoutingInformation:(id)a3
{
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingInformation, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end