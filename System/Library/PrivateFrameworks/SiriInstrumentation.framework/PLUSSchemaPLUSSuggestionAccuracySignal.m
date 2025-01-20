@interface PLUSSchemaPLUSSuggestionAccuracySignal
- (BOOL)hasSignalSource;
- (BOOL)hasSignalType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSSuggestionAccuracySignal)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSSuggestionAccuracySignal)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)signalSource;
- (int)signalType;
- (unint64_t)hash;
- (void)deleteSignalSource;
- (void)deleteSignalType;
- (void)setHasSignalSource:(BOOL)a3;
- (void)setHasSignalType:(BOOL)a3;
- (void)setSignalSource:(int)a3;
- (void)setSignalType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSSuggestionAccuracySignal

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)signalSource
{
  return self->_signalSource;
}

- (int)signalType
{
  return self->_signalType;
}

- (PLUSSchemaPLUSSuggestionAccuracySignal)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLUSSchemaPLUSSuggestionAccuracySignal;
  v5 = [(PLUSSchemaPLUSSuggestionAccuracySignal *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"signalType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSSuggestionAccuracySignal setSignalType:](v5, "setSignalType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"signalSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSSuggestionAccuracySignal setSignalSource:](v5, "setSignalSource:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSSuggestionAccuracySignal)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSSuggestionAccuracySignal *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSSuggestionAccuracySignal *)self dictionaryRepresentation];
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
    unsigned int v5 = [(PLUSSchemaPLUSSuggestionAccuracySignal *)self signalSource] - 1;
    if (v5 > 3) {
      v6 = @"PLUSSUGGESTIONACCURACYSIGNALSOURCE_UNKNOWN";
    }
    else {
      v6 = off_1E5EB9DD8[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"signalSource"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v7 = [(PLUSSchemaPLUSSuggestionAccuracySignal *)self signalType] - 1;
    if (v7 > 7) {
      v8 = @"PLUSSUGGESTIONACCURACYSIGNALTYPE_UNKNOWN";
    }
    else {
      v8 = off_1E5EB9DF8[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"signalType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_signalType;
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
  uint64_t v3 = 2654435761 * self->_signalSource;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $40DB0C7574EE5E9AEEA36017FEACF2DF has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int signalType = self->_signalType;
    if (signalType != [v4 signalType])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $40DB0C7574EE5E9AEEA36017FEACF2DF has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int signalSource = self->_signalSource;
    if (signalSource != [v4 signalSource]) {
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
  return PLUSSchemaPLUSSuggestionAccuracySignalReadFrom(self, (uint64_t)a3);
}

- (void)deleteSignalSource
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSignalSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSignalSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSignalSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int signalSource = a3;
}

- (void)deleteSignalType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSignalType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSignalType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSignalType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int signalType = a3;
}

@end