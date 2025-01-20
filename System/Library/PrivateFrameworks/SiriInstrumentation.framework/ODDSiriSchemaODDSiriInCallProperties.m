@interface ODDSiriSchemaODDSiriInCallProperties
- (BOOL)hasHeySiriHangupEnablementState;
- (BOOL)hasSiriInCallEnablementState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDSiriInCallProperties)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDSiriInCallProperties)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)heySiriHangupEnablementState;
- (int)siriInCallEnablementState;
- (unint64_t)hash;
- (void)deleteHeySiriHangupEnablementState;
- (void)deleteSiriInCallEnablementState;
- (void)setHasHeySiriHangupEnablementState:(BOOL)a3;
- (void)setHasSiriInCallEnablementState:(BOOL)a3;
- (void)setHeySiriHangupEnablementState:(int)a3;
- (void)setSiriInCallEnablementState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDSiriInCallProperties

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)siriInCallEnablementState
{
  return self->_siriInCallEnablementState;
}

- (int)heySiriHangupEnablementState
{
  return self->_heySiriHangupEnablementState;
}

- (ODDSiriSchemaODDSiriInCallProperties)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ODDSiriSchemaODDSiriInCallProperties;
  v5 = [(ODDSiriSchemaODDSiriInCallProperties *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"heySiriHangupEnablementState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDSiriInCallProperties setHeySiriHangupEnablementState:](v5, "setHeySiriHangupEnablementState:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"siriInCallEnablementState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDSiriInCallProperties setSiriInCallEnablementState:](v5, "setSiriInCallEnablementState:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDSiriInCallProperties)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDSiriInCallProperties *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDSiriInCallProperties *)self dictionaryRepresentation];
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
    unsigned int v5 = [(ODDSiriSchemaODDSiriInCallProperties *)self heySiriHangupEnablementState] - 1;
    if (v5 > 2) {
      v6 = @"ODDHEYSIRIHANGUPENABLEMENTSTATE_UNKNOWN";
    }
    else {
      v6 = off_1E5EBD7B8[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"heySiriHangupEnablementState"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v7 = [(ODDSiriSchemaODDSiriInCallProperties *)self siriInCallEnablementState] - 1;
    if (v7 > 2) {
      v8 = @"ODDSIRIINCALLENABLEMENTSTATE_UNKNOWN";
    }
    else {
      v8 = off_1E5EBD7D0[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"siriInCallEnablementState"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_heySiriHangupEnablementState;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_siriInCallEnablementState;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $D564A22633E607A0ADF4F50E3F396777 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int heySiriHangupEnablementState = self->_heySiriHangupEnablementState;
    if (heySiriHangupEnablementState != [v4 heySiriHangupEnablementState])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $D564A22633E607A0ADF4F50E3F396777 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int siriInCallEnablementState = self->_siriInCallEnablementState;
    if (siriInCallEnablementState != [v4 siriInCallEnablementState]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDSiriInCallPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)deleteSiriInCallEnablementState
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSiriInCallEnablementState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSiriInCallEnablementState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSiriInCallEnablementState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int siriInCallEnablementState = a3;
}

- (void)deleteHeySiriHangupEnablementState
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasHeySiriHangupEnablementState:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHeySiriHangupEnablementState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHeySiriHangupEnablementState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int heySiriHangupEnablementState = a3;
}

@end