@interface PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1
- (BOOL)hasPhonemes;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)phonemes;
- (PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)source;
- (unint64_t)hash;
- (void)deletePhonemes;
- (void)deleteSource;
- (void)setHasPhonemes:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setPhonemes:(id)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *)self deletePhonemes];
  }
  if ([v4 isConditionSet:4]) {
    [(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *)self deletePhonemes];
  }
  if ([v4 isConditionSet:5]) {
    [(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *)self deletePhonemes];
  }
  if ([v4 isConditionSet:6]) {
    [(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *)self deletePhonemes];
  }
  if ([v4 isConditionSet:7]) {
    [(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *)self deletePhonemes];
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

- (void)setHasPhonemes:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)source
{
  return self->_source;
}

- (void)setPhonemes:(id)a3
{
}

- (NSString)phonemes
{
  return self->_phonemes;
}

- (PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1;
  v5 = [(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"phonemes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = (void *)[v6 copy];
      [(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *)v5 setPhonemes:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 setSource:](v5, "setSource:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *)self dictionaryRepresentation];
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
  if (self->_phonemes)
  {
    id v4 = [(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *)self phonemes];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"phonemes"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int v6 = [(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *)self source];
    uint64_t v7 = @"PLUSTMDCSIRICURRENTPRONUNCIATIONSOURCE_UNKNOWN";
    if (v6 == 1) {
      uint64_t v7 = @"PLUSTMDCSIRICURRENTPRONUNCIATIONSOURCE_TTS";
    }
    if (v6 == 2) {
      v8 = @"PLUSTMDCSIRICURRENTPRONUNCIATIONSOURCE_TMDC";
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
  NSUInteger v3 = [(NSString *)self->_phonemes hash];
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
  v5 = [(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *)self phonemes];
  int v6 = [v4 phonemes];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *)self phonemes];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *)self phonemes];
    objc_super v11 = [v4 phonemes];
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
  uint64_t v4 = [(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1 *)self phonemes];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1ReadFrom(self, (uint64_t)a3);
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

- (void)deletePhonemes
{
}

- (BOOL)hasPhonemes
{
  return self->_phonemes != 0;
}

@end