@interface SUGSchemaSUGSiriHelpSignal
- (BOOL)hasDepthFromActiveSignal;
- (BOOL)hasSignalType;
- (BOOL)hasSignalValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)signalValue;
- (SUGSchemaSUGSiriHelpSignal)initWithDictionary:(id)a3;
- (SUGSchemaSUGSiriHelpSignal)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)signalType;
- (unint64_t)hash;
- (unsigned)depthFromActiveSignal;
- (void)deleteDepthFromActiveSignal;
- (void)deleteSignalType;
- (void)deleteSignalValue;
- (void)setDepthFromActiveSignal:(unsigned int)a3;
- (void)setHasDepthFromActiveSignal:(BOOL)a3;
- (void)setHasSignalType:(BOOL)a3;
- (void)setHasSignalValue:(BOOL)a3;
- (void)setSignalType:(int)a3;
- (void)setSignalValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SUGSchemaSUGSiriHelpSignal

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasSignalValue:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)signalType
{
  return self->_signalType;
}

- (void)setSignalValue:(id)a3
{
}

- (NSString)signalValue
{
  return self->_signalValue;
}

- (unsigned)depthFromActiveSignal
{
  return self->_depthFromActiveSignal;
}

- (SUGSchemaSUGSiriHelpSignal)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUGSchemaSUGSiriHelpSignal;
  v5 = [(SUGSchemaSUGSiriHelpSignal *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"depthFromActiveSignal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGSiriHelpSignal setDepthFromActiveSignal:](v5, "setDepthFromActiveSignal:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"signalValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(SUGSchemaSUGSiriHelpSignal *)v5 setSignalValue:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"signalType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGSiriHelpSignal setSignalType:](v5, "setSignalType:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (SUGSchemaSUGSiriHelpSignal)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SUGSchemaSUGSiriHelpSignal *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SUGSchemaSUGSiriHelpSignal *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SUGSchemaSUGSiriHelpSignal depthFromActiveSignal](self, "depthFromActiveSignal"));
    [v3 setObject:v5 forKeyedSubscript:@"depthFromActiveSignal"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v6 = [(SUGSchemaSUGSiriHelpSignal *)self signalType] - 1;
    if (v6 > 5) {
      uint64_t v7 = @"SUGSIGNALTYPE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EB95C8[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"signalType"];
  }
  if (self->_signalValue)
  {
    v8 = [(SUGSchemaSUGSiriHelpSignal *)self signalValue];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"signalValue"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_depthFromActiveSignal;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_signalValue hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_signalType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[28] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int depthFromActiveSignal = self->_depthFromActiveSignal;
    if (depthFromActiveSignal != [v4 depthFromActiveSignal]) {
      goto LABEL_15;
    }
  }
  unsigned int v6 = [(SUGSchemaSUGSiriHelpSignal *)self signalValue];
  uint64_t v7 = [v4 signalValue];
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = [(SUGSchemaSUGSiriHelpSignal *)self signalValue];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(SUGSchemaSUGSiriHelpSignal *)self signalValue];
    objc_super v12 = [v4 signalValue];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v14 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v14 != ((v4[28] >> 1) & 1)) {
    goto LABEL_15;
  }
  if (v14)
  {
    int signalType = self->_signalType;
    if (signalType != [v4 signalType]) {
      goto LABEL_15;
    }
  }
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  NSUInteger v4 = [(SUGSchemaSUGSiriHelpSignal *)self signalValue];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGSiriHelpSignalReadFrom(self, (uint64_t)a3);
}

- (void)deleteSignalType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSignalType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSignalType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSignalType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int signalType = a3;
}

- (void)deleteSignalValue
{
}

- (BOOL)hasSignalValue
{
  return self->_signalValue != 0;
}

- (void)deleteDepthFromActiveSignal
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDepthFromActiveSignal:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDepthFromActiveSignal
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDepthFromActiveSignal:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int depthFromActiveSignal = a3;
}

@end