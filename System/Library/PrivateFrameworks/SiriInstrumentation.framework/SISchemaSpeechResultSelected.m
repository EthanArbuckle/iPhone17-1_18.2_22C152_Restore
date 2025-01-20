@interface SISchemaSpeechResultSelected
- (BOOL)hasResultCandidateId;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)resultCandidateId;
- (SISchemaSpeechResultSelected)initWithDictionary:(id)a3;
- (SISchemaSpeechResultSelected)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)source;
- (unint64_t)hash;
- (void)deleteResultCandidateId;
- (void)deleteSource;
- (void)setHasResultCandidateId:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setResultCandidateId:(id)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaSpeechResultSelected

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)source
{
  return self->_source;
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (SISchemaSpeechResultSelected)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaSpeechResultSelected;
  v5 = [(SISchemaSpeechResultSelected *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"resultCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaSpeechResultSelected *)v5 setResultCandidateId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaSpeechResultSelected setSource:](v5, "setSource:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (SISchemaSpeechResultSelected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaSpeechResultSelected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaSpeechResultSelected *)self dictionaryRepresentation];
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
  if (self->_resultCandidateId)
  {
    id v4 = [(SISchemaSpeechResultSelected *)self resultCandidateId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"resultCandidateId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int v6 = [(SISchemaSpeechResultSelected *)self source];
    uint64_t v7 = @"UNKNOWN";
    if (v6 == 2) {
      uint64_t v7 = @"FINAL_SPEECH_RECOGNITION";
    }
    if (v6 == 1) {
      v8 = @"RESULT_SELECTED";
    }
    else {
      v8 = v7;
    }
    [v3 setObject:v8 forKeyedSubscript:@"source"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_resultCandidateId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_source;
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
  v5 = [(SISchemaSpeechResultSelected *)self resultCandidateId];
  int v6 = [v4 resultCandidateId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(SISchemaSpeechResultSelected *)self resultCandidateId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SISchemaSpeechResultSelected *)self resultCandidateId];
    objc_super v11 = [v4 resultCandidateId];
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
    int source = self->_source;
    if (source != [v4 source]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(SISchemaSpeechResultSelected *)self resultCandidateId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaSpeechResultSelectedReadFrom(self, (uint64_t)a3);
}

- (void)deleteSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSource:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int source = a3;
}

- (void)deleteResultCandidateId
{
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

@end