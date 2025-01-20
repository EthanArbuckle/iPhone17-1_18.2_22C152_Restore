@interface NPKProtoStandalonePaymentDigitalIssuanceMetadata
+ (Class)defaultSuggestionsType;
+ (Class)serviceProviderAcceptedNetworksType;
+ (Class)serviceProviderCapabilitiesType;
- (BOOL)hasAction;
- (BOOL)hasMerchantID;
- (BOOL)hasServiceProviderCountryCode;
- (BOOL)hasServiceProviderDictJson;
- (BOOL)hasServiceProviderIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)defaultSuggestions;
- (NSMutableArray)serviceProviderAcceptedNetworks;
- (NSMutableArray)serviceProviderCapabilities;
- (NSString)action;
- (NSString)merchantID;
- (NSString)serviceProviderCountryCode;
- (NSString)serviceProviderDictJson;
- (NSString)serviceProviderIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultSuggestionsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)serviceProviderAcceptedNetworksAtIndex:(unint64_t)a3;
- (id)serviceProviderCapabilitiesAtIndex:(unint64_t)a3;
- (unint64_t)defaultSuggestionsCount;
- (unint64_t)hash;
- (unint64_t)serviceProviderAcceptedNetworksCount;
- (unint64_t)serviceProviderCapabilitiesCount;
- (void)addDefaultSuggestions:(id)a3;
- (void)addServiceProviderAcceptedNetworks:(id)a3;
- (void)addServiceProviderCapabilities:(id)a3;
- (void)clearDefaultSuggestions;
- (void)clearServiceProviderAcceptedNetworks;
- (void)clearServiceProviderCapabilities;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAction:(id)a3;
- (void)setDefaultSuggestions:(id)a3;
- (void)setMerchantID:(id)a3;
- (void)setServiceProviderAcceptedNetworks:(id)a3;
- (void)setServiceProviderCapabilities:(id)a3;
- (void)setServiceProviderCountryCode:(id)a3;
- (void)setServiceProviderDictJson:(id)a3;
- (void)setServiceProviderIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentDigitalIssuanceMetadata

- (BOOL)hasServiceProviderIdentifier
{
  return self->_serviceProviderIdentifier != 0;
}

- (BOOL)hasServiceProviderCountryCode
{
  return self->_serviceProviderCountryCode != 0;
}

- (void)clearServiceProviderAcceptedNetworks
{
}

- (void)addServiceProviderAcceptedNetworks:(id)a3
{
  id v4 = a3;
  serviceProviderAcceptedNetworks = self->_serviceProviderAcceptedNetworks;
  id v8 = v4;
  if (!serviceProviderAcceptedNetworks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_serviceProviderAcceptedNetworks;
    self->_serviceProviderAcceptedNetworks = v6;

    id v4 = v8;
    serviceProviderAcceptedNetworks = self->_serviceProviderAcceptedNetworks;
  }
  [(NSMutableArray *)serviceProviderAcceptedNetworks addObject:v4];
}

- (unint64_t)serviceProviderAcceptedNetworksCount
{
  return [(NSMutableArray *)self->_serviceProviderAcceptedNetworks count];
}

- (id)serviceProviderAcceptedNetworksAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_serviceProviderAcceptedNetworks objectAtIndex:a3];
}

+ (Class)serviceProviderAcceptedNetworksType
{
  return (Class)objc_opt_class();
}

- (void)clearServiceProviderCapabilities
{
}

- (void)addServiceProviderCapabilities:(id)a3
{
  id v4 = a3;
  serviceProviderCapabilities = self->_serviceProviderCapabilities;
  id v8 = v4;
  if (!serviceProviderCapabilities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_serviceProviderCapabilities;
    self->_serviceProviderCapabilities = v6;

    id v4 = v8;
    serviceProviderCapabilities = self->_serviceProviderCapabilities;
  }
  [(NSMutableArray *)serviceProviderCapabilities addObject:v4];
}

- (unint64_t)serviceProviderCapabilitiesCount
{
  return [(NSMutableArray *)self->_serviceProviderCapabilities count];
}

- (id)serviceProviderCapabilitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_serviceProviderCapabilities objectAtIndex:a3];
}

+ (Class)serviceProviderCapabilitiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasServiceProviderDictJson
{
  return self->_serviceProviderDictJson != 0;
}

- (BOOL)hasAction
{
  return self->_action != 0;
}

- (BOOL)hasMerchantID
{
  return self->_merchantID != 0;
}

- (void)clearDefaultSuggestions
{
}

- (void)addDefaultSuggestions:(id)a3
{
  id v4 = a3;
  defaultSuggestions = self->_defaultSuggestions;
  id v8 = v4;
  if (!defaultSuggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_defaultSuggestions;
    self->_defaultSuggestions = v6;

    id v4 = v8;
    defaultSuggestions = self->_defaultSuggestions;
  }
  [(NSMutableArray *)defaultSuggestions addObject:v4];
}

- (unint64_t)defaultSuggestionsCount
{
  return [(NSMutableArray *)self->_defaultSuggestions count];
}

- (id)defaultSuggestionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_defaultSuggestions objectAtIndex:a3];
}

+ (Class)defaultSuggestionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentDigitalIssuanceMetadata;
  id v4 = [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  serviceProviderIdentifier = self->_serviceProviderIdentifier;
  if (serviceProviderIdentifier) {
    [v3 setObject:serviceProviderIdentifier forKey:@"serviceProviderIdentifier"];
  }
  serviceProviderCountryCode = self->_serviceProviderCountryCode;
  if (serviceProviderCountryCode) {
    [v4 setObject:serviceProviderCountryCode forKey:@"serviceProviderCountryCode"];
  }
  serviceProviderAcceptedNetworks = self->_serviceProviderAcceptedNetworks;
  if (serviceProviderAcceptedNetworks) {
    [v4 setObject:serviceProviderAcceptedNetworks forKey:@"serviceProviderAcceptedNetworks"];
  }
  serviceProviderCapabilities = self->_serviceProviderCapabilities;
  if (serviceProviderCapabilities) {
    [v4 setObject:serviceProviderCapabilities forKey:@"serviceProviderCapabilities"];
  }
  serviceProviderDictJson = self->_serviceProviderDictJson;
  if (serviceProviderDictJson) {
    [v4 setObject:serviceProviderDictJson forKey:@"serviceProviderDictJson"];
  }
  action = self->_action;
  if (action) {
    [v4 setObject:action forKey:@"action"];
  }
  merchantID = self->_merchantID;
  if (merchantID) {
    [v4 setObject:merchantID forKey:@"merchantID"];
  }
  defaultSuggestions = self->_defaultSuggestions;
  if (defaultSuggestions) {
    [v4 setObject:defaultSuggestions forKey:@"defaultSuggestions"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentDigitalIssuanceMetadataReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_serviceProviderIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_serviceProviderCountryCode) {
    PBDataWriterWriteStringField();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = self->_serviceProviderAcceptedNetworks;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = self->_serviceProviderCapabilities;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  if (self->_serviceProviderDictJson) {
    PBDataWriterWriteStringField();
  }
  if (self->_action) {
    PBDataWriterWriteStringField();
  }
  if (self->_merchantID) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v15 = self->_defaultSuggestions;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  if (self->_serviceProviderIdentifier) {
    objc_msgSend(v16, "setServiceProviderIdentifier:");
  }
  if (self->_serviceProviderCountryCode) {
    objc_msgSend(v16, "setServiceProviderCountryCode:");
  }
  if ([(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)self serviceProviderAcceptedNetworksCount])
  {
    [v16 clearServiceProviderAcceptedNetworks];
    unint64_t v4 = [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)self serviceProviderAcceptedNetworksCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)self serviceProviderAcceptedNetworksAtIndex:i];
        [v16 addServiceProviderAcceptedNetworks:v7];
      }
    }
  }
  if ([(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)self serviceProviderCapabilitiesCount])
  {
    [v16 clearServiceProviderCapabilities];
    unint64_t v8 = [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)self serviceProviderCapabilitiesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)self serviceProviderCapabilitiesAtIndex:j];
        [v16 addServiceProviderCapabilities:v11];
      }
    }
  }
  if (self->_serviceProviderDictJson) {
    objc_msgSend(v16, "setServiceProviderDictJson:");
  }
  if (self->_action) {
    objc_msgSend(v16, "setAction:");
  }
  if (self->_merchantID) {
    objc_msgSend(v16, "setMerchantID:");
  }
  if ([(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)self defaultSuggestionsCount])
  {
    [v16 clearDefaultSuggestions];
    unint64_t v12 = [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)self defaultSuggestionsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        v15 = [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)self defaultSuggestionsAtIndex:k];
        [v16 addDefaultSuggestions:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_serviceProviderIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[8];
  v5[8] = v6;

  uint64_t v8 = [(NSString *)self->_serviceProviderCountryCode copyWithZone:a3];
  unint64_t v9 = (void *)v5[6];
  v5[6] = v8;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v10 = self->_serviceProviderAcceptedNetworks;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v44;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * v14) copyWithZone:a3];
        [v5 addServiceProviderAcceptedNetworks:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v12);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = self->_serviceProviderCapabilities;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * v20) copyWithZone:a3];
        [v5 addServiceProviderCapabilities:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v18);
  }

  uint64_t v22 = [(NSString *)self->_serviceProviderDictJson copyWithZone:a3];
  long long v23 = (void *)v5[7];
  v5[7] = v22;

  uint64_t v24 = [(NSString *)self->_action copyWithZone:a3];
  long long v25 = (void *)v5[1];
  v5[1] = v24;

  uint64_t v26 = [(NSString *)self->_merchantID copyWithZone:a3];
  long long v27 = (void *)v5[3];
  v5[3] = v26;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v28 = self->_defaultSuggestions;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v36;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * v32), "copyWithZone:", a3, (void)v35);
        [v5 addDefaultSuggestions:v33];

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v30);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((serviceProviderIdentifier = self->_serviceProviderIdentifier,
         !((unint64_t)serviceProviderIdentifier | v4[8]))
     || -[NSString isEqual:](serviceProviderIdentifier, "isEqual:"))
    && ((serviceProviderCountryCode = self->_serviceProviderCountryCode,
         !((unint64_t)serviceProviderCountryCode | v4[6]))
     || -[NSString isEqual:](serviceProviderCountryCode, "isEqual:"))
    && ((serviceProviderAcceptedNetworks = self->_serviceProviderAcceptedNetworks,
         !((unint64_t)serviceProviderAcceptedNetworks | v4[4]))
     || -[NSMutableArray isEqual:](serviceProviderAcceptedNetworks, "isEqual:"))
    && ((serviceProviderCapabilities = self->_serviceProviderCapabilities,
         !((unint64_t)serviceProviderCapabilities | v4[5]))
     || -[NSMutableArray isEqual:](serviceProviderCapabilities, "isEqual:"))
    && ((serviceProviderDictJson = self->_serviceProviderDictJson, !((unint64_t)serviceProviderDictJson | v4[7]))
     || -[NSString isEqual:](serviceProviderDictJson, "isEqual:"))
    && ((action = self->_action, !((unint64_t)action | v4[1]))
     || -[NSString isEqual:](action, "isEqual:"))
    && ((merchantID = self->_merchantID, !((unint64_t)merchantID | v4[3]))
     || -[NSString isEqual:](merchantID, "isEqual:")))
  {
    defaultSuggestions = self->_defaultSuggestions;
    if ((unint64_t)defaultSuggestions | v4[2]) {
      char v13 = -[NSMutableArray isEqual:](defaultSuggestions, "isEqual:");
    }
    else {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_serviceProviderIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_serviceProviderCountryCode hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_serviceProviderAcceptedNetworks hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_serviceProviderCapabilities hash];
  NSUInteger v7 = [(NSString *)self->_serviceProviderDictJson hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_action hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_merchantID hash];
  return v9 ^ [(NSMutableArray *)self->_defaultSuggestions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 8)) {
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata setServiceProviderIdentifier:](self, "setServiceProviderIdentifier:");
  }
  if (*((void *)v4 + 6)) {
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata setServiceProviderCountryCode:](self, "setServiceProviderCountryCode:");
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)self addServiceProviderAcceptedNetworks:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = *((id *)v4 + 5);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NPKProtoStandalonePaymentDigitalIssuanceMetadata *)self addServiceProviderCapabilities:*(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 7)) {
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata setServiceProviderDictJson:](self, "setServiceProviderDictJson:");
  }
  if (*((void *)v4 + 1)) {
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata setAction:](self, "setAction:");
  }
  if (*((void *)v4 + 3)) {
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata setMerchantID:](self, "setMerchantID:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = *((id *)v4 + 2);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[NPKProtoStandalonePaymentDigitalIssuanceMetadata addDefaultSuggestions:](self, "addDefaultSuggestions:", *(void *)(*((void *)&v20 + 1) + 8 * k), (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (NSString)serviceProviderIdentifier
{
  return self->_serviceProviderIdentifier;
}

- (void)setServiceProviderIdentifier:(id)a3
{
}

- (NSString)serviceProviderCountryCode
{
  return self->_serviceProviderCountryCode;
}

- (void)setServiceProviderCountryCode:(id)a3
{
}

- (NSMutableArray)serviceProviderAcceptedNetworks
{
  return self->_serviceProviderAcceptedNetworks;
}

- (void)setServiceProviderAcceptedNetworks:(id)a3
{
}

- (NSMutableArray)serviceProviderCapabilities
{
  return self->_serviceProviderCapabilities;
}

- (void)setServiceProviderCapabilities:(id)a3
{
}

- (NSString)serviceProviderDictJson
{
  return self->_serviceProviderDictJson;
}

- (void)setServiceProviderDictJson:(id)a3
{
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSString)merchantID
{
  return self->_merchantID;
}

- (void)setMerchantID:(id)a3
{
}

- (NSMutableArray)defaultSuggestions
{
  return self->_defaultSuggestions;
}

- (void)setDefaultSuggestions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceProviderDictJson, 0);
  objc_storeStrong((id *)&self->_serviceProviderCountryCode, 0);
  objc_storeStrong((id *)&self->_serviceProviderCapabilities, 0);
  objc_storeStrong((id *)&self->_serviceProviderAcceptedNetworks, 0);
  objc_storeStrong((id *)&self->_merchantID, 0);
  objc_storeStrong((id *)&self->_defaultSuggestions, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end