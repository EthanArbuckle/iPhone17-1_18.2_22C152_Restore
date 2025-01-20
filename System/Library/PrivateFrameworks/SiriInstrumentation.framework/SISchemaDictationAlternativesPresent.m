@interface SISchemaDictationAlternativesPresent
- (BOOL)hasAlternativesLocale;
- (BOOL)hasCountOfWordsUnderlined;
- (BOOL)hasMultilingualIsLowConfidence;
- (BOOL)hasNumberOfUnderlines;
- (BOOL)isEqual:(id)a3;
- (BOOL)multilingualIsLowConfidence;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaDictationAlternativesPresent)initWithDictionary:(id)a3;
- (SISchemaDictationAlternativesPresent)initWithJSON:(id)a3;
- (SISchemaLocaleIdentifier)alternativesLocale;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)countOfWordsUnderlined;
- (int)numberOfUnderlines;
- (unint64_t)hash;
- (void)deleteAlternativesLocale;
- (void)deleteCountOfWordsUnderlined;
- (void)deleteMultilingualIsLowConfidence;
- (void)deleteNumberOfUnderlines;
- (void)setAlternativesLocale:(id)a3;
- (void)setCountOfWordsUnderlined:(int)a3;
- (void)setHasAlternativesLocale:(BOOL)a3;
- (void)setHasCountOfWordsUnderlined:(BOOL)a3;
- (void)setHasMultilingualIsLowConfidence:(BOOL)a3;
- (void)setHasNumberOfUnderlines:(BOOL)a3;
- (void)setMultilingualIsLowConfidence:(BOOL)a3;
- (void)setNumberOfUnderlines:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaDictationAlternativesPresent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaDictationAlternativesPresent;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaDictationAlternativesPresent *)self alternativesLocale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaDictationAlternativesPresent *)self deleteAlternativesLocale];
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
  *(&self->_multilingualIsLowConfidence + 2) = a3;
}

- (BOOL)multilingualIsLowConfidence
{
  return self->_multilingualIsLowConfidence;
}

- (void)setAlternativesLocale:(id)a3
{
}

- (SISchemaLocaleIdentifier)alternativesLocale
{
  return self->_alternativesLocale;
}

- (int)countOfWordsUnderlined
{
  return self->_countOfWordsUnderlined;
}

- (int)numberOfUnderlines
{
  return self->_numberOfUnderlines;
}

- (SISchemaDictationAlternativesPresent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaDictationAlternativesPresent;
  v5 = [(SISchemaDictationAlternativesPresent *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numberOfUnderlines"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDictationAlternativesPresent setNumberOfUnderlines:](v5, "setNumberOfUnderlines:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"countOfWordsUnderlined"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDictationAlternativesPresent setCountOfWordsUnderlined:](v5, "setCountOfWordsUnderlined:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"alternativesLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[SISchemaLocaleIdentifier alloc] initWithDictionary:v8];
      [(SISchemaDictationAlternativesPresent *)v5 setAlternativesLocale:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"multilingualIsLowConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDictationAlternativesPresent setMultilingualIsLowConfidence:](v5, "setMultilingualIsLowConfidence:", [v10 BOOLValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (SISchemaDictationAlternativesPresent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaDictationAlternativesPresent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaDictationAlternativesPresent *)self dictionaryRepresentation];
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
    id v4 = [(SISchemaDictationAlternativesPresent *)self alternativesLocale];
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
  char v7 = *(&self->_multilingualIsLowConfidence + 1);
  if ((v7 & 2) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaDictationAlternativesPresent countOfWordsUnderlined](self, "countOfWordsUnderlined"));
    [v3 setObject:v10 forKeyedSubscript:@"countOfWordsUnderlined"];

    char v7 = *(&self->_multilingualIsLowConfidence + 1);
    if ((v7 & 4) == 0)
    {
LABEL_8:
      if ((v7 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(&self->_multilingualIsLowConfidence + 1) & 4) == 0)
  {
    goto LABEL_8;
  }
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaDictationAlternativesPresent multilingualIsLowConfidence](self, "multilingualIsLowConfidence"));
  [v3 setObject:v11 forKeyedSubscript:@"multilingualIsLowConfidence"];

  if (*(&self->_multilingualIsLowConfidence + 1))
  {
LABEL_9:
    v8 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaDictationAlternativesPresent numberOfUnderlines](self, "numberOfUnderlines"));
    [v3 setObject:v8 forKeyedSubscript:@"numberOfUnderlines"];
  }
LABEL_10:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_multilingualIsLowConfidence + 1))
  {
    uint64_t v3 = 2654435761 * self->_numberOfUnderlines;
    if ((*(&self->_multilingualIsLowConfidence + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(&self->_multilingualIsLowConfidence + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_countOfWordsUnderlined;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(SISchemaLocaleIdentifier *)self->_alternativesLocale hash];
  if ((*(&self->_multilingualIsLowConfidence + 1) & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_multilingualIsLowConfidence;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_multilingualIsLowConfidence + 1);
  unsigned int v6 = v4[25];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_19;
  }
  if (v5)
  {
    int numberOfUnderlines = self->_numberOfUnderlines;
    if (numberOfUnderlines != [v4 numberOfUnderlines])
    {
LABEL_19:
      BOOL v20 = 0;
      goto LABEL_20;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_multilingualIsLowConfidence + 1);
    unsigned int v6 = v4[25];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v8)
  {
    int countOfWordsUnderlined = self->_countOfWordsUnderlined;
    if (countOfWordsUnderlined != [v4 countOfWordsUnderlined]) {
      goto LABEL_19;
    }
  }
  v10 = [(SISchemaDictationAlternativesPresent *)self alternativesLocale];
  v11 = [v4 alternativesLocale];
  v12 = v11;
  if ((v10 == 0) == (v11 != 0))
  {

    goto LABEL_19;
  }
  uint64_t v13 = [(SISchemaDictationAlternativesPresent *)self alternativesLocale];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(SISchemaDictationAlternativesPresent *)self alternativesLocale];
    v16 = [v4 alternativesLocale];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  int v18 = (*((unsigned __int8 *)&self->_multilingualIsLowConfidence + 1) >> 2) & 1;
  if (v18 != ((v4[25] >> 2) & 1)) {
    goto LABEL_19;
  }
  if (v18)
  {
    int multilingualIsLowConfidence = self->_multilingualIsLowConfidence;
    if (multilingualIsLowConfidence != [v4 multilingualIsLowConfidence]) {
      goto LABEL_19;
    }
  }
  BOOL v20 = 1;
LABEL_20:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  char v4 = *(&self->_multilingualIsLowConfidence + 1);
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    char v4 = *(&self->_multilingualIsLowConfidence + 1);
  }
  if ((v4 & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  unsigned int v5 = [(SISchemaDictationAlternativesPresent *)self alternativesLocale];

  if (v5)
  {
    unsigned int v6 = [(SISchemaDictationAlternativesPresent *)self alternativesLocale];
    PBDataWriterWriteSubmessage();
  }
  if ((*(&self->_multilingualIsLowConfidence + 1) & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDictationAlternativesPresentReadFrom(self, (uint64_t)a3);
}

- (void)deleteMultilingualIsLowConfidence
{
  *(&self->_multilingualIsLowConfidence + 1) &= ~4u;
}

- (void)setHasMultilingualIsLowConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_multilingualIsLowConfidence + 1) = *(&self->_multilingualIsLowConfidence + 1) & 0xFB | v3;
}

- (BOOL)hasMultilingualIsLowConfidence
{
  return (*((unsigned __int8 *)&self->_multilingualIsLowConfidence + 1) >> 2) & 1;
}

- (void)setMultilingualIsLowConfidence:(BOOL)a3
{
  *(&self->_multilingualIsLowConfidence + 1) |= 4u;
  self->_int multilingualIsLowConfidence = a3;
}

- (void)deleteAlternativesLocale
{
}

- (BOOL)hasAlternativesLocale
{
  return self->_alternativesLocale != 0;
}

- (void)deleteCountOfWordsUnderlined
{
  *(&self->_multilingualIsLowConfidence + 1) &= ~2u;
}

- (void)setHasCountOfWordsUnderlined:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_multilingualIsLowConfidence + 1) = *(&self->_multilingualIsLowConfidence + 1) & 0xFD | v3;
}

- (BOOL)hasCountOfWordsUnderlined
{
  return (*((unsigned __int8 *)&self->_multilingualIsLowConfidence + 1) >> 1) & 1;
}

- (void)setCountOfWordsUnderlined:(int)a3
{
  *(&self->_multilingualIsLowConfidence + 1) |= 2u;
  self->_int countOfWordsUnderlined = a3;
}

- (void)deleteNumberOfUnderlines
{
  *(&self->_multilingualIsLowConfidence + 1) &= ~1u;
}

- (void)setHasNumberOfUnderlines:(BOOL)a3
{
  *(&self->_multilingualIsLowConfidence + 1) = *(&self->_multilingualIsLowConfidence + 1) & 0xFE | a3;
}

- (BOOL)hasNumberOfUnderlines
{
  return *(&self->_multilingualIsLowConfidence + 1);
}

- (void)setNumberOfUnderlines:(int)a3
{
  *(&self->_multilingualIsLowConfidence + 1) |= 1u;
  self->_int numberOfUnderlines = a3;
}

@end