@interface NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse
- (BOOL)hasError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandaloneError)error;
- (NPKProtoStandaloneResponseHeader)responseHeader;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)setResponseHeader:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse;
  v4 = [(NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse *)self dictionaryRepresentation];
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
    [v3 setObject:v5 forKey:@"responseHeader"];
  }
  error = self->_error;
  if (error)
  {
    v7 = [(NPKProtoStandaloneError *)error dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"error"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_responseHeader) {
    -[NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_error) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setResponseHeader:self->_responseHeader];
  if (self->_error) {
    objc_msgSend(v4, "setError:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoStandaloneResponseHeader *)self->_responseHeader copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NPKProtoStandaloneError *)self->_error copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((responseHeader = self->_responseHeader, !((unint64_t)responseHeader | v4[2]))
     || -[NPKProtoStandaloneResponseHeader isEqual:](responseHeader, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[1]) {
      char v7 = -[NPKProtoStandaloneError isEqual:](error, "isEqual:");
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
  unint64_t v3 = [(NPKProtoStandaloneResponseHeader *)self->_responseHeader hash];
  return [(NPKProtoStandaloneError *)self->_error hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  responseHeader = self->_responseHeader;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (responseHeader)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandaloneResponseHeader mergeFrom:](responseHeader, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse setResponseHeader:](self, "setResponseHeader:");
  }
  id v4 = v9;
LABEL_7:
  error = self->_error;
  uint64_t v8 = v4[1];
  if (error)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[NPKProtoStandaloneError mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse setError:](self, "setError:");
  }
  id v4 = v9;
LABEL_13:
}

- (NPKProtoStandaloneResponseHeader)responseHeader
{
  return self->_responseHeader;
}

- (void)setResponseHeader:(id)a3
{
}

- (NPKProtoStandaloneError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseHeader, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowDidEncounterErrorResponse.m", 114, "self->_responseHeader != nil");
}

@end