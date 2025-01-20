@interface NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest
- (BOOL)hasSelectedVerificationChannelIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandaloneRequestHeader)requestHeader;
- (NSString)selectedVerificationChannelIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRequestHeader:(id)a3;
- (void)setSelectedVerificationChannelIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest

- (BOOL)hasSelectedVerificationChannelIdentifier
{
  return self->_selectedVerificationChannelIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest;
  v4 = [(NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  requestHeader = self->_requestHeader;
  if (requestHeader)
  {
    v5 = [(NPKProtoStandaloneRequestHeader *)requestHeader dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"requestHeader"];
  }
  selectedVerificationChannelIdentifier = self->_selectedVerificationChannelIdentifier;
  if (selectedVerificationChannelIdentifier) {
    [v3 setObject:selectedVerificationChannelIdentifier forKey:@"selectedVerificationChannelIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_requestHeader) {
    -[NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_selectedVerificationChannelIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setRequestHeader:self->_requestHeader];
  if (self->_selectedVerificationChannelIdentifier) {
    objc_msgSend(v4, "setSelectedVerificationChannelIdentifier:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoStandaloneRequestHeader *)self->_requestHeader copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_selectedVerificationChannelIdentifier copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestHeader = self->_requestHeader, !((unint64_t)requestHeader | v4[1]))
     || -[NPKProtoStandaloneRequestHeader isEqual:](requestHeader, "isEqual:")))
  {
    selectedVerificationChannelIdentifier = self->_selectedVerificationChannelIdentifier;
    if ((unint64_t)selectedVerificationChannelIdentifier | v4[2]) {
      char v7 = -[NSString isEqual:](selectedVerificationChannelIdentifier, "isEqual:");
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
  unint64_t v3 = [(NPKProtoStandaloneRequestHeader *)self->_requestHeader hash];
  return [(NSString *)self->_selectedVerificationChannelIdentifier hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  requestHeader = self->_requestHeader;
  uint64_t v6 = v4[1];
  char v7 = v4;
  if (requestHeader)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandaloneRequestHeader mergeFrom:](requestHeader, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest setRequestHeader:](self, "setRequestHeader:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest setSelectedVerificationChannelIdentifier:](self, "setSelectedVerificationChannelIdentifier:");
    id v4 = v7;
  }
}

- (NPKProtoStandaloneRequestHeader)requestHeader
{
  return self->_requestHeader;
}

- (void)setRequestHeader:(id)a3
{
}

- (NSString)selectedVerificationChannelIdentifier
{
  return self->_selectedVerificationChannelIdentifier;
}

- (void)setSelectedVerificationChannelIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedVerificationChannelIdentifier, 0);
  objc_storeStrong((id *)&self->_requestHeader, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest.m", 101, "self->_requestHeader != nil");
}

@end