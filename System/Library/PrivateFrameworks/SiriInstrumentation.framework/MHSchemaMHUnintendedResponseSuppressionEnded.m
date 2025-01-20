@interface MHSchemaMHUnintendedResponseSuppressionEnded
- (BOOL)hasMitigationAssetVersion;
- (BOOL)hasModelVersion;
- (BOOL)hasScore;
- (BOOL)hasSpeakerIDThreshold;
- (BOOL)hasSpeakerIdScoreThreshold;
- (BOOL)hasThreshold;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHUnintendedResponseSuppressionEnded)initWithDictionary:(id)a3;
- (MHSchemaMHUnintendedResponseSuppressionEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)mitigationAssetVersion;
- (NSString)modelVersion;
- (float)score;
- (float)speakerIDThreshold;
- (float)speakerIdScoreThreshold;
- (float)threshold;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteMitigationAssetVersion;
- (void)deleteModelVersion;
- (void)deleteScore;
- (void)deleteSpeakerIDThreshold;
- (void)deleteSpeakerIdScoreThreshold;
- (void)deleteThreshold;
- (void)setHasMitigationAssetVersion:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasSpeakerIDThreshold:(BOOL)a3;
- (void)setHasSpeakerIdScoreThreshold:(BOOL)a3;
- (void)setHasThreshold:(BOOL)a3;
- (void)setMitigationAssetVersion:(id)a3;
- (void)setModelVersion:(id)a3;
- (void)setScore:(float)a3;
- (void)setSpeakerIDThreshold:(float)a3;
- (void)setSpeakerIdScoreThreshold:(float)a3;
- (void)setThreshold:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHUnintendedResponseSuppressionEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mitigationAssetVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

- (void)setHasMitigationAssetVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (float)speakerIdScoreThreshold
{
  return self->_speakerIdScoreThreshold;
}

- (float)speakerIDThreshold
{
  return self->_speakerIDThreshold;
}

- (void)setMitigationAssetVersion:(id)a3
{
}

- (NSString)mitigationAssetVersion
{
  return self->_mitigationAssetVersion;
}

- (float)threshold
{
  return self->_threshold;
}

- (float)score
{
  return self->_score;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (MHSchemaMHUnintendedResponseSuppressionEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MHSchemaMHUnintendedResponseSuppressionEnded;
  v5 = [(MHSchemaMHUnintendedResponseSuppressionEnded *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(MHSchemaMHUnintendedResponseSuppressionEnded *)v5 setModelVersion:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[MHSchemaMHUnintendedResponseSuppressionEnded setScore:](v5, "setScore:");
    }
    v9 = [v4 objectForKeyedSubscript:@"threshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[MHSchemaMHUnintendedResponseSuppressionEnded setThreshold:](v5, "setThreshold:");
    }
    v10 = [v4 objectForKeyedSubscript:@"mitigationAssetVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(MHSchemaMHUnintendedResponseSuppressionEnded *)v5 setMitigationAssetVersion:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"speakerIDThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      -[MHSchemaMHUnintendedResponseSuppressionEnded setSpeakerIDThreshold:](v5, "setSpeakerIDThreshold:");
    }
    v13 = [v4 objectForKeyedSubscript:@"speakerIdScoreThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 floatValue];
      -[MHSchemaMHUnintendedResponseSuppressionEnded setSpeakerIdScoreThreshold:](v5, "setSpeakerIdScoreThreshold:");
    }
    v14 = v5;
  }
  return v5;
}

- (MHSchemaMHUnintendedResponseSuppressionEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHUnintendedResponseSuppressionEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHUnintendedResponseSuppressionEnded *)self dictionaryRepresentation];
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
  if (self->_mitigationAssetVersion)
  {
    id v4 = [(MHSchemaMHUnintendedResponseSuppressionEnded *)self mitigationAssetVersion];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"mitigationAssetVersion"];
  }
  if (self->_modelVersion)
  {
    v6 = [(MHSchemaMHUnintendedResponseSuppressionEnded *)self modelVersion];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"modelVersion"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v12 = NSNumber;
    [(MHSchemaMHUnintendedResponseSuppressionEnded *)self score];
    v13 = objc_msgSend(v12, "numberWithFloat:");
    [v3 setObject:v13 forKeyedSubscript:@"score"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v14 = NSNumber;
  [(MHSchemaMHUnintendedResponseSuppressionEnded *)self speakerIDThreshold];
  v15 = objc_msgSend(v14, "numberWithFloat:");
  [v3 setObject:v15 forKeyedSubscript:@"speakerIDThreshold"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  objc_super v16 = NSNumber;
  [(MHSchemaMHUnintendedResponseSuppressionEnded *)self speakerIdScoreThreshold];
  v17 = objc_msgSend(v16, "numberWithFloat:");
  [v3 setObject:v17 forKeyedSubscript:@"speakerIdScoreThreshold"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_9:
    v9 = NSNumber;
    [(MHSchemaMHUnintendedResponseSuppressionEnded *)self threshold];
    v10 = objc_msgSend(v9, "numberWithFloat:");
    [v3 setObject:v10 forKeyedSubscript:@"threshold"];
  }
LABEL_10:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_modelVersion hash];
  char has = (char)self->_has;
  if (has)
  {
    float score = self->_score;
    double v7 = score;
    if (score < 0.0) {
      double v7 = -score;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0)
  {
    float threshold = self->_threshold;
    double v12 = threshold;
    if (threshold < 0.0) {
      double v12 = -threshold;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_mitigationAssetVersion hash];
  char v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    float speakerIDThreshold = self->_speakerIDThreshold;
    double v19 = speakerIDThreshold;
    if (speakerIDThreshold < 0.0) {
      double v19 = -speakerIDThreshold;
    }
    long double v20 = floor(v19 + 0.5);
    double v21 = (v19 - v20) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0) {
        v17 += (unint64_t)v21;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }
  if ((v16 & 8) != 0)
  {
    float speakerIdScoreThreshold = self->_speakerIdScoreThreshold;
    double v24 = speakerIdScoreThreshold;
    if (speakerIdScoreThreshold < 0.0) {
      double v24 = -speakerIdScoreThreshold;
    }
    long double v25 = floor(v24 + 0.5);
    double v26 = (v24 - v25) * 1.84467441e19;
    unint64_t v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0) {
        v22 += (unint64_t)v26;
      }
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    unint64_t v22 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15 ^ v17 ^ v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  unint64_t v5 = [(MHSchemaMHUnintendedResponseSuppressionEnded *)self modelVersion];
  v6 = [v4 modelVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_18;
  }
  uint64_t v7 = [(MHSchemaMHUnintendedResponseSuppressionEnded *)self modelVersion];
  if (v7)
  {
    long double v8 = (void *)v7;
    double v9 = [(MHSchemaMHUnintendedResponseSuppressionEnded *)self modelVersion];
    unint64_t v10 = [v4 modelVersion];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $13047DB1728F224DDA92666FD4C526AE has = self->_has;
  unsigned int v13 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    float score = self->_score;
    [v4 score];
    if (score != v15) {
      goto LABEL_19;
    }
    $13047DB1728F224DDA92666FD4C526AE has = self->_has;
    unsigned int v13 = v4[40];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v13 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v16)
  {
    float threshold = self->_threshold;
    [v4 threshold];
    if (threshold != v18) {
      goto LABEL_19;
    }
  }
  unint64_t v5 = [(MHSchemaMHUnintendedResponseSuppressionEnded *)self mitigationAssetVersion];
  v6 = [v4 mitigationAssetVersion];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v19 = [(MHSchemaMHUnintendedResponseSuppressionEnded *)self mitigationAssetVersion];
  if (v19)
  {
    long double v20 = (void *)v19;
    double v21 = [(MHSchemaMHUnintendedResponseSuppressionEnded *)self mitigationAssetVersion];
    unint64_t v22 = [v4 mitigationAssetVersion];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $13047DB1728F224DDA92666FD4C526AE v26 = self->_has;
  int v27 = (*(unsigned int *)&v26 >> 2) & 1;
  unsigned int v28 = v4[40];
  if (v27 == ((v28 >> 2) & 1))
  {
    if (v27)
    {
      float speakerIDThreshold = self->_speakerIDThreshold;
      [v4 speakerIDThreshold];
      if (speakerIDThreshold != v30) {
        goto LABEL_19;
      }
      $13047DB1728F224DDA92666FD4C526AE v26 = self->_has;
      unsigned int v28 = v4[40];
    }
    int v31 = (*(unsigned int *)&v26 >> 3) & 1;
    if (v31 == ((v28 >> 3) & 1))
    {
      if (!v31
        || (float speakerIdScoreThreshold = self->_speakerIdScoreThreshold,
            [v4 speakerIdScoreThreshold],
            speakerIdScoreThreshold == v33))
      {
        BOOL v24 = 1;
        goto LABEL_20;
      }
    }
  }
LABEL_19:
  BOOL v24 = 0;
LABEL_20:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(MHSchemaMHUnintendedResponseSuppressionEnded *)self modelVersion];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteFloatField();
  }
  v6 = [(MHSchemaMHUnintendedResponseSuppressionEnded *)self mitigationAssetVersion];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  char v7 = (char)self->_has;
  long double v8 = v9;
  if ((v7 & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    long double v8 = v9;
    char v7 = (char)self->_has;
  }
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    long double v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHUnintendedResponseSuppressionEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteSpeakerIdScoreThreshold
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasSpeakerIdScoreThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSpeakerIdScoreThreshold
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSpeakerIdScoreThreshold:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_float speakerIdScoreThreshold = a3;
}

- (void)deleteSpeakerIDThreshold
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasSpeakerIDThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSpeakerIDThreshold
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSpeakerIDThreshold:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float speakerIDThreshold = a3;
}

- (void)deleteMitigationAssetVersion
{
}

- (BOOL)hasMitigationAssetVersion
{
  return self->_mitigationAssetVersion != 0;
}

- (void)deleteThreshold
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasThreshold
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setThreshold:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float threshold = a3;
}

- (void)deleteScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
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

- (void)deleteModelVersion
{
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

@end