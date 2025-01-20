@interface SISchemaDictationAlternativeSelected
- (BOOL)hasAlternativeListPosition;
- (BOOL)hasAlternativesLocale;
- (BOOL)hasCountOfAlternativesAvailable;
- (BOOL)hasCountOfWordsReplaced;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaDictationAlternativeSelected)initWithDictionary:(id)a3;
- (SISchemaDictationAlternativeSelected)initWithJSON:(id)a3;
- (SISchemaLocaleIdentifier)alternativesLocale;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)alternativeListPosition;
- (int)countOfAlternativesAvailable;
- (int)countOfWordsReplaced;
- (unint64_t)hash;
- (void)deleteAlternativeListPosition;
- (void)deleteAlternativesLocale;
- (void)deleteCountOfAlternativesAvailable;
- (void)deleteCountOfWordsReplaced;
- (void)setAlternativeListPosition:(int)a3;
- (void)setAlternativesLocale:(id)a3;
- (void)setCountOfAlternativesAvailable:(int)a3;
- (void)setCountOfWordsReplaced:(int)a3;
- (void)setHasAlternativeListPosition:(BOOL)a3;
- (void)setHasAlternativesLocale:(BOOL)a3;
- (void)setHasCountOfAlternativesAvailable:(BOOL)a3;
- (void)setHasCountOfWordsReplaced:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaDictationAlternativeSelected

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaDictationAlternativeSelected;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaDictationAlternativeSelected *)self alternativesLocale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaDictationAlternativeSelected *)self deleteAlternativesLocale];
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

- (int)alternativeListPosition
{
  return self->_alternativeListPosition;
}

- (int)countOfAlternativesAvailable
{
  return self->_countOfAlternativesAvailable;
}

- (int)countOfWordsReplaced
{
  return self->_countOfWordsReplaced;
}

- (SISchemaDictationAlternativeSelected)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaDictationAlternativeSelected;
  v5 = [(SISchemaDictationAlternativeSelected *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"countOfWordsReplaced"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDictationAlternativeSelected setCountOfWordsReplaced:](v5, "setCountOfWordsReplaced:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"countOfAlternativesAvailable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDictationAlternativeSelected setCountOfAlternativesAvailable:](v5, "setCountOfAlternativesAvailable:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"alternativeListPosition"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDictationAlternativeSelected setAlternativeListPosition:](v5, "setAlternativeListPosition:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"alternativesLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[SISchemaLocaleIdentifier alloc] initWithDictionary:v9];
      [(SISchemaDictationAlternativeSelected *)v5 setAlternativesLocale:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (SISchemaDictationAlternativeSelected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaDictationAlternativeSelected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaDictationAlternativeSelected *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaDictationAlternativeSelected alternativeListPosition](self, "alternativeListPosition"));
    [v3 setObject:v4 forKeyedSubscript:@"alternativeListPosition"];
  }
  if (self->_alternativesLocale)
  {
    v5 = [(SISchemaDictationAlternativeSelected *)self alternativesLocale];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"alternativesLocale"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"alternativesLocale"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v9 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaDictationAlternativeSelected countOfAlternativesAvailable](self, "countOfAlternativesAvailable"));
    [v3 setObject:v9 forKeyedSubscript:@"countOfAlternativesAvailable"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v10 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaDictationAlternativeSelected countOfWordsReplaced](self, "countOfWordsReplaced"));
    [v3 setObject:v10 forKeyedSubscript:@"countOfWordsReplaced"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(SISchemaLocaleIdentifier *)self->_alternativesLocale hash];
  }
  uint64_t v2 = 2654435761 * self->_countOfWordsReplaced;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_countOfAlternativesAvailable;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_alternativeListPosition;
  return v3 ^ v2 ^ v4 ^ [(SISchemaLocaleIdentifier *)self->_alternativesLocale hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $57E0D4034926CE1C336FC15362044B9E has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    int countOfWordsReplaced = self->_countOfWordsReplaced;
    if (countOfWordsReplaced != [v4 countOfWordsReplaced]) {
      goto LABEL_18;
    }
    $57E0D4034926CE1C336FC15362044B9E has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int countOfAlternativesAvailable = self->_countOfAlternativesAvailable;
      if (countOfAlternativesAvailable != [v4 countOfAlternativesAvailable]) {
        goto LABEL_18;
      }
      $57E0D4034926CE1C336FC15362044B9E has = self->_has;
      unsigned int v6 = v4[32];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (!v10
        || (int alternativeListPosition = self->_alternativeListPosition,
            alternativeListPosition == [v4 alternativeListPosition]))
      {
        v12 = [(SISchemaDictationAlternativeSelected *)self alternativesLocale];
        objc_super v13 = [v4 alternativesLocale];
        v14 = v13;
        if ((v12 == 0) != (v13 != 0))
        {
          uint64_t v15 = [(SISchemaDictationAlternativeSelected *)self alternativesLocale];
          if (!v15)
          {

LABEL_21:
            BOOL v20 = 1;
            goto LABEL_19;
          }
          v16 = (void *)v15;
          v17 = [(SISchemaDictationAlternativeSelected *)self alternativesLocale];
          v18 = [v4 alternativesLocale];
          char v19 = [v17 isEqual:v18];

          if (v19) {
            goto LABEL_21;
          }
        }
        else
        {
        }
      }
    }
  }
LABEL_18:
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
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
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  v5 = [(SISchemaDictationAlternativeSelected *)self alternativesLocale];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(SISchemaDictationAlternativeSelected *)self alternativesLocale];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDictationAlternativeSelectedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAlternativesLocale
{
}

- (BOOL)hasAlternativesLocale
{
  return self->_alternativesLocale != 0;
}

- (void)deleteAlternativeListPosition
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasAlternativeListPosition:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAlternativeListPosition
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAlternativeListPosition:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int alternativeListPosition = a3;
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

- (void)deleteCountOfWordsReplaced
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCountOfWordsReplaced:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCountOfWordsReplaced
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCountOfWordsReplaced:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int countOfWordsReplaced = a3;
}

@end