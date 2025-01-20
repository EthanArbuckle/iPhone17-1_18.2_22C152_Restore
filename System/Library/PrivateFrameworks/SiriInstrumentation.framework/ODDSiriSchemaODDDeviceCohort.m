@interface ODDSiriSchemaODDDeviceCohort
- (BOOL)hasCohortDataAvailabilityState;
- (BOOL)hasCohortInterval;
- (BOOL)hasCohortType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDDeviceCohort)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDDeviceCohort)initWithJSON:(id)a3;
- (ODDSiriSchemaODDTimeInterval)cohortInterval;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)cohortDataAvailabilityState;
- (int)cohortType;
- (unint64_t)hash;
- (void)deleteCohortDataAvailabilityState;
- (void)deleteCohortInterval;
- (void)deleteCohortType;
- (void)setCohortDataAvailabilityState:(int)a3;
- (void)setCohortInterval:(id)a3;
- (void)setCohortType:(int)a3;
- (void)setHasCohortDataAvailabilityState:(BOOL)a3;
- (void)setHasCohortInterval:(BOOL)a3;
- (void)setHasCohortType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDDeviceCohort

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODDSiriSchemaODDDeviceCohort;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDDeviceCohort *)self cohortInterval];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODDSiriSchemaODDDeviceCohort *)self deleteCohortInterval];
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

- (void)setHasCohortInterval:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)cohortDataAvailabilityState
{
  return self->_cohortDataAvailabilityState;
}

- (int)cohortType
{
  return self->_cohortType;
}

- (void)setCohortInterval:(id)a3
{
}

- (ODDSiriSchemaODDTimeInterval)cohortInterval
{
  return self->_cohortInterval;
}

- (ODDSiriSchemaODDDeviceCohort)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODDSiriSchemaODDDeviceCohort;
  v5 = [(ODDSiriSchemaODDDeviceCohort *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"cohortInterval"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDTimeInterval alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDDeviceCohort *)v5 setCohortInterval:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"cohortType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDeviceCohort setCohortType:](v5, "setCohortType:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"cohortDataAvailabilityState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDeviceCohort setCohortDataAvailabilityState:](v5, "setCohortDataAvailabilityState:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDDeviceCohort)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDDeviceCohort *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDDeviceCohort *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int v4 = [(ODDSiriSchemaODDDeviceCohort *)self cohortDataAvailabilityState];
    v5 = @"ODDDATAAVAILABILITYSTATE_UNKNOWN";
    if (v4 == 1) {
      v5 = @"ODDDATAAVAILABILITYSTATE_COMPLETE";
    }
    if (v4 == 2) {
      v6 = @"ODDDATAAVAILABILITYSTATE_INSUFFICIENT_DATA";
    }
    else {
      v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"cohortDataAvailabilityState"];
  }
  if (self->_cohortInterval)
  {
    uint64_t v7 = [(ODDSiriSchemaODDDeviceCohort *)self cohortInterval];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"cohortInterval"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"cohortInterval"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    int v10 = [(ODDSiriSchemaODDDeviceCohort *)self cohortType];
    v11 = @"ODDDEVICECOHORTTYPE_UNKNOWN";
    if (v10 == 1) {
      v11 = @"ODDDEVICECOHORTTYPE_NONE";
    }
    if (v10 == 2) {
      objc_super v12 = @"ODDDEVICECOHORTTYPE_SIRI_HELP";
    }
    else {
      objc_super v12 = v11;
    }
    [v3 setObject:v12 forKeyedSubscript:@"cohortType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDTimeInterval *)self->_cohortInterval hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_cohortType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_cohortDataAvailabilityState;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  uint64_t v5 = [(ODDSiriSchemaODDDeviceCohort *)self cohortInterval];
  v6 = [v4 cohortInterval];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  uint64_t v8 = [(ODDSiriSchemaODDDeviceCohort *)self cohortInterval];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    int v10 = [(ODDSiriSchemaODDDeviceCohort *)self cohortInterval];
    v11 = [v4 cohortInterval];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  $5B0C4B9DD1BFBB3D772490AD8DD80003 has = self->_has;
  unsigned int v14 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    int cohortType = self->_cohortType;
    if (cohortType == [v4 cohortType])
    {
      $5B0C4B9DD1BFBB3D772490AD8DD80003 has = self->_has;
      unsigned int v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_16;
  }
  if (v16)
  {
    int cohortDataAvailabilityState = self->_cohortDataAvailabilityState;
    if (cohortDataAvailabilityState != [v4 cohortDataAvailabilityState]) {
      goto LABEL_16;
    }
  }
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(ODDSiriSchemaODDDeviceCohort *)self cohortInterval];

  if (v4)
  {
    uint64_t v5 = [(ODDSiriSchemaODDDeviceCohort *)self cohortInterval];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  uint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDDeviceCohortReadFrom(self, (uint64_t)a3);
}

- (void)deleteCohortDataAvailabilityState
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasCohortDataAvailabilityState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCohortDataAvailabilityState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCohortDataAvailabilityState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int cohortDataAvailabilityState = a3;
}

- (void)deleteCohortType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCohortType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCohortType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCohortType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int cohortType = a3;
}

- (void)deleteCohortInterval
{
}

- (BOOL)hasCohortInterval
{
  return self->_cohortInterval != 0;
}

@end