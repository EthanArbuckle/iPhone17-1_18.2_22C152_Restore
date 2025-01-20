@interface ORCHSchemaORCHMUXBridgeContext
- (BOOL)hasEnded;
- (BOOL)hasEphemeralToAggregationIdentifierMap;
- (BOOL)hasStartedOrChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHMUXBridgeContext)initWithDictionary:(id)a3;
- (ORCHSchemaORCHMUXBridgeContext)initWithJSON:(id)a3;
- (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext)ephemeralToAggregationIdentifierMap;
- (ORCHSchemaORCHMUXRequestEnded)ended;
- (ORCHSchemaORCHMUXRequestStarted)startedOrChanged;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (void)deleteEnded;
- (void)deleteEphemeralToAggregationIdentifierMap;
- (void)deleteStartedOrChanged;
- (void)setEnded:(id)a3;
- (void)setEphemeralToAggregationIdentifierMap:(id)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasEphemeralToAggregationIdentifierMap:(BOOL)a3;
- (void)setHasStartedOrChanged:(BOOL)a3;
- (void)setStartedOrChanged:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHMUXBridgeContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ORCHSchemaORCHMUXBridgeContext;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(ORCHSchemaORCHMUXBridgeContext *)self startedOrChanged];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ORCHSchemaORCHMUXBridgeContext *)self deleteStartedOrChanged];
  }
  v9 = [(ORCHSchemaORCHMUXBridgeContext *)self ended];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ORCHSchemaORCHMUXBridgeContext *)self deleteEnded];
  }
  v12 = [(ORCHSchemaORCHMUXBridgeContext *)self ephemeralToAggregationIdentifierMap];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ORCHSchemaORCHMUXBridgeContext *)self deleteEphemeralToAggregationIdentifierMap];
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
  objc_storeStrong((id *)&self->_ephemeralToAggregationIdentifierMap, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
}

- (void)setHasEphemeralToAggregationIdentifierMap:(BOOL)a3
{
  self->_hasEphemeralToAggregationIdentifierMap = a3;
}

- (BOOL)hasEphemeralToAggregationIdentifierMap
{
  return self->_hasEphemeralToAggregationIdentifierMap;
}

- (void)setHasEnded:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (BOOL)hasEnded
{
  return self->_hasEnded;
}

- (void)setHasStartedOrChanged:(BOOL)a3
{
  self->_hasStartedOrChanged = a3;
}

- (BOOL)hasStartedOrChanged
{
  return self->_hasStartedOrChanged;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (ORCHSchemaORCHMUXBridgeContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ORCHSchemaORCHMUXBridgeContext;
  v5 = [(ORCHSchemaORCHMUXBridgeContext *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"startedOrChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ORCHSchemaORCHMUXRequestStarted alloc] initWithDictionary:v6];
      [(ORCHSchemaORCHMUXBridgeContext *)v5 setStartedOrChanged:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ORCHSchemaORCHMUXRequestEnded alloc] initWithDictionary:v8];
      [(ORCHSchemaORCHMUXBridgeContext *)v5 setEnded:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"ephemeralToAggregationIdentifierMap"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext alloc] initWithDictionary:v10];
      [(ORCHSchemaORCHMUXBridgeContext *)v5 setEphemeralToAggregationIdentifierMap:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHMUXBridgeContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHMUXBridgeContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHMUXBridgeContext *)self dictionaryRepresentation];
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
  if (self->_ended)
  {
    id v4 = [(ORCHSchemaORCHMUXBridgeContext *)self ended];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"ended"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"ended"];
    }
  }
  if (self->_ephemeralToAggregationIdentifierMap)
  {
    uint64_t v7 = [(ORCHSchemaORCHMUXBridgeContext *)self ephemeralToAggregationIdentifierMap];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"ephemeralToAggregationIdentifierMap"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"ephemeralToAggregationIdentifierMap"];
    }
  }
  if (self->_startedOrChanged)
  {
    v10 = [(ORCHSchemaORCHMUXBridgeContext *)self startedOrChanged];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"startedOrChanged"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"startedOrChanged"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ORCHSchemaORCHMUXRequestStarted *)self->_startedOrChanged hash];
  unint64_t v4 = [(ORCHSchemaORCHMUXRequestEnded *)self->_ended hash] ^ v3;
  return v4 ^ [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *)self->_ephemeralToAggregationIdentifierMap hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  unint64_t whichContextevent = self->_whichContextevent;
  if (whichContextevent != [v4 whichContextevent]) {
    goto LABEL_18;
  }
  v6 = [(ORCHSchemaORCHMUXBridgeContext *)self startedOrChanged];
  uint64_t v7 = [v4 startedOrChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(ORCHSchemaORCHMUXBridgeContext *)self startedOrChanged];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(ORCHSchemaORCHMUXBridgeContext *)self startedOrChanged];
    int v11 = [v4 startedOrChanged];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(ORCHSchemaORCHMUXBridgeContext *)self ended];
  uint64_t v7 = [v4 ended];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(ORCHSchemaORCHMUXBridgeContext *)self ended];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(ORCHSchemaORCHMUXBridgeContext *)self ended];
    objc_super v16 = [v4 ended];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(ORCHSchemaORCHMUXBridgeContext *)self ephemeralToAggregationIdentifierMap];
  uint64_t v7 = [v4 ephemeralToAggregationIdentifierMap];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(ORCHSchemaORCHMUXBridgeContext *)self ephemeralToAggregationIdentifierMap];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(ORCHSchemaORCHMUXBridgeContext *)self ephemeralToAggregationIdentifierMap];
    v21 = [v4 ephemeralToAggregationIdentifierMap];
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
  id v4 = [(ORCHSchemaORCHMUXBridgeContext *)self startedOrChanged];

  if (v4)
  {
    v5 = [(ORCHSchemaORCHMUXBridgeContext *)self startedOrChanged];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ORCHSchemaORCHMUXBridgeContext *)self ended];

  if (v6)
  {
    uint64_t v7 = [(ORCHSchemaORCHMUXBridgeContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(ORCHSchemaORCHMUXBridgeContext *)self ephemeralToAggregationIdentifierMap];

  if (v8)
  {
    v9 = [(ORCHSchemaORCHMUXBridgeContext *)self ephemeralToAggregationIdentifierMap];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHMUXBridgeContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteEphemeralToAggregationIdentifierMap
{
  if (self->_whichContextevent == 3)
  {
    self->_unint64_t whichContextevent = 0;
    self->_ephemeralToAggregationIdentifierMap = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext)ephemeralToAggregationIdentifierMap
{
  if (self->_whichContextevent == 3) {
    v2 = self->_ephemeralToAggregationIdentifierMap;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEphemeralToAggregationIdentifierMap:(id)a3
{
  id v4 = (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  unint64_t v7 = 3;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichContextevent = v7;
  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = v4;
}

- (void)deleteEnded
{
  if (self->_whichContextevent == 2)
  {
    self->_unint64_t whichContextevent = 0;
    self->_ended = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHMUXRequestEnded)ended
{
  if (self->_whichContextevent == 2) {
    v2 = self->_ended;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnded:(id)a3
{
  id v4 = (ORCHSchemaORCHMUXRequestEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = 0;

  self->_unint64_t whichContextevent = 2 * (v4 != 0);
  ended = self->_ended;
  self->_ended = v4;
}

- (void)deleteStartedOrChanged
{
  if (self->_whichContextevent == 1)
  {
    self->_unint64_t whichContextevent = 0;
    self->_startedOrChanged = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHMUXRequestStarted)startedOrChanged
{
  if (self->_whichContextevent == 1) {
    v2 = self->_startedOrChanged;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStartedOrChanged:(id)a3
{
  id v4 = (ORCHSchemaORCHMUXRequestStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = 0;

  self->_unint64_t whichContextevent = v4 != 0;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;
}

@end