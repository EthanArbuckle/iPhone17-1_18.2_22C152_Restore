@interface OTABMUResistance
- (BOOL)hasDownstreamCommonResistance;
- (BOOL)hasDownstreamNorthResistance;
- (BOOL)hasResistanceCellTabToGG;
- (BOOL)hasResistanceGGToVcut;
- (BOOL)hasResistancePMUToVcut;
- (BOOL)hasResistanceVcutToPmax;
- (BOOL)hasSystemEquivalentResistance;
- (BOOL)hasTraceResistance25C;
- (BOOL)hasTraceResistanceTemperatureCoeff;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)downstreamCommonResistance;
- (float)downstreamNorthResistance;
- (float)resistanceCellTabToGG;
- (float)resistanceGGToVcut;
- (float)resistancePMUToVcut;
- (float)resistanceVcutToPmax;
- (float)systemEquivalentResistance;
- (float)traceResistance25C;
- (float)traceResistanceTemperatureCoeff;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDownstreamCommonResistance:(float)a3;
- (void)setDownstreamNorthResistance:(float)a3;
- (void)setHasDownstreamCommonResistance:(BOOL)a3;
- (void)setHasDownstreamNorthResistance:(BOOL)a3;
- (void)setHasResistanceCellTabToGG:(BOOL)a3;
- (void)setHasResistanceGGToVcut:(BOOL)a3;
- (void)setHasResistancePMUToVcut:(BOOL)a3;
- (void)setHasResistanceVcutToPmax:(BOOL)a3;
- (void)setHasSystemEquivalentResistance:(BOOL)a3;
- (void)setHasTraceResistance25C:(BOOL)a3;
- (void)setHasTraceResistanceTemperatureCoeff:(BOOL)a3;
- (void)setResistanceCellTabToGG:(float)a3;
- (void)setResistanceGGToVcut:(float)a3;
- (void)setResistancePMUToVcut:(float)a3;
- (void)setResistanceVcutToPmax:(float)a3;
- (void)setSystemEquivalentResistance:(float)a3;
- (void)setTraceResistance25C:(float)a3;
- (void)setTraceResistanceTemperatureCoeff:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTABMUResistance

- (void)setTraceResistance25C:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_traceResistance25C = a3;
}

- (void)setHasTraceResistance25C:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTraceResistance25C
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTraceResistanceTemperatureCoeff:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_traceResistanceTemperatureCoeff = a3;
}

- (void)setHasTraceResistanceTemperatureCoeff:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTraceResistanceTemperatureCoeff
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSystemEquivalentResistance:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_systemEquivalentResistance = a3;
}

- (void)setHasSystemEquivalentResistance:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSystemEquivalentResistance
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setDownstreamCommonResistance:(float)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_downstreamCommonResistance = a3;
}

- (void)setHasDownstreamCommonResistance:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDownstreamCommonResistance
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setDownstreamNorthResistance:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_downstreamNorthResistance = a3;
}

- (void)setHasDownstreamNorthResistance:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDownstreamNorthResistance
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setResistanceGGToVcut:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_resistanceGGToVcut = a3;
}

- (void)setHasResistanceGGToVcut:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasResistanceGGToVcut
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setResistancePMUToVcut:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_resistancePMUToVcut = a3;
}

- (void)setHasResistancePMUToVcut:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasResistancePMUToVcut
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setResistanceVcutToPmax:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_resistanceVcutToPmax = a3;
}

- (void)setHasResistanceVcutToPmax:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasResistanceVcutToPmax
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setResistanceCellTabToGG:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_resistanceCellTabToGG = a3;
}

- (void)setHasResistanceCellTabToGG:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasResistanceCellTabToGG
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)OTABMUResistance;
  __int16 v3 = [(OTABMUResistance *)&v7 description];
  v4 = [(OTABMUResistance *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *(float *)&double v4 = self->_traceResistance25C;
    v8 = +[NSNumber numberWithFloat:v4];
    [v3 setObject:v8 forKey:@"traceResistance25C"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v4 = self->_traceResistanceTemperatureCoeff;
  v9 = +[NSNumber numberWithFloat:v4];
  [v3 setObject:v9 forKey:@"traceResistanceTemperatureCoeff"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(float *)&double v4 = self->_systemEquivalentResistance;
  v10 = +[NSNumber numberWithFloat:v4];
  [v3 setObject:v10 forKey:@"systemEquivalentResistance"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(float *)&double v4 = self->_downstreamCommonResistance;
  v11 = +[NSNumber numberWithFloat:v4];
  [v3 setObject:v11 forKey:@"downstreamCommonResistance"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(float *)&double v4 = self->_downstreamNorthResistance;
  v12 = +[NSNumber numberWithFloat:v4];
  [v3 setObject:v12 forKey:@"downstreamNorthResistance"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(float *)&double v4 = self->_resistanceGGToVcut;
  v13 = +[NSNumber numberWithFloat:v4];
  [v3 setObject:v13 forKey:@"resistanceGGToVcut"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(float *)&double v4 = self->_resistancePMUToVcut;
  v14 = +[NSNumber numberWithFloat:v4];
  [v3 setObject:v14 forKey:@"resistancePMUToVcut"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  *(float *)&double v4 = self->_resistanceVcutToPmax;
  v15 = +[NSNumber numberWithFloat:v4];
  [v3 setObject:v15 forKey:@"resistanceVcutToPmax"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_10:
    *(float *)&double v4 = self->_resistanceCellTabToGG;
    v6 = +[NSNumber numberWithFloat:v4];
    [v3 setObject:v6 forKey:@"resistanceCellTabToGG"];
  }
LABEL_11:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000D38C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteFloatField();
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteFloatField();
  if ((*(_WORD *)&self->_has & 4) != 0) {
LABEL_10:
  }
    PBDataWriterWriteFloatField();
LABEL_11:
}

- (void)copyTo:(id)a3
{
  double v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    v4[9] = LODWORD(self->_traceResistance25C);
    *((_WORD *)v4 + 22) |= 0x80u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v4[10] = LODWORD(self->_traceResistanceTemperatureCoeff);
  *((_WORD *)v4 + 22) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[8] = LODWORD(self->_systemEquivalentResistance);
  *((_WORD *)v4 + 22) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[2] = LODWORD(self->_downstreamCommonResistance);
  *((_WORD *)v4 + 22) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[3] = LODWORD(self->_downstreamNorthResistance);
  *((_WORD *)v4 + 22) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[5] = LODWORD(self->_resistanceGGToVcut);
  *((_WORD *)v4 + 22) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[6] = LODWORD(self->_resistancePMUToVcut);
  *((_WORD *)v4 + 22) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v4[7] = LODWORD(self->_resistanceVcutToPmax);
  *((_WORD *)v4 + 22) |= 0x20u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_10:
    v4[4] = LODWORD(self->_resistanceCellTabToGG);
    *((_WORD *)v4 + 22) |= 4u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *((_DWORD *)result + 9) = LODWORD(self->_traceResistance25C);
    *((_WORD *)result + 22) |= 0x80u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = LODWORD(self->_traceResistanceTemperatureCoeff);
  *((_WORD *)result + 22) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 8) = LODWORD(self->_systemEquivalentResistance);
  *((_WORD *)result + 22) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 2) = LODWORD(self->_downstreamCommonResistance);
  *((_WORD *)result + 22) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 3) = LODWORD(self->_downstreamNorthResistance);
  *((_WORD *)result + 22) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 5) = LODWORD(self->_resistanceGGToVcut);
  *((_WORD *)result + 22) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 6) = LODWORD(self->_resistancePMUToVcut);
  *((_WORD *)result + 22) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_10;
  }
LABEL_19:
  *((_DWORD *)result + 7) = LODWORD(self->_resistanceVcutToPmax);
  *((_WORD *)result + 22) |= 0x20u;
  if ((*(_WORD *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_10:
  *((_DWORD *)result + 4) = LODWORD(self->_resistanceCellTabToGG);
  *((_WORD *)result + 22) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 22);
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_traceResistance25C != *((float *)v4 + 9)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
LABEL_46:
    BOOL v7 = 0;
    goto LABEL_47;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 22) & 0x100) == 0 || self->_traceResistanceTemperatureCoeff != *((float *)v4 + 10)) {
      goto LABEL_46;
    }
  }
  else if ((*((_WORD *)v4 + 22) & 0x100) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_systemEquivalentResistance != *((float *)v4 + 8)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_46;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_downstreamCommonResistance != *((float *)v4 + 2)) {
      goto LABEL_46;
    }
  }
  else if (v6)
  {
    goto LABEL_46;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_downstreamNorthResistance != *((float *)v4 + 3)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_resistanceGGToVcut != *((float *)v4 + 5)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_resistancePMUToVcut != *((float *)v4 + 6)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_resistanceVcutToPmax != *((float *)v4 + 7)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_46;
  }
  BOOL v7 = (v6 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_resistanceCellTabToGG != *((float *)v4 + 4)) {
      goto LABEL_46;
    }
    BOOL v7 = 1;
  }
LABEL_47:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    float traceResistance25C = self->_traceResistance25C;
    float v6 = -traceResistance25C;
    if (traceResistance25C >= 0.0) {
      float v6 = self->_traceResistance25C;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 0x100) != 0)
  {
    float traceResistanceTemperatureCoeff = self->_traceResistanceTemperatureCoeff;
    float v11 = -traceResistanceTemperatureCoeff;
    if (traceResistanceTemperatureCoeff >= 0.0) {
      float v11 = self->_traceResistanceTemperatureCoeff;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 0x40) != 0)
  {
    float systemEquivalentResistance = self->_systemEquivalentResistance;
    float v16 = -systemEquivalentResistance;
    if (systemEquivalentResistance >= 0.0) {
      float v16 = self->_systemEquivalentResistance;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if (has)
  {
    float downstreamCommonResistance = self->_downstreamCommonResistance;
    float v21 = -downstreamCommonResistance;
    if (downstreamCommonResistance >= 0.0) {
      float v21 = self->_downstreamCommonResistance;
    }
    float v22 = floorf(v21 + 0.5);
    float v23 = (float)(v21 - v22) * 1.8447e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((has & 2) != 0)
  {
    float downstreamNorthResistance = self->_downstreamNorthResistance;
    float v26 = -downstreamNorthResistance;
    if (downstreamNorthResistance >= 0.0) {
      float v26 = self->_downstreamNorthResistance;
    }
    float v27 = floorf(v26 + 0.5);
    float v28 = (float)(v26 - v27) * 1.8447e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabsf(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((has & 8) != 0)
  {
    float resistanceGGToVcut = self->_resistanceGGToVcut;
    float v31 = -resistanceGGToVcut;
    if (resistanceGGToVcut >= 0.0) {
      float v31 = self->_resistanceGGToVcut;
    }
    float v32 = floorf(v31 + 0.5);
    float v33 = (float)(v31 - v32) * 1.8447e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmodf(v32, 1.8447e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabsf(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  unint64_t v52 = v24;
  unint64_t v34 = v14;
  if ((has & 0x10) != 0)
  {
    float resistancePMUToVcut = self->_resistancePMUToVcut;
    float v38 = -resistancePMUToVcut;
    if (resistancePMUToVcut >= 0.0) {
      float v38 = self->_resistancePMUToVcut;
    }
    float v39 = floorf(v38 + 0.5);
    float v40 = (float)(v38 - v39) * 1.8447e19;
    unint64_t v36 = 2654435761u * (unint64_t)fmodf(v39, 1.8447e19);
    unint64_t v35 = v9;
    if (v40 >= 0.0)
    {
      if (v40 > 0.0) {
        v36 += (unint64_t)v40;
      }
    }
    else
    {
      v36 -= (unint64_t)fabsf(v40);
    }
  }
  else
  {
    unint64_t v35 = v9;
    unint64_t v36 = 0;
  }
  if ((has & 0x20) != 0)
  {
    float resistanceVcutToPmax = self->_resistanceVcutToPmax;
    float v43 = -resistanceVcutToPmax;
    if (resistanceVcutToPmax >= 0.0) {
      float v43 = self->_resistanceVcutToPmax;
    }
    float v44 = floorf(v43 + 0.5);
    float v45 = (float)(v43 - v44) * 1.8447e19;
    unint64_t v41 = 2654435761u * (unint64_t)fmodf(v44, 1.8447e19);
    if (v45 >= 0.0)
    {
      if (v45 > 0.0) {
        v41 += (unint64_t)v45;
      }
    }
    else
    {
      v41 -= (unint64_t)fabsf(v45);
    }
  }
  else
  {
    unint64_t v41 = 0;
  }
  if ((has & 4) != 0)
  {
    float resistanceCellTabToGG = self->_resistanceCellTabToGG;
    float v48 = -resistanceCellTabToGG;
    if (resistanceCellTabToGG >= 0.0) {
      float v48 = self->_resistanceCellTabToGG;
    }
    float v49 = floorf(v48 + 0.5);
    float v50 = (float)(v48 - v49) * 1.8447e19;
    unint64_t v46 = 2654435761u * (unint64_t)fmodf(v49, 1.8447e19);
    if (v50 >= 0.0)
    {
      if (v50 > 0.0) {
        v46 += (unint64_t)v50;
      }
    }
    else
    {
      v46 -= (unint64_t)fabsf(v50);
    }
  }
  else
  {
    unint64_t v46 = 0;
  }
  return v35 ^ v4 ^ v34 ^ v19 ^ v52 ^ v29 ^ v36 ^ v41 ^ v46;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x80) != 0)
  {
    self->_float traceResistance25C = *((float *)v4 + 9);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v5 = *((_WORD *)v4 + 22);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*((_WORD *)v4 + 22) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_float traceResistanceTemperatureCoeff = *((float *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_float systemEquivalentResistance = *((float *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_float downstreamCommonResistance = *((float *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_float downstreamNorthResistance = *((float *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_float resistanceGGToVcut = *((float *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_float resistancePMUToVcut = *((float *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  self->_float resistanceVcutToPmax = *((float *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 22) & 4) != 0)
  {
LABEL_10:
    self->_float resistanceCellTabToGG = *((float *)v4 + 4);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_11:
}

- (float)traceResistance25C
{
  return self->_traceResistance25C;
}

- (float)traceResistanceTemperatureCoeff
{
  return self->_traceResistanceTemperatureCoeff;
}

- (float)systemEquivalentResistance
{
  return self->_systemEquivalentResistance;
}

- (float)downstreamCommonResistance
{
  return self->_downstreamCommonResistance;
}

- (float)downstreamNorthResistance
{
  return self->_downstreamNorthResistance;
}

- (float)resistanceGGToVcut
{
  return self->_resistanceGGToVcut;
}

- (float)resistancePMUToVcut
{
  return self->_resistancePMUToVcut;
}

- (float)resistanceVcutToPmax
{
  return self->_resistanceVcutToPmax;
}

- (float)resistanceCellTabToGG
{
  return self->_resistanceCellTabToGG;
}

@end