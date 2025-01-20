@interface ODDSiriSchemaODDtvOSDevicePropertiesReported
- (BOOL)hasAssistant;
- (BOOL)hasDictation;
- (BOOL)hasGeneral;
- (BOOL)hasTvOSAssistant;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDAssistantProperties)assistant;
- (ODDSiriSchemaODDDictationProperties)dictation;
- (ODDSiriSchemaODDGeneralProperties)general;
- (ODDSiriSchemaODDtvOSAssistantProperties)tvOSAssistant;
- (ODDSiriSchemaODDtvOSDevicePropertiesReported)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDtvOSDevicePropertiesReported)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAssistant;
- (void)deleteDictation;
- (void)deleteGeneral;
- (void)deleteTvOSAssistant;
- (void)setAssistant:(id)a3;
- (void)setDictation:(id)a3;
- (void)setGeneral:(id)a3;
- (void)setHasAssistant:(BOOL)a3;
- (void)setHasDictation:(BOOL)a3;
- (void)setHasGeneral:(BOOL)a3;
- (void)setHasTvOSAssistant:(BOOL)a3;
- (void)setTvOSAssistant:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDtvOSDevicePropertiesReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ODDSiriSchemaODDtvOSDevicePropertiesReported;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self general];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self deleteGeneral];
  }
  v9 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self assistant];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self deleteAssistant];
  }
  v12 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self dictation];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self deleteDictation];
  }
  v15 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self tvOSAssistant];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self deleteTvOSAssistant];
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
  objc_storeStrong((id *)&self->_tvOSAssistant, 0);
  objc_storeStrong((id *)&self->_dictation, 0);
  objc_storeStrong((id *)&self->_assistant, 0);
  objc_storeStrong((id *)&self->_general, 0);
}

- (void)setHasTvOSAssistant:(BOOL)a3
{
  self->_hasTvOSAssistant = a3;
}

- (void)setHasDictation:(BOOL)a3
{
  self->_hasDictation = a3;
}

- (void)setHasAssistant:(BOOL)a3
{
  self->_hasAssistant = a3;
}

- (void)setHasGeneral:(BOOL)a3
{
  self->_hasGeneral = a3;
}

- (void)setTvOSAssistant:(id)a3
{
}

- (ODDSiriSchemaODDtvOSAssistantProperties)tvOSAssistant
{
  return self->_tvOSAssistant;
}

- (void)setDictation:(id)a3
{
}

- (ODDSiriSchemaODDDictationProperties)dictation
{
  return self->_dictation;
}

- (void)setAssistant:(id)a3
{
}

- (ODDSiriSchemaODDAssistantProperties)assistant
{
  return self->_assistant;
}

- (void)setGeneral:(id)a3
{
}

- (ODDSiriSchemaODDGeneralProperties)general
{
  return self->_general;
}

- (ODDSiriSchemaODDtvOSDevicePropertiesReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ODDSiriSchemaODDtvOSDevicePropertiesReported;
  v5 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"general"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDGeneralProperties alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)v5 setGeneral:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"assistant"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ODDSiriSchemaODDAssistantProperties alloc] initWithDictionary:v8];
      [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)v5 setAssistant:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"dictation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[ODDSiriSchemaODDDictationProperties alloc] initWithDictionary:v10];
      [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)v5 setDictation:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"tvOSAssistant"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[ODDSiriSchemaODDtvOSAssistantProperties alloc] initWithDictionary:v12];
      [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)v5 setTvOSAssistant:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDtvOSDevicePropertiesReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self dictionaryRepresentation];
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
  if (self->_assistant)
  {
    id v4 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self assistant];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"assistant"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"assistant"];
    }
  }
  if (self->_dictation)
  {
    uint64_t v7 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self dictation];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"dictation"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"dictation"];
    }
  }
  if (self->_general)
  {
    v10 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self general];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"general"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"general"];
    }
  }
  if (self->_tvOSAssistant)
  {
    v13 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self tvOSAssistant];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"tvOSAssistant"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"tvOSAssistant"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDGeneralProperties *)self->_general hash];
  unint64_t v4 = [(ODDSiriSchemaODDAssistantProperties *)self->_assistant hash] ^ v3;
  unint64_t v5 = [(ODDSiriSchemaODDDictationProperties *)self->_dictation hash];
  return v4 ^ v5 ^ [(ODDSiriSchemaODDtvOSAssistantProperties *)self->_tvOSAssistant hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self general];
  v6 = [v4 general];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self general];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self general];
    v10 = [v4 general];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self assistant];
  v6 = [v4 assistant];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self assistant];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self assistant];
    v15 = [v4 assistant];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self dictation];
  v6 = [v4 dictation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self dictation];
  if (v17)
  {
    v18 = (void *)v17;
    objc_super v19 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self dictation];
    v20 = [v4 dictation];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self tvOSAssistant];
  v6 = [v4 tvOSAssistant];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self tvOSAssistant];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self tvOSAssistant];
    v25 = [v4 tvOSAssistant];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self general];

  if (v4)
  {
    unint64_t v5 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self general];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self assistant];

  if (v6)
  {
    uint64_t v7 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self assistant];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self dictation];

  if (v8)
  {
    v9 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self dictation];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self tvOSAssistant];

  if (v10)
  {
    int v11 = [(ODDSiriSchemaODDtvOSDevicePropertiesReported *)self tvOSAssistant];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDtvOSDevicePropertiesReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteTvOSAssistant
{
}

- (BOOL)hasTvOSAssistant
{
  return self->_tvOSAssistant != 0;
}

- (void)deleteDictation
{
}

- (BOOL)hasDictation
{
  return self->_dictation != 0;
}

- (void)deleteAssistant
{
}

- (BOOL)hasAssistant
{
  return self->_assistant != 0;
}

- (void)deleteGeneral
{
}

- (BOOL)hasGeneral
{
  return self->_general != 0;
}

@end