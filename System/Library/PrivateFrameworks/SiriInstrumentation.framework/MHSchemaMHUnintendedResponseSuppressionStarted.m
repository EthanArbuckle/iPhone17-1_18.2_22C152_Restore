@interface MHSchemaMHUnintendedResponseSuppressionStarted
- (BOOL)hasAftmScore;
- (BOOL)hasLrnnScore;
- (BOOL)hasNumAsrRecords;
- (BOOL)hasNumTokensTopPath;
- (BOOL)hasTrailingSilenceDurationInNs;
- (BOOL)hasUemScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated)aftmScore;
- (MHSchemaMHLatticeFalseTriggerMitigationEnded)lrnnScore;
- (MHSchemaMHUnintendedResponseSuppressionStarted)initWithDictionary:(id)a3;
- (MHSchemaMHUnintendedResponseSuppressionStarted)initWithJSON:(id)a3;
- (MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated)uemScore;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)trailingSilenceDurationInNs;
- (unsigned)numAsrRecords;
- (unsigned)numTokensTopPath;
- (void)deleteAftmScore;
- (void)deleteLrnnScore;
- (void)deleteNumAsrRecords;
- (void)deleteNumTokensTopPath;
- (void)deleteTrailingSilenceDurationInNs;
- (void)deleteUemScore;
- (void)setAftmScore:(id)a3;
- (void)setHasAftmScore:(BOOL)a3;
- (void)setHasLrnnScore:(BOOL)a3;
- (void)setHasNumAsrRecords:(BOOL)a3;
- (void)setHasNumTokensTopPath:(BOOL)a3;
- (void)setHasTrailingSilenceDurationInNs:(BOOL)a3;
- (void)setHasUemScore:(BOOL)a3;
- (void)setLrnnScore:(id)a3;
- (void)setNumAsrRecords:(unsigned int)a3;
- (void)setNumTokensTopPath:(unsigned int)a3;
- (void)setTrailingSilenceDurationInNs:(unint64_t)a3;
- (void)setUemScore:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHUnintendedResponseSuppressionStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MHSchemaMHUnintendedResponseSuppressionStarted;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self aftmScore];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(MHSchemaMHUnintendedResponseSuppressionStarted *)self deleteAftmScore];
  }
  v9 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self lrnnScore];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(MHSchemaMHUnintendedResponseSuppressionStarted *)self deleteLrnnScore];
  }
  v12 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self uemScore];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(MHSchemaMHUnintendedResponseSuppressionStarted *)self deleteUemScore];
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
  objc_storeStrong((id *)&self->_uemScore, 0);
  objc_storeStrong((id *)&self->_lrnnScore, 0);
  objc_storeStrong((id *)&self->_aftmScore, 0);
}

- (void)setHasUemScore:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasLrnnScore:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAftmScore:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setUemScore:(id)a3
{
}

- (MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated)uemScore
{
  return self->_uemScore;
}

- (void)setLrnnScore:(id)a3
{
}

- (MHSchemaMHLatticeFalseTriggerMitigationEnded)lrnnScore
{
  return self->_lrnnScore;
}

- (void)setAftmScore:(id)a3
{
}

- (MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated)aftmScore
{
  return self->_aftmScore;
}

- (unint64_t)trailingSilenceDurationInNs
{
  return self->_trailingSilenceDurationInNs;
}

- (unsigned)numTokensTopPath
{
  return self->_numTokensTopPath;
}

- (unsigned)numAsrRecords
{
  return self->_numAsrRecords;
}

- (MHSchemaMHUnintendedResponseSuppressionStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MHSchemaMHUnintendedResponseSuppressionStarted;
  v5 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numAsrRecords"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHUnintendedResponseSuppressionStarted setNumAsrRecords:](v5, "setNumAsrRecords:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"numTokensTopPath"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHUnintendedResponseSuppressionStarted setNumTokensTopPath:](v5, "setNumTokensTopPath:", [v7 unsignedIntValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"trailingSilenceDurationInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHUnintendedResponseSuppressionStarted setTrailingSilenceDurationInNs:](v5, "setTrailingSilenceDurationInNs:", [v8 unsignedLongLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"aftmScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated alloc] initWithDictionary:v9];
      [(MHSchemaMHUnintendedResponseSuppressionStarted *)v5 setAftmScore:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"lrnnScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[MHSchemaMHLatticeFalseTriggerMitigationEnded alloc] initWithDictionary:v11];
      [(MHSchemaMHUnintendedResponseSuppressionStarted *)v5 setLrnnScore:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"uemScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = [[MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated alloc] initWithDictionary:v13];
      [(MHSchemaMHUnintendedResponseSuppressionStarted *)v5 setUemScore:v14];
    }
    v15 = v5;
  }
  return v5;
}

- (MHSchemaMHUnintendedResponseSuppressionStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self dictionaryRepresentation];
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
  if (self->_aftmScore)
  {
    id v4 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self aftmScore];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"aftmScore"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"aftmScore"];
    }
  }
  if (self->_lrnnScore)
  {
    uint64_t v7 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self lrnnScore];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"lrnnScore"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"lrnnScore"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    int v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHUnintendedResponseSuppressionStarted numAsrRecords](self, "numAsrRecords"));
    [v3 setObject:v14 forKeyedSubscript:@"numAsrRecords"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHUnintendedResponseSuppressionStarted numTokensTopPath](self, "numTokensTopPath"));
  [v3 setObject:v15 forKeyedSubscript:@"numTokensTopPath"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_14:
    int v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHUnintendedResponseSuppressionStarted trailingSilenceDurationInNs](self, "trailingSilenceDurationInNs"));
    [v3 setObject:v11 forKeyedSubscript:@"trailingSilenceDurationInNs"];
  }
LABEL_15:
  if (self->_uemScore)
  {
    v12 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self uemScore];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"uemScore"];
    }
    else
    {
      objc_super v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"uemScore"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_numAsrRecords;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_numTokensTopPath;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v5 = 2654435761u * self->_trailingSilenceDurationInNs;
LABEL_8:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated *)self->_aftmScore hash];
  unint64_t v7 = [(MHSchemaMHLatticeFalseTriggerMitigationEnded *)self->_lrnnScore hash];
  return v6 ^ v7 ^ [(MHSchemaMHUserEngagementFalseTriggerMitigationScoreGenerated *)self->_uemScore hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  $EEDD6289D62485C6C22111D683E4F799 has = self->_has;
  unsigned int v6 = v4[48];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_28;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int numAsrRecords = self->_numAsrRecords;
    if (numAsrRecords != [v4 numAsrRecords]) {
      goto LABEL_28;
    }
    $EEDD6289D62485C6C22111D683E4F799 has = self->_has;
    unsigned int v6 = v4[48];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      unsigned int numTokensTopPath = self->_numTokensTopPath;
      if (numTokensTopPath != [v4 numTokensTopPath]) {
        goto LABEL_28;
      }
      $EEDD6289D62485C6C22111D683E4F799 has = self->_has;
      unsigned int v6 = v4[48];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 != ((v6 >> 2) & 1)) {
      goto LABEL_28;
    }
    if (v10)
    {
      unint64_t trailingSilenceDurationInNs = self->_trailingSilenceDurationInNs;
      if (trailingSilenceDurationInNs != [v4 trailingSilenceDurationInNs]) {
        goto LABEL_28;
      }
    }
    v12 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self aftmScore];
    v13 = [v4 aftmScore];
    if ((v12 == 0) == (v13 != 0)) {
      goto LABEL_27;
    }
    uint64_t v14 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self aftmScore];
    if (v14)
    {
      v15 = (void *)v14;
      objc_super v16 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self aftmScore];
      objc_super v17 = [v4 aftmScore];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_28;
      }
    }
    else
    {
    }
    v12 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self lrnnScore];
    v13 = [v4 lrnnScore];
    if ((v12 == 0) == (v13 != 0)) {
      goto LABEL_27;
    }
    uint64_t v19 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self lrnnScore];
    if (v19)
    {
      v20 = (void *)v19;
      v21 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self lrnnScore];
      v22 = [v4 lrnnScore];
      int v23 = [v21 isEqual:v22];

      if (!v23) {
        goto LABEL_28;
      }
    }
    else
    {
    }
    v12 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self uemScore];
    v13 = [v4 uemScore];
    if ((v12 == 0) != (v13 != 0))
    {
      uint64_t v24 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self uemScore];
      if (!v24)
      {

LABEL_31:
        BOOL v29 = 1;
        goto LABEL_29;
      }
      v25 = (void *)v24;
      v26 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self uemScore];
      v27 = [v4 uemScore];
      char v28 = [v26 isEqual:v27];

      if (v28) {
        goto LABEL_31;
      }
    }
    else
    {
LABEL_27:
    }
  }
LABEL_28:
  BOOL v29 = 0;
LABEL_29:

  return v29;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint64Field();
LABEL_5:
  unint64_t v5 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self aftmScore];

  if (v5)
  {
    unsigned int v6 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self aftmScore];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v7 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self lrnnScore];

  if (v7)
  {
    int v8 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self lrnnScore];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self uemScore];

  int v10 = v12;
  if (v9)
  {
    int v11 = [(MHSchemaMHUnintendedResponseSuppressionStarted *)self uemScore];
    PBDataWriterWriteSubmessage();

    int v10 = v12;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHUnintendedResponseSuppressionStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteUemScore
{
}

- (BOOL)hasUemScore
{
  return self->_uemScore != 0;
}

- (void)deleteLrnnScore
{
}

- (BOOL)hasLrnnScore
{
  return self->_lrnnScore != 0;
}

- (void)deleteAftmScore
{
}

- (BOOL)hasAftmScore
{
  return self->_aftmScore != 0;
}

- (void)deleteTrailingSilenceDurationInNs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasTrailingSilenceDurationInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTrailingSilenceDurationInNs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTrailingSilenceDurationInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t trailingSilenceDurationInNs = a3;
}

- (void)deleteNumTokensTopPath
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumTokensTopPath:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumTokensTopPath
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumTokensTopPath:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int numTokensTopPath = a3;
}

- (void)deleteNumAsrRecords
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNumAsrRecords:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumAsrRecords
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumAsrRecords:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int numAsrRecords = a3;
}

@end