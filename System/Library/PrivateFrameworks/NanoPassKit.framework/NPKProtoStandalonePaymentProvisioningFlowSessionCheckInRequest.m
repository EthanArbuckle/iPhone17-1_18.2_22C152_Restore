@interface NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandaloneResponseHeader)requestHeader;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRequestHeader:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest;
  v4 = [(NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  requestHeader = self->_requestHeader;
  if (requestHeader)
  {
    v5 = [(NPKProtoStandaloneResponseHeader *)requestHeader dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"RequestHeader"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_requestHeader) {
    -[NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest writeTo:]();
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
  id v6 = [(NPKProtoStandaloneResponseHeader *)self->_requestHeader copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    requestHeader = self->_requestHeader;
    if ((unint64_t)requestHeader | v4[1]) {
      char v6 = -[NPKProtoStandaloneResponseHeader isEqual:](requestHeader, "isEqual:");
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
  return [(NPKProtoStandaloneResponseHeader *)self->_requestHeader hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  requestHeader = self->_requestHeader;
  uint64_t v6 = v4[1];
  if (requestHeader)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[NPKProtoStandaloneResponseHeader mergeFrom:](requestHeader, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest setRequestHeader:](self, "setRequestHeader:");
  }
  id v4 = v7;
LABEL_7:
}

- (NPKProtoStandaloneResponseHeader)requestHeader
{
  return self->_requestHeader;
}

- (void)setRequestHeader:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest.m", 86, "self->_requestHeader != nil");
}

@end