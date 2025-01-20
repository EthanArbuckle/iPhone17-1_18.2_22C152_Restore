@interface SISchemaUEIDictationEnablementPromptShown
- (BOOL)hasIsDictationEnabled;
- (BOOL)hasIsLearnMoreButtonClicked;
- (BOOL)hasPromptVisibilityDurationInMs;
- (BOOL)isDictationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLearnMoreButtonClicked;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUEIDictationEnablementPromptShown)initWithDictionary:(id)a3;
- (SISchemaUEIDictationEnablementPromptShown)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)promptVisibilityDurationInMs;
- (unint64_t)hash;
- (void)deleteIsDictationEnabled;
- (void)deleteIsLearnMoreButtonClicked;
- (void)deletePromptVisibilityDurationInMs;
- (void)setHasIsDictationEnabled:(BOOL)a3;
- (void)setHasIsLearnMoreButtonClicked:(BOOL)a3;
- (void)setHasPromptVisibilityDurationInMs:(BOOL)a3;
- (void)setIsDictationEnabled:(BOOL)a3;
- (void)setIsLearnMoreButtonClicked:(BOOL)a3;
- (void)setPromptVisibilityDurationInMs:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEIDictationEnablementPromptShown

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int64_t)promptVisibilityDurationInMs
{
  return self->_promptVisibilityDurationInMs;
}

- (BOOL)isLearnMoreButtonClicked
{
  return self->_isLearnMoreButtonClicked;
}

- (BOOL)isDictationEnabled
{
  return self->_isDictationEnabled;
}

- (SISchemaUEIDictationEnablementPromptShown)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaUEIDictationEnablementPromptShown;
  v5 = [(SISchemaUEIDictationEnablementPromptShown *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isDictationEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationEnablementPromptShown setIsDictationEnabled:](v5, "setIsDictationEnabled:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isLearnMoreButtonClicked"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationEnablementPromptShown setIsLearnMoreButtonClicked:](v5, "setIsLearnMoreButtonClicked:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"promptVisibilityDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationEnablementPromptShown setPromptVisibilityDurationInMs:](v5, "setPromptVisibilityDurationInMs:", [v8 longLongValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (SISchemaUEIDictationEnablementPromptShown)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEIDictationEnablementPromptShown *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEIDictationEnablementPromptShown *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaUEIDictationEnablementPromptShown isDictationEnabled](self, "isDictationEnabled"));
    [v3 setObject:v7 forKeyedSubscript:@"isDictationEnabled"];

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
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaUEIDictationEnablementPromptShown isLearnMoreButtonClicked](self, "isLearnMoreButtonClicked"));
  [v3 setObject:v8 forKeyedSubscript:@"isLearnMoreButtonClicked"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SISchemaUEIDictationEnablementPromptShown promptVisibilityDurationInMs](self, "promptVisibilityDurationInMs"));
    [v3 setObject:v5 forKeyedSubscript:@"promptVisibilityDurationInMs"];
  }
LABEL_5:
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
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_isDictationEnabled;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isLearnMoreButtonClicked;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_promptVisibilityDurationInMs;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $A1C998D2129E9794F21ED285BB4521A3 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int isDictationEnabled = self->_isDictationEnabled;
    if (isDictationEnabled != [v4 isDictationEnabled]) {
      goto LABEL_14;
    }
    $A1C998D2129E9794F21ED285BB4521A3 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int isLearnMoreButtonClicked = self->_isLearnMoreButtonClicked;
    if (isLearnMoreButtonClicked == [v4 isLearnMoreButtonClicked])
    {
      $A1C998D2129E9794F21ED285BB4521A3 has = self->_has;
      unsigned int v6 = v4[24];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    int64_t promptVisibilityDurationInMs = self->_promptVisibilityDurationInMs;
    if (promptVisibilityDurationInMs != [v4 promptVisibilityDurationInMs]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
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
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIDictationEnablementPromptShownReadFrom(self, (uint64_t)a3);
}

- (void)deletePromptVisibilityDurationInMs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasPromptVisibilityDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPromptVisibilityDurationInMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPromptVisibilityDurationInMs:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int64_t promptVisibilityDurationInMs = a3;
}

- (void)deleteIsLearnMoreButtonClicked
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsLearnMoreButtonClicked:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsLearnMoreButtonClicked
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsLearnMoreButtonClicked:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isLearnMoreButtonClicked = a3;
}

- (void)deleteIsDictationEnabled
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsDictationEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsDictationEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsDictationEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isDictationEnabled = a3;
}

@end