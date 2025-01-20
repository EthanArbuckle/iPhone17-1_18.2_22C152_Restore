@interface USOSchemaUSOUtteranceSpan
- (BOOL)hasEndIndex;
- (BOOL)hasEndMilliseconds;
- (BOOL)hasEndUnicodeScalarIndex;
- (BOOL)hasStartIndex;
- (BOOL)hasStartMilliseconds;
- (BOOL)hasStartUnicodeScalarIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (USOSchemaUSOUtteranceSpan)initWithDictionary:(id)a3;
- (USOSchemaUSOUtteranceSpan)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)endMilliseconds;
- (int)startMilliseconds;
- (unint64_t)hash;
- (unsigned)endIndex;
- (unsigned)endUnicodeScalarIndex;
- (unsigned)startIndex;
- (unsigned)startUnicodeScalarIndex;
- (void)deleteEndIndex;
- (void)deleteEndMilliseconds;
- (void)deleteEndUnicodeScalarIndex;
- (void)deleteStartIndex;
- (void)deleteStartMilliseconds;
- (void)deleteStartUnicodeScalarIndex;
- (void)setEndIndex:(unsigned int)a3;
- (void)setEndMilliseconds:(int)a3;
- (void)setEndUnicodeScalarIndex:(unsigned int)a3;
- (void)setHasEndIndex:(BOOL)a3;
- (void)setHasEndMilliseconds:(BOOL)a3;
- (void)setHasEndUnicodeScalarIndex:(BOOL)a3;
- (void)setHasStartIndex:(BOOL)a3;
- (void)setHasStartMilliseconds:(BOOL)a3;
- (void)setHasStartUnicodeScalarIndex:(BOOL)a3;
- (void)setStartIndex:(unsigned int)a3;
- (void)setStartMilliseconds:(int)a3;
- (void)setStartUnicodeScalarIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation USOSchemaUSOUtteranceSpan

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)endMilliseconds
{
  return self->_endMilliseconds;
}

- (int)startMilliseconds
{
  return self->_startMilliseconds;
}

- (unsigned)endUnicodeScalarIndex
{
  return self->_endUnicodeScalarIndex;
}

- (unsigned)startUnicodeScalarIndex
{
  return self->_startUnicodeScalarIndex;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (unsigned)startIndex
{
  return self->_startIndex;
}

- (USOSchemaUSOUtteranceSpan)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USOSchemaUSOUtteranceSpan;
  v5 = [(USOSchemaUSOUtteranceSpan *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"startIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOUtteranceSpan setStartIndex:](v5, "setStartIndex:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"endIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOUtteranceSpan setEndIndex:](v5, "setEndIndex:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"startUnicodeScalarIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOUtteranceSpan setStartUnicodeScalarIndex:](v5, "setStartUnicodeScalarIndex:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"endUnicodeScalarIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOUtteranceSpan setEndUnicodeScalarIndex:](v5, "setEndUnicodeScalarIndex:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"startMilliseconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOUtteranceSpan setStartMilliseconds:](v5, "setStartMilliseconds:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"endMilliseconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOUtteranceSpan setEndMilliseconds:](v5, "setEndMilliseconds:", [v11 intValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (USOSchemaUSOUtteranceSpan)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USOSchemaUSOUtteranceSpan *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USOSchemaUSOUtteranceSpan *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOUtteranceSpan endIndex](self, "endIndex"));
    [v3 setObject:v7 forKeyedSubscript:@"endIndex"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[USOSchemaUSOUtteranceSpan endMilliseconds](self, "endMilliseconds"));
  [v3 setObject:v8 forKeyedSubscript:@"endMilliseconds"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOUtteranceSpan endUnicodeScalarIndex](self, "endUnicodeScalarIndex"));
  [v3 setObject:v9 forKeyedSubscript:@"endUnicodeScalarIndex"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOUtteranceSpan startIndex](self, "startIndex"));
  [v3 setObject:v10 forKeyedSubscript:@"startIndex"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v11 = objc_msgSend(NSNumber, "numberWithInt:", -[USOSchemaUSOUtteranceSpan startMilliseconds](self, "startMilliseconds"));
  [v3 setObject:v11 forKeyedSubscript:@"startMilliseconds"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOUtteranceSpan startUnicodeScalarIndex](self, "startUnicodeScalarIndex"));
    [v3 setObject:v5 forKeyedSubscript:@"startUnicodeScalarIndex"];
  }
LABEL_8:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_startIndex;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_endIndex;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
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
    uint64_t v4 = 2654435761 * self->_startUnicodeScalarIndex;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_endUnicodeScalarIndex;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_startMilliseconds;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_endMilliseconds;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  $D57A5C819C3B84C6E0DE05EE76B05801 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int startIndex = self->_startIndex;
    if (startIndex != [v4 startIndex]) {
      goto LABEL_26;
    }
    $D57A5C819C3B84C6E0DE05EE76B05801 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_26;
  }
  if (v8)
  {
    unsigned int endIndex = self->_endIndex;
    if (endIndex != [v4 endIndex]) {
      goto LABEL_26;
    }
    $D57A5C819C3B84C6E0DE05EE76B05801 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_26;
  }
  if (v10)
  {
    unsigned int startUnicodeScalarIndex = self->_startUnicodeScalarIndex;
    if (startUnicodeScalarIndex != [v4 startUnicodeScalarIndex]) {
      goto LABEL_26;
    }
    $D57A5C819C3B84C6E0DE05EE76B05801 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_26;
  }
  if (v12)
  {
    unsigned int endUnicodeScalarIndex = self->_endUnicodeScalarIndex;
    if (endUnicodeScalarIndex != [v4 endUnicodeScalarIndex]) {
      goto LABEL_26;
    }
    $D57A5C819C3B84C6E0DE05EE76B05801 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_26;
  }
  if (v14)
  {
    int startMilliseconds = self->_startMilliseconds;
    if (startMilliseconds == [v4 startMilliseconds])
    {
      $D57A5C819C3B84C6E0DE05EE76B05801 has = self->_has;
      unsigned int v6 = v4[32];
      goto LABEL_22;
    }
LABEL_26:
    BOOL v18 = 0;
    goto LABEL_27;
  }
LABEL_22:
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_26;
  }
  if (v16)
  {
    int endMilliseconds = self->_endMilliseconds;
    if (endMilliseconds != [v4 endMilliseconds]) {
      goto LABEL_26;
    }
  }
  BOOL v18 = 1;
LABEL_27:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
LABEL_8:
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOUtteranceSpanReadFrom(self, (uint64_t)a3);
}

- (void)deleteEndMilliseconds
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasEndMilliseconds:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasEndMilliseconds
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setEndMilliseconds:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int endMilliseconds = a3;
}

- (void)deleteStartMilliseconds
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasStartMilliseconds:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStartMilliseconds
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setStartMilliseconds:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int startMilliseconds = a3;
}

- (void)deleteEndUnicodeScalarIndex
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasEndUnicodeScalarIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEndUnicodeScalarIndex
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEndUnicodeScalarIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int endUnicodeScalarIndex = a3;
}

- (void)deleteStartUnicodeScalarIndex
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasStartUnicodeScalarIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartUnicodeScalarIndex
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setStartUnicodeScalarIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int startUnicodeScalarIndex = a3;
}

- (void)deleteEndIndex
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasEndIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEndIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int endIndex = a3;
}

- (void)deleteStartIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStartIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStartIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int startIndex = a3;
}

@end