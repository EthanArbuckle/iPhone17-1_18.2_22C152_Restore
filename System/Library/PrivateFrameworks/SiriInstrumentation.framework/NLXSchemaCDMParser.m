@interface NLXSchemaCDMParser
- (BOOL)hasAlgorithm;
- (BOOL)hasParserId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMParser)initWithDictionary:(id)a3;
- (NLXSchemaCDMParser)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)algorithm;
- (int)parserId;
- (unint64_t)hash;
- (void)deleteAlgorithm;
- (void)deleteParserId;
- (void)setAlgorithm:(int)a3;
- (void)setHasAlgorithm:(BOOL)a3;
- (void)setHasParserId:(BOOL)a3;
- (void)setParserId:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMParser

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)parserId
{
  return self->_parserId;
}

- (int)algorithm
{
  return self->_algorithm;
}

- (NLXSchemaCDMParser)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLXSchemaCDMParser;
  v5 = [(NLXSchemaCDMParser *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"algorithm"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMParser setAlgorithm:](v5, "setAlgorithm:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"parserId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMParser setParserId:](v5, "setParserId:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (NLXSchemaCDMParser)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMParser *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMParser *)self dictionaryRepresentation];
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
    unsigned int v5 = [(NLXSchemaCDMParser *)self algorithm] - 1;
    if (v5 > 2) {
      v6 = @"CDMPARSERALGORITHMTYPE_UNKNOWN";
    }
    else {
      v6 = off_1E5EB2CA0[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"algorithm"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v7 = [(NLXSchemaCDMParser *)self parserId] - 1;
    if (v7 > 8) {
      v8 = @"CDMPARSERIDENTIFIER_UNKNOWN";
    }
    else {
      v8 = off_1E5EB2CB8[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"parserId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_algorithm;
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
  uint64_t v3 = 2654435761 * self->_parserId;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $A2DBE037AED31CEA6F8D25AF4C02527F has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int algorithm = self->_algorithm;
    if (algorithm != [v4 algorithm])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $A2DBE037AED31CEA6F8D25AF4C02527F has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int parserId = self->_parserId;
    if (parserId != [v4 parserId]) {
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
  return NLXSchemaCDMParserReadFrom(self, (uint64_t)a3);
}

- (void)deleteParserId
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasParserId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasParserId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setParserId:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int parserId = a3;
}

- (void)deleteAlgorithm
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAlgorithm:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAlgorithm
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAlgorithm:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int algorithm = a3;
}

@end