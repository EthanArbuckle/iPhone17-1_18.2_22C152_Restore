@interface SISchemaGridCardSection
- (BOOL)hasCardSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)resultIdentifiers;
- (NSData)jsonData;
- (SISchemaGridCardSection)initWithDictionary:(id)a3;
- (SISchemaGridCardSection)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)resultIdentifiersAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)cardSource;
- (unint64_t)hash;
- (unint64_t)resultIdentifiersCount;
- (void)addResultIdentifiers:(id)a3;
- (void)clearResultIdentifiers;
- (void)deleteCardSource;
- (void)setCardSource:(int)a3;
- (void)setHasCardSource:(BOOL)a3;
- (void)setResultIdentifiers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaGridCardSection

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (int)cardSource
{
  return self->_cardSource;
}

- (void)setResultIdentifiers:(id)a3
{
}

- (NSArray)resultIdentifiers
{
  return self->_resultIdentifiers;
}

- (SISchemaGridCardSection)initWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SISchemaGridCardSection;
  v5 = [(SISchemaGridCardSection *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"resultIdentifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = objc_msgSend(v12, "copy", (void)v17);
              [(SISchemaGridCardSection *)v5 addResultIdentifiers:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v9);
      }
    }
    v14 = objc_msgSend(v4, "objectForKeyedSubscript:", @"cardSource", (void)v17);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaGridCardSection setCardSource:](v5, "setCardSource:", [v14 intValue]);
    }
    v15 = v5;
  }
  return v5;
}

- (SISchemaGridCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaGridCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaGridCardSection *)self dictionaryRepresentation];
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
    int v4 = [(SISchemaGridCardSection *)self cardSource];
    v5 = @"CARDSOURCE_UNKNOWN_CARD_SOURCE";
    if (v4 == 1) {
      v5 = @"CARDSOURCE_BING";
    }
    if (v4 == 2) {
      v6 = @"CARDSOURCE_WEB_IMAGE";
    }
    else {
      v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"cardSource"];
  }
  if (self->_resultIdentifiers)
  {
    uint64_t v7 = [(SISchemaGridCardSection *)self resultIdentifiers];
    uint64_t v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"resultIdentifiers"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_resultIdentifiers hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_cardSource;
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
  v5 = [(SISchemaGridCardSection *)self resultIdentifiers];
  v6 = [v4 resultIdentifiers];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(SISchemaGridCardSection *)self resultIdentifiers];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(SISchemaGridCardSection *)self resultIdentifiers];
    uint64_t v11 = [v4 resultIdentifiers];
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
    int cardSource = self->_cardSource;
    if (cardSource != [v4 cardSource]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_resultIdentifiers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaGridCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)deleteCardSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCardSource:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCardSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCardSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int cardSource = a3;
}

- (id)resultIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_resultIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)resultIdentifiersCount
{
  return [(NSArray *)self->_resultIdentifiers count];
}

- (void)addResultIdentifiers:(id)a3
{
  id v4 = a3;
  resultIdentifiers = self->_resultIdentifiers;
  id v8 = v4;
  if (!resultIdentifiers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_resultIdentifiers;
    self->_resultIdentifiers = v6;

    id v4 = v8;
    resultIdentifiers = self->_resultIdentifiers;
  }
  [(NSArray *)resultIdentifiers addObject:v4];
}

- (void)clearResultIdentifiers
{
}

@end