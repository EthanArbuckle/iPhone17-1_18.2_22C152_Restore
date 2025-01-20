@interface STSchemaLLMQUQueryArguments
- (BOOL)hasIsQuestionNeedingAnswer;
- (BOOL)hasLinkId;
- (BOOL)hasSortOrder;
- (BOOL)isEqual:(id)a3;
- (BOOL)isQuestionNeedingAnswer;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (STSchemaLLMQUQueryArguments)initWithDictionary:(id)a3;
- (STSchemaLLMQUQueryArguments)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)sortOrder;
- (unint64_t)hash;
- (void)deleteIsQuestionNeedingAnswer;
- (void)deleteLinkId;
- (void)deleteSortOrder;
- (void)setHasIsQuestionNeedingAnswer:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasSortOrder:(BOOL)a3;
- (void)setIsQuestionNeedingAnswer:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setSortOrder:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation STSchemaLLMQUQueryArguments

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)STSchemaLLMQUQueryArguments;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(STSchemaLLMQUQueryArguments *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(STSchemaLLMQUQueryArguments *)self deleteLinkId];
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

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)sortOrder
{
  return self->_sortOrder;
}

- (BOOL)isQuestionNeedingAnswer
{
  return self->_isQuestionNeedingAnswer;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (STSchemaLLMQUQueryArguments)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STSchemaLLMQUQueryArguments;
  v5 = [(STSchemaLLMQUQueryArguments *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(STSchemaLLMQUQueryArguments *)v5 setLinkId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"isQuestionNeedingAnswer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaLLMQUQueryArguments setIsQuestionNeedingAnswer:](v5, "setIsQuestionNeedingAnswer:", [v8 BOOLValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"sortOrder"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaLLMQUQueryArguments setSortOrder:](v5, "setSortOrder:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (STSchemaLLMQUQueryArguments)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(STSchemaLLMQUQueryArguments *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(STSchemaLLMQUQueryArguments *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[STSchemaLLMQUQueryArguments isQuestionNeedingAnswer](self, "isQuestionNeedingAnswer"));
    [v3 setObject:v4 forKeyedSubscript:@"isQuestionNeedingAnswer"];
  }
  if (self->_linkId)
  {
    v5 = [(STSchemaLLMQUQueryArguments *)self linkId];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"linkId"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"linkId"];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v8 = [(STSchemaLLMQUQueryArguments *)self sortOrder] - 1;
    if (v8 > 2) {
      objc_super v9 = @"STLLMQUMODELSORTORDER_UNKNOWN";
    }
    else {
      objc_super v9 = off_1E5EC0C40[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"sortOrder"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_isQuestionNeedingAnswer;
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
  uint64_t v5 = 2654435761 * self->_sortOrder;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  uint64_t v5 = [(STSchemaLLMQUQueryArguments *)self linkId];
  v6 = [v4 linkId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  uint64_t v8 = [(STSchemaLLMQUQueryArguments *)self linkId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(STSchemaLLMQUQueryArguments *)self linkId];
    v11 = [v4 linkId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  $56523FA826F91258D103FE3349D1446C has = self->_has;
  unsigned int v14 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    int isQuestionNeedingAnswer = self->_isQuestionNeedingAnswer;
    if (isQuestionNeedingAnswer == [v4 isQuestionNeedingAnswer])
    {
      $56523FA826F91258D103FE3349D1446C has = self->_has;
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
    int sortOrder = self->_sortOrder;
    if (sortOrder != [v4 sortOrder]) {
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
  uint64_t v4 = [(STSchemaLLMQUQueryArguments *)self linkId];

  if (v4)
  {
    uint64_t v5 = [(STSchemaLLMQUQueryArguments *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  uint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return STSchemaLLMQUQueryArgumentsReadFrom(self, (uint64_t)a3);
}

- (void)deleteSortOrder
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSortOrder:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSortOrder
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSortOrder:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int sortOrder = a3;
}

- (void)deleteIsQuestionNeedingAnswer
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsQuestionNeedingAnswer:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsQuestionNeedingAnswer
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsQuestionNeedingAnswer:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isQuestionNeedingAnswer = a3;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end