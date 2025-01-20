@interface NLXSchemaCDMRepetitionResult
- (BOOL)hasAsrHypothesisIndex;
- (BOOL)hasRepetitionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMRepetitionResult)initWithDictionary:(id)a3;
- (NLXSchemaCDMRepetitionResult)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)repetitionType;
- (unint64_t)hash;
- (unsigned)asrHypothesisIndex;
- (void)deleteAsrHypothesisIndex;
- (void)deleteRepetitionType;
- (void)setAsrHypothesisIndex:(unsigned int)a3;
- (void)setHasAsrHypothesisIndex:(BOOL)a3;
- (void)setHasRepetitionType:(BOOL)a3;
- (void)setRepetitionType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMRepetitionResult

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)repetitionType
{
  return self->_repetitionType;
}

- (unsigned)asrHypothesisIndex
{
  return self->_asrHypothesisIndex;
}

- (NLXSchemaCDMRepetitionResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLXSchemaCDMRepetitionResult;
  v5 = [(NLXSchemaCDMRepetitionResult *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"asrHypothesisIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMRepetitionResult setAsrHypothesisIndex:](v5, "setAsrHypothesisIndex:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"repetitionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMRepetitionResult setRepetitionType:](v5, "setRepetitionType:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (NLXSchemaCDMRepetitionResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMRepetitionResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMRepetitionResult *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaCDMRepetitionResult asrHypothesisIndex](self, "asrHypothesisIndex"));
    [v3 setObject:v5 forKeyedSubscript:@"asrHypothesisIndex"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v6 = [(NLXSchemaCDMRepetitionResult *)self repetitionType] - 1;
    if (v6 > 3) {
      uint64_t v7 = @"CDMREPETITIONTYPE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EB2D20[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"repetitionType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_asrHypothesisIndex;
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
  uint64_t v3 = 2654435761 * self->_repetitionType;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $0D83E20D3B7BE47A19C309BEE287C02F has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int asrHypothesisIndex = self->_asrHypothesisIndex;
    if (asrHypothesisIndex != [v4 asrHypothesisIndex])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $0D83E20D3B7BE47A19C309BEE287C02F has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int repetitionType = self->_repetitionType;
    if (repetitionType != [v4 repetitionType]) {
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
    PBDataWriterWriteUint32Field();
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
  return NLXSchemaCDMRepetitionResultReadFrom(self, (uint64_t)a3);
}

- (void)deleteRepetitionType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRepetitionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRepetitionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRepetitionType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int repetitionType = a3;
}

- (void)deleteAsrHypothesisIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAsrHypothesisIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAsrHypothesisIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAsrHypothesisIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int asrHypothesisIndex = a3;
}

@end