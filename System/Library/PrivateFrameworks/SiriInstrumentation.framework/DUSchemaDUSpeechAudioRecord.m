@interface DUSchemaDUSpeechAudioRecord
- (BOOL)hasAudioCreatedTimestampMs;
- (BOOL)hasCodec;
- (BOOL)hasInteractionId;
- (BOOL)hasLanguage;
- (BOOL)hasSpeechId;
- (BOOL)hasSpeechIdString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DUSchemaDUSpeechAudioRecord)initWithDictionary:(id)a3;
- (DUSchemaDUSpeechAudioRecord)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)codec;
- (NSString)language;
- (NSString)speechIdString;
- (SISchemaUUID)interactionId;
- (SISchemaUUID)speechId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)audioCreatedTimestampMs;
- (unint64_t)hash;
- (void)deleteAudioCreatedTimestampMs;
- (void)deleteCodec;
- (void)deleteInteractionId;
- (void)deleteLanguage;
- (void)deleteSpeechId;
- (void)deleteSpeechIdString;
- (void)setAudioCreatedTimestampMs:(unint64_t)a3;
- (void)setCodec:(id)a3;
- (void)setHasAudioCreatedTimestampMs:(BOOL)a3;
- (void)setHasCodec:(BOOL)a3;
- (void)setHasInteractionId:(BOOL)a3;
- (void)setHasLanguage:(BOOL)a3;
- (void)setHasSpeechId:(BOOL)a3;
- (void)setHasSpeechIdString:(BOOL)a3;
- (void)setInteractionId:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setSpeechId:(id)a3;
- (void)setSpeechIdString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DUSchemaDUSpeechAudioRecord

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DUSchemaDUSpeechAudioRecord;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(DUSchemaDUSpeechAudioRecord *)self deleteInteractionId];
    [(DUSchemaDUSpeechAudioRecord *)self deleteSpeechId];
    [(DUSchemaDUSpeechAudioRecord *)self deleteSpeechIdString];
  }
  if ([v4 isConditionSet:4])
  {
    [(DUSchemaDUSpeechAudioRecord *)self deleteInteractionId];
    [(DUSchemaDUSpeechAudioRecord *)self deleteSpeechId];
    [(DUSchemaDUSpeechAudioRecord *)self deleteSpeechIdString];
  }
  if ([v4 isConditionSet:5])
  {
    [(DUSchemaDUSpeechAudioRecord *)self deleteInteractionId];
    [(DUSchemaDUSpeechAudioRecord *)self deleteSpeechId];
    [(DUSchemaDUSpeechAudioRecord *)self deleteSpeechIdString];
  }
  if ([v4 isConditionSet:6])
  {
    [(DUSchemaDUSpeechAudioRecord *)self deleteInteractionId];
    [(DUSchemaDUSpeechAudioRecord *)self deleteSpeechId];
    [(DUSchemaDUSpeechAudioRecord *)self deleteSpeechIdString];
  }
  if ([v4 isConditionSet:7])
  {
    [(DUSchemaDUSpeechAudioRecord *)self deleteInteractionId];
    [(DUSchemaDUSpeechAudioRecord *)self deleteSpeechId];
    [(DUSchemaDUSpeechAudioRecord *)self deleteSpeechIdString];
  }
  if ([v4 isConditionSet:8])
  {
    [(DUSchemaDUSpeechAudioRecord *)self deleteSpeechId];
    [(DUSchemaDUSpeechAudioRecord *)self deleteSpeechIdString];
  }
  v6 = [(DUSchemaDUSpeechAudioRecord *)self interactionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(DUSchemaDUSpeechAudioRecord *)self deleteInteractionId];
  }
  v9 = [(DUSchemaDUSpeechAudioRecord *)self speechId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(DUSchemaDUSpeechAudioRecord *)self deleteSpeechId];
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
  objc_storeStrong((id *)&self->_speechIdString, 0);
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

- (void)setHasSpeechIdString:(BOOL)a3
{
  self->_hasCodec = a3;
}

- (void)setHasSpeechId:(BOOL)a3
{
  self->_hasLanguage = a3;
}

- (void)setHasInteractionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasCodec:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasLanguage:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unint64_t)audioCreatedTimestampMs
{
  return self->_audioCreatedTimestampMs;
}

- (void)setSpeechIdString:(id)a3
{
}

- (NSString)speechIdString
{
  return self->_speechIdString;
}

- (void)setSpeechId:(id)a3
{
}

- (SISchemaUUID)speechId
{
  return self->_speechId;
}

- (void)setInteractionId:(id)a3
{
}

- (SISchemaUUID)interactionId
{
  return self->_interactionId;
}

- (void)setCodec:(id)a3
{
}

- (NSString)codec
{
  return self->_codec;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (DUSchemaDUSpeechAudioRecord)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DUSchemaDUSpeechAudioRecord;
  v5 = [(DUSchemaDUSpeechAudioRecord *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"language"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(DUSchemaDUSpeechAudioRecord *)v5 setLanguage:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"codec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(DUSchemaDUSpeechAudioRecord *)v5 setCodec:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"interactionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(DUSchemaDUSpeechAudioRecord *)v5 setInteractionId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"speechId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(DUSchemaDUSpeechAudioRecord *)v5 setSpeechId:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"speechIdString"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(DUSchemaDUSpeechAudioRecord *)v5 setSpeechIdString:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"audioCreatedTimestampMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DUSchemaDUSpeechAudioRecord setAudioCreatedTimestampMs:](v5, "setAudioCreatedTimestampMs:", [v16 unsignedLongLongValue]);
    }
    v17 = v5;
  }
  return v5;
}

- (DUSchemaDUSpeechAudioRecord)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DUSchemaDUSpeechAudioRecord *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DUSchemaDUSpeechAudioRecord *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DUSchemaDUSpeechAudioRecord audioCreatedTimestampMs](self, "audioCreatedTimestampMs"));
    [v3 setObject:v4 forKeyedSubscript:@"audioCreatedTimestampMs"];
  }
  if (self->_codec)
  {
    v5 = [(DUSchemaDUSpeechAudioRecord *)self codec];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"codec"];
  }
  if (self->_interactionId)
  {
    uint64_t v7 = [(DUSchemaDUSpeechAudioRecord *)self interactionId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"interactionId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"interactionId"];
    }
  }
  if (self->_language)
  {
    v10 = [(DUSchemaDUSpeechAudioRecord *)self language];
    int v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"language"];
  }
  if (self->_speechId)
  {
    v12 = [(DUSchemaDUSpeechAudioRecord *)self speechId];
    objc_super v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"speechId"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"speechId"];
    }
  }
  if (self->_speechIdString)
  {
    v15 = [(DUSchemaDUSpeechAudioRecord *)self speechIdString];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"speechIdString"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_language hash];
  NSUInteger v4 = [(NSString *)self->_codec hash];
  unint64_t v5 = [(SISchemaUUID *)self->_interactionId hash];
  unint64_t v6 = [(SISchemaUUID *)self->_speechId hash];
  NSUInteger v7 = [(NSString *)self->_speechIdString hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v8 = 2654435761u * self->_audioCreatedTimestampMs;
  }
  else {
    unint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  unint64_t v5 = [(DUSchemaDUSpeechAudioRecord *)self language];
  unint64_t v6 = [v4 language];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(DUSchemaDUSpeechAudioRecord *)self language];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    v9 = [(DUSchemaDUSpeechAudioRecord *)self language];
    v10 = [v4 language];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(DUSchemaDUSpeechAudioRecord *)self codec];
  unint64_t v6 = [v4 codec];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(DUSchemaDUSpeechAudioRecord *)self codec];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(DUSchemaDUSpeechAudioRecord *)self codec];
    v15 = [v4 codec];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(DUSchemaDUSpeechAudioRecord *)self interactionId];
  unint64_t v6 = [v4 interactionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(DUSchemaDUSpeechAudioRecord *)self interactionId];
  if (v17)
  {
    v18 = (void *)v17;
    objc_super v19 = [(DUSchemaDUSpeechAudioRecord *)self interactionId];
    v20 = [v4 interactionId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(DUSchemaDUSpeechAudioRecord *)self speechId];
  unint64_t v6 = [v4 speechId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(DUSchemaDUSpeechAudioRecord *)self speechId];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(DUSchemaDUSpeechAudioRecord *)self speechId];
    v25 = [v4 speechId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(DUSchemaDUSpeechAudioRecord *)self speechIdString];
  unint64_t v6 = [v4 speechIdString];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_26:

    goto LABEL_27;
  }
  uint64_t v27 = [(DUSchemaDUSpeechAudioRecord *)self speechIdString];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(DUSchemaDUSpeechAudioRecord *)self speechIdString];
    v30 = [v4 speechIdString];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[56] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (unint64_t audioCreatedTimestampMs = self->_audioCreatedTimestampMs,
          audioCreatedTimestampMs == [v4 audioCreatedTimestampMs]))
    {
      BOOL v32 = 1;
      goto LABEL_28;
    }
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  NSUInteger v4 = [(DUSchemaDUSpeechAudioRecord *)self language];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  unint64_t v5 = [(DUSchemaDUSpeechAudioRecord *)self codec];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  unint64_t v6 = [(DUSchemaDUSpeechAudioRecord *)self interactionId];

  if (v6)
  {
    uint64_t v7 = [(DUSchemaDUSpeechAudioRecord *)self interactionId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v8 = [(DUSchemaDUSpeechAudioRecord *)self speechId];

  if (v8)
  {
    v9 = [(DUSchemaDUSpeechAudioRecord *)self speechId];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(DUSchemaDUSpeechAudioRecord *)self speechIdString];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  int v11 = v12;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    int v11 = v12;
  }
}

- (BOOL)readFrom:(id)a3
{
  return DUSchemaDUSpeechAudioRecordReadFrom(self, (uint64_t)a3);
}

- (void)deleteAudioCreatedTimestampMs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAudioCreatedTimestampMs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioCreatedTimestampMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAudioCreatedTimestampMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t audioCreatedTimestampMs = a3;
}

- (void)deleteSpeechIdString
{
}

- (BOOL)hasSpeechIdString
{
  return self->_speechIdString != 0;
}

- (void)deleteSpeechId
{
}

- (BOOL)hasSpeechId
{
  return self->_speechId != 0;
}

- (void)deleteInteractionId
{
}

- (BOOL)hasInteractionId
{
  return self->_interactionId != 0;
}

- (void)deleteCodec
{
}

- (BOOL)hasCodec
{
  return self->_codec != 0;
}

- (void)deleteLanguage
{
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

@end