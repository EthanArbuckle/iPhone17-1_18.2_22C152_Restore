@interface NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext
- (BOOL)allowNonSecureHTTP;
- (BOOL)hasAllowNonSecureHTTP;
- (BOOL)hasProduct;
- (BOOL)hasTermsURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandalonePaymentSetupProduct)product;
- (NSString)termsURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowNonSecureHTTP:(BOOL)a3;
- (void)setHasAllowNonSecureHTTP:(BOOL)a3;
- (void)setProduct:(id)a3;
- (void)setTermsURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext

- (BOOL)hasTermsURL
{
  return self->_termsURL != 0;
}

- (void)setAllowNonSecureHTTP:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_allowNonSecureHTTP = a3;
}

- (void)setHasAllowNonSecureHTTP:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAllowNonSecureHTTP
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasProduct
{
  return self->_product != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext;
  v4 = [(NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  termsURL = self->_termsURL;
  if (termsURL) {
    [v3 setObject:termsURL forKey:@"termsURL"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_allowNonSecureHTTP];
    [v4 setObject:v6 forKey:@"allowNonSecureHTTP"];
  }
  product = self->_product;
  if (product)
  {
    objc_super v8 = [(NPKProtoStandalonePaymentSetupProduct *)product dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"product"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_termsURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
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
  if (self->_termsURL)
  {
    objc_msgSend(v4, "setTermsURL:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_allowNonSecureHTTP;
    v4[28] |= 1u;
  }
  if (self->_product)
  {
    objc_msgSend(v5, "setProduct:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_termsURL copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_allowNonSecureHTTP;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  id v8 = [(NPKProtoStandalonePaymentSetupProduct *)self->_product copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  termsURL = self->_termsURL;
  if ((unint64_t)termsURL | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](termsURL, "isEqual:")) {
      goto LABEL_8;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_allowNonSecureHTTP)
      {
        if (*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
      }
      else if (!*((unsigned char *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    char v6 = 0;
    goto LABEL_9;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_8;
  }
LABEL_14:
  product = self->_product;
  if ((unint64_t)product | *((void *)v4 + 1)) {
    char v6 = -[NPKProtoStandalonePaymentSetupProduct isEqual:](product, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_termsURL hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_allowNonSecureHTTP;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NPKProtoStandalonePaymentSetupProduct *)self->_product hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext setTermsURL:](self, "setTermsURL:");
    uint64_t v4 = v7;
  }
  if (v4[28])
  {
    self->_allowNonSecureHTTP = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  product = self->_product;
  uint64_t v6 = *((void *)v4 + 1);
  if (product)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[NPKProtoStandalonePaymentSetupProduct mergeFrom:](product, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext setProduct:](self, "setProduct:");
  }
  uint64_t v4 = v7;
LABEL_11:
}

- (NSString)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
}

- (BOOL)allowNonSecureHTTP
{
  return self->_allowNonSecureHTTP;
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
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end