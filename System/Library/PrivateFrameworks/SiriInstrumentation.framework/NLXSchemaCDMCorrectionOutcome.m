@interface NLXSchemaCDMCorrectionOutcome
- (BOOL)hasCorrectionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMCorrectionOutcome)initWithDictionary:(id)a3;
- (NLXSchemaCDMCorrectionOutcome)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)correctionType;
- (unint64_t)hash;
- (void)deleteCorrectionType;
- (void)setCorrectionType:(int)a3;
- (void)setHasCorrectionType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMCorrectionOutcome

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)correctionType
{
  return self->_correctionType;
}

- (NLXSchemaCDMCorrectionOutcome)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaCDMCorrectionOutcome;
  v5 = [(NLXSchemaCDMCorrectionOutcome *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"correctionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMCorrectionOutcome setCorrectionType:](v5, "setCorrectionType:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (NLXSchemaCDMCorrectionOutcome)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMCorrectionOutcome *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMCorrectionOutcome *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    if ([(NLXSchemaCDMCorrectionOutcome *)self correctionType] == 1) {
      id v4 = @"CDMCORRECTIONTYPE_USER_INITIATED";
    }
    else {
      id v4 = @"CDMCORRECTIONTYPE_UNKNOWN";
    }
    [v3 setObject:v4 forKeyedSubscript:@"correctionType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_correctionType;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int correctionType = self->_correctionType, correctionType == [v4 correctionType]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMCorrectionOutcomeReadFrom(self, (uint64_t)a3);
}

- (void)deleteCorrectionType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCorrectionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCorrectionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCorrectionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int correctionType = a3;
}

@end