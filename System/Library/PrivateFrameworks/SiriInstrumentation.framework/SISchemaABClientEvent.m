@interface SISchemaABClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
- (BOOL)hasAllocationChanged;
- (BOOL)hasAssetRetrievalStatusChanged;
- (BOOL)hasClientFeatureTriggered;
- (BOOL)hasEventMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaABClientEvent)initWithDictionary:(id)a3;
- (SISchemaABClientEvent)initWithJSON:(id)a3;
- (SISchemaABClientEventMetadata)eventMetadata;
- (SISchemaABExperimentAllocationChanged)allocationChanged;
- (SISchemaABExperimentAssetRetrievalStatusChanged)assetRetrievalStatusChanged;
- (SISchemaABExperimentClientFeatureTriggered)clientFeatureTriggered;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteAllocationChanged;
- (void)deleteAssetRetrievalStatusChanged;
- (void)deleteClientFeatureTriggered;
- (void)deleteEventMetadata;
- (void)setAllocationChanged:(id)a3;
- (void)setAssetRetrievalStatusChanged:(id)a3;
- (void)setClientFeatureTriggered:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasAllocationChanged:(BOOL)a3;
- (void)setHasAssetRetrievalStatusChanged:(BOOL)a3;
- (void)setHasClientFeatureTriggered:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaABClientEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SISchemaABClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaABClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaABClientEvent *)self deleteEventMetadata];
  }
  v9 = [(SISchemaABClientEvent *)self allocationChanged];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaABClientEvent *)self deleteAllocationChanged];
  }
  v12 = [(SISchemaABClientEvent *)self assetRetrievalStatusChanged];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SISchemaABClientEvent *)self deleteAssetRetrievalStatusChanged];
  }
  v15 = [(SISchemaABClientEvent *)self clientFeatureTriggered];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(SISchemaABClientEvent *)self deleteClientFeatureTriggered];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3 = [(SISchemaABClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EA9C20[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 2) {
    return 0;
  }
  else {
    return off_1E5EA9C38[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientFeatureTriggered, 0);
  objc_storeStrong((id *)&self->_assetRetrievalStatusChanged, 0);
  objc_storeStrong((id *)&self->_allocationChanged, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasClientFeatureTriggered:(BOOL)a3
{
  self->_hasClientFeatureTriggered = a3;
}

- (BOOL)hasClientFeatureTriggered
{
  return self->_hasClientFeatureTriggered;
}

- (void)setHasAssetRetrievalStatusChanged:(BOOL)a3
{
  self->_hasAssetRetrievalStatusChanged = a3;
}

- (BOOL)hasAssetRetrievalStatusChanged
{
  return self->_hasAssetRetrievalStatusChanged;
}

- (void)setHasAllocationChanged:(BOOL)a3
{
  self->_hasAllocationChanged = a3;
}

- (BOOL)hasAllocationChanged
{
  return self->_hasAllocationChanged;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (SISchemaABClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SISchemaABClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SISchemaABClientEvent;
  v5 = [(SISchemaABClientEvent *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaABClientEventMetadata alloc] initWithDictionary:v6];
      [(SISchemaABClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"allocationChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaABExperimentAllocationChanged alloc] initWithDictionary:v8];
      [(SISchemaABClientEvent *)v5 setAllocationChanged:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"assetRetrievalStatusChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaABExperimentAssetRetrievalStatusChanged alloc] initWithDictionary:v10];
      [(SISchemaABClientEvent *)v5 setAssetRetrievalStatusChanged:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"clientFeatureTriggered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaABExperimentClientFeatureTriggered alloc] initWithDictionary:v12];
      [(SISchemaABClientEvent *)v5 setClientFeatureTriggered:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (SISchemaABClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaABClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaABClientEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_allocationChanged)
  {
    id v4 = [(SISchemaABClientEvent *)self allocationChanged];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"allocationChanged"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"allocationChanged"];
    }
  }
  if (self->_assetRetrievalStatusChanged)
  {
    uint64_t v7 = [(SISchemaABClientEvent *)self assetRetrievalStatusChanged];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"assetRetrievalStatusChanged"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"assetRetrievalStatusChanged"];
    }
  }
  if (self->_clientFeatureTriggered)
  {
    v10 = [(SISchemaABClientEvent *)self clientFeatureTriggered];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"clientFeatureTriggered"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"clientFeatureTriggered"];
    }
  }
  if (self->_eventMetadata)
  {
    v13 = [(SISchemaABClientEvent *)self eventMetadata];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"eventMetadata"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaABClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(SISchemaABExperimentAllocationChanged *)self->_allocationChanged hash] ^ v3;
  unint64_t v5 = [(SISchemaABExperimentAssetRetrievalStatusChanged *)self->_assetRetrievalStatusChanged hash];
  return v4 ^ v5 ^ [(SISchemaABExperimentClientFeatureTriggered *)self->_clientFeatureTriggered hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_23;
  }
  v6 = [(SISchemaABClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(SISchemaABClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SISchemaABClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(SISchemaABClientEvent *)self allocationChanged];
  uint64_t v7 = [v4 allocationChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(SISchemaABClientEvent *)self allocationChanged];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(SISchemaABClientEvent *)self allocationChanged];
    objc_super v16 = [v4 allocationChanged];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(SISchemaABClientEvent *)self assetRetrievalStatusChanged];
  uint64_t v7 = [v4 assetRetrievalStatusChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(SISchemaABClientEvent *)self assetRetrievalStatusChanged];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(SISchemaABClientEvent *)self assetRetrievalStatusChanged];
    v21 = [v4 assetRetrievalStatusChanged];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(SISchemaABClientEvent *)self clientFeatureTriggered];
  uint64_t v7 = [v4 clientFeatureTriggered];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(SISchemaABClientEvent *)self clientFeatureTriggered];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(SISchemaABClientEvent *)self clientFeatureTriggered];
    v26 = [v4 clientFeatureTriggered];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_22:
  }
LABEL_23:
  BOOL v28 = 0;
LABEL_24:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(SISchemaABClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(SISchemaABClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SISchemaABClientEvent *)self allocationChanged];

  if (v6)
  {
    uint64_t v7 = [(SISchemaABClientEvent *)self allocationChanged];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(SISchemaABClientEvent *)self assetRetrievalStatusChanged];

  if (v8)
  {
    v9 = [(SISchemaABClientEvent *)self assetRetrievalStatusChanged];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(SISchemaABClientEvent *)self clientFeatureTriggered];

  if (v10)
  {
    int v11 = [(SISchemaABClientEvent *)self clientFeatureTriggered];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaABClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteClientFeatureTriggered
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_clientFeatureTriggered = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaABExperimentClientFeatureTriggered)clientFeatureTriggered
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_clientFeatureTriggered;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setClientFeatureTriggered:(id)a3
{
  id v4 = (SISchemaABExperimentClientFeatureTriggered *)a3;
  allocationChanged = self->_allocationChanged;
  self->_allocationChanged = 0;

  assetRetrievalStatusChanged = self->_assetRetrievalStatusChanged;
  self->_assetRetrievalStatusChanged = 0;

  unint64_t v7 = 103;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  clientFeatureTriggered = self->_clientFeatureTriggered;
  self->_clientFeatureTriggered = v4;
}

- (void)deleteAssetRetrievalStatusChanged
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assetRetrievalStatusChanged = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaABExperimentAssetRetrievalStatusChanged)assetRetrievalStatusChanged
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_assetRetrievalStatusChanged;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssetRetrievalStatusChanged:(id)a3
{
  id v4 = (SISchemaABExperimentAssetRetrievalStatusChanged *)a3;
  allocationChanged = self->_allocationChanged;
  self->_allocationChanged = 0;

  clientFeatureTriggered = self->_clientFeatureTriggered;
  self->_clientFeatureTriggered = 0;

  unint64_t v7 = 102;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  assetRetrievalStatusChanged = self->_assetRetrievalStatusChanged;
  self->_assetRetrievalStatusChanged = v4;
}

- (void)deleteAllocationChanged
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_allocationChanged = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaABExperimentAllocationChanged)allocationChanged
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_allocationChanged;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAllocationChanged:(id)a3
{
  id v4 = (SISchemaABExperimentAllocationChanged *)a3;
  assetRetrievalStatusChanged = self->_assetRetrievalStatusChanged;
  self->_assetRetrievalStatusChanged = 0;

  clientFeatureTriggered = self->_clientFeatureTriggered;
  self->_clientFeatureTriggered = 0;

  unint64_t v7 = 101;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  allocationChanged = self->_allocationChanged;
  self->_allocationChanged = v4;
}

- (void)deleteEventMetadata
{
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(SISchemaABClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 2) {
    return @"com.apple.aiml.siri.abe.ABClientEvent";
  }
  else {
    return off_1E5EB5118[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 10;
}

@end