@interface SISchemaUUFRCasinoCardSelected
- (BOOL)hasCardSectionId;
- (BOOL)hasOrdinalCardSectionPosition;
- (BOOL)hasSnippetAceId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)cardSectionId;
- (NSString)snippetAceId;
- (SISchemaUUFRCasinoCardSelected)initWithDictionary:(id)a3;
- (SISchemaUUFRCasinoCardSelected)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)ordinalCardSectionPosition;
- (unint64_t)hash;
- (void)deleteCardSectionId;
- (void)deleteOrdinalCardSectionPosition;
- (void)deleteSnippetAceId;
- (void)setCardSectionId:(id)a3;
- (void)setHasCardSectionId:(BOOL)a3;
- (void)setHasOrdinalCardSectionPosition:(BOOL)a3;
- (void)setHasSnippetAceId:(BOOL)a3;
- (void)setOrdinalCardSectionPosition:(int)a3;
- (void)setSnippetAceId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUUFRCasinoCardSelected

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetAceId, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);
}

- (void)setHasSnippetAceId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasCardSectionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setSnippetAceId:(id)a3
{
}

- (NSString)snippetAceId
{
  return self->_snippetAceId;
}

- (int)ordinalCardSectionPosition
{
  return self->_ordinalCardSectionPosition;
}

- (void)setCardSectionId:(id)a3
{
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (SISchemaUUFRCasinoCardSelected)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaUUFRCasinoCardSelected;
  v5 = [(SISchemaUUFRCasinoCardSelected *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"cardSectionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaUUFRCasinoCardSelected *)v5 setCardSectionId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"ordinalCardSectionPosition"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUUFRCasinoCardSelected setOrdinalCardSectionPosition:](v5, "setOrdinalCardSectionPosition:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"snippetAceId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(SISchemaUUFRCasinoCardSelected *)v5 setSnippetAceId:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (SISchemaUUFRCasinoCardSelected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUUFRCasinoCardSelected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUUFRCasinoCardSelected *)self dictionaryRepresentation];
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
  if (self->_cardSectionId)
  {
    id v4 = [(SISchemaUUFRCasinoCardSelected *)self cardSectionId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"cardSectionId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaUUFRCasinoCardSelected ordinalCardSectionPosition](self, "ordinalCardSectionPosition"));
    [v3 setObject:v6 forKeyedSubscript:@"ordinalCardSectionPosition"];
  }
  if (self->_snippetAceId)
  {
    uint64_t v7 = [(SISchemaUUFRCasinoCardSelected *)self snippetAceId];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"snippetAceId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_cardSectionId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_ordinalCardSectionPosition;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_snippetAceId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(SISchemaUUFRCasinoCardSelected *)self cardSectionId];
  v6 = [v4 cardSectionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(SISchemaUUFRCasinoCardSelected *)self cardSectionId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(SISchemaUUFRCasinoCardSelected *)self cardSectionId];
    v10 = [v4 cardSectionId];
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
    int ordinalCardSectionPosition = self->_ordinalCardSectionPosition;
    if (ordinalCardSectionPosition != [v4 ordinalCardSectionPosition]) {
      goto LABEL_15;
    }
  }
  v5 = [(SISchemaUUFRCasinoCardSelected *)self snippetAceId];
  v6 = [v4 snippetAceId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(SISchemaUUFRCasinoCardSelected *)self snippetAceId];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(SISchemaUUFRCasinoCardSelected *)self snippetAceId];
    v16 = [v4 snippetAceId];
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
  id v7 = a3;
  uint64_t v4 = [(SISchemaUUFRCasinoCardSelected *)self cardSectionId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v5 = [(SISchemaUUFRCasinoCardSelected *)self snippetAceId];

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUUFRCasinoCardSelectedReadFrom(self, (uint64_t)a3);
}

- (void)deleteSnippetAceId
{
}

- (BOOL)hasSnippetAceId
{
  return self->_snippetAceId != 0;
}

- (void)deleteOrdinalCardSectionPosition
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasOrdinalCardSectionPosition:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOrdinalCardSectionPosition
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOrdinalCardSectionPosition:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int ordinalCardSectionPosition = a3;
}

- (void)deleteCardSectionId
{
}

- (BOOL)hasCardSectionId
{
  return self->_cardSectionId != 0;
}

@end