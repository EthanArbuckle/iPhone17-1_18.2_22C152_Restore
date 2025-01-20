@interface PLUSSchemaPLUSContactSuggestionRemoved
- (BOOL)hasReason;
- (BOOL)hasRemovedSuggestion;
- (BOOL)hasUsageSummary;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSContactSuggestion)removedSuggestion;
- (PLUSSchemaPLUSContactSuggestionRemoved)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSContactSuggestionRemoved)initWithJSON:(id)a3;
- (PLUSSchemaPLUSContactSuggestionUsageSummary)usageSummary;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)reason;
- (unint64_t)hash;
- (void)deleteReason;
- (void)deleteRemovedSuggestion;
- (void)deleteUsageSummary;
- (void)setHasReason:(BOOL)a3;
- (void)setHasRemovedSuggestion:(BOOL)a3;
- (void)setHasUsageSummary:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)setRemovedSuggestion:(id)a3;
- (void)setUsageSummary:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSContactSuggestionRemoved

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLUSSchemaPLUSContactSuggestionRemoved;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSContactSuggestionRemoved *)self removedSuggestion];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSContactSuggestionRemoved *)self deleteRemovedSuggestion];
  }
  v9 = [(PLUSSchemaPLUSContactSuggestionRemoved *)self usageSummary];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PLUSSchemaPLUSContactSuggestionRemoved *)self deleteUsageSummary];
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
  objc_storeStrong((id *)&self->_usageSummary, 0);
  objc_storeStrong((id *)&self->_removedSuggestion, 0);
}

- (void)setHasUsageSummary:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasRemovedSuggestion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setUsageSummary:(id)a3
{
}

- (PLUSSchemaPLUSContactSuggestionUsageSummary)usageSummary
{
  return self->_usageSummary;
}

- (int)reason
{
  return self->_reason;
}

- (void)setRemovedSuggestion:(id)a3
{
}

- (PLUSSchemaPLUSContactSuggestion)removedSuggestion
{
  return self->_removedSuggestion;
}

- (PLUSSchemaPLUSContactSuggestionRemoved)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLUSSchemaPLUSContactSuggestionRemoved;
  v5 = [(PLUSSchemaPLUSContactSuggestionRemoved *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"removedSuggestion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PLUSSchemaPLUSContactSuggestion alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSContactSuggestionRemoved *)v5 setRemovedSuggestion:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggestionRemoved setReason:](v5, "setReason:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"usageSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[PLUSSchemaPLUSContactSuggestionUsageSummary alloc] initWithDictionary:v9];
      [(PLUSSchemaPLUSContactSuggestionRemoved *)v5 setUsageSummary:v10];
    }
    int v11 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSContactSuggestionRemoved)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSContactSuggestionRemoved *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSContactSuggestionRemoved *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(PLUSSchemaPLUSContactSuggestionRemoved *)self reason] - 1;
    if (v4 > 5) {
      v5 = @"PLUSCONTACTSUGGESTIONREMOVALREASON_UNKNOWN";
    }
    else {
      v5 = off_1E5EB9D88[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"reason"];
  }
  if (self->_removedSuggestion)
  {
    v6 = [(PLUSSchemaPLUSContactSuggestionRemoved *)self removedSuggestion];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"removedSuggestion"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"removedSuggestion"];
    }
  }
  if (self->_usageSummary)
  {
    v9 = [(PLUSSchemaPLUSContactSuggestionRemoved *)self usageSummary];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"usageSummary"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"usageSummary"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PLUSSchemaPLUSContactSuggestion *)self->_removedSuggestion hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_reason;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(PLUSSchemaPLUSContactSuggestionUsageSummary *)self->_usageSummary hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(PLUSSchemaPLUSContactSuggestionRemoved *)self removedSuggestion];
  v6 = [v4 removedSuggestion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(PLUSSchemaPLUSContactSuggestionRemoved *)self removedSuggestion];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PLUSSchemaPLUSContactSuggestionRemoved *)self removedSuggestion];
    v10 = [v4 removedSuggestion];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int reason = self->_reason;
    if (reason != [v4 reason]) {
      goto LABEL_15;
    }
  }
  v5 = [(PLUSSchemaPLUSContactSuggestionRemoved *)self usageSummary];
  v6 = [v4 usageSummary];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(PLUSSchemaPLUSContactSuggestionRemoved *)self usageSummary];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(PLUSSchemaPLUSContactSuggestionRemoved *)self usageSummary];
    v16 = [v4 usageSummary];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(PLUSSchemaPLUSContactSuggestionRemoved *)self removedSuggestion];

  if (v4)
  {
    v5 = [(PLUSSchemaPLUSContactSuggestionRemoved *)self removedSuggestion];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v6 = [(PLUSSchemaPLUSContactSuggestionRemoved *)self usageSummary];

  uint64_t v7 = v9;
  if (v6)
  {
    int v8 = [(PLUSSchemaPLUSContactSuggestionRemoved *)self usageSummary];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactSuggestionRemovedReadFrom(self, (uint64_t)a3);
}

- (void)deleteUsageSummary
{
}

- (BOOL)hasUsageSummary
{
  return self->_usageSummary != 0;
}

- (void)deleteReason
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int reason = a3;
}

- (void)deleteRemovedSuggestion
{
}

- (BOOL)hasRemovedSuggestion
{
  return self->_removedSuggestion != 0;
}

@end