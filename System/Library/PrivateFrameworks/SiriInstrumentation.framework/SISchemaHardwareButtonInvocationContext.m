@interface SISchemaHardwareButtonInvocationContext
- (BOOL)hasHardwareButtonActivationThresholdInSec;
- (BOOL)hasHardwareButtonLongPressBehavior;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaHardwareButtonInvocationContext)initWithDictionary:(id)a3;
- (SISchemaHardwareButtonInvocationContext)initWithJSON:(id)a3;
- (float)hardwareButtonActivationThresholdInSec;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)hardwareButtonLongPressBehavior;
- (unint64_t)hash;
- (void)deleteHardwareButtonActivationThresholdInSec;
- (void)deleteHardwareButtonLongPressBehavior;
- (void)setHardwareButtonActivationThresholdInSec:(float)a3;
- (void)setHardwareButtonLongPressBehavior:(int)a3;
- (void)setHasHardwareButtonActivationThresholdInSec:(BOOL)a3;
- (void)setHasHardwareButtonLongPressBehavior:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaHardwareButtonInvocationContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)hardwareButtonActivationThresholdInSec
{
  return self->_hardwareButtonActivationThresholdInSec;
}

- (int)hardwareButtonLongPressBehavior
{
  return self->_hardwareButtonLongPressBehavior;
}

- (SISchemaHardwareButtonInvocationContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaHardwareButtonInvocationContext;
  v5 = [(SISchemaHardwareButtonInvocationContext *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"hardwareButtonLongPressBehavior"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaHardwareButtonInvocationContext setHardwareButtonLongPressBehavior:](v5, "setHardwareButtonLongPressBehavior:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"hardwareButtonActivationThresholdInSec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[SISchemaHardwareButtonInvocationContext setHardwareButtonActivationThresholdInSec:](v5, "setHardwareButtonActivationThresholdInSec:");
    }
    v8 = v5;
  }
  return v5;
}

- (SISchemaHardwareButtonInvocationContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaHardwareButtonInvocationContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaHardwareButtonInvocationContext *)self dictionaryRepresentation];
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
    v5 = NSNumber;
    [(SISchemaHardwareButtonInvocationContext *)self hardwareButtonActivationThresholdInSec];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"hardwareButtonActivationThresholdInSec"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v7 = [(SISchemaHardwareButtonInvocationContext *)self hardwareButtonLongPressBehavior]- 1;
    if (v7 > 2) {
      v8 = @"SIRIHARDWAREBUTTONLONGPRESSBEHAVIOR_UNKNOWN";
    }
    else {
      v8 = off_1E5EB6D00[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"hardwareButtonLongPressBehavior"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_hardwareButtonLongPressBehavior;
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
  float hardwareButtonActivationThresholdInSec = self->_hardwareButtonActivationThresholdInSec;
  double v4 = hardwareButtonActivationThresholdInSec;
  if (hardwareButtonActivationThresholdInSec < 0.0) {
    double v4 = -hardwareButtonActivationThresholdInSec;
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
  $74EDE333D1A56CDE9A612C359051CBBC has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&has)
  {
    int hardwareButtonLongPressBehavior = self->_hardwareButtonLongPressBehavior;
    if (hardwareButtonLongPressBehavior != [v4 hardwareButtonLongPressBehavior]) {
      goto LABEL_9;
    }
    $74EDE333D1A56CDE9A612C359051CBBC has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (float hardwareButtonActivationThresholdInSec = self->_hardwareButtonActivationThresholdInSec,
          [v4 hardwareButtonActivationThresholdInSec],
          hardwareButtonActivationThresholdInSec == v10))
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
  return SISchemaHardwareButtonInvocationContextReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteHardwareButtonActivationThresholdInSec
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasHardwareButtonActivationThresholdInSec:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHardwareButtonActivationThresholdInSec
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHardwareButtonActivationThresholdInSec:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float hardwareButtonActivationThresholdInSec = a3;
}

- (void)deleteHardwareButtonLongPressBehavior
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasHardwareButtonLongPressBehavior:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHardwareButtonLongPressBehavior
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHardwareButtonLongPressBehavior:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int hardwareButtonLongPressBehavior = a3;
}

@end