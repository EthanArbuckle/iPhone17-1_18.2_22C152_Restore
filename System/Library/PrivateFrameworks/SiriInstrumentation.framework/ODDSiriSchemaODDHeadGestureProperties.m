@interface ODDSiriSchemaODDHeadGestureProperties
- (BOOL)hasAcceptProceedGesture;
- (BOOL)hasDeclineDismissGesture;
- (BOOL)hasHeadGesturesEnabled;
- (BOOL)hasHeadGesturesSupported;
- (BOOL)headGesturesEnabled;
- (BOOL)headGesturesSupported;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDHeadGestureProperties)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDHeadGestureProperties)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)acceptProceedGesture;
- (int)declineDismissGesture;
- (unint64_t)hash;
- (void)deleteAcceptProceedGesture;
- (void)deleteDeclineDismissGesture;
- (void)deleteHeadGesturesEnabled;
- (void)deleteHeadGesturesSupported;
- (void)setAcceptProceedGesture:(int)a3;
- (void)setDeclineDismissGesture:(int)a3;
- (void)setHasAcceptProceedGesture:(BOOL)a3;
- (void)setHasDeclineDismissGesture:(BOOL)a3;
- (void)setHasHeadGesturesEnabled:(BOOL)a3;
- (void)setHasHeadGesturesSupported:(BOOL)a3;
- (void)setHeadGesturesEnabled:(BOOL)a3;
- (void)setHeadGesturesSupported:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDHeadGestureProperties

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)declineDismissGesture
{
  return self->_declineDismissGesture;
}

- (int)acceptProceedGesture
{
  return self->_acceptProceedGesture;
}

- (BOOL)headGesturesEnabled
{
  return self->_headGesturesEnabled;
}

- (BOOL)headGesturesSupported
{
  return self->_headGesturesSupported;
}

- (ODDSiriSchemaODDHeadGestureProperties)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODDSiriSchemaODDHeadGestureProperties;
  v5 = [(ODDSiriSchemaODDHeadGestureProperties *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"headGesturesSupported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDHeadGestureProperties setHeadGesturesSupported:](v5, "setHeadGesturesSupported:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"headGesturesEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDHeadGestureProperties setHeadGesturesEnabled:](v5, "setHeadGesturesEnabled:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"acceptProceedGesture"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDHeadGestureProperties setAcceptProceedGesture:](v5, "setAcceptProceedGesture:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"declineDismissGesture"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDHeadGestureProperties setDeclineDismissGesture:](v5, "setDeclineDismissGesture:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDHeadGestureProperties)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDHeadGestureProperties *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDHeadGestureProperties *)self dictionaryRepresentation];
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
  if ((has & 4) != 0)
  {
    int v5 = [(ODDSiriSchemaODDHeadGestureProperties *)self acceptProceedGesture];
    if (v5 == 1) {
      v6 = @"ORCHHEADGESTUREMAPPING_SIDE_TO_SIDE";
    }
    else {
      v6 = @"ORCHHEADGESTUREMAPPING_UNKNOWN";
    }
    if (v5 == 2) {
      uint64_t v7 = @"ORCHHEADGESTUREMAPPING_UP_AND_DOWN";
    }
    else {
      uint64_t v7 = v6;
    }
    [v3 setObject:v7 forKeyedSubscript:@"acceptProceedGesture"];
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    int v8 = [(ODDSiriSchemaODDHeadGestureProperties *)self declineDismissGesture];
    if (v8 == 1) {
      v9 = @"ORCHHEADGESTUREMAPPING_SIDE_TO_SIDE";
    }
    else {
      v9 = @"ORCHHEADGESTUREMAPPING_UNKNOWN";
    }
    if (v8 == 2) {
      v10 = @"ORCHHEADGESTUREMAPPING_UP_AND_DOWN";
    }
    else {
      v10 = v9;
    }
    [v3 setObject:v10 forKeyedSubscript:@"declineDismissGesture"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDHeadGestureProperties headGesturesEnabled](self, "headGesturesEnabled"));
    [v3 setObject:v11 forKeyedSubscript:@"headGesturesEnabled"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v12 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDHeadGestureProperties headGesturesSupported](self, "headGesturesSupported"));
    [v3 setObject:v12 forKeyedSubscript:@"headGesturesSupported"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_headGesturesSupported;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_headGesturesEnabled;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
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
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_acceptProceedGesture;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_declineDismissGesture;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $EBBC5CA33C8B6F6C181474580A7557F4 has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    int headGesturesSupported = self->_headGesturesSupported;
    if (headGesturesSupported != [v4 headGesturesSupported]) {
      goto LABEL_18;
    }
    $EBBC5CA33C8B6F6C181474580A7557F4 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    int headGesturesEnabled = self->_headGesturesEnabled;
    if (headGesturesEnabled != [v4 headGesturesEnabled]) {
      goto LABEL_18;
    }
    $EBBC5CA33C8B6F6C181474580A7557F4 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v10)
  {
    int acceptProceedGesture = self->_acceptProceedGesture;
    if (acceptProceedGesture == [v4 acceptProceedGesture])
    {
      $EBBC5CA33C8B6F6C181474580A7557F4 has = self->_has;
      unsigned int v6 = v4[20];
      goto LABEL_14;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_18;
  }
  if (v12)
  {
    int declineDismissGesture = self->_declineDismissGesture;
    if (declineDismissGesture != [v4 declineDismissGesture]) {
      goto LABEL_18;
    }
  }
  BOOL v14 = 1;
LABEL_19:

  return v14;
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
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDHeadGesturePropertiesReadFrom(self, (uint64_t)a3);
}

- (void)deleteDeclineDismissGesture
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasDeclineDismissGesture:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeclineDismissGesture
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDeclineDismissGesture:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int declineDismissGesture = a3;
}

- (void)deleteAcceptProceedGesture
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasAcceptProceedGesture:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAcceptProceedGesture
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAcceptProceedGesture:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int acceptProceedGesture = a3;
}

- (void)deleteHeadGesturesEnabled
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasHeadGesturesEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHeadGesturesEnabled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHeadGesturesEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int headGesturesEnabled = a3;
}

- (void)deleteHeadGesturesSupported
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasHeadGesturesSupported:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHeadGesturesSupported
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHeadGesturesSupported:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int headGesturesSupported = a3;
}

@end