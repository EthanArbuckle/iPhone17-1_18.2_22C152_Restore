@interface HomeKitSchemaHKClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasAudioTopologyReported;
- (BOOL)hasEventMetadata;
- (BOOL)hasHomeKitAccessoryOperationReported;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HomeKitSchemaHKAccessoryOperationReported)homeKitAccessoryOperationReported;
- (HomeKitSchemaHKAudioTopologyReported)audioTopologyReported;
- (HomeKitSchemaHKClientEvent)initWithDictionary:(id)a3;
- (HomeKitSchemaHKClientEvent)initWithJSON:(id)a3;
- (HomeKitSchemaHomeKitEventMetadata)eventMetadata;
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
- (void)deleteAudioTopologyReported;
- (void)deleteEventMetadata;
- (void)deleteHomeKitAccessoryOperationReported;
- (void)setAudioTopologyReported:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasAudioTopologyReported:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasHomeKitAccessoryOperationReported:(BOOL)a3;
- (void)setHomeKitAccessoryOperationReported:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HomeKitSchemaHKClientEvent

- (int)componentName
{
  v2 = [(HomeKitSchemaHKClientEvent *)self eventMetadata];
  v3 = [v2 hkId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 39;
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
  v2 = [(HomeKitSchemaHKClientEvent *)self eventMetadata];
  v3 = [v2 hkId];

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
  v16.receiver = self;
  v16.super_class = (Class)HomeKitSchemaHKClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(HomeKitSchemaHKClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(HomeKitSchemaHKClientEvent *)self deleteEventMetadata];
  }
  v9 = [(HomeKitSchemaHKClientEvent *)self homeKitAccessoryOperationReported];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(HomeKitSchemaHKClientEvent *)self deleteHomeKitAccessoryOperationReported];
  }
  v12 = [(HomeKitSchemaHKClientEvent *)self audioTopologyReported];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(HomeKitSchemaHKClientEvent *)self deleteAudioTopologyReported];
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
  unint64_t v3 = [(HomeKitSchemaHKClientEvent *)self whichEvent_Type];
  if (v3 == 100)
  {
    id v4 = &OBJC_IVAR___HomeKitSchemaHKClientEvent__homeKitAccessoryOperationReported;
    goto LABEL_5;
  }
  if (v3 == 101)
  {
    id v4 = &OBJC_IVAR___HomeKitSchemaHKClientEvent__audioTopologyReported;
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
  unint64_t v3 = @"audioTopologyReported";
  if (a3 != 101) {
    unint64_t v3 = 0;
  }
  if (a3 == 100) {
    return @"homeKitAccessoryOperationReported";
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioTopologyReported, 0);
  objc_storeStrong((id *)&self->_homeKitAccessoryOperationReported, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasAudioTopologyReported:(BOOL)a3
{
  self->_hasAudioTopologyReported = a3;
}

- (BOOL)hasAudioTopologyReported
{
  return self->_hasAudioTopologyReported;
}

- (void)setHasHomeKitAccessoryOperationReported:(BOOL)a3
{
  self->_hasHomeKitAccessoryOperationReported = a3;
}

- (BOOL)hasHomeKitAccessoryOperationReported
{
  return self->_hasHomeKitAccessoryOperationReported;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (HomeKitSchemaHomeKitEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (HomeKitSchemaHKClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HomeKitSchemaHKClientEvent;
  id v5 = [(HomeKitSchemaHKClientEvent *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[HomeKitSchemaHomeKitEventMetadata alloc] initWithDictionary:v6];
      [(HomeKitSchemaHKClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"homeKitAccessoryOperationReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[HomeKitSchemaHKAccessoryOperationReported alloc] initWithDictionary:v8];
      [(HomeKitSchemaHKClientEvent *)v5 setHomeKitAccessoryOperationReported:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"audioTopologyReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[HomeKitSchemaHKAudioTopologyReported alloc] initWithDictionary:v10];
      [(HomeKitSchemaHKClientEvent *)v5 setAudioTopologyReported:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (HomeKitSchemaHKClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(HomeKitSchemaHKClientEvent *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(HomeKitSchemaHKClientEvent *)self dictionaryRepresentation];
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
  if (self->_audioTopologyReported)
  {
    id v4 = [(HomeKitSchemaHKClientEvent *)self audioTopologyReported];
    id v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"audioTopologyReported"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"audioTopologyReported"];
    }
  }
  if (self->_eventMetadata)
  {
    uint64_t v7 = [(HomeKitSchemaHKClientEvent *)self eventMetadata];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_homeKitAccessoryOperationReported)
  {
    v10 = [(HomeKitSchemaHKClientEvent *)self homeKitAccessoryOperationReported];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"homeKitAccessoryOperationReported"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"homeKitAccessoryOperationReported"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HomeKitSchemaHomeKitEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(HomeKitSchemaHKAccessoryOperationReported *)self->_homeKitAccessoryOperationReported hash] ^ v3;
  return v4 ^ [(HomeKitSchemaHKAudioTopologyReported *)self->_audioTopologyReported hash];
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
  uint64_t v6 = [(HomeKitSchemaHKClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(HomeKitSchemaHKClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(HomeKitSchemaHKClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(HomeKitSchemaHKClientEvent *)self homeKitAccessoryOperationReported];
  uint64_t v7 = [v4 homeKitAccessoryOperationReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(HomeKitSchemaHKClientEvent *)self homeKitAccessoryOperationReported];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(HomeKitSchemaHKClientEvent *)self homeKitAccessoryOperationReported];
    objc_super v16 = [v4 homeKitAccessoryOperationReported];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(HomeKitSchemaHKClientEvent *)self audioTopologyReported];
  uint64_t v7 = [v4 audioTopologyReported];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(HomeKitSchemaHKClientEvent *)self audioTopologyReported];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(HomeKitSchemaHKClientEvent *)self audioTopologyReported];
    v21 = [v4 audioTopologyReported];
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
  id v4 = [(HomeKitSchemaHKClientEvent *)self eventMetadata];

  if (v4)
  {
    id v5 = [(HomeKitSchemaHKClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(HomeKitSchemaHKClientEvent *)self homeKitAccessoryOperationReported];

  if (v6)
  {
    uint64_t v7 = [(HomeKitSchemaHKClientEvent *)self homeKitAccessoryOperationReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(HomeKitSchemaHKClientEvent *)self audioTopologyReported];

  if (v8)
  {
    v9 = [(HomeKitSchemaHKClientEvent *)self audioTopologyReported];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HomeKitSchemaHKClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteAudioTopologyReported
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_audioTopologyReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (HomeKitSchemaHKAudioTopologyReported)audioTopologyReported
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_audioTopologyReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAudioTopologyReported:(id)a3
{
  id v4 = (HomeKitSchemaHKAudioTopologyReported *)a3;
  homeKitAccessoryOperationReported = self->_homeKitAccessoryOperationReported;
  self->_homeKitAccessoryOperationReported = 0;

  unint64_t v6 = 101;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  audioTopologyReported = self->_audioTopologyReported;
  self->_audioTopologyReported = v4;
}

- (void)deleteHomeKitAccessoryOperationReported
{
  if (self->_whichEvent_Type == 100)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_homeKitAccessoryOperationReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (HomeKitSchemaHKAccessoryOperationReported)homeKitAccessoryOperationReported
{
  if (self->_whichEvent_Type == 100) {
    v2 = self->_homeKitAccessoryOperationReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setHomeKitAccessoryOperationReported:(id)a3
{
  id v4 = (HomeKitSchemaHKAccessoryOperationReported *)a3;
  audioTopologyReported = self->_audioTopologyReported;
  self->_audioTopologyReported = 0;

  unint64_t v6 = 100;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  homeKitAccessoryOperationReported = self->_homeKitAccessoryOperationReported;
  self->_homeKitAccessoryOperationReported = v4;
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
  unint64_t v2 = [(HomeKitSchemaHKClientEvent *)self whichEvent_Type];
  unint64_t v3 = @"com.apple.aiml.siri.homekit.HKClientEvent";
  if (v2 == 101) {
    unint64_t v3 = @"com.apple.aiml.siri.homekit.HKClientEvent.HKAudioTopologyReported";
  }
  if (v2 == 100) {
    return @"com.apple.aiml.siri.homekit.HKClientEvent.HKAccessoryOperationReported";
  }
  else {
    return v3;
  }
}

- (int)getAnyEventType
{
  return 74;
}

@end