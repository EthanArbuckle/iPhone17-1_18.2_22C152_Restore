@interface STSchemaSTDisambiguationEnded
- (BOOL)disambiguationDetected;
- (BOOL)hasDisambiguationDetected;
- (BOOL)hasIsContentSearch;
- (BOOL)hasIsOpenQuery;
- (BOOL)hasIsQuestionQuery;
- (BOOL)hasNumOfResults;
- (BOOL)isContentSearch;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOpenQuery;
- (BOOL)isQuestionQuery;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (STSchemaSTDisambiguationEnded)initWithDictionary:(id)a3;
- (STSchemaSTDisambiguationEnded)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)numOfResults;
- (void)deleteDisambiguationDetected;
- (void)deleteIsContentSearch;
- (void)deleteIsOpenQuery;
- (void)deleteIsQuestionQuery;
- (void)deleteNumOfResults;
- (void)setDisambiguationDetected:(BOOL)a3;
- (void)setHasDisambiguationDetected:(BOOL)a3;
- (void)setHasIsContentSearch:(BOOL)a3;
- (void)setHasIsOpenQuery:(BOOL)a3;
- (void)setHasIsQuestionQuery:(BOOL)a3;
- (void)setHasNumOfResults:(BOOL)a3;
- (void)setIsContentSearch:(BOOL)a3;
- (void)setIsOpenQuery:(BOOL)a3;
- (void)setIsQuestionQuery:(BOOL)a3;
- (void)setNumOfResults:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation STSchemaSTDisambiguationEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isContentSearch
{
  return self->_isContentSearch;
}

- (unsigned)numOfResults
{
  return self->_numOfResults;
}

- (BOOL)isOpenQuery
{
  return self->_isOpenQuery;
}

- (BOOL)isQuestionQuery
{
  return self->_isQuestionQuery;
}

- (BOOL)disambiguationDetected
{
  return self->_disambiguationDetected;
}

- (STSchemaSTDisambiguationEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSchemaSTDisambiguationEnded;
  v5 = [(STSchemaSTDisambiguationEnded *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"disambiguationDetected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTDisambiguationEnded setDisambiguationDetected:](v5, "setDisambiguationDetected:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isQuestionQuery"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTDisambiguationEnded setIsQuestionQuery:](v5, "setIsQuestionQuery:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isOpenQuery"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTDisambiguationEnded setIsOpenQuery:](v5, "setIsOpenQuery:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"numOfResults"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTDisambiguationEnded setNumOfResults:](v5, "setNumOfResults:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isContentSearch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTDisambiguationEnded setIsContentSearch:](v5, "setIsContentSearch:", [v10 BOOLValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (STSchemaSTDisambiguationEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(STSchemaSTDisambiguationEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(STSchemaSTDisambiguationEnded *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isContentSearch + 1);
  if (v4)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[STSchemaSTDisambiguationEnded disambiguationDetected](self, "disambiguationDetected"));
    [v3 setObject:v7 forKeyedSubscript:@"disambiguationDetected"];

    char v4 = *(&self->_isContentSearch + 1);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(&self->_isContentSearch + 1) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[STSchemaSTDisambiguationEnded isContentSearch](self, "isContentSearch"));
  [v3 setObject:v8 forKeyedSubscript:@"isContentSearch"];

  char v4 = *(&self->_isContentSearch + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[STSchemaSTDisambiguationEnded isOpenQuery](self, "isOpenQuery"));
  [v3 setObject:v9 forKeyedSubscript:@"isOpenQuery"];

  char v4 = *(&self->_isContentSearch + 1);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[STSchemaSTDisambiguationEnded isQuestionQuery](self, "isQuestionQuery"));
  [v3 setObject:v10 forKeyedSubscript:@"isQuestionQuery"];

  if ((*(&self->_isContentSearch + 1) & 8) != 0)
  {
LABEL_6:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaSTDisambiguationEnded numOfResults](self, "numOfResults"));
    [v3 setObject:v5 forKeyedSubscript:@"numOfResults"];
  }
LABEL_7:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isContentSearch + 1))
  {
    uint64_t v2 = 2654435761 * self->_disambiguationDetected;
    if ((*(&self->_isContentSearch + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_isQuestionQuery;
      if ((*(&self->_isContentSearch + 1) & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(&self->_isContentSearch + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(&self->_isContentSearch + 1) & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_isOpenQuery;
    if ((*(&self->_isContentSearch + 1) & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(&self->_isContentSearch + 1) & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(&self->_isContentSearch + 1) & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_numOfResults;
  if ((*(&self->_isContentSearch + 1) & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_isContentSearch;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isContentSearch + 1);
  unsigned int v6 = v4[17];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (v5)
  {
    int disambiguationDetected = self->_disambiguationDetected;
    if (disambiguationDetected != [v4 disambiguationDetected]) {
      goto LABEL_22;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isContentSearch + 1);
    unsigned int v6 = v4[17];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_22;
  }
  if (v8)
  {
    int isQuestionQuery = self->_isQuestionQuery;
    if (isQuestionQuery != [v4 isQuestionQuery]) {
      goto LABEL_22;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isContentSearch + 1);
    unsigned int v6 = v4[17];
  }
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_22;
  }
  if (v10)
  {
    int isOpenQuery = self->_isOpenQuery;
    if (isOpenQuery != [v4 isOpenQuery]) {
      goto LABEL_22;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isContentSearch + 1);
    unsigned int v6 = v4[17];
  }
  int v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_22;
  }
  if (v12)
  {
    unsigned int numOfResults = self->_numOfResults;
    if (numOfResults == [v4 numOfResults])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_isContentSearch + 1);
      unsigned int v6 = v4[17];
      goto LABEL_18;
    }
LABEL_22:
    BOOL v16 = 0;
    goto LABEL_23;
  }
LABEL_18:
  int v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_22;
  }
  if (v14)
  {
    int isContentSearch = self->_isContentSearch;
    if (isContentSearch != [v4 isContentSearch]) {
      goto LABEL_22;
    }
  }
  BOOL v16 = 1;
LABEL_23:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char v4 = *(&self->_isContentSearch + 1);
  if (v4)
  {
    PBDataWriterWriteBOOLField();
    char v4 = *(&self->_isContentSearch + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(&self->_isContentSearch + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isContentSearch + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isContentSearch + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  if ((*(&self->_isContentSearch + 1) & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return STSchemaSTDisambiguationEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsContentSearch
{
  *(&self->_isContentSearch + 1) &= ~0x10u;
}

- (void)setHasIsContentSearch:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isContentSearch + 1) = *(&self->_isContentSearch + 1) & 0xEF | v3;
}

- (BOOL)hasIsContentSearch
{
  return (*((unsigned __int8 *)&self->_isContentSearch + 1) >> 4) & 1;
}

- (void)setIsContentSearch:(BOOL)a3
{
  *(&self->_isContentSearch + 1) |= 0x10u;
  self->_int isContentSearch = a3;
}

- (void)deleteNumOfResults
{
  *(&self->_isContentSearch + 1) &= ~8u;
}

- (void)setHasNumOfResults:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isContentSearch + 1) = *(&self->_isContentSearch + 1) & 0xF7 | v3;
}

- (BOOL)hasNumOfResults
{
  return (*((unsigned __int8 *)&self->_isContentSearch + 1) >> 3) & 1;
}

- (void)setNumOfResults:(unsigned int)a3
{
  *(&self->_isContentSearch + 1) |= 8u;
  self->_unsigned int numOfResults = a3;
}

- (void)deleteIsOpenQuery
{
  *(&self->_isContentSearch + 1) &= ~4u;
}

- (void)setHasIsOpenQuery:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isContentSearch + 1) = *(&self->_isContentSearch + 1) & 0xFB | v3;
}

- (BOOL)hasIsOpenQuery
{
  return (*((unsigned __int8 *)&self->_isContentSearch + 1) >> 2) & 1;
}

- (void)setIsOpenQuery:(BOOL)a3
{
  *(&self->_isContentSearch + 1) |= 4u;
  self->_int isOpenQuery = a3;
}

- (void)deleteIsQuestionQuery
{
  *(&self->_isContentSearch + 1) &= ~2u;
}

- (void)setHasIsQuestionQuery:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isContentSearch + 1) = *(&self->_isContentSearch + 1) & 0xFD | v3;
}

- (BOOL)hasIsQuestionQuery
{
  return (*((unsigned __int8 *)&self->_isContentSearch + 1) >> 1) & 1;
}

- (void)setIsQuestionQuery:(BOOL)a3
{
  *(&self->_isContentSearch + 1) |= 2u;
  self->_int isQuestionQuery = a3;
}

- (void)deleteDisambiguationDetected
{
  *(&self->_isContentSearch + 1) &= ~1u;
}

- (void)setHasDisambiguationDetected:(BOOL)a3
{
  *(&self->_isContentSearch + 1) = *(&self->_isContentSearch + 1) & 0xFE | a3;
}

- (BOOL)hasDisambiguationDetected
{
  return *(&self->_isContentSearch + 1);
}

- (void)setDisambiguationDetected:(BOOL)a3
{
  *(&self->_isContentSearch + 1) |= 1u;
  self->_int disambiguationDetected = a3;
}

@end