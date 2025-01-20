@interface MHSchemaMHCoreSpeechZeroFilterRunPair
- (BOOL)hasZeroRunLength;
- (BOOL)hasZeroRunStartingSample;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHCoreSpeechZeroFilterRunPair)initWithDictionary:(id)a3;
- (MHSchemaMHCoreSpeechZeroFilterRunPair)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)zeroRunLength;
- (unint64_t)zeroRunStartingSample;
- (void)deleteZeroRunLength;
- (void)deleteZeroRunStartingSample;
- (void)setHasZeroRunLength:(BOOL)a3;
- (void)setHasZeroRunStartingSample:(BOOL)a3;
- (void)setZeroRunLength:(unint64_t)a3;
- (void)setZeroRunStartingSample:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHCoreSpeechZeroFilterRunPair

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)zeroRunLength
{
  return self->_zeroRunLength;
}

- (unint64_t)zeroRunStartingSample
{
  return self->_zeroRunStartingSample;
}

- (MHSchemaMHCoreSpeechZeroFilterRunPair)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MHSchemaMHCoreSpeechZeroFilterRunPair;
  v5 = [(MHSchemaMHCoreSpeechZeroFilterRunPair *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"zeroRunStartingSample"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHCoreSpeechZeroFilterRunPair setZeroRunStartingSample:](v5, "setZeroRunStartingSample:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"zeroRunLength"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHCoreSpeechZeroFilterRunPair setZeroRunLength:](v5, "setZeroRunLength:", [v7 unsignedLongLongValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (MHSchemaMHCoreSpeechZeroFilterRunPair)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHCoreSpeechZeroFilterRunPair *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHCoreSpeechZeroFilterRunPair *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHCoreSpeechZeroFilterRunPair zeroRunLength](self, "zeroRunLength"));
    [v3 setObject:v5 forKeyedSubscript:@"zeroRunLength"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHCoreSpeechZeroFilterRunPair zeroRunStartingSample](self, "zeroRunStartingSample"));
    [v3 setObject:v6 forKeyedSubscript:@"zeroRunStartingSample"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_zeroRunStartingSample;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2;
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_zeroRunLength;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $E425133F2D05CE65758637C8FD652719 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t zeroRunStartingSample = self->_zeroRunStartingSample;
    if (zeroRunStartingSample != [v4 zeroRunStartingSample])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $E425133F2D05CE65758637C8FD652719 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unint64_t zeroRunLength = self->_zeroRunLength;
    if (zeroRunLength != [v4 zeroRunLength]) {
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
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHCoreSpeechZeroFilterRunPairReadFrom(self, (uint64_t)a3);
}

- (void)deleteZeroRunLength
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasZeroRunLength:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasZeroRunLength
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setZeroRunLength:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t zeroRunLength = a3;
}

- (void)deleteZeroRunStartingSample
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasZeroRunStartingSample:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasZeroRunStartingSample
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setZeroRunStartingSample:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t zeroRunStartingSample = a3;
}

@end