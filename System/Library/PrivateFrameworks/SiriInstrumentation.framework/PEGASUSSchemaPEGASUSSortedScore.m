@interface PEGASUSSchemaPEGASUSSortedScore
- (BOOL)hasSortedScoreBoosted;
- (BOOL)hasSortedScoreFinal;
- (BOOL)hasSortedScoreKnockOut;
- (BOOL)hasSortedScoreModelFinal;
- (BOOL)hasSortedScoreStage2;
- (BOOL)hasSortedScorelinearCombiner;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)sortedScoreBoosted;
- (NSString)sortedScoreFinal;
- (NSString)sortedScoreKnockOut;
- (NSString)sortedScoreModelFinal;
- (NSString)sortedScoreStage2;
- (NSString)sortedScorelinearCombiner;
- (PEGASUSSchemaPEGASUSSortedScore)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSSortedScore)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteSortedScoreBoosted;
- (void)deleteSortedScoreFinal;
- (void)deleteSortedScoreKnockOut;
- (void)deleteSortedScoreModelFinal;
- (void)deleteSortedScoreStage2;
- (void)deleteSortedScorelinearCombiner;
- (void)setHasSortedScoreBoosted:(BOOL)a3;
- (void)setHasSortedScoreFinal:(BOOL)a3;
- (void)setHasSortedScoreKnockOut:(BOOL)a3;
- (void)setHasSortedScoreModelFinal:(BOOL)a3;
- (void)setHasSortedScoreStage2:(BOOL)a3;
- (void)setHasSortedScorelinearCombiner:(BOOL)a3;
- (void)setSortedScoreBoosted:(id)a3;
- (void)setSortedScoreFinal:(id)a3;
- (void)setSortedScoreKnockOut:(id)a3;
- (void)setSortedScoreModelFinal:(id)a3;
- (void)setSortedScoreStage2:(id)a3;
- (void)setSortedScorelinearCombiner:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSSortedScore

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedScoreKnockOut, 0);
  objc_storeStrong((id *)&self->_sortedScoreBoosted, 0);
  objc_storeStrong((id *)&self->_sortedScoreStage2, 0);
  objc_storeStrong((id *)&self->_sortedScoreModelFinal, 0);
  objc_storeStrong((id *)&self->_sortedScorelinearCombiner, 0);
  objc_storeStrong((id *)&self->_sortedScoreFinal, 0);
}

- (void)setHasSortedScoreKnockOut:(BOOL)a3
{
  self->_hasSortedScoreKnockOut = a3;
}

- (void)setHasSortedScoreBoosted:(BOOL)a3
{
  self->_hasSortedScoreBoosted = a3;
}

- (void)setHasSortedScoreStage2:(BOOL)a3
{
  self->_hasSortedScoreStage2 = a3;
}

- (void)setHasSortedScoreModelFinal:(BOOL)a3
{
  self->_hasSortedScoreModelFinal = a3;
}

- (void)setHasSortedScorelinearCombiner:(BOOL)a3
{
  self->_hasSortedScorelinearCombiner = a3;
}

- (void)setHasSortedScoreFinal:(BOOL)a3
{
  self->_hasSortedScoreFinal = a3;
}

- (void)setSortedScoreKnockOut:(id)a3
{
}

- (NSString)sortedScoreKnockOut
{
  return self->_sortedScoreKnockOut;
}

- (void)setSortedScoreBoosted:(id)a3
{
}

- (NSString)sortedScoreBoosted
{
  return self->_sortedScoreBoosted;
}

- (void)setSortedScoreStage2:(id)a3
{
}

- (NSString)sortedScoreStage2
{
  return self->_sortedScoreStage2;
}

- (void)setSortedScoreModelFinal:(id)a3
{
}

- (NSString)sortedScoreModelFinal
{
  return self->_sortedScoreModelFinal;
}

- (void)setSortedScorelinearCombiner:(id)a3
{
}

- (NSString)sortedScorelinearCombiner
{
  return self->_sortedScorelinearCombiner;
}

- (void)setSortedScoreFinal:(id)a3
{
}

- (NSString)sortedScoreFinal
{
  return self->_sortedScoreFinal;
}

- (PEGASUSSchemaPEGASUSSortedScore)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PEGASUSSchemaPEGASUSSortedScore;
  v5 = [(PEGASUSSchemaPEGASUSSortedScore *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sortedScoreFinal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(PEGASUSSchemaPEGASUSSortedScore *)v5 setSortedScoreFinal:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"sortedScorelinearCombiner"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PEGASUSSchemaPEGASUSSortedScore *)v5 setSortedScorelinearCombiner:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"sortedScoreModelFinal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(PEGASUSSchemaPEGASUSSortedScore *)v5 setSortedScoreModelFinal:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"sortedScoreStage2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(PEGASUSSchemaPEGASUSSortedScore *)v5 setSortedScoreStage2:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"sortedScoreBoosted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(PEGASUSSchemaPEGASUSSortedScore *)v5 setSortedScoreBoosted:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"sortedScoreKnockOut"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(PEGASUSSchemaPEGASUSSortedScore *)v5 setSortedScoreKnockOut:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSSortedScore)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSSortedScore *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSSortedScore *)self dictionaryRepresentation];
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
  if (self->_sortedScoreBoosted)
  {
    id v4 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreBoosted];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"sortedScoreBoosted"];
  }
  if (self->_sortedScoreFinal)
  {
    v6 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreFinal];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"sortedScoreFinal"];
  }
  if (self->_sortedScoreKnockOut)
  {
    v8 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreKnockOut];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"sortedScoreKnockOut"];
  }
  if (self->_sortedScoreModelFinal)
  {
    v10 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreModelFinal];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"sortedScoreModelFinal"];
  }
  if (self->_sortedScoreStage2)
  {
    v12 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreStage2];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"sortedScoreStage2"];
  }
  if (self->_sortedScorelinearCombiner)
  {
    v14 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScorelinearCombiner];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"sortedScorelinearCombiner"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sortedScoreFinal hash];
  NSUInteger v4 = [(NSString *)self->_sortedScorelinearCombiner hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_sortedScoreModelFinal hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_sortedScoreStage2 hash];
  NSUInteger v7 = [(NSString *)self->_sortedScoreBoosted hash];
  return v6 ^ v7 ^ [(NSString *)self->_sortedScoreKnockOut hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreFinal];
  NSUInteger v6 = [v4 sortedScoreFinal];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreFinal];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreFinal];
    v10 = [v4 sortedScoreFinal];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScorelinearCombiner];
  NSUInteger v6 = [v4 sortedScorelinearCombiner];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScorelinearCombiner];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScorelinearCombiner];
    v15 = [v4 sortedScorelinearCombiner];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreModelFinal];
  NSUInteger v6 = [v4 sortedScoreModelFinal];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreModelFinal];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreModelFinal];
    objc_super v20 = [v4 sortedScoreModelFinal];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreStage2];
  NSUInteger v6 = [v4 sortedScoreStage2];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreStage2];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreStage2];
    v25 = [v4 sortedScoreStage2];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreBoosted];
  NSUInteger v6 = [v4 sortedScoreBoosted];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreBoosted];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreBoosted];
    v30 = [v4 sortedScoreBoosted];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreKnockOut];
  NSUInteger v6 = [v4 sortedScoreKnockOut];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreKnockOut];
    if (!v32)
    {

LABEL_35:
      BOOL v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    v34 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreKnockOut];
    v35 = [v4 sortedScoreKnockOut];
    char v36 = [v34 isEqual:v35];

    if (v36) {
      goto LABEL_35;
    }
  }
  else
  {
LABEL_31:
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreFinal];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScorelinearCombiner];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v6 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreModelFinal];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreStage2];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  v8 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreBoosted];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  v9 = [(PEGASUSSchemaPEGASUSSortedScore *)self sortedScoreKnockOut];

  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    v10 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSSortedScoreReadFrom(self, (uint64_t)a3);
}

- (void)deleteSortedScoreKnockOut
{
}

- (BOOL)hasSortedScoreKnockOut
{
  return self->_sortedScoreKnockOut != 0;
}

- (void)deleteSortedScoreBoosted
{
}

- (BOOL)hasSortedScoreBoosted
{
  return self->_sortedScoreBoosted != 0;
}

- (void)deleteSortedScoreStage2
{
}

- (BOOL)hasSortedScoreStage2
{
  return self->_sortedScoreStage2 != 0;
}

- (void)deleteSortedScoreModelFinal
{
}

- (BOOL)hasSortedScoreModelFinal
{
  return self->_sortedScoreModelFinal != 0;
}

- (void)deleteSortedScorelinearCombiner
{
}

- (BOOL)hasSortedScorelinearCombiner
{
  return self->_sortedScorelinearCombiner != 0;
}

- (void)deleteSortedScoreFinal
{
}

- (BOOL)hasSortedScoreFinal
{
  return self->_sortedScoreFinal != 0;
}

@end