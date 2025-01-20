@interface ODMSiriSchemaODMSiriAggregationDimensions
- (BOOL)hasAggregationIntervalInDays;
- (BOOL)hasAggregationIntervalStartTimestampInSecondsSince2001;
- (BOOL)hasSiriInputLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODMSiriSchemaODMSiriAggregationDimensions)initWithDictionary:(id)a3;
- (ODMSiriSchemaODMSiriAggregationDimensions)initWithJSON:(id)a3;
- (SISchemaISOLocale)siriInputLocale;
- (double)aggregationIntervalStartTimestampInSecondsSince2001;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)aggregationIntervalInDays;
- (void)deleteAggregationIntervalInDays;
- (void)deleteAggregationIntervalStartTimestampInSecondsSince2001;
- (void)deleteSiriInputLocale;
- (void)setAggregationIntervalInDays:(unsigned int)a3;
- (void)setAggregationIntervalStartTimestampInSecondsSince2001:(double)a3;
- (void)setHasAggregationIntervalInDays:(BOOL)a3;
- (void)setHasAggregationIntervalStartTimestampInSecondsSince2001:(BOOL)a3;
- (void)setHasSiriInputLocale:(BOOL)a3;
- (void)setSiriInputLocale:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODMSiriSchemaODMSiriAggregationDimensions

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODMSiriSchemaODMSiriAggregationDimensions;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODMSiriSchemaODMSiriAggregationDimensions *)self siriInputLocale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODMSiriSchemaODMSiriAggregationDimensions *)self deleteSiriInputLocale];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasSiriInputLocale:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (double)aggregationIntervalStartTimestampInSecondsSince2001
{
  return self->_aggregationIntervalStartTimestampInSecondsSince2001;
}

- (unsigned)aggregationIntervalInDays
{
  return self->_aggregationIntervalInDays;
}

- (void)setSiriInputLocale:(id)a3
{
}

- (SISchemaISOLocale)siriInputLocale
{
  return self->_siriInputLocale;
}

- (ODMSiriSchemaODMSiriAggregationDimensions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODMSiriSchemaODMSiriAggregationDimensions;
  v5 = [(ODMSiriSchemaODMSiriAggregationDimensions *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"siriInputLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaISOLocale alloc] initWithDictionary:v6];
      [(ODMSiriSchemaODMSiriAggregationDimensions *)v5 setSiriInputLocale:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"aggregationIntervalInDays"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMSiriAggregationDimensions setAggregationIntervalInDays:](v5, "setAggregationIntervalInDays:", [v8 unsignedIntValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"aggregationIntervalStartTimestampInSecondsSince2001"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      -[ODMSiriSchemaODMSiriAggregationDimensions setAggregationIntervalStartTimestampInSecondsSince2001:](v5, "setAggregationIntervalStartTimestampInSecondsSince2001:");
    }
    v10 = v5;
  }
  return v5;
}

- (ODMSiriSchemaODMSiriAggregationDimensions)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODMSiriSchemaODMSiriAggregationDimensions *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODMSiriSchemaODMSiriAggregationDimensions *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriAggregationDimensions aggregationIntervalInDays](self, "aggregationIntervalInDays"));
    [v3 setObject:v5 forKeyedSubscript:@"aggregationIntervalInDays"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = NSNumber;
    [(ODMSiriSchemaODMSiriAggregationDimensions *)self aggregationIntervalStartTimestampInSecondsSince2001];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:@"aggregationIntervalStartTimestampInSecondsSince2001"];
  }
  if (self->_siriInputLocale)
  {
    v8 = [(ODMSiriSchemaODMSiriAggregationDimensions *)self siriInputLocale];
    objc_super v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"siriInputLocale"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"siriInputLocale"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaISOLocale *)self->_siriInputLocale hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_aggregationIntervalInDays;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double aggregationIntervalStartTimestampInSecondsSince2001 = self->_aggregationIntervalStartTimestampInSecondsSince2001;
  double v6 = -aggregationIntervalStartTimestampInSecondsSince2001;
  if (aggregationIntervalStartTimestampInSecondsSince2001 >= 0.0) {
    double v6 = self->_aggregationIntervalStartTimestampInSecondsSince2001;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(ODMSiriSchemaODMSiriAggregationDimensions *)self siriInputLocale];
  double v6 = [v4 siriInputLocale];
  long double v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(ODMSiriSchemaODMSiriAggregationDimensions *)self siriInputLocale];
    if (v8)
    {
      unint64_t v9 = (void *)v8;
      v10 = [(ODMSiriSchemaODMSiriAggregationDimensions *)self siriInputLocale];
      v11 = [v4 siriInputLocale];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    $DD605746C9C0117442BEAFDA18497874 has = self->_has;
    unsigned int v14 = v4[32];
    if ((*(unsigned char *)&has & 1) == (v14 & 1))
    {
      if (*(unsigned char *)&has)
      {
        unsigned int aggregationIntervalInDays = self->_aggregationIntervalInDays;
        if (aggregationIntervalInDays != [v4 aggregationIntervalInDays]) {
          goto LABEL_15;
        }
        $DD605746C9C0117442BEAFDA18497874 has = self->_has;
        unsigned int v14 = v4[32];
      }
      int v16 = (*(unsigned int *)&has >> 1) & 1;
      if (v16 == ((v14 >> 1) & 1))
      {
        if (!v16
          || (double aggregationIntervalStartTimestampInSecondsSince2001 = self->_aggregationIntervalStartTimestampInSecondsSince2001,
              [v4 aggregationIntervalStartTimestampInSecondsSince2001],
              aggregationIntervalStartTimestampInSecondsSince2001 == v18))
        {
          BOOL v19 = 1;
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
  }
LABEL_15:
  BOOL v19 = 0;
LABEL_16:

  return v19;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(ODMSiriSchemaODMSiriAggregationDimensions *)self siriInputLocale];

  if (v4)
  {
    v5 = [(ODMSiriSchemaODMSiriAggregationDimensions *)self siriInputLocale];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  long double v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    long double v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMSiriAggregationDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)deleteAggregationIntervalStartTimestampInSecondsSince2001
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAggregationIntervalStartTimestampInSecondsSince2001:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAggregationIntervalStartTimestampInSecondsSince2001
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAggregationIntervalStartTimestampInSecondsSince2001:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double aggregationIntervalStartTimestampInSecondsSince2001 = a3;
}

- (void)deleteAggregationIntervalInDays
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAggregationIntervalInDays:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAggregationIntervalInDays
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAggregationIntervalInDays:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int aggregationIntervalInDays = a3;
}

- (void)deleteSiriInputLocale
{
}

- (BOOL)hasSiriInputLocale
{
  return self->_siriInputLocale != 0;
}

@end