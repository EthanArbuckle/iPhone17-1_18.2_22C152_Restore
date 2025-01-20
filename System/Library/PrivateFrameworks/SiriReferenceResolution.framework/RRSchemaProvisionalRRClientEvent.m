@interface RRSchemaProvisionalRRClientEvent
- (BOOL)hasEntityPoolResolveContext;
- (BOOL)hasEntityPoolReturned;
- (BOOL)hasEventMetadata;
- (BOOL)hasPullerContext;
- (BOOL)hasRrUsoGraphTier1;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProvisional;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RRSchemaProvisionalPullerContext)pullerContext;
- (RRSchemaProvisionalRRClientEvent)initWithDictionary:(id)a3;
- (RRSchemaProvisionalRRClientEvent)initWithJSON:(id)a3;
- (RRSchemaProvisionalRRClientEventMetadata)eventMetadata;
- (RRSchemaProvisionalRREntityPoolResolveContext)entityPoolResolveContext;
- (RRSchemaProvisionalRREntityPoolReturned)entityPoolReturned;
- (RRSchemaProvisionalRRUsoGraphTier1)rrUsoGraphTier1;
- (id)dictionaryRepresentation;
- (id)getTypeId;
- (id)getVersion;
- (id)qualifiedMessageName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
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

@implementation RRSchemaProvisionalRRClientEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rrUsoGraphTier1, 0);
  objc_storeStrong((id *)&self->_entityPoolResolveContext, 0);
  objc_storeStrong((id *)&self->_entityPoolReturned, 0);
  objc_storeStrong((id *)&self->_pullerContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
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

- (void)setHasPullerContext:(BOOL)a3
{
  self->_hasPullerContext = a3;
}

- (BOOL)hasPullerContext
{
  return self->_hasPullerContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (RRSchemaProvisionalRRClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (RRSchemaProvisionalRRClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RRSchemaProvisionalRRClientEvent;
  v5 = [(RRSchemaProvisionalRRClientEvent *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[RRSchemaProvisionalRRClientEventMetadata alloc] initWithDictionary:v6];
      [(RRSchemaProvisionalRRClientEvent *)v5 setEventMetadata:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"pullerContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[RRSchemaProvisionalPullerContext alloc] initWithDictionary:v8];
      [(RRSchemaProvisionalRRClientEvent *)v5 setPullerContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"entityPoolReturned"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[RRSchemaProvisionalRREntityPoolReturned alloc] initWithDictionary:v10];
      [(RRSchemaProvisionalRRClientEvent *)v5 setEntityPoolReturned:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"entityPoolResolveContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[RRSchemaProvisionalRREntityPoolResolveContext alloc] initWithDictionary:v12];
      [(RRSchemaProvisionalRRClientEvent *)v5 setEntityPoolResolveContext:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"rrUsoGraphTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[RRSchemaProvisionalRRUsoGraphTier1 alloc] initWithDictionary:v14];
      [(RRSchemaProvisionalRRClientEvent *)v5 setRrUsoGraphTier1:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (RRSchemaProvisionalRRClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RRSchemaProvisionalRRClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaProvisionalRRClientEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_entityPoolResolveContext)
  {
    id v4 = [(RRSchemaProvisionalRRClientEvent *)self entityPoolResolveContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"entityPoolResolveContext"];
    }
    else
    {
      v6 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v6 forKeyedSubscript:@"entityPoolResolveContext"];
    }
  }
  if (self->_entityPoolReturned)
  {
    uint64_t v7 = [(RRSchemaProvisionalRRClientEvent *)self entityPoolReturned];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"entityPoolReturned"];
    }
    else
    {
      v9 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v9 forKeyedSubscript:@"entityPoolReturned"];
    }
  }
  if (self->_eventMetadata)
  {
    v10 = [(RRSchemaProvisionalRRClientEvent *)self eventMetadata];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v12 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v12 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_pullerContext)
  {
    v13 = [(RRSchemaProvisionalRRClientEvent *)self pullerContext];
    v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"pullerContext"];
    }
    else
    {
      v15 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v15 forKeyedSubscript:@"pullerContext"];
    }
  }
  if (self->_rrUsoGraphTier1)
  {
    v16 = [(RRSchemaProvisionalRRClientEvent *)self rrUsoGraphTier1];
    v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"rrUsoGraphTier1"];
    }
    else
    {
      objc_super v18 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v18 forKeyedSubscript:@"rrUsoGraphTier1"];
    }
  }
  [(RRSchemaProvisionalRRClientEvent *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(RRSchemaProvisionalRRClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(RRSchemaProvisionalPullerContext *)self->_pullerContext hash] ^ v3;
  unint64_t v5 = [(RRSchemaProvisionalRREntityPoolReturned *)self->_entityPoolReturned hash];
  unint64_t v6 = v4 ^ v5 ^ [(RRSchemaProvisionalRREntityPoolResolveContext *)self->_entityPoolResolveContext hash];
  return v6 ^ [(RRSchemaProvisionalRRUsoGraphTier1 *)self->_rrUsoGraphTier1 hash];
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
  unint64_t v6 = [(RRSchemaProvisionalRRClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v8 = [(RRSchemaProvisionalRRClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(RRSchemaProvisionalRRClientEvent *)self eventMetadata];
    v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RRSchemaProvisionalRRClientEvent *)self pullerContext];
  uint64_t v7 = [v4 pullerContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v13 = [(RRSchemaProvisionalRRClientEvent *)self pullerContext];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(RRSchemaProvisionalRRClientEvent *)self pullerContext];
    v16 = [v4 pullerContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RRSchemaProvisionalRRClientEvent *)self entityPoolReturned];
  uint64_t v7 = [v4 entityPoolReturned];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v18 = [(RRSchemaProvisionalRRClientEvent *)self entityPoolReturned];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(RRSchemaProvisionalRRClientEvent *)self entityPoolReturned];
    v21 = [v4 entityPoolReturned];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RRSchemaProvisionalRRClientEvent *)self entityPoolResolveContext];
  uint64_t v7 = [v4 entityPoolResolveContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v23 = [(RRSchemaProvisionalRRClientEvent *)self entityPoolResolveContext];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(RRSchemaProvisionalRRClientEvent *)self entityPoolResolveContext];
    v26 = [v4 entityPoolResolveContext];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(RRSchemaProvisionalRRClientEvent *)self rrUsoGraphTier1];
  uint64_t v7 = [v4 rrUsoGraphTier1];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v28 = [(RRSchemaProvisionalRRClientEvent *)self rrUsoGraphTier1];
    if (!v28)
    {

LABEL_31:
      BOOL v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    v30 = [(RRSchemaProvisionalRRClientEvent *)self rrUsoGraphTier1];
    v31 = [v4 rrUsoGraphTier1];
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
  id v4 = [(RRSchemaProvisionalRRClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(RRSchemaProvisionalRRClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(RRSchemaProvisionalRRClientEvent *)self pullerContext];

  if (v6)
  {
    uint64_t v7 = [(RRSchemaProvisionalRRClientEvent *)self pullerContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(RRSchemaProvisionalRRClientEvent *)self entityPoolReturned];

  if (v8)
  {
    v9 = [(RRSchemaProvisionalRRClientEvent *)self entityPoolReturned];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(RRSchemaProvisionalRRClientEvent *)self entityPoolResolveContext];

  if (v10)
  {
    v11 = [(RRSchemaProvisionalRRClientEvent *)self entityPoolResolveContext];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(RRSchemaProvisionalRRClientEvent *)self rrUsoGraphTier1];

  if (v12)
  {
    uint64_t v13 = [(RRSchemaProvisionalRRClientEvent *)self rrUsoGraphTier1];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaProvisionalRRClientEventReadFrom(self, (uint64_t)a3);
}

- (RRSchemaProvisionalRRUsoGraphTier1)rrUsoGraphTier1
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_rrUsoGraphTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRrUsoGraphTier1:(id)a3
{
  id v4 = (RRSchemaProvisionalRRUsoGraphTier1 *)a3;
  pullerContext = self->_pullerContext;
  self->_pullerContext = 0;

  entityPoolReturned = self->_entityPoolReturned;
  self->_entityPoolReturned = 0;

  entityPoolResolveContext = self->_entityPoolResolveContext;
  self->_entityPoolResolveContext = 0;

  unint64_t v8 = 104;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  rrUsoGraphTier1 = self->_rrUsoGraphTier1;
  self->_rrUsoGraphTier1 = v4;
}

- (RRSchemaProvisionalRREntityPoolResolveContext)entityPoolResolveContext
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_entityPoolResolveContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEntityPoolResolveContext:(id)a3
{
  id v4 = (RRSchemaProvisionalRREntityPoolResolveContext *)a3;
  pullerContext = self->_pullerContext;
  self->_pullerContext = 0;

  entityPoolReturned = self->_entityPoolReturned;
  self->_entityPoolReturned = 0;

  rrUsoGraphTier1 = self->_rrUsoGraphTier1;
  self->_rrUsoGraphTier1 = 0;

  unint64_t v8 = 103;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  entityPoolResolveContext = self->_entityPoolResolveContext;
  self->_entityPoolResolveContext = v4;
}

- (RRSchemaProvisionalRREntityPoolReturned)entityPoolReturned
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_entityPoolReturned;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEntityPoolReturned:(id)a3
{
  id v4 = (RRSchemaProvisionalRREntityPoolReturned *)a3;
  pullerContext = self->_pullerContext;
  self->_pullerContext = 0;

  entityPoolResolveContext = self->_entityPoolResolveContext;
  self->_entityPoolResolveContext = 0;

  rrUsoGraphTier1 = self->_rrUsoGraphTier1;
  self->_rrUsoGraphTier1 = 0;

  unint64_t v8 = 102;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  entityPoolReturned = self->_entityPoolReturned;
  self->_entityPoolReturned = v4;
}

- (RRSchemaProvisionalPullerContext)pullerContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_pullerContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPullerContext:(id)a3
{
  id v4 = (RRSchemaProvisionalPullerContext *)a3;
  entityPoolReturned = self->_entityPoolReturned;
  self->_entityPoolReturned = 0;

  entityPoolResolveContext = self->_entityPoolResolveContext;
  self->_entityPoolResolveContext = 0;

  rrUsoGraphTier1 = self->_rrUsoGraphTier1;
  self->_rrUsoGraphTier1 = 0;

  unint64_t v8 = 101;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  pullerContext = self->_pullerContext;
  self->_pullerContext = v4;
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(RRSchemaProvisionalRRClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 3) {
    return @"com.apple.aiml.siri.rr.provisional.ProvisionalRRClientEvent";
  }
  else {
    return off_264463638[v2 - 101];
  }
}

- (id)getVersion
{
  return &unk_26CE3F2B0;
}

- (id)getTypeId
{
  return @"com.apple.aiml.siri.rr.provisional.RRClientEvent";
}

- (BOOL)isProvisional
{
  return 1;
}

- (int)getAnyEventType
{
  return 7;
}

@end