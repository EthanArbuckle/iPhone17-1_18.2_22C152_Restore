@interface NPKProtoStandalonePaymentRemoteCredential
- (BOOL)hasIdentifier;
- (BOOL)hasPassURL;
- (BOOL)hasPaymentPass;
- (BOOL)hasProductIdentifier;
- (BOOL)hasRank;
- (BOOL)hasStatusDescription;
- (BOOL)hasSummaryMetadataDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandalonePaymentCredential)paymentCredential;
- (NPKProtoStandalonePaymentPass)paymentPass;
- (NSString)identifier;
- (NSString)passURL;
- (NSString)productIdentifier;
- (NSString)statusDescription;
- (NSString)summaryMetadataDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)rank;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRank:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setPassURL:(id)a3;
- (void)setPaymentCredential:(id)a3;
- (void)setPaymentPass:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setRank:(unsigned int)a3;
- (void)setStatusDescription:(id)a3;
- (void)setSummaryMetadataDescription:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentRemoteCredential

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasPassURL
{
  return self->_passURL != 0;
}

- (BOOL)hasSummaryMetadataDescription
{
  return self->_summaryMetadataDescription != 0;
}

- (BOOL)hasStatusDescription
{
  return self->_statusDescription != 0;
}

- (BOOL)hasPaymentPass
{
  return self->_paymentPass != 0;
}

- (void)setRank:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_rank = a3;
}

- (void)setHasRank:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRank
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasProductIdentifier
{
  return self->_productIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentRemoteCredential;
  v4 = [(NPKProtoStandalonePaymentRemoteCredential *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentRemoteCredential *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  paymentCredential = self->_paymentCredential;
  if (paymentCredential)
  {
    v5 = [(NPKProtoStandalonePaymentCredential *)paymentCredential dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"paymentCredential"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  passURL = self->_passURL;
  if (passURL) {
    [v3 setObject:passURL forKey:@"passURL"];
  }
  summaryMetadataDescription = self->_summaryMetadataDescription;
  if (summaryMetadataDescription) {
    [v3 setObject:summaryMetadataDescription forKey:@"summaryMetadataDescription"];
  }
  statusDescription = self->_statusDescription;
  if (statusDescription) {
    [v3 setObject:statusDescription forKey:@"statusDescription"];
  }
  paymentPass = self->_paymentPass;
  if (paymentPass)
  {
    v11 = [(NPKProtoStandalonePaymentPass *)paymentPass dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"paymentPass"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v12 = [NSNumber numberWithUnsignedInt:self->_rank];
    [v3 setObject:v12 forKey:@"rank"];
  }
  productIdentifier = self->_productIdentifier;
  if (productIdentifier) {
    [v3 setObject:productIdentifier forKey:@"productIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentRemoteCredentialReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_paymentCredential) {
    -[NPKProtoStandalonePaymentRemoteCredential writeTo:]();
  }
  id v6 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_passURL) {
    PBDataWriterWriteStringField();
  }
  v5 = v6;
  if (self->_summaryMetadataDescription)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_statusDescription)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_paymentPass)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    v5 = v6;
  }
  if (self->_productIdentifier)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setPaymentCredential:self->_paymentCredential];
  if (self->_identifier) {
    objc_msgSend(v5, "setIdentifier:");
  }
  if (self->_passURL) {
    objc_msgSend(v5, "setPassURL:");
  }
  id v4 = v5;
  if (self->_summaryMetadataDescription)
  {
    objc_msgSend(v5, "setSummaryMetadataDescription:");
    id v4 = v5;
  }
  if (self->_statusDescription)
  {
    objc_msgSend(v5, "setStatusDescription:");
    id v4 = v5;
  }
  if (self->_paymentPass)
  {
    objc_msgSend(v5, "setPaymentPass:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[12] = self->_rank;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  if (self->_productIdentifier)
  {
    objc_msgSend(v5, "setProductIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoStandalonePaymentCredential *)self->_paymentCredential copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_identifier copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_passURL copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_summaryMetadataDescription copyWithZone:a3];
  v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  uint64_t v14 = [(NSString *)self->_statusDescription copyWithZone:a3];
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  id v16 = [(NPKProtoStandalonePaymentPass *)self->_paymentPass copyWithZone:a3];
  v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_rank;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v18 = [(NSString *)self->_productIdentifier copyWithZone:a3];
  v19 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  paymentCredential = self->_paymentCredential;
  if ((unint64_t)paymentCredential | *((void *)v4 + 3))
  {
    if (!-[NPKProtoStandalonePaymentCredential isEqual:](paymentCredential, "isEqual:")) {
      goto LABEL_21;
    }
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_21;
    }
  }
  passURL = self->_passURL;
  if ((unint64_t)passURL | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](passURL, "isEqual:")) {
      goto LABEL_21;
    }
  }
  summaryMetadataDescription = self->_summaryMetadataDescription;
  if ((unint64_t)summaryMetadataDescription | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](summaryMetadataDescription, "isEqual:")) {
      goto LABEL_21;
    }
  }
  statusDescription = self->_statusDescription;
  if ((unint64_t)statusDescription | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](statusDescription, "isEqual:")) {
      goto LABEL_21;
    }
  }
  paymentPass = self->_paymentPass;
  if ((unint64_t)paymentPass | *((void *)v4 + 4))
  {
    if (!-[NPKProtoStandalonePaymentPass isEqual:](paymentPass, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_rank != *((_DWORD *)v4 + 12)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_21:
    char v12 = 0;
    goto LABEL_22;
  }
  productIdentifier = self->_productIdentifier;
  if ((unint64_t)productIdentifier | *((void *)v4 + 5)) {
    char v12 = -[NSString isEqual:](productIdentifier, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NPKProtoStandalonePaymentCredential *)self->_paymentCredential hash];
  NSUInteger v4 = [(NSString *)self->_identifier hash];
  NSUInteger v5 = [(NSString *)self->_passURL hash];
  NSUInteger v6 = [(NSString *)self->_summaryMetadataDescription hash];
  NSUInteger v7 = [(NSString *)self->_statusDescription hash];
  unint64_t v8 = [(NPKProtoStandalonePaymentPass *)self->_paymentPass hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_rank;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSString *)self->_productIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  paymentCredential = self->_paymentCredential;
  uint64_t v6 = *((void *)v4 + 3);
  id v9 = v4;
  if (paymentCredential)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandalonePaymentCredential mergeFrom:](paymentCredential, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandalonePaymentRemoteCredential setPaymentCredential:](self, "setPaymentCredential:");
  }
  id v4 = v9;
LABEL_7:
  if (*((void *)v4 + 1))
  {
    -[NPKProtoStandalonePaymentRemoteCredential setIdentifier:](self, "setIdentifier:");
    id v4 = v9;
  }
  if (*((void *)v4 + 2))
  {
    -[NPKProtoStandalonePaymentRemoteCredential setPassURL:](self, "setPassURL:");
    id v4 = v9;
  }
  if (*((void *)v4 + 8))
  {
    -[NPKProtoStandalonePaymentRemoteCredential setSummaryMetadataDescription:](self, "setSummaryMetadataDescription:");
    id v4 = v9;
  }
  if (*((void *)v4 + 7))
  {
    -[NPKProtoStandalonePaymentRemoteCredential setStatusDescription:](self, "setStatusDescription:");
    id v4 = v9;
  }
  paymentPass = self->_paymentPass;
  uint64_t v8 = *((void *)v4 + 4);
  if (paymentPass)
  {
    if (!v8) {
      goto LABEL_21;
    }
    -[NPKProtoStandalonePaymentPass mergeFrom:](paymentPass, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_21;
    }
    -[NPKProtoStandalonePaymentRemoteCredential setPaymentPass:](self, "setPaymentPass:");
  }
  id v4 = v9;
LABEL_21:
  if (*((unsigned char *)v4 + 72))
  {
    self->_rank = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5))
  {
    -[NPKProtoStandalonePaymentRemoteCredential setProductIdentifier:](self, "setProductIdentifier:");
    id v4 = v9;
  }
}

- (NPKProtoStandalonePaymentCredential)paymentCredential
{
  return self->_paymentCredential;
}

- (void)setPaymentCredential:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)passURL
{
  return self->_passURL;
}

- (void)setPassURL:(id)a3
{
}

- (NSString)summaryMetadataDescription
{
  return self->_summaryMetadataDescription;
}

- (void)setSummaryMetadataDescription:(id)a3
{
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (void)setStatusDescription:(id)a3
{
}

- (NPKProtoStandalonePaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
}

- (unsigned)rank
{
  return self->_rank;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryMetadataDescription, 0);
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_paymentCredential, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentRemoteCredential writeTo:]", "NPKProtoStandalonePaymentRemoteCredential.m", 213, "self->_paymentCredential != nil");
}

@end