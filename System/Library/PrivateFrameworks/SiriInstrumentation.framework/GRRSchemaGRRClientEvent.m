@interface GRRSchemaGRRClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasFeatureExtractionContext;
- (BOOL)hasHypothesisRankingContext;
- (BOOL)hasSystemErrorOccurred;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GRRSchemaGRRClientEvent)initWithDictionary:(id)a3;
- (GRRSchemaGRRClientEvent)initWithJSON:(id)a3;
- (GRRSchemaGRRClientEventMetadata)eventMetadata;
- (GRRSchemaGRRFeatureExtractionContext)featureExtractionContext;
- (GRRSchemaGRRHypothesisRankingContext)hypothesisRankingContext;
- (GRRSchemaGRRSystemErrorOccurred)systemErrorOccurred;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)componentName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteEventMetadata;
- (void)deleteFeatureExtractionContext;
- (void)deleteHypothesisRankingContext;
- (void)deleteSystemErrorOccurred;
- (void)setEventMetadata:(id)a3;
- (void)setFeatureExtractionContext:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasFeatureExtractionContext:(BOOL)a3;
- (void)setHasHypothesisRankingContext:(BOOL)a3;
- (void)setHasSystemErrorOccurred:(BOOL)a3;
- (void)setHypothesisRankingContext:(id)a3;
- (void)setSystemErrorOccurred:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GRRSchemaGRRClientEvent

- (int)componentName
{
  v2 = [(GRRSchemaGRRClientEvent *)self eventMetadata];
  v3 = [v2 grrId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 5;
      }
      else {
        LODWORD(v4) = 0;
      }
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }

  return (int)v4;
}

- (id)getComponentId
{
  v2 = [(GRRSchemaGRRClientEvent *)self eventMetadata];
  v3 = [v2 grrId];

  if (!v3) {
    goto LABEL_5;
  }
  id v4 = [v3 value];
  if (!v4) {
    goto LABEL_6;
  }
  v5 = [v3 value];
  uint64_t v6 = [v5 length];

  if (v6) {
    id v4 = v3;
  }
  else {
LABEL_5:
  }
    id v4 = 0;
LABEL_6:

  return v4;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GRRSchemaGRRClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(GRRSchemaGRRClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(GRRSchemaGRRClientEvent *)self deleteEventMetadata];
  }
  v9 = [(GRRSchemaGRRClientEvent *)self featureExtractionContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(GRRSchemaGRRClientEvent *)self deleteFeatureExtractionContext];
  }
  v12 = [(GRRSchemaGRRClientEvent *)self hypothesisRankingContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(GRRSchemaGRRClientEvent *)self deleteHypothesisRankingContext];
  }
  v15 = [(GRRSchemaGRRClientEvent *)self systemErrorOccurred];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(GRRSchemaGRRClientEvent *)self deleteSystemErrorOccurred];
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
  unint64_t v3 = [(GRRSchemaGRRClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAA6A8[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 2) {
    return 0;
  }
  else {
    return off_1E5EAA6C0[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemErrorOccurred, 0);
  objc_storeStrong((id *)&self->_hypothesisRankingContext, 0);
  objc_storeStrong((id *)&self->_featureExtractionContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasSystemErrorOccurred:(BOOL)a3
{
  self->_hasSystemErrorOccurred = a3;
}

- (BOOL)hasSystemErrorOccurred
{
  return self->_hasSystemErrorOccurred;
}

- (void)setHasHypothesisRankingContext:(BOOL)a3
{
  self->_hasHypothesisRankingContext = a3;
}

- (BOOL)hasHypothesisRankingContext
{
  return self->_hasHypothesisRankingContext;
}

- (void)setHasFeatureExtractionContext:(BOOL)a3
{
  self->_hasFeatureExtractionContext = a3;
}

- (BOOL)hasFeatureExtractionContext
{
  return self->_hasFeatureExtractionContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (GRRSchemaGRRClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (GRRSchemaGRRClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GRRSchemaGRRClientEvent;
  v5 = [(GRRSchemaGRRClientEvent *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[GRRSchemaGRRClientEventMetadata alloc] initWithDictionary:v6];
      [(GRRSchemaGRRClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"featureExtractionContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[GRRSchemaGRRFeatureExtractionContext alloc] initWithDictionary:v8];
      [(GRRSchemaGRRClientEvent *)v5 setFeatureExtractionContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"hypothesisRankingContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[GRRSchemaGRRHypothesisRankingContext alloc] initWithDictionary:v10];
      [(GRRSchemaGRRClientEvent *)v5 setHypothesisRankingContext:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"systemErrorOccurred"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[GRRSchemaGRRSystemErrorOccurred alloc] initWithDictionary:v12];
      [(GRRSchemaGRRClientEvent *)v5 setSystemErrorOccurred:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (GRRSchemaGRRClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GRRSchemaGRRClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GRRSchemaGRRClientEvent *)self dictionaryRepresentation];
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
  if (self->_eventMetadata)
  {
    id v4 = [(GRRSchemaGRRClientEvent *)self eventMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_featureExtractionContext)
  {
    uint64_t v7 = [(GRRSchemaGRRClientEvent *)self featureExtractionContext];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"featureExtractionContext"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"featureExtractionContext"];
    }
  }
  if (self->_hypothesisRankingContext)
  {
    v10 = [(GRRSchemaGRRClientEvent *)self hypothesisRankingContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"hypothesisRankingContext"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"hypothesisRankingContext"];
    }
  }
  if (self->_systemErrorOccurred)
  {
    v13 = [(GRRSchemaGRRClientEvent *)self systemErrorOccurred];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"systemErrorOccurred"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"systemErrorOccurred"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(GRRSchemaGRRClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(GRRSchemaGRRFeatureExtractionContext *)self->_featureExtractionContext hash] ^ v3;
  unint64_t v5 = [(GRRSchemaGRRHypothesisRankingContext *)self->_hypothesisRankingContext hash];
  return v4 ^ v5 ^ [(GRRSchemaGRRSystemErrorOccurred *)self->_systemErrorOccurred hash];
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
  uint64_t v6 = [(GRRSchemaGRRClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(GRRSchemaGRRClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(GRRSchemaGRRClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v6 = [(GRRSchemaGRRClientEvent *)self featureExtractionContext];
  uint64_t v7 = [v4 featureExtractionContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(GRRSchemaGRRClientEvent *)self featureExtractionContext];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(GRRSchemaGRRClientEvent *)self featureExtractionContext];
    objc_super v16 = [v4 featureExtractionContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v6 = [(GRRSchemaGRRClientEvent *)self hypothesisRankingContext];
  uint64_t v7 = [v4 hypothesisRankingContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(GRRSchemaGRRClientEvent *)self hypothesisRankingContext];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(GRRSchemaGRRClientEvent *)self hypothesisRankingContext];
    v21 = [v4 hypothesisRankingContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v6 = [(GRRSchemaGRRClientEvent *)self systemErrorOccurred];
  uint64_t v7 = [v4 systemErrorOccurred];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(GRRSchemaGRRClientEvent *)self systemErrorOccurred];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(GRRSchemaGRRClientEvent *)self systemErrorOccurred];
    v26 = [v4 systemErrorOccurred];
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
  id v4 = [(GRRSchemaGRRClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(GRRSchemaGRRClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(GRRSchemaGRRClientEvent *)self featureExtractionContext];

  if (v6)
  {
    uint64_t v7 = [(GRRSchemaGRRClientEvent *)self featureExtractionContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(GRRSchemaGRRClientEvent *)self hypothesisRankingContext];

  if (v8)
  {
    v9 = [(GRRSchemaGRRClientEvent *)self hypothesisRankingContext];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(GRRSchemaGRRClientEvent *)self systemErrorOccurred];

  if (v10)
  {
    int v11 = [(GRRSchemaGRRClientEvent *)self systemErrorOccurred];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return GRRSchemaGRRClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteSystemErrorOccurred
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_systemErrorOccurred = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GRRSchemaGRRSystemErrorOccurred)systemErrorOccurred
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_systemErrorOccurred;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSystemErrorOccurred:(id)a3
{
  id v4 = (GRRSchemaGRRSystemErrorOccurred *)a3;
  featureExtractionContext = self->_featureExtractionContext;
  self->_featureExtractionContext = 0;

  hypothesisRankingContext = self->_hypothesisRankingContext;
  self->_hypothesisRankingContext = 0;

  unint64_t v7 = 103;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  systemErrorOccurred = self->_systemErrorOccurred;
  self->_systemErrorOccurred = v4;
}

- (void)deleteHypothesisRankingContext
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_hypothesisRankingContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GRRSchemaGRRHypothesisRankingContext)hypothesisRankingContext
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_hypothesisRankingContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setHypothesisRankingContext:(id)a3
{
  id v4 = (GRRSchemaGRRHypothesisRankingContext *)a3;
  featureExtractionContext = self->_featureExtractionContext;
  self->_featureExtractionContext = 0;

  systemErrorOccurred = self->_systemErrorOccurred;
  self->_systemErrorOccurred = 0;

  unint64_t v7 = 102;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  hypothesisRankingContext = self->_hypothesisRankingContext;
  self->_hypothesisRankingContext = v4;
}

- (void)deleteFeatureExtractionContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_featureExtractionContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GRRSchemaGRRFeatureExtractionContext)featureExtractionContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_featureExtractionContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFeatureExtractionContext:(id)a3
{
  id v4 = (GRRSchemaGRRFeatureExtractionContext *)a3;
  hypothesisRankingContext = self->_hypothesisRankingContext;
  self->_hypothesisRankingContext = 0;

  systemErrorOccurred = self->_systemErrorOccurred;
  self->_systemErrorOccurred = 0;

  unint64_t v7 = 101;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  featureExtractionContext = self->_featureExtractionContext;
  self->_featureExtractionContext = v4;
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
  unint64_t v2 = [(GRRSchemaGRRClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 2) {
    return @"com.apple.aiml.siri.grr.GRRClientEvent";
  }
  else {
    return off_1E5EB0598[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 16;
}

@end