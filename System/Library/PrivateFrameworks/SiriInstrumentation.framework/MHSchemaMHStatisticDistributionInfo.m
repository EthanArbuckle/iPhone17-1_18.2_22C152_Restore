@interface MHSchemaMHStatisticDistributionInfo
- (BOOL)hasAvg;
- (BOOL)hasMax;
- (BOOL)hasMedian;
- (BOOL)hasMin;
- (BOOL)hasNum;
- (BOOL)hasP95;
- (BOOL)hasStd;
- (BOOL)hasWarmup;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHStatisticDistributionInfo)initWithDictionary:(id)a3;
- (MHSchemaMHStatisticDistributionInfo)initWithJSON:(id)a3;
- (NSData)jsonData;
- (float)std;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)avg;
- (unint64_t)hash;
- (unint64_t)max;
- (unint64_t)median;
- (unint64_t)min;
- (unint64_t)p95;
- (unint64_t)warmup;
- (unsigned)num;
- (void)deleteAvg;
- (void)deleteMax;
- (void)deleteMedian;
- (void)deleteMin;
- (void)deleteNum;
- (void)deleteP95;
- (void)deleteStd;
- (void)deleteWarmup;
- (void)setAvg:(unint64_t)a3;
- (void)setHasAvg:(BOOL)a3;
- (void)setHasMax:(BOOL)a3;
- (void)setHasMedian:(BOOL)a3;
- (void)setHasMin:(BOOL)a3;
- (void)setHasNum:(BOOL)a3;
- (void)setHasP95:(BOOL)a3;
- (void)setHasStd:(BOOL)a3;
- (void)setHasWarmup:(BOOL)a3;
- (void)setMax:(unint64_t)a3;
- (void)setMedian:(unint64_t)a3;
- (void)setMin:(unint64_t)a3;
- (void)setNum:(unsigned int)a3;
- (void)setP95:(unint64_t)a3;
- (void)setStd:(float)a3;
- (void)setWarmup:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHStatisticDistributionInfo

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)warmup
{
  return self->_warmup;
}

- (float)std
{
  return self->_std;
}

- (unint64_t)p95
{
  return self->_p95;
}

- (unint64_t)median
{
  return self->_median;
}

- (unint64_t)avg
{
  return self->_avg;
}

- (unint64_t)min
{
  return self->_min;
}

- (unint64_t)max
{
  return self->_max;
}

- (unsigned)num
{
  return self->_num;
}

- (MHSchemaMHStatisticDistributionInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MHSchemaMHStatisticDistributionInfo;
  v5 = [(MHSchemaMHStatisticDistributionInfo *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"num"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHStatisticDistributionInfo setNum:](v5, "setNum:", [v6 unsignedIntValue]);
    }
    v16 = v6;
    v7 = [v4 objectForKeyedSubscript:@"max"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHStatisticDistributionInfo setMax:](v5, "setMax:", [v7 unsignedLongLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHStatisticDistributionInfo setMin:](v5, "setMin:", [v8 unsignedLongLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"avg"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHStatisticDistributionInfo setAvg:](v5, "setAvg:", [v9 unsignedLongLongValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"median"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHStatisticDistributionInfo setMedian:](v5, "setMedian:", [v10 unsignedLongLongValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"p95"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHStatisticDistributionInfo setP95:](v5, "setP95:", [v11 unsignedLongLongValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"std"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      -[MHSchemaMHStatisticDistributionInfo setStd:](v5, "setStd:");
    }
    v13 = [v4 objectForKeyedSubscript:@"warmup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHStatisticDistributionInfo setWarmup:](v5, "setWarmup:", [v13 unsignedLongLongValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (MHSchemaMHStatisticDistributionInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHStatisticDistributionInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHStatisticDistributionInfo *)self dictionaryRepresentation];
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
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHStatisticDistributionInfo avg](self, "avg"));
    [v3 setObject:v6 forKeyedSubscript:@"avg"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHStatisticDistributionInfo max](self, "max"));
  [v3 setObject:v7 forKeyedSubscript:@"max"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHStatisticDistributionInfo median](self, "median"));
  [v3 setObject:v8 forKeyedSubscript:@"median"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHStatisticDistributionInfo min](self, "min"));
  [v3 setObject:v9 forKeyedSubscript:@"min"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHStatisticDistributionInfo num](self, "num"));
  [v3 setObject:v10 forKeyedSubscript:@"num"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    v12 = NSNumber;
    [(MHSchemaMHStatisticDistributionInfo *)self std];
    v13 = objc_msgSend(v12, "numberWithFloat:");
    [v3 setObject:v13 forKeyedSubscript:@"std"];

    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHStatisticDistributionInfo p95](self, "p95"));
  [v3 setObject:v11 forKeyedSubscript:@"p95"];

  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((has & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHStatisticDistributionInfo warmup](self, "warmup"));
  [v3 setObject:v14 forKeyedSubscript:@"warmup"];

LABEL_9:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v4 = 2654435761 * self->_num;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v5 = 2654435761u * self->_max;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    unint64_t v6 = 2654435761u * self->_min;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    unint64_t v7 = 2654435761u * self->_avg;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    unint64_t v8 = 2654435761u * self->_median;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_17:
    unint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_18:
    unint64_t v14 = 0;
    goto LABEL_21;
  }
LABEL_16:
  unint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_17;
  }
LABEL_7:
  unint64_t v9 = 2654435761u * self->_p95;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_18;
  }
LABEL_8:
  float std = self->_std;
  double v11 = std;
  if (std < 0.0) {
    double v11 = -std;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_21:
  if (has < 0) {
    unint64_t v15 = 2654435761u * self->_warmup;
  }
  else {
    unint64_t v15 = 0;
  }
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  $00A31DFE5968C3EA491D65367FFC8698 has = self->_has;
  unsigned int v6 = v4[72];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_34;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int num = self->_num;
    if (num != [v4 num]) {
      goto LABEL_34;
    }
    $00A31DFE5968C3EA491D65367FFC8698 has = self->_has;
    unsigned int v6 = v4[72];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_34;
  }
  if (v8)
  {
    unint64_t max = self->_max;
    if (max != [v4 max]) {
      goto LABEL_34;
    }
    $00A31DFE5968C3EA491D65367FFC8698 has = self->_has;
    unsigned int v6 = v4[72];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_34;
  }
  if (v10)
  {
    unint64_t min = self->_min;
    if (min != [v4 min]) {
      goto LABEL_34;
    }
    $00A31DFE5968C3EA491D65367FFC8698 has = self->_has;
    unsigned int v6 = v4[72];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_34;
  }
  if (v12)
  {
    unint64_t avg = self->_avg;
    if (avg != [v4 avg]) {
      goto LABEL_34;
    }
    $00A31DFE5968C3EA491D65367FFC8698 has = self->_has;
    unsigned int v6 = v4[72];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_34;
  }
  if (v14)
  {
    unint64_t median = self->_median;
    if (median != [v4 median]) {
      goto LABEL_34;
    }
    $00A31DFE5968C3EA491D65367FFC8698 has = self->_has;
    unsigned int v6 = v4[72];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_34;
  }
  if (v16)
  {
    unint64_t p95 = self->_p95;
    if (p95 != [v4 p95]) {
      goto LABEL_34;
    }
    $00A31DFE5968C3EA491D65367FFC8698 has = self->_has;
    unsigned int v6 = v4[72];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_34;
  }
  if (v18)
  {
    float std = self->_std;
    [v4 std];
    if (std == v20)
    {
      $00A31DFE5968C3EA491D65367FFC8698 has = self->_has;
      unsigned int v6 = v4[72];
      goto LABEL_30;
    }
LABEL_34:
    BOOL v22 = 0;
    goto LABEL_35;
  }
LABEL_30:
  if (((v6 ^ *(_DWORD *)&has) & 0x80) != 0) {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    unint64_t warmup = self->_warmup;
    if (warmup != [v4 warmup]) {
      goto LABEL_34;
    }
  }
  BOOL v22 = 1;
LABEL_35:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    PBDataWriterWriteFloatField();
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((has & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHStatisticDistributionInfoReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteWarmup
{
  *(unsigned char *)&self->_has &= ~0x80u;
}

- (void)setHasWarmup:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasWarmup
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setWarmup:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_unint64_t warmup = a3;
}

- (void)deleteStd
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasStd:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasStd
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setStd:(float)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_float std = a3;
}

- (void)deleteP95
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasP95:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasP95
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setP95:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unint64_t p95 = a3;
}

- (void)deleteMedian
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasMedian:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMedian
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMedian:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unint64_t median = a3;
}

- (void)deleteAvg
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasAvg:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAvg
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAvg:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unint64_t avg = a3;
}

- (void)deleteMin
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasMin:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMin
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMin:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t min = a3;
}

- (void)deleteMax
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMax:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMax
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMax:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t max = a3;
}

- (void)deleteNum
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNum:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNum
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNum:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int num = a3;
}

@end