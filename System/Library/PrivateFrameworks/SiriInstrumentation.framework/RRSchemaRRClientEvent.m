@interface RRSchemaRRClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEntityPoolResolveContext;
- (BOOL)hasEntityPoolReturned;
- (BOOL)hasEventMetadata;
- (BOOL)hasPullerContext;
- (BOOL)hasRrUsoGraphTier1;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RRSchemaRRClientEvent)initWithDictionary:(id)a3;
- (RRSchemaRRClientEvent)initWithJSON:(id)a3;
- (RRSchemaRRClientEventMetadata)eventMetadata;
- (RRSchemaRREntityPoolResolveContext)entityPoolResolveContext;
- (RRSchemaRREntityPoolReturned)entityPoolReturned;
- (RRSchemaRRPullerContext)pullerContext;
- (RRSchemaRRUsoGraphTier1)rrUsoGraphTier1;
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
- (void)deleteEntityPoolResolveContext;
- (void)deleteEntityPoolReturned;
- (void)deleteEventMetadata;
- (void)deletePullerContext;
- (void)deleteRrUsoGraphTier1;
- (void)setEntityPoolResolveContext:(id)a3;
- (void)setEntityPoolReturned:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasEntityPoolResolveContext:(BOOL)a3;
- (void)setHasEntityPoolReturned:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasPullerContext:(BOOL)a3;
- (void)setHasRrUsoGraphTier1:(BOOL)a3;
- (void)setPullerContext:(id)a3;
- (void)setRrUsoGraphTier1:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RRSchemaRRClientEvent

- (int)componentName
{
  v3 = [(RRSchemaRRClientEvent *)self eventMetadata];
  v4 = [v3 rrID];

  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [v4 value];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = (void *)v5;
  v7 = [v4 value];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    LODWORD(v9) = 15;
  }
  else
  {
LABEL_5:
    v10 = [(RRSchemaRRClientEvent *)self eventMetadata];
    v11 = [v10 requestId];

    if (!v11) {
      goto LABEL_9;
    }
    uint64_t v12 = [v11 value];
    if (!v12) {
      goto LABEL_9;
    }
    v13 = (void *)v12;
    v14 = [v11 value];
    uint64_t v15 = [v14 length];

    if (v15)
    {
      LODWORD(v9) = 1;
      v4 = v11;
    }
    else
    {
LABEL_9:
      v16 = [(RRSchemaRRClientEvent *)self eventMetadata];
      v4 = [v16 subRequestId];

      if (v4)
      {
        v9 = [v4 value];
        if (v9)
        {
          v17 = [v4 value];
          uint64_t v18 = [v17 length];

          if (v18) {
            LODWORD(v9) = 43;
          }
          else {
            LODWORD(v9) = 0;
          }
        }
      }
      else
      {
        LODWORD(v9) = 0;
      }
    }
  }

  return (int)v9;
}

- (id)getComponentId
{
  v3 = [(RRSchemaRRClientEvent *)self eventMetadata];
  v4 = [v3 rrID];

  if (v4)
  {
    uint64_t v5 = [v4 value];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v4 value];
      uint64_t v8 = [v7 length];

      if (v8) {
        goto LABEL_11;
      }
    }
  }
  v9 = [(RRSchemaRRClientEvent *)self eventMetadata];
  v10 = [v9 requestId];

  if (v10)
  {
    uint64_t v11 = [v10 value];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      v13 = [v10 value];
      uint64_t v14 = [v13 length];

      if (v14)
      {
        v4 = v10;
LABEL_11:
        id v16 = v4;
        v4 = v16;
        goto LABEL_13;
      }
    }
  }
  uint64_t v15 = [(RRSchemaRRClientEvent *)self eventMetadata];
  v4 = [v15 subRequestId];

  if (v4)
  {
    id v16 = [v4 value];
    if (!v16) {
      goto LABEL_13;
    }
    v17 = [v4 value];
    uint64_t v18 = [v17 length];

    if (v18) {
      goto LABEL_11;
    }
  }
  id v16 = 0;
LABEL_13:

  return v16;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RRSchemaRRClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(RRSchemaRRClientEvent *)self deleteRrUsoGraphTier1];
  }
  if ([v4 isConditionSet:4]) {
    [(RRSchemaRRClientEvent *)self deleteRrUsoGraphTier1];
  }
  if ([v4 isConditionSet:5]) {
    [(RRSchemaRRClientEvent *)self deleteRrUsoGraphTier1];
  }
  if ([v4 isConditionSet:6]) {
    [(RRSchemaRRClientEvent *)self deleteRrUsoGraphTier1];
  }
  if ([v4 isConditionSet:7]) {
    [(RRSchemaRRClientEvent *)self deleteRrUsoGraphTier1];
  }
  v6 = [(RRSchemaRRClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(RRSchemaRRClientEvent *)self deleteEventMetadata];
  }
  v9 = [(RRSchemaRRClientEvent *)self entityPoolReturned];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(RRSchemaRRClientEvent *)self deleteEntityPoolReturned];
  }
  uint64_t v12 = [(RRSchemaRRClientEvent *)self entityPoolResolveContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(RRSchemaRRClientEvent *)self deleteEntityPoolResolveContext];
  }
  uint64_t v15 = [(RRSchemaRRClientEvent *)self rrUsoGraphTier1];
  id v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(RRSchemaRRClientEvent *)self deleteRrUsoGraphTier1];
  }
  uint64_t v18 = [(RRSchemaRRClientEvent *)self pullerContext];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(RRSchemaRRClientEvent *)self deletePullerContext];
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
  unint64_t v3 = [(RRSchemaRRClientEvent *)self whichEvent_Type];
  if (v3 - 2 > 3) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EABD58[v3 - 2]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 2 > 3) {
    return 0;
  }
  else {
    return off_1E5EABD78[a3 - 2];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pullerContext, 0);
  objc_storeStrong((id *)&self->_rrUsoGraphTier1, 0);
  objc_storeStrong((id *)&self->_entityPoolResolveContext, 0);
  objc_storeStrong((id *)&self->_entityPoolReturned, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasPullerContext:(BOOL)a3
{
  self->_hasPullerContext = a3;
}

- (BOOL)hasPullerContext
{
  return self->_hasPullerContext;
}

- (void)setHasRrUsoGraphTier1:(BOOL)a3
{
  self->_hasRrUsoGraphTier1 = a3;
}

- (BOOL)hasRrUsoGraphTier1
{
  return self->_hasRrUsoGraphTier1;
}

- (void)setHasEntityPoolResolveContext:(BOOL)a3
{
  self->_hasEntityPoolResolveContext = a3;
}

- (BOOL)hasEntityPoolResolveContext
{
  return self->_hasEntityPoolResolveContext;
}

- (void)setHasEntityPoolReturned:(BOOL)a3
{
  self->_hasEntityPoolReturned = a3;
}

- (BOOL)hasEntityPoolReturned
{
  return self->_hasEntityPoolReturned;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (RRSchemaRRClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (RRSchemaRRClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RRSchemaRRClientEvent;
  uint64_t v5 = [(RRSchemaRRClientEvent *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[RRSchemaRRClientEventMetadata alloc] initWithDictionary:v6];
      [(RRSchemaRRClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"entityPoolReturned"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[RRSchemaRREntityPoolReturned alloc] initWithDictionary:v8];
      [(RRSchemaRRClientEvent *)v5 setEntityPoolReturned:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"entityPoolResolveContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[RRSchemaRREntityPoolResolveContext alloc] initWithDictionary:v10];
      [(RRSchemaRRClientEvent *)v5 setEntityPoolResolveContext:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"rrUsoGraphTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[RRSchemaRRUsoGraphTier1 alloc] initWithDictionary:v12];
      [(RRSchemaRRClientEvent *)v5 setRrUsoGraphTier1:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"pullerContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [[RRSchemaRRPullerContext alloc] initWithDictionary:v14];
      [(RRSchemaRRClientEvent *)v5 setPullerContext:v15];
    }
    id v16 = v5;
  }
  return v5;
}

- (RRSchemaRRClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(RRSchemaRRClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaRRClientEvent *)self dictionaryRepresentation];
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
  if (self->_entityPoolResolveContext)
  {
    id v4 = [(RRSchemaRRClientEvent *)self entityPoolResolveContext];
    uint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"entityPoolResolveContext"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"entityPoolResolveContext"];
    }
  }
  if (self->_entityPoolReturned)
  {
    uint64_t v7 = [(RRSchemaRRClientEvent *)self entityPoolReturned];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"entityPoolReturned"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"entityPoolReturned"];
    }
  }
  if (self->_eventMetadata)
  {
    v10 = [(RRSchemaRRClientEvent *)self eventMetadata];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_pullerContext)
  {
    v13 = [(RRSchemaRRClientEvent *)self pullerContext];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"pullerContext"];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"pullerContext"];
    }
  }
  if (self->_rrUsoGraphTier1)
  {
    id v16 = [(RRSchemaRRClientEvent *)self rrUsoGraphTier1];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"rrUsoGraphTier1"];
    }
    else
    {
      objc_super v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"rrUsoGraphTier1"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(RRSchemaRRClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(RRSchemaRREntityPoolReturned *)self->_entityPoolReturned hash] ^ v3;
  unint64_t v5 = [(RRSchemaRREntityPoolResolveContext *)self->_entityPoolResolveContext hash];
  unint64_t v6 = v4 ^ v5 ^ [(RRSchemaRRUsoGraphTier1 *)self->_rrUsoGraphTier1 hash];
  return v6 ^ [(RRSchemaRRPullerContext *)self->_pullerContext hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_28;
  }
  unint64_t v6 = [(RRSchemaRRClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v8 = [(RRSchemaRRClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(RRSchemaRRClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RRSchemaRRClientEvent *)self entityPoolReturned];
  uint64_t v7 = [v4 entityPoolReturned];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v13 = [(RRSchemaRRClientEvent *)self entityPoolReturned];
  if (v13)
  {
    int v14 = (void *)v13;
    uint64_t v15 = [(RRSchemaRRClientEvent *)self entityPoolReturned];
    id v16 = [v4 entityPoolReturned];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RRSchemaRRClientEvent *)self entityPoolResolveContext];
  uint64_t v7 = [v4 entityPoolResolveContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v18 = [(RRSchemaRRClientEvent *)self entityPoolResolveContext];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(RRSchemaRRClientEvent *)self entityPoolResolveContext];
    v21 = [v4 entityPoolResolveContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RRSchemaRRClientEvent *)self rrUsoGraphTier1];
  uint64_t v7 = [v4 rrUsoGraphTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v23 = [(RRSchemaRRClientEvent *)self rrUsoGraphTier1];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(RRSchemaRRClientEvent *)self rrUsoGraphTier1];
    v26 = [v4 rrUsoGraphTier1];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RRSchemaRRClientEvent *)self pullerContext];
  uint64_t v7 = [v4 pullerContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v28 = [(RRSchemaRRClientEvent *)self pullerContext];
    if (!v28)
    {

LABEL_31:
      BOOL v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    v30 = [(RRSchemaRRClientEvent *)self pullerContext];
    v31 = [v4 pullerContext];
    char v32 = [v30 isEqual:v31];

    if (v32) {
      goto LABEL_31;
    }
  }
  else
  {
LABEL_27:
  }
LABEL_28:
  BOOL v33 = 0;
LABEL_29:

  return v33;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  id v4 = [(RRSchemaRRClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(RRSchemaRRClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(RRSchemaRRClientEvent *)self entityPoolReturned];

  if (v6)
  {
    uint64_t v7 = [(RRSchemaRRClientEvent *)self entityPoolReturned];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(RRSchemaRRClientEvent *)self entityPoolResolveContext];

  if (v8)
  {
    v9 = [(RRSchemaRRClientEvent *)self entityPoolResolveContext];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(RRSchemaRRClientEvent *)self rrUsoGraphTier1];

  if (v10)
  {
    int v11 = [(RRSchemaRRClientEvent *)self rrUsoGraphTier1];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(RRSchemaRRClientEvent *)self pullerContext];

  if (v12)
  {
    uint64_t v13 = [(RRSchemaRRClientEvent *)self pullerContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaRRClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deletePullerContext
{
  if (self->_whichEvent_Type == 5)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pullerContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RRSchemaRRPullerContext)pullerContext
{
  if (self->_whichEvent_Type == 5) {
    v2 = self->_pullerContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPullerContext:(id)a3
{
  id v4 = (RRSchemaRRPullerContext *)a3;
  entityPoolReturned = self->_entityPoolReturned;
  self->_entityPoolReturned = 0;

  entityPoolResolveContext = self->_entityPoolResolveContext;
  self->_entityPoolResolveContext = 0;

  rrUsoGraphTier1 = self->_rrUsoGraphTier1;
  self->_rrUsoGraphTier1 = 0;

  unint64_t v8 = 5;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  pullerContext = self->_pullerContext;
  self->_pullerContext = v4;
}

- (void)deleteRrUsoGraphTier1
{
  if (self->_whichEvent_Type == 4)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_rrUsoGraphTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RRSchemaRRUsoGraphTier1)rrUsoGraphTier1
{
  if (self->_whichEvent_Type == 4) {
    v2 = self->_rrUsoGraphTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRrUsoGraphTier1:(id)a3
{
  id v4 = (RRSchemaRRUsoGraphTier1 *)a3;
  entityPoolReturned = self->_entityPoolReturned;
  self->_entityPoolReturned = 0;

  entityPoolResolveContext = self->_entityPoolResolveContext;
  self->_entityPoolResolveContext = 0;

  pullerContext = self->_pullerContext;
  self->_pullerContext = 0;

  self->_unint64_t whichEvent_Type = 4 * (v4 != 0);
  rrUsoGraphTier1 = self->_rrUsoGraphTier1;
  self->_rrUsoGraphTier1 = v4;
}

- (void)deleteEntityPoolResolveContext
{
  if (self->_whichEvent_Type == 3)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_entityPoolResolveContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RRSchemaRREntityPoolResolveContext)entityPoolResolveContext
{
  if (self->_whichEvent_Type == 3) {
    v2 = self->_entityPoolResolveContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEntityPoolResolveContext:(id)a3
{
  id v4 = (RRSchemaRREntityPoolResolveContext *)a3;
  entityPoolReturned = self->_entityPoolReturned;
  self->_entityPoolReturned = 0;

  rrUsoGraphTier1 = self->_rrUsoGraphTier1;
  self->_rrUsoGraphTier1 = 0;

  pullerContext = self->_pullerContext;
  self->_pullerContext = 0;

  unint64_t v8 = 3;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  entityPoolResolveContext = self->_entityPoolResolveContext;
  self->_entityPoolResolveContext = v4;
}

- (void)deleteEntityPoolReturned
{
  if (self->_whichEvent_Type == 2)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_entityPoolReturned = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RRSchemaRREntityPoolReturned)entityPoolReturned
{
  if (self->_whichEvent_Type == 2) {
    v2 = self->_entityPoolReturned;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEntityPoolReturned:(id)a3
{
  id v4 = (RRSchemaRREntityPoolReturned *)a3;
  entityPoolResolveContext = self->_entityPoolResolveContext;
  self->_entityPoolResolveContext = 0;

  rrUsoGraphTier1 = self->_rrUsoGraphTier1;
  self->_rrUsoGraphTier1 = 0;

  pullerContext = self->_pullerContext;
  self->_pullerContext = 0;

  self->_unint64_t whichEvent_Type = 2 * (v4 != 0);
  entityPoolReturned = self->_entityPoolReturned;
  self->_entityPoolReturned = v4;
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
  unint64_t v2 = [(RRSchemaRRClientEvent *)self whichEvent_Type];
  if (v2 - 2 > 3) {
    return @"com.apple.aiml.siri.rr.RRClientEvent";
  }
  else {
    return off_1E5EB49D0[v2 - 2];
  }
}

- (int)getAnyEventType
{
  return 26;
}

@end