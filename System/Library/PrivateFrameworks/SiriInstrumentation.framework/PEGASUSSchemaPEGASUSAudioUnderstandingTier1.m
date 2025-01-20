@interface PEGASUSSchemaPEGASUSAudioUnderstandingTier1
- (BOOL)hasAudioAppName;
- (BOOL)hasAudioArtist;
- (BOOL)hasAudioEntity;
- (BOOL)hasAudioEntityOriginalValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)audioAppName;
- (NSString)audioArtist;
- (NSString)audioEntity;
- (NSString)audioEntityOriginalValue;
- (PEGASUSSchemaPEGASUSAudioUnderstandingTier1)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSAudioUnderstandingTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAudioAppName;
- (void)deleteAudioArtist;
- (void)deleteAudioEntity;
- (void)deleteAudioEntityOriginalValue;
- (void)setAudioAppName:(id)a3;
- (void)setAudioArtist:(id)a3;
- (void)setAudioEntity:(id)a3;
- (void)setAudioEntityOriginalValue:(id)a3;
- (void)setHasAudioAppName:(BOOL)a3;
- (void)setHasAudioArtist:(BOOL)a3;
- (void)setHasAudioEntity:(BOOL)a3;
- (void)setHasAudioEntityOriginalValue:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSAudioUnderstandingTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PEGASUSSchemaPEGASUSAudioUnderstandingTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioArtist];
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioAppName];
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioEntity];
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioEntityOriginalValue];
  }
  if ([v4 isConditionSet:4])
  {
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioArtist];
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioAppName];
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioEntity];
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioEntityOriginalValue];
  }
  if ([v4 isConditionSet:5])
  {
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioArtist];
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioAppName];
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioEntity];
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioEntityOriginalValue];
  }
  if ([v4 isConditionSet:6])
  {
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioArtist];
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioAppName];
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioEntity];
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioEntityOriginalValue];
  }
  if ([v4 isConditionSet:7])
  {
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioArtist];
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioAppName];
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioEntity];
    [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self deleteAudioEntityOriginalValue];
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
  objc_storeStrong((id *)&self->_audioEntityOriginalValue, 0);
  objc_storeStrong((id *)&self->_audioEntity, 0);
  objc_storeStrong((id *)&self->_audioAppName, 0);
  objc_storeStrong((id *)&self->_audioArtist, 0);
}

- (void)setHasAudioEntityOriginalValue:(BOOL)a3
{
  self->_hasAudioEntityOriginalValue = a3;
}

- (void)setHasAudioEntity:(BOOL)a3
{
  self->_hasAudioEntity = a3;
}

- (void)setHasAudioAppName:(BOOL)a3
{
  self->_hasAudioAppName = a3;
}

- (void)setHasAudioArtist:(BOOL)a3
{
  self->_hasAudioArtist = a3;
}

- (void)setAudioEntityOriginalValue:(id)a3
{
}

- (NSString)audioEntityOriginalValue
{
  return self->_audioEntityOriginalValue;
}

- (void)setAudioEntity:(id)a3
{
}

- (NSString)audioEntity
{
  return self->_audioEntity;
}

- (void)setAudioAppName:(id)a3
{
}

- (NSString)audioAppName
{
  return self->_audioAppName;
}

- (void)setAudioArtist:(id)a3
{
}

- (NSString)audioArtist
{
  return self->_audioArtist;
}

- (PEGASUSSchemaPEGASUSAudioUnderstandingTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PEGASUSSchemaPEGASUSAudioUnderstandingTier1;
  v5 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"audioArtist"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = (void *)[v6 copy];
      [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)v5 setAudioArtist:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"audioAppName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)v5 setAudioAppName:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"audioEntity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)v5 setAudioEntity:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"audioEntityOriginalValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)v5 setAudioEntityOriginalValue:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSAudioUnderstandingTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self dictionaryRepresentation];
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
  if (self->_audioAppName)
  {
    id v4 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioAppName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"audioAppName"];
  }
  if (self->_audioArtist)
  {
    v6 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioArtist];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"audioArtist"];
  }
  if (self->_audioEntity)
  {
    v8 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioEntity];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"audioEntity"];
  }
  if (self->_audioEntityOriginalValue)
  {
    v10 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioEntityOriginalValue];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"audioEntityOriginalValue"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_audioArtist hash];
  NSUInteger v4 = [(NSString *)self->_audioAppName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_audioEntity hash];
  return v4 ^ v5 ^ [(NSString *)self->_audioEntityOriginalValue hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioArtist];
  v6 = [v4 audioArtist];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioArtist];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioArtist];
    v10 = [v4 audioArtist];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioAppName];
  v6 = [v4 audioAppName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioAppName];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioAppName];
    v15 = [v4 audioAppName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioEntity];
  v6 = [v4 audioEntity];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioEntity];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioEntity];
    v20 = [v4 audioEntity];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioEntityOriginalValue];
  v6 = [v4 audioEntityOriginalValue];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioEntityOriginalValue];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioEntityOriginalValue];
    v25 = [v4 audioEntityOriginalValue];
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
  id v9 = a3;
  id v4 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioArtist];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioAppName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioEntity];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *)self audioEntityOriginalValue];

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSAudioUnderstandingTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteAudioEntityOriginalValue
{
}

- (BOOL)hasAudioEntityOriginalValue
{
  return self->_audioEntityOriginalValue != 0;
}

- (void)deleteAudioEntity
{
}

- (BOOL)hasAudioEntity
{
  return self->_audioEntity != 0;
}

- (void)deleteAudioAppName
{
}

- (BOOL)hasAudioAppName
{
  return self->_audioAppName != 0;
}

- (void)deleteAudioArtist
{
}

- (BOOL)hasAudioArtist
{
  return self->_audioArtist != 0;
}

@end