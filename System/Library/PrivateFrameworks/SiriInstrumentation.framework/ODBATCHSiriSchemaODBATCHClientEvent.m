@interface ODBATCHSiriSchemaODBATCHClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
- (BOOL)hasEventMetadata;
- (BOOL)hasOdbatchDataReported;
- (BOOL)hasTurnRestatementScoresReported;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODBATCHSiriSchemaODBATCHClientEvent)initWithDictionary:(id)a3;
- (ODBATCHSiriSchemaODBATCHClientEvent)initWithJSON:(id)a3;
- (ODBATCHSiriSchemaODBATCHClientEventMetadata)eventMetadata;
- (ODBATCHSiriSchemaODBATCHDataReported)odbatchDataReported;
- (ODBATCHSiriSchemaODBATCHTurnRestatementScoresReported)turnRestatementScoresReported;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)clockIsolationLevel;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteEventMetadata;
- (void)deleteOdbatchDataReported;
- (void)deleteTurnRestatementScoresReported;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasOdbatchDataReported:(BOOL)a3;
- (void)setHasTurnRestatementScoresReported:(BOOL)a3;
- (void)setOdbatchDataReported:(id)a3;
- (void)setTurnRestatementScoresReported:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODBATCHSiriSchemaODBATCHClientEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ODBATCHSiriSchemaODBATCHClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODBATCHSiriSchemaODBATCHClientEvent *)self deleteEventMetadata];
  }
  v9 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self odbatchDataReported];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODBATCHSiriSchemaODBATCHClientEvent *)self deleteOdbatchDataReported];
  }
  v12 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self turnRestatementScoresReported];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ODBATCHSiriSchemaODBATCHClientEvent *)self deleteTurnRestatementScoresReported];
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
  unint64_t v3 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self whichEvent_Type];
  if (v3 == 10)
  {
    id v4 = &OBJC_IVAR___ODBATCHSiriSchemaODBATCHClientEvent__odbatchDataReported;
    goto LABEL_5;
  }
  if (v3 == 11)
  {
    id v4 = &OBJC_IVAR___ODBATCHSiriSchemaODBATCHClientEvent__turnRestatementScoresReported;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_7:
  return (SISchemaInstrumentationMessage *)v5;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  unint64_t v3 = @"turnRestatementScoresReported";
  if (a3 != 11) {
    unint64_t v3 = 0;
  }
  if (a3 == 10) {
    return @"odbatchDataReported";
  }
  else {
    return v3;
  }
}

- (int)clockIsolationLevel
{
  if (([(ODBATCHSiriSchemaODBATCHClientEvent *)self whichEvent_Type] & 0xFFFFFFFFFFFFFFFELL) == 0xA) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnRestatementScoresReported, 0);
  objc_storeStrong((id *)&self->_odbatchDataReported, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasTurnRestatementScoresReported:(BOOL)a3
{
  self->_hasTurnRestatementScoresReported = a3;
}

- (BOOL)hasTurnRestatementScoresReported
{
  return self->_hasTurnRestatementScoresReported;
}

- (void)setHasOdbatchDataReported:(BOOL)a3
{
  self->_hasOdbatchDataReported = a3;
}

- (BOOL)hasOdbatchDataReported
{
  return self->_hasOdbatchDataReported;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (ODBATCHSiriSchemaODBATCHClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (ODBATCHSiriSchemaODBATCHClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ODBATCHSiriSchemaODBATCHClientEvent;
  id v5 = [(ODBATCHSiriSchemaODBATCHClientEvent *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODBATCHSiriSchemaODBATCHClientEventMetadata alloc] initWithDictionary:v6];
      [(ODBATCHSiriSchemaODBATCHClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"odbatchDataReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ODBATCHSiriSchemaODBATCHDataReported alloc] initWithDictionary:v8];
      [(ODBATCHSiriSchemaODBATCHClientEvent *)v5 setOdbatchDataReported:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"turnRestatementScoresReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[ODBATCHSiriSchemaODBATCHTurnRestatementScoresReported alloc] initWithDictionary:v10];
      [(ODBATCHSiriSchemaODBATCHClientEvent *)v5 setTurnRestatementScoresReported:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (ODBATCHSiriSchemaODBATCHClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(ODBATCHSiriSchemaODBATCHClientEvent *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self dictionaryRepresentation];
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
    id v4 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self eventMetadata];
    id v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_odbatchDataReported)
  {
    uint64_t v7 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self odbatchDataReported];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"odbatchDataReported"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"odbatchDataReported"];
    }
  }
  if (self->_turnRestatementScoresReported)
  {
    v10 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self turnRestatementScoresReported];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"turnRestatementScoresReported"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"turnRestatementScoresReported"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODBATCHSiriSchemaODBATCHClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(ODBATCHSiriSchemaODBATCHDataReported *)self->_odbatchDataReported hash] ^ v3;
  return v4 ^ [(ODBATCHSiriSchemaODBATCHTurnRestatementScoresReported *)self->_turnRestatementScoresReported hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_18;
  }
  v6 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self odbatchDataReported];
  uint64_t v7 = [v4 odbatchDataReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self odbatchDataReported];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self odbatchDataReported];
    objc_super v16 = [v4 odbatchDataReported];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self turnRestatementScoresReported];
  uint64_t v7 = [v4 turnRestatementScoresReported];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self turnRestatementScoresReported];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self turnRestatementScoresReported];
    v21 = [v4 turnRestatementScoresReported];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_17:
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self eventMetadata];

  if (v4)
  {
    id v5 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self odbatchDataReported];

  if (v6)
  {
    uint64_t v7 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self odbatchDataReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self turnRestatementScoresReported];

  if (v8)
  {
    v9 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self turnRestatementScoresReported];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODBATCHSiriSchemaODBATCHClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteTurnRestatementScoresReported
{
  if (self->_whichEvent_Type == 11)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_turnRestatementScoresReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODBATCHSiriSchemaODBATCHTurnRestatementScoresReported)turnRestatementScoresReported
{
  if (self->_whichEvent_Type == 11) {
    v2 = self->_turnRestatementScoresReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTurnRestatementScoresReported:(id)a3
{
  id v4 = (ODBATCHSiriSchemaODBATCHTurnRestatementScoresReported *)a3;
  odbatchDataReported = self->_odbatchDataReported;
  self->_odbatchDataReported = 0;

  unint64_t v6 = 11;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  turnRestatementScoresReported = self->_turnRestatementScoresReported;
  self->_turnRestatementScoresReported = v4;
}

- (void)deleteOdbatchDataReported
{
  if (self->_whichEvent_Type == 10)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_odbatchDataReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODBATCHSiriSchemaODBATCHDataReported)odbatchDataReported
{
  if (self->_whichEvent_Type == 10) {
    v2 = self->_odbatchDataReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOdbatchDataReported:(id)a3
{
  id v4 = (ODBATCHSiriSchemaODBATCHDataReported *)a3;
  turnRestatementScoresReported = self->_turnRestatementScoresReported;
  self->_turnRestatementScoresReported = 0;

  unint64_t v6 = 10;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  odbatchDataReported = self->_odbatchDataReported;
  self->_odbatchDataReported = v4;
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
  unint64_t v2 = [(ODBATCHSiriSchemaODBATCHClientEvent *)self whichEvent_Type];
  unint64_t v3 = @"com.apple.aiml.siri.odbatch.ODBATCHClientEvent";
  if (v2 == 11) {
    unint64_t v3 = @"com.apple.aiml.siri.odbatch.ODBATCHClientEvent.ODBATCHTurnRestatementScoresReported";
  }
  if (v2 == 10) {
    return @"com.apple.aiml.siri.odbatch.ODBATCHClientEvent.ODBATCHDataReported";
  }
  else {
    return v3;
  }
}

- (int)getAnyEventType
{
  return 84;
}

@end