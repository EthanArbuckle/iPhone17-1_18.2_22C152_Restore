@interface SISchemaDictationAlternativesViewed
- (BOOL)hasAlternativesLocale;
- (BOOL)hasCountOfAlternativesAvailable;
- (BOOL)hasCountOfWordsUnderlined;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaDictationAlternativesViewed)initWithDictionary:(id)a3;
- (SISchemaDictationAlternativesViewed)initWithJSON:(id)a3;
- (SISchemaLocaleIdentifier)alternativesLocale;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)countOfAlternativesAvailable;
- (int)countOfWordsUnderlined;
- (unint64_t)hash;
- (void)deleteAlternativesLocale;
- (void)deleteCountOfAlternativesAvailable;
- (void)deleteCountOfWordsUnderlined;
- (void)setAlternativesLocale:(id)a3;
- (void)setCountOfAlternativesAvailable:(int)a3;
- (void)setCountOfWordsUnderlined:(int)a3;
- (void)setHasAlternativesLocale:(BOOL)a3;
- (void)setHasCountOfAlternativesAvailable:(BOOL)a3;
- (void)setHasCountOfWordsUnderlined:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaDictationAlternativesViewed

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaDictationAlternativesViewed;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaDictationAlternativesViewed *)self alternativesLocale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaDictationAlternativesViewed *)self deleteAlternativesLocale];
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

- (void)setHasAlternativesLocale:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAlternativesLocale:(id)a3
{
}

- (SISchemaLocaleIdentifier)alternativesLocale
{
  return self->_alternativesLocale;
}

- (int)countOfAlternativesAvailable
{
  return self->_countOfAlternativesAvailable;
}

- (int)countOfWordsUnderlined
{
  return self->_countOfWordsUnderlined;
}

- (SISchemaDictationAlternativesViewed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaDictationAlternativesViewed;
  v5 = [(SISchemaDictationAlternativesViewed *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"countOfWordsUnderlined"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDictationAlternativesViewed setCountOfWordsUnderlined:](v5, "setCountOfWordsUnderlined:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"countOfAlternativesAvailable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDictationAlternativesViewed setCountOfAlternativesAvailable:](v5, "setCountOfAlternativesAvailable:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"alternativesLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[SISchemaLocaleIdentifier alloc] initWithDictionary:v8];
      [(SISchemaDictationAlternativesViewed *)v5 setAlternativesLocale:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (SISchemaDictationAlternativesViewed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaDictationAlternativesViewed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaDictationAlternativesViewed *)self dictionaryRepresentation];
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
  if (self->_alternativesLocale)
  {
    id v4 = [(SISchemaDictationAlternativesViewed *)self alternativesLocale];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"alternativesLocale"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"alternativesLocale"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaDictationAlternativesViewed countOfAlternativesAvailable](self, "countOfAlternativesAvailable"));
    [v3 setObject:v8 forKeyedSubscript:@"countOfAlternativesAvailable"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v9 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaDictationAlternativesViewed countOfWordsUnderlined](self, "countOfWordsUnderlined"));
    [v3 setObject:v9 forKeyedSubscript:@"countOfWordsUnderlined"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_countOfWordsUnderlined;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(SISchemaLocaleIdentifier *)self->_alternativesLocale hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_countOfAlternativesAvailable;
  return v3 ^ v2 ^ [(SISchemaLocaleIdentifier *)self->_alternativesLocale hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $83FBF892034EF53FBEC5E7540CE8ED7D has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int countOfWordsUnderlined = self->_countOfWordsUnderlined;
    if (countOfWordsUnderlined != [v4 countOfWordsUnderlined]) {
      goto LABEL_14;
    }
    $83FBF892034EF53FBEC5E7540CE8ED7D has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (int countOfAlternativesAvailable = self->_countOfAlternativesAvailable,
          countOfAlternativesAvailable == [v4 countOfAlternativesAvailable]))
    {
      v10 = [(SISchemaDictationAlternativesViewed *)self alternativesLocale];
      v11 = [v4 alternativesLocale];
      objc_super v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(SISchemaDictationAlternativesViewed *)self alternativesLocale];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(SISchemaDictationAlternativesViewed *)self alternativesLocale];
        v16 = [v4 alternativesLocale];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  v5 = [(SISchemaDictationAlternativesViewed *)self alternativesLocale];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(SISchemaDictationAlternativesViewed *)self alternativesLocale];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDictationAlternativesViewedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAlternativesLocale
{
}

- (BOOL)hasAlternativesLocale
{
  return self->_alternativesLocale != 0;
}

- (void)deleteCountOfAlternativesAvailable
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasCountOfAlternativesAvailable:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCountOfAlternativesAvailable
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCountOfAlternativesAvailable:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int countOfAlternativesAvailable = a3;
}

- (void)deleteCountOfWordsUnderlined
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCountOfWordsUnderlined:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCountOfWordsUnderlined
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCountOfWordsUnderlined:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int countOfWordsUnderlined = a3;
}

@end