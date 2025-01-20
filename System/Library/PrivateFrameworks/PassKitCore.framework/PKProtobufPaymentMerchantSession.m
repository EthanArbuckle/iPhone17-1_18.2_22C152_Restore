@interface PKProtobufPaymentMerchantSession
+ (Class)signedFieldsType;
- (BOOL)hasAmpEnrollmentPinning;
- (BOOL)hasDisplayName;
- (BOOL)hasDomain;
- (BOOL)hasEpochTimestamp;
- (BOOL)hasExpiresAt;
- (BOOL)hasInitiative;
- (BOOL)hasInitiativeContext;
- (BOOL)hasMerchantIdentifier;
- (BOOL)hasNonce;
- (BOOL)hasOperationalAnalyticsIdentifier;
- (BOOL)hasRetryNonce;
- (BOOL)hasSessionIdentifier;
- (BOOL)hasSignature;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)ampEnrollmentPinning;
- (NSData)signature;
- (NSMutableArray)signedFields;
- (NSString)displayName;
- (NSString)domain;
- (NSString)initiative;
- (NSString)initiativeContext;
- (NSString)merchantIdentifier;
- (NSString)nonce;
- (NSString)operationalAnalyticsIdentifier;
- (NSString)retryNonce;
- (NSString)sessionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)signedFieldsAtIndex:(unint64_t)a3;
- (unint64_t)epochTimestamp;
- (unint64_t)expiresAt;
- (unint64_t)hash;
- (unint64_t)signedFieldsCount;
- (void)addSignedFields:(id)a3;
- (void)clearSignedFields;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAmpEnrollmentPinning:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDomain:(id)a3;
- (void)setEpochTimestamp:(unint64_t)a3;
- (void)setExpiresAt:(unint64_t)a3;
- (void)setHasEpochTimestamp:(BOOL)a3;
- (void)setHasExpiresAt:(BOOL)a3;
- (void)setInitiative:(id)a3;
- (void)setInitiativeContext:(id)a3;
- (void)setMerchantIdentifier:(id)a3;
- (void)setNonce:(id)a3;
- (void)setOperationalAnalyticsIdentifier:(id)a3;
- (void)setRetryNonce:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSignedFields:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentMerchantSession

- (BOOL)hasMerchantIdentifier
{
  return self->_merchantIdentifier != 0;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
}

- (BOOL)hasNonce
{
  return self->_nonce != 0;
}

- (void)setEpochTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_epochTimestamp = a3;
}

- (void)setHasEpochTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEpochTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (BOOL)hasRetryNonce
{
  return self->_retryNonce != 0;
}

- (void)setExpiresAt:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_expiresAt = a3;
}

- (void)setHasExpiresAt:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpiresAt
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasInitiativeContext
{
  return self->_initiativeContext != 0;
}

- (BOOL)hasInitiative
{
  return self->_initiative != 0;
}

- (void)clearSignedFields
{
}

- (void)addSignedFields:(id)a3
{
  id v4 = a3;
  signedFields = self->_signedFields;
  id v8 = v4;
  if (!signedFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_signedFields;
    self->_signedFields = v6;

    id v4 = v8;
    signedFields = self->_signedFields;
  }
  [(NSMutableArray *)signedFields addObject:v4];
}

- (unint64_t)signedFieldsCount
{
  return [(NSMutableArray *)self->_signedFields count];
}

- (id)signedFieldsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_signedFields objectAtIndex:a3];
}

+ (Class)signedFieldsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAmpEnrollmentPinning
{
  return self->_ampEnrollmentPinning != 0;
}

- (BOOL)hasOperationalAnalyticsIdentifier
{
  return self->_operationalAnalyticsIdentifier != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentMerchantSession;
  id v4 = [(PKProtobufPaymentMerchantSession *)&v8 description];
  v5 = [(PKProtobufPaymentMerchantSession *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  merchantIdentifier = self->_merchantIdentifier;
  if (merchantIdentifier) {
    [v3 setObject:merchantIdentifier forKey:@"merchantIdentifier"];
  }
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier) {
    [v4 setObject:sessionIdentifier forKey:@"sessionIdentifier"];
  }
  nonce = self->_nonce;
  if (nonce) {
    [v4 setObject:nonce forKey:@"nonce"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_epochTimestamp];
    [v4 setObject:v8 forKey:@"epochTimestamp"];
  }
  domain = self->_domain;
  if (domain) {
    [v4 setObject:domain forKey:@"domain"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"displayName"];
  }
  signature = self->_signature;
  if (signature) {
    [v4 setObject:signature forKey:@"signature"];
  }
  retryNonce = self->_retryNonce;
  if (retryNonce) {
    [v4 setObject:retryNonce forKey:@"retryNonce"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v13 = [NSNumber numberWithUnsignedLongLong:self->_expiresAt];
    [v4 setObject:v13 forKey:@"expiresAt"];
  }
  initiativeContext = self->_initiativeContext;
  if (initiativeContext) {
    [v4 setObject:initiativeContext forKey:@"initiativeContext"];
  }
  initiative = self->_initiative;
  if (initiative) {
    [v4 setObject:initiative forKey:@"initiative"];
  }
  signedFields = self->_signedFields;
  if (signedFields) {
    [v4 setObject:signedFields forKey:@"signedFields"];
  }
  ampEnrollmentPinning = self->_ampEnrollmentPinning;
  if (ampEnrollmentPinning) {
    [v4 setObject:ampEnrollmentPinning forKey:@"ampEnrollmentPinning"];
  }
  operationalAnalyticsIdentifier = self->_operationalAnalyticsIdentifier;
  if (operationalAnalyticsIdentifier) {
    [v4 setObject:operationalAnalyticsIdentifier forKey:@"operationalAnalyticsIdentifier"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentMerchantSessionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_merchantIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_sessionIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_nonce) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  if (self->_signature) {
    PBDataWriterWriteDataField();
  }
  if (self->_retryNonce) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_initiativeContext) {
    PBDataWriterWriteStringField();
  }
  if (self->_initiative) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_signedFields;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_ampEnrollmentPinning) {
    PBDataWriterWriteDataField();
  }
  if (self->_operationalAnalyticsIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_merchantIdentifier)
  {
    objc_msgSend(v4, "setMerchantIdentifier:");
    id v4 = v10;
  }
  if (self->_sessionIdentifier)
  {
    objc_msgSend(v10, "setSessionIdentifier:");
    id v4 = v10;
  }
  if (self->_nonce)
  {
    objc_msgSend(v10, "setNonce:");
    id v4 = v10;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_epochTimestamp;
    *((unsigned char *)v4 + 120) |= 1u;
  }
  if (self->_domain)
  {
    objc_msgSend(v10, "setDomain:");
    id v4 = v10;
  }
  if (self->_displayName)
  {
    objc_msgSend(v10, "setDisplayName:");
    id v4 = v10;
  }
  if (self->_signature)
  {
    objc_msgSend(v10, "setSignature:");
    id v4 = v10;
  }
  if (self->_retryNonce)
  {
    objc_msgSend(v10, "setRetryNonce:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_expiresAt;
    *((unsigned char *)v4 + 120) |= 2u;
  }
  if (self->_initiativeContext) {
    objc_msgSend(v10, "setInitiativeContext:");
  }
  if (self->_initiative) {
    objc_msgSend(v10, "setInitiative:");
  }
  if ([(PKProtobufPaymentMerchantSession *)self signedFieldsCount])
  {
    [v10 clearSignedFields];
    unint64_t v5 = [(PKProtobufPaymentMerchantSession *)self signedFieldsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PKProtobufPaymentMerchantSession *)self signedFieldsAtIndex:i];
        [v10 addSignedFields:v8];
      }
    }
  }
  if (self->_ampEnrollmentPinning) {
    objc_msgSend(v10, "setAmpEnrollmentPinning:");
  }
  uint64_t v9 = v10;
  if (self->_operationalAnalyticsIdentifier)
  {
    objc_msgSend(v10, "setOperationalAnalyticsIdentifier:");
    uint64_t v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_merchantIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  uint64_t v8 = [(NSString *)self->_sessionIdentifier copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v8;

  uint64_t v10 = [(NSString *)self->_nonce copyWithZone:a3];
  long long v11 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_epochTimestamp;
    *(unsigned char *)(v5 + 120) |= 1u;
  }
  uint64_t v12 = [(NSString *)self->_domain copyWithZone:a3];
  long long v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  uint64_t v14 = [(NSString *)self->_displayName copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  uint64_t v16 = [(NSData *)self->_signature copyWithZone:a3];
  v17 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v16;

  uint64_t v18 = [(NSString *)self->_retryNonce copyWithZone:a3];
  v19 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v18;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_expiresAt;
    *(unsigned char *)(v5 + 120) |= 2u;
  }
  uint64_t v20 = [(NSString *)self->_initiativeContext copyWithZone:a3];
  v21 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v20;

  uint64_t v22 = [(NSString *)self->_initiative copyWithZone:a3];
  v23 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v22;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v24 = self->_signedFields;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "copyWithZone:", a3, (void)v35);
        [(id)v5 addSignedFields:v29];
      }
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v26);
  }

  uint64_t v30 = [(NSData *)self->_ampEnrollmentPinning copyWithZone:a3];
  v31 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v30;

  uint64_t v32 = [(NSString *)self->_operationalAnalyticsIdentifier copyWithZone:a3];
  v33 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v32;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  merchantIdentifier = self->_merchantIdentifier;
  if ((unint64_t)merchantIdentifier | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](merchantIdentifier, "isEqual:")) {
      goto LABEL_36;
    }
  }
  sessionIdentifier = self->_sessionIdentifier;
  if ((unint64_t)sessionIdentifier | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](sessionIdentifier, "isEqual:")) {
      goto LABEL_36;
    }
  }
  nonce = self->_nonce;
  if ((unint64_t)nonce | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](nonce, "isEqual:")) {
      goto LABEL_36;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 120) & 1) == 0 || self->_epochTimestamp != *((void *)v4 + 1)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 120))
  {
LABEL_36:
    char v17 = 0;
    goto LABEL_37;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((void *)v4 + 5) && !-[NSString isEqual:](domain, "isEqual:")) {
    goto LABEL_36;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_36;
    }
  }
  signature = self->_signature;
  if ((unint64_t)signature | *((void *)v4 + 13))
  {
    if (!-[NSData isEqual:](signature, "isEqual:")) {
      goto LABEL_36;
    }
  }
  retryNonce = self->_retryNonce;
  if ((unint64_t)retryNonce | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](retryNonce, "isEqual:")) {
      goto LABEL_36;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 2) == 0 || self->_expiresAt != *((void *)v4 + 2)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 2) != 0)
  {
    goto LABEL_36;
  }
  initiativeContext = self->_initiativeContext;
  if ((unint64_t)initiativeContext | *((void *)v4 + 7)
    && !-[NSString isEqual:](initiativeContext, "isEqual:"))
  {
    goto LABEL_36;
  }
  initiative = self->_initiative;
  if ((unint64_t)initiative | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](initiative, "isEqual:")) {
      goto LABEL_36;
    }
  }
  signedFields = self->_signedFields;
  if ((unint64_t)signedFields | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](signedFields, "isEqual:")) {
      goto LABEL_36;
    }
  }
  ampEnrollmentPinning = self->_ampEnrollmentPinning;
  if ((unint64_t)ampEnrollmentPinning | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](ampEnrollmentPinning, "isEqual:")) {
      goto LABEL_36;
    }
  }
  operationalAnalyticsIdentifier = self->_operationalAnalyticsIdentifier;
  if ((unint64_t)operationalAnalyticsIdentifier | *((void *)v4 + 10)) {
    char v17 = -[NSString isEqual:](operationalAnalyticsIdentifier, "isEqual:");
  }
  else {
    char v17 = 1;
  }
LABEL_37:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v17 = [(NSString *)self->_merchantIdentifier hash];
  NSUInteger v3 = [(NSString *)self->_sessionIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_nonce hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_epochTimestamp;
  }
  else {
    unint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_domain hash];
  NSUInteger v7 = [(NSString *)self->_displayName hash];
  uint64_t v8 = [(NSData *)self->_signature hash];
  NSUInteger v9 = [(NSString *)self->_retryNonce hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v10 = 2654435761u * self->_expiresAt;
  }
  else {
    unint64_t v10 = 0;
  }
  NSUInteger v11 = v3 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  NSUInteger v12 = v9 ^ v10 ^ [(NSString *)self->_initiativeContext hash];
  NSUInteger v13 = v11 ^ v12 ^ [(NSString *)self->_initiative hash];
  uint64_t v14 = [(NSMutableArray *)self->_signedFields hash];
  uint64_t v15 = v14 ^ [(NSData *)self->_ampEnrollmentPinning hash];
  return v13 ^ v15 ^ [(NSString *)self->_operationalAnalyticsIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 8)) {
    -[PKProtobufPaymentMerchantSession setMerchantIdentifier:](self, "setMerchantIdentifier:");
  }
  if (*((void *)v4 + 12)) {
    -[PKProtobufPaymentMerchantSession setSessionIdentifier:](self, "setSessionIdentifier:");
  }
  if (*((void *)v4 + 9)) {
    -[PKProtobufPaymentMerchantSession setNonce:](self, "setNonce:");
  }
  if (*((unsigned char *)v4 + 120))
  {
    self->_epochTimestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5)) {
    -[PKProtobufPaymentMerchantSession setDomain:](self, "setDomain:");
  }
  if (*((void *)v4 + 4)) {
    -[PKProtobufPaymentMerchantSession setDisplayName:](self, "setDisplayName:");
  }
  if (*((void *)v4 + 13)) {
    -[PKProtobufPaymentMerchantSession setSignature:](self, "setSignature:");
  }
  if (*((void *)v4 + 11)) {
    -[PKProtobufPaymentMerchantSession setRetryNonce:](self, "setRetryNonce:");
  }
  if ((*((unsigned char *)v4 + 120) & 2) != 0)
  {
    self->_expiresAt = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 7)) {
    -[PKProtobufPaymentMerchantSession setInitiativeContext:](self, "setInitiativeContext:");
  }
  if (*((void *)v4 + 6)) {
    -[PKProtobufPaymentMerchantSession setInitiative:](self, "setInitiative:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 14);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[PKProtobufPaymentMerchantSession addSignedFields:](self, "addSignedFields:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 3)) {
    -[PKProtobufPaymentMerchantSession setAmpEnrollmentPinning:](self, "setAmpEnrollmentPinning:");
  }
  if (*((void *)v4 + 10)) {
    -[PKProtobufPaymentMerchantSession setOperationalAnalyticsIdentifier:](self, "setOperationalAnalyticsIdentifier:");
  }
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (unint64_t)epochTimestamp
{
  return self->_epochTimestamp;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSString)retryNonce
{
  return self->_retryNonce;
}

- (void)setRetryNonce:(id)a3
{
}

- (unint64_t)expiresAt
{
  return self->_expiresAt;
}

- (NSString)initiativeContext
{
  return self->_initiativeContext;
}

- (void)setInitiativeContext:(id)a3
{
}

- (NSString)initiative
{
  return self->_initiative;
}

- (void)setInitiative:(id)a3
{
}

- (NSMutableArray)signedFields
{
  return self->_signedFields;
}

- (void)setSignedFields:(id)a3
{
}

- (NSData)ampEnrollmentPinning
{
  return self->_ampEnrollmentPinning;
}

- (void)setAmpEnrollmentPinning:(id)a3
{
}

- (NSString)operationalAnalyticsIdentifier
{
  return self->_operationalAnalyticsIdentifier;
}

- (void)setOperationalAnalyticsIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedFields, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_retryNonce, 0);
  objc_storeStrong((id *)&self->_operationalAnalyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_initiativeContext, 0);
  objc_storeStrong((id *)&self->_initiative, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_ampEnrollmentPinning, 0);
}

@end