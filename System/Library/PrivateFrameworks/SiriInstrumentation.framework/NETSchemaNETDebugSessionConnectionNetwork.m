@interface NETSchemaNETDebugSessionConnectionNetwork
- (BOOL)hasConnectedSubflowCount;
- (BOOL)hasOpenTimeInMs;
- (BOOL)hasSignalStrengthBars;
- (BOOL)hasWiFiPhyMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETDebugSessionConnectionNetwork)initWithDictionary:(id)a3;
- (NETSchemaNETDebugSessionConnectionNetwork)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)openTimeInMs;
- (double)signalStrengthBars;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)wiFiPhyMode;
- (unint64_t)hash;
- (unsigned)connectedSubflowCount;
- (void)deleteConnectedSubflowCount;
- (void)deleteOpenTimeInMs;
- (void)deleteSignalStrengthBars;
- (void)deleteWiFiPhyMode;
- (void)setConnectedSubflowCount:(unsigned int)a3;
- (void)setHasConnectedSubflowCount:(BOOL)a3;
- (void)setHasOpenTimeInMs:(BOOL)a3;
- (void)setHasSignalStrengthBars:(BOOL)a3;
- (void)setHasWiFiPhyMode:(BOOL)a3;
- (void)setOpenTimeInMs:(double)a3;
- (void)setSignalStrengthBars:(double)a3;
- (void)setWiFiPhyMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETDebugSessionConnectionNetwork

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)connectedSubflowCount
{
  return self->_connectedSubflowCount;
}

- (double)openTimeInMs
{
  return self->_openTimeInMs;
}

- (double)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (int)wiFiPhyMode
{
  return self->_wiFiPhyMode;
}

- (NETSchemaNETDebugSessionConnectionNetwork)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NETSchemaNETDebugSessionConnectionNetwork;
  v5 = [(NETSchemaNETDebugSessionConnectionNetwork *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"wiFiPhyMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugSessionConnectionNetwork setWiFiPhyMode:](v5, "setWiFiPhyMode:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"signalStrengthBars"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[NETSchemaNETDebugSessionConnectionNetwork setSignalStrengthBars:](v5, "setSignalStrengthBars:");
    }
    v8 = [v4 objectForKeyedSubscript:@"openTimeInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[NETSchemaNETDebugSessionConnectionNetwork setOpenTimeInMs:](v5, "setOpenTimeInMs:");
    }
    v9 = [v4 objectForKeyedSubscript:@"connectedSubflowCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugSessionConnectionNetwork setConnectedSubflowCount:](v5, "setConnectedSubflowCount:", [v9 unsignedIntValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (NETSchemaNETDebugSessionConnectionNetwork)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETDebugSessionConnectionNetwork *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETDebugSessionConnectionNetwork *)self dictionaryRepresentation];
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
  if ((has & 8) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETDebugSessionConnectionNetwork connectedSubflowCount](self, "connectedSubflowCount"));
    [v3 setObject:v5 forKeyedSubscript:@"connectedSubflowCount"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      v8 = NSNumber;
      [(NETSchemaNETDebugSessionConnectionNetwork *)self signalStrengthBars];
      v9 = objc_msgSend(v8, "numberWithDouble:");
      [v3 setObject:v9 forKeyedSubscript:@"signalStrengthBars"];

      if ((*(unsigned char *)&self->_has & 1) == 0) {
        goto LABEL_13;
      }
LABEL_9:
      unsigned int v10 = [(NETSchemaNETDebugSessionConnectionNetwork *)self wiFiPhyMode] - 1;
      if (v10 > 8) {
        v11 = @"NETPHYMODE_UNKNOWN";
      }
      else {
        v11 = off_1E5EB28D8[v10];
      }
      [v3 setObject:v11 forKeyedSubscript:@"wiFiPhyMode"];
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v6 = NSNumber;
  [(NETSchemaNETDebugSessionConnectionNetwork *)self openTimeInMs];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v7 forKeyedSubscript:@"openTimeInMs"];

  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if (has) {
    goto LABEL_9;
  }
LABEL_13:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v4 = 2654435761 * self->_wiFiPhyMode;
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
  double signalStrengthBars = self->_signalStrengthBars;
  double v6 = -signalStrengthBars;
  if (signalStrengthBars >= 0.0) {
    double v6 = self->_signalStrengthBars;
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
  if ((has & 4) != 0)
  {
    double openTimeInMs = self->_openTimeInMs;
    double v12 = -openTimeInMs;
    if (openTimeInMs >= 0.0) {
      double v12 = self->_openTimeInMs;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((has & 8) != 0) {
    uint64_t v15 = 2654435761 * self->_connectedSubflowCount;
  }
  else {
    uint64_t v15 = 0;
  }
  return v9 ^ v4 ^ v10 ^ v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $8C72446B461DADAEF452026161586949 has = self->_has;
  unsigned int v6 = v4[36];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    int wiFiPhyMode = self->_wiFiPhyMode;
    if (wiFiPhyMode != [v4 wiFiPhyMode]) {
      goto LABEL_18;
    }
    $8C72446B461DADAEF452026161586949 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    double signalStrengthBars = self->_signalStrengthBars;
    [v4 signalStrengthBars];
    if (signalStrengthBars != v10) {
      goto LABEL_18;
    }
    $8C72446B461DADAEF452026161586949 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v11 = (*(unsigned int *)&has >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v11)
  {
    double openTimeInMs = self->_openTimeInMs;
    [v4 openTimeInMs];
    if (openTimeInMs == v13)
    {
      $8C72446B461DADAEF452026161586949 has = self->_has;
      unsigned int v6 = v4[36];
      goto LABEL_14;
    }
LABEL_18:
    BOOL v16 = 0;
    goto LABEL_19;
  }
LABEL_14:
  int v14 = (*(unsigned int *)&has >> 3) & 1;
  if (v14 != ((v6 >> 3) & 1)) {
    goto LABEL_18;
  }
  if (v14)
  {
    unsigned int connectedSubflowCount = self->_connectedSubflowCount;
    if (connectedSubflowCount != [v4 connectedSubflowCount]) {
      goto LABEL_18;
    }
  }
  BOOL v16 = 1;
LABEL_19:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETDebugSessionConnectionNetworkReadFrom(self, (uint64_t)a3);
}

- (void)deleteConnectedSubflowCount
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasConnectedSubflowCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasConnectedSubflowCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setConnectedSubflowCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int connectedSubflowCount = a3;
}

- (void)deleteOpenTimeInMs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasOpenTimeInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOpenTimeInMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setOpenTimeInMs:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double openTimeInMs = a3;
}

- (void)deleteSignalStrengthBars
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSignalStrengthBars:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSignalStrengthBars
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSignalStrengthBars:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double signalStrengthBars = a3;
}

- (void)deleteWiFiPhyMode
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasWiFiPhyMode:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWiFiPhyMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWiFiPhyMode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int wiFiPhyMode = a3;
}

@end