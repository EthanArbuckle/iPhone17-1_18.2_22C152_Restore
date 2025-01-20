@interface NLGSchemaNLGScoredDialog
- (BOOL)hasCatFamily;
- (BOOL)hasCatIdentifier;
- (BOOL)hasScore;
- (BOOL)hasScoredDialogIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLGSchemaNLGScoredDialog)initWithDictionary:(id)a3;
- (NLGSchemaNLGScoredDialog)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)catFamily;
- (NSString)catIdentifier;
- (NSString)scoredDialogIdentifier;
- (float)score;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCatFamily;
- (void)deleteCatIdentifier;
- (void)deleteScore;
- (void)deleteScoredDialogIdentifier;
- (void)setCatFamily:(id)a3;
- (void)setCatIdentifier:(id)a3;
- (void)setHasCatFamily:(BOOL)a3;
- (void)setHasCatIdentifier:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasScoredDialogIdentifier:(BOOL)a3;
- (void)setScore:(float)a3;
- (void)setScoredDialogIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLGSchemaNLGScoredDialog

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredDialogIdentifier, 0);
  objc_storeStrong((id *)&self->_catIdentifier, 0);
  objc_storeStrong((id *)&self->_catFamily, 0);
}

- (void)setHasScoredDialogIdentifier:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasCatIdentifier:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasCatFamily:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (float)score
{
  return self->_score;
}

- (void)setScoredDialogIdentifier:(id)a3
{
}

- (NSString)scoredDialogIdentifier
{
  return self->_scoredDialogIdentifier;
}

- (void)setCatIdentifier:(id)a3
{
}

- (NSString)catIdentifier
{
  return self->_catIdentifier;
}

- (void)setCatFamily:(id)a3
{
}

- (NSString)catFamily
{
  return self->_catFamily;
}

- (NLGSchemaNLGScoredDialog)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NLGSchemaNLGScoredDialog;
  v5 = [(NLGSchemaNLGScoredDialog *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"catFamily"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(NLGSchemaNLGScoredDialog *)v5 setCatFamily:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"catIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(NLGSchemaNLGScoredDialog *)v5 setCatIdentifier:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"scoredDialogIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(NLGSchemaNLGScoredDialog *)v5 setScoredDialogIdentifier:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      -[NLGSchemaNLGScoredDialog setScore:](v5, "setScore:");
    }
    v13 = v5;
  }
  return v5;
}

- (NLGSchemaNLGScoredDialog)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLGSchemaNLGScoredDialog *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLGSchemaNLGScoredDialog *)self dictionaryRepresentation];
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
  if (self->_catFamily)
  {
    id v4 = [(NLGSchemaNLGScoredDialog *)self catFamily];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"catFamily"];
  }
  if (self->_catIdentifier)
  {
    v6 = [(NLGSchemaNLGScoredDialog *)self catIdentifier];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"catIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = NSNumber;
    [(NLGSchemaNLGScoredDialog *)self score];
    v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"score"];
  }
  if (self->_scoredDialogIdentifier)
  {
    v10 = [(NLGSchemaNLGScoredDialog *)self scoredDialogIdentifier];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"scoredDialogIdentifier"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_catFamily hash];
  NSUInteger v4 = [(NSString *)self->_catIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_scoredDialogIdentifier hash];
  if (*(unsigned char *)&self->_has)
  {
    float score = self->_score;
    double v8 = score;
    if (score < 0.0) {
      double v8 = -score;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  NSUInteger v5 = [(NLGSchemaNLGScoredDialog *)self catFamily];
  unint64_t v6 = [v4 catFamily];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(NLGSchemaNLGScoredDialog *)self catFamily];
  if (v7)
  {
    double v8 = (void *)v7;
    long double v9 = [(NLGSchemaNLGScoredDialog *)self catFamily];
    double v10 = [v4 catFamily];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(NLGSchemaNLGScoredDialog *)self catIdentifier];
  unint64_t v6 = [v4 catIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(NLGSchemaNLGScoredDialog *)self catIdentifier];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(NLGSchemaNLGScoredDialog *)self catIdentifier];
    objc_super v15 = [v4 catIdentifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(NLGSchemaNLGScoredDialog *)self scoredDialogIdentifier];
  unint64_t v6 = [v4 scoredDialogIdentifier];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(NLGSchemaNLGScoredDialog *)self scoredDialogIdentifier];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(NLGSchemaNLGScoredDialog *)self scoredDialogIdentifier];
    v20 = [v4 scoredDialogIdentifier];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[36] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0 || (float score = self->_score, [v4 score], score == v25))
    {
      BOOL v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  NSUInteger v4 = [(NLGSchemaNLGScoredDialog *)self catFamily];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(NLGSchemaNLGScoredDialog *)self catIdentifier];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  unint64_t v6 = [(NLGSchemaNLGScoredDialog *)self scoredDialogIdentifier];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = v8;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteFloatField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLGSchemaNLGScoredDialogReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setScore:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float score = a3;
}

- (void)deleteScoredDialogIdentifier
{
}

- (BOOL)hasScoredDialogIdentifier
{
  return self->_scoredDialogIdentifier != 0;
}

- (void)deleteCatIdentifier
{
}

- (BOOL)hasCatIdentifier
{
  return self->_catIdentifier != 0;
}

- (void)deleteCatFamily
{
}

- (BOOL)hasCatFamily
{
  return self->_catFamily != 0;
}

@end