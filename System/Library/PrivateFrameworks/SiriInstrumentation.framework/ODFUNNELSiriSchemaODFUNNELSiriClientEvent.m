@interface ODFUNNELSiriSchemaODFUNNELSiriClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
- (BOOL)hasEventMetadata;
- (BOOL)hasVoiceTriggerEnrollmentFunnelReported;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODFUNNELSiriSchemaODFUNNELClientEventMetadata)eventMetadata;
- (ODFUNNELSiriSchemaODFUNNELSiriClientEvent)initWithDictionary:(id)a3;
- (ODFUNNELSiriSchemaODFUNNELSiriClientEvent)initWithJSON:(id)a3;
- (ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentFunnel)voiceTriggerEnrollmentFunnelReported;
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
- (void)deleteVoiceTriggerEnrollmentFunnelReported;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasVoiceTriggerEnrollmentFunnelReported:(BOOL)a3;
- (void)setVoiceTriggerEnrollmentFunnelReported:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODFUNNELSiriSchemaODFUNNELSiriClientEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ODFUNNELSiriSchemaODFUNNELSiriClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self deleteEventMetadata];
  }
  v9 = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self voiceTriggerEnrollmentFunnelReported];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self deleteVoiceTriggerEnrollmentFunnelReported];
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
  if ([(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self whichEvent_Type] == 10) {
    v3 = self->_voiceTriggerEnrollmentFunnelReported;
  }
  else {
    v3 = 0;
  }
  return (SISchemaInstrumentationMessage *)v3;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 == 10) {
    return @"voiceTriggerEnrollmentFunnelReported";
  }
  else {
    return 0;
  }
}

- (int)clockIsolationLevel
{
  if ([(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self whichEvent_Type] == 10) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceTriggerEnrollmentFunnelReported, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasVoiceTriggerEnrollmentFunnelReported:(BOOL)a3
{
  self->_hasVoiceTriggerEnrollmentFunnelReported = a3;
}

- (BOOL)hasVoiceTriggerEnrollmentFunnelReported
{
  return self->_hasVoiceTriggerEnrollmentFunnelReported;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (ODFUNNELSiriSchemaODFUNNELClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (ODFUNNELSiriSchemaODFUNNELSiriClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODFUNNELSiriSchemaODFUNNELSiriClientEvent;
  v5 = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODFUNNELSiriSchemaODFUNNELClientEventMetadata alloc] initWithDictionary:v6];
      [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"voiceTriggerEnrollmentFunnelReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentFunnel alloc] initWithDictionary:v8];
      [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)v5 setVoiceTriggerEnrollmentFunnelReported:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (ODFUNNELSiriSchemaODFUNNELSiriClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self dictionaryRepresentation];
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
  if (self->_eventMetadata)
  {
    id v4 = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self eventMetadata];
    v5 = [v4 dictionaryRepresentation];
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
  if (self->_voiceTriggerEnrollmentFunnelReported)
  {
    uint64_t v7 = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self voiceTriggerEnrollmentFunnelReported];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"voiceTriggerEnrollmentFunnelReported"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"voiceTriggerEnrollmentFunnelReported"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODFUNNELSiriSchemaODFUNNELClientEventMetadata *)self->_eventMetadata hash];
  return [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentFunnel *)self->_voiceTriggerEnrollmentFunnelReported hash] ^ v3;
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
  v6 = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self voiceTriggerEnrollmentFunnelReported];
  uint64_t v7 = [v4 voiceTriggerEnrollmentFunnelReported];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self voiceTriggerEnrollmentFunnelReported];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self voiceTriggerEnrollmentFunnelReported];
    v16 = [v4 voiceTriggerEnrollmentFunnelReported];
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

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self eventMetadata];

  if (v4)
  {
    v5 = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self voiceTriggerEnrollmentFunnelReported];

  if (v6)
  {
    uint64_t v7 = [(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self voiceTriggerEnrollmentFunnelReported];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODFUNNELSiriSchemaODFUNNELSiriClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteVoiceTriggerEnrollmentFunnelReported
{
  if (self->_whichEvent_Type == 10)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_voiceTriggerEnrollmentFunnelReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentFunnel)voiceTriggerEnrollmentFunnelReported
{
  if (self->_whichEvent_Type == 10) {
    v2 = self->_voiceTriggerEnrollmentFunnelReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setVoiceTriggerEnrollmentFunnelReported:(id)a3
{
  unint64_t v3 = 10;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichEvent_Type = v3;
  objc_storeStrong((id *)&self->_voiceTriggerEnrollmentFunnelReported, a3);
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
  if ([(ODFUNNELSiriSchemaODFUNNELSiriClientEvent *)self whichEvent_Type] == 10) {
    return @"com.apple.aiml.siri.odfunnel.ODFUNNELSiriClientEvent.ODFUNNELVoiceTriggerEnrollmentFunnel";
  }
  else {
    return @"com.apple.aiml.siri.odfunnel.ODFUNNELSiriClientEvent";
  }
}

- (int)getAnyEventType
{
  return 107;
}

@end