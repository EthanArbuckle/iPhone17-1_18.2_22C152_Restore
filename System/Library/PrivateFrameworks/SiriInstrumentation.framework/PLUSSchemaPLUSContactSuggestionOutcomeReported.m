@interface PLUSSchemaPLUSContactSuggestionOutcomeReported
- (BOOL)hasContactSuggestionOutcome;
- (BOOL)hasContactSuggestionRedundancyState;
- (BOOL)hasSuggestionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSContactSuggestionOutcomeReported)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSContactSuggestionOutcomeReported)initWithJSON:(id)a3;
- (SISchemaUUID)suggestionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)contactSuggestionOutcome;
- (int)contactSuggestionRedundancyState;
- (unint64_t)hash;
- (void)deleteContactSuggestionOutcome;
- (void)deleteContactSuggestionRedundancyState;
- (void)deleteSuggestionId;
- (void)setContactSuggestionOutcome:(int)a3;
- (void)setContactSuggestionRedundancyState:(int)a3;
- (void)setHasContactSuggestionOutcome:(BOOL)a3;
- (void)setHasContactSuggestionRedundancyState:(BOOL)a3;
- (void)setHasSuggestionId:(BOOL)a3;
- (void)setSuggestionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSContactSuggestionOutcomeReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSContactSuggestionOutcomeReported;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSContactSuggestionOutcomeReported *)self suggestionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PLUSSchemaPLUSContactSuggestionOutcomeReported *)self deleteSuggestionId];
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

- (void)setHasSuggestionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)contactSuggestionRedundancyState
{
  return self->_contactSuggestionRedundancyState;
}

- (int)contactSuggestionOutcome
{
  return self->_contactSuggestionOutcome;
}

- (void)setSuggestionId:(id)a3
{
}

- (SISchemaUUID)suggestionId
{
  return self->_suggestionId;
}

- (PLUSSchemaPLUSContactSuggestionOutcomeReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUSSchemaPLUSContactSuggestionOutcomeReported;
  v5 = [(PLUSSchemaPLUSContactSuggestionOutcomeReported *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"suggestionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSContactSuggestionOutcomeReported *)v5 setSuggestionId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"contactSuggestionOutcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggestionOutcomeReported setContactSuggestionOutcome:](v5, "setContactSuggestionOutcome:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"contactSuggestionRedundancyState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggestionOutcomeReported setContactSuggestionRedundancyState:](v5, "setContactSuggestionRedundancyState:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSContactSuggestionOutcomeReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSContactSuggestionOutcomeReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSContactSuggestionOutcomeReported *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v5 = [(PLUSSchemaPLUSContactSuggestionOutcomeReported *)self contactSuggestionOutcome]
       - 1;
    if (v5 > 0xC) {
      v6 = @"PLUSCONTACTSUGGESTIONOUTCOME_UNKNOWN";
    }
    else {
      v6 = off_1E5EB4038[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"contactSuggestionOutcome"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    int v7 = [(PLUSSchemaPLUSContactSuggestionOutcomeReported *)self contactSuggestionRedundancyState];
    v8 = @"PLUSCONTACTSUGGESTIONREDUNDANCYSTATE_UNKNOWN";
    if (v7 == 1) {
      v8 = @"PLUSCONTACTSUGGESTIONREDUNDANCYSTATE_NOT_REDUNDANT";
    }
    if (v7 == 2) {
      objc_super v9 = @"PLUSCONTACTSUGGESTIONREDUNDANCYSTATE_REDUNDANT";
    }
    else {
      objc_super v9 = v8;
    }
    [v3 setObject:v9 forKeyedSubscript:@"contactSuggestionRedundancyState"];
  }
  if (self->_suggestionId)
  {
    v10 = [(PLUSSchemaPLUSContactSuggestionOutcomeReported *)self suggestionId];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"suggestionId"];
    }
    else
    {
      objc_super v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"suggestionId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_suggestionId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_contactSuggestionOutcome;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_contactSuggestionRedundancyState;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  uint64_t v5 = [(PLUSSchemaPLUSContactSuggestionOutcomeReported *)self suggestionId];
  v6 = [v4 suggestionId];
  int v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  uint64_t v8 = [(PLUSSchemaPLUSContactSuggestionOutcomeReported *)self suggestionId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(PLUSSchemaPLUSContactSuggestionOutcomeReported *)self suggestionId];
    v11 = [v4 suggestionId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  $ED18F711CD16110073639DE83DFB4C21 has = self->_has;
  unsigned int v14 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    int contactSuggestionOutcome = self->_contactSuggestionOutcome;
    if (contactSuggestionOutcome == [v4 contactSuggestionOutcome])
    {
      $ED18F711CD16110073639DE83DFB4C21 has = self->_has;
      unsigned int v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_16;
  }
  if (v16)
  {
    int contactSuggestionRedundancyState = self->_contactSuggestionRedundancyState;
    if (contactSuggestionRedundancyState != [v4 contactSuggestionRedundancyState]) {
      goto LABEL_16;
    }
  }
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(PLUSSchemaPLUSContactSuggestionOutcomeReported *)self suggestionId];

  if (v4)
  {
    uint64_t v5 = [(PLUSSchemaPLUSContactSuggestionOutcomeReported *)self suggestionId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  int v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    int v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactSuggestionOutcomeReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteContactSuggestionRedundancyState
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasContactSuggestionRedundancyState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasContactSuggestionRedundancyState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setContactSuggestionRedundancyState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int contactSuggestionRedundancyState = a3;
}

- (void)deleteContactSuggestionOutcome
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasContactSuggestionOutcome:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContactSuggestionOutcome
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setContactSuggestionOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int contactSuggestionOutcome = a3;
}

- (void)deleteSuggestionId
{
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

@end