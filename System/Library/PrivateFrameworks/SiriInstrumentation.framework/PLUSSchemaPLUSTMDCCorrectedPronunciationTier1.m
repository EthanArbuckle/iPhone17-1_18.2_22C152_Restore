@interface PLUSSchemaPLUSTMDCCorrectedPronunciationTier1
- (BOOL)hasFirstNamePhonemes;
- (BOOL)hasLastNamePhonemes;
- (BOOL)hasNicknamePhonemes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)firstNamePhonemes;
- (NSString)lastNamePhonemes;
- (NSString)nicknamePhonemes;
- (PLUSSchemaPLUSTMDCCorrectedPronunciationTier1)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSTMDCCorrectedPronunciationTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteFirstNamePhonemes;
- (void)deleteLastNamePhonemes;
- (void)deleteNicknamePhonemes;
- (void)setFirstNamePhonemes:(id)a3;
- (void)setHasFirstNamePhonemes:(BOOL)a3;
- (void)setHasLastNamePhonemes:(BOOL)a3;
- (void)setHasNicknamePhonemes:(BOOL)a3;
- (void)setLastNamePhonemes:(id)a3;
- (void)setNicknamePhonemes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSTMDCCorrectedPronunciationTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PLUSSchemaPLUSTMDCCorrectedPronunciationTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self deleteFirstNamePhonemes];
    [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self deleteLastNamePhonemes];
    [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self deleteNicknamePhonemes];
  }
  if ([v4 isConditionSet:4])
  {
    [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self deleteFirstNamePhonemes];
    [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self deleteLastNamePhonemes];
    [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self deleteNicknamePhonemes];
  }
  if ([v4 isConditionSet:5])
  {
    [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self deleteFirstNamePhonemes];
    [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self deleteLastNamePhonemes];
    [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self deleteNicknamePhonemes];
  }
  if ([v4 isConditionSet:6])
  {
    [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self deleteFirstNamePhonemes];
    [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self deleteLastNamePhonemes];
    [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self deleteNicknamePhonemes];
  }
  if ([v4 isConditionSet:7])
  {
    [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self deleteFirstNamePhonemes];
    [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self deleteLastNamePhonemes];
    [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self deleteNicknamePhonemes];
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
  objc_storeStrong((id *)&self->_nicknamePhonemes, 0);
  objc_storeStrong((id *)&self->_lastNamePhonemes, 0);
  objc_storeStrong((id *)&self->_firstNamePhonemes, 0);
}

- (void)setHasNicknamePhonemes:(BOOL)a3
{
  self->_hasNicknamePhonemes = a3;
}

- (void)setHasLastNamePhonemes:(BOOL)a3
{
  self->_hasLastNamePhonemes = a3;
}

- (void)setHasFirstNamePhonemes:(BOOL)a3
{
  self->_hasFirstNamePhonemes = a3;
}

- (void)setNicknamePhonemes:(id)a3
{
}

- (NSString)nicknamePhonemes
{
  return self->_nicknamePhonemes;
}

- (void)setLastNamePhonemes:(id)a3
{
}

- (NSString)lastNamePhonemes
{
  return self->_lastNamePhonemes;
}

- (void)setFirstNamePhonemes:(id)a3
{
}

- (NSString)firstNamePhonemes
{
  return self->_firstNamePhonemes;
}

- (PLUSSchemaPLUSTMDCCorrectedPronunciationTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLUSSchemaPLUSTMDCCorrectedPronunciationTier1;
  v5 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"firstNamePhonemes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = (void *)[v6 copy];
      [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)v5 setFirstNamePhonemes:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"lastNamePhonemes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)v5 setLastNamePhonemes:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"nicknamePhonemes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)v5 setNicknamePhonemes:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSTMDCCorrectedPronunciationTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self dictionaryRepresentation];
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
  if (self->_firstNamePhonemes)
  {
    id v4 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self firstNamePhonemes];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"firstNamePhonemes"];
  }
  if (self->_lastNamePhonemes)
  {
    v6 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self lastNamePhonemes];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"lastNamePhonemes"];
  }
  if (self->_nicknamePhonemes)
  {
    v8 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self nicknamePhonemes];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"nicknamePhonemes"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_firstNamePhonemes hash];
  NSUInteger v4 = [(NSString *)self->_lastNamePhonemes hash] ^ v3;
  return v4 ^ [(NSString *)self->_nicknamePhonemes hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self firstNamePhonemes];
  v6 = [v4 firstNamePhonemes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self firstNamePhonemes];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self firstNamePhonemes];
    v10 = [v4 firstNamePhonemes];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self lastNamePhonemes];
  v6 = [v4 lastNamePhonemes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self lastNamePhonemes];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self lastNamePhonemes];
    v15 = [v4 lastNamePhonemes];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self nicknamePhonemes];
  v6 = [v4 nicknamePhonemes];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self nicknamePhonemes];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self nicknamePhonemes];
    v20 = [v4 nicknamePhonemes];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self firstNamePhonemes];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self lastNamePhonemes];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(PLUSSchemaPLUSTMDCCorrectedPronunciationTier1 *)self nicknamePhonemes];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSTMDCCorrectedPronunciationTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteNicknamePhonemes
{
}

- (BOOL)hasNicknamePhonemes
{
  return self->_nicknamePhonemes != 0;
}

- (void)deleteLastNamePhonemes
{
}

- (BOOL)hasLastNamePhonemes
{
  return self->_lastNamePhonemes != 0;
}

- (void)deleteFirstNamePhonemes
{
}

- (BOOL)hasFirstNamePhonemes
{
  return self->_firstNamePhonemes != 0;
}

@end