@interface ODSAMPLESiriSchemaODSAMPLEClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
- (BOOL)hasEventMetadata;
- (BOOL)hasSpeakerIdModelDeviceSelected;
- (BOOL)hasSpeakerIdModelSampleManifestReported;
- (BOOL)hasSpeakerIdModelSampleReported;
- (BOOL)hasSpeakerIdSampleToRequestMap;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODSAMPLESiriSchemaODSAMPLEClientEvent)initWithDictionary:(id)a3;
- (ODSAMPLESiriSchemaODSAMPLEClientEvent)initWithJSON:(id)a3;
- (ODSAMPLESiriSchemaODSAMPLEClientEventMetadata)eventMetadata;
- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected)speakerIdModelDeviceSelected;
- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported)speakerIdModelSampleManifestReported;
- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported)speakerIdModelSampleReported;
- (ODSAMPLESiriSchemaODSAMPLESpeakerIdSampleToRequestMap)speakerIdSampleToRequestMap;
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
- (void)deleteSpeakerIdModelDeviceSelected;
- (void)deleteSpeakerIdModelSampleManifestReported;
- (void)deleteSpeakerIdModelSampleReported;
- (void)deleteSpeakerIdSampleToRequestMap;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasSpeakerIdModelDeviceSelected:(BOOL)a3;
- (void)setHasSpeakerIdModelSampleManifestReported:(BOOL)a3;
- (void)setHasSpeakerIdModelSampleReported:(BOOL)a3;
- (void)setHasSpeakerIdSampleToRequestMap:(BOOL)a3;
- (void)setSpeakerIdModelDeviceSelected:(id)a3;
- (void)setSpeakerIdModelSampleManifestReported:(id)a3;
- (void)setSpeakerIdModelSampleReported:(id)a3;
- (void)setSpeakerIdSampleToRequestMap:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODSAMPLESiriSchemaODSAMPLEClientEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ODSAMPLESiriSchemaODSAMPLEClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelDeviceSelected];
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelSampleReported];
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelSampleManifestReported];
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdSampleToRequestMap];
  }
  if ([v4 isConditionSet:4])
  {
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelDeviceSelected];
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelSampleReported];
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelSampleManifestReported];
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdSampleToRequestMap];
  }
  if ([v4 isConditionSet:5])
  {
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelDeviceSelected];
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelSampleReported];
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelSampleManifestReported];
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdSampleToRequestMap];
  }
  if ([v4 isConditionSet:6])
  {
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelDeviceSelected];
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelSampleReported];
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelSampleManifestReported];
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdSampleToRequestMap];
  }
  if ([v4 isConditionSet:7])
  {
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelDeviceSelected];
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelSampleReported];
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelSampleManifestReported];
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdSampleToRequestMap];
  }
  v6 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteEventMetadata];
  }
  v9 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelDeviceSelected];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelDeviceSelected];
  }
  v12 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelSampleReported];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelSampleReported];
  }
  v15 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelSampleManifestReported];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdModelSampleManifestReported];
  }
  v18 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdSampleToRequestMap];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self deleteSpeakerIdSampleToRequestMap];
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
  unint64_t v3 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self whichEvent_Type];
  if (v3 - 10 > 3) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAB508[v3 - 10]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 10 > 3) {
    return 0;
  }
  else {
    return off_1E5EAB528[a3 - 10];
  }
}

- (int)clockIsolationLevel
{
  if ([(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self whichEvent_Type] - 10 >= 4) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakerIdSampleToRequestMap, 0);
  objc_storeStrong((id *)&self->_speakerIdModelSampleManifestReported, 0);
  objc_storeStrong((id *)&self->_speakerIdModelSampleReported, 0);
  objc_storeStrong((id *)&self->_speakerIdModelDeviceSelected, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasSpeakerIdSampleToRequestMap:(BOOL)a3
{
  self->_hasSpeakerIdSampleToRequestMap = a3;
}

- (BOOL)hasSpeakerIdSampleToRequestMap
{
  return self->_hasSpeakerIdSampleToRequestMap;
}

- (void)setHasSpeakerIdModelSampleManifestReported:(BOOL)a3
{
  self->_hasSpeakerIdModelSampleManifestReported = a3;
}

- (BOOL)hasSpeakerIdModelSampleManifestReported
{
  return self->_hasSpeakerIdModelSampleManifestReported;
}

- (void)setHasSpeakerIdModelSampleReported:(BOOL)a3
{
  self->_hasSpeakerIdModelSampleReported = a3;
}

- (BOOL)hasSpeakerIdModelSampleReported
{
  return self->_hasSpeakerIdModelSampleReported;
}

- (void)setHasSpeakerIdModelDeviceSelected:(BOOL)a3
{
  self->_hasSpeakerIdModelDeviceSelected = a3;
}

- (BOOL)hasSpeakerIdModelDeviceSelected
{
  return self->_hasSpeakerIdModelDeviceSelected;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (ODSAMPLESiriSchemaODSAMPLEClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (ODSAMPLESiriSchemaODSAMPLEClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ODSAMPLESiriSchemaODSAMPLEClientEvent;
  v5 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODSAMPLESiriSchemaODSAMPLEClientEventMetadata alloc] initWithDictionary:v6];
      [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"speakerIdModelDeviceSelected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected alloc] initWithDictionary:v8];
      [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)v5 setSpeakerIdModelDeviceSelected:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"speakerIdModelSampleReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported alloc] initWithDictionary:v10];
      [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)v5 setSpeakerIdModelSampleReported:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"speakerIdModelSampleManifestReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported alloc] initWithDictionary:v12];
      [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)v5 setSpeakerIdModelSampleManifestReported:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"speakerIdSampleToRequestMap"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[ODSAMPLESiriSchemaODSAMPLESpeakerIdSampleToRequestMap alloc] initWithDictionary:v14];
      [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)v5 setSpeakerIdSampleToRequestMap:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (ODSAMPLESiriSchemaODSAMPLEClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self dictionaryRepresentation];
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
    id v4 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self eventMetadata];
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
  if (self->_speakerIdModelDeviceSelected)
  {
    uint64_t v7 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelDeviceSelected];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"speakerIdModelDeviceSelected"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"speakerIdModelDeviceSelected"];
    }
  }
  if (self->_speakerIdModelSampleManifestReported)
  {
    v10 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelSampleManifestReported];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"speakerIdModelSampleManifestReported"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"speakerIdModelSampleManifestReported"];
    }
  }
  if (self->_speakerIdModelSampleReported)
  {
    v13 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelSampleReported];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"speakerIdModelSampleReported"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"speakerIdModelSampleReported"];
    }
  }
  if (self->_speakerIdSampleToRequestMap)
  {
    v16 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdSampleToRequestMap];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"speakerIdSampleToRequestMap"];
    }
    else
    {
      objc_super v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"speakerIdSampleToRequestMap"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODSAMPLESiriSchemaODSAMPLEClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected *)self->_speakerIdModelDeviceSelected hash] ^ v3;
  unint64_t v5 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self->_speakerIdModelSampleReported hash];
  unint64_t v6 = v4 ^ v5 ^ [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self->_speakerIdModelSampleManifestReported hash];
  return v6 ^ [(ODSAMPLESiriSchemaODSAMPLESpeakerIdSampleToRequestMap *)self->_speakerIdSampleToRequestMap hash];
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
  unint64_t v6 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v8 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelDeviceSelected];
  uint64_t v7 = [v4 speakerIdModelDeviceSelected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v13 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelDeviceSelected];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelDeviceSelected];
    v16 = [v4 speakerIdModelDeviceSelected];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelSampleReported];
  uint64_t v7 = [v4 speakerIdModelSampleReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v18 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelSampleReported];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelSampleReported];
    v21 = [v4 speakerIdModelSampleReported];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelSampleManifestReported];
  uint64_t v7 = [v4 speakerIdModelSampleManifestReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v23 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelSampleManifestReported];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelSampleManifestReported];
    v26 = [v4 speakerIdModelSampleManifestReported];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdSampleToRequestMap];
  uint64_t v7 = [v4 speakerIdSampleToRequestMap];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v28 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdSampleToRequestMap];
    if (!v28)
    {

LABEL_31:
      BOOL v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    v30 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdSampleToRequestMap];
    v31 = [v4 speakerIdSampleToRequestMap];
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
  id v4 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelDeviceSelected];

  if (v6)
  {
    uint64_t v7 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelDeviceSelected];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelSampleReported];

  if (v8)
  {
    v9 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelSampleReported];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelSampleManifestReported];

  if (v10)
  {
    int v11 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdModelSampleManifestReported];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdSampleToRequestMap];

  if (v12)
  {
    uint64_t v13 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self speakerIdSampleToRequestMap];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODSAMPLESiriSchemaODSAMPLEClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteSpeakerIdSampleToRequestMap
{
  if (self->_whichEvent_Type == 13)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_speakerIdSampleToRequestMap = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODSAMPLESiriSchemaODSAMPLESpeakerIdSampleToRequestMap)speakerIdSampleToRequestMap
{
  if (self->_whichEvent_Type == 13) {
    v2 = self->_speakerIdSampleToRequestMap;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSpeakerIdSampleToRequestMap:(id)a3
{
  id v4 = (ODSAMPLESiriSchemaODSAMPLESpeakerIdSampleToRequestMap *)a3;
  speakerIdModelDeviceSelected = self->_speakerIdModelDeviceSelected;
  self->_speakerIdModelDeviceSelected = 0;

  speakerIdModelSampleReported = self->_speakerIdModelSampleReported;
  self->_speakerIdModelSampleReported = 0;

  speakerIdModelSampleManifestReported = self->_speakerIdModelSampleManifestReported;
  self->_speakerIdModelSampleManifestReported = 0;

  unint64_t v8 = 13;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  speakerIdSampleToRequestMap = self->_speakerIdSampleToRequestMap;
  self->_speakerIdSampleToRequestMap = v4;
}

- (void)deleteSpeakerIdModelSampleManifestReported
{
  if (self->_whichEvent_Type == 12)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_speakerIdModelSampleManifestReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported)speakerIdModelSampleManifestReported
{
  if (self->_whichEvent_Type == 12) {
    v2 = self->_speakerIdModelSampleManifestReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSpeakerIdModelSampleManifestReported:(id)a3
{
  id v4 = (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)a3;
  speakerIdModelDeviceSelected = self->_speakerIdModelDeviceSelected;
  self->_speakerIdModelDeviceSelected = 0;

  speakerIdModelSampleReported = self->_speakerIdModelSampleReported;
  self->_speakerIdModelSampleReported = 0;

  speakerIdSampleToRequestMap = self->_speakerIdSampleToRequestMap;
  self->_speakerIdSampleToRequestMap = 0;

  unint64_t v8 = 12;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  speakerIdModelSampleManifestReported = self->_speakerIdModelSampleManifestReported;
  self->_speakerIdModelSampleManifestReported = v4;
}

- (void)deleteSpeakerIdModelSampleReported
{
  if (self->_whichEvent_Type == 11)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_speakerIdModelSampleReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported)speakerIdModelSampleReported
{
  if (self->_whichEvent_Type == 11) {
    v2 = self->_speakerIdModelSampleReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSpeakerIdModelSampleReported:(id)a3
{
  id v4 = (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)a3;
  speakerIdModelDeviceSelected = self->_speakerIdModelDeviceSelected;
  self->_speakerIdModelDeviceSelected = 0;

  speakerIdModelSampleManifestReported = self->_speakerIdModelSampleManifestReported;
  self->_speakerIdModelSampleManifestReported = 0;

  speakerIdSampleToRequestMap = self->_speakerIdSampleToRequestMap;
  self->_speakerIdSampleToRequestMap = 0;

  unint64_t v8 = 11;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  speakerIdModelSampleReported = self->_speakerIdModelSampleReported;
  self->_speakerIdModelSampleReported = v4;
}

- (void)deleteSpeakerIdModelDeviceSelected
{
  if (self->_whichEvent_Type == 10)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_speakerIdModelDeviceSelected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected)speakerIdModelDeviceSelected
{
  if (self->_whichEvent_Type == 10) {
    v2 = self->_speakerIdModelDeviceSelected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSpeakerIdModelDeviceSelected:(id)a3
{
  id v4 = (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected *)a3;
  speakerIdModelSampleReported = self->_speakerIdModelSampleReported;
  self->_speakerIdModelSampleReported = 0;

  speakerIdModelSampleManifestReported = self->_speakerIdModelSampleManifestReported;
  self->_speakerIdModelSampleManifestReported = 0;

  speakerIdSampleToRequestMap = self->_speakerIdSampleToRequestMap;
  self->_speakerIdSampleToRequestMap = 0;

  unint64_t v8 = 10;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  speakerIdModelDeviceSelected = self->_speakerIdModelDeviceSelected;
  self->_speakerIdModelDeviceSelected = v4;
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
  unint64_t v2 = [(ODSAMPLESiriSchemaODSAMPLEClientEvent *)self whichEvent_Type];
  if (v2 - 10 > 3) {
    return @"com.apple.aiml.siri.odsample.ODSAMPLEClientEvent";
  }
  else {
    return off_1E5EC0F80[v2 - 10];
  }
}

- (int)getAnyEventType
{
  return 103;
}

@end