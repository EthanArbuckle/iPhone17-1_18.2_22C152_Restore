@interface ASRSchemaASRSampledAudioFileEnqueued
- (ASRSchemaASRSampledAudioFileEnqueued)initWithDictionary:(id)a3;
- (ASRSchemaASRSampledAudioFileEnqueued)initWithJSON:(id)a3;
- (BOOL)hasAudioCodec;
- (BOOL)hasOriginalAsrId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)originalAsrId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)audioCodec;
- (unint64_t)hash;
- (void)deleteAudioCodec;
- (void)deleteOriginalAsrId;
- (void)setAudioCodec:(int)a3;
- (void)setHasAudioCodec:(BOOL)a3;
- (void)setHasOriginalAsrId:(BOOL)a3;
- (void)setOriginalAsrId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRSampledAudioFileEnqueued

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ASRSchemaASRSampledAudioFileEnqueued;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ASRSchemaASRSampledAudioFileEnqueued *)self originalAsrId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ASRSchemaASRSampledAudioFileEnqueued *)self deleteOriginalAsrId];
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
}

- (void)setHasOriginalAsrId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)audioCodec
{
  return self->_audioCodec;
}

- (void)setOriginalAsrId:(id)a3
{
}

- (SISchemaUUID)originalAsrId
{
  return self->_originalAsrId;
}

- (ASRSchemaASRSampledAudioFileEnqueued)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASRSchemaASRSampledAudioFileEnqueued;
  v5 = [(ASRSchemaASRSampledAudioFileEnqueued *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalAsrId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ASRSchemaASRSampledAudioFileEnqueued *)v5 setOriginalAsrId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"audioCodec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRSampledAudioFileEnqueued setAudioCodec:](v5, "setAudioCodec:", [v8 intValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (ASRSchemaASRSampledAudioFileEnqueued)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRSampledAudioFileEnqueued *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRSampledAudioFileEnqueued *)self dictionaryRepresentation];
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
    unsigned int v4 = [(ASRSchemaASRSampledAudioFileEnqueued *)self audioCodec] - 1;
    if (v4 > 0xA) {
      v5 = @"MHASRAUDIOCODEC_UNKNOWN";
    }
    else {
      v5 = off_1E5EAC7D8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"audioCodec"];
  }
  if (self->_originalAsrId)
  {
    v6 = [(ASRSchemaASRSampledAudioFileEnqueued *)self originalAsrId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"originalAsrId"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"originalAsrId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_originalAsrId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_audioCodec;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(ASRSchemaASRSampledAudioFileEnqueued *)self originalAsrId];
  v6 = [v4 originalAsrId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(ASRSchemaASRSampledAudioFileEnqueued *)self originalAsrId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(ASRSchemaASRSampledAudioFileEnqueued *)self originalAsrId];
    objc_super v11 = [v4 originalAsrId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int audioCodec = self->_audioCodec;
    if (audioCodec != [v4 audioCodec]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(ASRSchemaASRSampledAudioFileEnqueued *)self originalAsrId];

  if (v4)
  {
    v5 = [(ASRSchemaASRSampledAudioFileEnqueued *)self originalAsrId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRSampledAudioFileEnqueuedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAudioCodec
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAudioCodec:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioCodec
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAudioCodec:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int audioCodec = a3;
}

- (void)deleteOriginalAsrId
{
}

- (BOOL)hasOriginalAsrId
{
  return self->_originalAsrId != 0;
}

@end