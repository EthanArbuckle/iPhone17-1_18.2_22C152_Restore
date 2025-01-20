@interface MHSchemaMHTrailingPacketLatencyInfo
- (BOOL)hasAvg;
- (BOOL)hasMax;
- (BOOL)hasMedian;
- (BOOL)hasMin;
- (BOOL)hasNum;
- (BOOL)hasP95;
- (BOOL)hasStd;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHTrailingPacketLatencyInfo)initWithDictionary:(id)a3;
- (MHSchemaMHTrailingPacketLatencyInfo)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)avg;
- (unint64_t)hash;
- (unint64_t)max;
- (unint64_t)median;
- (unint64_t)min;
- (unint64_t)p95;
- (unint64_t)std;
- (unsigned)num;
- (void)deleteAvg;
- (void)deleteMax;
- (void)deleteMedian;
- (void)deleteMin;
- (void)deleteNum;
- (void)deleteP95;
- (void)deleteStd;
- (void)setAvg:(unint64_t)a3;
- (void)setHasAvg:(BOOL)a3;
- (void)setHasMax:(BOOL)a3;
- (void)setHasMedian:(BOOL)a3;
- (void)setHasMin:(BOOL)a3;
- (void)setHasNum:(BOOL)a3;
- (void)setHasP95:(BOOL)a3;
- (void)setHasStd:(BOOL)a3;
- (void)setMax:(unint64_t)a3;
- (void)setMedian:(unint64_t)a3;
- (void)setMin:(unint64_t)a3;
- (void)setNum:(unsigned int)a3;
- (void)setP95:(unint64_t)a3;
- (void)setStd:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHTrailingPacketLatencyInfo

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)std
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

- (MHSchemaMHTrailingPacketLatencyInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MHSchemaMHTrailingPacketLatencyInfo;
  v5 = [(MHSchemaMHTrailingPacketLatencyInfo *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"num"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHTrailingPacketLatencyInfo setNum:](v5, "setNum:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"max"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHTrailingPacketLatencyInfo setMax:](v5, "setMax:", [v7 unsignedLongLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHTrailingPacketLatencyInfo setMin:](v5, "setMin:", [v8 unsignedLongLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"avg"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHTrailingPacketLatencyInfo setAvg:](v5, "setAvg:", [v9 unsignedLongLongValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"median"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHTrailingPacketLatencyInfo setMedian:](v5, "setMedian:", [v10 unsignedLongLongValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"p95"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHTrailingPacketLatencyInfo setP95:](v5, "setP95:", [v11 unsignedLongLongValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"std"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHTrailingPacketLatencyInfo setStd:](v5, "setStd:", [v12 unsignedLongLongValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (MHSchemaMHTrailingPacketLatencyInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHTrailingPacketLatencyInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHTrailingPacketLatencyInfo *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHTrailingPacketLatencyInfo avg](self, "avg"));
    [v3 setObject:v7 forKeyedSubscript:@"avg"];

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
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHTrailingPacketLatencyInfo max](self, "max"));
  [v3 setObject:v8 forKeyedSubscript:@"max"];

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
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHTrailingPacketLatencyInfo median](self, "median"));
  [v3 setObject:v9 forKeyedSubscript:@"median"];

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
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHTrailingPacketLatencyInfo min](self, "min"));
  [v3 setObject:v10 forKeyedSubscript:@"min"];

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
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHTrailingPacketLatencyInfo num](self, "num"));
  [v3 setObject:v11 forKeyedSubscript:@"num"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHTrailingPacketLatencyInfo p95](self, "p95"));
  [v3 setObject:v12 forKeyedSubscript:@"p95"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHTrailingPacketLatencyInfo std](self, "std"));
    [v3 setObject:v5 forKeyedSubscript:@"std"];
  }
LABEL_9:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_num;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_max;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_min;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    unint64_t v5 = 2654435761u * self->_avg;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    unint64_t v6 = 2654435761u * self->_median;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    unint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    unint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  unint64_t v7 = 2654435761u * self->_p95;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_std;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  $38036CCCB73BCD28FE68E1294AD2D0E3 has = self->_has;
  unsigned int v6 = v4[64];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_30;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int num = self->_num;
    if (num != [v4 num]) {
      goto LABEL_30;
    }
    $38036CCCB73BCD28FE68E1294AD2D0E3 has = self->_has;
    unsigned int v6 = v4[64];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_30;
  }
  if (v8)
  {
    unint64_t max = self->_max;
    if (max != [v4 max]) {
      goto LABEL_30;
    }
    $38036CCCB73BCD28FE68E1294AD2D0E3 has = self->_has;
    unsigned int v6 = v4[64];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_30;
  }
  if (v10)
  {
    unint64_t min = self->_min;
    if (min != [v4 min]) {
      goto LABEL_30;
    }
    $38036CCCB73BCD28FE68E1294AD2D0E3 has = self->_has;
    unsigned int v6 = v4[64];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_30;
  }
  if (v12)
  {
    unint64_t avg = self->_avg;
    if (avg != [v4 avg]) {
      goto LABEL_30;
    }
    $38036CCCB73BCD28FE68E1294AD2D0E3 has = self->_has;
    unsigned int v6 = v4[64];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_30;
  }
  if (v14)
  {
    unint64_t median = self->_median;
    if (median != [v4 median]) {
      goto LABEL_30;
    }
    $38036CCCB73BCD28FE68E1294AD2D0E3 has = self->_has;
    unsigned int v6 = v4[64];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_30;
  }
  if (v16)
  {
    unint64_t p95 = self->_p95;
    if (p95 == [v4 p95])
    {
      $38036CCCB73BCD28FE68E1294AD2D0E3 has = self->_has;
      unsigned int v6 = v4[64];
      goto LABEL_26;
    }
LABEL_30:
    BOOL v20 = 0;
    goto LABEL_31;
  }
LABEL_26:
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_30;
  }
  if (v18)
  {
    unint64_t std = self->_std;
    if (std != [v4 std]) {
      goto LABEL_30;
    }
  }
  BOOL v20 = 1;
LABEL_31:

  return v20;
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
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint64Field();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHTrailingPacketLatencyInfoReadFrom(self, (uint64_t)a3);
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

- (void)setStd:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_unint64_t std = a3;
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