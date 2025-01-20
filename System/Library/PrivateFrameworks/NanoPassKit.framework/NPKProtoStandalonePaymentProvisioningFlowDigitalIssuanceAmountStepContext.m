@interface NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext
- (BOOL)allowsReaderModeEntry;
- (BOOL)hasAllowsReaderModeEntry;
- (BOOL)hasProduct;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandalonePaymentSetupProduct)product;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowsReaderModeEntry:(BOOL)a3;
- (void)setHasAllowsReaderModeEntry:(BOOL)a3;
- (void)setProduct:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext

- (BOOL)hasProduct
{
  return self->_product != 0;
}

- (void)setAllowsReaderModeEntry:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_allowsReaderModeEntry = a3;
}

- (void)setHasAllowsReaderModeEntry:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAllowsReaderModeEntry
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext;
  v4 = [(NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  product = self->_product;
  if (product)
  {
    v5 = [(NPKProtoStandalonePaymentSetupProduct *)product dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"product"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_allowsReaderModeEntry];
    [v3 setObject:v6 forKey:@"allowsReaderModeEntry"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_product)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_product)
  {
    id v5 = v4;
    objc_msgSend(v4, "setProduct:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_allowsReaderModeEntry;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoStandalonePaymentSetupProduct *)self->_product copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_allowsReaderModeEntry;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  product = self->_product;
  if ((unint64_t)product | *((void *)v4 + 1))
  {
    if (!-[NPKProtoStandalonePaymentSetupProduct isEqual:](product, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_allowsReaderModeEntry)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NPKProtoStandalonePaymentSetupProduct *)self->_product hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_allowsReaderModeEntry;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  product = self->_product;
  uint64_t v6 = *((void *)v4 + 1);
  if (product)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[NPKProtoStandalonePaymentSetupProduct mergeFrom:](product, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext setProduct:](self, "setProduct:");
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 20))
  {
    self->_allowsReaderModeEntry = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NPKProtoStandalonePaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
}

- (BOOL)allowsReaderModeEntry
{
  return self->_allowsReaderModeEntry;
}

- (void).cxx_destruct
{
}

@end