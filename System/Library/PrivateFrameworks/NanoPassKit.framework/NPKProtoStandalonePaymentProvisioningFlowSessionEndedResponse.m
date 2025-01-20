@interface NPKProtoStandalonePaymentProvisioningFlowSessionEndedResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandaloneResponseHeader)responseHeader;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setResponseHeader:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowSessionEndedResponse

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowSessionEndedResponse;
  v4 = [(NPKProtoStandalonePaymentProvisioningFlowSessionEndedResponse *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowSessionEndedResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  responseHeader = self->_responseHeader;
  if (responseHeader)
  {
    v5 = [(NPKProtoStandaloneResponseHeader *)responseHeader dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"ResponseHeader"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowSessionEndedResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_responseHeader) {
    -[NPKProtoStandalonePaymentProvisioningFlowSessionEndedResponse writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoStandaloneResponseHeader *)self->_responseHeader copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    responseHeader = self->_responseHeader;
    if ((unint64_t)responseHeader | v4[1]) {
      char v6 = -[NPKProtoStandaloneResponseHeader isEqual:](responseHeader, "isEqual:");
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
  return [(NPKProtoStandaloneResponseHeader *)self->_responseHeader hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  responseHeader = self->_responseHeader;
  uint64_t v6 = v4[1];
  if (responseHeader)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[NPKProtoStandaloneResponseHeader mergeFrom:](responseHeader, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[NPKProtoStandalonePaymentProvisioningFlowSessionEndedResponse setResponseHeader:](self, "setResponseHeader:");
  }
  id v4 = v7;
LABEL_7:
}

- (NPKProtoStandaloneResponseHeader)responseHeader
{
  return self->_responseHeader;
}

- (void)setResponseHeader:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowSessionEndedResponse writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowSessionEndedResponse.m", 86, "self->_responseHeader != nil");
}

@end