@interface NETSchemaNETDebugSessionConnectionPingInfo
- (BOOL)hasMeanPingInMs;
- (BOOL)hasPingCount;
- (BOOL)hasUnacknowledgedPingCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETDebugSessionConnectionPingInfo)initWithDictionary:(id)a3;
- (NETSchemaNETDebugSessionConnectionPingInfo)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)meanPingInMs;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)pingCount;
- (unsigned)unacknowledgedPingCount;
- (void)deleteMeanPingInMs;
- (void)deletePingCount;
- (void)deleteUnacknowledgedPingCount;
- (void)setHasMeanPingInMs:(BOOL)a3;
- (void)setHasPingCount:(BOOL)a3;
- (void)setHasUnacknowledgedPingCount:(BOOL)a3;
- (void)setMeanPingInMs:(double)a3;
- (void)setPingCount:(unsigned int)a3;
- (void)setUnacknowledgedPingCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETDebugSessionConnectionPingInfo

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)unacknowledgedPingCount
{
  return self->_unacknowledgedPingCount;
}

- (double)meanPingInMs
{
  return self->_meanPingInMs;
}

- (unsigned)pingCount
{
  return self->_pingCount;
}

- (NETSchemaNETDebugSessionConnectionPingInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NETSchemaNETDebugSessionConnectionPingInfo;
  v5 = [(NETSchemaNETDebugSessionConnectionPingInfo *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"pingCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugSessionConnectionPingInfo setPingCount:](v5, "setPingCount:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"meanPingInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[NETSchemaNETDebugSessionConnectionPingInfo setMeanPingInMs:](v5, "setMeanPingInMs:");
    }
    v8 = [v4 objectForKeyedSubscript:@"unacknowledgedPingCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugSessionConnectionPingInfo setUnacknowledgedPingCount:](v5, "setUnacknowledgedPingCount:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (NETSchemaNETDebugSessionConnectionPingInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETDebugSessionConnectionPingInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETDebugSessionConnectionPingInfo *)self dictionaryRepresentation];
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
    uint64_t v7 = NSNumber;
    [(NETSchemaNETDebugSessionConnectionPingInfo *)self meanPingInMs];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    [v3 setObject:v8 forKeyedSubscript:@"meanPingInMs"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETDebugSessionConnectionPingInfo pingCount](self, "pingCount"));
  [v3 setObject:v9 forKeyedSubscript:@"pingCount"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETDebugSessionConnectionPingInfo unacknowledgedPingCount](self, "unacknowledgedPingCount"));
    [v3 setObject:v5 forKeyedSubscript:@"unacknowledgedPingCount"];
  }
LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v4 = 2654435761 * self->_pingCount;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double meanPingInMs = self->_meanPingInMs;
  double v6 = -meanPingInMs;
  if (meanPingInMs >= 0.0) {
    double v6 = self->_meanPingInMs;
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
LABEL_11:
  if ((has & 4) != 0) {
    uint64_t v10 = 2654435761 * self->_unacknowledgedPingCount;
  }
  else {
    uint64_t v10 = 0;
  }
  return v9 ^ v4 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $A576B0B9FB53D4C7D76E674710174D20 has = self->_has;
  unsigned int v6 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int pingCount = self->_pingCount;
    if (pingCount != [v4 pingCount]) {
      goto LABEL_14;
    }
    $A576B0B9FB53D4C7D76E674710174D20 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    double meanPingInMs = self->_meanPingInMs;
    [v4 meanPingInMs];
    if (meanPingInMs == v10)
    {
      $A576B0B9FB53D4C7D76E674710174D20 has = self->_has;
      unsigned int v6 = v4[28];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v13 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v11 = (*(unsigned int *)&has >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v11)
  {
    unsigned int unacknowledgedPingCount = self->_unacknowledgedPingCount;
    if (unacknowledgedPingCount != [v4 unacknowledgedPingCount]) {
      goto LABEL_14;
    }
  }
  BOOL v13 = 1;
LABEL_15:

  return v13;
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
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETDebugSessionConnectionPingInfoReadFrom(self, (uint64_t)a3);
}

- (void)deleteUnacknowledgedPingCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasUnacknowledgedPingCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUnacknowledgedPingCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setUnacknowledgedPingCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int unacknowledgedPingCount = a3;
}

- (void)deleteMeanPingInMs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMeanPingInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMeanPingInMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMeanPingInMs:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double meanPingInMs = a3;
}

- (void)deletePingCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPingCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPingCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPingCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int pingCount = a3;
}

@end