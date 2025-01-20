@interface NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext
- (BOOL)hasLocalizedProgressDescription;
- (BOOL)hasProduct;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandalonePaymentSetupProduct)product;
- (NSString)localizedProgressDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLocalizedProgressDescription:(id)a3;
- (void)setProduct:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext

- (BOOL)hasLocalizedProgressDescription
{
  return self->_localizedProgressDescription != 0;
}

- (BOOL)hasProduct
{
  return self->_product != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext;
  v4 = [(NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  localizedProgressDescription = self->_localizedProgressDescription;
  if (localizedProgressDescription) {
    [v3 setObject:localizedProgressDescription forKey:@"localizedProgressDescription"];
  }
  product = self->_product;
  if (product)
  {
    v7 = [(NPKProtoStandalonePaymentSetupProduct *)product dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"product"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_localizedProgressDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_product)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_localizedProgressDescription)
  {
    objc_msgSend(v4, "setLocalizedProgressDescription:");
    id v4 = v5;
  }
  if (self->_product)
  {
    objc_msgSend(v5, "setProduct:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_localizedProgressDescription copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NPKProtoStandalonePaymentSetupProduct *)self->_product copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((localizedProgressDescription = self->_localizedProgressDescription,
         !((unint64_t)localizedProgressDescription | v4[1]))
     || -[NSString isEqual:](localizedProgressDescription, "isEqual:")))
  {
    product = self->_product;
    if ((unint64_t)product | v4[2]) {
      char v7 = -[NPKProtoStandalonePaymentSetupProduct isEqual:](product, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_localizedProgressDescription hash];
  return [(NPKProtoStandalonePaymentSetupProduct *)self->_product hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[1])
  {
    -[NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext setLocalizedProgressDescription:](self, "setLocalizedProgressDescription:");
    id v4 = v7;
  }
  product = self->_product;
  uint64_t v6 = v4[2];
  if (product)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[NPKProtoStandalonePaymentSetupProduct mergeFrom:](product, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext setProduct:](self, "setProduct:");
  }
  id v4 = v7;
LABEL_9:
}

- (NSString)localizedProgressDescription
{
  return self->_localizedProgressDescription;
}

- (void)setLocalizedProgressDescription:(id)a3
{
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
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_localizedProgressDescription, 0);
}

@end