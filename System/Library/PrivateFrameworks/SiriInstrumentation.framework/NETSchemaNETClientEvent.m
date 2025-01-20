@interface NETSchemaNETClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasDebugNetworkConnectionStatePreparationSnapshotCaptured;
- (BOOL)hasDebugNetworkConnectionStateReadySnapshotCaptured;
- (BOOL)hasDebugSessionConnectionSnapshotCaptured;
- (BOOL)hasEventMetadata;
- (BOOL)hasNetworkConnectionStatePreparationSnapshotCaptured;
- (BOOL)hasNetworkConnectionStateReadySnapshotCaptured;
- (BOOL)hasPeerConnectionFailed;
- (BOOL)hasSessionConnectionFailed;
- (BOOL)hasSessionConnectionHttpHeaderCreated;
- (BOOL)hasSessionConnectionSnapshotCaptured;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETClientEvent)initWithDictionary:(id)a3;
- (NETSchemaNETClientEvent)initWithJSON:(id)a3;
- (NETSchemaNETClientEventMetadata)eventMetadata;
- (NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured)debugNetworkConnectionStatePreparationSnapshotCaptured;
- (NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured)debugNetworkConnectionStateReadySnapshotCaptured;
- (NETSchemaNETDebugSessionConnectionSnapshotCaptured)debugSessionConnectionSnapshotCaptured;
- (NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured)networkConnectionStatePreparationSnapshotCaptured;
- (NETSchemaNETNetworkConnectionStateReadySnapshotCaptured)networkConnectionStateReadySnapshotCaptured;
- (NETSchemaNETPeerConnectionFailed)peerConnectionFailed;
- (NETSchemaNETSessionConnectionFailed)sessionConnectionFailed;
- (NETSchemaNETSessionConnectionHttpHeaderCreated)sessionConnectionHttpHeaderCreated;
- (NETSchemaNETSessionConnectionSnapshotCaptured)sessionConnectionSnapshotCaptured;
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
- (void)deleteDebugNetworkConnectionStatePreparationSnapshotCaptured;
- (void)deleteDebugNetworkConnectionStateReadySnapshotCaptured;
- (void)deleteDebugSessionConnectionSnapshotCaptured;
- (void)deleteEventMetadata;
- (void)deleteNetworkConnectionStatePreparationSnapshotCaptured;
- (void)deleteNetworkConnectionStateReadySnapshotCaptured;
- (void)deletePeerConnectionFailed;
- (void)deleteSessionConnectionFailed;
- (void)deleteSessionConnectionHttpHeaderCreated;
- (void)deleteSessionConnectionSnapshotCaptured;
- (void)setDebugNetworkConnectionStatePreparationSnapshotCaptured:(id)a3;
- (void)setDebugNetworkConnectionStateReadySnapshotCaptured:(id)a3;
- (void)setDebugSessionConnectionSnapshotCaptured:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasDebugNetworkConnectionStatePreparationSnapshotCaptured:(BOOL)a3;
- (void)setHasDebugNetworkConnectionStateReadySnapshotCaptured:(BOOL)a3;
- (void)setHasDebugSessionConnectionSnapshotCaptured:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasNetworkConnectionStatePreparationSnapshotCaptured:(BOOL)a3;
- (void)setHasNetworkConnectionStateReadySnapshotCaptured:(BOOL)a3;
- (void)setHasPeerConnectionFailed:(BOOL)a3;
- (void)setHasSessionConnectionFailed:(BOOL)a3;
- (void)setHasSessionConnectionHttpHeaderCreated:(BOOL)a3;
- (void)setHasSessionConnectionSnapshotCaptured:(BOOL)a3;
- (void)setNetworkConnectionStatePreparationSnapshotCaptured:(id)a3;
- (void)setNetworkConnectionStateReadySnapshotCaptured:(id)a3;
- (void)setPeerConnectionFailed:(id)a3;
- (void)setSessionConnectionFailed:(id)a3;
- (void)setSessionConnectionHttpHeaderCreated:(id)a3;
- (void)setSessionConnectionSnapshotCaptured:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETClientEvent

- (int)componentName
{
  v2 = [(NETSchemaNETClientEvent *)self eventMetadata];
  v3 = [v2 netId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 18;
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
  v2 = [(NETSchemaNETClientEvent *)self eventMetadata];
  v3 = [v2 netId];

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
  v37.receiver = self;
  v37.super_class = (Class)NETSchemaNETClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v37 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(NETSchemaNETClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NETSchemaNETClientEvent *)self deleteEventMetadata];
  }
  v9 = [(NETSchemaNETClientEvent *)self sessionConnectionHttpHeaderCreated];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NETSchemaNETClientEvent *)self deleteSessionConnectionHttpHeaderCreated];
  }
  v12 = [(NETSchemaNETClientEvent *)self sessionConnectionSnapshotCaptured];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(NETSchemaNETClientEvent *)self deleteSessionConnectionSnapshotCaptured];
  }
  v15 = [(NETSchemaNETClientEvent *)self debugSessionConnectionSnapshotCaptured];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(NETSchemaNETClientEvent *)self deleteDebugSessionConnectionSnapshotCaptured];
  }
  v18 = [(NETSchemaNETClientEvent *)self sessionConnectionFailed];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(NETSchemaNETClientEvent *)self deleteSessionConnectionFailed];
  }
  v21 = [(NETSchemaNETClientEvent *)self peerConnectionFailed];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(NETSchemaNETClientEvent *)self deletePeerConnectionFailed];
  }
  v24 = [(NETSchemaNETClientEvent *)self networkConnectionStatePreparationSnapshotCaptured];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(NETSchemaNETClientEvent *)self deleteNetworkConnectionStatePreparationSnapshotCaptured];
  }
  v27 = [(NETSchemaNETClientEvent *)self debugNetworkConnectionStatePreparationSnapshotCaptured];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(NETSchemaNETClientEvent *)self deleteDebugNetworkConnectionStatePreparationSnapshotCaptured];
  }
  v30 = [(NETSchemaNETClientEvent *)self networkConnectionStateReadySnapshotCaptured];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(NETSchemaNETClientEvent *)self deleteNetworkConnectionStateReadySnapshotCaptured];
  }
  v33 = [(NETSchemaNETClientEvent *)self debugNetworkConnectionStateReadySnapshotCaptured];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(NETSchemaNETClientEvent *)self deleteDebugNetworkConnectionStateReadySnapshotCaptured];
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
  unint64_t v3 = [(NETSchemaNETClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 8) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAB018[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 8) {
    return 0;
  }
  else {
    return off_1E5EAB060[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugNetworkConnectionStateReadySnapshotCaptured, 0);
  objc_storeStrong((id *)&self->_networkConnectionStateReadySnapshotCaptured, 0);
  objc_storeStrong((id *)&self->_debugNetworkConnectionStatePreparationSnapshotCaptured, 0);
  objc_storeStrong((id *)&self->_networkConnectionStatePreparationSnapshotCaptured, 0);
  objc_storeStrong((id *)&self->_peerConnectionFailed, 0);
  objc_storeStrong((id *)&self->_sessionConnectionFailed, 0);
  objc_storeStrong((id *)&self->_debugSessionConnectionSnapshotCaptured, 0);
  objc_storeStrong((id *)&self->_sessionConnectionSnapshotCaptured, 0);
  objc_storeStrong((id *)&self->_sessionConnectionHttpHeaderCreated, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasDebugNetworkConnectionStateReadySnapshotCaptured:(BOOL)a3
{
  self->_hasDebugNetworkConnectionStateReadySnapshotCaptured = a3;
}

- (BOOL)hasDebugNetworkConnectionStateReadySnapshotCaptured
{
  return self->_hasDebugNetworkConnectionStateReadySnapshotCaptured;
}

- (void)setHasNetworkConnectionStateReadySnapshotCaptured:(BOOL)a3
{
  self->_hasNetworkConnectionStateReadySnapshotCaptured = a3;
}

- (BOOL)hasNetworkConnectionStateReadySnapshotCaptured
{
  return self->_hasNetworkConnectionStateReadySnapshotCaptured;
}

- (void)setHasDebugNetworkConnectionStatePreparationSnapshotCaptured:(BOOL)a3
{
  self->_hasDebugNetworkConnectionStatePreparationSnapshotCaptured = a3;
}

- (BOOL)hasDebugNetworkConnectionStatePreparationSnapshotCaptured
{
  return self->_hasDebugNetworkConnectionStatePreparationSnapshotCaptured;
}

- (void)setHasNetworkConnectionStatePreparationSnapshotCaptured:(BOOL)a3
{
  self->_hasNetworkConnectionStatePreparationSnapshotCaptured = a3;
}

- (BOOL)hasNetworkConnectionStatePreparationSnapshotCaptured
{
  return self->_hasNetworkConnectionStatePreparationSnapshotCaptured;
}

- (void)setHasPeerConnectionFailed:(BOOL)a3
{
  self->_hasPeerConnectionFailed = a3;
}

- (BOOL)hasPeerConnectionFailed
{
  return self->_hasPeerConnectionFailed;
}

- (void)setHasSessionConnectionFailed:(BOOL)a3
{
  self->_hasSessionConnectionFailed = a3;
}

- (BOOL)hasSessionConnectionFailed
{
  return self->_hasSessionConnectionFailed;
}

- (void)setHasDebugSessionConnectionSnapshotCaptured:(BOOL)a3
{
  self->_hasDebugSessionConnectionSnapshotCaptured = a3;
}

- (BOOL)hasDebugSessionConnectionSnapshotCaptured
{
  return self->_hasDebugSessionConnectionSnapshotCaptured;
}

- (void)setHasSessionConnectionSnapshotCaptured:(BOOL)a3
{
  self->_hasSessionConnectionSnapshotCaptured = a3;
}

- (BOOL)hasSessionConnectionSnapshotCaptured
{
  return self->_hasSessionConnectionSnapshotCaptured;
}

- (void)setHasSessionConnectionHttpHeaderCreated:(BOOL)a3
{
  self->_hasSessionConnectionHttpHeaderCreated = a3;
}

- (BOOL)hasSessionConnectionHttpHeaderCreated
{
  return self->_hasSessionConnectionHttpHeaderCreated;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (NETSchemaNETClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (NETSchemaNETClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)NETSchemaNETClientEvent;
  v5 = [(NETSchemaNETClientEvent *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[NETSchemaNETClientEventMetadata alloc] initWithDictionary:v6];
      [(NETSchemaNETClientEvent *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"sessionConnectionHttpHeaderCreated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[NETSchemaNETSessionConnectionHttpHeaderCreated alloc] initWithDictionary:v8];
      [(NETSchemaNETClientEvent *)v5 setSessionConnectionHttpHeaderCreated:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"sessionConnectionSnapshotCaptured"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[NETSchemaNETSessionConnectionSnapshotCaptured alloc] initWithDictionary:v10];
      [(NETSchemaNETClientEvent *)v5 setSessionConnectionSnapshotCaptured:v11];
    }
    v30 = (void *)v10;
    uint64_t v12 = [v4 objectForKeyedSubscript:@"debugSessionConnectionSnapshotCaptured"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[NETSchemaNETDebugSessionConnectionSnapshotCaptured alloc] initWithDictionary:v12];
      [(NETSchemaNETClientEvent *)v5 setDebugSessionConnectionSnapshotCaptured:v13];
    }
    int v29 = (void *)v12;
    int v14 = [v4 objectForKeyedSubscript:@"sessionConnectionFailed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[NETSchemaNETSessionConnectionFailed alloc] initWithDictionary:v14];
      [(NETSchemaNETClientEvent *)v5 setSessionConnectionFailed:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"peerConnectionFailed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[NETSchemaNETPeerConnectionFailed alloc] initWithDictionary:v16];
      [(NETSchemaNETClientEvent *)v5 setPeerConnectionFailed:v17];
    }
    v31 = (void *)v8;
    v18 = [v4 objectForKeyedSubscript:@"networkConnectionStatePreparationSnapshotCaptured"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured alloc] initWithDictionary:v18];
      [(NETSchemaNETClientEvent *)v5 setNetworkConnectionStatePreparationSnapshotCaptured:v19];
    }
    int v20 = (void *)v6;
    v21 = [v4 objectForKeyedSubscript:@"debugNetworkConnectionStatePreparationSnapshotCaptured"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured alloc] initWithDictionary:v21];
      [(NETSchemaNETClientEvent *)v5 setDebugNetworkConnectionStatePreparationSnapshotCaptured:v22];
    }
    int v23 = [v4 objectForKeyedSubscript:@"networkConnectionStateReadySnapshotCaptured"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [[NETSchemaNETNetworkConnectionStateReadySnapshotCaptured alloc] initWithDictionary:v23];
      [(NETSchemaNETClientEvent *)v5 setNetworkConnectionStateReadySnapshotCaptured:v24];
    }
    v25 = [v4 objectForKeyedSubscript:@"debugNetworkConnectionStateReadySnapshotCaptured"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v26 = [[NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured alloc] initWithDictionary:v25];
      [(NETSchemaNETClientEvent *)v5 setDebugNetworkConnectionStateReadySnapshotCaptured:v26];
    }
    v27 = v5;
  }
  return v5;
}

- (NETSchemaNETClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETClientEvent *)self dictionaryRepresentation];
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
  if (self->_debugNetworkConnectionStatePreparationSnapshotCaptured)
  {
    id v4 = [(NETSchemaNETClientEvent *)self debugNetworkConnectionStatePreparationSnapshotCaptured];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"debugNetworkConnectionStatePreparationSnapshotCaptured"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"debugNetworkConnectionStatePreparationSnapshotCaptured"];
    }
  }
  if (self->_debugNetworkConnectionStateReadySnapshotCaptured)
  {
    uint64_t v7 = [(NETSchemaNETClientEvent *)self debugNetworkConnectionStateReadySnapshotCaptured];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"debugNetworkConnectionStateReadySnapshotCaptured"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"debugNetworkConnectionStateReadySnapshotCaptured"];
    }
  }
  if (self->_debugSessionConnectionSnapshotCaptured)
  {
    uint64_t v10 = [(NETSchemaNETClientEvent *)self debugSessionConnectionSnapshotCaptured];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"debugSessionConnectionSnapshotCaptured"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"debugSessionConnectionSnapshotCaptured"];
    }
  }
  if (self->_eventMetadata)
  {
    v13 = [(NETSchemaNETClientEvent *)self eventMetadata];
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
  if (self->_networkConnectionStatePreparationSnapshotCaptured)
  {
    v16 = [(NETSchemaNETClientEvent *)self networkConnectionStatePreparationSnapshotCaptured];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"networkConnectionStatePreparationSnapshotCaptured"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"networkConnectionStatePreparationSnapshotCaptured"];
    }
  }
  if (self->_networkConnectionStateReadySnapshotCaptured)
  {
    v19 = [(NETSchemaNETClientEvent *)self networkConnectionStateReadySnapshotCaptured];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"networkConnectionStateReadySnapshotCaptured"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"networkConnectionStateReadySnapshotCaptured"];
    }
  }
  if (self->_peerConnectionFailed)
  {
    v22 = [(NETSchemaNETClientEvent *)self peerConnectionFailed];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"peerConnectionFailed"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"peerConnectionFailed"];
    }
  }
  if (self->_sessionConnectionFailed)
  {
    v25 = [(NETSchemaNETClientEvent *)self sessionConnectionFailed];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"sessionConnectionFailed"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"sessionConnectionFailed"];
    }
  }
  if (self->_sessionConnectionHttpHeaderCreated)
  {
    v28 = [(NETSchemaNETClientEvent *)self sessionConnectionHttpHeaderCreated];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"sessionConnectionHttpHeaderCreated"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"sessionConnectionHttpHeaderCreated"];
    }
  }
  if (self->_sessionConnectionSnapshotCaptured)
  {
    v31 = [(NETSchemaNETClientEvent *)self sessionConnectionSnapshotCaptured];
    objc_super v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"sessionConnectionSnapshotCaptured"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"sessionConnectionSnapshotCaptured"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NETSchemaNETClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(NETSchemaNETSessionConnectionHttpHeaderCreated *)self->_sessionConnectionHttpHeaderCreated hash] ^ v3;
  unint64_t v5 = [(NETSchemaNETSessionConnectionSnapshotCaptured *)self->_sessionConnectionSnapshotCaptured hash];
  unint64_t v6 = v4 ^ v5 ^ [(NETSchemaNETDebugSessionConnectionSnapshotCaptured *)self->_debugSessionConnectionSnapshotCaptured hash];
  unint64_t v7 = [(NETSchemaNETSessionConnectionFailed *)self->_sessionConnectionFailed hash];
  unint64_t v8 = v7 ^ [(NETSchemaNETPeerConnectionFailed *)self->_peerConnectionFailed hash];
  unint64_t v9 = v6 ^ v8 ^ [(NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured *)self->_networkConnectionStatePreparationSnapshotCaptured hash];
  unint64_t v10 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self->_debugNetworkConnectionStatePreparationSnapshotCaptured hash];
  unint64_t v11 = v10 ^ [(NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *)self->_networkConnectionStateReadySnapshotCaptured hash];
  return v9 ^ v11 ^ [(NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)self->_debugNetworkConnectionStateReadySnapshotCaptured hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_53;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_53;
  }
  unint64_t v6 = [(NETSchemaNETClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v8 = [(NETSchemaNETClientEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(NETSchemaNETClientEvent *)self eventMetadata];
    unint64_t v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NETSchemaNETClientEvent *)self sessionConnectionHttpHeaderCreated];
  unint64_t v7 = [v4 sessionConnectionHttpHeaderCreated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v13 = [(NETSchemaNETClientEvent *)self sessionConnectionHttpHeaderCreated];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(NETSchemaNETClientEvent *)self sessionConnectionHttpHeaderCreated];
    v16 = [v4 sessionConnectionHttpHeaderCreated];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NETSchemaNETClientEvent *)self sessionConnectionSnapshotCaptured];
  unint64_t v7 = [v4 sessionConnectionSnapshotCaptured];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v18 = [(NETSchemaNETClientEvent *)self sessionConnectionSnapshotCaptured];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(NETSchemaNETClientEvent *)self sessionConnectionSnapshotCaptured];
    v21 = [v4 sessionConnectionSnapshotCaptured];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NETSchemaNETClientEvent *)self debugSessionConnectionSnapshotCaptured];
  unint64_t v7 = [v4 debugSessionConnectionSnapshotCaptured];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v23 = [(NETSchemaNETClientEvent *)self debugSessionConnectionSnapshotCaptured];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(NETSchemaNETClientEvent *)self debugSessionConnectionSnapshotCaptured];
    int v26 = [v4 debugSessionConnectionSnapshotCaptured];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NETSchemaNETClientEvent *)self sessionConnectionFailed];
  unint64_t v7 = [v4 sessionConnectionFailed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v28 = [(NETSchemaNETClientEvent *)self sessionConnectionFailed];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(NETSchemaNETClientEvent *)self sessionConnectionFailed];
    v31 = [v4 sessionConnectionFailed];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NETSchemaNETClientEvent *)self peerConnectionFailed];
  unint64_t v7 = [v4 peerConnectionFailed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v33 = [(NETSchemaNETClientEvent *)self peerConnectionFailed];
  if (v33)
  {
    v34 = (void *)v33;
    int v35 = [(NETSchemaNETClientEvent *)self peerConnectionFailed];
    v36 = [v4 peerConnectionFailed];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NETSchemaNETClientEvent *)self networkConnectionStatePreparationSnapshotCaptured];
  unint64_t v7 = [v4 networkConnectionStatePreparationSnapshotCaptured];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v38 = [(NETSchemaNETClientEvent *)self networkConnectionStatePreparationSnapshotCaptured];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(NETSchemaNETClientEvent *)self networkConnectionStatePreparationSnapshotCaptured];
    v41 = [v4 networkConnectionStatePreparationSnapshotCaptured];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NETSchemaNETClientEvent *)self debugNetworkConnectionStatePreparationSnapshotCaptured];
  unint64_t v7 = [v4 debugNetworkConnectionStatePreparationSnapshotCaptured];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v43 = [(NETSchemaNETClientEvent *)self debugNetworkConnectionStatePreparationSnapshotCaptured];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(NETSchemaNETClientEvent *)self debugNetworkConnectionStatePreparationSnapshotCaptured];
    v46 = [v4 debugNetworkConnectionStatePreparationSnapshotCaptured];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NETSchemaNETClientEvent *)self networkConnectionStateReadySnapshotCaptured];
  unint64_t v7 = [v4 networkConnectionStateReadySnapshotCaptured];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v48 = [(NETSchemaNETClientEvent *)self networkConnectionStateReadySnapshotCaptured];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(NETSchemaNETClientEvent *)self networkConnectionStateReadySnapshotCaptured];
    v51 = [v4 networkConnectionStateReadySnapshotCaptured];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NETSchemaNETClientEvent *)self debugNetworkConnectionStateReadySnapshotCaptured];
  unint64_t v7 = [v4 debugNetworkConnectionStateReadySnapshotCaptured];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v53 = [(NETSchemaNETClientEvent *)self debugNetworkConnectionStateReadySnapshotCaptured];
    if (!v53)
    {

LABEL_56:
      BOOL v58 = 1;
      goto LABEL_54;
    }
    v54 = (void *)v53;
    v55 = [(NETSchemaNETClientEvent *)self debugNetworkConnectionStateReadySnapshotCaptured];
    v56 = [v4 debugNetworkConnectionStateReadySnapshotCaptured];
    char v57 = [v55 isEqual:v56];

    if (v57) {
      goto LABEL_56;
    }
  }
  else
  {
LABEL_52:
  }
LABEL_53:
  BOOL v58 = 0;
LABEL_54:

  return v58;
}

- (void)writeTo:(id)a3
{
  id v24 = a3;
  id v4 = [(NETSchemaNETClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(NETSchemaNETClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(NETSchemaNETClientEvent *)self sessionConnectionHttpHeaderCreated];

  if (v6)
  {
    unint64_t v7 = [(NETSchemaNETClientEvent *)self sessionConnectionHttpHeaderCreated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(NETSchemaNETClientEvent *)self sessionConnectionSnapshotCaptured];

  if (v8)
  {
    unint64_t v9 = [(NETSchemaNETClientEvent *)self sessionConnectionSnapshotCaptured];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(NETSchemaNETClientEvent *)self debugSessionConnectionSnapshotCaptured];

  if (v10)
  {
    unint64_t v11 = [(NETSchemaNETClientEvent *)self debugSessionConnectionSnapshotCaptured];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(NETSchemaNETClientEvent *)self sessionConnectionFailed];

  if (v12)
  {
    uint64_t v13 = [(NETSchemaNETClientEvent *)self sessionConnectionFailed];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(NETSchemaNETClientEvent *)self peerConnectionFailed];

  if (v14)
  {
    v15 = [(NETSchemaNETClientEvent *)self peerConnectionFailed];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(NETSchemaNETClientEvent *)self networkConnectionStatePreparationSnapshotCaptured];

  if (v16)
  {
    int v17 = [(NETSchemaNETClientEvent *)self networkConnectionStatePreparationSnapshotCaptured];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(NETSchemaNETClientEvent *)self debugNetworkConnectionStatePreparationSnapshotCaptured];

  if (v18)
  {
    v19 = [(NETSchemaNETClientEvent *)self debugNetworkConnectionStatePreparationSnapshotCaptured];
    PBDataWriterWriteSubmessage();
  }
  int v20 = [(NETSchemaNETClientEvent *)self networkConnectionStateReadySnapshotCaptured];

  if (v20)
  {
    v21 = [(NETSchemaNETClientEvent *)self networkConnectionStateReadySnapshotCaptured];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(NETSchemaNETClientEvent *)self debugNetworkConnectionStateReadySnapshotCaptured];

  if (v22)
  {
    uint64_t v23 = [(NETSchemaNETClientEvent *)self debugNetworkConnectionStateReadySnapshotCaptured];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteDebugNetworkConnectionStateReadySnapshotCaptured
{
  if (self->_whichEvent_Type == 109)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured)debugNetworkConnectionStateReadySnapshotCaptured
{
  if (self->_whichEvent_Type == 109) {
    v2 = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDebugNetworkConnectionStateReadySnapshotCaptured:(id)a3
{
  id v4 = (NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured *)a3;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = 0;

  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = 0;

  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = 0;

  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = 0;

  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = 0;

  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = 0;

  unint64_t v13 = 109;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = v4;
}

- (void)deleteNetworkConnectionStateReadySnapshotCaptured
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_networkConnectionStateReadySnapshotCaptured = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NETSchemaNETNetworkConnectionStateReadySnapshotCaptured)networkConnectionStateReadySnapshotCaptured
{
  if (self->_whichEvent_Type == 108) {
    v2 = self->_networkConnectionStateReadySnapshotCaptured;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNetworkConnectionStateReadySnapshotCaptured:(id)a3
{
  id v4 = (NETSchemaNETNetworkConnectionStateReadySnapshotCaptured *)a3;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = 0;

  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = 0;

  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = 0;

  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = 0;

  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = 0;

  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  unint64_t v13 = 108;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = v4;
}

- (void)deleteDebugNetworkConnectionStatePreparationSnapshotCaptured
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured)debugNetworkConnectionStatePreparationSnapshotCaptured
{
  if (self->_whichEvent_Type == 107) {
    v2 = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDebugNetworkConnectionStatePreparationSnapshotCaptured:(id)a3
{
  id v4 = (NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)a3;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = 0;

  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = 0;

  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = 0;

  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = 0;

  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = 0;

  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = 0;

  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  unint64_t v13 = 107;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = v4;
}

- (void)deleteNetworkConnectionStatePreparationSnapshotCaptured
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_networkConnectionStatePreparationSnapshotCaptured = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured)networkConnectionStatePreparationSnapshotCaptured
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_networkConnectionStatePreparationSnapshotCaptured;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNetworkConnectionStatePreparationSnapshotCaptured:(id)a3
{
  id v4 = (NETSchemaNETNetworkConnectionStatePreparationSnapshotCaptured *)a3;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = 0;

  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = 0;

  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = 0;

  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = 0;

  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = 0;

  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = 0;

  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  unint64_t v13 = 106;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = v4;
}

- (void)deletePeerConnectionFailed
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_peerConnectionFailed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NETSchemaNETPeerConnectionFailed)peerConnectionFailed
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_peerConnectionFailed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPeerConnectionFailed:(id)a3
{
  id v4 = (NETSchemaNETPeerConnectionFailed *)a3;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = 0;

  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = 0;

  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = 0;

  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = 0;

  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = 0;

  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  unint64_t v13 = 105;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = v4;
}

- (void)deleteSessionConnectionFailed
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_sessionConnectionFailed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NETSchemaNETSessionConnectionFailed)sessionConnectionFailed
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_sessionConnectionFailed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSessionConnectionFailed:(id)a3
{
  id v4 = (NETSchemaNETSessionConnectionFailed *)a3;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = 0;

  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = 0;

  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = 0;

  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = 0;

  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = 0;

  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  unint64_t v13 = 104;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = v4;
}

- (void)deleteDebugSessionConnectionSnapshotCaptured
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_debugSessionConnectionSnapshotCaptured = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NETSchemaNETDebugSessionConnectionSnapshotCaptured)debugSessionConnectionSnapshotCaptured
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_debugSessionConnectionSnapshotCaptured;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDebugSessionConnectionSnapshotCaptured:(id)a3
{
  id v4 = (NETSchemaNETDebugSessionConnectionSnapshotCaptured *)a3;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = 0;

  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = 0;

  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = 0;

  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = 0;

  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = 0;

  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  unint64_t v13 = 103;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = v4;
}

- (void)deleteSessionConnectionSnapshotCaptured
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_sessionConnectionSnapshotCaptured = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NETSchemaNETSessionConnectionSnapshotCaptured)sessionConnectionSnapshotCaptured
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_sessionConnectionSnapshotCaptured;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSessionConnectionSnapshotCaptured:(id)a3
{
  id v4 = (NETSchemaNETSessionConnectionSnapshotCaptured *)a3;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = 0;

  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = 0;

  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = 0;

  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = 0;

  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = 0;

  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  unint64_t v13 = 102;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = v4;
}

- (void)deleteSessionConnectionHttpHeaderCreated
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_sessionConnectionHttpHeaderCreated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NETSchemaNETSessionConnectionHttpHeaderCreated)sessionConnectionHttpHeaderCreated
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_sessionConnectionHttpHeaderCreated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSessionConnectionHttpHeaderCreated:(id)a3
{
  id v4 = (NETSchemaNETSessionConnectionHttpHeaderCreated *)a3;
  sessionConnectionSnapshotCaptured = self->_sessionConnectionSnapshotCaptured;
  self->_sessionConnectionSnapshotCaptured = 0;

  debugSessionConnectionSnapshotCaptured = self->_debugSessionConnectionSnapshotCaptured;
  self->_debugSessionConnectionSnapshotCaptured = 0;

  sessionConnectionFailed = self->_sessionConnectionFailed;
  self->_sessionConnectionFailed = 0;

  peerConnectionFailed = self->_peerConnectionFailed;
  self->_peerConnectionFailed = 0;

  networkConnectionStatePreparationSnapshotCaptured = self->_networkConnectionStatePreparationSnapshotCaptured;
  self->_networkConnectionStatePreparationSnapshotCaptured = 0;

  debugNetworkConnectionStatePreparationSnapshotCaptured = self->_debugNetworkConnectionStatePreparationSnapshotCaptured;
  self->_debugNetworkConnectionStatePreparationSnapshotCaptured = 0;

  networkConnectionStateReadySnapshotCaptured = self->_networkConnectionStateReadySnapshotCaptured;
  self->_networkConnectionStateReadySnapshotCaptured = 0;

  debugNetworkConnectionStateReadySnapshotCaptured = self->_debugNetworkConnectionStateReadySnapshotCaptured;
  self->_debugNetworkConnectionStateReadySnapshotCaptured = 0;

  unint64_t v13 = 101;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  sessionConnectionHttpHeaderCreated = self->_sessionConnectionHttpHeaderCreated;
  self->_sessionConnectionHttpHeaderCreated = v4;
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
  unint64_t v2 = [(NETSchemaNETClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 8) {
    return @"com.apple.aiml.siri.net.NETClientEvent";
  }
  else {
    return off_1E5EB2848[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 32;
}

@end