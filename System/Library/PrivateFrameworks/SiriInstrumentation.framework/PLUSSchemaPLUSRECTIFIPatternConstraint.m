@interface PLUSSchemaPLUSRECTIFIPatternConstraint
- (BOOL)hasConstraintType;
- (BOOL)hasConstraintValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSRECTIFIPatternConstraint)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSRECTIFIPatternConstraint)initWithJSON:(id)a3;
- (float)constraintValue;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)constraintType;
- (unint64_t)hash;
- (void)deleteConstraintType;
- (void)deleteConstraintValue;
- (void)setConstraintType:(int)a3;
- (void)setConstraintValue:(float)a3;
- (void)setHasConstraintType:(BOOL)a3;
- (void)setHasConstraintValue:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSRECTIFIPatternConstraint

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)constraintValue
{
  return self->_constraintValue;
}

- (int)constraintType
{
  return self->_constraintType;
}

- (PLUSSchemaPLUSRECTIFIPatternConstraint)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLUSSchemaPLUSRECTIFIPatternConstraint;
  v5 = [(PLUSSchemaPLUSRECTIFIPatternConstraint *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"constraintType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSRECTIFIPatternConstraint setConstraintType:](v5, "setConstraintType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"constraintValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[PLUSSchemaPLUSRECTIFIPatternConstraint setConstraintValue:](v5, "setConstraintValue:");
    }
    v8 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSRECTIFIPatternConstraint)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSRECTIFIPatternConstraint *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSRECTIFIPatternConstraint *)self dictionaryRepresentation];
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
    int v5 = [(PLUSSchemaPLUSRECTIFIPatternConstraint *)self constraintType];
    v6 = @"PLUSRECTIFIPATTERNCONSTRAINTTYPE_UNKNOWN";
    if (v5 == 1) {
      v6 = @"PLUSRECTIFIPATTERNCONSTRAINTTYPE_ENTITY_SIMILARITY";
    }
    if (v5 == 2) {
      uint64_t v7 = @"PLUSRECTIFIPATTERNCONSTRAINTTYPE_SUPPORT_THRESHOLD";
    }
    else {
      uint64_t v7 = v6;
    }
    [v3 setObject:v7 forKeyedSubscript:@"constraintType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = NSNumber;
    [(PLUSSchemaPLUSRECTIFIPatternConstraint *)self constraintValue];
    v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"constraintValue"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_constraintType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v7 = 0;
    return v7 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float constraintValue = self->_constraintValue;
  double v4 = constraintValue;
  if (constraintValue < 0.0) {
    double v4 = -constraintValue;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  return v7 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  $BDB5CAD5ED013E22AC66059FD456E3CC has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&has)
  {
    int constraintType = self->_constraintType;
    if (constraintType != [v4 constraintType]) {
      goto LABEL_9;
    }
    $BDB5CAD5ED013E22AC66059FD456E3CC has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (float constraintValue = self->_constraintValue, [v4 constraintValue], constraintValue == v10))
    {
      BOOL v11 = 1;
      goto LABEL_10;
    }
  }
LABEL_9:
  BOOL v11 = 0;
LABEL_10:

  return v11;
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
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSRECTIFIPatternConstraintReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteConstraintValue
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasConstraintValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConstraintValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setConstraintValue:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float constraintValue = a3;
}

- (void)deleteConstraintType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasConstraintType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConstraintType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setConstraintType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int constraintType = a3;
}

@end