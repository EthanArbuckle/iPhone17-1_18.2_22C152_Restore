@interface CloudKitSchemaCKClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasCloudKitChangeReported;
- (BOOL)hasCloudKitErrorReported;
- (BOOL)hasEventMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CloudKitSchemaCKChangeReported)cloudKitChangeReported;
- (CloudKitSchemaCKClientEvent)initWithDictionary:(id)a3;
- (CloudKitSchemaCKClientEvent)initWithJSON:(id)a3;
- (CloudKitSchemaCKErrorReported)cloudKitErrorReported;
- (CloudKitSchemaCloudKitEventMetadata)eventMetadata;
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
- (void)deleteCloudKitChangeReported;
- (void)deleteCloudKitErrorReported;
- (void)deleteEventMetadata;
- (void)setCloudKitChangeReported:(id)a3;
- (void)setCloudKitErrorReported:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasCloudKitChangeReported:(BOOL)a3;
- (void)setHasCloudKitErrorReported:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CloudKitSchemaCKClientEvent

- (int)componentName
{
  v2 = [(CloudKitSchemaCKClientEvent *)self eventMetadata];
  v3 = [v2 ckId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 63;
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
  v2 = [(CloudKitSchemaCKClientEvent *)self eventMetadata];
  v3 = [v2 ckId];

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
  v16.super_class = (Class)CloudKitSchemaCKClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(CloudKitSchemaCKClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CloudKitSchemaCKClientEvent *)self deleteEventMetadata];
  }
  v9 = [(CloudKitSchemaCKClientEvent *)self cloudKitErrorReported];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CloudKitSchemaCKClientEvent *)self deleteCloudKitErrorReported];
  }
  v12 = [(CloudKitSchemaCKClientEvent *)self cloudKitChangeReported];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CloudKitSchemaCKClientEvent *)self deleteCloudKitChangeReported];
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
  unint64_t v3 = [(CloudKitSchemaCKClientEvent *)self whichEvent_Type];
  if (v3 == 100)
  {
    id v4 = &OBJC_IVAR___CloudKitSchemaCKClientEvent__cloudKitErrorReported;
    goto LABEL_5;
  }
  if (v3 == 101)
  {
    id v4 = &OBJC_IVAR___CloudKitSchemaCKClientEvent__cloudKitChangeReported;
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
  unint64_t v3 = @"cloudKitChangeReported";
  if (a3 != 101) {
    unint64_t v3 = 0;
  }
  if (a3 == 100) {
    return @"cloudKitErrorReported";
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitChangeReported, 0);
  objc_storeStrong((id *)&self->_cloudKitErrorReported, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasCloudKitChangeReported:(BOOL)a3
{
  self->_hasCloudKitChangeReported = a3;
}

- (BOOL)hasCloudKitChangeReported
{
  return self->_hasCloudKitChangeReported;
}

- (void)setHasCloudKitErrorReported:(BOOL)a3
{
  self->_hasCloudKitErrorReported = a3;
}

- (BOOL)hasCloudKitErrorReported
{
  return self->_hasCloudKitErrorReported;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (CloudKitSchemaCloudKitEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (CloudKitSchemaCKClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CloudKitSchemaCKClientEvent;
  id v5 = [(CloudKitSchemaCKClientEvent *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[CloudKitSchemaCloudKitEventMetadata alloc] initWithDictionary:v6];
      [(CloudKitSchemaCKClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"cloudKitErrorReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[CloudKitSchemaCKErrorReported alloc] initWithDictionary:v8];
      [(CloudKitSchemaCKClientEvent *)v5 setCloudKitErrorReported:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"cloudKitChangeReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[CloudKitSchemaCKChangeReported alloc] initWithDictionary:v10];
      [(CloudKitSchemaCKClientEvent *)v5 setCloudKitChangeReported:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (CloudKitSchemaCKClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(CloudKitSchemaCKClientEvent *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CloudKitSchemaCKClientEvent *)self dictionaryRepresentation];
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
  if (self->_cloudKitChangeReported)
  {
    id v4 = [(CloudKitSchemaCKClientEvent *)self cloudKitChangeReported];
    id v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"cloudKitChangeReported"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"cloudKitChangeReported"];
    }
  }
  if (self->_cloudKitErrorReported)
  {
    uint64_t v7 = [(CloudKitSchemaCKClientEvent *)self cloudKitErrorReported];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"cloudKitErrorReported"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"cloudKitErrorReported"];
    }
  }
  if (self->_eventMetadata)
  {
    v10 = [(CloudKitSchemaCKClientEvent *)self eventMetadata];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"eventMetadata"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CloudKitSchemaCloudKitEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(CloudKitSchemaCKErrorReported *)self->_cloudKitErrorReported hash] ^ v3;
  return v4 ^ [(CloudKitSchemaCKChangeReported *)self->_cloudKitChangeReported hash];
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
  uint64_t v6 = [(CloudKitSchemaCKClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(CloudKitSchemaCKClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(CloudKitSchemaCKClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(CloudKitSchemaCKClientEvent *)self cloudKitErrorReported];
  uint64_t v7 = [v4 cloudKitErrorReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(CloudKitSchemaCKClientEvent *)self cloudKitErrorReported];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(CloudKitSchemaCKClientEvent *)self cloudKitErrorReported];
    objc_super v16 = [v4 cloudKitErrorReported];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(CloudKitSchemaCKClientEvent *)self cloudKitChangeReported];
  uint64_t v7 = [v4 cloudKitChangeReported];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(CloudKitSchemaCKClientEvent *)self cloudKitChangeReported];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(CloudKitSchemaCKClientEvent *)self cloudKitChangeReported];
    v21 = [v4 cloudKitChangeReported];
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
  id v4 = [(CloudKitSchemaCKClientEvent *)self eventMetadata];

  if (v4)
  {
    id v5 = [(CloudKitSchemaCKClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(CloudKitSchemaCKClientEvent *)self cloudKitErrorReported];

  if (v6)
  {
    uint64_t v7 = [(CloudKitSchemaCKClientEvent *)self cloudKitErrorReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(CloudKitSchemaCKClientEvent *)self cloudKitChangeReported];

  if (v8)
  {
    v9 = [(CloudKitSchemaCKClientEvent *)self cloudKitChangeReported];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CloudKitSchemaCKClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteCloudKitChangeReported
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_cloudKitChangeReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CloudKitSchemaCKChangeReported)cloudKitChangeReported
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_cloudKitChangeReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCloudKitChangeReported:(id)a3
{
  id v4 = (CloudKitSchemaCKChangeReported *)a3;
  cloudKitErrorReported = self->_cloudKitErrorReported;
  self->_cloudKitErrorReported = 0;

  unint64_t v6 = 101;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  cloudKitChangeReported = self->_cloudKitChangeReported;
  self->_cloudKitChangeReported = v4;
}

- (void)deleteCloudKitErrorReported
{
  if (self->_whichEvent_Type == 100)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_cloudKitErrorReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CloudKitSchemaCKErrorReported)cloudKitErrorReported
{
  if (self->_whichEvent_Type == 100) {
    v2 = self->_cloudKitErrorReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCloudKitErrorReported:(id)a3
{
  id v4 = (CloudKitSchemaCKErrorReported *)a3;
  cloudKitChangeReported = self->_cloudKitChangeReported;
  self->_cloudKitChangeReported = 0;

  unint64_t v6 = 100;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  cloudKitErrorReported = self->_cloudKitErrorReported;
  self->_cloudKitErrorReported = v4;
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
  unint64_t v2 = [(CloudKitSchemaCKClientEvent *)self whichEvent_Type];
  unint64_t v3 = @"com.apple.aiml.siri.cloudkit.CKClientEvent";
  if (v2 == 101) {
    unint64_t v3 = @"com.apple.aiml.siri.cloudkit.CKClientEvent.CKChangeReported";
  }
  if (v2 == 100) {
    return @"com.apple.aiml.siri.cloudkit.CKClientEvent.CKErrorReported";
  }
  else {
    return v3;
  }
}

- (int)getAnyEventType
{
  return 109;
}

@end