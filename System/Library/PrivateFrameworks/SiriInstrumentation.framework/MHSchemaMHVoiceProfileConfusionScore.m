@interface MHSchemaMHVoiceProfileConfusionScore
- (BOOL)hasHomeMemberUserId;
- (BOOL)hasSimilarityScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHVoiceProfileConfusionScore)initWithDictionary:(id)a3;
- (MHSchemaMHVoiceProfileConfusionScore)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)homeMemberUserId;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)similarityScore;
- (void)deleteHomeMemberUserId;
- (void)deleteSimilarityScore;
- (void)setHasHomeMemberUserId:(BOOL)a3;
- (void)setHasSimilarityScore:(BOOL)a3;
- (void)setHomeMemberUserId:(id)a3;
- (void)setSimilarityScore:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHVoiceProfileConfusionScore

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasHomeMemberUserId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)similarityScore
{
  return self->_similarityScore;
}

- (void)setHomeMemberUserId:(id)a3
{
}

- (NSString)homeMemberUserId
{
  return self->_homeMemberUserId;
}

- (MHSchemaMHVoiceProfileConfusionScore)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MHSchemaMHVoiceProfileConfusionScore;
  v5 = [(MHSchemaMHVoiceProfileConfusionScore *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"homeMemberUserId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(MHSchemaMHVoiceProfileConfusionScore *)v5 setHomeMemberUserId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"similarityScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceProfileConfusionScore setSimilarityScore:](v5, "setSimilarityScore:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (MHSchemaMHVoiceProfileConfusionScore)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHVoiceProfileConfusionScore *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHVoiceProfileConfusionScore *)self dictionaryRepresentation];
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
  if (self->_homeMemberUserId)
  {
    id v4 = [(MHSchemaMHVoiceProfileConfusionScore *)self homeMemberUserId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"homeMemberUserId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHVoiceProfileConfusionScore similarityScore](self, "similarityScore"));
    [v3 setObject:v6 forKeyedSubscript:@"similarityScore"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_homeMemberUserId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_similarityScore;
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
  v5 = [(MHSchemaMHVoiceProfileConfusionScore *)self homeMemberUserId];
  v6 = [v4 homeMemberUserId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(MHSchemaMHVoiceProfileConfusionScore *)self homeMemberUserId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(MHSchemaMHVoiceProfileConfusionScore *)self homeMemberUserId];
    objc_super v11 = [v4 homeMemberUserId];
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
    unsigned int similarityScore = self->_similarityScore;
    if (similarityScore != [v4 similarityScore]) {
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
  uint64_t v4 = [(MHSchemaMHVoiceProfileConfusionScore *)self homeMemberUserId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHVoiceProfileConfusionScoreReadFrom(self, (uint64_t)a3);
}

- (void)deleteSimilarityScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSimilarityScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSimilarityScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSimilarityScore:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int similarityScore = a3;
}

- (void)deleteHomeMemberUserId
{
}

- (BOOL)hasHomeMemberUserId
{
  return self->_homeMemberUserId != 0;
}

@end