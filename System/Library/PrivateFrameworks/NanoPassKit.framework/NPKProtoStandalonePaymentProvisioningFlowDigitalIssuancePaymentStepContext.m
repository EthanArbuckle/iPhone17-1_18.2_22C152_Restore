@interface NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext
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
- (void)setProduct:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext

- (BOOL)hasProduct
{
  return self->_product != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext;
  v4 = [(NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext *)self dictionaryRepresentation];
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
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_product) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  product = self->_product;
  if (product) {
    [a3 setProduct:product];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoStandalonePaymentSetupProduct *)self->_product copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    product = self->_product;
    if ((unint64_t)product | v4[1]) {
      char v6 = -[NPKProtoStandalonePaymentSetupProduct isEqual:](product, "isEqual:");
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
  return [(NPKProtoStandalonePaymentSetupProduct *)self->_product hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  product = self->_product;
  uint64_t v6 = v4[1];
  if (product)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[NPKProtoStandalonePaymentSetupProduct mergeFrom:](product, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext setProduct:](self, "setProduct:");
  }
  v4 = v7;
LABEL_7:
}

- (NPKProtoStandalonePaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
}

- (void).cxx_destruct
{
}

@end