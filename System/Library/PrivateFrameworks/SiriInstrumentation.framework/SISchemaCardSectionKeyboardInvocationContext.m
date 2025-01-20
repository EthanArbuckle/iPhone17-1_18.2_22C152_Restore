@interface SISchemaCardSectionKeyboardInvocationContext
- (BOOL)existingText;
- (BOOL)hasExistingText;
- (BOOL)hasKeyboardLocale;
- (BOOL)hasKeyboardPresented;
- (BOOL)isEqual:(id)a3;
- (BOOL)keyboardPresented;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaCardSectionKeyboardInvocationContext)initWithDictionary:(id)a3;
- (SISchemaCardSectionKeyboardInvocationContext)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)keyboardLocale;
- (unint64_t)hash;
- (void)deleteExistingText;
- (void)deleteKeyboardLocale;
- (void)deleteKeyboardPresented;
- (void)setExistingText:(BOOL)a3;
- (void)setHasExistingText:(BOOL)a3;
- (void)setHasKeyboardLocale:(BOOL)a3;
- (void)setHasKeyboardPresented:(BOOL)a3;
- (void)setKeyboardLocale:(int)a3;
- (void)setKeyboardPresented:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaCardSectionKeyboardInvocationContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)existingText
{
  return self->_existingText;
}

- (int)keyboardLocale
{
  return self->_keyboardLocale;
}

- (BOOL)keyboardPresented
{
  return self->_keyboardPresented;
}

- (SISchemaCardSectionKeyboardInvocationContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaCardSectionKeyboardInvocationContext;
  v5 = [(SISchemaCardSectionKeyboardInvocationContext *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"keyboardPresented"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaCardSectionKeyboardInvocationContext setKeyboardPresented:](v5, "setKeyboardPresented:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"keyboardLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaCardSectionKeyboardInvocationContext setKeyboardLocale:](v5, "setKeyboardLocale:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"existingText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaCardSectionKeyboardInvocationContext setExistingText:](v5, "setExistingText:", [v8 BOOLValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (SISchemaCardSectionKeyboardInvocationContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaCardSectionKeyboardInvocationContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaCardSectionKeyboardInvocationContext *)self dictionaryRepresentation];
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
  char v4 = *(&self->_existingText + 1);
  if ((v4 & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaCardSectionKeyboardInvocationContext existingText](self, "existingText"));
    [v3 setObject:v7 forKeyedSubscript:@"existingText"];

    char v4 = *(&self->_existingText + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(&self->_existingText + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v8 = [(SISchemaCardSectionKeyboardInvocationContext *)self keyboardLocale] - 1;
  if (v8 > 0x3D) {
    v9 = @"LOCALE_UNKNOWN_LOCALE";
  }
  else {
    v9 = off_1E5EB5898[v8];
  }
  [v3 setObject:v9 forKeyedSubscript:@"keyboardLocale"];
  if (!*(&self->_existingText + 1)) {
    goto LABEL_5;
  }
LABEL_4:
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaCardSectionKeyboardInvocationContext keyboardPresented](self, "keyboardPresented"));
  [v3 setObject:v5 forKeyedSubscript:@"keyboardPresented"];

LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (!*(&self->_existingText + 1))
  {
    uint64_t v2 = 0;
    if ((*(&self->_existingText + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(&self->_existingText + 1) & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_keyboardPresented;
  if ((*(&self->_existingText + 1) & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_keyboardLocale;
  if ((*(&self->_existingText + 1) & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_existingText;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_existingText + 1);
  unsigned int v6 = v4[17];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (v5)
  {
    int keyboardPresented = self->_keyboardPresented;
    if (keyboardPresented != [v4 keyboardPresented]) {
      goto LABEL_14;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_existingText + 1);
    unsigned int v6 = v4[17];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int keyboardLocale = self->_keyboardLocale;
    if (keyboardLocale == [v4 keyboardLocale])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_existingText + 1);
      unsigned int v6 = v4[17];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    int existingText = self->_existingText;
    if (existingText != [v4 existingText]) {
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
  char v5 = *(&self->_existingText + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char v5 = *(&self->_existingText + 1);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(&self->_existingText + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(&self->_existingText + 1) & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaCardSectionKeyboardInvocationContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteExistingText
{
  *(&self->_existingText + 1) &= ~4u;
}

- (void)setHasExistingText:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_existingText + 1) = *(&self->_existingText + 1) & 0xFB | v3;
}

- (BOOL)hasExistingText
{
  return (*((unsigned __int8 *)&self->_existingText + 1) >> 2) & 1;
}

- (void)setExistingText:(BOOL)a3
{
  *(&self->_existingText + 1) |= 4u;
  self->_int existingText = a3;
}

- (void)deleteKeyboardLocale
{
  *(&self->_existingText + 1) &= ~2u;
}

- (void)setHasKeyboardLocale:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_existingText + 1) = *(&self->_existingText + 1) & 0xFD | v3;
}

- (BOOL)hasKeyboardLocale
{
  return (*((unsigned __int8 *)&self->_existingText + 1) >> 1) & 1;
}

- (void)setKeyboardLocale:(int)a3
{
  *(&self->_existingText + 1) |= 2u;
  self->_int keyboardLocale = a3;
}

- (void)deleteKeyboardPresented
{
  *(&self->_existingText + 1) &= ~1u;
}

- (void)setHasKeyboardPresented:(BOOL)a3
{
  *(&self->_existingText + 1) = *(&self->_existingText + 1) & 0xFE | a3;
}

- (BOOL)hasKeyboardPresented
{
  return *(&self->_existingText + 1);
}

- (void)setKeyboardPresented:(BOOL)a3
{
  *(&self->_existingText + 1) |= 1u;
  self->_int keyboardPresented = a3;
}

@end