@interface INFERENCESchemaINFERENCECandidateInfo
- (BOOL)hasAnonymizedEntityIdentifier;
- (BOOL)hasCandidateType;
- (BOOL)hasIsShownToUser;
- (BOOL)hasRank;
- (BOOL)hasScore;
- (BOOL)hasSearchProvider;
- (BOOL)isEqual:(id)a3;
- (BOOL)isShownToUser;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCECandidateInfo)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCECandidateInfo)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)anonymizedEntityIdentifier;
- (float)score;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)candidateType;
- (int)searchProvider;
- (unint64_t)hash;
- (unsigned)rank;
- (void)deleteAnonymizedEntityIdentifier;
- (void)deleteCandidateType;
- (void)deleteIsShownToUser;
- (void)deleteRank;
- (void)deleteScore;
- (void)deleteSearchProvider;
- (void)setAnonymizedEntityIdentifier:(id)a3;
- (void)setCandidateType:(int)a3;
- (void)setHasAnonymizedEntityIdentifier:(BOOL)a3;
- (void)setHasCandidateType:(BOOL)a3;
- (void)setHasIsShownToUser:(BOOL)a3;
- (void)setHasRank:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasSearchProvider:(BOOL)a3;
- (void)setIsShownToUser:(BOOL)a3;
- (void)setRank:(unsigned int)a3;
- (void)setScore:(float)a3;
- (void)setSearchProvider:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCECandidateInfo

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasAnonymizedEntityIdentifier:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)candidateType
{
  return self->_candidateType;
}

- (void)setAnonymizedEntityIdentifier:(id)a3
{
}

- (NSString)anonymizedEntityIdentifier
{
  return self->_anonymizedEntityIdentifier;
}

- (BOOL)isShownToUser
{
  return self->_isShownToUser;
}

- (float)score
{
  return self->_score;
}

- (unsigned)rank
{
  return self->_rank;
}

- (int)searchProvider
{
  return self->_searchProvider;
}

- (INFERENCESchemaINFERENCECandidateInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INFERENCESchemaINFERENCECandidateInfo;
  v5 = [(INFERENCESchemaINFERENCECandidateInfo *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"searchProvider"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECandidateInfo setSearchProvider:](v5, "setSearchProvider:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"rank"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECandidateInfo setRank:](v5, "setRank:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[INFERENCESchemaINFERENCECandidateInfo setScore:](v5, "setScore:");
    }
    v9 = [v4 objectForKeyedSubscript:@"isShownToUser"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECandidateInfo setIsShownToUser:](v5, "setIsShownToUser:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"anonymizedEntityIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(INFERENCESchemaINFERENCECandidateInfo *)v5 setAnonymizedEntityIdentifier:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"candidateType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECandidateInfo setCandidateType:](v5, "setCandidateType:", [v12 intValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCECandidateInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCECandidateInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCECandidateInfo *)self dictionaryRepresentation];
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
  if (self->_anonymizedEntityIdentifier)
  {
    id v4 = [(INFERENCESchemaINFERENCECandidateInfo *)self anonymizedEntityIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"anonymizedEntityIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    int v7 = [(INFERENCESchemaINFERENCECandidateInfo *)self candidateType];
    v8 = @"INFERENCECANDIDATETYPE_UNKNOWN";
    if (v7 == 1) {
      v8 = @"INFERENCECANDIDATETYPE_CONTACT";
    }
    if (v7 == 2) {
      v9 = @"INFERENCECANDIDATETYPE_CONTACT_HANDLE";
    }
    else {
      v9 = v8;
    }
    [v3 setObject:v9 forKeyedSubscript:@"candidateType"];
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCECandidateInfo isShownToUser](self, "isShownToUser"));
    [v3 setObject:v10 forKeyedSubscript:@"isShownToUser"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_12:
      if ((has & 4) == 0) {
        goto LABEL_13;
      }
LABEL_17:
      v12 = NSNumber;
      [(INFERENCESchemaINFERENCECandidateInfo *)self score];
      v13 = objc_msgSend(v12, "numberWithFloat:");
      [v3 setObject:v13 forKeyedSubscript:@"score"];

      if ((*(unsigned char *)&self->_has & 1) == 0) {
        goto LABEL_22;
      }
LABEL_18:
      unsigned int v14 = [(INFERENCESchemaINFERENCECandidateInfo *)self searchProvider] - 1;
      if (v14 > 3) {
        objc_super v15 = @"INFERENCESEARCHPROVIDER_UNKNOWN";
      }
      else {
        objc_super v15 = off_1E5EB0C70[v14];
      }
      [v3 setObject:v15 forKeyedSubscript:@"searchProvider"];
      goto LABEL_22;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_12;
  }
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCECandidateInfo rank](self, "rank"));
  [v3 setObject:v11 forKeyedSubscript:@"rank"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_17;
  }
LABEL_13:
  if (has) {
    goto LABEL_18;
  }
LABEL_22:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v10 = 0;
    goto LABEL_13;
  }
  uint64_t v4 = 2654435761 * self->_searchProvider;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_rank;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  float score = self->_score;
  double v7 = score;
  if (score < 0.0) {
    double v7 = -score;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if ((has & 8) != 0) {
    uint64_t v11 = 2654435761 * self->_isShownToUser;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = [(NSString *)self->_anonymizedEntityIdentifier hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v13 = 2654435761 * self->_candidateType;
  }
  else {
    uint64_t v13 = 0;
  }
  return v5 ^ v4 ^ v10 ^ v11 ^ v13 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  $262A9EC8722D0B8AC431EF47AA53F1A3 has = self->_has;
  unsigned int v6 = v4[36];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_27;
  }
  if (*(unsigned char *)&has)
  {
    int searchProvider = self->_searchProvider;
    if (searchProvider != [v4 searchProvider]) {
      goto LABEL_27;
    }
    $262A9EC8722D0B8AC431EF47AA53F1A3 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_27;
  }
  if (v8)
  {
    unsigned int rank = self->_rank;
    if (rank != [v4 rank]) {
      goto LABEL_27;
    }
    $262A9EC8722D0B8AC431EF47AA53F1A3 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_27;
  }
  if (v10)
  {
    float score = self->_score;
    [v4 score];
    if (score == v12)
    {
      $262A9EC8722D0B8AC431EF47AA53F1A3 has = self->_has;
      unsigned int v6 = v4[36];
      goto LABEL_14;
    }
LABEL_27:
    BOOL v25 = 0;
    goto LABEL_28;
  }
LABEL_14:
  int v13 = (*(unsigned int *)&has >> 3) & 1;
  if (v13 != ((v6 >> 3) & 1)) {
    goto LABEL_27;
  }
  if (v13)
  {
    int isShownToUser = self->_isShownToUser;
    if (isShownToUser != [v4 isShownToUser]) {
      goto LABEL_27;
    }
  }
  objc_super v15 = [(INFERENCESchemaINFERENCECandidateInfo *)self anonymizedEntityIdentifier];
  v16 = [v4 anonymizedEntityIdentifier];
  v17 = v16;
  if ((v15 == 0) == (v16 != 0))
  {

    goto LABEL_27;
  }
  uint64_t v18 = [(INFERENCESchemaINFERENCECandidateInfo *)self anonymizedEntityIdentifier];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(INFERENCESchemaINFERENCECandidateInfo *)self anonymizedEntityIdentifier];
    v21 = [v4 anonymizedEntityIdentifier];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  int v23 = (*(unsigned char *)&self->_has >> 4) & 1;
  if (v23 != ((v4[36] >> 4) & 1)) {
    goto LABEL_27;
  }
  if (v23)
  {
    int candidateType = self->_candidateType;
    if (candidateType != [v4 candidateType]) {
      goto LABEL_27;
    }
  }
  BOOL v25 = 1;
LABEL_28:

  return v25;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  PBDataWriterWriteFloatField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteBOOLField();
LABEL_6:
  uint64_t v5 = [(INFERENCESchemaINFERENCECandidateInfo *)self anonymizedEntityIdentifier];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECandidateInfoReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteCandidateType
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasCandidateType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCandidateType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setCandidateType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int candidateType = a3;
}

- (void)deleteAnonymizedEntityIdentifier
{
}

- (BOOL)hasAnonymizedEntityIdentifier
{
  return self->_anonymizedEntityIdentifier != 0;
}

- (void)deleteIsShownToUser
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsShownToUser:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsShownToUser
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsShownToUser:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isShownToUser = a3;
}

- (void)deleteScore
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasScore:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScore
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setScore:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float score = a3;
}

- (void)deleteRank
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRank:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRank
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRank:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int rank = a3;
}

- (void)deleteSearchProvider
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSearchProvider:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSearchProvider
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSearchProvider:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int searchProvider = a3;
}

@end