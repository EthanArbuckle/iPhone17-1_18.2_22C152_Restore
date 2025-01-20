@interface PLUSSchemaPLUSContactGroundTruth
- (BOOL)hasContactSuggestionUsedBySiri;
- (BOOL)hasGroundTruthId;
- (BOOL)hasGroundTruthSource;
- (BOOL)hasHasSiriResolvedContactForEntity;
- (BOOL)hasSiriResolvedAndPlusInferredContactComparison;
- (BOOL)hasSiriResolvedContactForEntity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSContactGroundTruth)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSContactGroundTruth)initWithJSON:(id)a3;
- (SISchemaUUID)groundTruthId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)contactSuggestionUsedBySiri;
- (int)groundTruthSource;
- (int)siriResolvedAndPlusInferredContactComparison;
- (unint64_t)hash;
- (void)deleteContactSuggestionUsedBySiri;
- (void)deleteGroundTruthId;
- (void)deleteGroundTruthSource;
- (void)deleteHasSiriResolvedContactForEntity;
- (void)deleteSiriResolvedAndPlusInferredContactComparison;
- (void)setContactSuggestionUsedBySiri:(int)a3;
- (void)setGroundTruthId:(id)a3;
- (void)setGroundTruthSource:(int)a3;
- (void)setHasContactSuggestionUsedBySiri:(BOOL)a3;
- (void)setHasGroundTruthId:(BOOL)a3;
- (void)setHasGroundTruthSource:(BOOL)a3;
- (void)setHasHasSiriResolvedContactForEntity:(BOOL)a3;
- (void)setHasSiriResolvedAndPlusInferredContactComparison:(BOOL)a3;
- (void)setHasSiriResolvedContactForEntity:(BOOL)a3;
- (void)setSiriResolvedAndPlusInferredContactComparison:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSContactGroundTruth

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSContactGroundTruth;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSContactGroundTruth *)self groundTruthId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PLUSSchemaPLUSContactGroundTruth *)self deleteGroundTruthId];
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

- (void)setHasGroundTruthId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)contactSuggestionUsedBySiri
{
  return self->_contactSuggestionUsedBySiri;
}

- (int)siriResolvedAndPlusInferredContactComparison
{
  return self->_siriResolvedAndPlusInferredContactComparison;
}

- (BOOL)hasSiriResolvedContactForEntity
{
  return self->_hasSiriResolvedContactForEntity;
}

- (int)groundTruthSource
{
  return self->_groundTruthSource;
}

- (void)setGroundTruthId:(id)a3
{
}

- (SISchemaUUID)groundTruthId
{
  return self->_groundTruthId;
}

- (PLUSSchemaPLUSContactGroundTruth)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLUSSchemaPLUSContactGroundTruth;
  v5 = [(PLUSSchemaPLUSContactGroundTruth *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"groundTruthId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSContactGroundTruth *)v5 setGroundTruthId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"groundTruthSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactGroundTruth setGroundTruthSource:](v5, "setGroundTruthSource:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"hasSiriResolvedContactForEntity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactGroundTruth setHasSiriResolvedContactForEntity:](v5, "setHasSiriResolvedContactForEntity:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"siriResolvedAndPlusInferredContactComparison"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactGroundTruth setSiriResolvedAndPlusInferredContactComparison:](v5, "setSiriResolvedAndPlusInferredContactComparison:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"contactSuggestionUsedBySiri"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactGroundTruth setContactSuggestionUsedBySiri:](v5, "setContactSuggestionUsedBySiri:", [v11 intValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSContactGroundTruth)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSContactGroundTruth *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSContactGroundTruth *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    unsigned int v4 = [(PLUSSchemaPLUSContactGroundTruth *)self contactSuggestionUsedBySiri] - 1;
    if (v4 > 2) {
      v5 = @"PLUSINFERREDSUGGESTIONSTATE_UNKNOWN";
    }
    else {
      v5 = off_1E5EB3EE0[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"contactSuggestionUsedBySiri"];
  }
  if (self->_groundTruthId)
  {
    v6 = [(PLUSSchemaPLUSContactGroundTruth *)self groundTruthId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"groundTruthId"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"groundTruthId"];
    }
  }
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_13;
    }
LABEL_19:
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSContactGroundTruth hasSiriResolvedContactForEntity](self, "hasSiriResolvedContactForEntity"));
    [v3 setObject:v12 forKeyedSubscript:@"hasSiriResolvedContactForEntity"];

    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_24;
    }
LABEL_20:
    unsigned int v13 = [(PLUSSchemaPLUSContactGroundTruth *)self siriResolvedAndPlusInferredContactComparison]- 1;
    if (v13 > 4) {
      objc_super v14 = @"PLUSCONTACTREFERENCECOMPARISON_UNKNOWN";
    }
    else {
      objc_super v14 = off_1E5EB3F68[v13];
    }
    [v3 setObject:v14 forKeyedSubscript:@"siriResolvedAndPlusInferredContactComparison"];
    goto LABEL_24;
  }
  unsigned int v10 = [(PLUSSchemaPLUSContactGroundTruth *)self groundTruthSource] - 1;
  if (v10 > 0xD) {
    v11 = @"PLUSCONTACTGROUNDTRUTHSOURCE_UNKNOWN";
  }
  else {
    v11 = off_1E5EB3EF8[v10];
  }
  [v3 setObject:v11 forKeyedSubscript:@"groundTruthSource"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_19;
  }
LABEL_13:
  if ((has & 4) != 0) {
    goto LABEL_20;
  }
LABEL_24:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_groundTruthId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_groundTruthSource;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_hasSiriResolvedContactForEntity;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_siriResolvedAndPlusInferredContactComparison;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_contactSuggestionUsedBySiri;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  uint64_t v5 = [(PLUSSchemaPLUSContactGroundTruth *)self groundTruthId];
  uint64_t v6 = [v4 groundTruthId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_24;
  }
  uint64_t v8 = [(PLUSSchemaPLUSContactGroundTruth *)self groundTruthId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    unsigned int v10 = [(PLUSSchemaPLUSContactGroundTruth *)self groundTruthId];
    v11 = [v4 groundTruthId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  $0EF097754544885748D88EB6F6F28D5B has = self->_has;
  unsigned int v14 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_24:
    BOOL v22 = 0;
    goto LABEL_25;
  }
  if (*(unsigned char *)&has)
  {
    int groundTruthSource = self->_groundTruthSource;
    if (groundTruthSource != [v4 groundTruthSource]) {
      goto LABEL_24;
    }
    $0EF097754544885748D88EB6F6F28D5B has = self->_has;
    unsigned int v14 = v4[32];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_24;
  }
  if (v16)
  {
    int hasSiriResolvedContactForEntity = self->_hasSiriResolvedContactForEntity;
    if (hasSiriResolvedContactForEntity != [v4 hasSiriResolvedContactForEntity]) {
      goto LABEL_24;
    }
    $0EF097754544885748D88EB6F6F28D5B has = self->_has;
    unsigned int v14 = v4[32];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_24;
  }
  if (v18)
  {
    int siriResolvedAndPlusInferredContactComparison = self->_siriResolvedAndPlusInferredContactComparison;
    if (siriResolvedAndPlusInferredContactComparison == [v4 siriResolvedAndPlusInferredContactComparison])
    {
      $0EF097754544885748D88EB6F6F28D5B has = self->_has;
      unsigned int v14 = v4[32];
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_20:
  int v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_24;
  }
  if (v20)
  {
    int contactSuggestionUsedBySiri = self->_contactSuggestionUsedBySiri;
    if (contactSuggestionUsedBySiri != [v4 contactSuggestionUsedBySiri]) {
      goto LABEL_24;
    }
  }
  BOOL v22 = 1;
LABEL_25:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(PLUSSchemaPLUSContactGroundTruth *)self groundTruthId];

  if (v4)
  {
    uint64_t v5 = [(PLUSSchemaPLUSContactGroundTruth *)self groundTruthId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  uint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v7 = v8;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  uint64_t v7 = v8;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactGroundTruthReadFrom(self, (uint64_t)a3);
}

- (void)deleteContactSuggestionUsedBySiri
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasContactSuggestionUsedBySiri:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasContactSuggestionUsedBySiri
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setContactSuggestionUsedBySiri:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int contactSuggestionUsedBySiri = a3;
}

- (void)deleteSiriResolvedAndPlusInferredContactComparison
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasSiriResolvedAndPlusInferredContactComparison:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSiriResolvedAndPlusInferredContactComparison
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSiriResolvedAndPlusInferredContactComparison:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int siriResolvedAndPlusInferredContactComparison = a3;
}

- (void)deleteHasSiriResolvedContactForEntity
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasHasSiriResolvedContactForEntity:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasSiriResolvedContactForEntity
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSiriResolvedContactForEntity:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int hasSiriResolvedContactForEntity = a3;
}

- (void)deleteGroundTruthSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasGroundTruthSource:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGroundTruthSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setGroundTruthSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int groundTruthSource = a3;
}

- (void)deleteGroundTruthId
{
}

- (BOOL)hasGroundTruthId
{
  return self->_groundTruthId != 0;
}

@end