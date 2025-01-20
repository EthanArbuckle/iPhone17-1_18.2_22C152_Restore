@interface NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest
- (BOOL)hasChosenFlowPickerItemIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandaloneRequestHeader)requestHeader;
- (NSString)chosenFlowPickerItemIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChosenFlowPickerItemIdentifier:(id)a3;
- (void)setRequestHeader:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest

- (BOOL)hasChosenFlowPickerItemIdentifier
{
  return self->_chosenFlowPickerItemIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest;
  v4 = [(NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest *)self dictionaryRepresentation];
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
  chosenFlowPickerItemIdentifier = self->_chosenFlowPickerItemIdentifier;
  if (chosenFlowPickerItemIdentifier) {
    [v3 setObject:chosenFlowPickerItemIdentifier forKey:@"chosenFlowPickerItemIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_requestHeader) {
    -[NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_chosenFlowPickerItemIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setRequestHeader:self->_requestHeader];
  if (self->_chosenFlowPickerItemIdentifier) {
    objc_msgSend(v4, "setChosenFlowPickerItemIdentifier:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoStandaloneRequestHeader *)self->_requestHeader copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_chosenFlowPickerItemIdentifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestHeader = self->_requestHeader, !((unint64_t)requestHeader | v4[2]))
     || -[NPKProtoStandaloneRequestHeader isEqual:](requestHeader, "isEqual:")))
  {
    chosenFlowPickerItemIdentifier = self->_chosenFlowPickerItemIdentifier;
    if ((unint64_t)chosenFlowPickerItemIdentifier | v4[1]) {
      char v7 = -[NSString isEqual:](chosenFlowPickerItemIdentifier, "isEqual:");
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
  return [(NSString *)self->_chosenFlowPickerItemIdentifier hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  requestHeader = self->_requestHeader;
  uint64_t v6 = v4[2];
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
    -[NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest setRequestHeader:](self, "setRequestHeader:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest setChosenFlowPickerItemIdentifier:](self, "setChosenFlowPickerItemIdentifier:");
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

- (NSString)chosenFlowPickerItemIdentifier
{
  return self->_chosenFlowPickerItemIdentifier;
}

- (void)setChosenFlowPickerItemIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHeader, 0);
  objc_storeStrong((id *)&self->_chosenFlowPickerItemIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest.m", 101, "self->_requestHeader != nil");
}

@end