@interface SMTSchemaSMTClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasAppLanguageModelAssetCopyContext;
- (BOOL)hasAppLanguageModelBuildContext;
- (BOOL)hasAppLanguageModelProfileRebuildContext;
- (BOOL)hasEventMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (SMTSchemaSMTAppLanguageModelAssetCopyContext)appLanguageModelAssetCopyContext;
- (SMTSchemaSMTAppLanguageModelBuildContext)appLanguageModelBuildContext;
- (SMTSchemaSMTAppLanguageModelProfileRebuildContext)appLanguageModelProfileRebuildContext;
- (SMTSchemaSMTClientEvent)initWithDictionary:(id)a3;
- (SMTSchemaSMTClientEvent)initWithJSON:(id)a3;
- (SMTSchemaSMTClientEventMetadata)eventMetadata;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)clockIsolationLevel;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteAppLanguageModelAssetCopyContext;
- (void)deleteAppLanguageModelBuildContext;
- (void)deleteAppLanguageModelProfileRebuildContext;
- (void)deleteEventMetadata;
- (void)setAppLanguageModelAssetCopyContext:(id)a3;
- (void)setAppLanguageModelBuildContext:(id)a3;
- (void)setAppLanguageModelProfileRebuildContext:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasAppLanguageModelAssetCopyContext:(BOOL)a3;
- (void)setHasAppLanguageModelBuildContext:(BOOL)a3;
- (void)setHasAppLanguageModelProfileRebuildContext:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SMTSchemaSMTClientEvent

- (id)getComponentId
{
  v2 = [(SMTSchemaSMTClientEvent *)self eventMetadata];
  v3 = [v2 smtId];

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
  return 1;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SMTSchemaSMTClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(SMTSchemaSMTClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SMTSchemaSMTClientEvent *)self deleteEventMetadata];
  }
  v9 = [(SMTSchemaSMTClientEvent *)self appLanguageModelAssetCopyContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SMTSchemaSMTClientEvent *)self deleteAppLanguageModelAssetCopyContext];
  }
  v12 = [(SMTSchemaSMTClientEvent *)self appLanguageModelBuildContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SMTSchemaSMTClientEvent *)self deleteAppLanguageModelBuildContext];
  }
  v15 = [(SMTSchemaSMTClientEvent *)self appLanguageModelProfileRebuildContext];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(SMTSchemaSMTClientEvent *)self deleteAppLanguageModelProfileRebuildContext];
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
  unint64_t v3 = [(SMTSchemaSMTClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EABF28[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 2) {
    return 0;
  }
  else {
    return off_1E5EABF40[a3 - 101];
  }
}

- (int)clockIsolationLevel
{
  if ([(SMTSchemaSMTClientEvent *)self whichEvent_Type] - 101 >= 3) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLanguageModelProfileRebuildContext, 0);
  objc_storeStrong((id *)&self->_appLanguageModelBuildContext, 0);
  objc_storeStrong((id *)&self->_appLanguageModelAssetCopyContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasAppLanguageModelProfileRebuildContext:(BOOL)a3
{
  self->_hasAppLanguageModelProfileRebuildContext = a3;
}

- (BOOL)hasAppLanguageModelProfileRebuildContext
{
  return self->_hasAppLanguageModelProfileRebuildContext;
}

- (void)setHasAppLanguageModelBuildContext:(BOOL)a3
{
  self->_hasAppLanguageModelBuildContext = a3;
}

- (BOOL)hasAppLanguageModelBuildContext
{
  return self->_hasAppLanguageModelBuildContext;
}

- (void)setHasAppLanguageModelAssetCopyContext:(BOOL)a3
{
  self->_hasAppLanguageModelAssetCopyContext = a3;
}

- (BOOL)hasAppLanguageModelAssetCopyContext
{
  return self->_hasAppLanguageModelAssetCopyContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (SMTSchemaSMTClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SMTSchemaSMTClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SMTSchemaSMTClientEvent;
  v5 = [(SMTSchemaSMTClientEvent *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SMTSchemaSMTClientEventMetadata alloc] initWithDictionary:v6];
      [(SMTSchemaSMTClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"appLanguageModelAssetCopyContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SMTSchemaSMTAppLanguageModelAssetCopyContext alloc] initWithDictionary:v8];
      [(SMTSchemaSMTClientEvent *)v5 setAppLanguageModelAssetCopyContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"appLanguageModelBuildContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SMTSchemaSMTAppLanguageModelBuildContext alloc] initWithDictionary:v10];
      [(SMTSchemaSMTClientEvent *)v5 setAppLanguageModelBuildContext:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"appLanguageModelProfileRebuildContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SMTSchemaSMTAppLanguageModelProfileRebuildContext alloc] initWithDictionary:v12];
      [(SMTSchemaSMTClientEvent *)v5 setAppLanguageModelProfileRebuildContext:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (SMTSchemaSMTClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SMTSchemaSMTClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SMTSchemaSMTClientEvent *)self dictionaryRepresentation];
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
  if (self->_appLanguageModelAssetCopyContext)
  {
    id v4 = [(SMTSchemaSMTClientEvent *)self appLanguageModelAssetCopyContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"appLanguageModelAssetCopyContext"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"appLanguageModelAssetCopyContext"];
    }
  }
  if (self->_appLanguageModelBuildContext)
  {
    uint64_t v7 = [(SMTSchemaSMTClientEvent *)self appLanguageModelBuildContext];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"appLanguageModelBuildContext"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"appLanguageModelBuildContext"];
    }
  }
  if (self->_appLanguageModelProfileRebuildContext)
  {
    v10 = [(SMTSchemaSMTClientEvent *)self appLanguageModelProfileRebuildContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"appLanguageModelProfileRebuildContext"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"appLanguageModelProfileRebuildContext"];
    }
  }
  if (self->_eventMetadata)
  {
    v13 = [(SMTSchemaSMTClientEvent *)self eventMetadata];
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
  unint64_t v3 = [(SMTSchemaSMTClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(SMTSchemaSMTAppLanguageModelAssetCopyContext *)self->_appLanguageModelAssetCopyContext hash] ^ v3;
  unint64_t v5 = [(SMTSchemaSMTAppLanguageModelBuildContext *)self->_appLanguageModelBuildContext hash];
  return v4 ^ v5 ^ [(SMTSchemaSMTAppLanguageModelProfileRebuildContext *)self->_appLanguageModelProfileRebuildContext hash];
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
  uint64_t v6 = [(SMTSchemaSMTClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(SMTSchemaSMTClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SMTSchemaSMTClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v6 = [(SMTSchemaSMTClientEvent *)self appLanguageModelAssetCopyContext];
  uint64_t v7 = [v4 appLanguageModelAssetCopyContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(SMTSchemaSMTClientEvent *)self appLanguageModelAssetCopyContext];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(SMTSchemaSMTClientEvent *)self appLanguageModelAssetCopyContext];
    objc_super v16 = [v4 appLanguageModelAssetCopyContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v6 = [(SMTSchemaSMTClientEvent *)self appLanguageModelBuildContext];
  uint64_t v7 = [v4 appLanguageModelBuildContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(SMTSchemaSMTClientEvent *)self appLanguageModelBuildContext];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(SMTSchemaSMTClientEvent *)self appLanguageModelBuildContext];
    v21 = [v4 appLanguageModelBuildContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v6 = [(SMTSchemaSMTClientEvent *)self appLanguageModelProfileRebuildContext];
  uint64_t v7 = [v4 appLanguageModelProfileRebuildContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(SMTSchemaSMTClientEvent *)self appLanguageModelProfileRebuildContext];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(SMTSchemaSMTClientEvent *)self appLanguageModelProfileRebuildContext];
    v26 = [v4 appLanguageModelProfileRebuildContext];
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
  id v4 = [(SMTSchemaSMTClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(SMTSchemaSMTClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(SMTSchemaSMTClientEvent *)self appLanguageModelAssetCopyContext];

  if (v6)
  {
    uint64_t v7 = [(SMTSchemaSMTClientEvent *)self appLanguageModelAssetCopyContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(SMTSchemaSMTClientEvent *)self appLanguageModelBuildContext];

  if (v8)
  {
    v9 = [(SMTSchemaSMTClientEvent *)self appLanguageModelBuildContext];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(SMTSchemaSMTClientEvent *)self appLanguageModelProfileRebuildContext];

  if (v10)
  {
    int v11 = [(SMTSchemaSMTClientEvent *)self appLanguageModelProfileRebuildContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SMTSchemaSMTClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteAppLanguageModelProfileRebuildContext
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_appLanguageModelProfileRebuildContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SMTSchemaSMTAppLanguageModelProfileRebuildContext)appLanguageModelProfileRebuildContext
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_appLanguageModelProfileRebuildContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAppLanguageModelProfileRebuildContext:(id)a3
{
  id v4 = (SMTSchemaSMTAppLanguageModelProfileRebuildContext *)a3;
  appLanguageModelAssetCopyContext = self->_appLanguageModelAssetCopyContext;
  self->_appLanguageModelAssetCopyContext = 0;

  appLanguageModelBuildContext = self->_appLanguageModelBuildContext;
  self->_appLanguageModelBuildContext = 0;

  unint64_t v7 = 103;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  appLanguageModelProfileRebuildContext = self->_appLanguageModelProfileRebuildContext;
  self->_appLanguageModelProfileRebuildContext = v4;
}

- (void)deleteAppLanguageModelBuildContext
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_appLanguageModelBuildContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SMTSchemaSMTAppLanguageModelBuildContext)appLanguageModelBuildContext
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_appLanguageModelBuildContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAppLanguageModelBuildContext:(id)a3
{
  id v4 = (SMTSchemaSMTAppLanguageModelBuildContext *)a3;
  appLanguageModelAssetCopyContext = self->_appLanguageModelAssetCopyContext;
  self->_appLanguageModelAssetCopyContext = 0;

  appLanguageModelProfileRebuildContext = self->_appLanguageModelProfileRebuildContext;
  self->_appLanguageModelProfileRebuildContext = 0;

  unint64_t v7 = 102;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  appLanguageModelBuildContext = self->_appLanguageModelBuildContext;
  self->_appLanguageModelBuildContext = v4;
}

- (void)deleteAppLanguageModelAssetCopyContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_appLanguageModelAssetCopyContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SMTSchemaSMTAppLanguageModelAssetCopyContext)appLanguageModelAssetCopyContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_appLanguageModelAssetCopyContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAppLanguageModelAssetCopyContext:(id)a3
{
  id v4 = (SMTSchemaSMTAppLanguageModelAssetCopyContext *)a3;
  appLanguageModelBuildContext = self->_appLanguageModelBuildContext;
  self->_appLanguageModelBuildContext = 0;

  appLanguageModelProfileRebuildContext = self->_appLanguageModelProfileRebuildContext;
  self->_appLanguageModelProfileRebuildContext = 0;

  unint64_t v7 = 101;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  appLanguageModelAssetCopyContext = self->_appLanguageModelAssetCopyContext;
  self->_appLanguageModelAssetCopyContext = v4;
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
  unint64_t v2 = [(SMTSchemaSMTClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 2) {
    return @"com.apple.aiml.siri.smt.SMTClientEvent";
  }
  else {
    return off_1E5EB93A8[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 60;
}

@end