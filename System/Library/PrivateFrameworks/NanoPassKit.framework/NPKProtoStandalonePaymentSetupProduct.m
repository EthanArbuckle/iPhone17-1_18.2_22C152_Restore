@interface NPKProtoStandalonePaymentSetupProduct
+ (Class)paymentOptionsType;
+ (Class)regionsType;
+ (Class)requestedProvisioningMethodsType;
+ (Class)requiredFieldsType;
+ (Class)supportedProtocolsType;
- (BOOL)hasDisplayName;
- (BOOL)hasFlags;
- (BOOL)hasHsa2Requirement;
- (BOOL)hasImageAssetURLs;
- (BOOL)hasPartnerIdentifier;
- (BOOL)hasPartnerName;
- (BOOL)hasProductIdentifier;
- (BOOL)hasReaderModeMetadataJson;
- (BOOL)hasSupportedProvisioningMethods;
- (BOOL)hasSuppressPendingPurchases;
- (BOOL)hasTermsURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)suppressPendingPurchases;
- (NPKProtoStandalonePaymentSetupProductImageAssetURLs)imageAssetURLs;
- (NSMutableArray)paymentOptions;
- (NSMutableArray)regions;
- (NSMutableArray)requestedProvisioningMethods;
- (NSMutableArray)requiredFields;
- (NSMutableArray)supportedProtocols;
- (NSString)displayName;
- (NSString)partnerIdentifier;
- (NSString)partnerName;
- (NSString)productIdentifier;
- (NSString)readerModeMetadataJson;
- (NSString)termsURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)paymentOptionsAtIndex:(unint64_t)a3;
- (id)regionsAtIndex:(unint64_t)a3;
- (id)requestedProvisioningMethodsAtIndex:(unint64_t)a3;
- (id)requiredFieldsAtIndex:(unint64_t)a3;
- (id)supportedProtocolsAtIndex:(unint64_t)a3;
- (int64_t)flags;
- (int64_t)hsa2Requirement;
- (int64_t)supportedProvisioningMethods;
- (unint64_t)hash;
- (unint64_t)paymentOptionsCount;
- (unint64_t)regionsCount;
- (unint64_t)requestedProvisioningMethodsCount;
- (unint64_t)requiredFieldsCount;
- (unint64_t)supportedProtocolsCount;
- (void)addPaymentOptions:(id)a3;
- (void)addRegions:(id)a3;
- (void)addRequestedProvisioningMethods:(id)a3;
- (void)addRequiredFields:(id)a3;
- (void)addSupportedProtocols:(id)a3;
- (void)clearPaymentOptions;
- (void)clearRegions;
- (void)clearRequestedProvisioningMethods;
- (void)clearRequiredFields;
- (void)clearSupportedProtocols;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setFlags:(int64_t)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasHsa2Requirement:(BOOL)a3;
- (void)setHasSupportedProvisioningMethods:(BOOL)a3;
- (void)setHasSuppressPendingPurchases:(BOOL)a3;
- (void)setHsa2Requirement:(int64_t)a3;
- (void)setImageAssetURLs:(id)a3;
- (void)setPartnerIdentifier:(id)a3;
- (void)setPartnerName:(id)a3;
- (void)setPaymentOptions:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setReaderModeMetadataJson:(id)a3;
- (void)setRegions:(id)a3;
- (void)setRequestedProvisioningMethods:(id)a3;
- (void)setRequiredFields:(id)a3;
- (void)setSupportedProtocols:(id)a3;
- (void)setSupportedProvisioningMethods:(int64_t)a3;
- (void)setSuppressPendingPurchases:(BOOL)a3;
- (void)setTermsURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentSetupProduct

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)clearRegions
{
}

- (void)addRegions:(id)a3
{
  id v4 = a3;
  regions = self->_regions;
  id v8 = v4;
  if (!regions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_regions;
    self->_regions = v6;

    id v4 = v8;
    regions = self->_regions;
  }
  [(NSMutableArray *)regions addObject:v4];
}

- (unint64_t)regionsCount
{
  return [(NSMutableArray *)self->_regions count];
}

- (id)regionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_regions objectAtIndex:a3];
}

+ (Class)regionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasProductIdentifier
{
  return self->_productIdentifier != 0;
}

- (BOOL)hasPartnerIdentifier
{
  return self->_partnerIdentifier != 0;
}

- (BOOL)hasPartnerName
{
  return self->_partnerName != 0;
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

- (void)clearSupportedProtocols
{
}

- (void)addSupportedProtocols:(id)a3
{
  id v4 = a3;
  supportedProtocols = self->_supportedProtocols;
  id v8 = v4;
  if (!supportedProtocols)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_supportedProtocols;
    self->_supportedProtocols = v6;

    id v4 = v8;
    supportedProtocols = self->_supportedProtocols;
  }
  [(NSMutableArray *)supportedProtocols addObject:v4];
}

- (unint64_t)supportedProtocolsCount
{
  return [(NSMutableArray *)self->_supportedProtocols count];
}

- (id)supportedProtocolsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_supportedProtocols objectAtIndex:a3];
}

+ (Class)supportedProtocolsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTermsURL
{
  return self->_termsURL != 0;
}

- (void)setSupportedProvisioningMethods:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_supportedProvisioningMethods = a3;
}

- (void)setHasSupportedProvisioningMethods:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportedProvisioningMethods
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasReaderModeMetadataJson
{
  return self->_readerModeMetadataJson != 0;
}

- (void)setFlags:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFlags
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHsa2Requirement:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_hsa2Requirement = a3;
}

- (void)setHasHsa2Requirement:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHsa2Requirement
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasImageAssetURLs
{
  return self->_imageAssetURLs != 0;
}

- (void)setSuppressPendingPurchases:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_suppressPendingPurchases = a3;
}

- (void)setHasSuppressPendingPurchases:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSuppressPendingPurchases
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)clearPaymentOptions
{
}

- (void)addPaymentOptions:(id)a3
{
  id v4 = a3;
  paymentOptions = self->_paymentOptions;
  id v8 = v4;
  if (!paymentOptions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_paymentOptions;
    self->_paymentOptions = v6;

    id v4 = v8;
    paymentOptions = self->_paymentOptions;
  }
  [(NSMutableArray *)paymentOptions addObject:v4];
}

- (unint64_t)paymentOptionsCount
{
  return [(NSMutableArray *)self->_paymentOptions count];
}

- (id)paymentOptionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_paymentOptions objectAtIndex:a3];
}

+ (Class)paymentOptionsType
{
  return (Class)objc_opt_class();
}

- (void)clearRequestedProvisioningMethods
{
}

- (void)addRequestedProvisioningMethods:(id)a3
{
  id v4 = a3;
  requestedProvisioningMethods = self->_requestedProvisioningMethods;
  id v8 = v4;
  if (!requestedProvisioningMethods)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_requestedProvisioningMethods;
    self->_requestedProvisioningMethods = v6;

    id v4 = v8;
    requestedProvisioningMethods = self->_requestedProvisioningMethods;
  }
  [(NSMutableArray *)requestedProvisioningMethods addObject:v4];
}

- (unint64_t)requestedProvisioningMethodsCount
{
  return [(NSMutableArray *)self->_requestedProvisioningMethods count];
}

- (id)requestedProvisioningMethodsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_requestedProvisioningMethods objectAtIndex:a3];
}

+ (Class)requestedProvisioningMethodsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentSetupProduct;
  id v4 = [(NPKProtoStandalonePaymentSetupProduct *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentSetupProduct *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  displayName = self->_displayName;
  if (displayName) {
    [v3 setObject:displayName forKey:@"displayName"];
  }
  regions = self->_regions;
  if (regions) {
    [v4 setObject:regions forKey:@"regions"];
  }
  productIdentifier = self->_productIdentifier;
  if (productIdentifier) {
    [v4 setObject:productIdentifier forKey:@"productIdentifier"];
  }
  partnerIdentifier = self->_partnerIdentifier;
  if (partnerIdentifier) {
    [v4 setObject:partnerIdentifier forKey:@"partnerIdentifier"];
  }
  partnerName = self->_partnerName;
  if (partnerName) {
    [v4 setObject:partnerName forKey:@"partnerName"];
  }
  if ([(NSMutableArray *)self->_requiredFields count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_requiredFields, "count"));
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v11 = self->_requiredFields;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v51 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v50 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"requiredFields"];
  }
  supportedProtocols = self->_supportedProtocols;
  if (supportedProtocols) {
    [v4 setObject:supportedProtocols forKey:@"supportedProtocols"];
  }
  termsURL = self->_termsURL;
  if (termsURL) {
    [v4 setObject:termsURL forKey:@"termsURL"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v19 = [NSNumber numberWithLongLong:self->_supportedProvisioningMethods];
    [v4 setObject:v19 forKey:@"supportedProvisioningMethods"];
  }
  readerModeMetadataJson = self->_readerModeMetadataJson;
  if (readerModeMetadataJson) {
    [v4 setObject:readerModeMetadataJson forKey:@"readerModeMetadataJson"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v22 = [NSNumber numberWithLongLong:self->_flags];
    [v4 setObject:v22 forKey:@"flags"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v23 = [NSNumber numberWithLongLong:self->_hsa2Requirement];
    [v4 setObject:v23 forKey:@"hsa2Requirement"];
  }
  imageAssetURLs = self->_imageAssetURLs;
  if (imageAssetURLs)
  {
    v25 = [(NPKProtoStandalonePaymentSetupProductImageAssetURLs *)imageAssetURLs dictionaryRepresentation];
    [v4 setObject:v25 forKey:@"imageAssetURLs"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v26 = [NSNumber numberWithBool:self->_suppressPendingPurchases];
    [v4 setObject:v26 forKey:@"suppressPendingPurchases"];
  }
  if ([(NSMutableArray *)self->_paymentOptions count])
  {
    v27 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_paymentOptions, "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v28 = self->_paymentOptions;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v47 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v46 + 1) + 8 * j) dictionaryRepresentation];
          [v27 addObject:v33];
        }
        uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v30);
    }

    [v4 setObject:v27 forKey:@"paymentOptions"];
  }
  if ([(NSMutableArray *)self->_requestedProvisioningMethods count])
  {
    v34 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_requestedProvisioningMethods, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v35 = self->_requestedProvisioningMethods;
    uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v42 objects:v54 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v43;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v43 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * k), "dictionaryRepresentation", (void)v42);
          [v34 addObject:v40];
        }
        uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v42 objects:v54 count:16];
      }
      while (v37);
    }

    [v4 setObject:v34 forKey:@"requestedProvisioningMethods"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentSetupProductReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v5 = self->_regions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v7);
  }

  if (self->_productIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_partnerIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_partnerName) {
    PBDataWriterWriteStringField();
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v10 = self->_requiredFields;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v12);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v15 = self->_supportedProtocols;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v39 objects:v53 count:16];
    }
    while (v17);
  }

  if (self->_termsURL) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_readerModeMetadataJson) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_imageAssetURLs) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v21 = self->_paymentOptions;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v35 objects:v52 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v36;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v35 objects:v52 count:16];
    }
    while (v23);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v26 = self->_requestedProvisioningMethods;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v31 objects:v51 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v31 objects:v51 count:16];
    }
    while (v28);
  }
}

- (void)copyTo:(id)a3
{
  id v26 = a3;
  if (self->_displayName) {
    objc_msgSend(v26, "setDisplayName:");
  }
  if ([(NPKProtoStandalonePaymentSetupProduct *)self regionsCount])
  {
    [v26 clearRegions];
    unint64_t v4 = [(NPKProtoStandalonePaymentSetupProduct *)self regionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoStandalonePaymentSetupProduct *)self regionsAtIndex:i];
        [v26 addRegions:v7];
      }
    }
  }
  if (self->_productIdentifier) {
    objc_msgSend(v26, "setProductIdentifier:");
  }
  if (self->_partnerIdentifier) {
    objc_msgSend(v26, "setPartnerIdentifier:");
  }
  if (self->_partnerName) {
    objc_msgSend(v26, "setPartnerName:");
  }
  if ([(NPKProtoStandalonePaymentSetupProduct *)self requiredFieldsCount])
  {
    [v26 clearRequiredFields];
    unint64_t v8 = [(NPKProtoStandalonePaymentSetupProduct *)self requiredFieldsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NPKProtoStandalonePaymentSetupProduct *)self requiredFieldsAtIndex:j];
        [v26 addRequiredFields:v11];
      }
    }
  }
  if ([(NPKProtoStandalonePaymentSetupProduct *)self supportedProtocolsCount])
  {
    [v26 clearSupportedProtocols];
    unint64_t v12 = [(NPKProtoStandalonePaymentSetupProduct *)self supportedProtocolsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        v15 = [(NPKProtoStandalonePaymentSetupProduct *)self supportedProtocolsAtIndex:k];
        [v26 addSupportedProtocols:v15];
      }
    }
  }
  if (self->_termsURL) {
    objc_msgSend(v26, "setTermsURL:");
  }
  uint64_t v16 = v26;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v26 + 3) = self->_supportedProvisioningMethods;
    *((unsigned char *)v26 + 132) |= 4u;
  }
  if (self->_readerModeMetadataJson)
  {
    objc_msgSend(v26, "setReaderModeMetadataJson:");
    uint64_t v16 = v26;
  }
  char has = (char)self->_has;
  if (has)
  {
    v16[1] = self->_flags;
    *((unsigned char *)v16 + 132) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v16[2] = self->_hsa2Requirement;
    *((unsigned char *)v16 + 132) |= 2u;
  }
  if (self->_imageAssetURLs)
  {
    objc_msgSend(v26, "setImageAssetURLs:");
    uint64_t v16 = v26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v16 + 128) = self->_suppressPendingPurchases;
    *((unsigned char *)v16 + 132) |= 8u;
  }
  if ([(NPKProtoStandalonePaymentSetupProduct *)self paymentOptionsCount])
  {
    [v26 clearPaymentOptions];
    unint64_t v18 = [(NPKProtoStandalonePaymentSetupProduct *)self paymentOptionsCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t m = 0; m != v19; ++m)
      {
        v21 = [(NPKProtoStandalonePaymentSetupProduct *)self paymentOptionsAtIndex:m];
        [v26 addPaymentOptions:v21];
      }
    }
  }
  if ([(NPKProtoStandalonePaymentSetupProduct *)self requestedProvisioningMethodsCount])
  {
    [v26 clearRequestedProvisioningMethods];
    unint64_t v22 = [(NPKProtoStandalonePaymentSetupProduct *)self requestedProvisioningMethodsCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (uint64_t n = 0; n != v23; ++n)
      {
        v25 = [(NPKProtoStandalonePaymentSetupProduct *)self requestedProvisioningMethodsAtIndex:n];
        [v26 addRequestedProvisioningMethods:v25];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_displayName copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  unint64_t v8 = self->_regions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v69 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v68 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addRegions:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v68 objects:v76 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_productIdentifier copyWithZone:a3];
  v15 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v14;

  uint64_t v16 = [(NSString *)self->_partnerIdentifier copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v16;

  uint64_t v18 = [(NSString *)self->_partnerName copyWithZone:a3];
  unint64_t v19 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v18;

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v20 = self->_requiredFields;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v64 objects:v75 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v65 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = (void *)[*(id *)(*((void *)&v64 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addRequiredFields:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v64 objects:v75 count:16];
    }
    while (v22);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v26 = self->_supportedProtocols;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v60 objects:v74 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v61;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v61 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = (void *)[*(id *)(*((void *)&v60 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addSupportedProtocols:v31];
      }
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v60 objects:v74 count:16];
    }
    while (v28);
  }

  uint64_t v32 = [(NSString *)self->_termsURL copyWithZone:a3];
  long long v33 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v32;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_supportedProvisioningMethods;
    *(unsigned char *)(v5 + 132) |= 4u;
  }
  uint64_t v34 = [(NSString *)self->_readerModeMetadataJson copyWithZone:a3];
  long long v35 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v34;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_flags;
    *(unsigned char *)(v5 + 132) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_hsa2Requirement;
    *(unsigned char *)(v5 + 132) |= 2u;
  }
  id v37 = [(NPKProtoStandalonePaymentSetupProductImageAssetURLs *)self->_imageAssetURLs copyWithZone:a3];
  long long v38 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v37;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v5 + 128) = self->_suppressPendingPurchases;
    *(unsigned char *)(v5 + 132) |= 8u;
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v39 = self->_paymentOptions;
  uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v56 objects:v73 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v57;
    do
    {
      for (uint64_t m = 0; m != v41; ++m)
      {
        if (*(void *)v57 != v42) {
          objc_enumerationMutation(v39);
        }
        long long v44 = (void *)[*(id *)(*((void *)&v56 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addPaymentOptions:v44];
      }
      uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v56 objects:v73 count:16];
    }
    while (v41);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v45 = self->_requestedProvisioningMethods;
  uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v52 objects:v72 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v53;
    do
    {
      for (uint64_t n = 0; n != v47; ++n)
      {
        if (*(void *)v53 != v48) {
          objc_enumerationMutation(v45);
        }
        long long v50 = objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * n), "copyWithZone:", a3, (void)v52);
        [(id)v5 addRequestedProvisioningMethods:v50];
      }
      uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v52 objects:v72 count:16];
    }
    while (v47);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_51;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_51;
    }
  }
  regions = self->_regions;
  if ((unint64_t)regions | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](regions, "isEqual:")) {
      goto LABEL_51;
    }
  }
  productIdentifier = self->_productIdentifier;
  if ((unint64_t)productIdentifier | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](productIdentifier, "isEqual:")) {
      goto LABEL_51;
    }
  }
  partnerIdentifier = self->_partnerIdentifier;
  if ((unint64_t)partnerIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](partnerIdentifier, "isEqual:")) {
      goto LABEL_51;
    }
  }
  partnerName = self->_partnerName;
  if ((unint64_t)partnerName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](partnerName, "isEqual:")) {
      goto LABEL_51;
    }
  }
  requiredFields = self->_requiredFields;
  if ((unint64_t)requiredFields | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](requiredFields, "isEqual:")) {
      goto LABEL_51;
    }
  }
  supportedProtocols = self->_supportedProtocols;
  if ((unint64_t)supportedProtocols | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](supportedProtocols, "isEqual:")) {
      goto LABEL_51;
    }
  }
  termsURL = self->_termsURL;
  if ((unint64_t)termsURL | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](termsURL, "isEqual:")) {
      goto LABEL_51;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 132) & 4) == 0 || self->_supportedProvisioningMethods != *((void *)v4 + 3)) {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 132) & 4) != 0)
  {
    goto LABEL_51;
  }
  readerModeMetadataJsouint64_t n = self->_readerModeMetadataJson;
  if ((unint64_t)readerModeMetadataJson | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](readerModeMetadataJson, "isEqual:")) {
      goto LABEL_51;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 132) & 1) == 0 || self->_flags != *((void *)v4 + 1)) {
      goto LABEL_51;
    }
  }
  else if (*((unsigned char *)v4 + 132))
  {
    goto LABEL_51;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 132) & 2) == 0 || self->_hsa2Requirement != *((void *)v4 + 2)) {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 132) & 2) != 0)
  {
    goto LABEL_51;
  }
  imageAssetURLs = self->_imageAssetURLs;
  if ((unint64_t)imageAssetURLs | *((void *)v4 + 5))
  {
    if (!-[NPKProtoStandalonePaymentSetupProductImageAssetURLs isEqual:](imageAssetURLs, "isEqual:")) {
      goto LABEL_51;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 132) & 8) != 0)
    {
      if (self->_suppressPendingPurchases)
      {
        if (!*((unsigned char *)v4 + 128)) {
          goto LABEL_51;
        }
        goto LABEL_47;
      }
      if (!*((unsigned char *)v4 + 128)) {
        goto LABEL_47;
      }
    }
LABEL_51:
    char v18 = 0;
    goto LABEL_52;
  }
  if ((*((unsigned char *)v4 + 132) & 8) != 0) {
    goto LABEL_51;
  }
LABEL_47:
  paymentOptions = self->_paymentOptions;
  if ((unint64_t)paymentOptions | *((void *)v4 + 8)
    && !-[NSMutableArray isEqual:](paymentOptions, "isEqual:"))
  {
    goto LABEL_51;
  }
  requestedProvisioningMethods = self->_requestedProvisioningMethods;
  if ((unint64_t)requestedProvisioningMethods | *((void *)v4 + 12)) {
    char v18 = -[NSMutableArray isEqual:](requestedProvisioningMethods, "isEqual:");
  }
  else {
    char v18 = 1;
  }
LABEL_52:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v18 = [(NSString *)self->_displayName hash];
  uint64_t v17 = [(NSMutableArray *)self->_regions hash];
  NSUInteger v16 = [(NSString *)self->_productIdentifier hash];
  NSUInteger v15 = [(NSString *)self->_partnerIdentifier hash];
  NSUInteger v14 = [(NSString *)self->_partnerName hash];
  uint64_t v3 = [(NSMutableArray *)self->_requiredFields hash];
  uint64_t v4 = [(NSMutableArray *)self->_supportedProtocols hash];
  NSUInteger v5 = [(NSString *)self->_termsURL hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_supportedProvisioningMethods;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_readerModeMetadataJson hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = 2654435761 * self->_flags;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_6:
      uint64_t v9 = 2654435761 * self->_hsa2Requirement;
      goto LABEL_9;
    }
  }
  uint64_t v9 = 0;
LABEL_9:
  unint64_t v10 = [(NPKProtoStandalonePaymentSetupProductImageAssetURLs *)self->_imageAssetURLs hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v11 = 2654435761 * self->_suppressPendingPurchases;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v9 ^ v10 ^ v11 ^ [(NSMutableArray *)self->_paymentOptions hash];
  return v17 ^ v18 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v12 ^ [(NSMutableArray *)self->_requestedProvisioningMethods hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[NPKProtoStandalonePaymentSetupProduct setDisplayName:](self, "setDisplayName:");
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v5 = *((id *)v4 + 11);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NPKProtoStandalonePaymentSetupProduct *)self addRegions:*(void *)(*((void *)&v49 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 9)) {
    -[NPKProtoStandalonePaymentSetupProduct setProductIdentifier:](self, "setProductIdentifier:");
  }
  if (*((void *)v4 + 6)) {
    -[NPKProtoStandalonePaymentSetupProduct setPartnerIdentifier:](self, "setPartnerIdentifier:");
  }
  if (*((void *)v4 + 7)) {
    -[NPKProtoStandalonePaymentSetupProduct setPartnerName:](self, "setPartnerName:");
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v10 = *((id *)v4 + 13);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NPKProtoStandalonePaymentSetupProduct *)self addRequiredFields:*(void *)(*((void *)&v45 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v45 objects:v56 count:16];
    }
    while (v12);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v15 = *((id *)v4 + 14);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v55 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v15);
        }
        [(NPKProtoStandalonePaymentSetupProduct *)self addSupportedProtocols:*(void *)(*((void *)&v41 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v55 count:16];
    }
    while (v17);
  }

  if (*((void *)v4 + 15)) {
    -[NPKProtoStandalonePaymentSetupProduct setTermsURL:](self, "setTermsURL:");
  }
  if ((*((unsigned char *)v4 + 132) & 4) != 0)
  {
    self->_supportedProvisioningMethods = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 10)) {
    -[NPKProtoStandalonePaymentSetupProduct setReaderModeMetadataJson:](self, "setReaderModeMetadataJson:");
  }
  char v20 = *((unsigned char *)v4 + 132);
  if (v20)
  {
    self->_flags = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v20 = *((unsigned char *)v4 + 132);
  }
  if ((v20 & 2) != 0)
  {
    self->_hsa2Requirement = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  imageAssetURLs = self->_imageAssetURLs;
  uint64_t v22 = *((void *)v4 + 5);
  if (imageAssetURLs)
  {
    if (v22) {
      -[NPKProtoStandalonePaymentSetupProductImageAssetURLs mergeFrom:](imageAssetURLs, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[NPKProtoStandalonePaymentSetupProduct setImageAssetURLs:](self, "setImageAssetURLs:");
  }
  if ((*((unsigned char *)v4 + 132) & 8) != 0)
  {
    self->_suppressPendingPurchases = *((unsigned char *)v4 + 128);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v23 = *((id *)v4 + 8);
  uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v54 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v38;
    do
    {
      for (uint64_t m = 0; m != v25; ++m)
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(v23);
        }
        [(NPKProtoStandalonePaymentSetupProduct *)self addPaymentOptions:*(void *)(*((void *)&v37 + 1) + 8 * m)];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v54 count:16];
    }
    while (v25);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v28 = *((id *)v4 + 12);
  uint64_t v29 = [v28 countByEnumeratingWithState:&v33 objects:v53 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v34;
    do
    {
      for (uint64_t n = 0; n != v30; ++n)
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(v28);
        }
        -[NPKProtoStandalonePaymentSetupProduct addRequestedProvisioningMethods:](self, "addRequestedProvisioningMethods:", *(void *)(*((void *)&v33 + 1) + 8 * n), (void)v33);
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v33 objects:v53 count:16];
    }
    while (v30);
  }
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSMutableArray)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (NSString)partnerIdentifier
{
  return self->_partnerIdentifier;
}

- (void)setPartnerIdentifier:(id)a3
{
}

- (NSString)partnerName
{
  return self->_partnerName;
}

- (void)setPartnerName:(id)a3
{
}

- (NSMutableArray)requiredFields
{
  return self->_requiredFields;
}

- (void)setRequiredFields:(id)a3
{
}

- (NSMutableArray)supportedProtocols
{
  return self->_supportedProtocols;
}

- (void)setSupportedProtocols:(id)a3
{
}

- (NSString)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
}

- (int64_t)supportedProvisioningMethods
{
  return self->_supportedProvisioningMethods;
}

- (NSString)readerModeMetadataJson
{
  return self->_readerModeMetadataJson;
}

- (void)setReaderModeMetadataJson:(id)a3
{
}

- (int64_t)flags
{
  return self->_flags;
}

- (int64_t)hsa2Requirement
{
  return self->_hsa2Requirement;
}

- (NPKProtoStandalonePaymentSetupProductImageAssetURLs)imageAssetURLs
{
  return self->_imageAssetURLs;
}

- (void)setImageAssetURLs:(id)a3
{
}

- (BOOL)suppressPendingPurchases
{
  return self->_suppressPendingPurchases;
}

- (NSMutableArray)paymentOptions
{
  return self->_paymentOptions;
}

- (void)setPaymentOptions:(id)a3
{
}

- (NSMutableArray)requestedProvisioningMethods
{
  return self->_requestedProvisioningMethods;
}

- (void)setRequestedProvisioningMethods:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_supportedProtocols, 0);
  objc_storeStrong((id *)&self->_requiredFields, 0);
  objc_storeStrong((id *)&self->_requestedProvisioningMethods, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_readerModeMetadataJson, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentOptions, 0);
  objc_storeStrong((id *)&self->_partnerName, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
  objc_storeStrong((id *)&self->_imageAssetURLs, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end