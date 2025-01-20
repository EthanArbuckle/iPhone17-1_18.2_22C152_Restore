@interface SISchemaKeyboardDismissed
- (BOOL)emojiUsed;
- (BOOL)hasEditDistance;
- (BOOL)hasEmojiUsed;
- (BOOL)hasKeyboardLocale;
- (BOOL)hasKeyboardUsed;
- (BOOL)hasLengthInChars;
- (BOOL)hasLengthInWords;
- (BOOL)hasNumCharsAdded;
- (BOOL)hasNumCharsDeleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)keyboardUsed;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaKeyboardDismissed)initWithDictionary:(id)a3;
- (SISchemaKeyboardDismissed)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)editDistance;
- (int)keyboardLocale;
- (int)lengthInChars;
- (int)lengthInWords;
- (int)numCharsAdded;
- (int)numCharsDeleted;
- (unint64_t)hash;
- (void)deleteEditDistance;
- (void)deleteEmojiUsed;
- (void)deleteKeyboardLocale;
- (void)deleteKeyboardUsed;
- (void)deleteLengthInChars;
- (void)deleteLengthInWords;
- (void)deleteNumCharsAdded;
- (void)deleteNumCharsDeleted;
- (void)setEditDistance:(int)a3;
- (void)setEmojiUsed:(BOOL)a3;
- (void)setHasEditDistance:(BOOL)a3;
- (void)setHasEmojiUsed:(BOOL)a3;
- (void)setHasKeyboardLocale:(BOOL)a3;
- (void)setHasKeyboardUsed:(BOOL)a3;
- (void)setHasLengthInChars:(BOOL)a3;
- (void)setHasLengthInWords:(BOOL)a3;
- (void)setHasNumCharsAdded:(BOOL)a3;
- (void)setHasNumCharsDeleted:(BOOL)a3;
- (void)setKeyboardLocale:(int)a3;
- (void)setKeyboardUsed:(BOOL)a3;
- (void)setLengthInChars:(int)a3;
- (void)setLengthInWords:(int)a3;
- (void)setNumCharsAdded:(int)a3;
- (void)setNumCharsDeleted:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaKeyboardDismissed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)keyboardLocale
{
  return self->_keyboardLocale;
}

- (BOOL)emojiUsed
{
  return self->_emojiUsed;
}

- (int)editDistance
{
  return self->_editDistance;
}

- (int)numCharsDeleted
{
  return self->_numCharsDeleted;
}

- (int)numCharsAdded
{
  return self->_numCharsAdded;
}

- (int)lengthInChars
{
  return self->_lengthInChars;
}

- (int)lengthInWords
{
  return self->_lengthInWords;
}

- (BOOL)keyboardUsed
{
  return self->_keyboardUsed;
}

- (SISchemaKeyboardDismissed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SISchemaKeyboardDismissed;
  v5 = [(SISchemaKeyboardDismissed *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"keyboardUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaKeyboardDismissed setKeyboardUsed:](v5, "setKeyboardUsed:", [v6 BOOLValue]);
    }
    v16 = v6;
    v7 = [v4 objectForKeyedSubscript:@"lengthInWords"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaKeyboardDismissed setLengthInWords:](v5, "setLengthInWords:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"lengthInChars"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaKeyboardDismissed setLengthInChars:](v5, "setLengthInChars:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"numCharsAdded"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaKeyboardDismissed setNumCharsAdded:](v5, "setNumCharsAdded:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"numCharsDeleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaKeyboardDismissed setNumCharsDeleted:](v5, "setNumCharsDeleted:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"editDistance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaKeyboardDismissed setEditDistance:](v5, "setEditDistance:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"emojiUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaKeyboardDismissed setEmojiUsed:](v5, "setEmojiUsed:", [v12 BOOLValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"keyboardLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaKeyboardDismissed setKeyboardLocale:](v5, "setKeyboardLocale:", [v13 intValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (SISchemaKeyboardDismissed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaKeyboardDismissed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaKeyboardDismissed *)self dictionaryRepresentation];
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
  if ((has & 0x20) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaKeyboardDismissed editDistance](self, "editDistance"));
    [v3 setObject:v7 forKeyedSubscript:@"editDistance"];

    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaKeyboardDismissed emojiUsed](self, "emojiUsed"));
  [v3 setObject:v8 forKeyedSubscript:@"emojiUsed"];

  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_15:
  unsigned int v9 = [(SISchemaKeyboardDismissed *)self keyboardLocale] - 1;
  if (v9 > 0x3D) {
    v10 = @"LOCALE_UNKNOWN_LOCALE";
  }
  else {
    v10 = off_1E5EB7F90[v9];
  }
  [v3 setObject:v10 forKeyedSubscript:@"keyboardLocale"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaKeyboardDismissed keyboardUsed](self, "keyboardUsed"));
  [v3 setObject:v11 forKeyedSubscript:@"keyboardUsed"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  v12 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaKeyboardDismissed lengthInChars](self, "lengthInChars"));
  [v3 setObject:v12 forKeyedSubscript:@"lengthInChars"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  v13 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaKeyboardDismissed lengthInWords](self, "lengthInWords"));
  [v3 setObject:v13 forKeyedSubscript:@"lengthInWords"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_22:
  v14 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaKeyboardDismissed numCharsAdded](self, "numCharsAdded"));
  [v3 setObject:v14 forKeyedSubscript:@"numCharsAdded"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaKeyboardDismissed numCharsDeleted](self, "numCharsDeleted"));
    [v3 setObject:v5 forKeyedSubscript:@"numCharsDeleted"];
  }
LABEL_10:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_keyboardUsed;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_lengthInWords;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_lengthInChars;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_numCharsAdded;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_numCharsDeleted;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_editDistance;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_emojiUsed;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_keyboardLocale;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  $8E079A7A5CF814B4C0E98CCF88148813 has = self->_has;
  unsigned int v6 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_34;
  }
  if (*(unsigned char *)&has)
  {
    int keyboardUsed = self->_keyboardUsed;
    if (keyboardUsed != [v4 keyboardUsed]) {
      goto LABEL_34;
    }
    $8E079A7A5CF814B4C0E98CCF88148813 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_34;
  }
  if (v8)
  {
    int lengthInWords = self->_lengthInWords;
    if (lengthInWords != [v4 lengthInWords]) {
      goto LABEL_34;
    }
    $8E079A7A5CF814B4C0E98CCF88148813 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_34;
  }
  if (v10)
  {
    int lengthInChars = self->_lengthInChars;
    if (lengthInChars != [v4 lengthInChars]) {
      goto LABEL_34;
    }
    $8E079A7A5CF814B4C0E98CCF88148813 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_34;
  }
  if (v12)
  {
    int numCharsAdded = self->_numCharsAdded;
    if (numCharsAdded != [v4 numCharsAdded]) {
      goto LABEL_34;
    }
    $8E079A7A5CF814B4C0E98CCF88148813 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_34;
  }
  if (v14)
  {
    int numCharsDeleted = self->_numCharsDeleted;
    if (numCharsDeleted != [v4 numCharsDeleted]) {
      goto LABEL_34;
    }
    $8E079A7A5CF814B4C0E98CCF88148813 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_34;
  }
  if (v16)
  {
    int editDistance = self->_editDistance;
    if (editDistance != [v4 editDistance]) {
      goto LABEL_34;
    }
    $8E079A7A5CF814B4C0E98CCF88148813 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_34;
  }
  if (v18)
  {
    int emojiUsed = self->_emojiUsed;
    if (emojiUsed == [v4 emojiUsed])
    {
      $8E079A7A5CF814B4C0E98CCF88148813 has = self->_has;
      unsigned int v6 = v4[40];
      goto LABEL_30;
    }
LABEL_34:
    BOOL v21 = 0;
    goto LABEL_35;
  }
LABEL_30:
  if (((v6 ^ *(_DWORD *)&has) & 0x80) != 0) {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    int keyboardLocale = self->_keyboardLocale;
    if (keyboardLocale != [v4 keyboardLocale]) {
      goto LABEL_34;
    }
  }
  BOOL v21 = 1;
LABEL_35:

  return v21;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((has & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaKeyboardDismissedReadFrom(self, (uint64_t)a3);
}

- (void)deleteKeyboardLocale
{
  *(unsigned char *)&self->_has &= ~0x80u;
}

- (void)setHasKeyboardLocale:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasKeyboardLocale
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setKeyboardLocale:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_int keyboardLocale = a3;
}

- (void)deleteEmojiUsed
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasEmojiUsed:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasEmojiUsed
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setEmojiUsed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_int emojiUsed = a3;
}

- (void)deleteEditDistance
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasEditDistance:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasEditDistance
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setEditDistance:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int editDistance = a3;
}

- (void)deleteNumCharsDeleted
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasNumCharsDeleted:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumCharsDeleted
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setNumCharsDeleted:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int numCharsDeleted = a3;
}

- (void)deleteNumCharsAdded
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasNumCharsAdded:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumCharsAdded
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumCharsAdded:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int numCharsAdded = a3;
}

- (void)deleteLengthInChars
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasLengthInChars:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLengthInChars
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLengthInChars:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int lengthInChars = a3;
}

- (void)deleteLengthInWords
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasLengthInWords:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLengthInWords
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLengthInWords:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int lengthInWords = a3;
}

- (void)deleteKeyboardUsed
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasKeyboardUsed:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKeyboardUsed
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setKeyboardUsed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int keyboardUsed = a3;
}

@end