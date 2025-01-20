@interface NPKProtoStandalonePaymentProvisioningMethodMetadata
+ (Class)requiredFieldsType;
- (BOOL)hasCurrency;
- (BOOL)hasDepositAmount;
- (BOOL)hasDigitalIssuanceMetadata;
- (BOOL)hasMaxLoadedBalance;
- (BOOL)hasMinLoadedBalance;
- (BOOL)hasMinimumReaderModeBalance;
- (BOOL)hasProductIdentifier;
- (BOOL)hasReaderModeMetadataJson;
- (BOOL)hasReaderModeResourcesJson;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandalonePaymentDigitalIssuanceMetadata)digitalIssuanceMetadata;
- (NSMutableArray)requiredFields;
- (NSString)currency;
- (NSString)depositAmount;
- (NSString)maxLoadedBalance;
- (NSString)minLoadedBalance;
- (NSString)minimumReaderModeBalance;
- (NSString)productIdentifier;
- (NSString)readerModeMetadataJson;
- (NSString)readerModeResourcesJson;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)requiredFieldsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)requiredFieldsCount;
- (void)addRequiredFields:(id)a3;
- (void)clearRequiredFields;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setDepositAmount:(id)a3;
- (void)setDigitalIssuanceMetadata:(id)a3;
- (void)setMaxLoadedBalance:(id)a3;
- (void)setMinLoadedBalance:(id)a3;
- (void)setMinimumReaderModeBalance:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setReaderModeMetadataJson:(id)a3;
- (void)setReaderModeResourcesJson:(id)a3;
- (void)setRequiredFields:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningMethodMetadata

- (BOOL)hasProductIdentifier
{
  return self->_productIdentifier != 0;
}

- (BOOL)hasCurrency
{
  return self->_currency != 0;
}

- (BOOL)hasDepositAmount
{
  return self->_depositAmount != 0;
}

- (BOOL)hasMinLoadedBalance
{
  return self->_minLoadedBalance != 0;
}

- (BOOL)hasMaxLoadedBalance
{
  return self->_maxLoadedBalance != 0;
}

- (void)clearRequiredFields
{
}

- (void)addRequiredFields:(id)a3
{
  id v4 = a3;
  requiredFields = self->_requiredFields;
  id v8 = v4;
  if (!requiredFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_requiredFields;
    self->_requiredFields = v6;

    id v4 = v8;
    requiredFields = self->_requiredFields;
  }
  [(NSMutableArray *)requiredFields addObject:v4];
}

- (unint64_t)requiredFieldsCount
{
  return [(NSMutableArray *)self->_requiredFields count];
}

- (id)requiredFieldsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_requiredFields objectAtIndex:a3];
}

+ (Class)requiredFieldsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasReaderModeMetadataJson
{
  return self->_readerModeMetadataJson != 0;
}

- (BOOL)hasDigitalIssuanceMetadata
{
  return self->_digitalIssuanceMetadata != 0;
}

- (BOOL)hasReaderModeResourcesJson
{
  return self->_readerModeResourcesJson != 0;
}

- (BOOL)hasMinimumReaderModeBalance
{
  return self->_minimumReaderModeBalance != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningMethodMetadata;
  id v4 = [(NPKProtoStandalonePaymentProvisioningMethodMetadata *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningMethodMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  productIdentifier = self->_productIdentifier;
  if (productIdentifier) {
    [v3 setObject:productIdentifier forKey:@"productIdentifier"];
  }
  currency = self->_currency;
  if (currency) {
    [v4 setObject:currency forKey:@"currency"];
  }
  depositAmount = self->_depositAmount;
  if (depositAmount) {
    [v4 setObject:depositAmount forKey:@"depositAmount"];
  }
  minLoadedBalance = self->_minLoadedBalance;
  if (minLoadedBalance) {
    [v4 setObject:minLoadedBalance forKey:@"minLoadedBalance"];
  }
  maxLoadedBalance = self->_maxLoadedBalance;
  if (maxLoadedBalance) {
    [v4 setObject:maxLoadedBalance forKey:@"maxLoadedBalance"];
  }
  if ([(NSMutableArray *)self->_requiredFields count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_requiredFields, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v11 = self->_requiredFields;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (void)v23);
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"requiredFields"];
  }
  readerModeMetadataJson = self->_readerModeMetadataJson;
  if (readerModeMetadataJson) {
    [v4 setObject:readerModeMetadataJson forKey:@"readerModeMetadataJson"];
  }
  digitalIssuanceMetadata = self->_digitalIssuanceMetadata;
  if (digitalIssuanceMetadata)
  {
    v19 = [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)digitalIssuanceMetadata dictionaryRepresentation];
    [v4 setObject:v19 forKey:@"digitalIssuanceMetadata"];
  }
  readerModeResourcesJson = self->_readerModeResourcesJson;
  if (readerModeResourcesJson) {
    [v4 setObject:readerModeResourcesJson forKey:@"readerModeResourcesJson"];
  }
  minimumReaderModeBalance = self->_minimumReaderModeBalance;
  if (minimumReaderModeBalance) {
    [v4 setObject:minimumReaderModeBalance forKey:@"minimumReaderModeBalance"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningMethodMetadataReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_productIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_currency) {
    PBDataWriterWriteStringField();
  }
  if (self->_depositAmount) {
    PBDataWriterWriteStringField();
  }
  if (self->_minLoadedBalance) {
    PBDataWriterWriteStringField();
  }
  if (self->_maxLoadedBalance) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_requiredFields;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_readerModeMetadataJson) {
    PBDataWriterWriteStringField();
  }
  if (self->_digitalIssuanceMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_readerModeResourcesJson) {
    PBDataWriterWriteStringField();
  }
  if (self->_minimumReaderModeBalance) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_productIdentifier) {
    objc_msgSend(v9, "setProductIdentifier:");
  }
  if (self->_currency) {
    objc_msgSend(v9, "setCurrency:");
  }
  if (self->_depositAmount) {
    objc_msgSend(v9, "setDepositAmount:");
  }
  if (self->_minLoadedBalance) {
    objc_msgSend(v9, "setMinLoadedBalance:");
  }
  if (self->_maxLoadedBalance) {
    objc_msgSend(v9, "setMaxLoadedBalance:");
  }
  if ([(NPKProtoStandalonePaymentProvisioningMethodMetadata *)self requiredFieldsCount])
  {
    [v9 clearRequiredFields];
    unint64_t v4 = [(NPKProtoStandalonePaymentProvisioningMethodMetadata *)self requiredFieldsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoStandalonePaymentProvisioningMethodMetadata *)self requiredFieldsAtIndex:i];
        [v9 addRequiredFields:v7];
      }
    }
  }
  if (self->_readerModeMetadataJson) {
    objc_msgSend(v9, "setReaderModeMetadataJson:");
  }
  uint64_t v8 = v9;
  if (self->_digitalIssuanceMetadata)
  {
    objc_msgSend(v9, "setDigitalIssuanceMetadata:");
    uint64_t v8 = v9;
  }
  if (self->_readerModeResourcesJson)
  {
    objc_msgSend(v9, "setReaderModeResourcesJson:");
    uint64_t v8 = v9;
  }
  if (self->_minimumReaderModeBalance)
  {
    objc_msgSend(v9, "setMinimumReaderModeBalance:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_productIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[7];
  v5[7] = v6;

  uint64_t v8 = [(NSString *)self->_currency copyWithZone:a3];
  id v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_depositAmount copyWithZone:a3];
  long long v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSString *)self->_minLoadedBalance copyWithZone:a3];
  long long v13 = (void *)v5[5];
  v5[5] = v12;

  uint64_t v14 = [(NSString *)self->_maxLoadedBalance copyWithZone:a3];
  uint64_t v15 = (void *)v5[4];
  v5[4] = v14;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v16 = self->_requiredFields;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v20), "copyWithZone:", a3, (void)v31);
        [v5 addRequiredFields:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v18);
  }

  uint64_t v22 = [(NSString *)self->_readerModeMetadataJson copyWithZone:a3];
  long long v23 = (void *)v5[8];
  v5[8] = v22;

  id v24 = [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)self->_digitalIssuanceMetadata copyWithZone:a3];
  long long v25 = (void *)v5[3];
  v5[3] = v24;

  uint64_t v26 = [(NSString *)self->_readerModeResourcesJson copyWithZone:a3];
  v27 = (void *)v5[9];
  v5[9] = v26;

  uint64_t v28 = [(NSString *)self->_minimumReaderModeBalance copyWithZone:a3];
  v29 = (void *)v5[6];
  v5[6] = v28;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  productIdentifier = self->_productIdentifier;
  if ((unint64_t)productIdentifier | v4[7])
  {
    if (!-[NSString isEqual:](productIdentifier, "isEqual:")) {
      goto LABEL_22;
    }
  }
  currency = self->_currency;
  if ((unint64_t)currency | v4[1] && !-[NSString isEqual:](currency, "isEqual:")) {
    goto LABEL_22;
  }
  if (((depositAmount = self->_depositAmount, !((unint64_t)depositAmount | v4[2]))
     || -[NSString isEqual:](depositAmount, "isEqual:"))
    && ((minLoadedBalance = self->_minLoadedBalance, !((unint64_t)minLoadedBalance | v4[5]))
     || -[NSString isEqual:](minLoadedBalance, "isEqual:"))
    && ((maxLoadedBalance = self->_maxLoadedBalance, !((unint64_t)maxLoadedBalance | v4[4]))
     || -[NSString isEqual:](maxLoadedBalance, "isEqual:"))
    && ((requiredFields = self->_requiredFields, !((unint64_t)requiredFields | v4[10]))
     || -[NSMutableArray isEqual:](requiredFields, "isEqual:"))
    && ((readerModeMetadataJson = self->_readerModeMetadataJson, !((unint64_t)readerModeMetadataJson | v4[8]))
     || -[NSString isEqual:](readerModeMetadataJson, "isEqual:"))
    && ((digitalIssuanceMetadata = self->_digitalIssuanceMetadata, !((unint64_t)digitalIssuanceMetadata | v4[3]))
     || -[NPKProtoStandalonePaymentDigitalIssuanceMetadata isEqual:](digitalIssuanceMetadata, "isEqual:"))
    && ((readerModeResourcesJson = self->_readerModeResourcesJson, !((unint64_t)readerModeResourcesJson | v4[9]))
     || -[NSString isEqual:](readerModeResourcesJson, "isEqual:")))
  {
    minimumReaderModeBalance = self->_minimumReaderModeBalance;
    if ((unint64_t)minimumReaderModeBalance | v4[6]) {
      char v15 = -[NSString isEqual:](minimumReaderModeBalance, "isEqual:");
    }
    else {
      char v15 = 1;
    }
  }
  else
  {
LABEL_22:
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_productIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_currency hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_depositAmount hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_minLoadedBalance hash];
  NSUInteger v7 = [(NSString *)self->_maxLoadedBalance hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_requiredFields hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_readerModeMetadataJson hash];
  unint64_t v10 = [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)self->_digitalIssuanceMetadata hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_readerModeResourcesJson hash];
  return v9 ^ v11 ^ [(NSString *)self->_minimumReaderModeBalance hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 7)) {
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setProductIdentifier:](self, "setProductIdentifier:");
  }
  if (*((void *)v4 + 1)) {
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setCurrency:](self, "setCurrency:");
  }
  if (*((void *)v4 + 2)) {
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setDepositAmount:](self, "setDepositAmount:");
  }
  if (*((void *)v4 + 5)) {
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setMinLoadedBalance:](self, "setMinLoadedBalance:");
  }
  if (*((void *)v4 + 4)) {
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setMaxLoadedBalance:](self, "setMaxLoadedBalance:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 10);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NPKProtoStandalonePaymentProvisioningMethodMetadata addRequiredFields:](self, "addRequiredFields:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 8)) {
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setReaderModeMetadataJson:](self, "setReaderModeMetadataJson:");
  }
  digitalIssuanceMetadata = self->_digitalIssuanceMetadata;
  uint64_t v11 = *((void *)v4 + 3);
  if (digitalIssuanceMetadata)
  {
    if (v11) {
      -[NPKProtoStandalonePaymentDigitalIssuanceMetadata mergeFrom:](digitalIssuanceMetadata, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setDigitalIssuanceMetadata:](self, "setDigitalIssuanceMetadata:");
  }
  if (*((void *)v4 + 9)) {
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setReaderModeResourcesJson:](self, "setReaderModeResourcesJson:");
  }
  if (*((void *)v4 + 6)) {
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setMinimumReaderModeBalance:](self, "setMinimumReaderModeBalance:");
  }
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (NSString)depositAmount
{
  return self->_depositAmount;
}

- (void)setDepositAmount:(id)a3
{
}

- (NSString)minLoadedBalance
{
  return self->_minLoadedBalance;
}

- (void)setMinLoadedBalance:(id)a3
{
}

- (NSString)maxLoadedBalance
{
  return self->_maxLoadedBalance;
}

- (void)setMaxLoadedBalance:(id)a3
{
}

- (NSMutableArray)requiredFields
{
  return self->_requiredFields;
}

- (void)setRequiredFields:(id)a3
{
}

- (NSString)readerModeMetadataJson
{
  return self->_readerModeMetadataJson;
}

- (void)setReaderModeMetadataJson:(id)a3
{
}

- (NPKProtoStandalonePaymentDigitalIssuanceMetadata)digitalIssuanceMetadata
{
  return self->_digitalIssuanceMetadata;
}

- (void)setDigitalIssuanceMetadata:(id)a3
{
}

- (NSString)readerModeResourcesJson
{
  return self->_readerModeResourcesJson;
}

- (void)setReaderModeResourcesJson:(id)a3
{
}

- (NSString)minimumReaderModeBalance
{
  return self->_minimumReaderModeBalance;
}

- (void)setMinimumReaderModeBalance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredFields, 0);
  objc_storeStrong((id *)&self->_readerModeResourcesJson, 0);
  objc_storeStrong((id *)&self->_readerModeMetadataJson, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_minimumReaderModeBalance, 0);
  objc_storeStrong((id *)&self->_minLoadedBalance, 0);
  objc_storeStrong((id *)&self->_maxLoadedBalance, 0);
  objc_storeStrong((id *)&self->_digitalIssuanceMetadata, 0);
  objc_storeStrong((id *)&self->_depositAmount, 0);
  objc_storeStrong((id *)&self->_currency, 0);
}

@end