@interface SetupSchemaProvisionalSiriSetupEvent
- (BOOL)hasEventMetadata;
- (BOOL)hasSiriSetupContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProvisional;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SetupSchemaProvisionalSiriSetupContext)siriSetupContext;
- (SetupSchemaProvisionalSiriSetupEvent)initWithDictionary:(id)a3;
- (SetupSchemaProvisionalSiriSetupEvent)initWithJSON:(id)a3;
- (SetupSchemaProvisionalSiriSetupEventMetadata)eventMetadata;
- (id)dictionaryRepresentation;
- (id)getTypeId;
- (id)getVersion;
- (id)qualifiedMessageName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteEventMetadata;
- (void)deleteSiriSetupContext;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasSiriSetupContext:(BOOL)a3;
- (void)setSiriSetupContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SetupSchemaProvisionalSiriSetupEvent

- (int)getAnyEventType
{
  return 7;
}

- (BOOL)isProvisional
{
  return 1;
}

- (id)getTypeId
{
  return @"com.apple.aiml.siri.setup.SiriSetupEvent";
}

- (id)getVersion
{
  return &unk_26E8F2940;
}

- (id)qualifiedMessageName
{
  if ([(SetupSchemaProvisionalSiriSetupEvent *)self whichEvent_Type] == 100) {
    return @"com.apple.aiml.siri.setup.ProvisionalSiriSetupEvent.ProvisionalSiriSetupContext";
  }
  else {
    return @"com.apple.aiml.siri.setup.ProvisionalSiriSetupEvent";
  }
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
}

- (void)setSiriSetupContext:(id)a3
{
  unint64_t v3 = 100;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_whichEvent_Type = v3;
  objc_storeStrong((id *)&self->_siriSetupContext, a3);
}

- (SetupSchemaProvisionalSiriSetupContext)siriSetupContext
{
  if (self->_whichEvent_Type == 100) {
    v2 = self->_siriSetupContext;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)deleteSiriSetupContext
{
  if (self->_whichEvent_Type == 100)
  {
    self->_whichEvent_Type = 0;
    self->_siriSetupContext = 0;
    MEMORY[0x270F9A758]();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SetupSchemaProvisionalSiriSetupEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  v4 = [(SetupSchemaProvisionalSiriSetupEvent *)self eventMetadata];

  if (v4)
  {
    v5 = [(SetupSchemaProvisionalSiriSetupEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SetupSchemaProvisionalSiriSetupEvent *)self siriSetupContext];

  if (v6)
  {
    v7 = [(SetupSchemaProvisionalSiriSetupEvent *)self siriSetupContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_13;
  }
  v6 = [(SetupSchemaProvisionalSiriSetupEvent *)self eventMetadata];
  v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(SetupSchemaProvisionalSiriSetupEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SetupSchemaProvisionalSiriSetupEvent *)self eventMetadata];
    v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(SetupSchemaProvisionalSiriSetupEvent *)self siriSetupContext];
  v7 = [v4 siriSetupContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(SetupSchemaProvisionalSiriSetupEvent *)self siriSetupContext];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(SetupSchemaProvisionalSiriSetupEvent *)self siriSetupContext];
    v16 = [v4 siriSetupContext];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_12:
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SetupSchemaProvisionalSiriSetupEventMetadata *)self->_eventMetadata hash];
  return [(SetupSchemaProvisionalSiriSetupContext *)self->_siriSetupContext hash] ^ v3;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_eventMetadata)
  {
    id v4 = [(SetupSchemaProvisionalSiriSetupEvent *)self eventMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v6 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v6 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_siriSetupContext)
  {
    v7 = [(SetupSchemaProvisionalSiriSetupEvent *)self siriSetupContext];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"siriSetupContext"];
    }
    else
    {
      v9 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v9 forKeyedSubscript:@"siriSetupContext"];
    }
  }
  [(SetupSchemaProvisionalSiriSetupEvent *)self willProduceDictionaryRepresentation:v3];

  return v3;
}

- (NSData)jsonData
{
  v2 = [(SetupSchemaProvisionalSiriSetupEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (SetupSchemaProvisionalSiriSetupEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SetupSchemaProvisionalSiriSetupEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (SetupSchemaProvisionalSiriSetupEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SetupSchemaProvisionalSiriSetupEvent;
  v5 = [(SetupSchemaProvisionalSiriSetupEvent *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [[SetupSchemaProvisionalSiriSetupEventMetadata alloc] initWithDictionary:v6];
      [(SetupSchemaProvisionalSiriSetupEvent *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"siriSetupContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SetupSchemaProvisionalSiriSetupContext alloc] initWithDictionary:v8];
      [(SetupSchemaProvisionalSiriSetupEvent *)v5 setSiriSetupContext:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SetupSchemaProvisionalSiriSetupEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasSiriSetupContext
{
  return self->_hasSiriSetupContext;
}

- (void)setHasSiriSetupContext:(BOOL)a3
{
  self->_hasSiriSetupContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriSetupContext, 0);

  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

@end