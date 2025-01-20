@interface NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext
- (BOOL)cardAdded;
- (BOOL)hasCardAdded;
- (BOOL)hasError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandaloneError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCardAdded:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setHasCardAdded:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext

- (void)setCardAdded:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cardAdded = a3;
}

- (void)setHasCardAdded:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCardAdded
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext;
  v4 = [(NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithBool:self->_cardAdded];
    [v3 setObject:v4 forKey:@"cardAdded"];
  }
  error = self->_error;
  if (error)
  {
    v6 = [(NPKProtoStandaloneError *)error dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"error"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_cardAdded;
    v4[20] |= 1u;
  }
  if (self->_error)
  {
    id v5 = v4;
    objc_msgSend(v4, "setError:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_cardAdded;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  id v7 = [(NPKProtoStandaloneError *)self->_error copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_cardAdded)
      {
        if (*((unsigned char *)v4 + 16)) {
          goto LABEL_12;
        }
      }
      else if (!*((unsigned char *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    char v5 = 0;
    goto LABEL_7;
  }
  if (*((unsigned char *)v4 + 20)) {
    goto LABEL_6;
  }
LABEL_12:
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 1)) {
    char v5 = -[NPKProtoStandaloneError isEqual:](error, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_cardAdded;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NPKProtoStandaloneError *)self->_error hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (*((unsigned char *)v4 + 20))
  {
    self->_cardAdded = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
  error = self->_error;
  uint64_t v7 = v5[1];
  if (error)
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_super v8 = v5;
    -[NPKProtoStandaloneError mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_super v8 = v5;
    -[NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext setError:](self, "setError:");
  }
  char v5 = v8;
LABEL_9:
}

- (BOOL)cardAdded
{
  return self->_cardAdded;
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
}

@end