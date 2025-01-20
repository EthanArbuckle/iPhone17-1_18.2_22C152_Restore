@interface ODDSiriSchemaODDAssistantDimensions
- (BOOL)hasAsrLocation;
- (BOOL)hasAudioInterfaceProductId;
- (BOOL)hasAudioInterfaceVendorId;
- (BOOL)hasDataSharingOptInStatus;
- (BOOL)hasInvocationSource;
- (BOOL)hasIsIntelligenceEngineRequest;
- (BOOL)hasNlLocation;
- (BOOL)hasResponseCategory;
- (BOOL)hasSiriInputLocale;
- (BOOL)hasSubDomain;
- (BOOL)hasSystemBuild;
- (BOOL)hasViewInterface;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIntelligenceEngineRequest;
- (BOOL)readFrom:(id)a3;
- (NSArray)routings;
- (NSData)jsonData;
- (NSString)audioInterfaceProductId;
- (NSString)audioInterfaceVendorId;
- (NSString)subDomain;
- (NSString)systemBuild;
- (ODDSiriSchemaODDAssistantDimensions)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDAssistantDimensions)initWithJSON:(id)a3;
- (SISchemaISOLocale)siriInputLocale;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)asrLocation;
- (int)dataSharingOptInStatus;
- (int)invocationSource;
- (int)nlLocation;
- (int)responseCategory;
- (int)routingAtIndex:(unint64_t)a3;
- (int)viewInterface;
- (unint64_t)hash;
- (unint64_t)routingCount;
- (void)addRouting:(int)a3;
- (void)clearRouting;
- (void)deleteAsrLocation;
- (void)deleteAudioInterfaceProductId;
- (void)deleteAudioInterfaceVendorId;
- (void)deleteDataSharingOptInStatus;
- (void)deleteInvocationSource;
- (void)deleteIsIntelligenceEngineRequest;
- (void)deleteNlLocation;
- (void)deleteResponseCategory;
- (void)deleteSiriInputLocale;
- (void)deleteSubDomain;
- (void)deleteSystemBuild;
- (void)deleteViewInterface;
- (void)setAsrLocation:(int)a3;
- (void)setAudioInterfaceProductId:(id)a3;
- (void)setAudioInterfaceVendorId:(id)a3;
- (void)setDataSharingOptInStatus:(int)a3;
- (void)setHasAsrLocation:(BOOL)a3;
- (void)setHasAudioInterfaceProductId:(BOOL)a3;
- (void)setHasAudioInterfaceVendorId:(BOOL)a3;
- (void)setHasDataSharingOptInStatus:(BOOL)a3;
- (void)setHasInvocationSource:(BOOL)a3;
- (void)setHasIsIntelligenceEngineRequest:(BOOL)a3;
- (void)setHasNlLocation:(BOOL)a3;
- (void)setHasResponseCategory:(BOOL)a3;
- (void)setHasSiriInputLocale:(BOOL)a3;
- (void)setHasSubDomain:(BOOL)a3;
- (void)setHasSystemBuild:(BOOL)a3;
- (void)setHasViewInterface:(BOOL)a3;
- (void)setInvocationSource:(int)a3;
- (void)setIsIntelligenceEngineRequest:(BOOL)a3;
- (void)setNlLocation:(int)a3;
- (void)setResponseCategory:(int)a3;
- (void)setRoutings:(id)a3;
- (void)setSiriInputLocale:(id)a3;
- (void)setSubDomain:(id)a3;
- (void)setSystemBuild:(id)a3;
- (void)setViewInterface:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDAssistantDimensions

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODDSiriSchemaODDAssistantDimensions;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDAssistantDimensions *)self siriInputLocale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODDSiriSchemaODDAssistantDimensions *)self deleteSiriInputLocale];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routings, 0);
  objc_storeStrong((id *)&self->_subDomain, 0);
  objc_storeStrong((id *)&self->_siriInputLocale, 0);
  objc_storeStrong((id *)&self->_audioInterfaceProductId, 0);
  objc_storeStrong((id *)&self->_audioInterfaceVendorId, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
}

- (void)setHasSubDomain:(BOOL)a3
{
  self->_hasAudioInterfaceVendorId = a3;
}

- (void)setHasSiriInputLocale:(BOOL)a3
{
  self->_hasSystemBuild = a3;
}

- (void)setHasAudioInterfaceProductId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasAudioInterfaceVendorId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSystemBuild:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)invocationSource
{
  return self->_invocationSource;
}

- (void)setRoutings:(id)a3
{
}

- (NSArray)routings
{
  return self->_routings;
}

- (BOOL)isIntelligenceEngineRequest
{
  return self->_isIntelligenceEngineRequest;
}

- (int)responseCategory
{
  return self->_responseCategory;
}

- (void)setSubDomain:(id)a3
{
}

- (NSString)subDomain
{
  return self->_subDomain;
}

- (void)setSiriInputLocale:(id)a3
{
}

- (SISchemaISOLocale)siriInputLocale
{
  return self->_siriInputLocale;
}

- (int)nlLocation
{
  return self->_nlLocation;
}

- (int)asrLocation
{
  return self->_asrLocation;
}

- (void)setAudioInterfaceProductId:(id)a3
{
}

- (NSString)audioInterfaceProductId
{
  return self->_audioInterfaceProductId;
}

- (void)setAudioInterfaceVendorId:(id)a3
{
}

- (NSString)audioInterfaceVendorId
{
  return self->_audioInterfaceVendorId;
}

- (int)viewInterface
{
  return self->_viewInterface;
}

- (int)dataSharingOptInStatus
{
  return self->_dataSharingOptInStatus;
}

- (void)setSystemBuild:(id)a3
{
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (ODDSiriSchemaODDAssistantDimensions)initWithDictionary:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)ODDSiriSchemaODDAssistantDimensions;
  v5 = [(ODDSiriSchemaODDAssistantDimensions *)&v55 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"systemBuild"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(ODDSiriSchemaODDAssistantDimensions *)v5 setSystemBuild:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"dataSharingOptInStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantDimensions setDataSharingOptInStatus:](v5, "setDataSharingOptInStatus:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"viewInterface"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantDimensions setViewInterface:](v5, "setViewInterface:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"audioInterfaceVendorId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(ODDSiriSchemaODDAssistantDimensions *)v5 setAudioInterfaceVendorId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"audioInterfaceProductId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(ODDSiriSchemaODDAssistantDimensions *)v5 setAudioInterfaceProductId:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"asrLocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantDimensions setAsrLocation:](v5, "setAsrLocation:", [v14 intValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"nlLocation"];
    objc_opt_class();
    v50 = v15;
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantDimensions setNlLocation:](v5, "setNlLocation:", [v15 intValue]);
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"siriInputLocale"];
    objc_opt_class();
    v49 = (void *)v16;
    if (objc_opt_isKindOfClass())
    {
      v17 = v14;
      v18 = [[SISchemaISOLocale alloc] initWithDictionary:v49];
      [(ODDSiriSchemaODDAssistantDimensions *)v5 setSiriInputLocale:v18];

      v14 = v17;
    }
    v19 = [v4 objectForKeyedSubscript:@"subDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v47 = v4;
      v20 = v14;
      v21 = v12;
      v22 = v10;
      v23 = v9;
      v24 = v8;
      v25 = v6;
      v26 = v19;
      v27 = (void *)[v19 copy];
      [(ODDSiriSchemaODDAssistantDimensions *)v5 setSubDomain:v27];

      v19 = v26;
      v6 = v25;
      v8 = v24;
      objc_super v9 = v23;
      v10 = v22;
      v12 = v21;
      v14 = v20;
      id v4 = v47;
    }
    v48 = v9;
    v28 = [v4 objectForKeyedSubscript:@"responseCategory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantDimensions setResponseCategory:](v5, "setResponseCategory:", [v28 intValue]);
    }
    v44 = v28;
    v45 = v12;
    v46 = v10;
    v29 = [v4 objectForKeyedSubscript:@"isIntelligenceEngineRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantDimensions setIsIntelligenceEngineRequest:](v5, "setIsIntelligenceEngineRequest:", [v29 BOOLValue]);
    }
    v30 = [v4 objectForKeyedSubscript:@"routing"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v40 = v19;
      v41 = v14;
      v42 = v8;
      v43 = v6;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v31 = v30;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v52 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[ODDSiriSchemaODDAssistantDimensions addRouting:](v5, "addRouting:", [v36 intValue]);
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v51 objects:v56 count:16];
        }
        while (v33);
      }

      v8 = v42;
      v6 = v43;
      v19 = v40;
      v14 = v41;
    }
    v37 = objc_msgSend(v4, "objectForKeyedSubscript:", @"invocationSource", v40, v41, v42, v43);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantDimensions setInvocationSource:](v5, "setInvocationSource:", [v37 intValue]);
    }
    v38 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDAssistantDimensions)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDAssistantDimensions *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDAssistantDimensions *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int v4 = [(ODDSiriSchemaODDAssistantDimensions *)self asrLocation];
    v5 = @"ORCHSIRIASRMODE_UNKNOWN";
    if (v4 == 1) {
      v5 = @"ORCHSIRIASRMODE_SERVER";
    }
    if (v4 == 2) {
      v6 = @"ORCHSIRIASRMODE_DEVICE";
    }
    else {
      v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"asrLocation"];
  }
  if (self->_audioInterfaceProductId)
  {
    uint64_t v7 = [(ODDSiriSchemaODDAssistantDimensions *)self audioInterfaceProductId];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"audioInterfaceProductId"];
  }
  if (self->_audioInterfaceVendorId)
  {
    objc_super v9 = [(ODDSiriSchemaODDAssistantDimensions *)self audioInterfaceVendorId];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"audioInterfaceVendorId"];
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v12 = [(ODDSiriSchemaODDAssistantDimensions *)self dataSharingOptInStatus] - 1;
    if (v12 > 2) {
      v13 = @"UNKNOWN";
    }
    else {
      v13 = off_1E5EBCEE0[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"dataSharingOptInStatus"];
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_14:
      if ((has & 0x20) == 0) {
        goto LABEL_15;
      }
      goto LABEL_26;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_14;
  }
  unsigned int v14 = [(ODDSiriSchemaODDAssistantDimensions *)self invocationSource] - 1;
  if (v14 > 0x62) {
    v15 = @"INVOCATIONSOURCE_UNKNOWN_INVOCATION_SOURCE";
  }
  else {
    v15 = off_1E5EBCEF8[v14];
  }
  [v3 setObject:v15 forKeyedSubscript:@"invocationSource"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAssistantDimensions isIntelligenceEngineRequest](self, "isIntelligenceEngineRequest"));
  [v3 setObject:v16 forKeyedSubscript:@"isIntelligenceEngineRequest"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_16:
    if ((has & 0x10) == 0) {
      goto LABEL_37;
    }
    goto LABEL_33;
  }
LABEL_27:
  int v17 = [(ODDSiriSchemaODDAssistantDimensions *)self nlLocation];
  v18 = @"ORCHSIRINLMODE_UNKNOWN";
  if (v17 == 1) {
    v18 = @"ORCHSIRINLMODE_NLV3_SERVER";
  }
  if (v17 == 2) {
    v19 = @"ORCHSIRINLMODE_NLX_DEVICE";
  }
  else {
    v19 = v18;
  }
  [v3 setObject:v19 forKeyedSubscript:@"nlLocation"];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_33:
    unsigned int v20 = [(ODDSiriSchemaODDAssistantDimensions *)self responseCategory] - 1;
    if (v20 > 0xC) {
      v21 = @"RESPONSECATEGORY_UNKNOWN";
    }
    else {
      v21 = off_1E5EBD210[v20];
    }
    [v3 setObject:v21 forKeyedSubscript:@"responseCategory"];
  }
LABEL_37:
  if ([(NSArray *)self->_routings count])
  {
    v22 = [(ODDSiriSchemaODDAssistantDimensions *)self routings];
    v23 = (void *)[v22 copy];
    [v3 setObject:v23 forKeyedSubscript:@"routing"];
  }
  if (self->_siriInputLocale)
  {
    v24 = [(ODDSiriSchemaODDAssistantDimensions *)self siriInputLocale];
    v25 = [v24 dictionaryRepresentation];
    if (v25)
    {
      [v3 setObject:v25 forKeyedSubscript:@"siriInputLocale"];
    }
    else
    {
      v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"siriInputLocale"];
    }
  }
  if (self->_subDomain)
  {
    v27 = [(ODDSiriSchemaODDAssistantDimensions *)self subDomain];
    v28 = (void *)[v27 copy];
    [v3 setObject:v28 forKeyedSubscript:@"subDomain"];
  }
  if (self->_systemBuild)
  {
    v29 = [(ODDSiriSchemaODDAssistantDimensions *)self systemBuild];
    v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"systemBuild"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v31 = [(ODDSiriSchemaODDAssistantDimensions *)self viewInterface] - 1;
    if (v31 > 7) {
      uint64_t v32 = @"ASSISTANTVIEWMODE_UNKNOWN";
    }
    else {
      uint64_t v32 = off_1E5EBD278[v31];
    }
    [v3 setObject:v32 forKeyedSubscript:@"viewInterface"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v16 = [(NSString *)self->_systemBuild hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v15 = 2654435761 * self->_dataSharingOptInStatus;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v14 = 2654435761 * self->_viewInterface;
      goto LABEL_6;
    }
  }
  uint64_t v14 = 0;
LABEL_6:
  NSUInteger v13 = [(NSString *)self->_audioInterfaceVendorId hash];
  NSUInteger v3 = [(NSString *)self->_audioInterfaceProductId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_asrLocation;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_8:
      uint64_t v5 = 2654435761 * self->_nlLocation;
      goto LABEL_11;
    }
  }
  uint64_t v5 = 0;
LABEL_11:
  unint64_t v6 = [(SISchemaISOLocale *)self->_siriInputLocale hash];
  NSUInteger v7 = [(NSString *)self->_subDomain hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v8 = 2654435761 * self->_responseCategory;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_13:
      uint64_t v9 = 2654435761 * self->_isIntelligenceEngineRequest;
      goto LABEL_16;
    }
  }
  uint64_t v9 = 0;
LABEL_16:
  uint64_t v10 = [(NSArray *)self->_routings hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v11 = 2654435761 * self->_invocationSource;
  }
  else {
    uint64_t v11 = 0;
  }
  return v15 ^ v16 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_53;
  }
  uint64_t v5 = [(ODDSiriSchemaODDAssistantDimensions *)self systemBuild];
  unint64_t v6 = [v4 systemBuild];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_52;
  }
  uint64_t v7 = [(ODDSiriSchemaODDAssistantDimensions *)self systemBuild];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(ODDSiriSchemaODDAssistantDimensions *)self systemBuild];
    uint64_t v10 = [v4 systemBuild];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  $111BCC16FFA082C2EB8A3CAF06435E55 has = self->_has;
  unsigned int v13 = v4[84];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_53;
  }
  if (*(unsigned char *)&has)
  {
    int dataSharingOptInStatus = self->_dataSharingOptInStatus;
    if (dataSharingOptInStatus != [v4 dataSharingOptInStatus]) {
      goto LABEL_53;
    }
    $111BCC16FFA082C2EB8A3CAF06435E55 has = self->_has;
    unsigned int v13 = v4[84];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_53;
  }
  if (v15)
  {
    int viewInterface = self->_viewInterface;
    if (viewInterface != [v4 viewInterface]) {
      goto LABEL_53;
    }
  }
  uint64_t v5 = [(ODDSiriSchemaODDAssistantDimensions *)self audioInterfaceVendorId];
  unint64_t v6 = [v4 audioInterfaceVendorId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_52;
  }
  uint64_t v17 = [(ODDSiriSchemaODDAssistantDimensions *)self audioInterfaceVendorId];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(ODDSiriSchemaODDAssistantDimensions *)self audioInterfaceVendorId];
    unsigned int v20 = [v4 audioInterfaceVendorId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  uint64_t v5 = [(ODDSiriSchemaODDAssistantDimensions *)self audioInterfaceProductId];
  unint64_t v6 = [v4 audioInterfaceProductId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_52;
  }
  uint64_t v22 = [(ODDSiriSchemaODDAssistantDimensions *)self audioInterfaceProductId];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(ODDSiriSchemaODDAssistantDimensions *)self audioInterfaceProductId];
    v25 = [v4 audioInterfaceProductId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  $111BCC16FFA082C2EB8A3CAF06435E55 v27 = self->_has;
  int v28 = (*(unsigned int *)&v27 >> 2) & 1;
  unsigned int v29 = v4[84];
  if (v28 != ((v29 >> 2) & 1)) {
    goto LABEL_53;
  }
  if (v28)
  {
    int asrLocation = self->_asrLocation;
    if (asrLocation != [v4 asrLocation]) {
      goto LABEL_53;
    }
    $111BCC16FFA082C2EB8A3CAF06435E55 v27 = self->_has;
    unsigned int v29 = v4[84];
  }
  int v31 = (*(unsigned int *)&v27 >> 3) & 1;
  if (v31 != ((v29 >> 3) & 1)) {
    goto LABEL_53;
  }
  if (v31)
  {
    int nlLocation = self->_nlLocation;
    if (nlLocation != [v4 nlLocation]) {
      goto LABEL_53;
    }
  }
  uint64_t v5 = [(ODDSiriSchemaODDAssistantDimensions *)self siriInputLocale];
  unint64_t v6 = [v4 siriInputLocale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_52;
  }
  uint64_t v33 = [(ODDSiriSchemaODDAssistantDimensions *)self siriInputLocale];
  if (v33)
  {
    uint64_t v34 = (void *)v33;
    v35 = [(ODDSiriSchemaODDAssistantDimensions *)self siriInputLocale];
    v36 = [v4 siriInputLocale];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  uint64_t v5 = [(ODDSiriSchemaODDAssistantDimensions *)self subDomain];
  unint64_t v6 = [v4 subDomain];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_52;
  }
  uint64_t v38 = [(ODDSiriSchemaODDAssistantDimensions *)self subDomain];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(ODDSiriSchemaODDAssistantDimensions *)self subDomain];
    v41 = [v4 subDomain];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  $111BCC16FFA082C2EB8A3CAF06435E55 v43 = self->_has;
  int v44 = (*(unsigned int *)&v43 >> 4) & 1;
  unsigned int v45 = v4[84];
  if (v44 != ((v45 >> 4) & 1)) {
    goto LABEL_53;
  }
  if (v44)
  {
    int responseCategory = self->_responseCategory;
    if (responseCategory != [v4 responseCategory]) {
      goto LABEL_53;
    }
    $111BCC16FFA082C2EB8A3CAF06435E55 v43 = self->_has;
    unsigned int v45 = v4[84];
  }
  int v47 = (*(unsigned int *)&v43 >> 5) & 1;
  if (v47 != ((v45 >> 5) & 1)) {
    goto LABEL_53;
  }
  if (v47)
  {
    int isIntelligenceEngineRequest = self->_isIntelligenceEngineRequest;
    if (isIntelligenceEngineRequest != [v4 isIntelligenceEngineRequest]) {
      goto LABEL_53;
    }
  }
  uint64_t v5 = [(ODDSiriSchemaODDAssistantDimensions *)self routings];
  unint64_t v6 = [v4 routings];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_52:

    goto LABEL_53;
  }
  uint64_t v49 = [(ODDSiriSchemaODDAssistantDimensions *)self routings];
  if (v49)
  {
    v50 = (void *)v49;
    long long v51 = [(ODDSiriSchemaODDAssistantDimensions *)self routings];
    long long v52 = [v4 routings];
    int v53 = [v51 isEqual:v52];

    if (!v53) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  int v56 = (*(unsigned char *)&self->_has >> 6) & 1;
  if (v56 == ((v4[84] >> 6) & 1))
  {
    if (!v56
      || (int invocationSource = self->_invocationSource,
          invocationSource == [v4 invocationSource]))
    {
      BOOL v54 = 1;
      goto LABEL_54;
    }
  }
LABEL_53:
  BOOL v54 = 0;
LABEL_54:

  return v54;
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ODDSiriSchemaODDAssistantDimensions *)self systemBuild];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v7 = [(ODDSiriSchemaODDAssistantDimensions *)self audioInterfaceVendorId];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  uint64_t v8 = [(ODDSiriSchemaODDAssistantDimensions *)self audioInterfaceProductId];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  char v9 = (char)self->_has;
  if ((v9 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v9 = (char)self->_has;
  }
  if ((v9 & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v10 = [(ODDSiriSchemaODDAssistantDimensions *)self siriInputLocale];

  if (v10)
  {
    int v11 = [(ODDSiriSchemaODDAssistantDimensions *)self siriInputLocale];
    PBDataWriterWriteSubmessage();
  }
  unsigned int v12 = [(ODDSiriSchemaODDAssistantDimensions *)self subDomain];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  char v13 = (char)self->_has;
  if ((v13 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v13 = (char)self->_has;
  }
  if ((v13 & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v14 = self->_routings;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "intValue", (void)v19);
        PBDataWriterWriteInt32Field();
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }

  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssistantDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)deleteInvocationSource
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasInvocationSource:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasInvocationSource
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setInvocationSource:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_int invocationSource = a3;
}

- (int)routingAtIndex:(unint64_t)a3
{
  char v3 = [(NSArray *)self->_routings objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)routingCount
{
  return [(NSArray *)self->_routings count];
}

- (void)addRouting:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  routings = self->_routings;
  if (!routings)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_routings;
    self->_routings = v6;

    routings = self->_routings;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)routings addObject:v8];
}

- (void)clearRouting
{
}

- (void)deleteIsIntelligenceEngineRequest
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasIsIntelligenceEngineRequest:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsIntelligenceEngineRequest
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsIntelligenceEngineRequest:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int isIntelligenceEngineRequest = a3;
}

- (void)deleteResponseCategory
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasResponseCategory:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasResponseCategory
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setResponseCategory:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int responseCategory = a3;
}

- (void)deleteSubDomain
{
}

- (BOOL)hasSubDomain
{
  return self->_subDomain != 0;
}

- (void)deleteSiriInputLocale
{
}

- (BOOL)hasSiriInputLocale
{
  return self->_siriInputLocale != 0;
}

- (void)deleteNlLocation
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasNlLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNlLocation
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNlLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int nlLocation = a3;
}

- (void)deleteAsrLocation
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasAsrLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAsrLocation
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAsrLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int asrLocation = a3;
}

- (void)deleteAudioInterfaceProductId
{
}

- (BOOL)hasAudioInterfaceProductId
{
  return self->_audioInterfaceProductId != 0;
}

- (void)deleteAudioInterfaceVendorId
{
}

- (BOOL)hasAudioInterfaceVendorId
{
  return self->_audioInterfaceVendorId != 0;
}

- (void)deleteViewInterface
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasViewInterface:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasViewInterface
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setViewInterface:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int viewInterface = a3;
}

- (void)deleteDataSharingOptInStatus
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDataSharingOptInStatus:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDataSharingOptInStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDataSharingOptInStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int dataSharingOptInStatus = a3;
}

- (void)deleteSystemBuild
{
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

@end